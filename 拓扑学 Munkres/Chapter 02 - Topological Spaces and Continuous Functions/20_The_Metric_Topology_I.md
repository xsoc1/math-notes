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
> 度量空间中的距离函数 $d$ 如何通过开球自然诱导出一个拓扑结构（度量拓扑）？两个数值完全不同的度量函数在什么条件下会生成完全相同的拓扑？欧氏空间 $\mathbb{R}^n$ 与无穷维序列空间 $\mathbb{R}^\omega$ 上的不同度量又有着怎样的拓扑表现？

## 20.1 度量空间与开球基

> [!note] **定义 20.1（度量 / Metric 与 度量空间 / Metric Space）**
> 集合 $X$ 上的一个 **度量（metric）** 是指一个二元实值函数 $d: X \times X \to \mathbb{R}$，它对任意 $x, y, z \in X$ 满足以下三条公理：
> 1. **（正定性）** $d(x, y) \geqslant 0$，且等号 $d(x, y) = 0$ 成立当且仅当 $x = y$；
> 2. **（对称性）** $d(x, y) = d(y, x)$；
> 3. **（三角不等式）** $d(x, z) \leqslant d(x, y) + d(y, z)$。
>
> 配备了度量 $d$ 的集合 $(X, d)$ 称为一个 **度量空间（metric space）**。

> [!note] **定义 20.2（开球 / Open Ball）**
> 设 $(X, d)$ 是度量空间，$x \in X$，$\varepsilon > 0$。集合
> $$B_d(x, \varepsilon) = \{y \in X \mid d(x, y) < \varepsilon\}$$
> 称为以 $x$ 为中心、$\varepsilon$ 为半径的 **$\varepsilon$-开球（$\varepsilon$-ball centered at $x$）**。

> [!note] **引理 20.1（开球族构成拓扑基）** ^theorem-20-1
> 设 $(X, d)$ 是度量空间。则 $X$ 中全体开球构成的集合族
> $$\mathcal{B} = \{B_d(x, \varepsilon) \mid x \in X, \, \varepsilon > 0\}$$
> 满足定义 13.1 中拓扑基的两条公理。由 $\mathcal{B}$ 生成的拓扑称为由度量 $d$ 诱导的 **度量拓扑（metric topology）**。

**证明**：
1. **覆盖性**：对任意 $x \in X$，显然有 $x \in B_d(x, 1) \in \mathcal{B}$。
2. **交集局部包含性**：首先证明对任意开球 $B_d(x, \varepsilon)$ 及其中任意一点 $y \in B_d(x, \varepsilon)$，由于 $d(x, y) < \varepsilon$，令正数 $\delta = \varepsilon - d(x, y) > 0$，则由三角不等式对任意 $z \in B_d(y, \delta)$ 有：
   $$d(x, z) \leqslant d(x, y) + d(y, z) < d(x, y) + \delta = \varepsilon$$
   即 $B_d(y, \delta) \subseteq B_d(x, \varepsilon)$。
   现在设 $B_1 = B_d(x_1, \varepsilon_1)$ 与 $B_2 = B_d(x_2, \varepsilon_2)$ 是两个开球，且 $y \in B_1 \cap B_2$。分别取 $\delta_1 = \varepsilon_1 - d(x_1, y) > 0$ 和 $\delta_2 = \varepsilon_2 - d(x_2, y) > 0$，并令 $\delta = \min(\delta_1, \delta_2) > 0$，则
   $$y \in B_d(y, \delta) \subseteq B_d(y, \delta_1) \cap B_d(y, \delta_2) \subseteq B_1 \cap B_2$$
   这就验证了基的第二条公理。$\square$

> [!important] **理解要点：什么叫“子集 $U$ 在度量拓扑下是开集”？**
> 根据基生成拓扑的定义，子集 $U \subseteq X$ 在度量 $d$ 诱导的拓扑下是开集，当且仅当**对每一个点 $x \in U$，都存在半径 $\varepsilon > 0$ 使得开球 $B_d(x, \varepsilon) \subseteq U$**。

> [!note] **定义 20.3（可度量化空间 / Metrizable Space）**
> 给定一个拓扑空间 $(X, \mathcal{T})$，如果存在 $X$ 上的某个度量函数 $d$，使得由 $d$ 诱导的度量拓扑恰好等于原有的拓扑 $\mathcal{T}$，则称拓扑空间 $X$ 是 **可度量化的（metrizable）**。

## 20.2 标准有界度量与度量拓扑的比较

在拓扑学中，“有界性（boundedness）”是一个**度量性质而非拓扑性质**！因为任何度量空间 $(X, d)$ 都可以通过截断距离改写为一个直径不超过 $1$ 的有界度量空间，且丝毫不改变其拓扑结构：

> [!note] **定理 20.1（标准有界度量 / Standard Bounded Metric）** ^theorem-20-bounded
> 设 $d$ 是集合 $X$ 上的一个度量。定义函数 $\bar{d}: X \times X \to \mathbb{R}$ 为：
> $$\bar{d}(x, y) = \min\bigl\{d(x, y), \, 1\bigr\}$$
> 则 $\bar{d}$ 也是 $X$ 上的一个度量（称为对应于 $d$ 的 **标准有界度量**），并且 **$\bar{d}$ 与 $d$ 在 $X$ 上诱导出完全相同的拓扑**。

**证明**：
1. **验证 $\bar{d}$ 是度量**：正定性与对称性显然。对于三角不等式 $\bar{d}(x, z) \leqslant \bar{d}(x, y) + \bar{d}(y, z)$：若 $\bar{d}(x, y) = 1$ 或 $\bar{d}(y, z) = 1$，则右端 $\geqslant 1$，而左端 $\bar{d}(x, z) \leqslant 1$，不等式自动成立；若 $\bar{d}(x, y) < 1$ 且 $\bar{d}(y, z) < 1$，则 $\bar{d}(x, y) = d(x, y)$ 且 $\bar{d}(y, z) = d(y, z)$，由 $d$ 的三角不等式得
   $$\bar{d}(x, z) \leqslant d(x, z) \leqslant d(x, y) + d(y, z) = \bar{d}(x, y) + \bar{d}(y, z)$$
2. **验证诱导相同拓扑**：注意到当半径 $\varepsilon \leqslant 1$ 时，条件 $\bar{d}(x, y) < \varepsilon$ 与 $d(x, y) < \varepsilon$ 完全等价，即
   $$B_{\bar{d}}(x, \varepsilon) = B_d(x, \varepsilon) \qquad (\forall 0 < \varepsilon \leqslant 1)$$
   由于半径不超过 $1$ 的开球族已经构成各自度量拓扑的基，故 $\bar{d}$ 与 $d$ 生成完全相同的拓扑。$\square$

> [!note] **引理 20.2（度量拓扑粗细的开球比较准则）** ^theorem-20-2
> 设 $d$ 和 $d'$ 是同一个集合 $X$ 上的两个度量，它们诱导的拓扑分别为 $\mathcal{T}$ 和 $\mathcal{T}'$。则 $\mathcal{T}'$ 比 $\mathcal{T}$ **更细**（即 $\mathcal{T} \subseteq \mathcal{T}'$），当且仅当对每一个点 $x \in X$ 和每一个 $\varepsilon > 0$，都存在 $\delta > 0$ 使得：
> $$B_{d'}(x, \delta) \subseteq B_d(x, \varepsilon)$$

**证明**：- 如果 $\mathcal{T} \subseteq \mathcal{T}'$，因为 $B_d(x, \varepsilon) \in \mathcal{T} \subseteq \mathcal{T}'$ 在 $\mathcal{T}'$ 中是开集，由度量拓扑开集判据知在点 $x$ 处必存在 $\delta > 0$ 使得 $B_{d'}(x, \delta) \subseteq B_d(x, \varepsilon)$；反之，若该包含关系恒成立，直接应用引理 13.3（基的粗细比较准则）即得 $\mathcal{T} \subseteq \mathcal{T}'$。$\square$

## 20.3 $\mathbb{R}^n$ 与 $\mathbb{R}^\omega$ 上的度量及一致度量

### 1. $\mathbb{R}^n$ 上的欧氏度量与方框度量

在 $n$ 维欧氏空间 $\mathbb{R}^n$ 上，对任意 $\mathbf{x} = (x_1, \dots, x_n)$ 和 $\mathbf{y} = (y_1, \dots, y_n)$，定义：
- **欧氏度量（Euclidean metric）**：$d(\mathbf{x}, \mathbf{y}) = \sqrt{\sum_{i=1}^n (x_i - y_i)^2}$；
- **方框度量（Square metric）**：$\rho(\mathbf{x}, \mathbf{y}) = \max_{1 \leqslant i \leqslant n} |x_i - y_i|$。

> [!note] **定理 20.3（$\mathbb{R}^n$ 上的欧氏度量、方框度量与积拓扑一致）** ^theorem-20-3
> 在 $\mathbb{R}^n$ 上，欧氏度量 $d$ 与方框度量 $\rho$ 诱导的拓扑都等于 $\mathbb{R}^n$ 上的**积拓扑**。

**证明**：对任意 $\mathbf{x}, \mathbf{y} \in \mathbb{R}^n$，显然有代数不等式：
$$\rho(\mathbf{x}, \mathbf{y}) \leqslant d(\mathbf{x}, \mathbf{y}) \leqslant \sqrt{n} \, \rho(\mathbf{x}, \mathbf{y})$$
这直接给出开球的双向包含关系：
$$B_d(\mathbf{x}, \varepsilon) \subseteq B_\rho(\mathbf{x}, \varepsilon) \quad \text{且} \quad B_\rho\bigl(\mathbf{x}, \varepsilon/\sqrt{n}\bigr) \subseteq B_d(\mathbf{x}, \varepsilon)$$
由引理 20.2 知 $d$ 与 $\rho$ 诱导完全相同的拓扑。又因为方框度量 $\rho$ 下的开球 $B_\rho(\mathbf{x}, \varepsilon) = \prod_{i=1}^n (x_i - \varepsilon, x_i + \varepsilon)$ 恰好是开立方体（积拓扑的基元素），故它们诱导的拓扑就是 $\mathbb{R}^n$ 的积拓扑。$\square$

### 2. 离散度量、有界集定义与一般函数空间 $Y^J$ 上的一致度量

> [!example] **例 20.3（一般集合 $X$ 上的离散度量 / Discrete Metric）**
> 在任意集合 $X$ 上定义 $d(x, y) = 0$（当 $x = y$）、$d(x, y) = 1$（当 $x \neq y$）。易证 $d$ 满足三条度量公理，称为 $X$ 上的**离散度量**；由于半径为 $1/2$ 的开球 $B_d(x, 1/2) = \{x\}$ 恰为单点集，$d$ 诱导的度量拓扑就是 $X$ 上的**离散拓扑**。

> [!note] **定义 20.3 补充（有界集 / Bounded Set 与直径 / Diameter）**
> 设 $(X, d)$ 是度量空间，子集 $A \subseteq X$ 称为在 $(X, d)$ 中是**有界的（bounded）**，如果存在实数 $M > 0$，使得对所有 $a_1, a_2 \in A$ 均有 $d(a_1, a_2) \leqslant M$。非空有界集 $A$ 的**直径（diameter）**定义为：
> $$\operatorname{diam}(A) = \sup\{d(a_1, a_2) \mid a_1, a_2 \in A\}$$
> （注意：**有界性依赖于具体度量的选取，不是拓扑性质**！由于标准有界度量 $\bar{d}(x, y) = \min\{d(x, y), 1\}$ 与原度量 $d$ 诱导完全相同的拓扑，但全空间 $X$ 在 $\bar{d}$ 下恒有界且直径不超过 $1$。）

> [!note] **定义 20.4（一般度量空间乘积 $Y^J$ 上的一致度量 / Uniform Metric 与 一致拓扑）**
> 设 $(Y, d)$ 是**任意度量空间**，$J$ 是任意非空指标集（若 $J = \varnothing$ 则乘积为单点集，约定该唯一点的自距为 $0$）。记 $\bar{d}(a, b) = \min\{d(a, b), 1\}$ 为 $(Y, d)$ 上的标准有界度量。在乘积集合 $Y^J = \prod_{\alpha \in J} Y$（即全体从 $J$ 到 $Y$ 的映射空间）上，定义两个点 $\mathbf{x} = (x_\alpha)_{\alpha \in J}$ 与 $\mathbf{y} = (y_\alpha)_{\alpha \in J}$ 之间的 **一致度量（uniform metric）** $\bar{\rho}$ 为：
> $$\bar{\rho}(\mathbf{x}, \mathbf{y}) = \sup_{\alpha \in J} \bar{d}(x_\alpha, y_\alpha)$$
> （当 $Y = \mathbb{R}$ 赋予欧氏度量 $d(a, b) = |a - b|$ 时，即为 $\bar{d}(a, b) = \min\{|a - b|, 1\}$。）由于对每个 $\alpha$ 恒有 $0 \leqslant \bar{d}(x_\alpha, y_\alpha) \leqslant 1$，上确界 $\bar{\rho}(\mathbf{x}, \mathbf{y}) \in [0, 1]$ 恒为有限实数。
> - **验证 $\bar{\rho}$ 是 $Y^J$ 上的度量**：非负性与对称性显然；$\bar{\rho}(\mathbf{x}, \mathbf{y}) = 0 \iff \forall \alpha \in J, \, \bar{d}(x_\alpha, y_\alpha) = 0 \iff \forall \alpha \in J, \, x_\alpha = y_\alpha \iff \mathbf{x} = \mathbf{y}$；三角不等式由对每个 $\alpha \in J$ 的 $\bar{d}(x_\alpha, z_\alpha) \leqslant \bar{d}(x_\alpha, y_\alpha) + \bar{d}(y_\alpha, z_\alpha) \leqslant \bar{\rho}(\mathbf{x}, \mathbf{y}) + \bar{\rho}(\mathbf{y}, \mathbf{z})$ 两端对 $\alpha \in J$ 取上确界直接得到。
> 由 $\bar{\rho}$ 诱导的拓扑称为 $Y^J$ 上的 **一致拓扑（uniform topology）**。

> [!note] **定理 20.4（一致拓扑夹在积拓扑与箱拓扑之间）** ^theorem-20-4
> 在 $\mathbb{R}^J$ 上，一致拓扑比积拓扑更细，同时比箱拓扑更粗；当指标集 $J$ 是无穷集时，这三个拓扑互不相同（严格包含）：
> $$\mathcal{T}_{\text{prod}} \subsetneq \mathcal{T}_{\text{unif}} \subsetneq \mathcal{T}_{\text{box}}$$

**证明**：
1. **包含关系 $\mathcal{T}_{\text{unif}} \subseteq \mathcal{T}_{\text{box}}$**：任取一致度量开球 $B_{\bar{\rho}}(\mathbf{x}, \varepsilon)$（不妨设 $0 < \varepsilon < 1$）。若点 $\mathbf{y}$ 属于箱拓扑开集 $U = \prod_{\alpha \in J} (x_\alpha - \varepsilon/2, x_\alpha + \varepsilon/2)$，则对所有 $\alpha$ 有 $|x_\alpha - y_\alpha| < \varepsilon/2$，取上确界得 $\bar{\rho}(\mathbf{x}, \mathbf{y}) \leqslant \varepsilon/2 < \varepsilon$。故 $\mathbf{x} \in U \subseteq B_{\bar{\rho}}(\mathbf{x}, \varepsilon)$，箱拓扑细于一致拓扑。
2. **包含关系 $\mathcal{T}_{\text{prod}} \subseteq \mathcal{T}_{\text{unif}}$**：任取积拓扑的子基元素 $\pi_\beta^{-1}(U_\beta)$ 及 $\mathbf{x} \in \pi_\beta^{-1}(U_\beta)$。取 $0 < \varepsilon < 1$ 使 $(x_\beta - \varepsilon, x_\beta + \varepsilon) \subseteq U_\beta$，则一致开球 $B_{\bar{\rho}}(\mathbf{x}, \varepsilon) \subseteq \pi_\beta^{-1}(U_\beta)$，故一致拓扑细于积拓扑。
3. **当 $J$ 为无穷集时的严格包含关系**：由于 $J$ 是无穷集，由定理 9.1 可从 $J$ 中选出一列互异的可数无穷指标序列 $\{\alpha_1, \alpha_2, \alpha_3, \dots\} \subseteq J$：
   - **$\mathcal{T}_{\text{prod}} \subsetneq \mathcal{T}_{\text{unif}}$**：考察原点 $\mathbf{0}$ 的一致开球 $B_{\bar{\rho}}(\mathbf{0}, 1/2)$。对于包含 $\mathbf{0}$ 的任意积拓扑基开集 $V = \prod_{\alpha \in J} V_\alpha$，由于仅有有限个指标满足 $V_\alpha \neq \mathbb{R}$，必存在某个下标 $k$ 使得 $V_{\alpha_k} = \mathbb{R}$。取仅在第 $\alpha_k$ 个坐标处为 $1$、其余坐标全为 $0$ 的点 $\mathbf{e}^{(k)}$，则 $\mathbf{e}^{(k)} \in V$，但 $\bar{\rho}(\mathbf{e}^{(k)}, \mathbf{0}) = 1 \geqslant 1/2$，即 $V \not\subseteq B_{\bar{\rho}}(\mathbf{0}, 1/2)$（等价地，序列 $\mathbf{e}^{(k)}$ 在积拓扑下逐坐标收敛于 $\mathbf{0}$，但在一致拓扑下与 $\mathbf{0}$ 距离恒为 $1$ 而不收敛）。故 $B_{\bar{\rho}}(\mathbf{0}, 1/2) \notin \mathcal{T}_{\text{prod}}$。
   - **$\mathcal{T}_{\text{unif}} \subsetneq \mathcal{T}_{\text{box}}$**：考察包含 $\mathbf{0}$ 的箱拓扑开集 $W = \prod_{\alpha \in J} W_\alpha$，其中对 $n \in \mathbb{Z}_+$ 取 $W_{\alpha_n} = (-1/n, 1/n)$，对其余 $\alpha \notin \{\alpha_1, \alpha_2, \dots\}$ 取 $W_\alpha = \mathbb{R}$。对 $\mathbf{0}$ 的任意一致开球 $B_{\bar{\rho}}(\mathbf{0}, \varepsilon)$（$\varepsilon > 0$），取正整数 $m > 2/\varepsilon$，并令点 $\mathbf{z}$ 在第 $\alpha_m$ 个坐标处取 $\varepsilon/2$、其余坐标取 $0$，则 $\bar{\rho}(\mathbf{z}, \mathbf{0}) = \min\{\varepsilon/2, 1\} < \varepsilon$（即 $\mathbf{z} \in B_{\bar{\rho}}(\mathbf{0}, \varepsilon)$），但其第 $\alpha_m$ 坐标 $\varepsilon/2 > 1/m$ 不属于 $W_{\alpha_m}$！故不存在任何一致开球包含于 $W$ 中，$W \notin \mathcal{T}_{\text{unif}}$。$\square$

最后，对于可数无穷乘积 $\mathbb{R}^\omega$，虽然一致度量 $\bar{\rho}$ 诱导的不是积拓扑，但我们可以通过给第 $n$ 个坐标乘以衰减权重 $1/n$，构造出恰好诱导积拓扑的度量 $D$：

> [!note] **定理 20.5（$\mathbb{R}^\omega$ 上的积拓扑可度量化定理）** ^theorem-20-5
> 在可数无穷乘积 $\mathbb{R}^\omega$ 上定义函数 $D: \mathbb{R}^\omega \times \mathbb{R}^\omega \to \mathbb{R}$ 为：
> $$D(\mathbf{x}, \mathbf{y}) = \sup_{n \in \mathbb{Z}_+} \left\{ \frac{\bar{d}(x_n, y_n)}{n} \right\}$$
> 其中 $\bar{d}(a, b) = \min\{|a - b|, 1\}$。则 **$D$ 是 $\mathbb{R}^\omega$ 上的一个度量，且由 $D$ 诱导的度量拓扑恰好就是 $\mathbb{R}^\omega$ 上的积拓扑**。

**证明**：
1. **$D$ 是度量**：正定性与对称性显然，三角不等式由 $\frac{\bar{d}(x_n, z_n)}{n} \leqslant \frac{\bar{d}(x_n, y_n)}{n} + \frac{\bar{d}(y_n, z_n)}{n} \leqslant D(\mathbf{x}, \mathbf{y}) + D(\mathbf{y}, \mathbf{z})$ 对 $n$ 取上确界即得。
2. **证明积拓扑细于 $D$-度量拓扑（每个 $D$-开球包含一个积拓扑基邻域）**：
   任取 $\mathbf{x} \in \mathbb{R}^\omega$ 及 $\varepsilon > 0$，考察开球 $B_D(\mathbf{x}, \varepsilon)$。选取充分大的正整数 $N$，使得
   $$\frac{1}{N} < \varepsilon$$
   构造积拓扑的基开集（仅约束前 $N$ 个坐标，且每个区间半径取为 $\varepsilon/2$）：
   $$U = \left(x_1 - \frac{\varepsilon}{2}, \, x_1 + \frac{\varepsilon}{2}\right) \times \left(x_2 - \frac{\varepsilon}{2}, \, x_2 + \frac{\varepsilon}{2}\right) \times \cdots \times \left(x_N - \frac{\varepsilon}{2}, \, x_N + \frac{\varepsilon}{2}\right) \times \mathbb{R} \times \mathbb{R} \times \cdots$$
   对任意 $\mathbf{y} \in U$：
   - 当 $1 \leqslant n \leqslant N$ 时，由于 $|x_n - y_n| < \varepsilon/2$，有 $\frac{\bar{d}(x_n, y_n)}{n} \leqslant \bar{d}(x_n, y_n) < \frac{\varepsilon}{2}$；
   - 当 $n > N$ 时，由于分子恒满足 $\bar{d}(x_n, y_n) \leqslant 1$，有 $\frac{\bar{d}(x_n, y_n)}{n} \leqslant \frac{1}{N+1} < \frac{1}{N} < \varepsilon$。
   因此对所有 $n \in \mathbb{Z}_+$ 取上确界，恒有严格界：
   $$D(\mathbf{x}, \mathbf{y}) = \sup_{n \in \mathbb{Z}_+} \frac{\bar{d}(x_n, y_n)}{n} \leqslant \max\left\{\frac{\varepsilon}{2}, \, \frac{1}{N+1}\right\} < \varepsilon$$
   从而 $\mathbf{y} \in B_D(\mathbf{x}, \varepsilon)$，即 $\mathbf{x} \in U \subseteq B_D(\mathbf{x}, \varepsilon)$！
3. **证明 $D$-度量拓扑细于积拓扑**：任取积拓扑的子基开集 $\pi_n^{-1}(U_n)$ 及 $\mathbf{x} \in \pi_n^{-1}(U_n)$。取 $0 < \varepsilon < 1$ 使 $(x_n - \varepsilon, x_n + \varepsilon) \subseteq U_n$，令 $\delta = \varepsilon / n$。则对任意 $\mathbf{y} \in B_D(\mathbf{x}, \delta)$，有 $\frac{\bar{d}(x_n, y_n)}{n} \leqslant D(\mathbf{x}, \mathbf{y}) < \frac{\varepsilon}{n}$，即 $\bar{d}(x_n, y_n) < \varepsilon < 1$，故 $|x_n - y_n| < \varepsilon$，即 $\mathbf{y} \in \pi_n^{-1}(U_n)$。
综合两方面，度量 $D$ 诱导的拓扑与 $\mathbb{R}^\omega$ 的积拓扑完全一致。$\square$

## 20.4 习题解析

> [!question] **习题 20.1（原笔记题 & 原书 §20 Exercise 1(a), p. 126：欧氏度量 $d$、方框度量 $\rho$ 与出租车度量 $d_1$ 的拓扑等价性）**
> 在 $\mathbb{R}^n$ 上定义**出租车度量（taxicab metric / $\ell^1$ 度量）**为 $d_1(\mathbf{x}, \mathbf{y}) = \sum_{i=1}^n |x_i - y_i|$。证明欧氏度量 $d$、方框度量 $\rho(\mathbf{x}, \mathbf{y}) = \max_{1 \leqslant i \leqslant n}|x_i - y_i|$ 与出租车度量 $d_1$ 在 $\mathbb{R}^n$ 上诱导完全相同的拓扑。

**证明**：对任意 $\mathbf{x}, \mathbf{y} \in \mathbb{R}^n$，直接比较每一项与最大项可得如下双向代数不等式：
$$\rho(\mathbf{x}, \mathbf{y}) \leqslant d(\mathbf{x}, \mathbf{y}) \leqslant \sqrt{n}\,\rho(\mathbf{x}, \mathbf{y}), \qquad \rho(\mathbf{x}, \mathbf{y}) \leqslant d_1(\mathbf{x}, \mathbf{y}) \leqslant n\,\rho(\mathbf{x}, \mathbf{y})$$
这直接给出开球的相互包含关系：
$$B_{d_1}(\mathbf{x}, \varepsilon) \subseteq B_\rho(\mathbf{x}, \varepsilon) \quad \text{且} \quad B_\rho(\mathbf{x}, \varepsilon/n) \subseteq B_{d_1}(\mathbf{x}, \varepsilon)$$
结合定理 20.3 已证的 $\mathcal{T}_d = \mathcal{T}_\rho$，由引理 20.2 立知 $d, \rho, d_1$ 三者在 $\mathbb{R}^n$ 上诱导完全相同的标准拓扑。$\square$

> [!question] **习题 20.2（原书 §20 Exercise 2, p. 126）**
> 证明在字典序下的 $\mathbb{R} \times \mathbb{R}$ 是可度量化的。

**证明**：由习题 16.9 知，字典序下的 $\mathbb{R} \times \mathbb{R}$ 恰好同胚于积空间 $\mathbb{R}_d \times \mathbb{R}$（其中 $\mathbb{R}_d$ 赋予离散度量 $d_0(x_1, x_2) = 1$ 当 $x_1 \neq x_2$，$\mathbb{R}$ 赋予标准有界度量 $\bar{d}(y_1, y_2) = \min\{|y_1 - y_2|, 1\}$）。在 $\mathbb{R}^2$ 上定义度量：
$$\rho\bigl((x_1, y_1), (x_2, y_2)\bigr) = \max\bigl\{d_0(x_1, x_2), \, \bar{d}(y_1, y_2)\bigr\} = \begin{cases} 1, & \text{若 } x_1 \neq x_2, \\ \min\{|y_1 - y_2|, 1\}, & \text{若 } x_1 = x_2. \end{cases}$$
当 $0 < \varepsilon < 1$ 时，$\rho$-开球 $B_\rho\bigl((x_0, y_0), \varepsilon\bigr) = \{x_0\} \times (y_0 - \varepsilon, y_0 + \varepsilon)$ 恰好是开铅垂线段，而全体开铅垂线段正是 $\mathbb{R}^2$ 字典序拓扑的基！因此 $\rho$ 诱导的度量拓扑就是 $\mathbb{R}^2$ 的字典序拓扑。$\square$

> [!question] **原笔记补充命题（点到非空集合的距离函数连续性与闭包判据）**
> 设 $(X, d)$ 是度量空间，$A \subseteq X$ 为非空子集。对任意 $x \in X$，定义点 $x$ 到集合 $A$ 的距离为
> $$d(x, A) = \inf\{d(x, a) \mid a \in A\}$$
> 证明：$x \in \overline{A} \iff d(x, A) = 0$（并且函数 $x \mapsto d(x, A)$ 是 $X$ 上的连续函数）。

**证明**：
- **($\Rightarrow$)**：若 $x \in \overline{A}$，则对任意 $\varepsilon > 0$，开球 $B_d(x, \varepsilon)$ 与 $A$ 相交，即存在 $a \in A$ 使得 $d(x, a) < \varepsilon$。由下确界定义得 $0 \leqslant d(x, A) \leqslant d(x, a) < \varepsilon$。由 $\varepsilon > 0$ 的任意性立得 $d(x, A) = 0$。
- **($\Leftarrow$)**：若 $d(x, A) = 0$，则对包含 $x$ 的任意开球 $B_d(x, \varepsilon)$（$\varepsilon > 0$），由下确界性质必存在 $a \in A$ 使得 $d(x, a) < \varepsilon$，即 $a \in B_d(x, \varepsilon) \cap A \neq \varnothing$。由闭包邻域判据（定理 17.5）知 $x \in \overline{A}$。
- **连续性**：对任意 $x, y \in X$ 和 $a \in A$，由 $d(x, A) \leqslant d(x, a) \leqslant d(x, y) + d(y, a)$ 对 $a \in A$ 取下确界得 $d(x, A) - d(y, A) \leqslant d(x, y)$，互换 $x, y$ 即得 $|d(x, A) - d(y, A)| \leqslant d(x, y)$（$1$-Lipschitz 连续）。$\square$

> [!question] **习题 20.5（原书 §20 Exercise 5 / 关联 §20 Exercise 4(a), p. 127：$\mathbb{R}^\infty$ 在一致拓扑下的闭包）**
> 在 $\mathbb{R}^\omega$ 中考察集合 $\mathbb{R}^\infty$（全体最终为 $0$ 的序列）。求 $\mathbb{R}^\infty$ 在一致拓扑下的闭包。

**解**：**在一致拓扑下，$\overline{\mathbb{R}^\infty} = c_0$（即全体收敛于 $0$ 的实数列空间，$\lim_{n \to \infty} x_n = 0$）**：
- **若 $\mathbf{x} \in c_0$（即 $x_n \to 0$）**：对任意 $\varepsilon > 0$，存在 $N$ 使得当 $n > N$ 时 $|x_n| < \varepsilon/2$。取截断序列 $\mathbf{y} = (x_1, \dots, x_N, 0, 0, \dots) \in \mathbb{R}^\infty$，则 $\bar{\rho}(\mathbf{x}, \mathbf{y}) = \sup_{n > N} \bar{d}(x_n, 0) \leqslant \varepsilon/2 < \varepsilon$，故 $\mathbf{x} \in \overline{\mathbb{R}^\infty}$。
- **若 $\mathbf{x} \in \overline{\mathbb{R}^\infty}$**：对任意 $0 < \varepsilon < 1$，存在 $\mathbf{y} \in \mathbb{R}^\infty$ 使得 $\bar{\rho}(\mathbf{x}, \mathbf{y}) < \varepsilon$。因为 $\mathbf{y} \in \mathbb{R}^\infty$，存在 $N$ 使得当 $n > N$ 时 $y_n = 0$。于是当 $n > N$ 时，$\bar{d}(x_n, 0) = \bar{d}(x_n, y_n) \leqslant \bar{\rho}(\mathbf{x}, \mathbf{y}) < \varepsilon$，即 $|x_n| < \varepsilon$。这说明 $\lim_{n \to \infty} x_n = 0$，即 $\mathbf{x} \in c_0$。$\square$

> [!question] **习题 20.8（原书 §20 Exercise 8(a)(b)(c) 完整解答, pp. 127–128：$\ell^2$、$\mathbb{R}^\infty$ 与 Hilbert 立方体 $H$ 上的四种拓扑比较）**
> 设 $X = \ell^2 \subseteq \mathbb{R}^\omega$ 为全体平方可和实序列构成的集合（$\sum_{n=1}^\infty x_n^2 < \infty$），其上的 $\ell^2$-度量为 $d(\mathbf{x}, \mathbf{y}) = \bigl[\sum_{n=1}^\infty (x_n - y_n)^2\bigr]^{1/2}$。
> (a) 比较 $X = \ell^2$ 上的四种拓扑：从 $\mathbb{R}^\omega$ 继承的子空间积拓扑 $\mathcal{T}_{\text{prod}}$、子空间一致拓扑 $\mathcal{T}_{\text{unif}}$、$\ell^2$-度量拓扑 $\mathcal{T}_{\ell^2}$ 以及子空间箱拓扑 $\mathcal{T}_{\text{box}}$；
> (b) 将上述四种拓扑限制到有限支撑序列子集 $\mathbb{R}^\infty \subset \ell^2$ 上，比较它们的粗细关系；
> (c) 将上述四种拓扑限制到 **Hilbert 立方体（Hilbert cube）** $H = \prod_{n=1}^\infty [0, 1/n] \subset \ell^2$ 上，比较它们的粗细关系。

**证明**：
- **(a) 在 $X = \ell^2$ 上，四个拓扑满足严格递增的精细关系**：
  $$\mathcal{T}_{\text{prod}} \subsetneq \mathcal{T}_{\text{unif}} \subsetneq \mathcal{T}_{\ell^2} \subsetneq \mathcal{T}_{\text{box}}$$
  1. **$\mathcal{T}_{\text{prod}} \subsetneq \mathcal{T}_{\text{unif}}$**：由定理 20.4 知在母空间 $\mathbb{R}^\omega$ 上 $\mathcal{T}_{\text{prod}} \subseteq \mathcal{T}_{\text{unif}}$，故限制到 $\ell^2$ 上仍有包含关系。**严格性**：考察标准单位向量序列 $\mathbf{e}^{(k)} = (0, \dots, 0, 1, 0, \dots) \in \ell^2$（第 $k$ 项为 $1$）。对每个固定的坐标指标 $n$，当 $k > n$ 时第 $n$ 个坐标恒为 $0$，故 $\mathbf{e}^{(k)}$ 在 $\mathcal{T}_{\text{prod}}$ 下收敛于 $\mathbf{0}$；但 $\bar{\rho}(\mathbf{e}^{(k)}, \mathbf{0}) = 1 \not\to 0$，故 $\mathbf{e}^{(k)}$ 在 $\mathcal{T}_{\text{unif}}$ 下不收敛于 $\mathbf{0}$（即一致开球 $B_{\bar{\rho}}(\mathbf{0}, 1/2) \cap \ell^2 \notin \mathcal{T}_{\text{prod}}$）。
  2. **$\mathcal{T}_{\text{unif}} \subsetneq \mathcal{T}_{\ell^2}$**：因为对任意 $n$ 有 $|x_n - y_n| \leqslant \bigl[\sum_{k=1}^\infty (x_k - y_k)^2\bigr]^{1/2} = d(\mathbf{x}, \mathbf{y})$，故 $\bar{\rho}(\mathbf{x}, \mathbf{y}) \leqslant d(\mathbf{x}, \mathbf{y})$，从而 $B_d(\mathbf{x}, \varepsilon) \subseteq B_{\bar{\rho}}(\mathbf{x}, \varepsilon) \cap \ell^2$。**严格性**：取序列 $\mathbf{x}^{(k)} = (\underbrace{1/k, \dots, 1/k}_{k^2 \text{ 个}}, 0, 0, \dots) \in \ell^2$，则 $\bar{\rho}(\mathbf{x}^{(k)}, \mathbf{0}) = 1/k \to 0$（在一致拓扑下收敛于 $\mathbf{0}$），但 $d(\mathbf{x}^{(k)}, \mathbf{0}) = \sqrt{k^2 \cdot (1/k^2)} = 1 \not\to 0$（在 $\ell^2$ 中不收敛于 $\mathbf{0}$）。
  3. **$\mathcal{T}_{\ell^2} \subsetneq \mathcal{T}_{\text{box}}$**：对任意 $\mathbf{x} \in \ell^2$ 和 $\varepsilon > 0$，取箱开集 $U = \prod_{n=1}^\infty (x_n - \frac{\varepsilon}{2^n}, x_n + \frac{\varepsilon}{2^n}) \cap \ell^2$，则对 $\mathbf{y} \in U$ 有 $d(\mathbf{x}, \mathbf{y}) < \varepsilon \sqrt{\sum_{n=1}^\infty 4^{-n}} = \frac{\varepsilon}{\sqrt{3}} < \varepsilon$，即 $U \subseteq B_d(\mathbf{x}, \varepsilon)$。**严格性**：取点列 $\mathbf{z}^{(k)} = \frac{1}{k}\mathbf{e}^{(k)} = (0, \dots, 0, 1/k, 0, \dots) \in \ell^2$，则 $d(\mathbf{z}^{(k)}, \mathbf{0}) = 1/k \to 0$（在 $\ell^2$ 中收敛于 $\mathbf{0}$）；但考察包含 $\mathbf{0}$ 的箱邻域 $W = \prod_{n=1}^\infty \bigl(-\frac{1}{2n}, \frac{1}{2n}\bigr) \cap \ell^2$，对任意 $k \geqslant 1$，$\mathbf{z}^{(k)}$ 的第 $k$ 个坐标为 $\frac{1}{k} \notin \bigl(-\frac{1}{2k}, \frac{1}{2k}\bigr)$，故对所有 $k$ 均有 $\mathbf{z}^{(k)} \notin W$，即 $\mathbf{z}^{(k)}$ 在箱拓扑下不收敛于 $\mathbf{0}$（$W \notin \mathcal{T}_{\ell^2}$）。
- **(b) 在 $\mathbb{R}^\infty$ 上，四种拓扑依然严格互不相同**：
  $$\mathcal{T}_{\text{prod}}|_{\mathbb{R}^\infty} \subsetneq \mathcal{T}_{\text{unif}}|_{\mathbb{R}^\infty} \subsetneq \mathcal{T}_{\ell^2}|_{\mathbb{R}^\infty} \subsetneq \mathcal{T}_{\text{box}}|_{\mathbb{R}^\infty}$$
  因为 (a) 中构造的三组区分点列 $\mathbf{e}^{(k)}$、$\mathbf{x}^{(k)}$ 和 $\mathbf{z}^{(k)}$ 全都只有有限个非零坐标，本身全都属于 $\mathbb{R}^\infty$！
- **(c) 在 Hilbert 立方体 $H = \prod_{n=1}^\infty [0, 1/n]$ 上，前三种拓扑完全重合，且严格粗于箱拓扑**：
  $$\mathcal{T}_{\text{prod}}|_H = \mathcal{T}_{\text{unif}}|_H = \mathcal{T}_{\ell^2}|_H \subsetneq \mathcal{T}_{\text{box}}|_H$$
  - **证明 $\mathcal{T}_{\ell^2}|_H \subseteq \mathcal{T}_{\text{prod}}|_H$**：任取 $\mathbf{x} \in H$ 及 $\varepsilon > 0$。由于级数 $\sum_{n=1}^\infty \frac{1}{n^2} < \infty$ 收敛，存在正整数 $N$ 使得尾部和满足 $\sum_{n=N+1}^\infty \frac{1}{n^2} < \frac{\varepsilon^2}{2}$。在 $H$ 的子空间积拓扑中取包含 $\mathbf{x}$ 的开邻域：
    $$V = \left\{\mathbf{y} \in H \;\middle|\; \forall 1 \leqslant n \leqslant N, \, |x_n - y_n| < \frac{\varepsilon}{\sqrt{2N}}\right\}$$
    则对任意 $\mathbf{y} \in V \subseteq H$，由于当 $n > N$ 时 $x_n, y_n \in [0, 1/n] \implies |x_n - y_n| \leqslant 1/n$，立得：
    $$d(\mathbf{x}, \mathbf{y})^2 = \sum_{n=1}^N |x_n - y_n|^2 + \sum_{n=N+1}^\infty |x_n - y_n|^2 < N \cdot \frac{\varepsilon^2}{2N} + \sum_{n=N+1}^\infty \frac{1}{n^2} < \frac{\varepsilon^2}{2} + \frac{\varepsilon^2}{2} = \varepsilon^2$$
    即 $\mathbf{x} \in V \subseteq B_d(\mathbf{x}, \varepsilon) \cap H$！结合 $\mathcal{T}_{\text{prod}}|_H \subseteq \mathcal{T}_{\text{unif}}|_H \subseteq \mathcal{T}_{\ell^2}|_H$，立得前三种拓扑在 $H$ 上完全相等。
  - **证明 $\mathcal{T}_{\ell^2}|_H \subsetneq \mathcal{T}_{\text{box}}|_H$**：点列 $\mathbf{z}^{(k)} = \frac{1}{k}\mathbf{e}^{(k)}$ 的第 $k$ 坐标为 $1/k \in [0, 1/k]$，其余坐标为 $0$，故 $\mathbf{z}^{(k)} \in H$。它在 $\ell^2$（从而在前三种拓扑）下收敛于 $\mathbf{0} \in H$，但始终不落入箱拓扑开邻域 $\prod_{n=1}^\infty (-\frac{1}{2n}, \frac{1}{2n}) \cap H$ 中，故箱拓扑在 $H$ 上仍严格细于前三种拓扑。$\square$

## 相关链接

- 上一节: [[19_The_Product_Topology|§19 The Product Topology]]
- 下一节: [[21_The_Metric_Topology_II|§21 The Metric Topology (II)]]
- 返回总览: [[00_Chapter_02_Overview|Chapter 2 Overview]]
