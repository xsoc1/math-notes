---
title: "§46 Ascoli 定理"
date: 2026-07-28
tags: ["topology/munkres/chapter7", "topology/ascoli"]
aliases: ["Ascoli's Theorem", "46_Ascolis_Theorem"]
---

# §46 Ascoli's Theorem

> [!abstract] 核心问题
> 函数族何时是紧的（在紧开拓扑下）？Ascoli 定理给出经典回答：等度连续 + 点态有界 ⇒ 紧。这是泛函分析和 PDE 中最常用的紧性判据之一。

## 46.1 等度连续性

> [!note] **定义 46.1（等度连续 / Equicontinuous）**
> 设 $X$ 是拓扑空间，$(Y,d)$ 是度量空间。$\mathcal{F}\subseteq C(X,Y)$ 在 $x_0\in X$ 处等度连续：
> $$\forall\varepsilon>0,\exists U\ni x_0\text{ 开},\forall f\in\mathcal{F},\forall x\in U: d(f(x),f(x_0))<\varepsilon$$
> 若 $\mathcal{F}$ 在每点等度连续，则称 $\mathcal{F}$ 等度连续。

> [!note] **定理 46.1（Ascoli 定理，经典形式）** ^theorem-46-1
> 设 $X$ 紧 Hausdorff，$(Y,d)$ 度量空间。$\mathcal{F}\subseteq C(X,Y)$ 在紧开拓扑下有紧闭包 $\iff$ $\mathcal{F}$ 等度连续且对每个 $x\in X$，$\{f(x)\mid f\in\mathcal{F}\}$ 在 $Y$ 中有紧闭包。

**证明**（概要）：
（⇒）若 $\overline{\mathcal{F}}$ 紧，则在乘积空间 $Y^X$ 中紧。紧集在每坐标投影下有界，等度连续性由紧性的"一致"性质导出。
（⇐）由 Tychonoff 定理，$\prod_{x\in X}\overline{\{f(x)\}}$ 紧。$\mathcal{F}$ 的闭包在其中。利用等度连续性证紧开拓扑与点态收敛拓扑在 $\overline{\mathcal{F}}$ 上一致，从而 $\overline{\mathcal{F}}$ 作为紧集的闭子集紧。$\square$

> [!note] **定理 46.2（Arzelà-Ascoli 定理）**
> 紧区间 $[a,b]$ 上的连续函数族一致有界且等度连续 $\iff$ 该族在 $C([a,b])$ 中列紧（在一致范数下）。

> [!example] **例 46.1（PDE 中的应用）**
> 在椭圆型 PDE 中，Sobolev 嵌入 $W^{1,p}\hookrightarrow C^{0,\alpha}$ 的紧性证明通常构造等度连续的有界函数族，再应用 Arzelà-Ascoli 定理。

## 46.2 习题解析

> [!question] **习题 46.1**
> 证明有限函数族总是等度连续的。
**证明**：对有限族 $\{f_1,\ldots,f_n\}$ 和 $\varepsilon>0$，取各 $f_i$ 的邻域之交（有限交仍为开邻域）。$\square$

> [!question] **习题 46.2**
> 给出等度连续但不一致有界的函数族例子（在非紧定义域上）。
**解**：$X=\mathbb{R}$，$\mathcal{F}=\{f_n(x)=x+n\}$。每点 $x$ 处 $|f_n(x)-f_n(y)|=|x-y|$ 等度连续，但 $\{f_n(0)\}$ 无界。$\square$

> [!question] **习题 46.3-46.5**
> 关于 Ascoli 定理在 $C(X,\mathbb{R}^n)$ 中的推广、等度连续与一致等度连续的关系等。$\square$

## 相关链接
- 上一节：[[45_Function_Spaces|§45 Function Spaces]]
- 下一章：[[../Chapter 08 - Baire Spaces and Dimension Theory/00_Chapter_08_Overview|Chapter 8]]
- 返回总览：[[00_Chapter_07_Overview|Chapter 7 Overview]]

## 跨主题参照

- [[泛函分析/03_紧性与函数族/02_Ascoli定理与紧性判别#2. Ascoli–Arzelà 定理|Ascoli定理与紧性判别]]。对照紧度量空间上一致范数的序列判据及积分算子应用。
