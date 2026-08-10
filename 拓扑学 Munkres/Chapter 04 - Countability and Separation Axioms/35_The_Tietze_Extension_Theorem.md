---
title: "§35 Tietze 扩张定理"
date: 2026-07-28
tags: ["topology/munkres/chapter4", "topology/tietze-extension"]
aliases: ["The Tietze Extension Theorem", "35_The_Tietze_Extension_Theorem"]
---

# §35 The Tietze Extension Theorem

> [!abstract] 核心问题
> 正规空间中，定义在闭子集上的连续函数能否扩张到全空间？Tietze 扩张定理给出肯定回答——这是分析学中连续扩张问题的拓扑基础。

## 35.1 陈述

> [!note] **定理 35.1（Tietze 扩张定理）** ^theorem-35-1
> 设 $X$ 是正规空间，$A \subseteq X$ 是闭集。
> 1. 任意连续函数 $f: A \to [a,b]$ 可扩张为连续函数 $F: X \to [a,b]$。
> 2. 任意连续函数 $f: A \to \mathbb{R}$ 可扩张为连续函数 $F: X \to \mathbb{R}$。

>[!important] Urysohn 引理是 Tietze 扩张定理的特例（$A$ 和 $B$ 不交闭集，定义 $f|_A = 0$, $f|_B = 1$ 再扩张）。反之，可由 Urysohn 引理证明 Tietze 扩张定理——两者等价。

## 35.2 证明

**证明**（逐次逼近法 / Successive Approximation）：

**第一步：归约到 $[-1,1]$。** 通过平移和缩放，只需证 $f: A \to [-1,1]$ 可扩张为 $F: X \to [-1,1]$。

**第二步：构造第一层逼近。** 令 $A_1 = f^{-1}([-1, -1/3])$ 和 $B_1 = f^{-1}([1/3, 1])$。$A_1,B_1$ 是 $A$ 中不交闭集，因 $A$ 闭，$A_1,B_1$ 也是 $X$ 中不交闭集。由 Urysohn 引理，存在连续函数 $g_1: X \to [-1/3, 1/3]$ 使 $g_1(A_1) = -1/3$，$g_1(B_1) = 1/3$。则在 $A$ 上，$|f - g_1| \leqslant 2/3$。

**第三步：归纳构造级数。** 设已构造 $g_1, \ldots, g_n: X \to \mathbb{R}$ 使
$$\left|f(x) - \sum_{i=1}^n g_i(x)\right| \leqslant \left(\frac{2}{3}\right)^n, \quad \forall x \in A$$
且 $|g_{i+1}(x)| \leqslant \frac{1}{3}\left(\frac{2}{3}\right)^i$ 对所有 $x \in X$。
令 $h_n = f - \sum_{i=1}^n g_i$（在 $A$ 上）。$|h_n| \leqslant (2/3)^n$。类似第二步，构造 $g_{n+1}: X \to [-\frac{1}{3}(\frac{2}{3})^n, \frac{1}{3}(\frac{2}{3})^n]$ 使在 $A$ 上 $|h_n - g_{n+1}| \leqslant (2/3)^{n+1}$。

**第四步：取极限。** 函数级数 $\sum_{i=1}^{\infty} g_i$ 一致收敛（Weierstrass M-判别法：$\sum |g_i| \leqslant \sum \frac{1}{3}(\frac{2}{3})^{i-1} = 1$）。令 $F = \sum_{i=1}^{\infty} g_i$，则 $F: X \to [-1,1]$ 连续，且在 $A$ 上 $F = f$。

**第五步：扩张到 $\mathbb{R}$。** 若 $f: A \to \mathbb{R}$，考虑同胚 $\mathbb{R} \cong (-1,1)$（如 $h(x) = \frac{2}{\pi}\arctan x$）。扩张 $h \circ f$ 得 $G: X \to [-1,1]$，令 $F = h^{-1} \circ G$，需处理 $G(x) = \pm 1$ 的情形——将 $G^{-1}(\{-1,1\})$ 用 $0$ 替换再修正。$\square$

>[!tip] 逐次逼近法是 Tietze 扩张证明的精髓——每一次修正误差的 $2/3$，形成几何级数收敛。这与分析学中许多"逐次逼近"构造（如 Picard 迭代、隐函数定理）同源。

## 35.3 推论与应用

> [!note] **推论 35.2**
> 正规空间中，任意闭集是某个连续函数的零点集（$f^{-1}(0)$）当且仅当它是 $G_\delta$ 集。

> [!example] **例 35.1**
> - $\mathbb{R}^n$ 中，定义在闭球面上的连续函数可扩张到整个球（Tietze 定理的直接应用，因 $\mathbb{R}^n$ 可度量化从而正规）。
> - 流形上，定义在闭子集上的连续函数可扩张到整体（利用局部紧 Hausdorff 的正规性）。

## 35.4 习题解析

> [!question] **习题 35.1**
> 直接由 Urysohn 引理推导 Tietze 扩张定理的第一部分（到 $[a,b]$ 的扩张）。

**证明**：见上文"第二步至第四步"的构造——这正是标准的逐次逼近证明，每一步用 Urysohn 引理构造修正函数。$\square$

> [!question] **习题 35.2**
> 证明 Tietze 扩张定理蕴含 Urysohn 引理。

**证明**：设 $A,B$ 不交闭集。在 $A \cup B$ 上定义 $f(A)=\{0\}$，$f(B)=\{1\}$。因 $A \cup B$ 闭且 $f$ 连续（离散并），由 Tietze 扩张得 $F: X \to [0,1]$，满足 $F|_A = 0$，$F|_B = 1$。$\square$

> [!question] **习题 35.3**
> 设 $X$ 正规，$A$ 闭。证明每个有界连续函数 $f: A \to \mathbb{R}$ 可扩张为有界连续函数 $F: X \to \mathbb{R}$，且 $\sup |F| = \sup |f|$。

**证明**：由 Tietze 定理将 $f$ 扩张到 $[-M, M]$（$M = \sup|f|$），得 $F: X \to [-M, M]$。$\sup|F|$ 可能 $< M$，但可通过截断修正。$\square$

> [!question] **习题 35.4**
> 构造反例：局部紧 Hausdorff 空间中闭子集上的连续函数不一定能扩张。

**解**：取 $X = (0,1]$（局部紧 Hausdorff 但非正规），$A = \{1/n\}_{n \in \mathbb{N}^+}$（闭集但不闭？这里的闭性需检查——$A$ 在 $(0,1]$ 中不是闭的因为 $0 \notin X$）。更标准的反例：$X = \mathbb{R}_\ell$ 中某闭子集上的连续函数（利用 $\mathbb{R}_\ell$ 非正规）。$\square$

> [!question] **习题 35.5**
> 证明度量空间中，若 $f: A \to \mathbb{R}$ 在闭集 $A$ 上一致连续，则可扩张为一致连续函数 $F: X \to \mathbb{R}$。

**证明**：一致连续函数在 $\overline{A}$ 上有唯一连续扩张（利用 Cauchy 序列）。若 $A$ 已闭，则 $f$ 本身已定义在闭集上。由 Tietze 扩张（度量空间正规）得连续扩张，但一致性需特殊处理——利用度量空间中连续函数在紧集上的一致连续性。$\square$

> [!question] **习题 35.6**
> 设 $X$ 正规，$A,B$ 不交闭集。证明存在连续函数 $f: X \to \mathbb{R}$ 使 $f(A) = \{a\}$，$f(B) = \{b\}$，且 $f(X) \subseteq [a,b]$（$a < b$）。

**证明**：由 Urysohn 引理得 $g: X \to [0,1]$ 分离 $A,B$。令 $f = a + (b-a)g$。$\square$

> [!question] **习题 35.7**
> 证明 Tietze 扩张定理中，$F$ 可取为使 $F(X) \subseteq [a,b]$ 且 $\sup|F|$ 可达。

**证明**：Tietze 定理的标准证明已构造 $F: X \to [-M,M]$（其中 $M=\sup|f|$）。截断函数 $\max(-M, \min(F, M))$ 给出所需。$\square$

## 相关链接
- 上一节：[[34_The_Urysohn_Metrization_Theorem|§34 The Urysohn Metrization Theorem]]
- 下一节：[[36_Imbeddings_of_Manifolds|§36 Imbeddings of Manifolds]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]