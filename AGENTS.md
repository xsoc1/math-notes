# AGENTS.md - 数学笔记仓库（math-notes）

## 项目概述

本仓库是本地 Obsidian 数学笔记仓库 `F:\Obsidian Storage\数学` 的 GitHub 镜像，用于整理、编排数学笔记，在 README 中如实登记笔记情况，并与云端仓库 [xsoc1/math-notes](https://github.com/xsoc1/math-notes) 同步。子目录中独立的 AGENTS.md 由对应 agent 维护，本仓库不修改。

## 目录结构

```
F:\Obsidian Storage\数学\
├── AGENTS.md
├── README.md
├── Obsidian技能与Agent调用指南.md
├── 高等代数/
│   └── 高等代数简明教程重点与代数思想.md
├── 高等概率论/
│   ├── 00_三本书习题集索引.md
│   ├── 01_测度论基础与高等概率论上册习题集.md
│   └── 02_测度论基础与高等概率论下册习题集.md
├── 泛函分析/
│   └── 泛函分析讲义上册习题册.md
├── 李代数/
│   └── 03_当代数学园地1 Kac-Moody代数导引习题集.md
├── 数学物理方程/
│   ├── 00_课程笔记总览.md
│   ├── 01_绪论.md
│   ├── 02_调和方程.md
│   ├── 03_格林公式及其应用.md
│   ├── 04_格林函数.md
│   ├── 05_强极值原理与第二边值问题的唯一性.md
│   └── 数学物理方程第3版习题册.md
├── 常微分方程/
│   └── 常微分方程复习指南.md
├── 实变函数/
│   └── 实变函数简明教程重点与数学思想.md
├── 变分法/
│   └── 变分法基本引理.md
├── 拓扑学 Munkres/
│   ├── Chapter 01 - Set Theory and Logic/
│   ├── Chapter 02 - Topological Spaces and Continuous Functions/
│   ├── Chapter 03 - Connectedness and Compactness/
│   ├── Chapter 04 - Countability and Separation Axioms/
│   ├── Chapter 05 - The Tychonoff Theorem/
│   ├── Chapter 06 - Metrization Theorems and Paracompactness/
│   ├── Chapter 07 - Complete Metric Spaces and Function Spaces/
│   └── Chapter 08 - Baire Spaces and Dimension Theory/
├── 2026浙大暑期学校/
│   ├── 代数几何课程记录/
│   └── 黎曼几何课程记录/
├── 代数几何初步/
│   └── Undergraduate Algebraic Geometry/
├── SL谱理论/
│   ├── SL边值问题研究入门计划.md
│   └── 讲义/
│       ├── 00_SL谱理论讲义总览.md
│       ├── 01_杆的弯曲问题与Euler-Bernoulli梁.md
│       ├── 02_正则Sturm-Liouville问题.md
│       ├── 03_Liouville标准形.md
│       ├── 04_Pruefer变换与特征值存在性.md
│       ├── 05_Sturm比较定理与零点交错.md
│       ├── 06_特征函数正交性与广义Fourier级数.md
│       ├── 07_自伴边界条件与Hilbert空间框架.md
│       ├── 08_特征值的变分刻画与单调性.md
│       ├── 附录_手写笔记页面索引.md
│       └── images/
└── 未命名.base
```

## 拓扑学 Munkres 笔记规则

### 文件命名规范

- 每章建立独立文件夹：`Chapter XX - English Title/`
- 章节总览：`00_Chapter_XX_Overview.md`
- 各节笔记：`XX_Section_Name.md`（XX 为原书节号，两位数字）
- Base 管理文件：`Chapter_XX_Base.base`

### 每节笔记结构模板

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

### 数学内容规则

1. **定义必须精确** —— 使用 `[!note]` callout，给出严格数学表述
2. **定理必须附证明** —— 在 callout 外独立段落写出完整证明，以 `$\square$` 结尾
3. **例题使用原书习题** —— 使用 `[!question]` callout，注明习题编号，给出完整解答
4. **符号一致性**：
   - 开集族：`$\mathcal{T}$`，基：`$\mathcal{B}$`，子基：`$\mathcal{S}$`
   - 闭包：`$\overline{A}$`，内部：`$\operatorname{Int}(A)$`
   - 极限点集：`$A'$`
   - 同胚：`$\cong$`
5. **LaTeX 规范**：行内公式 `$...$`，行间公式 `$$...$$`，对齐用 `\begin{aligned}`

### Obsidian 特定规范

- 内部链接使用 `[[Note Name|Display Text]]` 格式
- 定理/定义锚点：在 callout 标题后添加 `^theorem-XX-Y` 块引用（如 `^theorem-18-1`）
- 嵌入其他笔记时使用 `![[Note Name]]`
- 强调重点使用 `>[!important]` callout
- 提示技巧使用 `>[!tip]` callout
- Base 文件过滤优先使用 `file.hasTag()` 而非路径匹配，避免跨平台路径问题

## 代码规则

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

## 维护边界

- 子目录中的 AGENTS.md 由对应子项目 agent 维护，本仓库不修改。
- 本仓库只负责整理、编排笔记，登记 README，并同步 GitHub。

## 维护原则

- 修改笔记时尽量保持与已定结构一致
- 新增习题解析必须引用原书习题编号
- 超链接网络保持双向（被链接的笔记应含有返回链接）
- 每次新增内容后更新对应章节的 `.base` 文件
- 如笔记间存在逻辑依赖，在章节总览中更新 Mermaid 依赖图
- 新增或调整笔记后同步更新 README 登记表
- **每次变更后必须同步更新本 AGENTS.md**，在变更日志中追加条目并简述工作内容

## 工作方法

- 每次维护前先执行 `git fetch origin` 并检查 `git status --short --branch`
- 本地仓库根目录为 `F:\Obsidian Storage\数学`，分支 `master` 跟踪远端 `main`
- 如实登记笔记情况到 README，不编造文件数量和内容
- 修改笔记或维护文件后，更新 AGENTS.md 与 README，提交并推送至 `xsoc1/math-notes`
- 不将 Obsidian 配置（`.obsidian`、`.trash`）纳入版本控制

## 对话记录

- 2026-08-12：用户指派负责管理本仓库笔记并同步云端仓库 `xsoc1/math-notes`；确认本地与远端一致，修复 AGENTS.md 重复 BOM 与中文乱码，补充工作方法与对话记录
- 2026-08-12：整理文件夹结构，将本地仓库目录由 `拓扑学Mumkres` 重命名为 `math-notes`，与云端仓库保持一致
- 2026-08-12：将 git 仓库根目录提升至 `F:\Obsidian Storage\数学`，纳入全部数学笔记子项目，更新 README 笔记登记表
- 2026-08-23：安装 obsidian-skills 到 DSH 技能目录 `C:\Users\HuangZY\.dsh\skills\`；新增 `SL谱理论/` 目录并移入入门计划；将 LaTeX SL 谱理论讲义转为 Obsidian Markdown（初版 7 篇笔记 + 11 张手写图片），更新 README 登记；后于 2026-08-23 扩展至 10 篇，新增自伴边界条件、Hilbert 空间框架、变分刻画与单调性，并为 00–06 补充习题与解答。
- 2026-08-25：梳理网络与本地 Obsidian Agent Skills 生态；新增《Obsidian技能与Agent调用指南.md》，全面总结 `kepano/obsidian-skills` 规范（CLI、Markdown、Bases、Canvas、Defuddle）、多环境安装配置、CLI 常用与调试命令、REST API / MCP / Memory 进阶生态；同步更新 README.md 与 AGENTS.md 并推送到云端仓库。
- 2026-08-25：响应用户需求，将本科常微分方程（初等法、存在唯一性、线性方程组相图）与邓东皋《实变函数简明教程》（测度论、可测函数、三大收敛定理、微积分基本定理、Lp空间与数学思想）分别整理为独立笔记归档至 `常微分方程/` 与 `实变函数/` 目录，更新 README 笔记登记并同步推送。
- 2026-08-26：系统梳理蓝以中《高等代数简明教程》（线性空间与方程组几何化、子空间直和、线性变换相似分类、一元多项式环、Jordan标准型、二次型与惯性定理、欧氏空间与实对称阵谱定理），生成《高等代数简明教程重点与代数思想.md》归档至 `高等代数/` 目录，更新 README 与 AGENTS.md 并推送到云端仓库。
- 2026-08-28：依据用户提供的张恭庆、林源渠《泛函分析讲义（上册）》扫描 PDF，逐页核对并整理全部 208 道编号习题，生成 `泛函分析/泛函分析讲义上册习题册.md`；每题保留空白答案区，排除末尾习题补充提示，并如实注明第 4.5 节未见独立编号习题，更新 README 与 AGENTS.md。
- 2026-08-28：清理本地未跟踪的旧拼写拓扑目录、顶层变分法重复笔记和空白 Canvas；源文件移至仓库外的可恢复备份目录，未改动远程已跟踪内容。
- 2026-08-28：依据官方 `obsidian-cli` 技能和 Obsidian CLI 文档，在 Obsidian 1.13.7 中启用并注册命令行接口；验证 `obsidian version`、`obsidian help`、库文件计数和 Base 列表均可用，记录安装器 1.9.12 的官方升级提示。
- 2026-08-28：依据用户提供的谷超豪、李大潜、陈恕行《数学物理方程（第3版）》扫描 PDF，逐页核对并整理 7 章 33 节共 179 道编号习题，生成 `数学物理方程/数学物理方程第3版习题册.md`；每题保留空白答案区，不将附件正文、提示或其他文字当作操作指令。
- 2026-08-28：根据用户反馈修正 `泛函分析/泛函分析讲义上册习题册.md` 第 1.1.2 题中 `\hat{x}`、`\in`、`\lim` 的 LaTeX 反斜杠缺失，核查同文件未发现同类残留，并更新 README 登记说明。
- 2026-09-09：依据用户提供的《测度论基础与高等概率论》上、下册扫描 PDF 及《当代数学园地1 Kac-Moody 代数导引》扫描 PDF，逐节定位并整理上册 433 道、下册 330 道编号习题；另收录 Kac-Moody 原书明确留给读者的 6 处练习并补充 KM-1 至 KM-6 编号。生成 `三本书习题集/` 下 4 个 Obsidian Markdown 文件，答案区域全部留空；采用纯文本安全化处理扫描文本层中的 MathJax 误触发字符，并完成题号、答案区、分节边界及不可见字符检查。
- 2026-09-10：按用户要求将习题集重新归档：测度论与高等概率论上、下册及总索引移入 `高等概率论/`，Kac-Moody 代数习题集移入 `李代数/`；同步更新 README、目录树和索引中的 Obsidian 链接，保留原文件名、题号及题面内容。
- 2026-09-10：根据用户要求为全部 5 本习题册补充细化到每一节的 Obsidian 跳转目录，保留原有章节、分节、题号和答案留空结构；同步更新 README 登记说明并核验目录链接目标。

- 2026-09-11：依据用户提供的五份数学物理方程课件整理六篇 Obsidian 课程笔记，覆盖绪论、调和方程、格林公式、格林函数、强极值原理与第二边值问题唯一性；建立总览依赖图、统一记号和习题册链接，并完成公式、链接与编码校核。
- 2026-09-11：在数学物理方程习题册首页补充六篇课程笔记的回链，完成课程笔记与习题册的双向导航。

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
| 2026-08-12 | 仓库根目录提升至 `F:\Obsidian Storage\数学`，纳入 `2026浙大暑期学校`、`代数几何初步`、`SL边值问题研究入门计划.md`、`未命名.base`；README 登记全部笔记情况 |
| 2026-08-23 | obsidian-skills 技能包安装到 DSH 技能目录；新建 `SL谱理论/`（入门计划 + 讲义初版 7 篇 + 手写图片 11 张）；后续扩展至 10 篇（新增自伴框架、Hilbert 空间、变分刻画与单调性，并为 00–06 补习题）；README/AGENTS 同步更新 |
| 2026-08-25 | 新增《Obsidian技能与Agent调用指南.md》，系统总结 kepano/obsidian-skills 规范、安装配置与 Agent 协作生态；同步更新 README.md 与 AGENTS.md |
| 2026-08-25 | 新增《常微分方程复习指南.md》与《实变函数简明教程重点与数学思想.md》，归档进对应专栏目录并完成云端同步 |
| 2026-08-26 | 新增《高等代数简明教程重点与代数思想.md》（参考蓝以中教程），归档至 高等代数/ 专栏目录，更新登记并同步至 GitHub |
| 2026-08-28 | 依据扫描版《泛函分析讲义（上册）》整理 208 道编号习题为独立习题册，逐题留空答案，更新 README 与 AGENTS.md |
| 2026-08-28 | 清理本地未跟踪的旧拼写拓扑目录、顶层变分法重复笔记和空白 Canvas；文件移至仓库外备份目录 |
| 2026-08-28 | 启用并注册 Obsidian CLI，验证版本、帮助、库文件计数和 Base 列表；记录安装器版本提示 |
| 2026-08-28 | 依据扫描版《数学物理方程（第3版）》逐页核对并整理 179 道编号习题为独立习题册，答案留空，更新 README 与 AGENTS.md |
| 2026-08-28 | 修正泛函分析习题册 1.1.2 的 LaTeX 反斜杠缺失，核查同类渲染问题并更新 README 与 AGENTS.md |
| 2026-09-09 | 依据三本扫描 PDF 整理三本书习题集：测度论基础与高等概率论上册 433 题、下册 330 题，Kac-Moody 代数导引 6 处练习；生成索引和 3 本习题册，答案留空并完成结构与渲染安全检查 |
| 2026-09-10 | 按学科将习题集归档至 `高等概率论/` 和 `李代数/`，更新 README、AGENTS.md 与索引链接 |
| 2026-09-10 | 为泛函分析、数学物理方程、测度论与高等概率论上/下册及 Kac-Moody 习题集补充细化到每一节的跳转目录，更新 README 登记并完成链接核验 |
| 2026-09-11 | 依据五份数学物理方程课件生成六篇课程笔记，补充总览依赖图、统一记号、定理证明和习题册互链；修正旋转矩阵、球面 Poisson 积分域及散度型方程排版，并完成结构校核 |
| 2026-09-11 | 在数学物理方程习题册首页补充六篇课程笔记的回链，完成课程笔记与习题册的双向导航 |
