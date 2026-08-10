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
> 给定拓扑空间 $X$ 和子集 $Y \subseteq X$，如何在 $Y$ 上自然地定义一个拓扑，使其与 $X$ 的拓扑"兼容"？


>[!important] **子空间拓扑——"相对化"的思想**
> 子空间拓扑是拓扑学中最频繁使用的构造之一。给定拓扑空间 $X$ 和子集 $Y$，我们如何让 $Y$ 也成为拓扑空间？自然的想法是：$Y$ 中的开集应当是 $X$ 的开集与 $Y$ 的交——因为 $Y$ 的"内部结构"应该继承自 $X$。
>
> **关键直觉**：$Y$ 作为 $X$ 的子空间时，$Y$ 中的"开"和 $X$ 中的"开"是两回事。例如 $[0,1]$ 在 $\mathbb{R}$ 的子空间拓扑中，$[0,1/2)$ 是**开集**（因为 $[0,1/2)=(-1,1/2)\cap[0,1]$），尽管它在 $\mathbb{R}$ 中不是开集。"子空间开"不蕴含"母空间开"——除非 $Y$ 本身是 $X$ 的开子集（引理 16.3）。

## 16.1 子空间拓扑的定义

> [!note] **定义 16.1（子空间拓扑 / Subspace Topology）**
> 设 $(X, \mathcal{T})$ 是拓扑空间，$Y \subseteq X$。$Y$ 上的 **子空间拓扑 (subspace topology)** 定义为：
> $$\mathcal{T}_Y = \{U \cap Y \mid U \in \mathcal{T}\}$$
> 即 $Y$ 中的开集恰是 $X$ 中开集与 $Y$ 的交。

>[!important] 验证 $\mathcal{T}_Y$ 确实是拓扑：
>1. $\varnothing = \varnothing \cap Y \in \mathcal{T}_Y$，$Y = X \cap Y \in \mathcal{T}_Y$。
>2. 设 $\{V_\alpha\} \subseteq \mathcal{T}_Y$，$V_\alpha = U_\alpha \cap Y$，则 $\bigcup V_\alpha = (\bigcup U_\alpha) \cap Y \in \mathcal{T}_Y$。
>3. 设 $V_1, V_2 \in \mathcal{T}_Y$，则 $V_1 \cap V_2 = (U_1 \cap Y) \cap (U_2 \cap Y) = (U_1 \cap U_2) \cap Y \in \mathcal{T}_Y$。

> [!note] **引理 16.1（子空间基）** ^theorem-16-1
> 若 $\mathcal{B}$ 是 $X$ 的拓扑的一个基，则 $\mathcal{B}_Y = \{B \cap Y \mid B \in \mathcal{B}\}$ 是 $Y$ 的子空间拓扑的一个基。

**证明**：任取 $Y$ 中开集 $V = U \cap Y$（$U \in \mathcal{T}$）和 $y \in V$。则 $y \in U$，由 $\mathcal{B}$ 是基知存在 $B \in \mathcal{B}$ 使得 $y \in B \subseteq U$。故 $y \in B \cap Y \subseteq U \cap Y = V$。由引理 13.2，$\mathcal{B}_Y$ 是子空间拓扑的基。$\square$

## 16.2 子空间中的开集与闭集

> [!note] **引理 16.2（子空间开集的传递性）**
> 设 $Y \subseteq X$ 是子空间，$A \subseteq Y$。则 $A$ 在 $Y$ 中是开集 $\iff$ 存在 $X$ 中开集 $U$ 使得 $A = U \cap Y$。


**证明**：由子空间拓扑的定义，$\mathcal{T}_Y = \{U \cap Y \mid U \in \mathcal{T}_X\}$。故
$$A \text{ 在 } Y \text{ 中开} \iff A \in \mathcal{T}_Y \iff \exists\, U \in \mathcal{T}_X \text{ 使得 } A = U \cap Y$$
$\square$


> [!note] **引理 16.3**
> 若 $Y$ 是 $X$ 的开子集，则 $Y$ 的子空间拓扑中的开集也是 $X$ 中的开集。若 $Y$ 是 $X$ 的闭子集，类似结论对闭集成立。

**证明**：
- **开集情形**：设 $A$ 在 $Y$ 中开。由引理 16.2，存在 $X$ 中开集 $U$ 使得 $A = U \cap Y$。因 $Y$ 在 $X$ 中开，故 $A = U \cap Y$ 为两个开集的交，从而在 $X$ 中开。
- **闭集情形**：设 $A$ 在 $Y$ 中闭。由习题 16.1（或子空间闭集的定义），存在 $X$ 中闭集 $C$ 使得 $A = C \cap Y$。因 $Y$ 在 $X$ 中闭，故 $A = C \cap Y$ 为两个闭集的交，从而在 $X$ 中闭。
$\square$

## 16.3 习题解析

> [!question] **习题 16.1**
> 证明：若 $Y$ 是 $X$ 的子空间，$A \subseteq Y$，则 $A$ 在 $Y$ 中是闭集当且仅当 $A$ 是 $X$ 中某个闭集与 $Y$ 的交。

**证明**：$A$ 在 $Y$ 中闭 $\iff Y \setminus A$ 在 $Y$ 中开 $\iff Y \setminus A = U \cap Y$（$U$ 在 $X$ 中开）$\iff A = Y \setminus (U \cap Y) = Y \cap (X \setminus U)$。而 $X \setminus U$ 在 $X$ 中是闭集。$\square$

> [!question] **习题 16.3**
> 把 $[0,1]$ 视为 $\mathbb{R}$ 的子空间。集合 $[0, \frac{1}{2})$ 在子空间拓扑中是否为开集？是否为闭集？

**解**：$[0, \frac{1}{2}) = (-\frac{1}{2}, \frac{1}{2}) \cap [0,1]$，而 $(-\frac{1}{2}, \frac{1}{2})$ 在 $\mathbb{R}$ 中开，故 $[0, \frac{1}{2})$ 在 $[0,1]$ 的子空间拓扑中是**开集**。但它不是闭集：极限点 $\frac{1}{2} \in [0,1]$ 属于其闭包但不属于该集合。

> [!question] **习题 16.4**
> 子空间拓扑的基的性质：若 $\mathcal{B}$ 是 $X$ 的基，则 $\{B \cap Y \mid B \in \mathcal{B}\}$ 是 $Y$ 的基。利用这一事实，给出 $\mathbb{R}$ 的子集 $Y = [0,1] \cup (2,3)$ 上的子空间拓扑的一个基。

**解**：取 $\mathbb{R}$ 的标准基 $\mathcal{B} = \{(a,b) \mid a<b\}$。则 $Y$ 的子空间拓扑的基为
$$\{(a,b) \cap Y \mid a<b\}$$
这会给出形如 $[0, b)$、$(a, 1]$、$(a,b)$（$a>b$ 在 $[0,1]$ 内）、以及 $(a,b)$（在 $(2,3)$ 内）等集合。

> [!question] **习题 16.8**
> 设 $L$ 是 $\mathbb{R}^2$ 中的一条直线。则 $L$ 上的子空间拓扑与 $\mathbb{R}$ 同胚（同胚的定义见 [[18_Continuous_Functions#18.4 同胚|§18.4]]）。

**证明**：设 $L$ 由 $y = mx + c$ 给出（或 $x = c$ 的铅垂线）。定义 $f: \mathbb{R} \to L$ 为 $f(t) = (t, mt+c)$（铅垂线类似）。$f$ 是连续的双射（分量连续），其逆为投影，也连续。故 $f$ 是同胚。$\square$

## 相关链接

- 上一节：[[15_The_Product_Topology_on_XxY|§15 The Product Topology on X×Y]]
- 下一节：[[17_Closed_Sets_and_Limit_Points|§17 Closed Sets and Limit Points]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
