## AGENTS.md

此目录为 Obsidian 数学仓库 "代数几何初步" 下 Miles Reid 著 *Undergraduate Algebraic Geometry* 的子目录。

### 文件清单
- `Undergraduate Algebraic Geometry.md` — 主文档，已格式化为 Obsidian 兼容格式
- `*.jpg` — 文中引用的 41 张图片，与 md 文件同级存放

### 格式化规则
1. YAML frontmatter 记录元数据，版本历史使用 `[!abstract]` callout
2. 目录使用 Obsidian wikilinks `[[#heading]]` 索引各章节
3. 标题层级：`##` Part → `###` Chapter → `####` Section → `#####` Subsection
4. 图片使用 `![[文件名.jpg]]` 嵌入，与 md 同级
5. 关键术语加粗：**Proof.** **Theorem** **Proposition** **Definition** **Corollary** **Lemma** **Q.E.D.**
6. 罗马数字枚举 (i)(ii)(iii) → 有序列表 1. 2. 3.，字母枚举 (a)(b)(c) → 无序列表
7. 图片与 Figure 标题紧凑排列，无多余空行
8. 连续空行折叠为最多 1 行
9. 原文正文、LaTeX 公式、Old Table of Contents、Old Index 保持原样不修改

### 最近变更
- 2026-07-13: 初始格式化 — 添加 YAML frontmatter，重建目录为 wikilinks，统一标题层级
- 2026-07-13: 修复图片显示 — 将图片移至 md 同级，链接改为 `![[文件名]]` 格式
- 2026-07-13: 建立子文件夹 — 将 md、图片、AGENTS.md 移入 `Undergraduate Algebraic Geometry/`
- 2026-07-13: 阅读格式化 — 折叠多余空行、图片与标题紧凑排列、关键术语加粗、罗马/字母枚举转为 Markdown 列表