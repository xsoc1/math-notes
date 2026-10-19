---
title: "MATLAB 实时脚本（`.mlx`）入门"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/工具_实时脚本mlx.md"
matlab_source_sha256: 4ad875d1ad0a3b7ab41b57acc3e3555cbf3f3a67693fbdeebf2a7688e317ff59
---

# MATLAB 实时脚本（`.mlx`）入门

来源：[week2实时脚本资料更新版.zip](file:///F:/Obsidian%20Storage/%E6%95%B0%E5%AD%A6/MATLAB/%E8%AF%BE%E7%A8%8B%E8%B5%84%E6%96%99/%E5%8E%9F%E5%A7%8B%E8%AF%BE%E4%BB%B6/week2%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC%E8%B5%84%E6%96%99%E6%9B%B4%E6%96%B0%E7%89%88.zip)。归档后安全核查压缩包只有两份 `.mlx` 及各自 PDF 预览，见 [实时脚本目录](file:///F:/MATLAB%20course/%E8%AF%BE%E7%A8%8B%E8%B5%84%E6%96%99/%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC)。原样保留文件；没有执行压缩包内代码。

## 两个范例

- [W5test_livescript_1.mlx](file:///F:/Obsidian%20Storage/%E6%95%B0%E5%AD%A6/MATLAB/%E8%AF%BE%E7%A8%8B%E8%B5%84%E6%96%99/%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC/W5test_livescript_1.mlx) 与 [[MATLAB/课程资料/实时脚本/W5test_livescript_1.pdf|PDF 预览]]：先 `syms x`、`fplot(sin(x))`，后续代码段加 `hold on`、`fplot(cos(x))` 和图例；文稿还嵌入文字、公式和图片。适合先学习实时脚本的代码段、讲解文字与结果同页的组织方式。
- [exm060501.mlx](file:///F:/Obsidian%20Storage/%E6%95%B0%E5%AD%A6/MATLAB/%E8%AF%BE%E7%A8%8B%E8%B5%84%E6%96%99/%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC/exm060501.mlx) 与 [[MATLAB/课程资料/实时脚本/exm060501.pdf|PDF 预览]]：周期方波的傅里叶级数、符号积分、谐波系数、三维绘图和图形修饰。其数学前置知识晚于实时脚本基本操作，可在第三课的傅里叶部分之后再细读。

**数学核验：** `exm060501` 第 1 页将一般周期 $T$ 的余弦系数写成 $A_n=\int_0^T y(t)\cos(2\pi nt/T)\,dt$。对通常的偶函数展开约定，系数应有 $2/T$ 因子；该例取 $T=2$，所以数值代码恰好相同，不能直接推广到其他周期。页中周期平移的下标只写正整数；若要定义整个实轴上的周期延拓，应取整数平移。

## 操作顺序与边界

在 MATLAB 中打开 `.mlx`，先阅读文字和代码段，核对当前文件夹，再按段运行；记录每段输出与图形，最后保存。PDF 预览适合只读核对，不能代替亲自运行。此处的 `W5test` 文件名不构成正式第五周课次证据；压缩包名 `week2` 也不说明傅里叶例子应在第二周学完。

**讲解补充：** 相较普通 `.m` 脚本，实时脚本可将叙述、公式、图片、代码和输出放在同一文档中，适合实验过程记录；最终实验报告仍按本课程要求用 TeX 制作。打开来源不明的 `.mlx` 前先看代码。当前只核对了包结构、可读正文与 PDF 预览，尚未在 MATLAB GUI 中打开或执行这两份 `.mlx`。

你的第一步实践：打开 `W5test_livescript_1.mlx`，说出每个代码段在图形中起什么作用；再自己添加一个新段落和一句结果解释。傅里叶范例留到对应知识单元。

## 2026-10-07 快速引导：把本人数列实验组织成实时脚本

**讲解补充。** 本人数列计算已通过，这次不新增数学题。实时脚本将计算过程、正文与运行输出组织在一个文档中；代码仍按 MATLAB 规则执行。正文用 Live Editor 的 Text 插入，适合目的、公式和结论；代码中的 `%` 是简短注释。R2026a 支持 `.mlx` 实时脚本，并可用另存为转换现有普通脚本，不是直接更改文件扩展名。操作依据 [R2026a 实时脚本官方文档](https://www.mathworks.com/help/releases/R2026a/matlab/matlab_prog/create-live-scripts.html)。

分段用于局部执行和清晰组织：在 `n=1:300` 前输入 `%% 数列计算`，在 `figure` 前输入 `%% 误差图`；保留已有计算与图形语句。`%%` 开始一个新段，只有一个 `%` 则是注释。各段共享脚本工作区，不会因为段落划分自动成为独立函数；绘图段需要计算段产生的 `n` 与三个误差数组。如果先运行绘图而变量不存在，便会报错；如果变量来自旧运行，则可能画出过时结果。先计算再绘图，结束前运行整个文件再保存。参见 [R2026a 分段运行文档](https://www.mathworks.com/help/releases/R2026a/matlab/matlab_prog/create-and-run-sections.html)。

**一个动手任务。** 在 MATLAB 编辑器打开已完成的本人脚本，选 Save → Save As，文件类型选 `MATLAB Live Code File (*.mlx)`，保存为 `F:\Documents\MATLAB\lab02_sequences.mlx`。在代码前添加正文标题和一句实验目的，把代码分为上述两段，再在图后用本人语言写一句曲线结论。给三个 `err_` 赋值行加分号，以免每行 300 个数字挤占输出；保留最后的三个项值输出。按顺序用 Run Section 运行，最终整份运行、保存，再提供可见正文、分段代码与结果的截图和保存路径。

这里只提供组织方法，不替本人制作 `.mlx`，本单元尚未通过。归档的 `W5test_livescript_1.mlx` 可只读参考正文/代码/结果布局；傅里叶范例仍留到第三课之后。

## 2026-10-15 从零讲解：正文、分段与可靠输出

本轮目标延伸到素数红包与道路网，当前从实时脚本继续。以下三个主题先讲清楚，再用已完成数列程序做一次综合操作，不重做数列。

### 1. 一个实时脚本里有什么

实时脚本把三类内容放在同一文档：正文用于解释问题、目的和结论；代码由 MATLAB 执行；输出是运行代码得到的数值、表或图。本轮使用 `.mlx` 格式保存。普通脚本中的 `%` 注释供人阅读；实时脚本的 Text 则可以排标题、正文和公式。正文中的公式只是说明，不会因此在工作区定义变量，仍需代码赋值。

在 MATLAB 新建实时脚本（New Live Script）；在需要说明的位置用 Live Editor 的 Text 加入正文，再切回代码区域输入语句。结束后 Save/另存为 `F:\Documents\MATLAB\lab02_sequences.mlx`。不要只在文件管理器改扩展名；本轮不使用另一种较新的 `.m` 实时代码格式，以免与已用普通脚本混淆。操作依据 [R2026a 实时脚本文档](https://www.mathworks.com/help/releases/R2026a/matlab/matlab_prog/create-live-scripts.html)。

### 2. 分段为何仍有执行依赖

代码行开头的 `%%` 建立新节，后面的文字是节标题；单个 `%` 是代码注释。Run Section 执行当前节，Run 执行整份文件。分段帮助局部运行和组织文稿，不自动创建独立工作区：后一节能使用前一节已经创建的变量，但不会自动补跑之前的计算。

例如[这份短示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/live02_sections_basics.m)分两段：

```matlab
%% Prepare values
Values = 1:4; % Four values in one row.
Squares = Values.^2; % Square each value.

%% Inspect results
Totals = [sum(Values), sum(Squares)] % Show both sums on one row.
```

第一段创建 `Values=[1 2 3 4]` 和平方数组；第二段的 `sum` 分别求两者元素总和，方括号并排组成两个结果，所以得到 `[10 30]`。这里复用你已接触的数组运算，重点是第二段依赖第一段。若变量尚不存在，单跑第二段会失败；若它们来自旧运行，第二段甚至可能显示过时结果。代码分节与执行规则见 [R2026a 分节文档](https://www.mathworks.com/help/releases/R2026a/matlab/matlab_prog/create-and-run-sections.html)。

短示范本机实际在 R2026a Update 5 批处理运行，结果 `[10 30]`，标记 `LIVE02_SECTION_EXAMPLE_PASSED`；[运行日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC%E5%88%86%E6%AE%B5%E7%9F%AD%E7%A4%BA%E8%8C%83_20261015.txt)已保存。此证据只核验 `.m` 代码，不声称助手已经在 GUI 运行了 `.mlx`，更不代替本人操作。

### 3. 输出、分号和最后一次完整运行

分号控制是否展示该条语句的结果，不取消赋值或计算。数列程序的三条误差赋值各有 300 个元素；加分号可避免文档铺满数字，仍可正常作图。保留最后的 `[A(end), B(end), C(end)]` 输出即可检查第 300 项，图与正文说明分工呈现其余信息。

局部运行便于修改，交付前则从头完整运行，使图和值对应当前代码，再保存。保存代码并不意味着已经运行了最新版；已经显示的旧图也不能替代这一步。本人需要理解“目的说明—计算—图示—结论”的组织关系，不必重述已通过的数列推导。

### 本次唯一动手任务

从[本人原样归档源码](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w02_sequences_revised_20261007.m)复制代码到新实时脚本，先保存到自己的上述 `.mlx` 路径；在开头添加正文标题“用三个数列近似 e”和一句目的。计算区、绘图区分别用 `%%` 分段；给三条误差赋值加分号，保留末尾项值输出，在图后用本人语言写一句结论。先顺序运行两段，再完整运行并保存。提交能看到正文、两个代码段、项值与图形的截图及保存路径，作为一次综合操作证据；不另加数列变式或口头复述关卡。

## 2026-10-19 本人操作通过

本人提交[实时脚本原文件](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/lab02_sequences.mlx)与[运行截图](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w02_live_learner_20261019.png)。原文件有标题和实验目的、两处 `%%` 分节、分号抑制长数组输出、保存图形和第 300 项 `2.7138,2.6843,2.7183`；CRC 与保存内容已核对。基本组织、运行与保存操作通过，下一步进入第三课，不追加实时脚本变式。

原文末尾仍有“可以沿用此前的数列结论”提示语，它不算本人已经写出的分析；写报告时改为实际结论即可，不因此重做工具练习。保留本人原文件字节。独立批处理只复运行提取的代码，不冒充本人 GUI 操作；结果见[本轮核验日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E8%B5%B7%E6%AD%A5%E4%B8%8E%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC%E6%A0%B8%E9%AA%8C_20261019.txt)。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
