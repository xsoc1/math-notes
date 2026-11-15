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
> 度量空间中的 $\varepsilon$-$\delta$ 连续性如何与一般拓扑连续性无缝衔接？为什么在一般拓扑空间中“用收敛序列刻画闭包与连续性”会失效，而在度量空间（以及第一可数空间）中序列引理却完全有效？函数列的**一致收敛定理**在拓扑空间中又是如何证明的？

## 21.1 度量空间中的连续性与序列引理（Sequence Lemma）

> [!note] **定理 21.1（度量拓扑下连续性的 $\varepsilon$-$\delta$ 充要判据）** ^theorem-21-1
> 设 $f: X \to Y$ 是两个度量空间 $(X, d_X)$ 与 $(Y, d_Y)$ 之间的映射。则 $f$ 关于各自的度量拓扑是连续映射，当且仅当对于每一个 $x \in X$ 和每一个 $\varepsilon > 0$，都存在 $\delta > 0$ 使得：
> $$d_X(x, y) < \delta \implies d_Y\bigl(f(x), f(y)\bigr) < \varepsilon$$
> （用开球语言表述即为：$f\bigl(B_{d_X}(x, \delta)\bigr) \subseteq B_{d_Y}\bigl(f(x), \varepsilon\bigr)$。）

**证明**：
- ($\Rightarrow$)：设 $f$ 连续。对任意 $x \in X$ 和 $\varepsilon > 0$，开球 $B_{d_Y}(f(x), \varepsilon)$ 是 $Y$ 中的开集，故其原像 $f^{-1}\bigl(B_{d_Y}(f(x), \varepsilon)\bigr)$ 是 $X$ 中包含点 $x$ 的开集。由度量拓扑开集判据，存在 $\delta > 0$ 使得开球 $B_{d_X}(x, \delta) \subseteq f^{-1}\bigl(B_{d_Y}(f(x), \varepsilon)\bigr)$，即 $f\bigl(B_{d_X}(x, \delta)\bigr) \subseteq B_{d_Y}(f(x), \varepsilon)$。
- ($\Leftarrow$)：假设 $\varepsilon$-$\delta$ 条件成立。任取 $Y$ 中的开集 $V$ 及原像中的任意点 $x \in f^{-1}(V)$。因为 $f(x) \in V$ 且 $V$ 在 $Y$ 中开，存在 $\varepsilon > 0$ 使得 $B_{d_Y}(f(x), \varepsilon) \subseteq V$。由假设存在 $\delta > 0$ 使得 $f\bigl(B_{d_X}(x, \delta)\bigr) \subseteq B_{d_Y}(f(x), \varepsilon) \subseteq V$，从而 $x \in B_{d_X}(x, \delta) \subseteq f^{-1}(V)$。这说明 $f^{-1}(V)$ 是 $X$ 中的开集，故 $f$ 连续。$\square$

### 序列引理（The Sequence Lemma）与第一可数性

在数学分析中，我们习惯于用收敛序列来刻画闭包（$x \in \overline{A} \iff$ 存在 $x_n \in A$ 使 $x_n \to x$）和连续性（$f$ 连续 $\iff x_n \to x$ 蕴含 $f(x_n) \to f(x)$）。那么在一般拓扑空间中，这两条性质是否依然成立？答案是：**正向在任意拓扑空间中恒成立；逆向在一般拓扑空间中未必成立，但当空间可度量化（或满足 §30 的第一可数公理）时逆向必定成立！**

> [!note] **引理 21.2（序列引理 / The Sequence Lemma）** ^theorem-21-2
> 设 $X$ 是一个拓扑空间，$A \subseteq X$。
> 1. **（一般拓扑空间）** 若存在 $A$ 中的点列 $(x_n)_{n=1}^\infty$ 收敛于点 $x \in X$，则必有 $x \in \overline{A}$；
> 2. **（可度量化空间的逆命题）** 若 $X$ 是**可度量化空间**（赋予度量 $d$），则逆命题也成立：$x \in \overline{A}$ **当且仅当**存在 $A$ 中的点列 $x_n$ 收敛于 $x$。

**证明**：
1. 设 $x_n \in A$ 且 $x_n \to x$。对包含 $x$ 的任意开邻域 $U$，由序列收敛定义存在 $N$ 使得当 $n \geqslant N$ 时 $x_n \in U$。特别地，$x_N \in U \cap A \neq \varnothing$。由闭包邻域判据（定理 17.5）知 $x \in \overline{A}$。
2. 设 $(X, d)$ 是度量空间且 $x \in \overline{A}$。对每一个正整数 $n \in \mathbb{Z}_+$，考察以 $x$ 为中心、半径为 $\frac{1}{n}$ 的开球 $B_d\bigl(x, \frac{1}{n}\bigr)$。因为 $x \in \overline{A}$，必有 $B_d\bigl(x, \frac{1}{n}\bigr) \cap A \neq \varnothing$。我们在该交集中选取一点 $x_n \in B_d\bigl(x, \frac{1}{n}\bigr) \cap A$，则 $x_n \in A$ 且 $d(x_n, x) < \frac{1}{n}$。
   现验证点列 $(x_n)$ 收敛于 $x$：对 $x$ 的任意开邻域 $U$，存在 $\varepsilon > 0$ 使得 $B_d(x, \varepsilon) \subseteq U$。取正整数 $N > 1/\varepsilon$，则当 $n \geqslant N$ 时有 $d(x_n, x) < \frac{1}{n} \leqslant \frac{1}{N} < \varepsilon$，从而 $x_n \in B_d(x, \varepsilon) \subseteq U$。故 $x_n \to x$。$\square$

> [!note] **定理 21.3（连续映射的序列判别法）** ^theorem-21-3
> 设 $f: X \to Y$ 是拓扑空间之间的映射。
> 1. 若 $f$ 连续，则对 $X$ 中任意收敛点列 $x_n \to x$，像点列 $f(x_n)$ 在 $Y$ 中收敛于 $f(x)$；
> 2. 若定义域 $X$ 是**可度量化空间**，则逆命题也成立：若对任意 $x_n \to x$ 均有 $f(x_n) \to f(x)$，则 $f$ 必为连续映射。

**证明**：
1. 设 $f$ 连续且 $x_n \to x$。任取 $f(x)$ 在 $Y$ 中的开邻域 $V$，则 $f^{-1}(V)$ 是 $X$ 中包含 $x$ 的开邻域。因 $x_n \to x$，存在 $N$ 使 $n \geqslant N$ 时 $x_n \in f^{-1}(V)$，即 $f(x_n) \in V$。故 $f(x_n) \to f(x)$。
2. 设 $X$ 可度量化且 $f$ 保持收敛序列极限。我们利用定理 18.1(2)（验证对任意 $A \subseteq X$ 有 $f(\overline{A}) \subseteq \overline{f(A)}$）来证 $f$ 连续。任取 $x \in \overline{A}$。因为 $X$ 可度量化，由引理 21.2(2) 知存在点列 $x_n \in A$ 使得 $x_n \to x$。由题设条件知 $f(x_n) \to f(x)$。由于每个 $f(x_n) \in f(A)$，再由引理 21.2(1) 即得 $f(x) \in \overline{f(A)}$！故 $f(\overline{A}) \subseteq \overline{f(A)}$，$f$ 连续。$\square$

> [!warning] **经典反例（例 21.1 & 21.2）：在箱拓扑或不可数积空间中，闭包不能用序列刻画！**
> 在引理 21.2(2) 的证明中，我们之所以能直接构造出收敛于 $x$ 的点列 $x_n$，是因为度量空间在每一点 $x$ 处都有一族**可数嵌套的邻域基** $\{B_d(x, 1/n)\}_{n=1}^\infty$（这一性质在 §30 中称为**第一可数公理**；注：第一可数性是序列引理逆向成立的**充分条件**而非必要条件——存在不满足第一可数公理但闭包仍可由收敛序列刻画的 Fréchet–Urysohn 空间，例如在 $S = \{p\} \cup \{(n, k) \mid n, k \in \mathbb{Z}_+\}$ 上令各 $(n, k)$ 孤立、$p$ 的基本邻域为 $U_g = \{p\} \cup \{(n, k) \mid k \geqslant g(n)\}$（$g: \mathbb{Z}_+ \to \mathbb{Z}_+$）所得的序列空间）。然而，缺少第一可数公理时该证明不再适用，在下面的无穷箱积空间中序列引理确实彻底失效：
>
> **反例（$\mathbb{R}^\omega$ 的箱拓扑不可度量化）**：在赋予**箱拓扑**的 $\mathbb{R}^\omega$ 中，考察全正坐标集：
> $$A = \bigl\{ (x_1, x_2, x_3, \ldots) \in \mathbb{R}^\omega \;\big|\; \forall n \in \mathbb{Z}_+, \, x_n > 0 \bigr\}$$
> 以及原点 $\mathbf{0} = (0, 0, 0, \ldots)$。
> 1. **原点属于闭包 $\mathbf{0} \in \overline{A}$**：因为包含 $\mathbf{0}$ 的任意箱拓扑基开集 $B = \prod_{n=1}^\infty (a_n, b_n)$ 都满足 $a_n < 0 < b_n$，取 $y_n = \frac{1}{2} b_n > 0$ 即有 $\mathbf{y} = (y_n) \in B \cap A \neq \varnothing$；
> 2. **但 $A$ 中没有任何点列能在箱拓扑下收敛于 $\mathbf{0}$**！（Cantor 对角线法）：假设存在 $A$ 中的点列 $\mathbf{x}^{(k)} = (x_1^{(k)}, x_2^{(k)}, \ldots) \in A$，其中每个 $x_n^{(k)} > 0$。我们取出对角线上的正数 $x_k^{(k)} > 0$，构造箱拓扑中 $\mathbf{0}$ 的开邻域：
>    $$B' = \bigl(-x_1^{(1)}, x_1^{(1)}\bigr) \times \bigl(-x_2^{(2)}, x_2^{(2)}\bigr) \times \cdots \times \bigl(-x_k^{(k)}, x_k^{(k)}\bigr) \times \cdots$$
>    对每一个正整数 $k$，点 $\mathbf{x}^{(k)}$ 的第 $k$ 个坐标 $x_k^{(k)}$ 都不属于开区间 $(-x_k^{(k)}, x_k^{(k)})$，因此**对所有 $k \in \mathbb{Z}_+$ 都有 $\mathbf{x}^{(k)} \notin B'$**！故点列 $\mathbf{x}^{(k)}$ 绝不可能在箱拓扑下收敛于 $\mathbf{0}$。由引理 21.2(2) 立即可知：**$\mathbb{R}^\omega$ 上的箱拓扑是不可度量化的！**

## 21.2 一致收敛极限保持连续性定理

> [!note] **定义 21.1（函数序列的一致收敛 / Uniform Convergence）**
> 设 $X$ 是拓扑空间，$(Y, d)$ 是度量空间，$f_n: X \to Y$（$n \in \mathbb{Z}_+$）是一列函数，$f: X \to Y$ 是一个函数。称函数列 $(f_n)$ 在 $X$ 上 **一致收敛于 $f$（converges uniformly to $f$）**，如果对任意 $\varepsilon > 0$，存在正整数 $N$，使得对**所有 $n \geqslant N$ 和所有 $x \in X$**，同时有：
> $$d\bigl(f_n(x), f(x)\bigr) < \varepsilon$$
> （注：这等价于在 §20 定义 20.4 所建立的一般度量空间乘积 $Y^X$ 的一致度量 $\bar{\rho}(g, h) = \sup_{x \in X} \min\{d(g(x), h(x)), 1\}$ 下，函数点列 $f_n$ 在一致拓扑中收敛于 $f$。特别地，在 $\mathbb{R}^\omega$ 上，积拓扑刻画**逐点收敛**，一致拓扑刻画**一致收敛**，而单位向量序列 $\mathbf{e}_n = (0, \dots, 0, 1, 0, \dots)$ 在积拓扑中收敛于 $\mathbf{0}$，但在一致拓扑中因 $\bar{\rho}(\mathbf{e}_n, \mathbf{0}) = 1$ 不收敛，在箱拓扑中亦不收敛。）

> [!note] **定理 21.4（一致极限保持连续性定理 / Uniform Limit Theorem）** ^theorem-21-4
> 设 $X$ 是任意拓扑空间，$(Y, d)$ 是度量空间。若连续映射序列 $f_n: X \to Y$ 在 $X$ 上**一致收敛**于映射 $f: X \to Y$，则极限映射 $f$ 也是连续的。

**证明（经典的 $\varepsilon/3$ 三段估计法）**：
任取 $Y$ 中的开集 $V$，我们要证明 $f^{-1}(V)$ 在 $X$ 中是开集。为此，任取点 $x_0 \in f^{-1}(V)$，令 $y_0 = f(x_0) \in V$。因为 $V$ 在度量空间 $(Y, d)$ 中是开集，存在半径 $\varepsilon > 0$ 使得开球
$$B_d(y_0, \varepsilon) \subseteq V$$
现利用一致收敛性与 $f_N$ 的连续性分三步构造 $x_0$ 的开邻域 $U$：
1. **利用一致收敛性固定下标 $N$**：对应于正数 $\varepsilon / 3 > 0$，存在正整数 $N$，使得对所有 $n \geqslant N$ 和所有 $x \in X$，恒有：
   $$d\bigl(f_n(x), f(x)\bigr) < \frac{\varepsilon}{3}$$
2. **利用单个函数 $f_N$ 在 $x_0$ 处的连续性选取开邻域 $U$**：对于上面固定的下标 $N$，由于 $f_N: X \to Y$ 连续，开球 $B_d\bigl(f_N(x_0), \varepsilon/3\bigr)$ 的原像 $U = f_N^{-1}\bigl(B_d(f_N(x_0), \varepsilon/3)\bigr)$ 是 $X$ 中包含点 $x_0$ 的一个开邻域，即对所有 $x \in U$ 有：
   $$d\bigl(f_N(x), f_N(x_0)\bigr) < \frac{\varepsilon}{3}$$
3. **三角不等式合成**：于是对任意 $x \in U$，由三角不等式有：
   $$
   \begin{aligned}
   d\bigl(f(x), f(x_0)\bigr) &\leqslant d\bigl(f(x), f_N(x)\bigr) + d\bigl(f_N(x), f_N(x_0)\bigr) + d\bigl(f_N(x_0), f(x_0)\bigr) \\
   &< \frac{\varepsilon}{3} + \frac{\varepsilon}{3} + \frac{\varepsilon}{3} = \varepsilon
   \end{aligned}
   $$
   这表明对所有 $x \in U$ 均有 $f(x) \in B_d(y_0, \varepsilon) \subseteq V$，即 $x_0 \in U \subseteq f^{-1}(V)$。由逐点开邻域判据知 $f^{-1}(V)$ 是 $X$ 中的开集，故 $f$ 连续。$\square$

## 21.3 习题解析

> [!question] **习题 21.1（补充概念题，关联原书 §20.2：有界性不是拓扑不变量）**
> 设 $A \subseteq X$。若 $d$ 和 $d'$ 是 $X$ 上诱导相同拓扑的两个度量，问 $A$ 在 $(X, d)$ 中有界是否蕴含 $A$ 在 $(X, d')$ 中也有界？（注：原书 §21 Exercise 1 为子空间度量化命题，本题对应 §20 关于相容度量有界性的讨论。）

**解**：**不蕴含**！在实数集 $X = \mathbb{R}$ 上，取标准有界度量 $d(x, y) = \min\{|x - y|, 1\}$ 和标准欧氏度量 $d'(x, y) = |x - y|$。由定理 20.1 知 $d$ 与 $d'$ 诱导完全相同的标准拓扑，但取全空间 $A = \mathbb{R}$，它在 $(\mathbb{R}, d)$ 中是**有界集**（对任意 $x, y \in \mathbb{R}$ 有 $d(x, y) \leqslant 1$，直径为 $1$），而在 $(\mathbb{R}, d')$ 中却是**无界集**！$\square$

> [!question] **习题 21.3（原笔记题：度量空间伪紧性与所有相容度量有界的等价刻画）**
> 设 $X$ 是可度量化拓扑空间。证明以下三个条件彼此等价：
> (a) $X$ 关于每一个与拓扑相容的度量都是有界空间；
> (b) $X$ 上的每一个连续实值函数 $f: X \to \mathbb{R}$ 都是有界函数；
> (c) $X$ 是**伪紧空间（pseudocompact space）**（按定义即其上所有连续实值函数均有界）。

**证明**：
- **(b) $\iff$ (c)**：这正是伪紧空间（pseudocompactness）的标准定义。
- **(a) $\implies$ (b)**（逆否证法，无需预先假定紧致性）：设 $d$ 是 $X$ 上的一个相容度量。反设存在某个无界的连续函数 $f: X \to \mathbb{R}$。在 $X$ 上定义新函数：
  $$d_f(x, y) := d(x, y) + |f(x) - f(y)|$$
  容易验证 $d_f$ 满足全部度量公理。并且：一方面因 $d(x, y) \leqslant d_f(x, y)$，有 $B_{d_f}(x, \varepsilon) \subseteq B_d(x, \varepsilon)$；另一方面，对任意 $x \in X$ 和 $\varepsilon > 0$，由于 $f$ 在 $x$ 处关于 $d$ 连续，存在 $0 < \delta < \varepsilon/2$ 使得当 $d(x, y) < \delta$ 时 $|f(x) - f(y)| < \varepsilon/2$，从而 $d_f(x, y) < \delta + \varepsilon/2 < \varepsilon$，即 $B_d(x, \delta) \subseteq B_{d_f}(x, \varepsilon)$！这说明 $d_f$ 是与 $X$ 的拓扑**相容**的度量。然而，由于 $f$ 在 $X$ 上无界，任取基点 $x_0 \in X$，$\sup_{x \in X} d_f(x, x_0) \geqslant \sup_{x \in X} |f(x) - f(x_0)| = +\infty$，即 $X$ 在相容度量 $d_f$ 下无界，与 (a) 矛盾！
- **(b) $\implies$ (a)**：设 $\rho$ 是 $X$ 上任意一个与拓扑相容的度量。若 $X = \varnothing$ 则平凡有界；若 $X \neq \varnothing$，任取定点 $x_0 \in X$，定义函数 $f(x) := \rho(x, x_0): X \to \mathbb{R}$。由三角不等式 $|f(x) - f(y)| \leqslant \rho(x, y)$ 知 $f$ 是连续实值函数。由 (b) 知存在 $M > 0$ 使得对所有 $x \in X$ 有 $\rho(x, x_0) \leqslant M$，再由三角不等式得对任意 $x, y \in X$ 有 $\rho(x, y) \leqslant \rho(x, x_0) + \rho(y, x_0) \leqslant 2M$，故 $X$ 关于 $\rho$ 有界。$\square$

> [!question] **习题 21.6（原笔记题：一致度量球与立方体 $[-1, 1]^\omega$ 在箱拓扑中的非紧性及原稿勘误）**
> 考察 $\mathbb{R}^\omega$ 中的无限维立方体 $[-1, 1]^\omega$（以及一致度量 $\bar{\rho}$ 下的闭球）。证明它在箱拓扑中不是紧致的（紧致性定义见 Chapter 3）。

**证明与原稿勘误**：
1. **关于一致度量闭单位球的勘误说明**：需要注意，对于截断一致度量 $\bar{\rho}(\mathbf{x}, \mathbf{y}) = \sup_{n \geqslant 1} \min\{|x_n - y_n|, 1\}$，由于每一项恒不超过 $1$，半径为 $1$ 的闭球实际上是全空间 $\overline{B}_{\bar{\rho}}(\mathbf{0}, 1) = \{\mathbf{x} \in \mathbb{R}^\omega \mid \bar{\rho}(\mathbf{x}, \mathbf{0}) \leqslant 1\} = \mathbb{R}^\omega$，并不等于 $[-1, 1]^\omega$！若要写成一致度量的闭球，立方体 $[-r, r]^\omega$（其中 $0 < r < 1$）恰好是半径 $r < 1$ 的闭球 $\overline{B}_{\bar{\rho}}(\mathbf{0}, r)$，或者在**有界实序列空间 $\ell^\infty$** 上（注意未截断上确界公式在全空间 $\mathbb{R}^\omega$ 上可取 $+\infty$ 而不构成实值度量），$[-1, 1]^\omega$ 是未截断上确界度量 $\rho(\mathbf{x}, \mathbf{y}) = \sup_{n \geqslant 1} |x_n - y_n|$ 的闭单位球。
2. **在箱拓扑中非紧的证明**：无论是对 $[-1, 1]^\omega$（还是对 $\overline{B}_{\bar{\rho}}(\mathbf{0}, 1) = \mathbb{R}^\omega$），考察包含于 $[-1, 1]^\omega$ 中的标准单位向量点列 $\mathbf{e}^{(n)} = (0, \dots, 0, 1, 0, \dots)$（第 $n$ 个坐标为 $1$，其余为 $0$）。在箱拓扑下，对任意点 $\mathbf{x} \in \mathbb{R}^\omega$，均可取半径 $\leqslant 1/3$ 的箱邻域使其至多包含点列 $\{\mathbf{e}^{(n)}\}$ 中的一个点（因当 $m \neq n$ 时第 $n$ 坐标或第 $m$ 坐标相差 $1$），故无穷集合 $E = \{\mathbf{e}^{(n)} \mid n \in \mathbb{Z}_+\} \subseteq [-1, 1]^\omega$ 在箱拓扑中没有任何极限点（从而没有收敛子列，见 Chapter 3 §28 极限点紧致性）。因此 $[-1, 1]^\omega$（及 $\overline{B}_{\bar{\rho}}(\mathbf{0}, 1)$）在箱拓扑中均不是紧空间。$\square$

> [!question] **习题 21.6 补充（原书 §21 Exercise 6, p. 134：函数列 $f_n(x) = x^n$ 的非一致收敛性）**
> 定义函数列 $f_n: [0, 1] \to \mathbb{R}$ 为 $f_n(x) = x^n$。讨论 $(f_n)$ 的逐点收敛性与一致收敛性，并验证定理 21.4。

**解**：对每个 $x \in [0, 1)$，有 $\lim_{n \to \infty} x^n = 0$；对 $x = 1$，有 $\lim_{n \to \infty} 1^n = 1$。因此 $(f_n)$ 在 $[0, 1]$ 上**逐点收敛**于分段函数：
$$f(x) = \begin{cases} 0, & 0 \leqslant x < 1, \\ 1, & x = 1. \end{cases}$$
由于极限函数 $f$ 在 $x = 1$ 处不连续，而每个 $f_n(x) = x^n$ 都是连续函数，根据定理 21.4 的逆否命题立即可知：**$(f_n)$ 在 $[0, 1]$ 上必定不一致收敛于 $f$**（事实上 $\sup_{x \in [0, 1]} |f_n(x) - f(x)| = \sup_{0 \leqslant x < 1} x^n = 1 \not\to 0$）。

> [!question] **习题 21.8（一致收敛下点列与函数列的双极限定理）**
> 设 $X$ 是拓扑空间，$(Y, d)$ 是度量空间，连续映射列 $f_n: X \to Y$ 在 $X$ 上一致收敛于 $f: X \to Y$。若 $X$ 中的点列 $x_n \to x$，证明在 $Y$ 中必有 $f_n(x_n) \to f(x)$。

**证明**：任取 $\varepsilon > 0$。
1. 因为 $f_n$ 在 $X$ 上一致收敛于 $f$，存在正整数 $N_1$ 使得当 $n \geqslant N_1$ 时，对**所有 $z \in X$**（特别地对 $z = x_n$）恒有：
   $$d\bigl(f_n(x_n), f(x_n)\bigr) < \frac{\varepsilon}{2}$$
2. 由定理 21.4 知极限映射 $f: X \to Y$ 是连续的。因为 $x_n \to x$，由定理 21.3(1) 知 $f(x_n) \to f(x)$，故存在正整数 $N_2$ 使得当 $n \geqslant N_2$ 时有：
   $$d\bigl(f(x_n), f(x)\bigr) < \frac{\varepsilon}{2}$$
取 $N = \max(N_1, N_2)$，则当 $n \geqslant N$ 时，由三角不等式得：
$$d\bigl(f_n(x_n), f(x)\bigr) \leqslant d\bigl(f_n(x_n), f(x_n)\bigr) + d\bigl(f(x_n), f(x)\bigr) < \frac{\varepsilon}{2} + \frac{\varepsilon}{2} = \varepsilon$$
即 $\lim_{n \to \infty} f_n(x_n) = f(x)$。$\square$

## 相关链接

- 上一节: [[20_The_Metric_Topology_I|§20 The Metric Topology (I)]]
- 下一节: [[22_The_Quotient_Topology|§22 The Quotient Topology]]
- 返回总览: [[00_Chapter_02_Overview|Chapter 2 Overview]]
