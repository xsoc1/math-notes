---
title: "§20 度量拓扑 I"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/metric-topology
  - topology/metric-space
aliases:
  - "The Metric Topology"
  - "20_The_Metric_Topology_I"
---

# §20 The Metric Topology (I)

> [!abstract] 核心问题
> 度量如何自然地诱导一个拓扑？度量空间中连续性的 $\varepsilon$-$\delta$ 定义如何与拓扑定义衔接？

## 20.1 度量空间

> [!note] **定义 20.1（度量 / Metric）**
> 集合 $X$ 上的一个 **度量 (metric)** 是函数 $d: X \times X \to \mathbb{R}$，满足 $\forall x, y, z \in X$：
> 1. $d(x, y) \geqslant 0$，且 $d(x, y) = 0 \iff x = y$（正定性）；
> 2. $d(x, y) = d(y, x)$（对称性）；
> 3. $d(x, z) \leqslant d(x, y) + d(y, z)$（三角不等式）。
>
> 此时称 $(X, d)$ 为 **度量空间 (metric space)**。

## 20.2 开球与度量拓扑

> [!note] **定义 20.2（开球 / Open Ball）**
> 以 $x$ 为中心、$\varepsilon > 0$ 为半径的**开球 (open ball)**：
> $$B_d(x, \varepsilon) = \{y \in X \mid d(x, y) < \varepsilon\}$$

> [!note] **引理 20.1（开球构成基）** ^theorem-20-1
> 所有开球的族 $\mathcal{B} = \{B_d(x, \varepsilon) \mid x \in X, \varepsilon > 0\}$ 是 $X$ 上一个拓扑的基。此拓扑称为由度量 $d$ 诱导的**度量拓扑 (metric topology)**。

**证明**：
1. 覆盖性：对任意 $x \in X$，$x \in B_d(x, 1) \in \mathcal{B}$。
2. 交条件：设 $z \in B_d(x, \varepsilon) \cap B_d(y, \delta)$。取
   $$r = \min(\varepsilon - d(x, z),\; \delta - d(y, z)) > 0$$
   则对任意 $w \in B_d(z, r)$，
   $$d(x, w) \leqslant d(x, z) + d(z, w) < d(x, z) + r \leqslant d(x, z) + (\varepsilon - d(x, z)) = \varepsilon$$
   故 $w \in B_d(x, \varepsilon)$，同理 $w \in B_d(y, \delta)$。因此 $B_d(z, r) \subseteq B_d(x, \varepsilon) \cap B_d(y, \delta)$。$\square$

> [!note] **定义 20.3（可度量化空间 / Metrizable Space）**
> 拓扑空间 $(X, \mathcal{T})$ 称为 **可度量化的 (metrizable)**，若存在 $X$ 上的度量 $d$ 使得 $\mathcal{T}$ 恰为由 $d$ 诱导的度量拓扑。

## 20.3 度量空间中的连续函数

> [!note] **定理 20.2（$\varepsilon$-$\delta$ 连续性）**
> 设 $f: X \to Y$ 是度量空间之间的映射。则 $f$ 连续 $\iff$ 对每个 $x \in X$ 和 $\varepsilon > 0$，存在 $\delta > 0$ 使得
> $$d_X(x, y) < \delta \implies d_Y(f(x), f(y)) < \varepsilon$$

**证明**：这正是定理 18.1 等价条件 (4) 在度量空间中的重述：$B_Y(f(x), \varepsilon)$ 是 $f(x)$ 的邻域，连续意味着存在 $x$ 的邻域 $B_X(x, \delta)$ 使得 $f(B_X(x, \delta)) \subseteq B_Y(f(x), \varepsilon)$。$\square$

## 20.4 常见度量

> [!example] **例 20.1（$\mathbb{R}^n$ 上的标准度量）**
> $$d(x, y) = \sqrt{\sum_{i=1}^{n} (x_i - y_i)^2} \quad \text{（Euclid 度量）}$$
> 诱导的拓扑即 $\mathbb{R}^n$ 的标准拓扑。

> [!example] **例 20.2（$\mathbb{R}^n$ 上的平方度量 / Square Metric）**
> $$\rho(x, y) = \max\{|x_1 - y_1|, \ldots, |x_n - y_n|\}$$
> $\rho$ 诱导的拓扑与 Euclid 度量诱导的拓扑**相同**（因为 $B_\rho(x, \varepsilon) = \prod (x_i - \varepsilon, x_i + \varepsilon)$ 在两种拓扑中都是开集）。

> [!example] **例 20.3（离散度量 / Discrete Metric）**
> $$d(x, y) = \begin{cases} 0 & x = y \\ 1 & x \neq y \end{cases}$$
> 诱导的拓扑是**离散拓扑**（因为 $B(x, \frac{1}{2}) = \{x\}$ 是开集）。

## 20.5 有界性

> [!note] **定义 20.4（有界集 / Bounded Set）**
> 度量空间 $(X, d)$ 的子集 $A$ 称为 **有界的 (bounded)**，若存在 $M > 0$ 使得 $\forall x, y \in A$，$d(x, y) \leqslant M$。

>[!warning] 有界性不是拓扑性质！标准有界度量 $d$ 与 $d'(x,y) = \min(d(x,y), 1)$ 诱导相同的拓扑，但 $X$ 关于 $d'$ 总是有界的。这说明有界性依赖于度量的选取而非拓扑。

## 20.6 习题解析

> [!question] **习题 20.1**
> 证明 Euclid 度量 $d$、平方度量 $\rho$ 和出租车度量（$d_1(x,y) = \sum |x_i - y_i|$）在 $\mathbb{R}^n$ 上诱导相同的拓扑。

**证明**：只需证 $\varepsilon$-球互相包含。$\rho(x, y) \leqslant d(x, y) \leqslant \sqrt{n}\,\rho(x, y)$，故 $B_\rho(x, \varepsilon/\sqrt{n}) \subseteq B_d(x, \varepsilon) \subseteq B_\rho(x, \varepsilon)$。同理 $d_1(x, y)$ 也有类似不等式。由于开球族互相"精细"，它们生成相同的拓扑。$\square$

> [!question] **习题 20.3**
> 设 $X$ 是度量空间，$A \subseteq X$。证明 $x \in \overline{A} \iff d(x, A) = 0$，其中 $d(x, A) = \inf\{d(x, a) \mid a \in A\}$。

**证明**：
- ($\Rightarrow$)：$x \in \overline{A} \implies$ 每个 $B(x, \varepsilon)$ 与 $A$ 相交 $\implies \forall \varepsilon > 0$，$d(x, A) < \varepsilon \implies d(x, A) = 0$。
- ($\Leftarrow$)：$d(x, A) = 0 \implies \forall \varepsilon > 0$，存在 $a \in A$ 使得 $d(x, a) < \varepsilon \implies B(x, \varepsilon) \cap A \neq \varnothing \implies x \in \overline{A}$。$\square$

> [!question] **习题 20.5**
> 设 $\overline{d}(x, y) = \min(d(x, y), 1)$。证明 $\overline{d}$ 是与 $d$ 诱导相同拓扑的度量。

**证明**：在两种度量下，$\varepsilon < 1$ 时的 $\varepsilon$-球完全相同；而 $\varepsilon \geqslant 1$ 时的球在两种度量下都是全空间。故开球族相同，从而诱导相同的拓扑。$\square$

## 相关链接

- 上一节：[[19_The_Product_Topology|§19 The Product Topology]]
- 下一节：[[21_The_Metric_Topology_II|§21 The Metric Topology II]]
- 连续函数：[[18_Continuous_Functions|§18 Continuous Functions]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
