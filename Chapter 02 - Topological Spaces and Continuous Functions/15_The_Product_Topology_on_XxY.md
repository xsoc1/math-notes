---
title: "§15 积拓扑（有限积）"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/product-topology
aliases:
  - "The Product Topology on X×Y"
  - "15_The_Product_Topology_on_XxY"
---

# §15 The Product Topology on $X \times Y$

> [!abstract] 核心问题
> 给定两个拓扑空间 $X$ 和 $Y$，如何在笛卡尔积 $X \times Y$ 上定义一个"自然的"拓扑，使得投影映射是连续的？

## 15.1 积拓扑的定义

> [!note] **定义 15.1（积拓扑 / Product Topology）**
> 设 $(X, \mathcal{T}_X)$ 和 $(Y, \mathcal{T}_Y)$ 是拓扑空间。$X \times Y$ 上的 **积拓扑 (product topology)** 由以下集合作为基 $\mathcal{B}$ 生成：
> $$\mathcal{B} = \{U \times V \mid U \in \mathcal{T}_X,\; V \in \mathcal{T}_Y\}$$
> 即基成员是 $X$ 中开集与 $Y$ 中开集的笛卡尔积。

>[!important] 理解要点
>- 积拓扑的开集 = 形如 $U \times V$ 的"矩形开集"的任意并；
>- 若 $\mathcal{B}_X$ 和 $\mathcal{B}_Y$ 分别是 $X$ 和 $Y$ 的基，则 $\{B_X \times B_Y\}$ 是 $X \times Y$ 上积拓扑的一个基。

> [!note] **定理 15.1（积拓扑的基）**
> 若 $\mathcal{B}_X$ 是 $X$ 的基，$\mathcal{B}_Y$ 是 $Y$ 的基，则
> $$\mathcal{C} = \{B \times C \mid B \in \mathcal{B}_X,\; C \in \mathcal{B}_Y\}$$
> 是 $X \times Y$ 上积拓扑的一个基。

**证明**：任取开集 $W \subseteq X \times Y$ 和 $(x, y) \in W$。由积拓扑定义，存在 $U \in \mathcal{T}_X$，$V \in \mathcal{T}_Y$ 使得 $(x,y) \in U \times V \subseteq W$。由基的性质，存在 $B \in \mathcal{B}_X$ 和 $C \in \mathcal{B}_Y$ 使得 $x \in B \subseteq U$，$y \in C \subseteq V$。故 $(x,y) \in B \times C \subseteq U \times V \subseteq W$。由引理 13.2，$\mathcal{C}$ 是积拓扑的基。$\square$

## 15.2 投影映射

> [!note] **定义 15.2（投影映射）**
> 定义投影映射 $\pi_1: X \times Y \to X$ 和 $\pi_2: X \times Y \to Y$：
> $$\pi_1(x, y) = x,\quad \pi_2(x, y) = y$$

> [!note] **定理 15.2（投影的连续性）**
> 投影映射 $\pi_1$ 和 $\pi_2$ 关于积拓扑是连续函数（连续函数的定义见 [[18_Continuous_Functions|§18]]）。

**证明**：对任意开集 $U \subseteq X$，$\pi_1^{-1}(U) = U \times Y$，这是积拓扑基成员的并（即开集）。故 $\pi_1$ 连续。$\pi_2$ 同理。$\square$

>[!tip] 积拓扑是使得两个投影映射都连续的 **最粗拓扑**（见 [[18_Continuous_Functions#18.3 积拓扑是使投影连续的最粗拓扑|§18.3]]）。

## 15.3 习题解析

> [!question] **习题 15.1**
> 证明：若 $X$ 和 $Y$ 的拓扑分别由基 $\mathcal{B}_X$ 和 $\mathcal{B}_Y$ 生成，则 $X \times Y$ 的积拓扑由 $\{B \times C \mid B \in \mathcal{B}_X, C \in \mathcal{B}_Y\}$ 生成。

**证明**：即定理 15.1 的内容。$\square$

> [!question] **习题 15.2**
> 给出 $X \times Y$ 中不是基成员（矩形）的开集的例子。

**解**：取 $X = Y = \mathbb{R}$。集合 $W = \{(x, y) \mid |x| + |y| < 1\}$（开菱形）是开集，但无法表示为单个矩形 $U \times V$。事实上，$W$ 是无穷多个开矩形的并：$W = \bigcup_{(x,y) \in W} B_\varepsilon(x) \times B_\varepsilon(y)$。

> [!question] **习题 15.5**
> 设 $A \subseteq X$，$B \subseteq Y$。证明在积拓扑中 $\overline{A \times B} = \overline{A} \times \overline{B}$（闭包的概念见 [[17_Closed_Sets_and_Limit_Points|§17]]）。

**证明**：$(x,y) \in \overline{A \times B} \iff$ 每个包含 $(x,y)$ 的基开集 $U \times V$ 与 $A \times B$ 相交 $\iff$ 每个包含 $x$ 的开集 $U$ 与 $A$ 相交且每个包含 $y$ 的开集 $V$ 与 $B$ 相交 $\iff x \in \overline{A}$ 且 $y \in \overline{B} \iff (x,y) \in \overline{A} \times \overline{B}$。$\square$

## 相关链接

- 上一节：[[14_The_Order_Topology|§14 The Order Topology]]
- 下一节：[[16_The_Subspace_Topology|§16 The Subspace Topology]]
- 积拓扑的任意推广：[[19_The_Product_Topology|§19 The Product Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
