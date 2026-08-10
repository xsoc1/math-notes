---
title: "§19 积拓扑（任意积）"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/product-topology
  - topology/box-topology
aliases:
  - "The Product Topology"
  - "19_The_Product_Topology"
---

# §19 The Product Topology (Arbitrary Products)

> [!abstract] 核心问题
> 有限积的拓扑如何推广到任意多个（甚至不可数多个）空间的积？积拓扑与箱拓扑有何区别？为何积拓扑是"正确"的选择？

## 19.1 定义

> [!note] **定义 19.1（箱拓扑 / Box Topology）**
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间。在笛卡尔积 $\prod_{\alpha \in J} X_\alpha$ 上定义**箱拓扑 (box topology)**，其基为：
> $$\mathcal{B}_{\text{box}} = \left\{\prod_{\alpha \in J} U_\alpha \;\middle|\; U_\alpha \subseteq X_\alpha \text{ 开集}\right\}$$

> [!note] **定义 19.2（积拓扑 / Product Topology）**
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间。在 $\prod_{\alpha \in J} X_\alpha$ 上定义**积拓扑 (product topology)**，其基为：
> $$\mathcal{B}_{\text{prod}} = \left\{\prod_{\alpha \in J} U_\alpha \;\middle|\; U_\alpha \subseteq X_\alpha \text{ 开集，且除有限个 } \alpha \text{ 外 } U_\alpha = X_\alpha\right\}$$

>[!important] 关键区别：
>- 箱拓扑：**每个**坐标分量都可以是任意开集；
>- 积拓扑：**只有有限个**坐标分量可以是真正子集，其余必须是全空间。
>
>对于**有限积**，二者一致（因为"除有限个外等于全空间"在 $J$ 有限时无约束）。对于**无限积**，积拓扑粗于箱拓扑。

## 19.2 积拓扑的子基

积拓扑可以由以下子基 $\mathcal{S}$ 生成：
$$\mathcal{S} = \{\pi_\beta^{-1}(U_\beta) \mid \beta \in J,\; U_\beta \subseteq X_\beta \text{ 开}\}$$
其中 $\pi_\beta: \prod X_\alpha \to X_\beta$ 是到第 $\beta$ 个坐标的投影映射。

$\mathcal{S}$ 中有限个成员的交恰好是积拓扑的基成员。

## 19.3 积拓扑的关键定理

> [!note] **定理 19.6（到积空间的连续性）** ^theorem-19-6
> 设 $f: A \to \prod_{\alpha \in J} X_\alpha$，其分量函数为 $f_\alpha = \pi_\alpha \circ f$。则 $f$ 连续（关于积拓扑）$\iff$ 每个 $f_\alpha$ 连续。

**证明**：
- ($\Rightarrow$)：投影 $\pi_\alpha$ 关于积拓扑连续（$\pi_\alpha^{-1}(U)$ 是子基成员），复合连续函数仍连续。
- ($\Leftarrow$)：积拓扑由子基 $\mathcal{S} = \{\pi_\alpha^{-1}(U_\alpha) \mid U_\alpha \subseteq X_\alpha \text{ 开}\}$ 生成。对任意子基成员 $\pi_\alpha^{-1}(U_\alpha)$，$f^{-1}(\pi_\alpha^{-1}(U_\alpha)) = f_\alpha^{-1}(U_\alpha)$ 由 $f_\alpha$ 连续知是开集。有限交和任意并保持开集性质，故 $f$ 连续。$\square$

>[!important] 积拓扑正是使得所有投影映射连续且使到积空间的映射连续性判定最简的拓扑。

> [!example] **例 19.1（$\mathbb{R}^\omega$）**
> $\mathbb{R}^\omega = \prod_{n \in \mathbb{N}} \mathbb{R}$（可数个 $\mathbb{R}$ 的积）。
> - 箱拓扑中：$\prod_{n} (-\frac{1}{n}, \frac{1}{n})$ 是开集；
> - 积拓扑中：只有形如 $\prod_{n} U_n$（其中仅有限个 $U_n \neq \mathbb{R}$）的集合是基成员。
>
> 序列 $x^{(n)} = (\frac{1}{n}, \frac{1}{n}, \ldots)$ 在积拓扑中收敛到 $(0,0,\ldots)$，但在箱拓扑中**不收敛**（因为 $\prod (-\frac{1}{n^2}, \frac{1}{n^2})$ 是包含 $(0,0,\ldots)$ 的箱开集，但对任意 $n$，第 $n$ 项 $\frac{1}{n} \notin (-\frac{1}{n^2}, \frac{1}{n^2})$）。

## 19.4 习题解析

> [!question] **习题 19.1**
> 证明箱拓扑确实是一个拓扑（即验证 $\mathcal{B}_{\text{box}}$ 是基）。

**证明**：
1. 覆盖性：每个 $x = (x_\alpha) \in \prod X_\alpha$，取 $U_\alpha = X_\alpha$，则 $x \in \prod X_\alpha \in \mathcal{B}_{\text{box}}$。
2. 交条件：设 $\prod U_\alpha$ 和 $\prod V_\alpha$ 是基成员，则 $(\prod U_\alpha) \cap (\prod V_\alpha) = \prod (U_\alpha \cap V_\alpha)$，后者仍是基成员。$\square$

> [!question] **习题 19.3**
> 证明 $\mathbb{R}^\omega$ 在箱拓扑中不是连通的（连通性见 Chapter 3），但在积拓扑中是连通的。

**证明**（概要）：
箱拓扑：$\mathbb{R}^\omega = A \cup B$，其中 $A$ 为有界序列，$B$ 为无界序列——二者都是箱拓扑中的开集，故不连通。
积拓扑：$\mathbb{R}^\omega$ 关于积拓扑是连通空间的乘积，其连通性由 Tychonoff 定理的连通版本保证。

> [!question] **习题 19.7**
> 设 $\mathbb{R}^\infty \subseteq \mathbb{R}^\omega$ 为仅有限个分量非零的序列构成的子空间。在箱拓扑与积拓扑下，闭包分别是什么？

**解**：
- 积拓扑：$\overline{\mathbb{R}^\infty} = \mathbb{R}^\omega$（每个基开集与 $\mathbb{R}^\infty$ 相交）；
- 箱拓扑：$\overline{\mathbb{R}^\infty} = \mathbb{R}^\infty$（$\mathbb{R}^\infty$ 在箱拓扑中已是闭集）。原因：对任意 $x \notin \mathbb{R}^\infty$（无穷多个分量非零），可构造箱开集 $\prod U_n$ 使其与 $\mathbb{R}^\infty$ 不交——取 $U_n = \mathbb{R} \setminus \{x_n\}$ 当 $x_n \neq 0$。

## 相关链接

- 上一节：[[18_Continuous_Functions|§18 Continuous Functions]]
- 下一节：[[20_The_Metric_Topology_I|§20 The Metric Topology I]]
- 有限积拓扑：[[15_The_Product_Topology_on_XxY|§15 The Product Topology on X×Y]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
