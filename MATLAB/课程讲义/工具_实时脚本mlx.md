---
title: "MATLAB 实时脚本（`.mlx`）入门"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/工具_实时脚本mlx.md"
matlab_source_sha256: 691d0342bc170a6bb91a939d7af0ad54b12b035bf2b3a6b99bd62ad67d259fe0
---


# MATLAB 实时脚本（`.mlx`）入门

来源：课程配套实时脚本资料包。本指南介绍 MATLAB 实时脚本（Live Script, `.mlx`）的文档结构、分节执行机制、交互式控件以及数学公式与代码混排方法。

## 1. 典型实时脚本算例解析

- **`W5test_livescript_1.mlx`**（对应 [[MATLAB/课程资料/实时脚本/W5test_livescript_1.pdf|PDF 预览]]）：演示符号变量声明 `syms x`、函数绘图 `fplot(sin(x))`、图层叠加 `hold on`、`fplot(cos(x))` 与图例标注，展示格式化富文本、LaTeX 公式、代码块与内联图像的混合排版方式。
- **`exm060501.mlx`**（对应 [[MATLAB/课程资料/实时脚本/exm060501.pdf|PDF 预览]]）：演示周期方波信号的 Fourier 级数展开、符号积分求解谐波系数、部分和逼近曲线（Gibbs 现象）以及三维曲面渲染。

**数学公式勘误说明**：`exm060501` 原稿第 1 页将周期为 $T$ 的偶函数余弦展开系数写作 $A_n = \int_0^T y(t)\cos(2\pi n t / T)\,\mathrm{d}t$，遗漏了正交基归一化常数。由于 $\int_0^T \cos^2(2\pi n t/T)\,\mathrm{d}t = \frac{T}{2} \, (n \ge 1)$，标准三角 Fourier 级数 $y(t) \sim \frac{A_0}{2} + \sum_{n=1}^\infty \bigl(A_n\cos\frac{2\pi nt}{T} + B_n\sin\frac{2\pi nt}{T}\bigr)$ 的余弦系数必须包含缩放因子 $\frac{2}{T}$：

$$
A_n = \frac{2}{T} \int_0^T y(t)\cos\!\left(\frac{2\pi n t}{T}\right)\mathrm{d}t \quad \left(\text{对偶函数在半周期上积分则为 } \frac{4}{T}\int_0^{T/2} y(t)\cos\!\left(\frac{2\pi n t}{T}\right)\mathrm{d}t\right).
$$

## 2. 实时脚本的核心特性与操作流程

相较于纯文本 `.m` 脚本，实时脚本（`.mlx`）采用基于 Open Packaging Conventions (OPC) 的 ZIP 压缩富文档格式，具有以下核心优势：
1. **文学化编程（Literate Programming）**：支持将多级章节标题、段落正文、项目列表、超链接、标准 LaTeX 数学公式（行内 `$...$` 与行间 `$$...$$`）与可执行 MATLAB 代码集成在同一工作文档中；
2. **内联结果对照與符号公式渲染**：每个代码段（Section）的数值输出、符号推导公式（`sym` 对象自动渲染为标准数学分式与根式排版）与图形直接展示在代码右侧（Output on Right）或代码下方（Output Inline），便于对照检验；
3. **交互式控件与实时任务（Live Controls & Tasks）**：支持插入数值滑块（Slider）、下拉菜单（Drop-down）与复选框，当拖动滑块改变参数时自动重新运行当前分节并刷新图形；
4. **多格式导出与版本控制**：完成后可通过 **Save -> Export** 一键导出为 PDF、HTML、Word（`.docx`）或 LaTeX（`.tex`）文档，也可另存为纯文本 `.m` 脚本以便纳入 Git 文本差异比对。

## 3. 代码分节（Section）与执行控制

在 `.m` 脚本或 `.mlx` 实时脚本中，以双百分号 `%%`（后接空格与标题）开头的行用于划分独立的代码节（在实时编辑器中也可直接使用快捷键 `Ctrl + Alt + Enter` 插入分节符），单百分号 `%` 用于编写行内注释：

```matlab
%% Prepare values
Values = 1:4;        % 生成行向量 [1, 2, 3, 4]
Squares = Values.^2; % 逐元素求平方 [1, 4, 9, 16]

%% Inspect results
Totals = [sum(Values), sum(Squares)] % 输出两项总和 [10, 30]
```

- **分节独立执行**：使用 **Run Section**（快捷键 `Ctrl + Enter`）可仅运行光标所在的代码节，适合在耗时数值计算、符号推导或绘图调参中做局部快速迭代；使用 **Run and Advance**（`Ctrl + Shift + Enter`）则运行当前节并自动跳至下一节。
- **输出抑制规范**：行末不加分号 `;` 的语句会在实时编辑器输出区展示格式化结果；对于含成千上万个元素的大规模采样网格或中间矩阵，务必在行末添加分号 `;`，避免大量文本渲染造成界面卡顿。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
