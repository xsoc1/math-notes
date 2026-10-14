---
title: "MATLAB 实时脚本（`.mlx`）入门"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/工具_实时脚本mlx.md"
matlab_source_sha256: c36c1a90389205e1b4928e1e838bafb13b7429d0a2cd87e31163114bc9865e2c
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

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
