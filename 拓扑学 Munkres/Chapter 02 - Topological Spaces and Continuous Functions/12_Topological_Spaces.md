---
title: "§12 拓扑空间"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/topological-space
aliases:
  - "Topological Spaces"
  - "12_Topological_Spaces"
---

# §12 Topological Spaces

> [!abstract] 核心问题
> 如何将 $\mathbb{R}^n$ 中开集的性质抽象为任意集合上的"拓扑"结构？

## 12.1 拓扑空间的定义

>[!important] **从 $mathbb{R}^n$ 到一般拓扑——公理化的动机**
> 在 $mathbb{R}^n$ 中，开集有三个性质：(1) $arnothing$ 和 $mathbb{R}^n$ 是开集；(2) 任意多个开集的并仍是开集；(3) **有限**多个开集的交仍是开集。拓扑空间的公理正是对这三个性质的**直接抽象**——把"开集"作为不加定义的基本概念，仅用三条公理约束它们的行为。
>
> **为什么要这样定义？** 因为 $mathbb{R}^n$ 中几乎所有重要的拓扑概念（连续、紧、连通……）都可以仅用"开集"来表述。拓扑学的核心洞察是：我们可以扔掉"距离"，只保留"开集"，依然能谈论"附近"、"极限"和"连续性"。

>[!tip] **直觉图像**
> 将拓扑空间想象为一块橡皮膜。开集是橡皮膜上那些"不包含边界"的区域——你可以在开集内部任意拉伸变形，但不会碰到"边缘"。三条公理保证这些"无边界区域"的行为与 $mathbb{R}^n$ 中的开集一致。


> [!note] **定义 12.1（拓扑空间）**
> 设 $X$ 是一个集合。$X$ 上的一个 **拓扑 (topology)** 是指 $X$ 的一个子集族 $\mathcal{T} \subseteq \mathcal{P}(X)$，满足以下三条公理：
>
> 1. $\varnothing \in \mathcal{T}$ 且 $X \in \mathcal{T}$；
> 2. $\mathcal{T}$ 中任意子族的**并**仍在 $\mathcal{T}$ 中；
> 3. $\mathcal{T}$ 中任意有限子族的**交**仍在 $\mathcal{T}$ 中。
>
> 此时称 $(X, \mathcal{T})$ 为一个 **拓扑空间 (topological space)**，$\mathcal{T}$ 中的成员称为 **开集 (open set)**。

>[!important] 理解要点
>- 公理 (1) 保证空集和全集是开集；
>- 公理 (2) 是"任意并"封闭——这与度量空间中开球任意并仍是开集对应；
>- 公理 (3) 仅要求"有限交"封闭——无限多个开集的交**不一定**是开集。
>
>  例如 $\bigcap_{n=1}^{\infty} (-\frac{1}{n}, \frac{1}{n}) = \{0\}$ 在 $\mathbb{R}$ 中不是开集。

## 12.2 拓扑空间的例子

> [!example] **例 12.1（离散拓扑 / Discrete Topology）**
> 设 $X$ 为任意集合，取 $\mathcal{T} = \mathcal{P}(X)$（即 $X$ 的所有子集）。则 $\mathcal{T}$ 是 $X$ 上的一个拓扑，称为 **离散拓扑 (discrete topology)**。
>
> **验证**：
> 1. $\varnothing, X \in \mathcal{P}(X)$。
> 2. 任意子集族的并仍是 $X$ 的子集，故属于 $\mathcal{P}(X)$。
> 3. 有限个子集的交仍是子集，故属于 $\mathcal{P}(X)$。

> [!example] **例 12.2（平庸拓扑 / Indiscrete Topology）**
> 设 $X$ 为任意集合，取 $\mathcal{T} = \{\varnothing, X\}$。则 $\mathcal{T}$ 是 $X$ 上的一个拓扑，称为 **平庸拓扑 (indiscrete topology)** 或 **平凡拓扑 (trivial topology)**。
>
> **验证**：$\varnothing \cup X = X$，$\varnothing \cap X = \varnothing$，均满足公理。

> [!example] **例 12.3（有限补拓扑 / Finite Complement Topology）**
> 设 $X$ 为集合，定义
> $$\mathcal{T}_f = \{U \subseteq X \mid X \setminus U \text{ 是有限集}\} \cup \{\varnothing\}$$
> 则 $\mathcal{T}_f$ 是 $X$ 上的一个拓扑，称为 **有限补拓扑 (finite complement topology)**。
>
> **验证**：
> 1. $X \setminus X = \varnothing$ 是有限集，故 $X \in \mathcal{T}_f$；$\varnothing \in \mathcal{T}_f$ 由定义。
> 2. 设 $\{U_\alpha\}_{\alpha \in J} \subseteq \mathcal{T}_f$，则
>    $$X \setminus \bigcup_{\alpha} U_\alpha = \bigcap_{\alpha} (X \setminus U_\alpha)$$
>    每个 $X \setminus U_\alpha$ 是有限集，任意多个有限集的交仍是有限集，故并集 $\bigcup_\alpha U_\alpha \in \mathcal{T}_f$。
> 3. 设 $U_1, \ldots, U_n \in \mathcal{T}_f$，则
>    $$X \setminus \bigcap_{i=1}^{n} U_i = \bigcup_{i=1}^{n} (X \setminus U_i)$$
>    有限个有限集的并是有限集，故 $\bigcap_{i=1}^{n} U_i \in \mathcal{T}_f$。

> [!example] **例 12.4（可数补拓扑 / Countable Complement Topology）**
> $$\mathcal{T}_c = \{U \subseteq X \mid X \setminus U \text{ 是可数集}\} \cup \{\varnothing\}$$
> 验证方法类似，将"有限"改为"可数"。需注意**可数个可数集的并仍是可数集**。

## 12.3 开集族的性质

> [!note] **引理 12.2（Lemma 12.2）** ^theorem-12-collection
> 设 $X$ 是一个拓扑空间。对于 $X$ 的每一个点 $x$，存在 $x$ 的一个开邻域族 $\{U_\alpha\}$ 使得：
> - 每个 $U_\alpha$ 包含 $x$；
> - 若 $U$ 是包含 $x$ 的任意开集，则存在 $\alpha$ 使得 $U_\alpha \subseteq U$。
>
> *注：此引理说明每个点的所有开邻域构成一个"邻域基"的雏形。*

**证明**: 

对任意 $x \in X$，令
$$
\mathcal{U}_x = \{U \in \mathcal{T} \mid x \in U\}
$$
即 $X$ 中所有包含 $x$ 的开集构成的族。验证如下：

1. 对每个 $U_\alpha \in \mathcal{U}_x$，由 $\mathcal{U}_x$ 的定义直接有 $x \in U_\alpha$。
2. 对任意包含 $x$ 的开集 $U$，有 $U \in \mathcal{U}_x$。取 $U_\alpha = U$，则 $U_\alpha \subseteq U$（等号成立）。

因此 $\mathcal{U}_x$ 满足引理要求。$\square$

## 12.4 习题解析

> [!question] **习题 12.1**
> 设 $X$ 是一个拓扑空间，$A$ 是 $X$ 的子集。假定对于每个 $x \in A$，存在包含 $x$ 的开集 $U_x$ 使得 $U_x \subseteq A$。证明 $A$ 是开集。

**证明**：对每个 $x \in A$，选取开集 $U_x$ 满足 $x \in U_x \subseteq A$。则
$$A = \bigcup_{x \in A} \{x\} \subseteq \bigcup_{x \in A} U_x \subseteq A$$
故 $A = \bigcup_{x \in A} U_x$。由于每个 $U_x$ 是开集，且任意多个开集的并是开集（公理 2），故 $A$ 是开集。$\square$

>[!tip] 这个习题给出了判定开集的一个实用方法：逐点验证。

> [!question] **习题 12.3**
> 证明 $\mathcal{T}_f$（有限补拓扑）和 $\mathcal{T}_c$（可数补拓扑）满足拓扑公理。并证明在有限集 $X$ 上，$\mathcal{T}_f$ 就是离散拓扑。

**证明**：已在例 12.3 中验证 $\mathcal{T}_f$ 满足三条公理。$\mathcal{T}_c$ 的验证类似，需要用到"可数个可数集的并是可数集"这一事实。

当 $X$ 为有限集时，任意子集 $U \subseteq X$ 的补集 $X \setminus U$ 都是有限集，故 $U \in \mathcal{T}_f$，即 $\mathcal{T}_f = \mathcal{P}(X)$。$\square$

> [!question] **习题 12.4**
> 设 $\{\mathcal{T}_\alpha\}$ 是 $X$ 上的一族拓扑。证明 $\bigcap_\alpha \mathcal{T}_\alpha$ 也是 $X$ 上的一个拓扑。$\bigcup_\alpha \mathcal{T}_\alpha$ 是否是拓扑？给出反例。

**证明**：
1. 对每个 $\alpha$，$\varnothing, X \in \mathcal{T}_\alpha$，故 $\varnothing, X \in \bigcap_\alpha \mathcal{T}_\alpha$。
2. 设 $\{U_\beta\} \subseteq \bigcap_\alpha \mathcal{T}_\alpha$，则对每个 $\alpha$，$U_\beta \in \mathcal{T}_\alpha$，故 $\bigcup_\beta U_\beta \in \mathcal{T}_\alpha$。因此 $\bigcup_\beta U_\beta \in \bigcap_\alpha \mathcal{T}_\alpha$。
3. 有限交同理。

**反例**：取 $X = \{a, b, c\}$，$\mathcal{T}_1 = \{\varnothing, \{a\}, X\}$，$\mathcal{T}_2 = \{\varnothing, \{b\}, X\}$。则 $\{a\} \cup \{b\} = \{a, b\} \notin \mathcal{T}_1 \cup \mathcal{T}_2$（因 $\{a, b\}$ 不在任何一个拓扑中），故并集不构成拓扑。

> [!question] **习题 12.6**
> 设 $X$ 是无限集。证明 $\mathcal{T}_f$ 不是 Hausdorff 的（即存在两个不同的点不能被不相交的开集分离）。

>[!tip] **Hausdorff空间**
>$$
>\forall a, b \in X, a \neq b, \exists U, V \in \mathcal{T}, s.t.(a \in U, b \in V)\land (U \cap V = \emptyset)
>$$

**证明**：任取 $x \neq y \in X$。假设存在开集 $U, V \in \mathcal{T}_f$ 使得 $x \in U$，$y \in V$，且 $U \cap V = \varnothing$。
则 $X \setminus U$ 和 $X \setminus V$ 都是有限集，从而 $(X \setminus U) \cup (X \setminus V) = X \setminus (U \cap V) = X \setminus \varnothing = X$ 是有限集——与 $X$ 是无限集矛盾。故 $\mathcal{T}_f$ 非 Hausdorff。$\square$

## 相关链接

- 上一章：[[../Chapter 01 - Set Theory and Logic/00_Chapter_01_Overview|Chapter 1: Set Theory and Logic]]
- 下一节：[[13_Basis_for_a_Topology|§13 Basis for a Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
