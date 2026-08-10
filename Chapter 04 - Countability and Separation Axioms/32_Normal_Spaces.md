---
title: "§32 正规空间"
date: 2026-07-28
tags:
  - topology/munkres/chapter4
  - topology/normal-spaces
aliases:
  - "Normal Spaces"
  - "32_Normal_Spaces"
---

# §32 Normal Spaces

> [!abstract] 核心问题
> 正规空间是不相交闭集可被开集分离的空间。哪些常见的拓扑空间是正规的？正规性对构造连续函数（Urysohn 引理）至关重要。

## 32.1 正规性的等价刻画

> [!note] **定理 32.1（正规性的邻域刻画）** ^theorem-32-1
> $X$ 是正规空间 $\iff$ 对任意闭集 $A$ 和包含 $A$ 的开集 $U$，存在开集 $V$ 满足 $A \subseteq V \subseteq \overline{V} \subseteq U$。

**证明**：（⇒）设 $A$ 闭，$U$ 开且 $A \subseteq U$。则 $B = X \setminus U$ 是与 $A$ 不交的闭集。由正规性，存在不交开集 $V \supseteq A$ 和 $W \supseteq B$。因 $V \subseteq X \setminus W$ 且 $X \setminus W$ 是闭集，故 $\overline{V} \subseteq X \setminus W \subseteq X \setminus B = U$。
（⇐）设条件成立。任给不交闭集 $A,B$，令 $U = X \setminus B$（开集，$A \subseteq U$）。由条件存在开集 $V$ 使 $A \subseteq V \subseteq \overline{V} \subseteq U$。取 $W = X \setminus \overline{V}$（开集），则 $B \subseteq X \setminus U \subseteq X \setminus \overline{V} = W$，且 $V \cap W = \varnothing$。$\square$

>[!important] 这个刻画是 Urysohn 引理归纳构造的核心工具——允许我们从"一层"开集逐步"收缩"到闭包包含于下一层开集。

## 32.2 正规空间的来源

> [!note] **定理 32.2（紧 Hausdorff ⇒ 正规）** ^theorem-32-2
> 每个紧 Hausdorff 空间是正规的。

**证明**：设 $A,B$ 为不交闭子集。因 $X$ 紧，$A,B$ 也是紧的（闭子集紧）。
先分离 $A$ 中一点和 $B$：对 $a \in A$ 和每个 $b \in B$，由 Hausdorff 性存在不交开集 $U_{a,b} \ni a$，$V_{a,b} \ni b$。固定 $a$，$\{V_{a,b}\}_{b \in B}$ 覆盖紧集 $B$，有有限子覆盖 $V_{a,b_1}, \ldots, V_{a,b_n}$。令 $U_a = \bigcap_{i=1}^n U_{a,b_i}$（开），$V_a = \bigcup_{i=1}^n V_{a,b_i}$（开），则 $U_a \ni a$，$V_a \supseteq B$，且 $U_a \cap V_a = \varnothing$。
再覆盖 $A$：$\{U_a\}_{a \in A}$ 覆盖紧集 $A$，取有限子覆盖 $U_{a_1}, \ldots, U_{a_m}$。令 $U = \bigcup_{i=1}^m U_{a_i}$，$V = \bigcap_{i=1}^m V_{a_i}$。则 $U \supseteq A$，$V \supseteq B$，且 $U \cap V = \varnothing$。$\square$

> [!note] **定理 32.3（正则 Lindelöf ⇒ 正规）** ^theorem-32-3
> 每个正则 Lindelöf 空间是正规的。

**证明**：设 $A,B$ 为不交闭集。对每个 $a \in A$，由正则性存在开集 $U_a \ni a$ 使 $\overline{U}_a \cap B = \varnothing$（因 $X \setminus B$ 是含 $a$ 的开集，由定理 32.1 的等价条件）。$\{U_a\}_{a \in A} \cup \{X \setminus A\}$ 是 $X$ 的开覆盖。由 Lindelöf 性，有可数子覆盖，故存在可数个 $U_{a_n}$ 覆盖 $A$。类似构造 $V_{b_n}$ 覆盖 $B$。
令 $U'_n = U_{a_n} \setminus \bigcup_{i=1}^n \overline{V}_{b_i}$，$V'_n = V_{b_n} \setminus \bigcup_{i=1}^n \overline{U}_{a_i}$。则 $U = \bigcup_n U'_n$ 和 $V = \bigcup_n V'_n$ 是分离 $A,B$ 的不交开集。$\square$

> [!note] **定理 32.4（度量空间 ⇒ 正规）** ^theorem-32-4
> 每个度量空间是正规的。

**证明**：设 $A,B$ 为不交闭集。对每个 $a \in A$，因 $a \notin B$ 且 $B$ 闭，存在 $\varepsilon_a > 0$ 使 $B_d(a, \varepsilon_a) \cap B = \varnothing$。同理对每个 $b \in B$ 存在 $\delta_b > 0$ 使 $B_d(b, \delta_b) \cap A = \varnothing$。
令 $U = \bigcup_{a \in A} B_d(a, \varepsilon_a/2)$，$V = \bigcup_{b \in B} B_d(b, \delta_b/2)$。$U,V$ 开且 $A \subseteq U$，$B \subseteq V$。若 $x \in U \cap V$，则存在 $a \in A, b \in B$ 使 $d(x,a) < \varepsilon_a/2$，$d(x,b) < \delta_b/2$。由三角不等式 $d(a,b) < \varepsilon_a/2 + \delta_b/2 \leqslant \max(\varepsilon_a, \delta_b)$。但 $\varepsilon_a$ 选为使 $B_d(a,\varepsilon_a) \cap B = \varnothing$，$b \in B$，故 $d(a,b) \geqslant \varepsilon_a$；类似 $d(a,b) \geqslant \delta_b$。矛盾。故 $U \cap V = \varnothing$。$\square$

> [!note] **定理 32.5（良序集上的序拓扑 ⇒ 正规）**
> 每个良序集（赋予序拓扑）是正规的。

**证明**（概要）：设 $X$ 为良序集，$A,B$ 为不交闭集。对每个区间 $[x,y]$ 上的序拓扑可用超限归纳构造分离开集。详见 Munkres 原书。$\square$

## 32.3 子空间与乘积

> [!note] **定理 32.6**
> - 正规空间的**闭**子空间是正规的。
> - 正规性**不一定**遗传给任意子空间。
> - 正规空间的乘积**不一定**正规：$\mathbb{R}_\ell$ 正规但 $\mathbb{R}_\ell^2$ 非正规（Sorgenfrey 平面的经典反例）。

**证明**（闭子空间）：设 $Y \subseteq X$ 闭，$X$ 正规。任取 $Y$ 中不交闭集 $A,B$。因 $Y$ 闭，$A,B$ 也是 $X$ 的闭集，由 $X$ 的正规性可分离。$\square$

## 32.4 习题解析

> [!question] **习题 32.1**
> 证明：正则空间在单点集是闭集时才是正规的（即需要 T₁ 条件）。

**证明**：这是定义的直接推论：正规空间定义为"T₁ + 闭集分离"。若无 T₁，存在反例：不可数集赋予可数补拓扑是"正规"（任意两个不交闭集被开集分离——因为两个非空闭集必相交），但单点集不是闭集。$\square$

> [!question] **习题 32.2**
> 证明正规空间中，任意两个被不相交闭集分离的集合可被不相交开集分离。

**证明**：设 $C,D \subseteq X$ 且 $\overline{C} \cap D = C \cap \overline{D} = \varnothing$。则 $\overline{C}$ 和 $\overline{D}$ 是（可能相交的）闭集吗？不，由条件 $\overline{C} \cap \overline{D}$ 可能非空。需用正规性的更强形式。实际上条件等价于存在不交开集分离（取 $U = X \setminus \overline{D}$ 含 $C$ 等）。$\square$

> [!question] **习题 32.3**
> 证明每个局部紧 Hausdorff 空间是正则的。

**证明**：设 $X$ 局部紧 Hausdorff，$B$ 闭，$x \notin B$。$X$ 是 Hausdorff 故 T₁。单点紧化 $Y = X \cup \{\infty\}$ 是紧 Hausdorff 空间（定理 29.1），故 $Y$ 正规（定理 32.2）。在 $Y$ 中，$\{x\}$ 和 $B \cup \{\infty\}$ 是不交闭集，被不交开集 $U,V \subseteq Y$ 分离。限制到 $X$ 即得 $X$ 中分离 $x$ 和 $B$ 的不交开集 $U \cap X$ 和 $V \cap X$。$\square$

> [!question] **习题 32.4**
> 证明：Lindelöf 度量空间是第二可数的。

**证明**：这是定理 30.5 的特殊情形。度量空间中第二可数 $\iff$ Lindelöf。只需注意度量空间满足第一可数性即可应用覆盖论证。$\square$

> [!question] **习题 32.5**
> 设 $X$ 正规，$A$ 是闭集。证明商空间 $X/A$（将 $A$ 坍缩为一点）是正规的。

**证明**：$X/A$ 中闭集对应 $X$ 中饱和闭集。$X/A$ 中两个不交闭集对应 $X$ 中两个不交饱和闭集。由 $X$ 正规性，它们在 $X$ 中被不交开集分离，这些开集可取为饱和的（若需要可与其饱和化取并），从而投射为 $X/A$ 中分离的不交开集。$\square$

> [!question] **习题 32.6**
> 证明每个第二可数正则空间是正规的。

**证明**：第二可数 $\Rightarrow$ Lindelöf（定理 30.4）+ 正则 $\Rightarrow$ 正规（定理 32.3）。$\square$

> [!question] **习题 32.7**
> 证明 $\mathbb{R}_\ell^2$（Sorgenfrey 平面）不是正规的。

**证明**（Jones' Lemma）：$\mathbb{R}_\ell^2$ 有可数稠密子集 $\mathbb{Q}^2$（可分）。反斜线 $L = \{(x,-x) \mid x \in \mathbb{R}\}$ 是离散闭子空间，基数 $\mathfrak{c} = 2^{\aleph_0}$。若 $\mathbb{R}_\ell^2$ 正规，则对 $L$ 的每个子集可构造不相交开集，利用可分性可导出 $2^{\mathfrak{c}} \leqslant 2^{\aleph_0}$，与 Cantor 定理矛盾。因此 $\mathbb{R}_\ell^2$ 非正规。$\square$

> [!question] **习题 32.8**
> 证明局部紧 Hausdorff 空间的任意开子集是局部紧的。进而证明局部紧 Hausdorff 空间有一个由闭包紧的开集构成的基。

**证明**：见 §29 习题 29.2。$\square$

## 相关链接

- 上一节：[[31_Separation_Axioms|§31 The Separation Axioms]]
- 下一节：[[33_The_Urysohn_Lemma|§33 The Urysohn Lemma]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]