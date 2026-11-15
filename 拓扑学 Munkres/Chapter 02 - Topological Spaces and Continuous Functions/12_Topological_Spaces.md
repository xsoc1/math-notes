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
> 如何剥离欧氏空间 $\mathbb{R}^n$ 中依赖具体坐标与距离的度量外壳，将“开集”的本质结构提炼为任意集合上的公理化“拓扑”结构？

## 12.1 拓扑空间的定义

> [!important] **从 $\mathbb{R}^n$ 到一般拓扑——公理化的动机**
> 在欧氏空间 $\mathbb{R}^n$ 中，由开球生成的开集族具有三条最核心的代数性质：(1) 空集 $\varnothing$ 和全集 $\mathbb{R}^n$ 是开集；(2) **任意多个**开集的并集仍是开集；(3) **有限多个**开集的交集仍是开集。拓扑空间的公理化定义正是对这三条基本性质的**直接提炼**——我们将“开集”作为不加定义的原始概念，仅用这三条公理来规定开集族必须满足的封闭性。
>
> **为什么要这样定义？** 因为在数学分析与几何中，几乎所有关乎空间连续变形的核心概念（如连续映射、极限点、连通性、紧致性等）都可以脱离距离公式，纯粹用“开集”的语言来等价表述。拓扑学的深刻洞察在于：即便舍弃具体的“距离”，只要保留“哪些子集是开集”的信息，我们依然能够严格地讨论“邻近”、“逼近”与“连续性”。

> [!tip] **直观图像**
> 可以将拓扑空间直观地想象为一块可任意连续拉伸的橡皮膜。开集对应于橡皮膜上那些“不包含自身边界”的区域——只要点位于开集内部，无论往哪个方向作微小的移动，都不会跨出该区域。三条拓扑公理恰好保证了这些“无边界区域”在并运算与有限交运算下的行为与欧氏空间中的开集完全一致。

> [!note] **定义 12.1（拓扑空间 / Topological Space）**
> 设 $X$ 是一个集合。$X$ 上的一个 **拓扑（topology）** 是指 $X$ 的一个幂集子族 $\mathcal{T} \subseteq \mathcal{P}(X)$，它满足以下三条公理：
>
> 1. $\varnothing \in \mathcal{T}$ 且 $X \in \mathcal{T}$；
> 2. $\mathcal{T}$ 中任意子族的**并集**仍在 $\mathcal{T}$ 中；
> 3. $\mathcal{T}$ 中任意有限子族的**交集**仍在 $\mathcal{T}$ 中。
>
> 指定了拓扑 $\mathcal{T}$ 的集合 $X$（有时记作二元组 $(X, \mathcal{T})$）称为一个 **拓扑空间（topological space）**。若子集 $U \subseteq X$ 属于 $\mathcal{T}$，则称 $U$ 为 $X$（关于拓扑 $\mathcal{T}$）的一个 **开集（open set）**。

> [!important] 理解要点
> - **公理 (1)** 保证了空集和全空间自身永远是开集；
> - **公理 (2)** 要求对“任意并”封闭——这对应于度量空间中任意多个开球的并集依然是开集；
> - **公理 (3)** 仅要求对“有限交”封闭——**无穷多个开集的交集不一定是开集**。
>
> 例如在标准实直线 $\mathbb{R}$ 上，可数无穷多个开区间的交集 $\bigcap_{n=1}^{\infty} \left(-\frac{1}{n}, \frac{1}{n}\right) = \{0\}$ 退化为单点集，它在 $\mathbb{R}$ 的标准拓扑下不再是开集。

## 12.2 拓扑空间的典型例子

> [!example] **例 12.1（离散拓扑 / Discrete Topology）**
> 设 $X$ 为任意集合，取 $\mathcal{T} = \mathcal{P}(X)$（即 $X$ 的全体子集构成的集合族）。则 $\mathcal{T}$ 构成 $X$ 上的一个拓扑，称为 $X$ 上的 **离散拓扑（discrete topology）**。
>
> **验证**：
> 1. $\varnothing, X \in \mathcal{P}(X)$ 显然成立；
> 2. $X$ 的任意多个子集的并集仍是 $X$ 的子集，故属于 $\mathcal{P}(X)$；
> 3. 有限个子集的交集仍是 $X$ 的子集，故属于 $\mathcal{P}(X)$。

> [!example] **例 12.2（平庸拓扑 / Indiscrete Topology）**
> 设 $X$ 为任意集合，取仅含空集与全集的集族 $\mathcal{T} = \{\varnothing, X\}$。则 $\mathcal{T}$ 构成 $X$ 上的一个拓扑，称为 **平庸拓扑（indiscrete topology）** 或 **平凡拓扑（trivial topology）**。
>
> **验证**：由于 $\varnothing \cup X = X$ 且 $\varnothing \cap X = \varnothing$，对任意并与有限交均封闭，故满足全部拓扑公理。

> [!example] **例 12.3（有限补拓扑 / Finite Complement Topology）**
> 设 $X$ 为任意集合，定义集族
> $$\mathcal{T}_f = \{U \subseteq X \mid X \setminus U \text{ 是有限集}\} \cup \{\varnothing\}$$
> 则 $\mathcal{T}_f$ 是 $X$ 上的一个拓扑，称为 **有限补拓扑（finite complement topology）**（在代数几何中也常对应于一维仿射曲线上的 Zariski 拓扑）。
>
> **验证**：
> 1. 因为 $X \setminus X = \varnothing$ 是有限集，故 $X \in \mathcal{T}_f$；而 $\varnothing \in \mathcal{T}_f$ 已由定义显式包含。
> 2. 设 $\{U_\alpha\}_{\alpha \in J} \subseteq \mathcal{T}_f$ 为任意非空开集族（若全为空集则并集为 $\varnothing \in \mathcal{T}_f$）。由 De Morgan 定律有
>    $$X \setminus \bigcup_{\alpha \in J} U_\alpha = \bigcap_{\alpha \in J} (X \setminus U_\alpha)$$
>    由于每个非空 $U_\alpha$ 的补集 $X \setminus U_\alpha$ 都是有限集，任意多个有限集的交集依然是有限集，故并集 $\bigcup_{\alpha \in J} U_\alpha \in \mathcal{T}_f$。
> 3. 设 $U_1, \ldots, U_n \in \mathcal{T}_f$ 为有限个非空开集（若其中含有 $\varnothing$，则交集为 $\varnothing \in \mathcal{T}_f$）。由 De Morgan 定律有
>    $$X \setminus \bigcap_{i=1}^{n} U_i = \bigcup_{i=1}^{n} (X \setminus U_i)$$
>    因为有限个有限集的并集仍是有限集，故交集 $\bigcap_{i=1}^{n} U_i \in \mathcal{T}_f$。

> [!example] **例 12.4（可数补拓扑 / Countable Complement Topology）**
> 设 $X$ 为集合，定义
> $$\mathcal{T}_c = \{U \subseteq X \mid X \setminus U \text{ 是可数集（有限或可数无限）}\} \cup \{\varnothing\}$$
> 则 $\mathcal{T}_c$ 同样构成 $X$ 上的一个拓扑，称为 **可数补拓扑**。其公理验证与例 12.3 完全平行，只需将“有限集”替换为“可数集”，并利用集合论中的基本事实：**有限个（乃至可数个）可数集的并集仍是可数集**。

## 12.3 开集族的局部刻画与拓扑粗细比较

若在同一个集合 $X$ 上定义了两个拓扑 $\mathcal{T}$ 与 $\mathcal{T}'$，且满足 $\mathcal{T} \subseteq \mathcal{T}'$（即 $\mathcal{T}$ 中的每一个开集也是 $\mathcal{T}'$ 中的开集），则称 $\mathcal{T}'$ 比 $\mathcal{T}$ **更细（finer）**（或更大），对称地称 $\mathcal{T}$ 比 $\mathcal{T}'$ **更粗（coarser）**（或更小）。若进一步有真包含 $\mathcal{T} \subsetneq \mathcal{T}'$，则称 $\mathcal{T}'$ **严格细于（strictly finer than）** $\mathcal{T}$。显然，$X$ 上的平庸拓扑是最粗的拓扑，而离散拓扑是最细的拓扑。

> [!note] **引理 12.2 (局部开邻域族刻画)** ^theorem-12-collection
> 设 $X$ 是一个拓扑空间。对于 $X$ 的每一个点 $x$，存在包含 $x$ 的一个开邻域族 $\{U_\alpha\}$ 使得：
> - 每个 $U_\alpha$ 是包含 $x$ 的开集；
> - 若 $U$ 是包含 $x$ 的任意开集，则存在某个指标 $\alpha$ 使得 $U_\alpha \subseteq U$。
>
> *注：此性质说明每个点的开邻域族提供了刻画点局部拓扑结构的“邻域基”雏形。*

**证明**：

对任意固定的点 $x \in X$，直接取
$$\mathcal{U}_x = \{U \in \mathcal{T} \mid x \in U\}$$
即 $X$ 中所有包含点 $x$ 的开集构成的集合族。验证如下：

1. 对每个 $U_\alpha \in \mathcal{U}_x$，由 $\mathcal{U}_x$ 的定义直接有 $x \in U_\alpha$；
2. 对任意包含 $x$ 的开集 $U$，显然有 $U \in \mathcal{U}_x$。直接取该族中的元素 $U_\alpha = U$，即有 $U_\alpha \subseteq U$（此处等号成立）。

因此 $\mathcal{U}_x$ 满足引理的全部要求。$\square$

## 12.4 习题解析

> [!question] **习题 12.1（开集的逐点开邻域判据；对应原书 §13 引理 13.1）**
> 设 $X$ 是一个拓扑空间，$A$ 是 $X$ 的子集。假定对于每个 $x \in A$，都存在包含 $x$ 的开集 $U_x$ 使得 $U_x \subseteq A$。证明 $A$ 是 $X$ 中的开集。

**证明**：对每个 $x \in A$，按题设选取开集 $U_x$ 满足 $x \in U_x \subseteq A$。考察并集 $\bigcup_{x \in A} U_x$，一方面由于每个 $x \in U_x$，有 $A = \bigcup_{x \in A} \{x\} \subseteq \bigcup_{x \in A} U_x$；另一方面由于每个 $U_x \subseteq A$，有 $\bigcup_{x \in A} U_x \subseteq A$。综合两方面包含关系得
$$A = \bigcup_{x \in A} U_x$$
由于每个 $U_x$ 是开集，而根据拓扑公理 (2) 任意多个开集的并集仍是开集，故 $A$ 是开集。$\square$

> [!tip] 这道基本习题给出了拓扑学中判定子集 $A$ 为开集最常用的实用法则：**逐点在 $A$ 内寻找开邻域**。

> [!question] **习题 12.3（有限补拓扑与可数补拓扑验证；对应原书 §12 例 3–4）**
> 证明 $\mathcal{T}_f$（有限补拓扑）和 $\mathcal{T}_c$（可数补拓扑）满足拓扑公理。并证明当 $X$ 为有限集时，$X$ 上的有限补拓扑 $\mathcal{T}_f$ 就是离散拓扑。

**证明**：已在例 12.3 中完整验证了 $\mathcal{T}_f$ 满足三条拓扑公理。对于可数补拓扑 $\mathcal{T}_c$，验证过程完全类似：
1. $X \setminus X = \varnothing$ 为有限集（从而可数），故 $X \in \mathcal{T}_c$，且 $\varnothing \in \mathcal{T}_c$；
2. 任意非空开集族 $\{U_\alpha\} \subseteq \mathcal{T}_c$ 的并集满足 $X \setminus \bigcup_\alpha U_\alpha = \bigcap_\alpha (X \setminus U_\alpha)$，可数集的子集仍是可数集，故并集属于 $\mathcal{T}_c$；
3. 有限个非空开集 $U_1, \dots, U_n \in \mathcal{T}_c$ 的交集满足 $X \setminus \bigcap_{i=1}^n U_i = \bigcup_{i=1}^n (X \setminus U_i)$，由于有限个可数集的并集仍是可数集，故交集属于 $\mathcal{T}_c$。

特别地，当 $X$ 本身是有限集时，对于任意子集 $U \subseteq X$，其补集 $X \setminus U \subseteq X$ 必然也是有限集，从而恒有 $U \in \mathcal{T}_f$。这说明 $\mathcal{T}_f = \mathcal{P}(X)$，即有限集上的有限补拓扑退化为离散拓扑。$\square$

> [!question] **习题 12.4（拓扑族的交与并；对应原书 §13 Exercise 4(a) 节选, p. 83）**
> 设 $\{\mathcal{T}_\alpha\}$ 是集合 $X$ 上的一族拓扑。证明交集 $\bigcap_\alpha \mathcal{T}_\alpha$ 也是 $X$ 上的一个拓扑；而并集 $\bigcup_\alpha \mathcal{T}_\alpha$ 未必是拓扑，请给出反例。

**证明**：
1. 对每个指标 $\alpha$，均有 $\varnothing, X \in \mathcal{T}_\alpha$，故 $\varnothing, X \in \bigcap_\alpha \mathcal{T}_\alpha$。
2. 设子集族 $\{U_\beta\} \subseteq \bigcap_\alpha \mathcal{T}_\alpha$。则对每个固定的 $\alpha$，每个 $U_\beta$ 都属于拓扑 $\mathcal{T}_\alpha$，由 $\mathcal{T}_\alpha$ 对任意并封闭知 $\bigcup_\beta U_\beta \in \mathcal{T}_\alpha$。由 $\alpha$ 的任意性得 $\bigcup_\beta U_\beta \in \bigcap_\alpha \mathcal{T}_\alpha$。
3. 设 $U_1, \dots, U_n \in \bigcap_\alpha \mathcal{T}_\alpha$。则对每个 $\alpha$，有 $U_1, \dots, U_n \in \mathcal{T}_\alpha$，从而 $\bigcap_{i=1}^n U_i \in \mathcal{T}_\alpha$，故 $\bigcap_{i=1}^n U_i \in \bigcap_\alpha \mathcal{T}_\alpha$。因此 $\bigcap_\alpha \mathcal{T}_\alpha$ 是 $X$ 上的一个拓扑。

**并集非拓扑的反例**：取三元集 $X = \{a, b, c\}$，令 $\mathcal{T}_1 = \{\varnothing, \{a\}, X\}$，$\mathcal{T}_2 = \{\varnothing, \{b\}, X\}$。容易验证 $\mathcal{T}_1$ 和 $\mathcal{T}_2$ 都是 $X$ 上的拓扑。但在并集 $\mathcal{T}_1 \cup \mathcal{T}_2 = \{\varnothing, \{a\}, \{b\}, X\}$ 中，两个开集 $\{a\}$ 与 $\{b\}$ 的并集 $\{a\} \cup \{b\} = \{a, b\} \notin \mathcal{T}_1 \cup \mathcal{T}_2$，违反了拓扑对并运算封闭的公理，故 $\mathcal{T}_1 \cup \mathcal{T}_2$ 不构成拓扑。$\square$

> [!question] **习题 12.6（无限集上的有限补拓扑非 Hausdorff；补充练习，Hausdorff 定义详见 §17）**
> 设 $X$ 是无限集。证明赋予有限补拓扑 $\mathcal{T}_f$ 的空间 $(X, \mathcal{T}_f)$ 不是 Hausdorff 空间（即不存在不相交的开集能够分离任意两个不同的点）。

> [!tip] **Hausdorff 空间条件**
> $$\forall a, b \in X, \; a \neq b \implies \exists U, V \in \mathcal{T}, \text{ s.t. } (a \in U, \, b \in V) \land (U \cap V = \varnothing)$$

**证明**：由于 $X$ 是无限集，任取两个不同的点 $x \neq y \in X$。反证法：假设存在开集 $U, V \in \mathcal{T}_f$ 使得 $x \in U$，$y \in V$，且 $U \cap V = \varnothing$。
因为 $x \in U$ 且 $y \in V$，$U$ 与 $V$ 均非空，由有限补拓扑 $\mathcal{T}_f$ 的定义知补集 $X \setminus U$ 和 $X \setminus V$ 都是有限集。然而由 De Morgan 定律有：
$$(X \setminus U) \cup (X \setminus V) = X \setminus (U \cap V) = X \setminus \varnothing = X$$
这表明无限集 $X$ 是两个有限集 $X \setminus U$ 与 $X \setminus V$ 的并集，从而 $X$ 也是有限集，与题设 $X$ 为无限集矛盾！事实上，上述论证表明在无限集的有限补拓扑中，**任意两个非空开集都必定相交**，故 $(X, \mathcal{T}_f)$ 绝非 Hausdorff 空间。$\square$

## 相关链接

- 上一章：[[../Chapter 01 - Set Theory and Logic/00_Chapter_01_Overview|Chapter 1: Set Theory and Logic]]
- 下一节：[[13_Basis_for_a_Topology|§13 Basis for a Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
