---
title: "§17 闭集与极限点"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/closed-sets
  - topology/limit-points
aliases:
  - "Closed Sets and Limit Points"
  - "17_Closed_Sets_and_Limit_Points"
---

# §17 Closed Sets and Limit Points

> [!abstract] 核心问题
> 如何从开集公理出发，对偶地建立闭集、闭包、内部与极限点的概念体系？为什么在一般的拓扑空间中序列极限可能不唯一（例如收敛到多个不同的点），而引入 Hausdorff ($T_2$) 分离公理后又能恢复极限的唯一性？

> [!important] **开集与闭集的对偶性（Duality）**
> 闭集定义为开集的补集。借助集合论中的 De Morgan 定律，关于闭集的一切性质都可以通过取补运算与开集的性质严格对偶：
> - **开集公理**（任意并封闭、有限交封闭）$\iff$ **闭集公理**（任意交封闭、有限并封闭）；
> - **“包含点 $x$ 的开邻域”** $\iff$ **“不包含点 $x$ 的闭集”**；
> - **内部算子 $\operatorname{Int}(A)$**（包含于 $A$ 的最大开集）$\iff$ **闭包算子 $\overline{A}$**（包含 $A$ 的最小闭集）。
>
> **几何直觉**：如果说开集刻画的是点周围留有余地的“局部邻域”，那么闭集与闭包刻画的就是“对极限过程的封闭性”——点 $x$ 属于集合 $A$ 的闭包 $\overline{A}$，当且仅当点 $x$ 的每一个开邻域都与 $A$ 相交，即 $x$ 可以被 $A$ 中的点在拓扑意义下“任意逼近”。

## 17.1 闭集及其基本性质

> [!note] **定义 17.1（闭集 / Closed Set）**
> 拓扑空间 $X$ 的子集 $A$ 称为 **闭集（closed set）**，如果它的补集 $X \setminus A$ 是 $X$ 中的开集。

> [!note] **定理 17.1（闭集族的三条基本性质）** ^theorem-17-1
> 设 $X$ 是一个拓扑空间。则下列结论成立：
> 1. $\varnothing$ 和 $X$ 都是闭集；
> 2. 任意多个闭集的**交集**仍是闭集；
> 3. 有限多个闭集的**并集**仍是闭集。

**证明**：
1. 因为 $X \setminus \varnothing = X$ 和 $X \setminus X = \varnothing$ 都是开集，故 $\varnothing$ 和 $X$ 都是闭集。
2. 设 $\{A_\alpha\}_{\alpha \in J}$ 为任意一族闭集。由 De Morgan 定律有：
   $$X \setminus \bigcap_{\alpha \in J} A_\alpha = \bigcup_{\alpha \in J} (X \setminus A_\alpha)$$
   由于每个 $A_\alpha$ 是闭集，其补集 $X \setminus A_\alpha$ 是开集；根据开集公理，任意多个开集的并集仍是开集，因此 $\bigcap_{\alpha \in J} A_\alpha$ 的补集是开集，即 $\bigcap_{\alpha \in J} A_\alpha$ 是闭集。
3. 设 $A_1, \dots, A_n$ 为有限个闭集。同样由 De Morgan 定律有：
   $$X \setminus \bigcup_{i=1}^{n} A_i = \bigcap_{i=1}^{n} (X \setminus A_i)$$
   有限个开集的交集仍是开集，故 $\bigcup_{i=1}^n A_i$ 是闭集。$\square$

> [!warning] **注意：无穷多个闭集的并集不一定是闭集**
> 与“无穷多个开集的交集未必开”完全对偶，无穷多个闭集的并集也未必闭。例如在标准实直线 $\mathbb{R}$ 上，可数个闭区间的并集 $\bigcup_{n=1}^{\infty} \left[\frac{1}{n}, 1\right] = (0, 1]$ 丢失了左端点 $0$，在 $\mathbb{R}$ 中不再是闭集。

> [!example] **例 17.1（常见拓扑中的闭集与既开又闭集）**
> - 在**离散拓扑**中，每个子集都是开集，因而其补集也都是开集，故**所有子集既开又闭（clopen）**。
> - 在**有限补拓扑 $\mathcal{T}_f$** 中，非空开集是补集为有限集的集合，因此**闭集恰好是全体有限子集以及全空间 $X$ 本身**。
> - 在子空间 $Y = [0, 1] \cup [2, 3] \subseteq \mathbb{R}$ 中，$[0, 1]$ 和 $[2, 3]$ 在 $Y$ 中既是开集（如 $[0,1] = (-1, 3/2) \cap Y$）又是闭集（互为补集）。

### 子空间中的闭集

> [!note] **定理 17.2 & 17.3（子空间中闭集的刻画）** ^theorem-17-2
> 设 $Y$ 是拓扑空间 $X$ 的子空间，$A \subseteq Y$。
> 1. $A$ 在子空间 $Y$ 中是闭集，当且仅当存在母空间 $X$ 中的闭集 $C$ 使得 $A = C \cap Y$；
> 2. 若 $A$ 在子空间 $Y$ 中是闭集，且 $Y$ 本身在母空间 $X$ 中也是闭集，则 $A$ 在母空间 $X$ 中也是闭集。

**证明**：已在 [[16_The_Subspace_Topology|§16]]（习题 16.1 与引理 16.2）中由补集对偶完整证明。$\square$

## 17.2 集合的闭包与内部

> [!note] **定义 17.2（内部 / Interior 与 闭包 / Closure）**
> 设 $A$ 是拓扑空间 $X$ 的一个子集。
> - $A$ 的 **内部（interior）**，记作 $\operatorname{Int}(A)$（或 $A^\circ$），定义为**包含于 $A$ 的所有开集的并集**；
> - $A$ 的 **闭包（closure）**，记作 $\overline{A}$（或 $\operatorname{Cl}(A)$），定义为**包含 $A$ 的所有闭集的交集**。

由开集对任意并封闭、闭集对任意交封闭立即可知：$\operatorname{Int}(A)$ 是包含在 $A$ 内部的**最大开集**，而 $\overline{A}$ 是包含 $A$ 的**最小闭集**，且恒有包含链：
$$\operatorname{Int}(A) \subseteq A \subseteq \overline{A}$$
特别地，$A$ 是开集 $\iff A = \operatorname{Int}(A)$；$A$ 是闭集 $\iff A = \overline{A}$。

当 $A \subseteq Y \subseteq X$ 时，$A$ 在母空间 $X$ 中的闭包记作 $\overline{A}$，而在子空间 $Y$ 中的相对闭包则由下方定理 17.4 给出：

> [!note] **定理 17.4（子空间中的相对闭包公式）** ^theorem-17-4
> 设 $Y$ 是 $X$ 的子空间，$A \subseteq Y$，记 $\overline{A}$ 为 $A$ 在母空间 $X$ 中的闭包。则 $A$ 在子空间 $Y$ 中的闭包等于 $\overline{A} \cap Y$。

**证明**：设 $B$ 为 $A$ 在子空间 $Y$ 中的闭包。
- 一方面，因为 $\overline{A}$ 在 $X$ 中是闭集，由定理 17.2 知 $\overline{A} \cap Y$ 是 $Y$ 中包含 $A$ 的一个闭集；而 $B$ 是 $Y$ 中包含 $A$ 的最小闭集，故 $B \subseteq \overline{A} \cap Y$。
- 另一方面，因为 $B$ 在 $Y$ 中是闭集，由定理 17.2 知存在 $X$ 中的闭集 $C$ 使得 $B = C \cap Y$。由于 $A \subseteq B \subseteq C$ 且 $C$ 在 $X$ 中闭，包含 $A$ 的最小闭集 $\overline{A}$ 必满足 $\overline{A} \subseteq C$。两边与 $Y$ 取交集即得 $\overline{A} \cap Y \subseteq C \cap Y = B$。
综合两方面得 $B = \overline{A} \cap Y$。$\square$

> [!note] **§17 定义的补充推论（闭包与内部的补集对偶公式）**
> 对拓扑空间 $X$ 的任意子集 $A \subseteq X$，恒有对偶关系：
> $$X \setminus \overline{A} = \operatorname{Int}(X \setminus A), \qquad X \setminus \operatorname{Int}(A) = \overline{X \setminus A}$$

**证明**：
- **第一式**：$\operatorname{Int}(X \setminus A)$ 是包含于 $X \setminus A$ 的最大开集。取补集对偶可知，$X \setminus \operatorname{Int}(X \setminus A)$ 恰为包含 $A$ 的最小闭集，即 $\overline{A}$。两边对 $X$ 取补即得 $X \setminus \overline{A} = \operatorname{Int}(X \setminus A)$。
- **第二式**：在第一式中将 $A$ 替换为 $X \setminus A$，得 $X \setminus \overline{X \setminus A} = \operatorname{Int}(A)$，两边再次对 $X$ 取补即得 $X \setminus \operatorname{Int}(A) = \overline{X \setminus A}$。$\square$

> [!note] **Kuratowski 闭包四条基本性质汇总（对应原书 §17 Exercise 3 & 8）**
> 1. $\overline{\varnothing} = \varnothing$；
> 2. $A \subseteq \overline{A}$；
> 3. $\overline{A \cup B} = \overline{A} \cup \overline{B}$；
> 4. $\overline{\overline{A}} = \overline{A}$（幂等性）。

**证明**：(1) $\varnothing$ 本身是闭集，故包含 $\varnothing$ 的最小闭集即为 $\varnothing$；(2) 由闭包定义直接成立；(3) $A \cup B \subseteq \overline{A} \cup \overline{B}$ 且两个闭集的并集 $\overline{A} \cup \overline{B}$ 仍是闭集，故 $\overline{A \cup B} \subseteq \overline{A} \cup \overline{B}$，而反向包含 $\overline{A} \cup \overline{B} \subseteq \overline{A \cup B}$ 由单调性显然成立；(4) 因 $\overline{A}$ 本身已是闭集，包含 $\overline{A}$ 的最小闭集即为其自身 $\overline{\overline{A}} = \overline{A}$。$\square$

### 闭包的邻域判别准则（点与闭包的关系）

用“所有包含 $A$ 的闭集之交”来定义闭包虽具有优美的全局对称性，但在具体判断某一点 $x$ 是否属于 $\overline{A}$ 时，下面的局部邻域判据（定理 17.5）远比定义本身更为实用：

> [!note] **定理 17.5（闭包的元素邻域判别准则）** ^theorem-17-5
> 设 $A$ 是拓扑空间 $X$ 的子集，$x \in X$。则：
> 1. $x \in \overline{A}$ 当且仅当**包含 $x$ 的每一个开集 $U$ 都与 $A$ 相交**（即 $U \cap A \neq \varnothing$）；
> 2. 若 $\mathcal{B}$ 是 $X$ 的拓扑基，则 $x \in \overline{A}$ 当且仅当包含 $x$ 的每一个基元素 $B \in \mathcal{B}$ 都与 $A$ 相交（即 $B \cap A \neq \varnothing$）。

**证明**：
1. 证明其逆否命题：$x \notin \overline{A} \iff$ 存在包含 $x$ 的开集 $U$ 使得 $U \cap A = \varnothing$。
   - 若 $x \notin \overline{A}$，令 $U = X \setminus \overline{A}$。因为 $\overline{A}$ 是闭集，故 $U$ 是包含 $x$ 的开集；又因 $A \subseteq \overline{A}$，必有 $U \cap A = \varnothing$。
   - 反之，若存在包含 $x$ 的开集 $U$ 使得 $U \cap A = \varnothing$，则补集 $C = X \setminus U$ 是包含 $A$ 的闭集。由闭包 $\overline{A}$ 的最小性知 $\overline{A} \subseteq C = X \setminus U$。因为 $x \in U$，故 $x \notin \overline{A}$。
2. 由 (1) 及拓扑基的定义（每个包含 $x$ 的开集 $U$ 内都含有包含 $x$ 的基元素 $B \subseteq U$）直接推出。$\square$

> [!tip] **术语约定：邻域（Neighborhood）**
> 在 Munkres 教材中，“点 $x$ 的一个**邻域（neighborhood）**”通常直接指代**包含点 $x$ 的一个开集 $U$**（部分文献也将包含某个开集 $U \ni x$ 的任意集合 $N \supseteq U$ 称为广义邻域，两种约定下的拓扑命题完全等价）。

## 17.3 极限点（聚点）

> [!note] **定义 17.3（极限点 / Limit Point / Cluster Point / Point of Accumulation）**
> 设 $A$ 是拓扑空间 $X$ 的子集，$x \in X$（$x$ 可以属于 $A$，也可以不属于 $A$）。称 $x$ 为集合 $A$ 的一个 **极限点（limit point）**（或聚点、凝聚点），如果包含 $x$ 的每一个邻域（开集）$U$ 都包含 $A$ 中**至少一个异于 $x$ 的点**，即：
> $$\forall U \in \mathcal{T} \;(x \in U) \implies U \cap (A \setminus \{x\}) \neq \varnothing$$
> 由定理 17.5，这等价于说：**$x$ 属于挖去 $x$ 后的集合 $A \setminus \{x\}$ 的闭包**，即 $x \in \overline{A \setminus \{x\}}$。

记 $A'$ 为集合 $A$ 的全体极限点构成的集合（常称为 $A$ 的**导集 / derived set**）。下面的定理揭示了闭包与导集之间的关系：

> [!note] **定理 17.6 & 推论 17.7（闭包与极限点的关系）** ^theorem-17-6
> 设 $A$ 是拓扑空间 $X$ 的子集，$A'$ 是 $A$ 的全体极限点构成的集合。则：
> $$\overline{A} = A \cup A'$$
> **推论 17.7**：子集 $A$ 是 $X$ 中的闭集，当且仅当 $A$ 包含它自己的所有极限点（即 $A' \subseteq A$）。

**证明**：
- **证明 $A \cup A' \subseteq \overline{A}$**：显然 $A \subseteq \overline{A}$。若 $x \in A'$，则包含 $x$ 的每个开集 $U$ 都与 $A \setminus \{x\} \subseteq A$ 相交，由定理 17.5 知 $x \in \overline{A}$。故 $A \cup A' \subseteq \overline{A}$。
- **证明 $\overline{A} \subseteq A \cup A'$**：任取 $x \in \overline{A}$。若 $x \in A$，则显然 $x \in A \cup A'$；若 $x \notin A$，则对包含 $x$ 的任意开集 $U$，由定理 17.5 知 $U \cap A \neq \varnothing$。由于 $x \notin A$，交集 $U \cap A$ 中的点必然异于 $x$，即 $U \cap (A \setminus \{x\}) = U \cap A \neq \varnothing$，这说明 $x \in A'$。故 $\overline{A} = A \cup A'$。
- **推论证明**：$A$ 是闭集 $\iff A = \overline{A} \iff A = A \cup A' \iff A' \subseteq A$。$\square$

> [!example] **例 17.2（实直线上极限点的具体例子）**
> 在标准实直线 $\mathbb{R}$ 上：
> - 取 $A = (0, 1]$，则其极限点集为 $A' = [0, 1]$，闭包为 $\overline{A} = [0, 1]$；
> - 取 $B = \{1/n \mid n \in \mathbb{Z}_+\}$，$B$ 中的每个点都是孤立点（不屬於 $B'$），唯一的极限点是 $0$，即 $B' = \{0\}$，闭包为 $\overline{B} = B \cup \{0\}$；
> - 取 $C = \{0\} \cup (1, 2)$，则点 $0 \in C$ 是 $C$ 的**孤立点**（存在开邻域 $(-1/2, 1/2)$ 与 $C \setminus \{0\}$ 不交），故 $C' = [1, 2]$，而 $\overline{C} = \{0\} \cup [1, 2]$。

## 17.4 Hausdorff 空间与 $T_1$ 公理

在一般的拓扑空间中，会出现许多违背欧氏空间直觉的“病态”现象。例如在三元集 $X = \{a, b, c\}$ 上赋予拓扑 $\mathcal{T} = \{\varnothing, \{a, b\}, X\}$，单点集 $\{b\}$ 的补集 $\{a, c\}$ 不是开集，故**单点集 $\{b\}$ 竟然不是闭集**！不仅如此，常数序列 $x_n = a$ 既收敛于 $a$，又同时收敛于 $b$ 和 $c$（因为包含 $b$ 的开集只有 $\{a, b\}$ 和 $X$，都包含 $a$；包含 $c$ 的开集只有 $X$，也包含 $a$）！

为了排除这类现象，Felix Hausdorff 在 1914 年提出了著名的分离性条件：

> [!note] **定义 17.4（Hausdorff 空间 / $T_2$ 空间）**
> 拓扑空间 $X$ 称为 **Hausdorff 空间**（或 **$T_2$ 空间**），如果对于 $X$ 中任意两个不同的点 $x_1 \neq x_2$，都存在分别包含 $x_1$ 和 $x_2$ 的开邻域 $U_1$ 和 $U_2$，使得
> $$U_1 \cap U_2 = \varnothing$$

> [!note] **定理 17.8（Hausdorff 空间中的有限点集必为闭集）** ^theorem-17-8
> Hausdorff 空间中的每一个有限点集都是闭集。

**证明**：因为有限点集是有限个单点集的并集，而有限个闭集的并集仍是闭集（定理 17.1(3)），故只需证明每一个单点集 $\{x_0\}$ 是闭集即可。
任取异于 $x_0$ 的点 $x \in X \setminus \{x_0\}$。由 Hausdorff 公理，存在不相交的开集 $U_x \ni x_0$ 和 $V_x \ni x$。由于 $U_x \cap V_x = \varnothing$，开集 $V_x$ 不包含 $x_0$，即 $x \in V_x \subseteq X \setminus \{x_0\}$。由点 $x \in X \setminus \{x_0\}$ 的任意性及习题 12.1（逐点开邻域判据）知，补集 $X \setminus \{x_0\} = \bigcup_{x \neq x_0} V_x$ 是开集，从而单点集 $\{x_0\}$ 是闭集。$\square$

> [!note] **定义与定理 17.9（$T_1$ 公理与有限补拓扑、极限点的无穷性）** ^theorem-17-9
> “每一个有限点集（等价地，每一个单点集）都是闭集”这一性质本身比 Hausdorff 条件更弱，称为 **$T_1$ 公理（$T_1$ Axiom）**（ 예를 들어无限集 $X$ 上的有限补拓扑 $\mathcal{T}_f$ 满足 $T_1$ 公理，但由习题 12.6 知它不是 Hausdorff 空间）。
>
> **定理 17.9**：设 $X$ 是满足 $T_1$ 公理的拓扑空间，$A \subseteq X$。则点 $x$ 是 $A$ 的极限点，**当且仅当包含 $x$ 的每一个开邻域都包含 $A$ 中的无穷多个点**。

**证明**：
- ($\Leftarrow$)：若包含 $x$ 的每个开邻域都含有 $A$ 的无穷多个点，则其中必含有异于 $x$ 的点，故 $x$ 是 $A$ 的极限点。
- ($\Rightarrow$)：反证法。假设 $x$ 是 $A$ 的极限点，但存在某个开邻域 $U \ni x$ 使得 $U \cap A$ 是有限集。那么挖去 $x$ 后的集合 $F = U \cap (A \setminus \{x\}) = \{a_1, \dots, a_m\}$ 也是有限集。由 $T_1$ 公理，有限集 $F$ 在 $X$ 中是闭集，故其补集 $X \setminus F$ 是开集。于是
  $$V = U \cap (X \setminus F)$$
  是两个开集的交，且因为 $x \in U$、$x \notin F$，故 $V$ 是包含 $x$ 的一个开邻域！然而
  $$V \cap (A \setminus \{x\}) = U \cap (X \setminus F) \cap (A \setminus \{x\}) = F \cap (X \setminus F) = \varnothing$$
  这与 $x$ 是 $A$ 的极限点矛盾！故包含 $x$ 的每个开邻域都必须包含 $A$ 的无穷多个点。$\square$

> [!note] **定理 17.10（Hausdorff 空间中收敛序列的极限唯一）** ^theorem-17-10
> 若 $X$ 是 Hausdorff 空间，则 $X$ 中的任意点列 $(x_n)_{n=1}^\infty$ 至多收敛于 $X$ 中的一个点。

**证明**：（在一般拓扑空间中，称点列 $x_n$ 收敛于 $x$，记作 $x_n \to x$，是指对 $x$ 的任意开邻域 $U$，存在正整数 $N$ 使得当 $n \geqslant N$ 时恒有 $x_n \in U$。）
反证法：假设 $x_n \to x$ 且 $x_n \to y$，其中 $x \neq y$。由 Hausdorff 性质，存在不相交的开邻域 $U \ni x$ 和 $V \ni y$（$U \cap V = \varnothing$）。因为 $x_n \to x$，存在 $N_1$ 使 $n \geqslant N_1$ 时 $x_n \in U$；因为 $x_n \to y$，存在 $N_2$ 使 $n \geqslant N_2$ 时 $x_n \in V$。取 $N = \max(N_1, N_2)$，则 $x_N \in U \cap V = \varnothing$，矛盾！故序列极限若存在则必唯一。$\square$

> [!note] **定理 17.11（序拓扑、积空间与子空间的 Hausdorff 性质）** ^theorem-17-11
> 1. 赋予序拓扑的任意全序集都是 Hausdorff 空间；
> 2. 两个 Hausdorff 空间的积空间 $X \times Y$ 仍是 Hausdorff 空间；
> 3. Hausdorff 空间的任意子空间仍是 Hausdorff 空间。

**证明**：
1. 设 $x < y$ 为全序集 $X$ 中的两个不同点。若 $(x, y) = \varnothing$（即 $x, y$ 之间无其他元素），则开射线 $U = (-\infty, y)$ 与 $V = (x, +\infty)$ 分别包含 $x, y$ 且不相交；若存在 $z \in (x, y)$，则开射线 $U = (-\infty, z)$ 与 $V = (z, +\infty)$ 分别包含 $x, y$ 且不相交。
2. 设 $(x_1, y_1) \neq (x_2, y_2) \in X \times Y$。不妨设 $x_1 \neq x_2$，在 Hausdorff 空间 $X$ 中取不相交开集 $U_1 \ni x_1, U_2 \ni x_2$，则 $U_1 \times Y$ 与 $U_2 \times Y$ 是 $X \times Y$ 中分别包含这两点的不相交开集。
3. 设 $Y \subseteq X$，$y_1 \neq y_2 \in Y$。在 $X$ 中取不相交开集 $U_1 \ni y_1, U_2 \ni y_2$，则 $U_1 \cap Y$ 与 $U_2 \cap Y$ 是 $Y$ 中分离 $y_1, y_2$ 的不相交相对开集。$\square$

## 17.5 习题解析

> [!question] **习题 17.1（原书 §17 Exercise 1, p. 100：由闭集族公理构造拓扑及原稿命题勘误）**
> 设 $\mathcal{C}$ 是集合 $X$ 的一个子集族，满足定理 17.1 的三条闭集公理：(1) $\varnothing, X \in \mathcal{C}$；(2) $\mathcal{C}$ 中任意多个集合的交集仍属于 $\mathcal{C}$；(3) $\mathcal{C}$ 中有限多个集合的并集仍属于 $\mathcal{C}$。
> 1. **（原书 §17 Exercise 1 原题）** 定义集族 $\mathcal{T} = \{X \setminus C \mid C \in \mathcal{C}\}$。证明 $\mathcal{T}$ 是 $X$ 上的一个拓扑，且 $(X, \mathcal{T})$ 中的全体闭集族恰好就是 $\mathcal{C}$；
> 2. **（原笔记旧题勘误辨析）** 若预先给定 $X$ 上的一个拓扑 $\mathcal{T}_0$，仅假设“对每个 $C \in \mathcal{C}$ 有 $X \setminus C \in \mathcal{T}_0$”且 $\mathcal{C}$ 满足上述三条公理，能否推出 $\mathcal{C}$ 包含 $(X, \mathcal{T}_0)$ 的**所有**闭集？

**证明与勘误**：
1. **原书命题证明**：由 De Morgan 定律，$X \setminus X = \varnothing \in \mathcal{T}$，$X \setminus \varnothing = X \in \mathcal{T}$；对任意子族 $\{U_\alpha\} \subseteq \mathcal{T}$，令 $C_\alpha = X \setminus U_\alpha \in \mathcal{C}$，则 $\bigcup_\alpha U_\alpha = X \setminus \bigcap_\alpha C_\alpha \in \mathcal{T}$（因 $\bigcap_\alpha C_\alpha \in \mathcal{C}$）；对有限个 $U_1, \dots, U_n \in \mathcal{T}$，有 $\bigcap_{i=1}^n U_i = X \setminus \bigcup_{i=1}^n C_i \in \mathcal{T}$（因 $\bigcup_{i=1}^n C_i \in \mathcal{C}$）。故 $\mathcal{T}$ 是拓扑，且 $F$ 在 $(X, \mathcal{T})$ 中闭 $\iff X \setminus F \in \mathcal{T} \iff F \in \mathcal{C}$。
2. **原笔记旧题勘误（反例）**：若 $\mathcal{T}_0$ 是预先给定的拓扑，仅凭“每个 $C \in \mathcal{C}$ 的补集属于 $\mathcal{T}_0$”只能说明 $\mathcal{C}$ 中的每个集合都是 $\mathcal{T}_0$-闭集（且 $\mathcal{C}$ 构成某个较粗拓扑 $\mathcal{T} \subseteq \mathcal{T}_0$ 的全体闭集族），**不能**推出 $\mathcal{C}$ 穷尽了 $(X, \mathcal{T}_0)$ 的全部闭集！**反例**：取二元离散空间 $X = \{a, b\}, \, \mathcal{T}_0 = \mathcal{P}(X)$，取平庸闭集族 $\mathcal{C} = \{\varnothing, X\}$。则 $\mathcal{C}$ 满足定理 17.1 的三条公理且每个元素的补集属于 $\mathcal{T}_0$，但 $(X, \mathcal{T}_0)$ 的闭集 $\{a\} \notin \mathcal{C}$。$\square$

> [!question] **习题 17.5（Hausdorff 空间中有限子集为闭集；对应原书定理 17.8）**
> 设 $X$ 是 Hausdorff 空间。证明 $X$ 的每个有限子集都是闭集。

**证明**：由定理 17.8，Hausdorff 空间中的每个单点集 $\{x\}$ 都是闭集；而任意有限子集是有限个单点集的并集，由定理 17.1(3)（有限个闭集的并集仍是闭集）知有限子集必为闭集。$\square$

> [!question] **习题 17.9（原书 §17 Exercise 9, p. 101：积拓扑的闭包公式 $\overline{A \times B} = \overline{A} \times \overline{B}$）**
> 设 $A \subseteq X$，$B \subseteq Y$。证明在积空间 $X \times Y$ 中恒有 $\overline{A \times B} = \overline{A} \times \overline{B}$（此结论在 §19 定理 19.5 中推广至任意乘积）。

**证明**：
- **证明 $\overline{A \times B} \subseteq \overline{A} \times \overline{B}$**：任取 $(x, y) \in \overline{A \times B}$，以及分别包含 $x, y$ 的任意开邻域 $U \ni x$（在 $X$ 中开）和 $V \ni y$（在 $Y$ 中开）。则 $U \times V$ 是积拓扑中包含 $(x, y)$ 的基开邻域，由定理 17.5 知 $(U \times V) \cap (A \times B) = (U \cap A) \times (V \cap B) \neq \varnothing$，从而 $U \cap A \neq \varnothing$ 且 $V \cap B \neq \varnothing$。由 $U, V$ 的任意性知 $x \in \overline{A}$ 且 $y \in \overline{B}$，即 $(x, y) \in \overline{A} \times \overline{B}$。
- **证明 $\overline{A} \times \overline{B} \subseteq \overline{A \times B}$**：任取 $(x, y) \in \overline{A} \times \overline{B}$ 及包含 $(x, y)$ 的任意积拓扑基元素 $U \times V$。因为 $x \in \overline{A}$ 且 $x \in U$，有 $U \cap A \neq \varnothing$；因为 $y \in \overline{B}$ 且 $y \in V$，有 $V \cap B \neq \varnothing$。故 $(U \times V) \cap (A \times B) = (U \cap A) \times (V \cap B) \neq \varnothing$，由定理 17.5(2) 知 $(x, y) \in \overline{A \times B}$。$\square$

> [!question] **习题 17.3 & 17.6 & 17.7（原书 §17 Exercises 6–8, pp. 100–101：闭包与内部的常用性质）**
> 设 $A, B \subseteq X$。证明：
> 1. 若 $A \subseteq B$，则 $\overline{A} \subseteq \overline{B}$；
> 2. $\overline{A \cup B} = \overline{A} \cup \overline{B}$；对于任意族 $\{A_\alpha\}$，有 $\bigcup_\alpha \overline{A_\alpha} \subseteq \overline{\bigcup_\alpha A_\alpha}$，给出严格包含的反例；
> 3. $\overline{A \cap B} \subseteq \overline{A} \cap \overline{B}$，给出严格包含的反例；
> 4. $\overline{A \setminus B} \supseteq \overline{A} \setminus \overline{B}$。

**证明**：
1. 因为 $\overline{B}$ 是包含 $B$ 的闭集且 $A \subseteq B$，故 $\overline{B}$ 是包含 $A$ 的闭集，由 $\overline{A}$ 的最小性得 $\overline{A} \subseteq \overline{B}$。
2. 由 (1) 知 $\overline{A} \cup \overline{B} \subseteq \overline{A \cup B}$；反之，$\overline{A} \cup \overline{B}$ 是两个闭集的并集（故为闭集）且包含 $A \cup B$，故 $\overline{A \cup B} \subseteq \overline{A} \cup \overline{B}$。对于无穷并，取 $A_n = \{1/n\} \subseteq \mathbb{R}$，则每个 $\overline{A_n} = \{1/n\}$，$\bigcup_{n=1}^\infty \overline{A_n} = \{1/n \mid n \in \mathbb{Z}_+\}$，而 $\overline{\bigcup_{n=1}^\infty A_n} = \{1/n \mid n \in \mathbb{Z}_+\} \cup \{0\}$，严格包含成立。
3. 由 $A \cap B \subseteq A, B$ 及 (1) 得 $\overline{A \cap B} \subseteq \overline{A} \cap \overline{B}$。反例：在 $\mathbb{R}$ 中取 $A = (0, 1)$，$B = (1, 2)$，则 $\overline{A \cap B} = \overline{\varnothing} = \varnothing$，而 $\overline{A} \cap \overline{B} = [0, 1] \cap [1, 2] = \{1\}$。
4. 因为 $A \subseteq (A \setminus B) \cup B$，由 (1) 和 (2) 得 $\overline{A} \subseteq \overline{A \setminus B} \cup \overline{B}$，两边减去 $\overline{B}$ 即得 $\overline{A} \setminus \overline{B} \subseteq \overline{A \setminus B}$。$\square$

> [!question] **习题 17.13（Hausdorff 空间的对角线闭集判据）**
> 证明：拓扑空间 $X$ 是 Hausdorff 空间，当且仅当对角线 $\Delta = \{(x, x) \mid x \in X\}$ 在积空间 $X \times X$ 中是闭集。

**证明**：通过考察对角线的补集 $(X \times X) \setminus \Delta$ 是否为开集来证明：
- ($\Rightarrow$)：设 $X$ 是 Hausdorff 空间。任取不在对角线上的点 $(x, y) \in (X \times X) \setminus \Delta$，即 $x \neq y$。由 Hausdorff 性质，存在 $X$ 中不相交的开邻域 $U \ni x$ 和 $V \ni y$（$U \cap V = \varnothing$）。于是基开矩形 $U \times V$ 包含点 $(x, y)$，且由于 $U \cap V = \varnothing$，$U \times V$ 中不可能包含任何两个坐标相等的点 $(z, z)$，即
  $$(x, y) \in U \times V \subseteq (X \times X) \setminus \Delta$$
  由逐点开邻域判据知 $(X \times X) \setminus \Delta$ 在积拓扑下是开集，故对角线 $\Delta$ 是闭集。
- ($\Leftarrow$)：设对角线 $\Delta$ 在 $X \times X$ 中是闭集，则 $(X \times X) \setminus \Delta$ 是开集。对 $X$ 中任意两个不同的点 $x \neq y$，有 $(x, y) \in (X \times X) \setminus \Delta$。根据积拓扑的定义，存在积拓扑的基开矩形 $U \times V$（其中 $U, V$ 在 $X$ 中开）使得
  $$(x, y) \in U \times V \subseteq (X \times X) \setminus \Delta$$
  于是 $x \in U$，$y \in V$，且必有 $U \cap V = \varnothing$（否则若存在 $z \in U \cap V$，则 $(z, z) \in (U \times V) \cap \Delta$，与 $U \times V \subseteq (X \times X) \setminus \Delta$ 矛盾）。这证明了 $X$ 是 Hausdorff 空间。$\square$

> [!question] **习题 17.19 节选（对应原书 §17 Exercise 19(a)–(c), p. 102；本笔记自编号 17.19–17.20：集合的边界 / Boundary）**
> 设 $A \subseteq X$，定义 $A$ 的**边界（boundary）**为 $\operatorname{Bd}(A) = \overline{A} \cap \overline{X \setminus A}$（亦记作 $\partial A$）。证明：
> 1. $\operatorname{Int}(A)$ 与 $\operatorname{Bd}(A)$ 不相交，且 $\overline{A} = \operatorname{Int}(A) \cup \operatorname{Bd}(A)$；
> 2. $\operatorname{Bd}(A) = \varnothing \iff A$ 在 $X$ 中既开又闭；
> 3. $U$ 是开集 $\iff \operatorname{Bd}(U) = \overline{U} \setminus U$。

**证明**：
1. 注意到对偶公式 $X \setminus \operatorname{Int}(A) = \overline{X \setminus A}$。因此
   $$\operatorname{Bd}(A) = \overline{A} \cap \overline{X \setminus A} = \overline{A} \cap \bigl(X \setminus \operatorname{Int}(A)\bigr) = \overline{A} \setminus \operatorname{Int}(A)$$
   因为 $\operatorname{Int}(A) \subseteq A \subseteq \overline{A}$，直接由 $\operatorname{Bd}(A) = \overline{A} \setminus \operatorname{Int}(A)$ 可知 $\operatorname{Int}(A) \cap \operatorname{Bd}(A) = \varnothing$ 且 $\overline{A} = \operatorname{Int}(A) \sqcup \operatorname{Bd}(A)$。
2. $\operatorname{Bd}(A) = \varnothing \iff \overline{A} \setminus \operatorname{Int}(A) = \varnothing \iff \overline{A} = \operatorname{Int}(A)$。结合 $\operatorname{Int}(A) \subseteq A \subseteq \overline{A}$，这当且仅当 $\operatorname{Int}(A) = A = \overline{A}$，即 $A$ 既开又闭。
3. 若 $U$ 是开集，则 $\operatorname{Int}(U) = U$，故 $\operatorname{Bd}(U) = \overline{U} \setminus \operatorname{Int}(U) = \overline{U} \setminus U$；反之，若 $\operatorname{Bd}(U) = \overline{U} \setminus U$，由于 $\operatorname{Bd}(U) = \overline{U} \setminus \operatorname{Int}(U)$ 且 $\operatorname{Int}(U) \subseteq U \subseteq \overline{U}$，必有 $U = \operatorname{Int}(U)$，即 $U$ 是开集。$\square$

## 相关链接

- 上一节：[[16_The_Subspace_Topology|§16 The Subspace Topology]]
- 下一节：[[18_Continuous_Functions|§18 Continuous Functions]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
