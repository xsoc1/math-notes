# AGENTS.md - 拓扑学 Munkres 学习笔记项目

## 项目概述

本项目是基于 **James R. Munkres《Topology》(2nd Edition)** 的 Obsidian 学习笔记，使用严谨的数学语言记录定义、定理、证明和例题解析。

## 目录结构

```
F:\Obsidian Storage\数学\math-notes\
├── AGENTS.md                           ← 本文件
├── README.md
├── 变分法/
│   └── 变分法基本引理.md
├── 拓扑学 Munkres/
│   ├── Chapter 01 - Set Theory and Logic/
│   │   ├── 00_Chapter_01_Overview.md
│   │   └── ...
│   ├── Chapter 02 - Topological Spaces and Continuous Functions/
│   │   ├── 00_Chapter_02_Overview.md
│   │   ├── 12_Topological_Spaces.md
│   │   ├── 13_Basis_for_a_Topology.md
│   │   ├── ...
│   │   ├── 22_The_Quotient_Topology.md
│   │   └── Chapter_02_Base.base
│   ├── Chapter 03 - Connectedness and Compactness/
│   │   └── ...
│   └── ...
└── ...
```

## 文件命名规范

- 每章建立独立文件夹：`Chapter XX - English Title/`
- 章节总览：`00_Chapter_XX_Overview.md`
- 各节笔记：`XX_Section_Name.md`（XX 为原书节号，两位数字）
- Base 管理文件：`Chapter_XX_Base.base`

## 每节笔记结构模板

```markdown
---
title: "§XX 标题"
date: YYYY-MM-DD
tags:
  - topology/munkres/chapterX
  - topology/topic-name
aliases:
  - "English Title"
  - "XX_English_Name"
---

# §XX Title

> [!abstract] 核心问题

## XX.1 定义（callout `[!note]`）
## XX.2 定理（callout `[!note]`，附证明）
## XX.3 例子（callout `[!example]`）
## XX.4 习题解析（callout `[!question]`，引用原书习题编号）

## 相关链接（Wikilink）
```

## 数学内容规则

1. **定义必须精确** —— 使用 `[!note]` callout，给出严格数学表述
2. **定理必须附证明** —— 在 callout 外独立段落写出完整证明，以 `$\square$` 结尾
3. **例题使用原书习题** —— 使用 `[!question]` callout，注明习题编号，给出完整解答
4. **符号一致性**：
   - 开集族：`$\mathcal{T}$`，基：`$\mathcal{B}$`，子基：`$\mathcal{S}$`
   - 闭包：`$\overline{A}$`，内部：`$\operatorname{Int}(A)$`
   - 极限点集：`$A'$`
   - 同胚：`$\cong$`
5. **LaTeX 规范**：行内公式 `$...$`，行间公式 `$$...$$`，对齐用 `\begin{aligned}`

## Obsidian 特定规范

- 内部链接使用 `[[Note Name|Display Text]]` 格式
- 定理/定义锚点：在 callout 标题后添加 `^theorem-XX-Y` 块引用（如 `^theorem-18-1`）
- 嵌入其他笔记时使用 `![[Note Name]]`
- 强调重点使用 `>[!important]` callout
- 提示技巧使用 `>[!tip]` callout
- Base 文件过滤优先使用 `file.hasTag()` 而非路径匹配，避免跨平台路径问题

## 代码规则（适用于项目中任何代码片段）

1. 所有大括号单独占一行
2. `while`/`for`/`if`/`switch` 与 `(` 之间不得有空格
3. 多词组函数名用 snake_case：`insert_sort()`
4. 多词组变量名用 PascalCase：`NewData`
5. `main()` 最后三行：`cout << endl;` → `system("pause");` → `return 0;`
6. 注释必须简洁，仅保留必要解释
7. 只允许使用英文标点符号
8. 所有代码块使用 **tab 缩进**（不是空格）

## 文件编码

- 所有 `.md` 文件使用 **UTF-8** 编码
- 所有 `.base` 文件使用 **UTF-8** 编码（YAML 格式）

## 维护原则

- 修改笔记时尽量保持与已定结构一致
- 新增习题解析必须引用原书习题编号
- 超链接网络保持双向（被链接的笔记应含有返回链接）
- 每次新增内容后更新对应章节的 `.base` 文件
- 如笔记间存在逻辑依赖，在章节总览中更新 Mermaid 依赖图
- **每次变更后必须同步更新本 AGENTS.md**，在变更日志中追加条目并简述工作内容

## 工作方法

- 每次维护前先执行 `git fetch origin` 并检查 `git status --short --branch`
- 本地分支 `master` 跟踪远端 `main`，以 `origin/main` 为同步基准
- 修改笔记或维护文件后，更新本文件变更日志，提交并推送至 `xsoc1/math-notes`
- 不将 Obsidian 配置（`.obsidian`、`.trash`）纳入版本控制

## 对话记录

- 2026-08-12：用户指派负责管理本仓库笔记并同步云端仓库 `xsoc1/math-notes`；确认本地与远端一致，修复 AGENTS.md 重复 BOM 与中文乱码，补充工作方法与对话记录
- 2026-08-12：整理文件夹结构，将本地仓库目录由 `拓扑学Mumkres` 重命名为 `math-notes`，与云端仓库保持一致

## 变更日志

| 日期 | 变更内容 |
|------|----------|
| 2026-07-08 | 初始化项目，创建 AGENTS.md |
| 2026-07-08 | 生成 Chapter 2 全部 11 节笔记（§12–§22），含定义/定理/证明/习题解析 |
| 2026-07-08 | 创建 Chapter 2 的 Obsidian Base 管理文件，修正过滤语法（tag 替代路径匹配） |
| 2026-07-08 | 新增变更日志和维护自更新规则 |
| 2026-07-08 | 新增 Chapter 1 简明笔记（§1–§11），覆盖集合论、函数、关系、基数、选择公理、Zorn 引理 |
| 2026-07-08 | 生成 Chapter 3 全部 7 节笔记（§23–§29），含连通性/紧致性定义定理证明，融入大量课后习题解析（每节 5–8 题），含 Heine-Borel、介值定理、极值定理、管引理、单点紧化等 |
| 2026-07-23 | 为 §12 Lemma 12.2 补全证明 |
| 2026-07-26 | 补全所有缺证明的引理/定理：Lemma 16.2, Lemma 16.3, Theorem 17.4, Theorem 21.4, Theorem 25.4 |
| 2026-07-28 | 生成 Chapter 4 全部 7 节笔记（§30–§36）：可数性公理、分离性公理、正规空间、Urysohn 引理、Urysohn 度量化定理、Tietze 扩张定理、流形嵌入 |
| 2026-07-28 | 生成 Chapter 5（§37 Tychonoff 定理）含 Alexander 子基定理证明 |
| 2026-07-28 | 生成 Chapter 6（§38–§40）：度量化定理续、仿紧性、单位分解，含 Nagata-Smirnov/Bing 定理、Stone 定理 |
| 2026-07-28 | 生成 Chapter 7（§43–§46）：完备度量空间、度量空间紧性刻画（全有界+完备）、函数空间（紧开拓扑）、Ascoli 定理 |
| 2026-07-28 | 生成 Chapter 8（§48, §50）：Baire 空间与纲定理、覆盖维数论 |
| 2026-07-28 | 参考香蕉空间讲义增强核心章节的直觉理解：补充拓扑公理动机（§12）、基的直观（§13）、序拓扑本质（§14）、子空间拓扑相对化思想（§16）、开闭对偶性（§17）、连续性三种刻画直觉（§18）、商拓扑粘合艺术（§22）、连通性两种思考方式（§23）、紧性三个等价角度（§26）、可数性条件统一（§30）、分离性公理层级（§31）、Urysohn引理分层构造直觉（§33）、度量化嵌入策略（§34）、Tychonoff定理惊奇性与AC等价（§37）、Baire纲定理可数→存在模式（§48） |
| 2026-08-10 | 将本目录全部笔记同步至 GitHub 仓库 xsoc1/math-notes（main 分支）：初始化 git、合并远端已有内容、提交 46 个笔记文件并推送，commit aac9d24 |
| 2026-08-10 | 整理仓库：重写 README.md（结构导航+章节一览）、添加 .gitattributes（行尾规范化）与 .gitignore（忽略 .obsidian/.trash）、将变分法基本引理.md 移入 变分法/ 文件夹、修复 AGENTS.md 目录树乱码 |
| 2026-08-10 | 将全部 Chapter 01–08 移入 拓扑学 Munkres/ 文件夹，更新 README 与 AGENTS.md 目录结构（Chapter 间 wikilink 经核查保持有效） |
| 2026-08-12 | 接手维护并完成首次同步：`git fetch` 确认本地 `master` 与远端 `main` 一致（HEAD `c3703c7`）；修复 AGENTS.md 重复 BOM 与中文乱码，新增工作方法/对话记录 |
| 2026-08-12 | 整理文件夹结构：本地仓库目录重命名为 `math-notes`，与云端仓库结构一致；更新 AGENTS.md 目录路径并追加维护记录 |
