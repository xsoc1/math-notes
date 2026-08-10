---
title: "§13 拓扑基"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/basis
aliases:
  - "Basis for a Topology"
  - "13_Basis_for_a_Topology"
---

# §13 Basis for a Topology

> [!abstract] 核心问题
> 如何用较少的"基本开集"来生成整个拓扑？如何判断一族集合能否成为某个拓扑的基？


>[!important] **基的直观**
> 在 $\mathbb{R}^n$ 中，每个开集可以写成开球的并。开球全体就是标准拓扑的基。在一般拓扑空间中，基的作用完全相同：基是一族"基本建筑块"，所有开集都由基成员的任意并生成。一个拓扑可以有多个不同的基（就像同一空间可以有不同的坐标系），但基唯一决定了拓扑。
>
> **为什么需要基？** 因为直接描述所有开集往往很困难（比如 $\mathbb{R}$ 中有不可数个开集），但描述一个基往往很简单（比如所有开区间）。基是"生成"拓扑的经济方式。

## 13.1 基的定义

> [!note] **定义 13.1（基 / Basis）**
> 设 $X$ 是一个集合。$X$ 上的一个 **基 (basis)** 是指 $X$ 的一个子集族 $\mathcal{B} \subseteq \mathcal{P}(X)$，满足：
>
> 1. 对于每个 $x \in X$，存在至少一个 $B \in \mathcal{B}$ 使得 $x \in B$（$\mathcal{B}$ **覆盖** $X$）；
> 2. 若 $x \in B_1 \cap B_2$（其中 $B_1, B_2 \in \mathcal{B}$），则存在 $B_3 \in \mathcal{B}$ 使得 $x \in B_3 \subseteq B_1 \cap B_2$。
>
> 由 $\mathcal{B}$ **生成的拓扑** $\mathcal{T}$ 定义为：
> $$\mathcal{T} = \left\{\bigcup_{\alpha} B_\alpha \;\middle|\; \{B_\alpha\} \subseteq \mathcal{B}\right\}$$
> 即 $\mathcal{T}$ 由 $\mathcal{B}$ 中成员的任意并构成。此时称 $\mathcal{B}$ 是拓扑 $\mathcal{T}$ 的一个基。

>[!important] 理解要点
>- 条件 (1) 等价于 $\bigcup_{B \in \mathcal{B}} B = X$；
>- 条件 (2) 等价于：$B_1 \cap B_2$ 是 $\mathcal{B}$ 中某些成员的并；
>- 基的直观意义：用"积木块" $\mathcal{B}$ 通过任意并拼出所有开集。

> [!note] **引理 13.1（基生成拓扑的检验）** ^theorem-13-1
> 设 $\mathcal{B}$ 是 $X$ 上的一个基。则由 $\mathcal{B}$ 生成的族
> $$\mathcal{T} = \{U \subseteq X \mid \forall x \in U, \exists B \in \mathcal{B} \text{ s.t. } x \in B \subseteq U\}$$
> 恰好是 $X$ 上的一个拓扑，且 $\mathcal{B}$ 是 $\mathcal{T}$ 的一个基。
>
> **证明**：
> - $\varnothing$ 空洞地满足条件，$X$ 由基的条件 (1) 保证。
> - 任意并：设 $\{U_\alpha\} \subseteq \mathcal{T}$，任取 $x \in \bigcup_\alpha U_\alpha$，则 $x$ 属于某个 $U_\alpha$，由 $U_\alpha \in \mathcal{T}$ 知存在 $B \in \mathcal{B}$ 使得 $x \in B \subseteq U_\alpha \subseteq \bigcup_\alpha U_\alpha$。
> - 有限交：设 $U_1, U_2 \in \mathcal{T}$，任取 $x \in U_1 \cap U_2$，则存在 $B_1, B_2 \in \mathcal{B}$ 使得 $x \in B_1 \subseteq U_1$ 且 $x \in B_2 \subseteq U_2$。由基的条件 (2)，存在 $B_3 \in \mathcal{B}$ 使得 $x \in B_3 \subseteq B_1 \cap B_2 \subseteq U_1 \cap U_2$。有限交由归纳法推广。

## 13.2 基的判定准则

> [!note] **引理 13.2（基的判定准则）** ^theorem-13-2
> 设 $X$ 是一个拓扑空间，其拓扑为 $\mathcal{T}$。设 $\mathcal{C}$ 是 $X$ 的一族开集。若对于每个开集 $U \in \mathcal{T}$ 和每个 $x \in U$，存在 $C \in \mathcal{C}$ 使得 $x \in C \subseteq U$，则 $\mathcal{C}$ 是 $\mathcal{T}$ 的一个基。
>
> **证明**：首先验证 $\mathcal{C}$ 是基：
> 1. 因 $X \in \mathcal{T}$，对每个 $x \in X$，存在 $C \in \mathcal{C}$ 使得 $x \in C \subseteq X$，故 $\mathcal{C}$ 覆盖 $X$。
> 2. 设 $C_1, C_2 \in \mathcal{C}$，由于它们是开集，$C_1 \cap C_2 \in \mathcal{T}$。任取 $x \in C_1 \cap C_2$，存在 $C_3 \in \mathcal{C}$ 使得 $x \in C_3 \subseteq C_1 \cap C_2$。
>
> 由引理 13.1，$\mathcal{C}$ 生成的拓扑恰为 $\mathcal{T}$。$\square$

## 13.3 子基

> [!note] **定义 13.2（子基 / Subbasis）**
> 设 $X$ 是一个集合。$X$ 上的一个 **子基 (subbasis)** $\mathcal{S}$ 是 $X$ 的一个子集族，其所有成员的并等于 $X$。由 $\mathcal{S}$ 生成的拓扑定义为：
> - 先取 $\mathcal{S}$ 中**有限个**成员的交所构成的族 $\mathcal{B}$（$\mathcal{B}$ 是基）；
> - 再由 $\mathcal{B}$ 通过任意并生成拓扑。

## 13.4 标准拓扑的基

> [!example] **例 13.1（$\mathbb{R}$ 的标准拓扑）**
> 取 $\mathcal{B} = \{(a, b) \mid a < b, a,b \in \mathbb{R}\}$（所有开区间），则 $\mathcal{B}$ 是 $\mathbb{R}$ 上标准拓扑的一个基。

> [!example] **例 13.2（$\mathbb{R}^2$ 的标准拓扑）**
> 取 $\mathcal{B} = \{B(x, r) \mid x \in \mathbb{R}^2, r > 0\}$（所有开圆盘），或者取
> $\mathcal{B}' = \{(a, b) \times (c, d) \mid a<b, c<d\}$（开矩形）。二者生成**相同**的拓扑。

>[!important] 同一个拓扑可以由不同的基生成——只要它们生成的并族相同即可。

## 13.5 习题解析

> [!question] **习题 13.1**
> 设 $X$ 是一个拓扑空间，$A \subseteq X$。假定对于每个 $x \in A$，存在 $X$ 的一个子集族 $\mathcal{C}$（其成员包含 $x$ 且包含于 $A$）使得 $\mathcal{C}$ 是 $X$ 的拓扑的一个基。证明 $A$ 是开集。

**证明**：由条件，对每个 $x \in A$，存在基成员 $B_x \in \mathcal{C}$ 使得 $x \in B_x \subseteq A$。则 $A = \bigcup_{x \in A} B_x$。由于每个 $B_x$ 是开集（基成员），$A$ 是开集的并，故 $A$ 是开集。$\square$

> [!question] **习题 13.3**
> 证明由 $\mathcal{B} = \{[a, b) \mid a < b, a,b \in \mathbb{R}\}$ 生成的拓扑（下限拓扑 $\mathbb{R}_\ell$）严格细于 $\mathbb{R}$ 的标准拓扑。

**证明**：对任意开区间 $(a, b)$，可写成 $(a, b) = \bigcup_{n=1}^{\infty} [a+\frac{1}{n}, b)$，故每个标准开集在下限拓扑中也是开集，所以下限拓扑细于标准拓扑。

反之，$[0, 1)$ 在下限拓扑中是开集（它是基成员），但在标准拓扑中不是开集（不存在包含 $0$ 的开区间完全包含于 $[0, 1)$）。因此下限拓扑**严格细于**标准拓扑。$\square$

> [!question] **习题 13.5**
> 设 $\mathcal{B} = \{(a, b) \mid a, b \in \mathbb{Q}, a < b\}$。证明 $\mathcal{B}$ 生成 $\mathbb{R}$ 上的标准拓扑。

**证明**：任取 $x \in \mathbb{R}$ 和开区间 $(c, d)$ 包含 $x$。由有理数的稠密性，存在有理数 $a, b$ 使得 $c < a < x < b < d$，从而 $x \in (a, b) \subseteq (c, d)$。由引理 13.2，$\mathcal{B}$ 是标准拓扑的基。$\square$

> [!question] **习题 13.8**
> 证明由 $\mathbb{R}^2$ 中所有铅垂区间 $\{x\} \times (a, b)$ 的族生成的拓扑与标准拓扑不同。

**解**：铅垂区间族生成的拓扑中，每个开集是铅垂线段的并。但例如开圆盘 $B((0,0), 1)$ 无法表示为铅垂线段的并——因为铅垂线段的任意并的"水平截面"始终是离散点，而开圆盘的水平截面是区间。故两种拓扑不同。

## 相关链接

- 上一节：[[12_Topological_Spaces|§12 Topological Spaces]]
- 下一节：[[14_The_Order_Topology|§14 The Order Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
