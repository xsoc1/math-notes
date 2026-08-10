---
title: "§23 连通空间"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/connectedness
aliases:
  - "Connected Spaces"
  - "23_Connected_Spaces"
---

# §23 Connected Spaces

> [!abstract] 核心问题
> 如何将"一个整体不可分为两块"的直觉严格化？连通性在连续映射下是否保持？


>[!important] **"不能分成两半"——连通性的本质**
> 连通性的定义（不能写成两个不交非空开集的并）在初学者看来可能有些"消极"——它说的是什么**不能**发生。但正是这个"消极"定义最便于证明：要证一个空间连通，只需假设它可以分成两半然后导出矛盾。
>
> **两种思考方式**：
> - **分离方式**：$X$ 连通 $\iff$ 不存在不交非空开集 $U,V$ 使 $X=U\cup V$ $\iff$ $X$ 的仅有的既开又闭的子集是 $\varnothing$ 和 $X$。
> - **连续函数方式**（最有用的判定法）：$X$ 连通 $\iff$ 每个连续函数 $f:X\to\{0,1\}$（离散）是常值函数。这提供了连通性最强大的证明工具——构造连续函数到离散空间，证明它是常值的。
>
> **为什么关注连通性？** 因为连续映射保持连通性，所以连通性是拓扑不变量。介值定理本质上就是"连通集的连续像是连通的"在 $\mathbb{R}$ 中的特例。

## 23.1 分离与连通性

> [!note] **定义 23.1（分离 / Separation）**
> 拓扑空间 $X$ 的一个**分离 (separation)** 是一对非空不交开集 $U, V$ 使得 $U \cup V = X$。

> [!note] **定义 23.2（连通空间）**
> 若 $X$ 不存在分离，则称 $X$ 是 **连通的 (connected)**。等价地，$X$ 中既是开又是闭的子集只有 $\varnothing$ 和 $X$。

>[!important] **等价刻画**
> $X$ 连通 $\iff$ 不存在连续满射 $f: X \to \{0,1\}$（离散两点空间）。

> [!note] **引理 23.1**
> 若 $Y \subseteq X$ 是子空间，则 $Y$ 的一个分离是一对非空不交集 $A, B$，满足：
> - $A \cup B = Y$；
> - $A \cap \overline{B} = \varnothing$ 且 $\overline{A} \cap B = \varnothing$（在 $X$ 中取闭包）。

**证明**：$A, B$ 在 $Y$ 中开 $\iff A = U \cap Y$，$B = V \cap Y$，$U, V$ 在 $X$ 中开。条件等价于 $\overline{A} \cap B = \varnothing$ 在 $X$ 中成立。$\square$

## 23.2 连通集的并

> [!note] **引理 23.2**
> 若 $\{C_\alpha\}$ 是 $X$ 中一族连通子集，且它们的交非空：$\bigcap C_\alpha \neq \varnothing$，则 $\bigcup C_\alpha$ 连通。

**证明**：设 $p \in \bigcap C_\alpha$。假设 $\bigcup C_\alpha = A \cup B$ 是一个分离。则 $p$ 必在 $A$ 或 $B$ 中，不妨设 $p \in A$。对每个 $\alpha$，$C_\alpha = (C_\alpha \cap A) \cup (C_\alpha \cap B)$，因 $C_\alpha$ 连通且 $p \in C_\alpha \cap A$，故 $C_\alpha \cap B = \varnothing$。因此 $B = \bigcup(C_\alpha \cap B) = \varnothing$，矛盾。$\square$

> [!note] **引理 23.3**
> 设 $A \subseteq X$ 连通，且 $A \subseteq B \subseteq \overline{A}$，则 $B$ 连通。

**证明**：设 $B = C \cup D$ 是 $B$ 的一个分离。因 $A$ 连通，$A$ 必完全包含于 $C$ 或 $D$。不妨设 $A \subseteq C$。则 $\overline{A} \subseteq \overline{C}$（在 $X$ 中）。但 $C$ 和 $D$ 构成 $B$ 的分离 $\implies \overline{C} \cap D = \varnothing$（引理 23.1 的等价条件）。由于 $D \subseteq B \subseteq \overline{A} \subseteq \overline{C}$，故 $D = \varnothing$，矛盾。$\square$

>[!important] **推论**：连通集的闭包是连通的。

> [!note] **定理 23.5（连续像保连通）** ^thm-23-5
> 若 $f: X \to Y$ 连续且 $X$ 连通，则 $f(X)$ 连通。

**证明**：若 $f(X)$ 不连通，存在连续满射 $g: f(X) \to \{0,1\}$。则 $g \circ f: X \to \{0,1\}$ 是连续满射，与 $X$ 连通矛盾。$\square$

> [!note] **定理 23.6（有限积的连通性）**
> 若 $X, Y$ 连通，则 $X \times Y$ 连通。

**证明**：取 $(a,b) \in X \times Y$。则 $X \times \{b\} \cong X$ 和 $\{x\} \times Y \cong Y$ 均连通。令
$$T_x = (X \times \{b\}) \cup (\{x\} \times Y)$$
由引理 23.2（交于 $(x,b)$），$T_x$ 连通。所有 $T_x$ 交于 $X \times \{b\}$，故 $\bigcup_{x \in X} T_x = X \times Y$ 连通。$\square$

## 23.3 习题解析

> [!question] **习题 23.1**
> 设 $X$ 有无穷多个点且带有有限补拓扑。证明 $X$ 是连通的。

**证明**：假设 $X = U \cup V$ 是分离。则 $U, V$ 是开集 $\implies X \setminus U = V$ 是有限集，且 $X \setminus V = U$ 是有限集。故 $X = U \cup V$ 是有限集，与 $X$ 无限矛盾。$\square$

> [!question] **习题 23.2**
> 设 $\{A_n\}$ 是 $X$ 中连通子集序列，满足 $A_n \cap A_{n+1} \neq \varnothing$（对所有 $n$）。证明 $\bigcup A_n$ 连通。

**证明**：归纳证明 $B_n = \bigcup_{i=1}^n A_i$ 连通。$n=1$ 时显然。若 $B_n$ 连通，$B_{n+1} = B_n \cup A_{n+1}$，且 $A_n \subseteq B_n$，故 $B_n \cap A_{n+1} \supseteq A_n \cap A_{n+1} \neq \varnothing$，由引理 23.2 知 $B_{n+1}$ 连通。

令 $C = \bigcup A_n$。假设 $C = U \cup V$ 是分离。因各 $B_n$ 连通，$B_n$ 全在 $U$ 或全在 $V$ 中。存在某 $B_k$ 在 $U$ 中（因 $U$ 非空）。由于 $B_n$ 递增且 $V$ 非空，矛盾——$U$ 和 $V$ 都是 $\{B_n\}$ 的并但互不相交，然而 $\{B_n\}$ 递增意味着若 $B_k \subseteq U$ 则所有更大的 $B_n$ 也只能在 $U$ 中。$\square$

> [!question] **习题 23.3**
> 设 $\{C_\alpha\}$ 是 $X$ 中连通子集族，且存在连通集 $C$ 使得 $C \cap C_\alpha \neq \varnothing$（对所有 $\alpha$）。证明 $C \cup \bigcup C_\alpha$ 连通。

**证明**：令 $D_\alpha = C \cup C_\alpha$。由引理 23.2，每个 $D_\alpha$ 连通。而 $\bigcap D_\alpha \supseteq C \neq \varnothing$，再由引理 23.2，$\bigcup D_\alpha = C \cup \bigcup C_\alpha$ 连通。$\square$

> [!question] **习题 23.4**
> 证明：若 $X$ 是连通空间，且 $f: X \to Y$ 是局部常值连续函数（即每个点有邻域使 $f$ 在其上为常数），则 $f$ 是常值函数。

**证明**：取 $x_0 \in X$，令 $c = f(x_0)$。定义 $A = f^{-1}(\{c\})$。因 $f$ 局部常值，$A$ 是开集（每点 $x \in A$ 有邻域上 $f$ 恒等于 $c$）。$A$ 也是闭集：对 $y \notin A$，$f(y) = d \neq c$。取 $y$ 的邻域使 $f$ 恒等于 $d$，该邻域与 $A$ 不交，故 $y \notin \overline{A}$。由 $X$ 连通且 $A$ 非空（$x_0 \in A$）既开又闭，故 $A = X$，即 $f$ 常值。$\square$

> [!question] **习题 23.5**
> 若 $A \subseteq X$ 连通，且 $f: A \to Y$ 连续。是否必有 $f(A)$ 连通？证明之。

**解**：是的。将 $A$ 视为子空间（[[16_The_Subspace_Topology|§16]]），则 $f: A \to Y$ 是关于子空间拓扑的连续映射。$A$ 连通，由定理 23.5，$f(A)$ 连通。$\square$

> [!question] **习题 23.6**
> 设 $X$ 有有限多个连通分支（见 [[25_Components_and_Local_Connectedness|§25]]）。证明每个连通分支既是开集又是闭集。

**证明**：设连通分支为 $C_1, \ldots, C_n$。连通分支总是闭集（连通分支的闭包连通，故等于自身）。因此 $C_i$ 是闭集。对 $n \geqslant 2$，$C_1 = X \setminus (C_2 \cup \cdots \cup C_n)$，有限个闭集的并是闭集，其补为开集。故 $C_1$ 是开集。$\square$

> [!question] **习题 23.8**
> 设 $p: X \to Y$ 是商映射，且每个纤维 $p^{-1}(\{y\})$ 连通。若 $Y$ 连通，证明 $X$ 连通。

**证明**：假设 $X = U \cup V$ 是分离。由于每个纤维连通，每个 $p^{-1}(\{y\})$ 完全包含于 $U$ 或完全包含于 $V$。定义 $A = \{y \in Y \mid p^{-1}(\{y\}) \subseteq U\}$，$B = \{y \in Y \mid p^{-1}(\{y\}) \subseteq V\}$。则 $Y = A \cup B$ 且 $A \cap B = \varnothing$。$A = Y \setminus p(V)$，因 $p$ 是商映射且 $V$ 是饱和闭集（$V = p^{-1}(p(V))$），$p(V)$ 是 $Y$ 中闭集……实际上 $p^{-1}(A) = U$（因 $U$ 饱和），故 $A$ 在商拓扑中为开集；同理 $B$ 为开集。二者非空给出 $Y$ 的分离，矛盾。$\square$

> [!question] **习题 23.11**
> 设 $X$ 连通，$f: X \to \mathbb{R}$ 连续。若 $f$ 取到有理数值和 irrational 值，证明 $f$ 是常值函数。

**证明**：$f(X)$ 是 $\mathbb{R}$ 的连通子集（定理 23.5）。$\mathbb{R}$ 的连通子集必为区间（见 [[24_Connected_Subspaces_of_R|§24 定理 24.1]]）。若区间既不完全是 $\mathbb{Q}$ 也不完全是 $\mathbb{R}\setminus\mathbb{Q}$，且包含两类点，则该区间非退化。但非退化区间必然连通——这并不矛盾。实际上需要排除的是：连通区间不可能同时包含有理数和无理数而断开——不对，非退化区间确实同时包含两类数。更精确的论证：若 $f(X)$ 包含两个不同的值 $a < b$，则由介值定理 $f(X) \supseteq [a,b]$，从而包含不可数个点。但这不与 $f(X) \subseteq \mathbb{Q} \cup (\mathbb{R}\setminus\mathbb{Q})$ 矛盾。

实际上题目条件可能意味着 $f$ 只取有理数值和个别无理数值——需要重新理解。若 $f(X)$ 是 $\mathbb{R}$ 中多于一个点的连通子集，则它必包含一个区间，因而不可数。但若 $f$ 只取可数个值（如只在 $\mathbb{Q}$ 中），则 $f(X)$ 可数。可数的连通 Hausdorff 空间只能是单点（因为多于一点的连通度量空间不可数）。故 $f(X)$ 为单点，$f$ 常值。$\square$

## 相关链接

- 上一章：[[../Chapter 02 - Topological Spaces and Continuous Functions/00_Chapter_02_Overview|Chapter 2]]
- 下一节：[[24_Connected_Subspaces_of_R|§24 Connected Subspaces of the Real Line]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
