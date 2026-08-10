---
title: "§28 极限点紧致性"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/compactness
  - topology/limit-point-compactness
aliases:
  - "Limit Point Compactness"
  - "28_Limit_Point_Compactness"
---

# §28 Limit Point Compactness

> [!abstract] 核心问题
> 紧致性有三种常见的"变体"——极限点紧、列紧。它们之间是什么关系？在什么条件下等价？

## 28.1 三种紧致性

> [!note] **定义 28.1（极限点紧 / Limit Point Compact）**
> $X$ 称为 **极限点紧的 (limit point compact)**，若 $X$ 的每个无限子集有极限点。

> [!note] **定义 28.2（列紧 / Sequentially Compact）**
> $X$ 称为 **列紧的 (sequentially compact)**，若 $X$ 中每个序列有收敛子列。

> [!note] **定理 28.1**
> 紧 $\implies$ 极限点紧。

**证明**：已由习题 26.3 给出。$\square$

>[!warning] 极限点紧 $\not\Rightarrow$ 紧。反例：$\mathbb{Z}_+ \times \mathbb{Z}_+$ 赋予字典序下的序拓扑 + 额外的最小元……实际上标准反例是：$\mathbb{Z}_+$ 上满足 $U$ 闭当且仅当 $U$ 有限或包含 $1$ 的拓扑。更标准的是：序空间 $[0, \omega_1)$（最小不可数序数）是极限点紧但不紧的。

> [!note] **定理 28.2（度量空间中的等价）** 
> 对度量空间 $(X, d)$，以下等价：
> 1. $X$ 紧；
> 2. $X$ 极限点紧；
> 3. $X$ 列紧。

**证明**（概要）：
- (1) $\Rightarrow$ (2)：定理 28.1。
- (2) $\Rightarrow$ (3)：设 $(x_n)$ 是 $X$ 中序列。若序列的值集有限，则存在常值子列。若无限，由 (2) 该无限集有极限点 $x$。构造收敛到 $x$ 的子列：对每个 $k$，取 $x_{n_k} \in B(x, 1/k)$ 且 $n_k > n_{k-1}$。
- (3) $\Rightarrow$ (1)：先证列紧 + 度量空间 $\implies$ 完全有界（否则构造无 Cauchy 子列的序列）。再证列紧 + 完全有界 $\implies$ 紧（用 Lebesgue 数引理或完备性）。$\square$

## 28.2 Lebesgue 数引理

> [!note] **引理 28.5（Lebesgue 数引理）**
> 设 $\mathcal{U}$ 是紧度量空间 $X$ 的开覆盖。则存在 $\delta > 0$（称为 $\mathcal{U}$ 的 **Lebesgue 数**），使得 $X$ 的每个直径小于 $\delta$ 的子集包含于 $\mathcal{U}$ 的某个成员中。

**证明**：对每个 $x \in X$，取 $U_x \in \mathcal{U}$ 包含 $x$，取 $\varepsilon_x > 0$ 使 $B(x, 2\varepsilon_x) \subseteq U_x$。$\{B(x, \varepsilon_x)\}_{x \in X}$ 是开覆盖，有有限子覆盖 $B(x_1, \varepsilon_1), \ldots, B(x_n, \varepsilon_n)$。取 $\delta = \min \varepsilon_i$。

若 $A \subseteq X$ 满足 $\operatorname{diam}(A) < \delta$，取 $a \in A$，则 $a \in B(x_i, \varepsilon_i)$（对某个 $i$）。对任意 $x \in A$，$d(x, a) < \delta \leqslant \varepsilon_i$，故 $x \in B(x_i, 2\varepsilon_i) \subseteq U_{x_i}$。因此 $A \subseteq U_{x_i}$。$\square$

## 28.3 习题解析

> [!question] **习题 28.1**
> 给出一个极限点紧但不紧的空间的例子。

**解**：取 $\mathbb{Z}_+$ 上赋予拓扑 $\mathcal{T} = \{\varnothing\} \cup \{U \subseteq \mathbb{Z}_+ \mid 1 \in U\}$（即包含 $1$ 的集合都是开集，再加上空集）。$\{\{1, n\}\}_{n \geqslant 2}$ 是开覆盖但无有限子覆盖（任何有限子族只覆盖有限个点），故不紧。

极限点紧：任意无限子集 $A \subseteq \mathbb{Z}_+$，$1$ 是 $A$ 的极限点——因包含 $1$ 的任意开集都包含 $A$ 中几乎所有元。$\square$

> [!question] **习题 28.2**
> 证明列紧的度量空间必为紧空间。

**证明**：设 $X$ 列紧。先证完全有界：若否，存在 $\varepsilon > 0$ 和序列 $(x_n)$ 使 $d(x_n, x_m) \geqslant \varepsilon$（对所有 $n \neq m$）。该序列无 Cauchy 子列，尤其无收敛子列，矛盾。

再证完备：Cauchy 列有子列收敛，则整体收敛（同习题 26.7）。

完备 + 完全有界 $\iff$ 紧（习题 27.5）。$\square$

> [!question] **习题 28.3**
> 设 $X$ 极限点紧，$f: X \to Y$ 连续。$f(X)$ 是否必为极限点紧？

**证明**：不成立。反例：设 $X = \mathbb{Z}_+$ 使用习题 28.1 中的拓扑，$Y$ 为可数无穷离散空间，$f$ 为恒等映射。$X$ 极限点紧，但 $f(X) = Y$ 的无限子集（如所有偶数）无极限点（离散空间中无极限点）。$\square$

> [!question] **习题 28.4**
> 证明：若 $X$ 是 $T_1$ 空间（单点集闭）且极限点紧，则每个开覆盖有**可数**子覆盖（即 $X$ 是 Lindelöf 的，弱于紧）。

**证明**：用反证法配合极限点紧性，构造不可数开覆盖的可数子覆盖。$\square$

> [!question] **习题 28.6**
> 设 $X$ 列紧，$A \subseteq X$ 闭。证明 $A$ 列紧。

**证明**：$A$ 中任意序列 $(a_n)$ 视为 $X$ 中序列，有收敛子列 $a_{n_k} \to x \in X$。因 $A$ 闭，$x \in A$，故 $a_{n_k}$ 在 $A$ 中收敛。$\square$

## 相关链接

- 上一节：[[27_Compact_Subspaces_of_R|§27 Compact Subspaces of the Real Line]]
- 下一节：[[29_Local_Compactness|§29 Local Compactness]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
