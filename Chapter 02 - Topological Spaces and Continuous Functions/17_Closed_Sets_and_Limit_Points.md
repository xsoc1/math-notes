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
> 闭集、极限点、闭包和 Hausdorff 空间——这些概念如何从开集公理推导出来？


>[!important] **开集与闭集的对偶性**
> 闭集是开集的补集。因此，关于闭集的一切命题都可以通过对偶转化为关于开集的命题，反之亦然。这种对偶性是拓扑学中最重要的思考方式之一：
> - 开集公理 $\iff$ 闭集公理（任意交封闭、有限并封闭）
> - "$x$ 的邻域" 对偶于 "不含 $x$ 的闭集"
> - 内部 $\iff$ 闭包（取补对偶）
>
> **直觉**：开集描述"附近"，闭集描述"极限"。一个点 $x$ 在 $A$ 的闭包中，意味着 $x$ 可以被 $A$ 中的点"任意逼近"。

## 17.1 闭集

> [!note] **定义 17.1（闭集 / Closed Set）**
> 拓扑空间 $X$ 的子集 $A$ 称为 **闭集 (closed set)**，若其补集 $X \setminus A$ 是开集。

> [!note] **定理 17.1（闭集的性质）** ^theorem-17-1
> 设 $X$ 是拓扑空间。则：
> 1. $\varnothing$ 和 $X$ 是闭集；
> 2. 任意多个闭集的**交**是闭集；
> 3. 有限多个闭集的**并**是闭集。

**证明**：由 De Morgan 律和开集公理直接推出。
$$\bigcap_{\alpha} C_\alpha \text{ 的补 } = \bigcup_{\alpha} (X \setminus C_\alpha)$$
若每个 $C_\alpha$ 是闭集，则每个 $X \setminus C_\alpha$ 是开集，其任意并是开集，故 $\bigcap C_\alpha$ 是闭集。有限并的证明类似。$\square$

>[!warning] 注意：无限多个闭集的**并**不一定是闭集。例如 $\bigcup_{n=1}^{\infty} [\frac{1}{n}, 1] = (0,1]$ 在 $\mathbb{R}$ 中不是闭集。

> [!example] **例 17.1（有限补拓扑中的闭集）**
> 在有限补拓扑中，闭集恰是有限集和 $X$。因为 $U$ 是开集 $\iff X \setminus U$ 是有限集或 $U = \varnothing$，故 $C$ 是闭集 $\iff X \setminus C$ 是开集 $\iff C$ 是有限集或 $C = X$。

## 17.2 闭包与内部

> [!note] **定义 17.2（闭包 / Closure & 内部 / Interior）**
> 设 $A \subseteq X$。
> - $A$ 的 **闭包 (closure)** $\overline{A}$：包含 $A$ 的所有闭集的交。
> - $A$ 的 **内部 (interior)** $\operatorname{Int}(A)$：$A$ 包含的所有开集的并。

>[!tip] $\overline{A}$ 是包含 $A$ 的最小闭集；$\operatorname{Int}(A)$ 是 $A$ 包含的最大开集。

> [!note] **定理 17.4（闭包与内部的关系）**
> $$X \setminus \overline{A} = \operatorname{Int}(X \setminus A),\quad X \setminus \operatorname{Int}(A) = \overline{X \setminus A}$$

**证明**：
- 第一个等式：$\operatorname{Int}(X \setminus A)$ 是包含于 $X \setminus A$ 的最大开集。其补集 $X \setminus \operatorname{Int}(X \setminus A)$ 是包含 $A$ 的最小闭集，即 $\overline{A}$。故 $X \setminus \overline{A} = \operatorname{Int}(X \setminus A)$。
- 第二个等式：在第一个等式中以 $X \setminus A$ 替换 $A$，得
  $$X \setminus \overline{X \setminus A} = \operatorname{Int}(A)$$
  两边取补即得 $X \setminus \operatorname{Int}(A) = \overline{X \setminus A}$。
$\square$

> [!note] **定理 17.5（闭包的性质 / Kuratowski 闭包公理）** ^theorem-17-5
> 1. $\overline{\varnothing} = \varnothing$；
> 2. $A \subseteq \overline{A}$；
> 3. $\overline{A \cup B} = \overline{A} \cup \overline{B}$；
> 4. $\overline{\overline{A}} = \overline{A}$。

**证明**：
1. $\varnothing$ 是闭集，故其闭包即自身。
2. 由定义，闭包包含 $A$。
3. $A \cup B \subseteq \overline{A} \cup \overline{B}$，后者是闭集（有限个闭集的并），故 $\overline{A \cup B} \subseteq \overline{A} \cup \overline{B}$。反向包含显然。
4. $\overline{A}$ 本身是闭集，故其闭包即自身。$\square$

## 17.3 极限点

> [!note] **定义 17.3（极限点 / Limit Point）**
> 设 $A \subseteq X$。点 $x \in X$ 称为 $A$ 的 **极限点 (limit point)**，若 $x$ 的每个邻域与 $A$ 的交包含异于 $x$ 的点。

>[!important] 等价表述：$x$ 是 $A$ 的极限点 $\iff$ 每个包含 $x$ 的开集 $U$ 满足 $U \cap (A \setminus \{x\}) \neq \varnothing$。

> [!note] **定理 17.6（闭包与极限点的关系）**
> $\overline{A} = A \cup A'$，其中 $A'$ 是 $A$ 的所有极限点的集合。

**证明**：若 $x \notin A$ 且 $x \notin A'$，则存在开集 $U \ni x$ 使得 $U \cap A = \varnothing$，故 $x \notin \overline{A}$。反之，若 $x \notin \overline{A}$，则 $x \in X \setminus \overline{A}$（开集），且该开集与 $A$ 不相交，故 $x \notin A$ 且 $x \notin A'$。$\square$

> [!example] **例 17.2**
> 在 $\mathbb{R}$ 中，$A = (0,1]$ 的极限点集为 $[0,1]$，闭包为 $[0,1]$。
> $B = \{\frac{1}{n} \mid n \in \mathbb{N}^+\}$ 的极限点集为 $\{0\}$，闭包为 $B \cup \{0\}$。

## 17.4 Hausdorff 空间

> [!note] **定义 17.4（Hausdorff 空间）**
> 拓扑空间 $X$ 称为 **Hausdorff 空间**（或 $T_2$ 空间），若对任意两个不同点 $x \neq y \in X$，存在不交的开集 $U \ni x$ 和 $V \ni y$。

> [!note] **定理 17.8（Hausdorff 空间中单点集是闭集）**
> Hausdorff 空间的每个有限点集（特别地，每个单点集）是闭集。

**证明**：只需证每个单点集 $\{x\}$ 是闭集。任取 $y \neq x$，存在不交开集 $U \ni y$ 和 $V \ni x$。则 $U \subseteq X \setminus \{x\}$。故 $X \setminus \{x\} = \bigcup_{y \neq x} U_y$ 是开集的并，从而是开集，即 $\{x\}$ 是闭集。$\square$

> [!note] **定理 17.10（Hausdorff 空间中序列极限唯一）**
> Hausdorff 空间中，收敛序列的极限是唯一的。

**证明**：设 $x_n \to x$ 且 $x_n \to y$，$x \neq y$。取不交开集 $U \ni x$，$V \ni y$。由收敛性，存在 $N_1$ 使 $n \geqslant N_1$ 时 $x_n \in U$；存在 $N_2$ 使 $n \geqslant N_2$ 时 $x_n \in V$。取 $N = \max(N_1, N_2)$，则 $x_N \in U \cap V = \varnothing$，矛盾。$\square$

## 17.5 习题解析

> [!question] **习题 17.1**
> 设 $\mathcal{C}$ 是 $X$ 的一族子集。若 $X \setminus C \in \mathcal{T}$ 对每个 $C \in \mathcal{C}$ 成立（其中 $\mathcal{T}$ 是 $X$ 的拓扑），且 $\mathcal{C}$ 满足定理 17.1 的三条性质，证明 $\mathcal{C}$ 恰好是 $(X, \mathcal{T})$ 中所有闭集构成的族。

**证明**：这是闭集定义的直接推论——闭集的定义就是补集为开集的集合。定理 17.1 的三条性质是闭集族的特征性质。$\square$

> [!question] **习题 17.5**
> 设 $X$ 是 Hausdorff 空间。证明 $X$ 的每个有限子集是闭集。

**证明**：由定理 17.8，单点集是闭集。有限个闭集的并是闭集（定理 17.1(3)）。$\square$

> [!question] **习题 17.9**
> 设 $A \subseteq X$，$B \subseteq Y$。证明在 $X \times Y$ 的积拓扑中 $\overline{A \times B} = \overline{A} \times \overline{B}$。

**证明**：已在 §15 习题 15.5 中证明。$\square$

> [!question] **习题 17.13**
> 证明 $X$ 是 Hausdorff 空间当且仅当对角线 $\Delta = \{(x,x) \mid x \in X\}$ 在 $X \times X$ 中是闭集。

**证明**：
- ($\Rightarrow$)：任取 $(x,y) \notin \Delta$，即 $x \neq y$。由 Hausdorff 性质，存在不交开集 $U \ni x$，$V \ni y$。则 $(x,y) \in U \times V$，且 $U \times V \subseteq (X \times X) \setminus \Delta$（因 $U \cap V = \varnothing$ 意味着 $U \times V$ 中没有形如 $(z,z)$ 的点）。故 $\Delta$ 的补集是开集。
- ($\Leftarrow$)：若 $\Delta$ 是闭集，任取 $x \neq y$，则 $(x,y) \notin \Delta$，存在基开集 $U \times V \ni (x,y)$ 使得 $U \times V \subseteq (X \times X) \setminus \Delta$。这意味着 $U \cap V = \varnothing$（若有 $z \in U \cap V$，则 $(z,z) \in U \times V \cap \Delta$）。故 $X$ 是 Hausdorff 的。$\square$

## 相关链接

- 上一节：[[16_The_Subspace_Topology|§16 The Subspace Topology]]
- 下一节：[[18_Continuous_Functions|§18 Continuous Functions]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
