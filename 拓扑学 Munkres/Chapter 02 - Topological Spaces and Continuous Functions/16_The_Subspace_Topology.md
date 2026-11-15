---
title: "§16 子空间拓扑"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/subspace-topology
aliases:
  - "The Subspace Topology"
  - "16_The_Subspace_Topology"
---

# §16 The Subspace Topology

> [!abstract] 核心问题
> 给定一个拓扑空间 $X$ 及其子集 $Y \subseteq X$，如何在 $Y$ 上自然地诱导出一个与母空间 $X$ 拓扑相容的拓扑结构？当全序集的子集同时具有“子空间拓扑”和“自身序拓扑”时，两者何时一致、何时产生分歧？

> [!important] **子空间拓扑——“相对化（Relativization）”的核心思想**
> 子空间拓扑是点集拓扑中使用最频繁的基本构造。给定拓扑空间 $(X, \mathcal{T})$ 和任意子集 $Y \subseteq X$，最自然的想法是将 $X$ 中的开集直接“截断”到 $Y$ 上：规定 $Y$ 中的开集恰好是 $X$ 中开集与 $Y$ 的交集。
>
> **关键直觉（相对开 vs. 绝对开）**：讨论一个集合“是不是开集”时，必须明确指明它是在子空间 $Y$ 中开（open relative to $Y$），还是在母空间 $X$ 中开（open in $X$）。例如，将闭区间 $Y = [0,1]$ 视为实直线 $\mathbb{R}$ 的子空间时，半开区间 $[0, 1/2)$ 在子空间 $Y$ 中是**开集**——因为它可以写成 $\mathbb{R}$ 中开区间 $(-1/2, 1/2)$ 与 $[0,1]$ 的交集：$[0, 1/2) = (-1/2, 1/2) \cap [0,1]$，尽管 $[0, 1/2)$ 在母空间 $\mathbb{R}$ 中并不是开集！一般而言，“在子空间 $Y$ 中开”并不蕴含“在母空间 $X$ 中开”，除非子空间 $Y$ 本身就是 $X$ 的开子集（引理 16.2）。

## 16.1 子空间拓扑的定义与拓扑基

> [!note] **定义 16.1（子空间拓扑 / Subspace Topology）**
> 设 $(X, \mathcal{T})$ 是一个拓扑空间，$Y$ 是 $X$ 的一个子集。集族
> $$\mathcal{T}_Y = \{U \cap Y \mid U \in \mathcal{T}\}$$
> 构成 $Y$ 上的一个拓扑，称为 $Y$ 从 $X$ 继承的 **子空间拓扑（subspace topology）**（或相对拓扑）。赋予了子空间拓扑 $\mathcal{T}_Y$ 的集合 $Y$ 称为 $X$ 的一个 **拓扑子空间（subspace）**。

> [!important] 验证 $\mathcal{T}_Y$ 满足拓扑公理：
> 1. $\varnothing = \varnothing \cap Y \in \mathcal{T}_Y$，且 $Y = X \cap Y \in \mathcal{T}_Y$；
> 2. 设 $\{V_\alpha\} \subseteq \mathcal{T}_Y$，其中每个 $V_\alpha = U_\alpha \cap Y$（$U_\alpha \in \mathcal{T}$）。由集合分配律得 $\bigcup_\alpha V_\alpha = \bigl(\bigcup_\alpha U_\alpha\bigr) \cap Y$。因 $\bigcup_\alpha U_\alpha \in \mathcal{T}$，故 $\bigcup_\alpha V_\alpha \in \mathcal{T}_Y$；
> 3. 设 $V_1, \dots, V_n \in \mathcal{T}_Y$，其中 $V_i = U_i \cap Y$（$U_i \in \mathcal{T}$）。则 $\bigcap_{i=1}^n V_i = \bigl(\bigcap_{i=1}^n U_i\bigr) \cap Y \in \mathcal{T}_Y$。

> [!note] **引理 16.1（子空间拓扑的基）** ^theorem-16-1
> 若 $\mathcal{B}$ 是母空间 $X$ 的拓扑的一个基，则将 $\mathcal{B}$ 中每个基元素与 $Y$ 相交得到的集族
> $$\mathcal{B}_Y = \{B \cap Y \mid B \in \mathcal{B}\}$$
> 是子空间拓扑 $\mathcal{T}_Y$ 的一个基。

**证明**：任取子空间 $Y$ 中的开集 $V = U \cap Y$（其中 $U \in \mathcal{T}$）以及任意一点 $y \in V$。由于 $y \in U$ 且 $\mathcal{B}$ 是 $X$ 的拓扑基，存在基元素 $B \in \mathcal{B}$ 使得 $y \in B \subseteq U$。两边同时与 $Y$ 取交集，即得
$$y \in B \cap Y \subseteq U \cap Y = V$$
其中 $B \cap Y \in \mathcal{B}_Y$。由已知拓扑下基的判定准则（引理 13.2），$\mathcal{B}_Y$ 是子空间拓扑 $\mathcal{T}_Y$ 的一个基。$\square$

## 16.2 子空间中的开集、闭集与积空间相容性

> [!note] **引理 16.2（开子空间中开集的传递性）** ^theorem-16-2
> 设 $Y$ 是 $X$ 的子空间。若 $U$ 在 $Y$ 中是开集，且 $Y$ 本身在母空间 $X$ 中是开集，则 $U$ 在母空间 $X$ 中也是开集。（对闭集有完全对偶的结论：若 $C$ 在 $Y$ 中是闭集，且 $Y$ 在 $X$ 中是闭集，则 $C$ 在 $X$ 中也是闭集。）

**证明**：
- **开集情形**：设 $U$ 在子空间 $Y$ 中开。由子空间拓扑的定义，存在 $X$ 中的开集 $W \in \mathcal{T}_X$ 使得 $U = W \cap Y$。由于 $Y$ 本身也是 $X$ 中的开集，$U = W \cap Y$ 是 $X$ 中两个开集的有限交，故 $U$ 在 $X$ 中是开集。
- **闭集情形**：由下方定理 16.3，若 $C$ 在 $Y$ 中闭，则存在 $X$ 中闭集 $F$ 使得 $C = F \cap Y$。当 $Y$ 在 $X$ 中也是闭集时，$C = F \cap Y$ 是 $X$ 中两个闭集的交，故在 $X$ 中也是闭集。$\square$

> [!note] **定理 16.3（子空间与积拓扑的相容性）** ^theorem-16-3
> 设 $A$ 是拓扑空间 $X$ 的子空间，$B$ 是拓扑空间 $Y$ 的子空间。则在笛卡尔积 $A \times B$ 上，“先在 $X \times Y$ 上取积拓扑、再限制到子集 $A \times B$ 上的子空间拓扑”与“先对 $A, B$ 取各自的子空间拓扑、再在 $A \times B$ 上构造的积拓扑”**完全一致**。

**证明**：设 $U$ 是 $X$ 的开集，$V$ 是 $Y$ 的开集。$X \times Y$ 积拓扑的一般基元素为 $U \times V$。根据引理 16.1，$A \times B$ 作为 $X \times Y$ 的子空间时，其子空间拓扑的基由全体形如 $(U \times V) \cap (A \times B)$ 的集合构成。另一方面，$A$ 和 $B$ 的子空间拓扑中的一般开集分别为 $U \cap A$ 和 $V \cap B$，故 $A$ 与 $B$ 的积拓扑的基由全体形如 $(U \cap A) \times (V \cap B)$ 的集合构成。由集合运算恒等式：
$$(U \times V) \cap (A \times B) = (U \cap A) \times (V \cap B)$$
可知两种拓扑拥有完全相同的拓扑基，因此它们是同一个拓扑。$\square$

## 16.3 子空间拓扑与序拓扑的对比（凸子集定理）

设 $X$ 是赋予序拓扑的全序集，$Y \subseteq X$ 是其子集。全序关系限制在 $Y$ 上使 $Y$ 也成为全序集。此时 $Y$ 上有两个自然的拓扑：(1) 作为 $X$ 子空间继承的**子空间拓扑**；(2) 由限制在 $Y$ 上的序关系独立生成的**序拓扑**。两者未必相同！

> [!example] **例 16.1（子空间拓扑与序拓扑不一致的典型反例）**
> 1. 取 $X = \mathbb{R}$，$Y = [0, 1) \cup \{2\}$。在 $Y$ 的**子空间拓扑**中，单点集 $\{2\} = (3/2, 5/2) \cap Y$ 是开集；但在 $Y$ 自身的**序拓扑**中，$2$ 是全集 $Y$ 的最大元，包含最大元 $2$ 的任何基元素都形如 $(a, 2]_Y = \{y \in Y \mid a < y \leqslant 2\}$（其中 $a \in Y$）。因为 $a \in Y$ 且 $a < 2$ 意味着 $a < 1$，所以区间 $(a, 2]_Y = (a, 1) \cup \{2\}$ 永远包含 $[0,1)$ 的无穷尾部，从而 $\{2\}$ 在 $Y$ 的序拓扑中**不是开集**！
> 2. **（原书 §16 Example 3, p. 90：字典序平面 $\mathbb{R}^2$ 中的单位正方形 $I \times I$）** 设母空间 $X = \mathbb{R} \times \mathbb{R}$ 赋予字典序拓扑（其拓扑基为全体开铅垂线段 $\{x\} \times (a, b)$），考察子集 $Y = I \times I = [0, 1] \times [0, 1]$：
>    - 在 $Y$ 作为字典序 $\mathbb{R}^2$ 子空间所继承的**子空间拓扑**中，由于 $\{1/2\} \times (1/2, 2)$ 在母空间 $X$ 中是开集，交集 $\{1/2\} \times (1/2, 1] = \bigl(\{1/2\} \times (1/2, 2)\bigr) \cap Y$ 在 $Y$ 的子空间拓扑中是**开集**；
>    - 但在将字典序限制于 $Y$ 所独立生成的**内在序拓扑**（即序方阵 $I_o^2$）中，包含上边界点 $(1/2, 1)$ 的任何序拓扑基开区间 $\bigl((a, b), (c, d)\bigr)_{I_o^2}$ 都必须满足 $(1/2, 1) < (c, d)$，即 $c > 1/2$，从而必定包含右侧竖直带 $(1/2, c) \times [0, 1]$ 中的点。因此 $\{1/2\} \times (1/2, 1]$ 在 $I_o^2$ 的序拓扑中**不是开集**！（这里 $Y = I \times I$ 在字典序 $\mathbb{R}^2$ 中不是序凸子集，故子空间拓扑严格细于内在序拓扑。）

为了保证 $Y$ 的子空间拓扑与 $Y$ 自身的序拓扑一致，只需 $Y$ 是 $X$ 中的**凸子集（Convex Subset）**：

> [!note] **定义 16.2（序凸子集 / Convex Subset）**
> 设 $X$ 是全序集，子集 $Y \subseteq X$ 称为在 $X$ 中是 **凸的（convex）**，若对任意 $a, b \in Y$（$a < b$），$X$ 中的整个开区间 $(a, b)_X = \{x \in X \mid a < x < b\}$ 都包含于 $Y$。
> （例如 $X$ 中的任意区间与射线都是凸子集。）

> [!note] **定理 16.4（序拓扑与子空间拓扑的关系）** ^theorem-16-4
> 设 $X$ 是赋予序拓扑的全序集，$Y$ 是 $X$ 的子集。
> 1. $Y$ 上的**子空间拓扑总是细于（包含）$Y$ 上的序拓扑**；
> 2. 若 $Y$ 在 $X$ 中是**凸子集**，则 $Y$ 上的子空间拓扑与 $Y$ 上的序拓扑**完全一致**。

**证明**：
1. 只需验证 $Y$ 的序拓扑的任意开射线在 $Y$ 的子空间拓扑中也是开集。对任意 $a \in Y$，$Y$ 中的开射线 $\{y \in Y \mid y > a\} = (a, +\infty)_X \cap Y$ 恰好是 $X$ 中开射线 $(a, +\infty)_X$ 与 $Y$ 的交集，因而在 $Y$ 的子空间拓扑中是开集。同理 $\{y \in Y \mid y < a\} = (-\infty, a)_X \cap Y$ 在子空间拓扑中也是开集。由于开射线构成 $Y$ 序拓扑的子基，故子空间拓扑必包含 $Y$ 的序拓扑。
2. 现设 $Y$ 在 $X$ 中是凸子集，只需反向证明 $X$ 中任意开射线 $(a, +\infty)_X$（其中 $a \in X$）与 $Y$ 的交集在 $Y$ 的序拓扑中是开集：
   - 若 $a \in Y$，则 $(a, +\infty)_X \cap Y = \{y \in Y \mid y > a\}$ 本身就是 $Y$ 中的开射线，在 $Y$ 的序拓扑中开；
   - 若 $a \notin Y$，由于 $Y$ 是凸子集，点 $a \notin Y$ 不可能夹在 $Y$ 的两个元素之间，故 $a$ 要么严格小于 $Y$ 的所有元素（此时 $(a, +\infty)_X \cap Y = Y$），要么严格大于 $Y$ 的所有元素（此时 $(a, +\infty)_X \cap Y = \varnothing$）。无论是 $Y$ 还是 $\varnothing$，在 $Y$ 的序拓扑中都是开集。
   对 $(-\infty, a)_X \cap Y$ 同理。因为开射线构成 $X$ 序拓扑的子基，故 $Y$ 的子空间拓扑也包含于 $Y$ 的序拓扑，二者完全相等。$\square$

## 16.4 习题解析

> [!question] **习题 16.1（子空间闭集刻画；对应原书 §17 定理 17.2）**
> 设 $Y$ 是 $X$ 的子空间，$A \subseteq Y$。证明：$A$ 在子空间 $Y$ 中是闭集，当且仅当存在母空间 $X$ 中的某个闭集 $C$，使得 $A = C \cap Y$。

**证明**：利用闭集与开集的补集对偶关系及集合运算恒等式：
$$
\begin{aligned}
A \text{ 在 } Y \text{ 中闭} &\iff Y \setminus A \text{ 在 } Y \text{ 中开} \\
&\iff \text{存在 } X \text{ 中开集 } U \text{ 使得 } Y \setminus A = U \cap Y \\
&\iff A = Y \setminus (U \cap Y) = (X \setminus U) \cap Y
\end{aligned}
$$
令 $C = X \setminus U$，则 $U$ 在 $X$ 中开当且仅当 $C$ 在 $X$ 中闭。因此 $A$ 在 $Y$ 中闭当且仅当 $A = C \cap Y$（其中 $C$ 在 $X$ 中闭）。$\square$

> [!question] **习题 16.3（原笔记题：$[0, 1/2)$ 在闭区间 $[0, 1]$ 子空间拓扑中的开闭性）**
> 把 $[0, 1]$ 视为 $\mathbb{R}$ 的子空间。集合 $[0, \frac{1}{2})$ 在 $[0, 1]$ 的子空间拓扑中是否为开集？是否为闭集？

**解**：
- **是开集**：因为 $[0, \frac{1}{2}) = (-\frac{1}{2}, \frac{1}{2}) \cap [0, 1]$，而 $(-\frac{1}{2}, \frac{1}{2})$ 在母空间 $\mathbb{R}$ 中是开区间，故 $[0, \frac{1}{2})$ 在 $[0, 1]$ 的子空间拓扑中是**开集**；
- **不是闭集**：其在 $[0, 1]$ 中的相对补集为 $[\frac{1}{2}, 1]$，由于包含端点 $\frac{1}{2}$ 的任何 $\mathbb{R}$-开区间都含有小于 $\frac{1}{2}$ 的正数，故 $[\frac{1}{2}, 1]$ 在 $[0, 1]$ 中不是开集（等价地，$\frac{1}{2} \in [0, 1]$ 是 $[0, \frac{1}{2})$ 的极限点但不属于 $[0, \frac{1}{2})$），因此 $[0, \frac{1}{2})$ 在 $[0, 1]$ 中**不是闭集**。$\square$

> [!question] **习题 16.3 补充（原书 §16 Exercise 3(a)–(d) 节选, p. 91）**
> 把闭区间 $Y = [-1, 1]$ 视为实直线 $\mathbb{R}$ 的子空间。判断下列四个集合（原书 Exercise 3 的前四项）在子空间 $Y$ 中以及在母空间 $\mathbb{R}$ 中是否为开集：
> $$A = \{x \mid \tfrac{1}{2} < |x| < 1\}, \quad B = \{x \mid \tfrac{1}{2} < |x| \leqslant 1\}, \quad C = \{x \mid \tfrac{1}{2} \leqslant |x| < 1\}, \quad D = \{x \mid \tfrac{1}{2} \leqslant |x| \leqslant 1\}$$

**解析**：
- **$A = (-1, -1/2) \cup (1/2, 1)$**：在 $\mathbb{R}$ 中是两个开区间的并，故在 $\mathbb{R}$ 中开，从而在 $Y$ 中也开；
- **$B = [-1, -1/2) \cup (1/2, 1]$**：因为 $B = \bigl((-2, -1/2) \cup (1/2, 2)\bigr) \cap [-1, 1]$，故 $B$ 在子空间 $Y$ 中**是开集**，但在母空间 $\mathbb{R}$ 中不是开集（含端点 $\pm 1$）；
- **$C = (-1, -1/2] \cup [1/2, 1)$** 与 **$D = [-1, -1/2] \cup [1/2, 1]$**：由于点 $1/2 \in Y$ 的任何 $\mathbb{R}$-开邻域都包含小于 $1/2$ 的点，故 $C$ 和 $D$ 在 $Y$ 中和在 $\mathbb{R}$ 中都**不是开集**（其中 $D$ 在 $Y$ 和 $\mathbb{R}$ 中都是闭集）。

> [!question] **习题 16.4（原笔记题：利用引理 16.1 给出 $Y = [0, 1] \cup (2, 3)$ 的子空间拓扑基）**
> 子空间拓扑基的性质（引理 16.1）：若 $\mathcal{B}$ 是 $X$ 的基，则 $\{B \cap Y \mid B \in \mathcal{B}\}$ 是 $Y$ 的子空间拓扑的基。利用这一事实，具体刻画 $\mathbb{R}$ 的子集 $Y = [0, 1] \cup (2, 3)$ 上子空间拓扑的一个基。

**解**：取 $\mathbb{R}$ 的标准拓扑基 $\mathcal{B} = \{(a, b) \mid a < b\}$。由引理 16.1，$Y = [0, 1] \cup (2, 3)$ 的子空间拓扑基为全体交集族 $\mathcal{B}_Y = \{(a, b) \cap Y \mid a < b\}$。按开区间端点 $(a, b)$ 与两段子集的位置关系，非空基元素具体由以下几类集合构成：
- 落在 $[0, 1]$ 内部的开区间：$(a, b)$（其中 $0 \leqslant a < b \leqslant 1$）；
- 含左端点 $0$ 的半开区间：$[0, b) = (a, b) \cap Y$（其中 $a < 0 < b \leqslant 1$）；
- 含右端点 $1$ 的半开区间：$(a, 1] = (a, b) \cap Y$（其中 $0 \leqslant a < 1 < b \leqslant 2$）；
- 整段闭区间 $[0, 1] = (a, b) \cap Y$（其中 $a < 0, \, 1 < b \leqslant 2$）；
- 落在 $(2, 3)$ 内部的开区间：$(a, b)$（其中 $2 \leqslant a < b \leqslant 3$）；
- 跨两段的并集：$(a, 1] \cup (2, b)$（其中 $0 \leqslant a < 1, \, 2 < b \leqslant 3$）以及 $[0, 1] \cup (2, b)$（其中 $a < 0, \, 2 < b \leqslant 3$）。$\square$

> [!question] **习题 16.4 补充（原书 §16 Exercise 4, p. 92：乘积子空间上的坐标投射）**
> 设 $X$ 和 $Y$ 是拓扑空间，$A \subseteq X$，$B \subseteq Y$。证明坐标投射映射 $\pi_1: X \times Y \to X$ 限制在子空间 $A \times B$ 上的映射 $\pi_1|_{A \times B}: A \times B \to A$ 是连续映射；当 $B \neq \varnothing$ 时它是满射且是开映射。

**证明**：对于任意在 $A$ 中开的集合 $U_A = U \cap A$（$U$ 在 $X$ 中开），其原像为 $(U \cap A) \times B = (U \times Y) \cap (A \times B)$，在 $A \times B$ 中是开集，故连续。当 $B \neq \varnothing$ 时，取定 $b_0 \in B$，对任意 $a \in A$ 有 $\pi_1(a, b_0) = a$，故为满射；且对 $A \times B$ 中的任意非空基开集 $U_A \times V_B$（其中 $U_A$ 在 $A$ 中非空开，$V_B$ 在 $B$ 中非空开），其像为 $\pi_1(U_A \times V_B) = U_A$ 在 $A$ 中开，由于任意开集是基开集的并且映射保持任意并，故 $\pi_1|_{A \times B}$ 也是开映射。$\square$

> [!question] **原笔记补充题（标准平面 $\mathbb{R}^2$ 中直线上的子空间拓扑与实直线同胚；注：原书 §16 Exercise 8, p. 92 讨论直线分别作为下限拓扑乘积 $\mathbb{R}_\ell \times \mathbb{R}$ 与 $\mathbb{R}_\ell \times \mathbb{R}_\ell$ 子空间的拓扑）**
> 设 $L$ 是平面 $\mathbb{R}^2$ 中的一条直线。证明 $L$ 作为 $\mathbb{R}^2$ 的子空间，其上的子空间拓扑由以 $L$ 上开线段为基生成（即与实直线 $\mathbb{R}$ 的标准拓扑同胚，同胚定义见 [[18_Continuous_Functions|§18]]）。

**证明**：
- 若直线 $L$ 为非铅垂线 $y = mx + c$，考虑映射 $f: \mathbb{R} \to L, \, f(t) = (t, mt + c)$。对 $\mathbb{R}^2$ 中的任意基开矩形 $(a, b) \times (c_1, d_1)$，其与 $L$ 的交集在第一坐标投射 $\pi_1|_L = f^{-1}: L \to \mathbb{R}$ 下对应两个开区间 $(a, b) \cap \{t \in \mathbb{R} \mid c_1 < mt + c < d_1\}$ 的交集，仍为 $\mathbb{R}$ 中的开区间（即 $L$ 上的开线段）；反之，$\mathbb{R}$ 中任意开区间 $(a, b)$ 在 $f$ 下的像恰为 $\bigl((a, b) \times \mathbb{R}\bigr) \cap L$，在 $L$ 的子空间拓扑中是开集。
- 若 $L$ 为铅垂线 $x = c$，则对第二坐标投射 $(c, t) \leftrightarrow t$ 完全同理。
因此 $L$ 上的子空间拓扑以 $L$ 上的开线段为基，且与标准实直线 $\mathbb{R}$ 同胚。$\square$

> [!question] **习题 16.9（原书 §16 Exercise 9, p. 92）**
> 证明平面 $\mathbb{R}^2$ 上的字典序拓扑恰好等于 $\mathbb{R}_d \times \mathbb{R}$ 上的积拓扑（其中 $\mathbb{R}_d$ 表示赋予离散拓扑的实数集，$\mathbb{R}$ 表示赋予标准拓扑的实数集）。

**证明**：在 $\mathbb{R}^2$ 的字典序下，由于每条铅垂线 $\{x\} \times \mathbb{R}$ 无最小元与最大元，字典序拓扑的一组基由全体开铅垂线段 $\mathcal{B} = \{\{x\} \times (a, b) \mid x \in \mathbb{R}, \, a < b\}$ 构成。另一方面，在离散空间 $\mathbb{R}_d$ 中全体单点集 $\{\{x\} \mid x \in \mathbb{R}\}$ 构成一组基，在标准实直线 $\mathbb{R}$ 中全体开区间 $\{(a, b) \mid a < b\}$ 构成一组基。由定理 15.1（因子空间的基之积构成积拓扑的基），积空间 $\mathbb{R}_d \times \mathbb{R}$ 的一组基恰好也是 $\{\{x\} \times (a, b) \mid x \in \mathbb{R}, \, a < b\} = \mathcal{B}$。两组基完全相同，故生成的拓扑完全一致。$\square$

## 相关链接

- 上一节：[[15_The_Product_Topology_on_XxY|§15 The Product Topology on XxY]]
- 下一节：[[17_Closed_Sets_and_Limit_Points|§17 Closed Sets and Limit Points]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
