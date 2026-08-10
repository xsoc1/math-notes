---
title: "§21 度量拓扑 II"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/metric-topology
  - topology/uniform-convergence
aliases:
  - "The Metric Topology (continued)"
  - "21_The_Metric_Topology_II"
---

# §21 The Metric Topology (II)

> [!abstract] 核心问题
> 函数空间上的一致度量与一致收敛拓扑。$\mathbb{R}^\omega$ 上的度量与积拓扑/箱拓扑的关系？

## 21.1 一致度量

> [!note] **定义 21.1（一致度量 / Uniform Metric）**
> 设 $J$ 是一个集合，$(Y, d)$ 是度量空间。在 $Y^J = \prod_{\alpha \in J} Y$ 上定义一致度量：
> $$\overline{\rho}(x, y) = \sup\{\overline{d}(x_\alpha, y_\alpha) \mid \alpha \in J\}$$
> 其中 $\overline{d}(a, b) = \min(d(a, b), 1)$ 是标准有界度量。

>[!important] 注意：上确界可能无限大，但由于 $\overline{d} \leqslant 1$，一致度量 $\overline{\rho}$ 总是有限的（取值在 $[0, 1]$）。

> [!note] **定理 21.1**
> $\overline{\rho}$ 确实是 $Y^J$ 上的一个度量。由 $\overline{\rho}$ 诱导的拓扑称为**一致拓扑 (uniform topology)**。

**证明**：正定性、对称性显然。三角不等式：
$$\overline{\rho}(x, z) = \sup_\alpha \overline{d}(x_\alpha, z_\alpha) \leqslant \sup_\alpha [\overline{d}(x_\alpha, y_\alpha) + \overline{d}(y_\alpha, z_\alpha)] \leqslant \sup_\alpha \overline{d}(x_\alpha, y_\alpha) + \sup_\alpha \overline{d}(y_\alpha, z_\alpha) = \overline{\rho}(x, y) + \overline{\rho}(y, z)$$
$\square$

## 21.2 三种拓扑的比较

在 $\mathbb{R}^\omega$（$J = \mathbb{N}$，$Y = \mathbb{R}$）上，有三种重要的拓扑：

| 拓扑 | 粗/细 | 收敛性刻画 |
|------|-------|-----------|
| 积拓扑 | 最粗 | 逐点收敛 |
| 一致拓扑 | 中间 | 一致收敛 |
| 箱拓扑 | 最细 | —（无简单的收敛刻画） |

关系：积拓扑 $\subsetneq$ 一致拓扑 $\subsetneq$ 箱拓扑

> [!example] **例 21.1**
> 序列 $e_n = (0,\ldots,0,1,0,\ldots)$（第 $n$ 个位置为 1）：
> - 在积拓扑中收敛于 $(0,0,\ldots)$（每个坐标分量最终为 0）；
> - 在一致拓扑中**不收敛**（$\overline{\rho}(e_n, 0) = 1$ 恒成立）；
> - 在箱拓扑中也不收敛。

## 21.3 一致收敛定理

> [!note] **定理 21.2（一致收敛与连续性）**
> 设 $f_n: X \to Y$ 是连续函数序列（$Y$ 是度量空间）。若 $f_n$ 一致收敛到 $f$，则 $f$ 连续。

**证明**：对任意 $x \in X$ 和 $\varepsilon > 0$，取 $N$ 使 $\forall n \geqslant N$，$\forall z \in X$，$d(f_n(z), f(z)) < \varepsilon/3$。取 $x$ 的邻域 $U$ 使 $\forall z \in U$，$d(f_N(z), f_N(x)) < \varepsilon/3$。则
$$d(f(z), f(x)) \leqslant d(f(z), f_N(z)) + d(f_N(z), f_N(x)) + d(f_N(x), f(x)) < \varepsilon$$
$\square$

## 21.4 $\mathbb{R}^\omega$ 的可度量化

> [!note] **定理 21.4**
> $\mathbb{R}^\omega$ 在积拓扑下是**可度量化的**（尽管标准 Euclid 度量在无穷维无意义）。可定义度量：
> $$D(x, y) = \sup\left\{\frac{\min(|x_n - y_n|, 1)}{n} \;\middle|\; n \in \mathbb{N}^+\right\}$$
> 此度量诱导的拓扑恰为积拓扑。

**证明**：

*（i）$D$ 是度量。* 验证三条公理：
- **非负性与同一性**：显然 $D(x,y) \geqslant 0$。若 $x=y$，则每项为 $0$，故 $D=0$。若 $x \neq y$，存在 $n$ 使得 $x_n \neq y_n$，则 $\frac{\min(|x_n-y_n|,1)}{n} > 0$，故 $D(x,y) > 0$。
- **对称性**：$D(x,y)=D(y,x)$ 由 $|x_n-y_n|=|y_n-x_n|$ 立即得到。
- **三角不等式**：对每个 $n$，
  $$\frac{\min(|x_n-z_n|,1)}{n} \leqslant \frac{\min(|x_n-y_n|+|y_n-z_n|,1)}{n} \leqslant \frac{\min(|x_n-y_n|,1)}{n} + \frac{\min(|y_n-z_n|,1)}{n} \leqslant D(x,y) + D(y,z)$$
  对 $n$ 取上确界得 $D(x,z) \leqslant D(x,y) + D(y,z)$。

*（ii）$D$ 诱导积拓扑。* 需证 $D$-开集族 $\mathcal{T}_D$ 与积拓扑 $\mathcal{T}_{\text{prod}}$ 一致。

**$\mathcal{T}_{\text{prod}} \subseteq \mathcal{T}_D$**：设 $U = \prod U_n$ 为积拓扑基成员，仅有 $U_1,\ldots,U_N \neq \mathbb{R}$。任取 $x \in U$。对每个 $n \leqslant N$，因 $x_n \in U_n$ 且 $U_n$ 在 $\mathbb{R}$ 中开，存在 $\varepsilon_n > 0$ 使得 $(x_n-\varepsilon_n, x_n+\varepsilon_n) \subseteq U_n$。取
$$\varepsilon = \min\left\{\frac{\varepsilon_1}{1}, \frac{\varepsilon_2}{2}, \ldots, \frac{\varepsilon_N}{N}, \frac{1}{N}\right\}$$
则对任意 $y \in B_D(x,\varepsilon)$，有 $\frac{\min(|y_n-x_n|,1)}{n} < \varepsilon \leqslant \frac{\varepsilon_n}{n}$（$n \leqslant N$），故 $|y_n-x_n| < \varepsilon_n$，即 $y_n \in U_n$。对 $n > N$，无条件限制。因此 $B_D(x,\varepsilon) \subseteq U$，故 $U \in \mathcal{T}_D$。

**$\mathcal{T}_D \subseteq \mathcal{T}_{\text{prod}}$**：任取 $x \in \mathbb{R}^\omega$ 和 $\varepsilon > 0$。选取 $N$ 使得 $\frac{1}{N} < \varepsilon$。定义
$$V = \prod_{n=1}^{N} (x_n-\varepsilon, x_n+\varepsilon) \times \prod_{n=N+1}^{\infty} \mathbb{R}$$
则 $V$ 是积拓扑的基开集。对任意 $y \in V$：当 $n \leqslant N$ 时，$|y_n-x_n| < \varepsilon$，故 $\frac{\min(|y_n-x_n|,1)}{n} < \frac{\varepsilon}{n} \leqslant \varepsilon$；当 $n > N$ 时，$\frac{\min(|y_n-x_n|,1)}{n} \leqslant \frac{1}{n} < \frac{1}{N} < \varepsilon$。因此 $D(x,y) < \varepsilon$，即 $V \subseteq B_D(x,\varepsilon)$。故 $B_D(x,\varepsilon) \in \mathcal{T}_{\text{prod}}$。

综上 $\mathcal{T}_D = \mathcal{T}_{\text{prod}}$，$\mathbb{R}^\omega$ 在积拓扑下可度量化。$\square$


## 21.5 习题解析

> [!question] **习题 21.1**
> 证明度量 $D(x, y) = \sup_n \frac{\min(|x_n - y_n|, 1)}{n}$ 诱导 $\mathbb{R}^\omega$ 上的积拓扑。

**证明**：积拓扑的基包含形如 $\prod U_n$ 的集合，其中仅有有限个 $U_n \neq \mathbb{R}$。设 $U = \prod U_n$，其中 $U_n = \mathbb{R}$（$n > N$）。对 $x \in U$，取 $\varepsilon < \min(\min_{n \leqslant N} \frac{d(x_n, \mathbb{R} \setminus U_n)}{n}, \frac{1}{N})$，则 $B_D(x, \varepsilon) \subseteq U$。反之，对给定的 $D$-球，可找到积拓扑的基成员包含于其中。故二者生成相同拓扑。$\square$

> [!question] **习题 21.3**
> 设 $X$ 是度量空间。证明以下关于 $X$ 的条件等价：
> (a) $X$ 是有界的（关于每个与拓扑相容的度量）；
> (b) 每个连续函数 $f: X \to \mathbb{R}$ 是有界的；
> (c) $X$ 是**伪紧的 (pseudocompact)**。

**证明**（概要）：(a) $\Rightarrow$ (b) 由连续函数将紧集映为紧集（见 Chapter 3）。若 $X$ 满足 (b) 但不是紧的，可构造无界连续函数。(b) $\iff$ (c) 是伪紧的定义。

> [!question] **习题 21.6**
> 证明 $\mathbb{R}^\omega$ 中一致拓扑的闭单位球 $\overline{B}_{\overline{\rho}}(0, 1)$ 在箱拓扑中不是紧的（紧性见 Chapter 3）。

**证明**：$\overline{B}_{\overline{\rho}}(0, 1) = [-1, 1]^\omega$。箱拓扑中，可以构造一个没有收敛子序列的序列，例如 $e_n$ 序列在箱拓扑中无极限点。故该球在箱拓扑中非紧。$\square$

## 相关链接

- 上一节：[[20_The_Metric_Topology_I|§20 The Metric Topology I]]
- 下一节：[[22_The_Quotient_Topology|§22 The Quotient Topology]]
- 积拓扑：[[19_The_Product_Topology|§19 The Product Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
