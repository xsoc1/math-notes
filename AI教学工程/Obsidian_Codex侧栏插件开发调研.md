---
title: Obsidian Codex 侧栏插件开发调研
date: 2026-10-11
tags:
  - AI教学
  - Obsidian
  - plugin-development
  - Codex
aliases:
  - Obsidian Codex 插件调研
  - Obsidian 数学阅读助手
status: 0.1.0 已实现并完成本机基础验收
---

# Obsidian Codex 侧栏插件开发调研

> [!abstract] 调研概述
> 本文档梳理在 Obsidian 桌面端右侧边栏集成 Codex 数学阅读与讲义编写助手的技术方案，对比开源社区既有插件架构（如 `YishenTu/Claudian` 与 `obsidian-copilot`），明确编辑器选区、阅读视图（Reading View）选区、当前可见章节及多模态图像上下文的采集机制，并给出基于本机 Codex App Server 与标准 LaTeX 公式渲染的实现路径。

## 1. 核心需求与功能定位

面向高等数学讲义阅读与推导场景，侧栏插件需具备以下四项核心能力：
1. **原生侧栏集成**：继承 Obsidian `ItemView` 挂载于右侧工作区叶子节点（`WorkspaceLeaf`），通过左侧功能区图标（Ribbon Icon）或命令面板一键展开/收起。
2. **多视图选区与上下文感知**：
   - **源码/实时预览模式（Live Preview / CodeMirror 6）**：通过 `editor.getSelection()` 获取选中文本及行号范围；
   - **阅读模式（Reading View）**：通过 `window.getSelection()` 提取渲染后 DOM 选区，并映射回底层 Markdown 源文件对应的标题章节与源码块；
   - **图像与手写笔记上下文**：支持捕获当前笔记内嵌的 `![[image.jpg]]` 资源路径或剪贴板截图，传递至多模态模型解析。
3. **本机 CLI / App Server 免密钥复用**：直接调用本机已登录的 Codex CLI / App Server 会话，避免在插件配置中重复维护明文 API Key。
4. **数学公式保真渲染**：侧栏对话流采用 Obsidian 原生 `MarkdownRenderer.render` 渲染回复，确保 `$...$` 与 `$$...$$` 公式与主笔记区 MathJax 样式完全一致。

## 2. 系统架构设计

插件整体由三层模块构成：**Obsidian View 视图交互层**、**Context Collector 上下文采集层**与 **Codex App Server 通信桥接层**。

```text
+-------------------------------------------------------------------+
|                        Obsidian Desktop UI                        |
|  +---------------------------+     +---------------------------+  |
|  | MarkdownView              |     | CodexSidebarView          |  |
|  | (Live Preview / Reading)  |     | (ItemView + MathJax DOM)  |  |
|  +-------------+-------------+     +-------------+-------------+  |
+----------------|---------------------------------|----------------+
                 |                                 |
                 v                                 v
      +----------------------+          +------------------------+
      | Context Collector    |--------->| Codex Bridge           |
      | (Selection / Section |          | (Local App Server /    |
      |  / Image Resolver)   |          |  JSON-RPC stdio/HTTP)  |
      +----------------------+          +------------------------+
```

## 3. Obsidian 插件 API 关键实现

### 3.1 侧栏视图注册与挂载

通过继承 `ItemView` 定义右侧边栏面板，并在插件主类 `onload` 生命周期中注册视图工厂：

```typescript
import { ItemView, Plugin, WorkspaceLeaf, MarkdownView, MarkdownRenderer } from 'obsidian';

export const VIEW_TYPE_CODEX_SIDEBAR = 'codex-sidebar-view';

export class CodexSidebarView extends ItemView {
    constructor(leaf: WorkspaceLeaf) {
        super(leaf);
    }

    getViewType(): string {
        return VIEW_TYPE_CODEX_SIDEBAR;
    }

    getDisplayText(): string {
        return 'Codex 数学助手';
    }

    getIcon(): string {
        return 'bot';
    }

    async onOpen(): Promise<void> {
        const container = this.containerEl.children[1] as HTMLElement;
        container.empty();
        container.createEl('h4', { text: 'Codex 数学讲义助手' });
    }

    async onClose(): Promise<void> {
        // 释放监听与子进程连接资源
    }
}
```

### 3.2 跨模式选区与章节上下文提取

针对数学笔记常在**阅读视图（Reading View）**下浏览公式的特点，单靠 `editor.getSelection()` 无法捕获阅读模式下的高亮文字。上下文采集器需同时监听两种模式，并利用 `app.metadataCache.getFileCache(file)` 定位当前所属的小节标题与源码行区间：

```typescript
export function captureActiveContext(app: App) {
    const view = app.workspace.getActiveViewOfType(MarkdownView);
    if (!view || !view.file) return null;

    const mode = view.getMode(); // 'source' | 'preview'
    let selectedText = '';

    if (mode === 'source') {
        selectedText = view.editor.getSelection();
    } else {
        const domSelection = window.getSelection();
        selectedText = domSelection ? domSelection.toString().trim() : '';
    }

    const cache = app.metadataCache.getFileCache(view.file);
    return {
        filePath: view.file.path,
        mode,
        selectedText,
        headings: cache?.headings ?? []
    };
}
```

## 4. 界面容器与后端通信方案对比

| 架构维度 | 方案 A：原生 `ItemView` + `MarkdownRenderer` | 方案 B：`iframe` / Webview 外部页面嵌入 |
| :--- | :--- | :--- |
| **公式与双链渲染** | 直接复用 Obsidian 内置 MathJax 与 `[[Wikilink]]` 点击跳转 | 需独立加载 KaTeX/MathJax，无法直接响应库内双链跳转 |
| **选区上下文同步** | 零延迟直接访问 `app.workspace` 与 `metadataCache` | 需通过 `postMessage` 跨窗口序列化通信 |
| **主题样式一致性** | 自动继承当前 Vault 的亮/暗色 CSS 变量与字号 | 样式隔离，需手动同步主题变量 |
| **适用场景** | **深度绑定笔记阅读与定理推导的侧栏助手（推荐）** | 嵌入已有独立 Web 前端的第三方完整应用 |

## 5. 数学公式保真与系统提示词规范

为防止模型输出非标准公式分隔符（如 `\( ... \)` 或 `\[ ... \]`）导致 Obsidian 渲染失败，通信层在构造系统提示词（System Prompt）时需固定以下输出规范：
1. 行内数学公式一律使用单美元符号 `$...$`；
2. 独立行间数学公式一律使用双美元符号 `$$...$$`，多行推导使用 `\begin{aligned} ... \end{aligned}`；
3. 引用库内其他章节定理时，保留标准 Obsidian 双链格式 `[[笔记名#标题|显示文本]]`。

## 6. 关联文档

- 仓库级 Agent 工具链说明：[[Obsidian技能与Agent调用指南|Obsidian 技能与 Agent 调用指南]]
- 交互式课程生成架构调研：[[AI教学工程/OpenMAIC课程与教材规划调研|OpenMAIC 课程与教材规划调研]]
