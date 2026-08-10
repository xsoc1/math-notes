---
title: "§27 实直线的紧子集"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/compactness
  - topology/real-line
aliases:
  - "Compact Subspaces of the Real Line"
  - "27_Compact_Subspaces_of_R"
---

# §27 Compact Subspaces of the Real Line

> [!abstract] 核心问题
> $\mathbb{R}^n$ 中子集紧的充要条件是什么？经典分析定理（极值定理、一致连续性）如何从紧致性导出？

## 27.1 Heine-Borel 定理

> [!note] **定理 27.1（$\mathbb{R}$ 中闭区间紧）**
> $[a, b] \subseteq \mathbb{R}$ 在标准拓扑下是紧的。

**证明**：设 $\mathcal{U}$ 是 $[a,b]$ 的开覆盖（由 $\mathbb{R}$ 中开集与 $[a,b]$ 的交组成）。令
$$S = \{x \in [a,b] \mid [a,x] \text{ 可被 } \mathcal{U} \text{ 的有限子族覆盖}\}$$
则 $a \in S$（$[a,a] = \{a\}$ 被某一个 $U \in \mathcal{U}$ 覆盖）。令 $c = \sup S$。若 $c < b$，取 $U \in \mathcal{U}$ 覆盖 $c$，则 $U$ 包含 $(c-\varepsilon, c+\varepsilon) \cap [a,b]$。由确界定义，$c-\varepsilon/2 \in S$，故 $[a, c-\varepsilon/2]$ 有有限覆盖，加上 $U$ 后覆盖 $[a, c+\varepsilon/2 \cap b]$，得 $c+\varepsilon/2 \in S$ 或 $b$ 在有限覆盖内。总之与 $c = \sup S < b$ 矛盾。故 $c = b$ 且 $b \in S$。$\square$

>[!important] 这个证明完全基于 $\mathbb{R}$ 的最小上界性质，没有用到 Heine-Borel 定理！

> [!note] **定理 27.3（Heine-Borel 定理）** ^thm-27-3
> $\mathbb{R}^n$ 的子集 $A$ 是紧的 $\iff$ $A$ 是有界闭集。

**证明**：
- ($\Rightarrow$)：$\mathbb{R}^n$ 是 Hausdorff 空间，紧子集是闭集（定理 26.3）。若 $A$ 无界，$\{B(0, n)\}_{n \in \mathbb{N}}$ 给出无有限子覆盖的开覆盖。
- ($\Leftarrow$)：$A$ 有界意味着 $A \subseteq [-M, M]^n$。由定理 27.1，$[-M, M]$ 紧，其有限积 $[-M, M]^n$ 紧（定理 26.6）。$A$ 作为紧空间的闭子集，紧（定理 26.2）。$\square$

## 27.2 极值定理

> [!note] **定理 27.4（极值定理 / Extreme Value Theorem）** ^thm-27-4
> 设 $f: X \to \mathbb{R}$ 连续，$X$ 紧。则 $f$ 达到最大值和最小值。

**证明**：$f(X)$ 是 $\mathbb{R}$ 的紧子集（定理 26.5），故有界闭（Heine-Borel）。$\sup f(X)$ 和 $\inf f(X)$ 属于 $f(X)$（闭集包含确界），故存在 $c, d \in X$ 使 $f(c) = \max f(X)$，$f(d) = \min f(X)$。$\square$

## 27.3 一致连续性

> [!note] **定义 27.1（一致连续 / Uniformly Continuous）**
> 设 $(X, d_X), (Y, d_Y)$ 是度量空间。$f: X \to Y$ 称为 **一致连续的**，若 $\forall \varepsilon > 0, \exists \delta > 0$ 使得 $d_X(x, y) < \delta \implies d_Y(f(x), f(y)) < \varepsilon$。

>[!important] 一致连续 vs 连续：一致连续中 $\delta$ 只依赖于 $\varepsilon$，不依赖于 $x$。

> [!note] **定理 27.6（紧集上连续 $\implies$ 一致连续）**
> 设 $f: X \to Y$ 是度量空间之间的连续映射，$X$ 紧。则 $f$ 一致连续。

**证明**：给定 $\varepsilon > 0$。对每个 $x \in X$，由 $f$ 连续，存在 $\delta_x > 0$ 使得 $f(B(x, \delta_x)) \subseteq B(f(x), \varepsilon/2)$。$\{B(x, \delta_x/2)\}_{x \in X}$ 是 $X$ 的开覆盖。由紧性，有有限子覆盖 $B(x_1, \delta_1/2), \ldots, B(x_n, \delta_n/2)$（$\delta_i = \delta_{x_i}$）。取 $\delta = \min_i \delta_i/2$。

若 $d(x, y) < \delta$，取 $x_i$ 使 $x \in B(x_i, \delta_i/2)$。则
$$d(y, x_i) \leqslant d(y, x) + d(x, x_i) < \delta + \delta_i/2 \leqslant \delta_i$$
故 $x, y \in B(x_i, \delta_i)$，从而 $d(f(x), f(x_i)) < \varepsilon/2$ 且 $d(f(y), f(x_i)) < \varepsilon/2$，得 $d(f(x), f(y)) < \varepsilon$。$\square$

## 27.4 习题解析

> [!question] **习题 27.1**
> 直接用定义证明 $[0,1]$ 不是 $\mathbb{R}_\ell$（下限拓扑）中的紧子集。

**证明**：考虑开覆盖 $\{[0, 1-\frac{1}{n}) \mid n \in \mathbb{N}^+\} \cup \{[1, 2)\}$。其中每个成员是 $\mathbb{R}_\ell$ 中开集（基成员）。任何有限子族覆盖的最大上限为 $1-\frac{1}{N}$（对某个 $N$），$1$ 未被覆盖。故 $[0,1]$ 在 $\mathbb{R}_\ell$ 中不紧。$\square$

> [!question] **习题 27.2**
> 设 $(X, d)$ 是紧度量空间。证明 $X$ 有界且 $\operatorname{diam}(X) = \sup_{x,y \in X} d(x,y)$ 在 $X$ 上达到。

**证明**：函数 $g: X \times X \to \mathbb{R}$，$g(x,y) = d(x,y)$ 连续。$X \times X$ 紧（定理 26.6），由极值定理 $g$ 达到最大值，故直径达到。$\square$

> [!question] **习题 27.3**
> 证明紧度量空间是完全有界的（totally bounded）：对任意 $\varepsilon > 0$，$X$ 可被有限个 $\varepsilon$-球覆盖。

**证明**：$\{B(x, \varepsilon)\}_{x \in X}$ 是 $X$ 的开覆盖。由紧性得有限子覆盖。$\square$

> [!question] **习题 27.4**
> 证明 $\mathbb{R}^n$ 中集合 $A$ 紧 $\iff$ $A$ 的每个无限子集在 $A$ 中有极限点（Bolzano-Weierstrass 性质）。

**证明**：
- ($\Rightarrow$)：习题 26.3 已证。
- ($\Leftarrow$)：若 $A$ 不是有界闭的，则或 $A$ 无界（可取无收敛子列的无界序列）或 $A$ 不闭（存在极限点不在 $A$ 中的收敛序列，产生 $A$ 中无极限点的无限子集）。$\square$

> [!question] **习题 27.5（广义 Heine-Borel）**
> 度量空间 $X$ 紧 $\iff$ $X$ 完备且完全有界。

**证明**：
- ($\Rightarrow$)：完备性：习题 26.7。完全有界性：习题 27.3。
- ($\Leftarrow$)：设 $X$ 完备且完全有界。取序列 $(x_n)$。由完全有界性，可用对角线法取出 Cauchy 子列。由完备性，该子列收敛。故 $X$ 列紧（见 §28），在度量空间中等价于紧。$\square$

> [!question] **习题 27.6**
> 设 $X$ 紧，$f: X \to \mathbb{R}$ 连续。证明存在非空闭集 $A \subseteq X$ 使得 $f(A)$ 是单点集，且 $A$ 关于此性质极小。

**证明**：由紧空间的嵌套闭集性质（习题 26.1）。构造 $X_n = f^{-1}([m_n, M_n])$，其中 $m_n \to M$ 等。利用极值定理逐次缩小范围。$\square$

## 相关链接

- 上一节：[[26_Compact_Spaces|§26 Compact Spaces]]
- 下一节：[[28_Limit_Point_Compactness|§28 Limit Point Compactness]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
