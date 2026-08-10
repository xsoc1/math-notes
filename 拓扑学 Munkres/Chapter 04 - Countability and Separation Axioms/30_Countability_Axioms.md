---
title: "§30 可数性公理"
date: 2026-07-28
tags:
  - topology/munkres/chapter4
  - topology/countability
aliases:
  - "The Countability Axioms"
  - "30_Countability_Axioms"
---

# §30 The Countability Axioms

> [!abstract] 核心问题
> 在拓扑空间上附加"可数性条件"（第一可数、第二可数、可分、Lindelöf）后，空间获得哪些额外性质？这些条件之间有何蕴含关系？在度量空间中它们是否等价？


>[!important] **可数性条件——"大小"的拓扑刻画**
> 可数性公理从根本上刻画了拓扑空间的"大小"。它们回答一个核心问题：拓扑空间中的拓扑结构在多大程度上可以被"可数多个"信息确定？
>
> - **第一可数**：每点的局部拓扑由可数个邻域确定——这意味着"序列语言"有效（闭包、连续性可用序列刻画）。
> - **第二可数**：整个空间的拓扑由可数个基成员生成——这是最强的可数性条件，蕴含可分和 Lindelöf，也是 Urysohn 度量化定理的核心前提。
> - **可分**：存在可数稠密子集——空间在"点"的层面上不大。
> - **Lindelöf**：每个开覆盖有可数子覆盖——空间在"覆盖"的意义上不大。
>
> **度量空间中的等价性**（定理 30.5）是可数性理论中最漂亮的结果之一：三个看似不同的"小性"条件在度量空间框架下完美统一。$\mathbb{R}_\ell$ 之所以重要，正是因为它打破了这一等价——可分且 Lindelöf，却非第二可数。

## 30.1 定义

> [!note] **定义 30.1（第一可数 / First-Countable）** ^theorem-30-1
> 空间 $X$ 称为 **第一可数的 (first-countable)**，若 $X$ 的每一点 $x$ 都有一个可数的邻域基。

> [!example] **例 30.1**
> - 任意度量空间是第一可数的：取 $B_d(x, 1/n)$（$n \in \mathbb{N}^+$）即为可数邻域基。
> - $\mathbb{R}$（标准拓扑）是第一可数的。
> - 不可数集上的有限补拓扑**不是**第一可数的。
> - $\mathbb{R}^\omega$（积拓扑）是第一可数的。

> [!note] **定义 30.2（第二可数 / Second-Countable）** ^theorem-30-2
> 空间 $X$ 称为 **第二可数的 (second-countable)**，若 $X$ 有一个可数基。

> [!example] **例 30.2**
> - $\mathbb{R}^n$（标准拓扑）是第二可数的：基 $\mathcal{B} = \{\prod (a_i, b_i) \mid a_i, b_i \in \mathbb{Q}\}$ 可数。
> - $\mathbb{R}^\omega$（积拓扑）是第二可数的。
> - 不可数离散拓扑空间**不是**第二可数的。
> - $\mathbb{R}_\ell$（下限拓扑）**不是**第二可数的。

> [!note] **定义 30.3（可分 / Separable）** ^theorem-30-3
> 空间 $X$ 称为 **可分的 (separable)**，若 $X$ 有一个可数稠密子集。

> [!example] **例 30.3**
> - $\mathbb{R}^n$ 是可分的（$\mathbb{Q}^n$ 是可数稠密子集）。
> - $\mathbb{R}_\ell$ 是可分的（$\mathbb{Q}$ 是稠密子集）。
> - 不可数离散空间**不是**可分的。
> - Sorgenfrey 平面 $\mathbb{R}_\ell^2$ 是可分的（$\mathbb{Q}^2$ 稠密）。

> [!note] **定义 30.4（Lindelöf）** ^theorem-30-4
> 空间 $X$ 称为 **Lindelöf 空间**，若 $X$ 的每个开覆盖都有可数子覆盖。

> [!example] **例 30.4**
> - $\mathbb{R}^n$ 是 Lindelöf 的。
> - $\mathbb{R}_\ell$ 是 Lindelöf 的（尽管它不是第二可数的——关键反例！）。
> - 不可数离散空间不是 Lindelöf 的。
> - $\mathbb{R}^\omega$（箱拓扑）**不是** Lindelöf 的。

## 30.2 蕴含关系

> [!note] **定理 30.2（第二可数 ⇒ 第一可数）**
> 每个第二可数空间是第一可数的。

**证明**：设 $\mathcal{B}$ 是 $X$ 的可数基。对 $x \in X$，取 $\mathcal{B}_x = \{B \in \mathcal{B} \mid x \in B\}$。$\mathcal{B}_x \subseteq \mathcal{B}$ 可数；对任意包含 $x$ 的开集 $U$，因 $\mathcal{B}$ 是基，存在 $B \in \mathcal{B}_x$ 使 $B \subseteq U$。故 $\mathcal{B}_x$ 是 $x$ 处的可数邻域基。$\square$

> [!note] **定理 30.3（第二可数 ⇒ 可分）**
> 每个第二可数空间是可分的。

**证明**：设 $\mathcal{B} = \{B_n\}_{n \in \mathbb{N}}$ 为 $X$ 的可数基。从每个非空的 $B_n$ 中选取 $x_n \in B_n$（需要选择公理的可数形式），令 $D = \{x_n\}$。$D$ 可数。对任意非空开集 $U$，存在 $B_n \subseteq U$，故 $x_n \in U \cap D$，$D$ 稠密。$\square$

> [!note] **定理 30.4（第二可数 ⇒ Lindelöf）**
> 每个第二可数空间是 Lindelöf 的。

**证明**：设 $\mathcal{B} = \{B_n\}$ 为可数基，$\mathcal{U}$ 为任意开覆盖。对每个 $n$，若 $B_n$ 包含于某个 $U \in \mathcal{U}$，选取一个这样的 $U_n$。则 $\{U_n\}$ 可数。对任意 $x \in X$，存在 $U \in \mathcal{U}$ 含 $x$，又存在 $B_n$ 使 $x \in B_n \subseteq U$，故 $U_n$ 被选取且 $x \in U_n$。$\square$

> [!note] **定理 30.5（度量空间中的等价性）** ^theorem-30-5
> 设 $X$ 是度量空间。则以下等价：
> 1. $X$ 是第二可数的；
> 2. $X$ 是 Lindelöf 的；
> 3. $X$ 是可分的。

**证明**：
- **(1) ⇒ (2)**：定理 30.4。
- **(2) ⇒ (3)**：对每个 $n \in \mathbb{N}^+$，开覆盖 $\{B_d(x, 1/n) \mid x \in X\}$ 有可数子覆盖，设其中心集合为 $C_n$。令 $D = \bigcup_{n} C_n$，则 $D$ 可数。对任意 $x \in X$ 和 $\varepsilon > 0$，取 $n > 1/\varepsilon$，存在 $y \in C_n$ 使 $x \in B_d(y, 1/n)$，即 $d(x,y) < 1/n < \varepsilon$。故 $D$ 稠密。
- **(3) ⇒ (1)**：设 $D = \{d_n\}$ 为可数稠密子集。令 $\mathcal{B} = \{B_d(d_n, 1/m) \mid n,m \in \mathbb{N}^+\}$，则 $\mathcal{B}$ 可数。往证 $\mathcal{B}$ 是基：设 $U$ 开，$x \in U$。取 $\varepsilon > 0$ 使 $B_d(x, \varepsilon) \subseteq U$。取 $m$ 使 $1/m < \varepsilon/2$，取 $d_n \in D \cap B_d(x, 1/m)$。则 $x \in B_d(d_n, 1/m) \subseteq B_d(x, \varepsilon) \subseteq U$（三角不等式：$d(x,y) < 1/m$ 且 $d(d_n,y) < 1/m$ 时 $d(x,y) \leqslant d(x,d_n)+d(d_n,y) < 2/m < \varepsilon$）。$\square$

>[!important] 在一般拓扑空间中，第二可数 ⇒ 可分且 Lindelöf，但反向均不成立。$\mathbb{R}_\ell$ 既是可分的又是 Lindelöf 的，却非第二可数——经典反例。

## 30.3 遗传性与乘性

> [!note] **定理 30.6（子空间）**
> - 第一可数空间的子空间是第一可数的。
> - 第二可数空间的子空间是第二可数的。
> - Lindelöf 性**不一定**遗传给子空间（$\mathbb{R}_\ell^2$ 是 Lindelöf 的吗？实际上 Sorgenfrey 平面非 Lindelöf，但 $\mathbb{R}_\ell$ 是。闭子空间遗传 Lindelöf 性）。

**证明**（第二可数子空间）：设 $\mathcal{B}$ 为 $X$ 的可数基，则 $\{B \cap Y \mid B \in \mathcal{B}\}$ 是 $Y$ 的可数基。$\square$

> [!note] **定理 30.7（可数积）**
> 第一可数（resp. 第二可数）空间的可数积仍是第一可数（resp. 第二可数）的。

**证明**（第二可数）：设 $X_n$ 有可数基 $\mathcal{B}_n$。令 $\mathcal{B}$ 为所有形如 $\prod U_n$ 的集合构成的族，其中 $U_n \in \mathcal{B}_n$ 对有限个 $n$，其余 $U_n = X_n$。$\mathcal{B}$ 可数（有限个可数集的有限笛卡尔积仍可数），且是积拓扑的基。$\square$

## 30.4 习题解析

> [!question] **习题 30.3**
> 证明：第一可数空间中，$x \in \overline{A}$ 当且仅当 $A$ 中存在收敛到 $x$ 的序列。

**证明**：（⇐）若 $A$ 中有序列 $(a_n) \to x$，则 $x$ 的每个邻域与 $A$ 相交，故 $x \in \overline{A}$。
（⇒）设 $x \in \overline{A}$。取 $x$ 的递降可数邻域基 $U_1 \supseteq U_2 \supseteq \cdots$（由有限交构造）。对每个 $n$，存在 $a_n \in U_n \cap A$。则 $(a_n) \to x$：任意开邻域 $U \ni x$ 包含某个 $U_N$，故对所有 $n \geqslant N$，$a_n \in U_n \subseteq U_N \subseteq U$。$\square$

>[!tip] 这个习题是"序列语言"在拓扑学中的有效性边界——第一可数空间中闭包可用序列刻画，但一般空间不行。

> [!question] **习题 30.4**
> 证明：每个紧度量空间是第二可数的。

**证明**：对每个 $n \in \mathbb{N}^+$，开覆盖 $\{B_d(x, 1/n) \mid x \in X\}$ 有有限子覆盖 $\mathcal{U}_n = \{B_d(x_{n,1}, 1/n), \ldots, B_d(x_{n,k_n}, 1/n)\}$。令 $\mathcal{B} = \bigcup_n \mathcal{U}_n$，可数。往证 $\mathcal{B}$ 是基：设 $U$ 开，$x \in U$。取 $\varepsilon > 0$ 使 $B_d(x, \varepsilon) \subseteq U$，取 $n$ 使 $2/n < \varepsilon$。由 $\mathcal{U}_n$ 覆盖 $X$，存在 $B_d(x_{n,i}, 1/n) \ni x$。对任意 $y \in B_d(x_{n,i}, 1/n)$，$d(x,y) \leqslant d(x,x_{n,i}) + d(x_{n,i},y) < 1/n+1/n < \varepsilon$，故 $B_d(x_{n,i}, 1/n) \subseteq B_d(x,\varepsilon) \subseteq U$。$\square$

> [!question] **习题 30.5**
> 给出一个 Lindelöf 但不可分的空间的例子。

**解**：取不可数集 $X$ 赋予可数补拓扑（闭集为 $X$ 本身和所有可数子集）。$X$ 是 Lindelöf 的：任意开覆盖 $\mathcal{U}$，取非空的 $U_0 \in \mathcal{U}$，$X \setminus U_0$ 可数，故只需可数个成员覆盖 $X \setminus U_0$。但 $X$ 不可分：若 $D$ 可数，则 $X \setminus D$ 是非空开集与 $D$ 不相交，$D$ 不稠密。$\square$

> [!question] **习题 30.7**
> 证明 $\mathbb{R}_\ell$ 是 Lindelöf 的。

**证明**：设 $\mathcal{U}$ 为 $\mathbb{R}_\ell$ 的开覆盖。令 $C = \{x \in \mathbb{R} \mid [x, \infty) \text{ 不能被 } \mathcal{U} \text{ 中可数个成员覆盖}\}$。若 $C \neq \varnothing$，令 $c = \inf C$。则存在 $U \in \mathcal{U}$ 含 $c$，故存在 $[c, d) \subseteq U$（$d > c$）。由下确界定义，存在 $x \in (c, d) \setminus C$，故 $[x, \infty)$ 被可数覆盖；加上 $U$ 覆盖 $[c, x]$，得 $[c, \infty)$ 被可数覆盖，矛盾。故 $C = \varnothing$，$\mathbb{R}$ 被可数覆盖。同理可证任意区间，从而 $\mathbb{R}_\ell$ 是 Lindelöf 的。$\square$

> [!question] **习题 30.8**
> 证明：第二可数空间中任意两两不相交的开集族至多可数。

**证明**：设 $\mathcal{B} = \{B_n\}$ 为可数基，$\mathcal{U}$ 为两两不相交的开集族。对每个 $U \in \mathcal{U}$，选取 $n(U)$ 使 $B_{n(U)} \subseteq U$。由于 $\mathcal{U}$ 中成员两两不相交，$U \mapsto n(U)$ 是单射，故 $|\mathcal{U}| \leqslant \aleph_0$。$\square$

> [!question] **习题 30.9**
> 证明：可分空间的可数积是可分的。

**证明**：设 $X_n$ 有可数稠密子集 $D_n$。固定基点 $p_n \in D_n$。对每个有限子集 $F \subseteq \mathbb{N}^+$，令 $D_F = \{x \in \prod X_n \mid x_n \in D_n\ (n \in F),\ x_n = p_n\ (n \notin F)\}$。每个 $D_F$ 可数，$D = \bigcup_{F \text{ finite}} D_F$ 可数。任意积拓扑基开集 $\prod U_n$（仅 $n \in F$ 时 $U_n \neq X_n$）与 $D_F$ 相交，故 $D$ 稠密。$\square$

> [!question] **习题 30.12**
> 证明 $\mathbb{R}_\ell$ 是第一可数的。

**证明**：对 $x \in \mathbb{R}$，取 $\mathcal{B}_x = \{[x, x+1/n) \mid n \in \mathbb{N}^+\}$。任意包含 $x$ 的开集 $U$ 必含某个基元素 $[x, b)$（$b > x$）。取 $n > 1/(b-x)$，则 $[x, x+1/n) \subseteq [x, b) \subseteq U$。故 $\mathcal{B}_x$ 是 $x$ 处的可数邻域基。$\square$

> [!question] **习题 30.16**
> 构造一个可分但不是 Lindelöf 的空间。

**解**：考虑 Sorgenfrey 平面 $\mathbb{R}_\ell^2$。$\mathbb{Q}^2$ 是其可数稠密子集（可分）。但反斜线 $L = \{(x, -x) \mid x \in \mathbb{R}\}$ 作为子空间是离散且不可数的（$[x, x+1) \times [-x, -x+1) \cap L = \{(x,-x)\}$），其单点集开覆盖无可数子覆盖。闭子空间非 Lindelöf 蕴含全空间非 Lindelöf（或直接构造无可数子覆盖的开覆盖）。$\square$

## 相关链接

- 上一节：[[../Chapter 03 - Connectedness and Compactness/29_Local_Compactness|§29 Local Compactness]]
- 下一节：[[31_Separation_Axioms|§31 The Separation Axioms]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]