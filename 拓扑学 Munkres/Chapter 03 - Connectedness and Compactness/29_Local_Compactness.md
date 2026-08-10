---
title: "§29 局部紧致性"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/compactness
  - topology/local-compactness
aliases:
  - "Local Compactness"
  - "29_Local_Compactness"
---

# §29 Local Compactness

> [!abstract] 核心问题
> 如何让空间在"局部"层面是紧的？如何通过添加一个点将局部紧 Hausdorff 空间紧化？

## 29.1 局部紧致性

> [!note] **定义 29.1（局部紧 / Locally Compact）**
> $X$ 称为 **局部紧的 (locally compact)**，若对每个 $x \in X$，存在 $X$ 的紧子集 $C$ 使得 $x \in \operatorname{Int}(C)$（即 $C$ 包含 $x$ 的一个邻域）。

>[!important] **等价表述（Hausdorff 空间）**：$X$ 局部紧 Hausdorff $\iff$ 对每个 $x$ 和每个开邻域 $U \ni x$，存在紧集 $C$ 满足 $x \in \operatorname{Int}(C) \subseteq C \subseteq U$。

> [!example] **例 29.1**
> - $\mathbb{R}^n$ 局部紧（每个点有紧邻域：闭球）；
> - $\mathbb{Q}$ 不局部紧（任何区间包含无理极限点，闭包不是紧的）；
> - 任意紧空间是局部紧的；
> - $\mathbb{R}^\omega$（积拓扑）不局部紧（任何基开集 $\prod U_n$ 中只有有限个 $U_n \neq \mathbb{R}$，其闭包 $\prod \overline{U}_n$ 不是紧的——因无限积中紧需每个因子紧，但 $\overline{U}_n = \mathbb{R}$ 对几乎所有 $n$）。

## 29.2 单点紧化

> [!note] **定理 29.1（单点紧化 / One-Point Compactification）** ^thm-29-1
> 设 $X$ 是局部紧 Hausdorff 空间（非紧）。取 $\infty \notin X$，令 $Y = X \cup \{\infty\}$。定义 $Y$ 上的拓扑：
> - $X$ 中原有的开集；
> - 所有形如 $Y \setminus C$ 的集合，其中 $C \subseteq X$ 紧。
>
> 则 $Y$ 是紧 Hausdorff 空间，$X$ 是 $Y$ 的子空间，且 $\overline{X} = Y$。

**证明**（概要）：
- **$Y$ 是拓扑空间**：验证任意并和有限交封闭（需要用到 $X$ 局部紧 Hausdorff 保证的不同紧集的交仍是紧的等性质）。
- **$Y$ Hausdorff**：若 $x, y \in X$，由 $X$ Hausdorff 可分离。若 $x \in X$，需分离 $x$ 和 $\infty$：由 $X$ 局部紧，取紧集 $C$ 满足 $x \in \operatorname{Int}(C)$。则 $\operatorname{Int}(C)$ 和 $Y \setminus C$ 分离二者。
- **$Y$ 紧**：任意开覆盖 $\mathcal{U}$ 中有一个成员包含 $\infty$，即 $Y \setminus C$（$C \subseteq X$ 紧）。其余成员覆盖 $C$，由 $C$ 紧性取有限子覆盖，加上 $Y \setminus C$ 即得 $Y$ 的有限子覆盖。
- **$\overline{X} = Y$**：因 $X$ 非紧，$\infty$ 的任何邻域与 $X$ 相交非空（否则 $X$ 为紧集），故 $\infty \in \overline{X}$。$\square$

> [!example] **例 29.2**
> - $S^n$ 是 $\mathbb{R}^n$ 的单点紧化：$S^n \cong \mathbb{R}^n \cup \{\infty\}$（通过球极投影）。
> - $\mathbb{N}$ 的单点紧化同胚于 $\{0\} \cup \{\frac{1}{n} \mid n \in \mathbb{N}^+\}$（收敛序列及其极限）。

## 29.3 习题解析

> [!question] **习题 29.1**
> 证明有理数集 $\mathbb{Q}$ 不是局部紧的。

**证明**：取 $0 \in \mathbb{Q}$。假设存在紧集 $C \subseteq \mathbb{Q}$ 和 $\mathbb{Q}$ 中开集 $U$ 满足 $0 \in U \subseteq C$。$U$ 包含 $(-\varepsilon, \varepsilon) \cap \mathbb{Q}$。取无理数 $r \in (-\varepsilon, \varepsilon)$。存在 $\mathbb{Q}$ 中序列 $(q_n) \subseteq U$ 使 $q_n \to r$。在 $\mathbb{Q}$ 中 $(q_n)$ 无收敛子列（极限 $r$ 不在 $\mathbb{Q}$ 中），故 $C$ 不列紧。但 $\mathbb{Q}$ 可度量化，从而 $C$ 不紧，矛盾。$\square$

> [!question] **习题 29.2**
> 证明局部紧 Hausdorff 空间的开子集是局部紧的。

**证明**：设 $U \subseteq X$ 开，$x \in U$。由 $X$ 局部紧，存在 $X$ 中紧集 $C$ 和 $X$ 中开集 $V$ 满足 $x \in V \subseteq C$。则 $U \cap V$ 在 $U$ 中开，$U \cap C$ 在 $X$ 中是闭的（因 Hausdorff 中紧集闭）……需要更细致：$U \cap C$ 作为 $C$ 的闭子集是紧的（定理 26.2）。而 $x \in U \cap V \subseteq U \cap C$，且 $U \cap V$ 在 $U$ 中开。$\square$

> [!question] **习题 29.3**
> 证明局部紧 Hausdorff 空间的闭子集是局部紧的。

**证明**：设 $F \subseteq X$ 闭，$x \in F$。由 $X$ 局部紧 Hausdorff，存在 $X$ 中紧集 $C$ 和开集 $U$ 满足 $x \in U \subseteq C$。则 $F \cap C$ 是紧集（$C$ 紧，$F \cap C$ 在 $C$ 中闭），且 $x \in F \cap U \subseteq F \cap C$。$F \cap U$ 是 $F$ 中 $x$ 的邻域。$\square$

> [!question] **习题 29.4**
> 证明 $\mathbb{R}^\omega$（积拓扑）中任何一个基开集 $\prod U_n$（除有限个外 $U_n = \mathbb{R}$）的闭包不是紧的。

**证明**：$\overline{\prod U_n} = \prod \overline{U}_n$。对几乎所有的 $n$，$\overline{U}_n = \overline{\mathbb{R}} = \mathbb{R}$，不紧。在积拓扑下，若乘积紧则每个因子紧。$\mathbb{R}$ 不紧，故乘积不紧。$\square$

> [!question] **习题 29.5**
> 设 $X$ 局部紧 Hausdorff。证明 $X$ 的每个紧子集是闭集（已由定理 26.3 给出，但需要 $X$ Hausdorff 即可）。

**证明**：Hausdorff 空间中紧子集闭——定理 26.3 已证。$\square$

> [!question] **习题 29.7**
> 设 $X$ 局部紧 Hausdorff。证明 $X$ 有一个由闭包为紧的开集构成的基。

**证明**：对每个 $x \in X$ 和开邻域 $U \ni x$，取开集 $V$ 满足 $x \in V \subseteq \overline{V} \subseteq U$ 且 $\overline{V}$ 紧。所有这样的 $V$ 构成所需之基。这恰是局部紧 Hausdorff 空间的标准特征。$\square$

> [!question] **习题 29.9**
> 设 $f: X \to Y$ 是局部紧 Hausdorff 空间之间的连续满射，且 $f$ 是**真映射 (proper)**（紧集的原像紧）。证明 $Y$ 局部紧。

**证明**：取 $y \in Y$。因 $f$ 满，存在 $x \in f^{-1}(\{y\})$。由 $X$ 局部紧，$x$ 有紧邻域 $C$。$f(C)$ 紧（定理 26.5），且 $y \in f(\operatorname{Int}(C)) \subseteq \operatorname{Int}(f(C))$（因 $f$ 开？不一定）。需要真映射的条件。$\square$

## 相关链接

- 上一节：[[28_Limit_Point_Compactness|§28 Limit Point Compactness]]
- 下一章：[[../Chapter 04/00_Chapter_04_Overview|Chapter 4: Countability and Separation Axioms]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
