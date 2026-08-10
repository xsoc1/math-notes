---
title: "§25 连通分支与局部连通性"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/connectedness
  - topology/components
aliases:
  - "Components and Local Connectedness"
  - "25_Components_and_Local_Connectedness"
---

# §25 Components and Local Connectedness

> [!abstract] 核心问题
> 如何将空间分解为最大的连通"块"？如何让拓扑在局部层面也是连通的？

## 25.1 连通分支

> [!note] **定义 25.1（连通分支 / Component）**
> 设 $X$ 是拓扑空间。定义关系 $x \sim y$ 当且仅当存在 $X$ 的连通子集同时包含 $x$ 和 $y$。这是一个等价关系。其等价类称为 $X$ 的**连通分支 (components)**。

>[!important] 连通分支是极大的连通子集：若 $C$ 是分支且 $C \subseteq D$ 且 $D$ 连通，则 $C = D$。

> [!note] **定理 25.1（连通分支的性质）**
> 1. 每个连通分支是闭集；
> 2. 不同分支互不相交；
> 3. 所有分支的并等于 $X$；
> 4. 连续映射将分支映入分支。

**证明**（(1)）：设 $C$ 是分支。$\overline{C}$ 是连通的（引理 23.3），且包含 $C$，由极大性得 $\overline{C} = C$。$\square$

## 25.2 道路连通分支

> [!note] **定义 25.2（道路连通分支）**
> 定义关系 $x \sim_p y$ 当且仅当存在从 $x$ 到 $y$ 的道路。这是等价关系。等价类称为 **道路连通分支 (path components)**。

>[!warning] 道路连通分支不一定是闭集。例如拓扑学家的正弦曲线 $\overline{S}$ 有两个道路连通分支（$S$ 本身和 $\{0\} \times [-1,1]$），但 $S$ 在 $\overline{S}$ 中不是闭集。

## 25.3 局部连通性

> [!note] **定义 25.3（局部连通 / Locally Connected）**
> $X$ 称为 **局部连通的 (locally connected)**，若对每个 $x \in X$ 和每个包含 $x$ 的开集 $U$，存在连通开集 $V$ 满足 $x \in V \subseteq U$。

> [!note] **定理 25.3**
> $X$ 局部连通 $\iff$ $X$ 的每个开集的每个连通分支是开集。

**证明**：
- ($\Rightarrow$)：设 $U$ 是开集，$C$ 是 $U$ 的连通分支。任取 $x \in C \subseteq U$，由局部连通性，存在连通开集 $V$ 满足 $x \in V \subseteq U$。因 $C$ 是包含 $x$ 的极大连通子集，$V \subseteq C$。故 $x$ 是 $C$ 的内点，$C$ 开。
- ($\Leftarrow$)：任给 $x$ 和开邻域 $U$，取 $U$ 的包含 $x$ 的连通分支 $C$，则 $C$ 是包含 $x$ 的连通开集且 $C \subseteq U$。$\square$

> [!note] **定理 25.4**
> 局部连通空间中，连通分支既是开集又是闭集。
**证明**：设 $C$ 为 $X$ 的一个连通分支，任取 $x \in C$。由 $X$ 局部连通，存在 $x$ 的连通开邻域 $U$。由于 $C$ 是包含 $x$ 的极大连通子集，而 $U$ 是包含 $x$ 的连通子集，故 $U \subseteq C$。因此 $C$ 包含其每个点的开邻域，从而 $C$ 为开集。

连通分支构成 $X$ 的一个划分，故 $X \setminus C$ 为其余所有连通分支的并。每个连通分支均为开集，任意多开集的并仍为开集，故 $X \setminus C$ 为开集，即 $C$ 为闭集。$\square$

> [!note] **定理 25.5**
> 连通且局部道路连通的空间是道路连通的。

**证明**：设 $X$ 连通且局部道路连通。取 $x_0 \in X$，令
$$P = \{y \in X \mid \exists \text{ 从 } x_0 \text{ 到 } y \text{ 的道路}\}$$
往证 $P = X$。$P$ 非空（$x_0 \in P$）。对任意 $y \in P$，由局部道路连通性，存在道路连通开邻域 $U \ni y$，则 $U \subseteq P$（通过连接道路）。故 $P$ 开。同理 $X \setminus P$ 开。由 $X$ 连通和 $P$ 非空，$P = X$。$\square$

>[!important] 在流形理论中，连通 + 局部道路连通 $\iff$ 道路连通。（流形总是局部道路连通的）

## 25.4 习题解析

> [!question] **习题 25.1**
> 设 $X$ 有有限个连通分支。证明每个分支是开集。

**证明**：设分支 $C_1, \ldots, C_n$。每个 $C_i$ 是闭集。对 $i \neq j$，$C_i \cap C_j = \varnothing$。故 $C_1 = X \setminus \bigcup_{i=2}^n C_i$，为有限个闭集之并的补，是开集。$\square$

> [!question] **习题 25.2**
> 设 $X$ 局部连通。证明每个连通分支是开集。

**证明**：$X$ 本身是开集。由定理 25.3，$X$ 的每个连通分支是开集。$\square$

> [!question] **习题 25.3**
> $\mathbb{Q}$ 的连通分支是什么？道路连通分支呢？

**解**：$\mathbb{Q}$ 的连通子集只能是单点集（因为介于两有理数 a<b 之间必有无理数，故 $\mathbb{Q}\cap(-\infty,c)$ 和 $\mathbb{Q}\cap(c,+\infty)$ 分离包含 a,b 的集合）。因此连通分支 = 单点集。同理，道路连通分支也是单点集（$\mathbb{Q}$ 完全不连通）。$\square$

> [!question] **习题 25.4**
> 证明 $\mathbb{R}_\ell$（下限拓扑）的连通分支是单点集。

**证明**：假设 $A \subseteq \mathbb{R}_\ell$ 多于一个点，$a < b \in A$。取 $c$ 满足 $a < c < b$。则 $(-\infty, c)$ 和 $[c, +\infty)$ 是 $\mathbb{R}_\ell$ 中不交的开集，覆盖 $\mathbb{R}_\ell$。它们与 $A$ 的交分离 $A$（因 $a \in (-\infty, c)$，$b \in [c, +\infty)$）。故 $A$ 不连通。$\square$

> [!question] **习题 25.5**
> 证明 $\mathbb{R}^\omega$ 在积拓扑下是连通的，但在一致拓扑下不连通。

**证明**：$\mathbb{R}^\omega$ 作为连通空间的可数积是连通的。一致拓扑：有界序列集 $B$ 和无界序列集 $U$ 都是一致拓扑中的开集（因 $B_{\overline{\rho}}(x, 1/2)$ 全由有界序列或无界序列组成），故一致拓扑下 $\mathbb{R}^\omega = B \cup U$ 是分离。$\square$

> [!question] **习题 25.7**
> 设 $X$ 是可数个闭子集的并，每个子集有不连通补。证明 $X$ 不可能是 $\mathbb{R}^n$。

**证明**：这实际上是关于 Baire 范畴定理的应用。$\mathbb{R}^n$ 是完备度量空间。若 $\mathbb{R}^n = \bigcup_{n} C_n$，每个 $C_n$ 闭且 $\mathbb{R}^n \setminus C_n$ 不连通。由 Baire 定理（见 Chapter 8），某 $C_n$ 有非空内部……这与补集不连通产生矛盾（因 $\mathbb{R}^n$ 中开集的补闭包必须有界等）。详细证明见 Chapter 8。$\square$

## 相关链接

- 上一节：[[24_Connected_Subspaces_of_R|§24 Connected Subspaces of the Real Line]]
- 下一节：[[26_Compact_Spaces|§26 Compact Spaces]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
