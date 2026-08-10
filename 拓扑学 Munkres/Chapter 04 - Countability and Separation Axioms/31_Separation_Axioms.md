---
title: "§31 分离性公理"
date: 2026-07-28
tags:
  - topology/munkres/chapter4
  - topology/separation-axioms
aliases:
  - "The Separation Axioms"
  - "31_Separation_Axioms"
---

# §31 The Separation Axioms

> [!abstract] 核心问题
> 如何用开集分离点和闭集？从 T₀ 到 T₄ 的逐级加强条件如何刻画空间的"几何良好性"？


>[!important] **分离性公理的动机——我们能多大程度地区分点和闭集？**
> 在一般拓扑空间中，仅靠开集公理无法保证"点可以分离"。例如平庸拓扑中，任何两个不同点共享完全相同的开邻域——这在几何上不可接受。分离性公理是一系列逐步加强的"可区分性"条件：
>
> - **T₀**：拓扑的最弱要求——至少能区分任意两个点（有一个开集含其一不含其二）。
> - **T₁**：单点集是闭集——"点可以被孤立"。等价于有限集是闭集。
> - **T₂ (Hausdorff)**：任意两点可被不交开集分离——这是"几何良好"空间的最低标准。Hausdorff 空间中序列极限唯一。
> - **T₃ (正则)**：点与不含该点的闭集可分离——"点和闭集是两个层次的对象"。
> - **T₃½ (完全正则)**：点和闭集可被**连续函数**分离——Urysohn 引理的直接推论。
> - **T₄ (正规)**：任意两个不交闭集可分离——最强的分离性，紧 Hausdorff 和度量空间均为正规。
>
> **关键记忆**：Munkres 使用 T₁+T₃=正则、T₁+T₄=正规的约定。分离性层级：正规 ⇒ 完全正则 ⇒ 正则 ⇒ Hausdorff ⇒ T₁ ⇒ T₀，各蕴含均不可逆。

## 31.1 分离性公理的定义

> [!note] **定义 31.1（T₀ / Kolmogorov）**
> 空间 $X$ 称为 **T₀**，若对任意两个不同点 $x \neq y$，存在开集包含其中一点而不含另一点。

> [!note] **定义 31.2（T₁ / Fréchet）**
> 空间 $X$ 称为 **T₁**，若对任意 $x \neq y$，存在开集 $U$ 使 $x \in U$ 但 $y \notin U$。

>[!important] **定理 31.1（T₁ 的等价刻画）**
> $X$ 是 T₁ 空间 $\iff$ $X$ 的每个单点集是闭集。

**证明**：（⇒）设 $X$ 是 T₁。对 $x \in X$，任取 $y \neq x$，存在开集 $U_y \ni y$ 不含 $x$。则 $X \setminus \{x\} = \bigcup_{y \neq x} U_y$ 是开集，故 $\{x\}$ 是闭集。
（⇐）若每个单点集闭，则对 $x \neq y$，$U = X \setminus \{y\}$ 是含 $x$ 不含 $y$ 的开集。$\square$

> [!note] **定义 31.3（T₂ / Hausdorff）**
> 空间 $X$ 称为 **T₂** 或 **Hausdorff**，若对任意 $x \neq y$，存在不相交的开集 $U \ni x$，$V \ni y$。

> [!example] **例 31.1（Hausdorff vs. T₁）**
> - $\mathbb{R}^n$、度量空间、$\mathbb{R}_\ell$ 是 Hausdorff 的。
> - 有限补拓扑（无限集上）是 T₁ 但**不是** T₂：任意两个非空开集必相交（补集有限，无限空间）。
> - Zariski 拓扑（代数几何中的谱）是 T₀ 但通常不是 T₁。

> [!note] **定义 31.4（T₃ / 正则 Regular）**
> 空间 $X$ 称为 **正则的 (regular)**，若 $X$ 是 T₁，且对任意闭集 $B$ 和点 $x \notin B$，存在不相交的开集分别包含 $x$ 和 $B$。

> [!note] **定义 31.5（T₃½ / 完全正则 Completely Regular）**
> 空间 $X$ 称为 **完全正则的 (completely regular)**，若 $X$ 是 T₁，且对任意闭集 $B$ 和点 $x \notin B$，存在连续函数 $f: X \to [0,1]$ 使 $f(x)=0$，$f(B)=\{1\}$。

> [!note] **定义 31.6（T₄ / 正规 Normal）**
> 空间 $X$ 称为 **正规的 (normal)**，若 $X$ 是 T₁，且任意两个不相交的闭集可被不相交的开集分离。

>[!important] **注意**：Munkres 约定 regular = T₁ + T₃，normal = T₁ + T₄。有些教材定义不同，需区分。

## 31.2 蕴含关系

> [!note] **定理 31.2（分离性公理的层级）**
> $$\text{T}_4 + \text{T}_1 \Rightarrow \text{T}_{3\frac{1}{2}} \Rightarrow \text{T}_3 \Rightarrow \text{T}_2 \Rightarrow \text{T}_1 \Rightarrow \text{T}_0$$
> 以上蕴含均不可逆。

>[!example] **反例一览**
> - T₀ 非 T₁：Sierpiński 空间 $\{0,1\}$，开集 $\{\varnothing, \{0\}, \{0,1\}\}$。
> - T₁ 非 T₂：无限集上的有限补拓扑。
> - T₂ 非 T₃：$\mathbb{R}_K$ 拓扑（$K=\{1/n: n \in \mathbb{N}^+\}$，基为 $(a,b)$ 和 $(a,b)\setminus K$）— Hausdorff 但非正则。
> - T₃ 非 T₃½：Tychonoff 旋轮板（较复杂，见 §33 习题）。
> - T₃½ 非 T₄：$\mathbb{R}_\ell^2$（Sorgenfrey 平面）— 完全正则但非正规。

## 31.3 遗传性与乘性

> [!note] **定理 31.3（子空间）**
> - T₀, T₁, T₂, T₃, T₃½ 对子空间遗传。
> - T₄ **不一定**遗传给子空间（$\mathbb{R}_\ell^2$ 有正规子空间吗？反例：Tychonoff 板）。

> [!note] **定理 31.4（乘积）**
> - T₀, T₁, T₂, T₃, T₃½ 对任意积遗传。
> - T₄ **不一定**对积遗传：$\mathbb{R}_\ell$ 是正规的，但 $\mathbb{R}_\ell^2$ 非正规。

**证明**（T₂ 的任意积）：设 $X = \prod X_\alpha$，$x \neq y \in X$。存在 $\alpha$ 使 $x_\alpha \neq y_\alpha$。由 $X_\alpha$ Hausdorff，存在不交开集 $U_\alpha \ni x_\alpha$，$V_\alpha \ni y_\alpha$。则 $\pi_\alpha^{-1}(U_\alpha)$ 和 $\pi_\alpha^{-1}(V_\alpha)$ 是 $X$ 中分离 $x,y$ 的不交开集。$\square$

## 31.4 习题解析

> [!question] **习题 31.1**
> 证明：若 $X$ 是 T₁ 空间，则 $x$ 是 $A$ 的极限点当且仅当 $x$ 的每个邻域与 $A$ 交于无穷多个点。

**证明**：（⇐）显然。（⇒）设 $x$ 是 $A$ 的极限点，$U$ 是 $x$ 的邻域且 $U \cap A$ 有限。令 $F = (U \cap A) \setminus \{x\}$（有限集）。因 $X$ 是 T₁，$F$ 是闭集。则 $U \setminus F$ 仍是 $x$ 的邻域且 $(U \setminus F) \cap A \subseteq \{x\}$，与 $x$ 是 $A$ 的极限点矛盾。$\square$

> [!question] **习题 31.2**
> 证明 $X$ 是 Hausdorff 的当且仅当对角线 $\Delta = \{(x,x) \mid x \in X\}$ 在 $X \times X$ 中是闭集。

**证明**：（⇒）设 $(x,y) \notin \Delta$，则 $x \neq y$。由 Hausdorff 性，存在不交开集 $U \ni x$，$V \ni y$。则 $(x,y) \in U \times V$ 且 $U \times V \cap \Delta = \varnothing$（若 $(z,z) \in U \times V$，则 $z \in U \cap V$，矛盾）。故 $\Delta$ 的补集是开集，$\Delta$ 闭。
（⇐）设 $\Delta$ 闭。对 $x \neq y$，$(x,y) \notin \Delta$，存在基开集 $U \times V$ 含 $(x,y)$ 使 $U \times V \cap \Delta = \varnothing$，即 $U \cap V = \varnothing$。$\square$

> [!question] **习题 31.3**
> 证明 Hausdorff 空间中任意有限个点到点的连续函数序列极限唯一（即§21中定理的推广）。

**证明**：设 $(x_n)$ 在 Hausdorff 空间 $X$ 中。若 $x_n \to x$ 且 $x_n \to y$ 且 $x \neq y$，取不交开集 $U \ni x$，$V \ni y$。由收敛定义，存在 $N_1$ 使 $n \geqslant N_1$ 时 $x_n \in U$，$N_2$ 使 $n \geqslant N_2$ 时 $x_n \in V$。取 $n = \max(N_1,N_2)$，则 $x_n \in U \cap V = \varnothing$，矛盾。$\square$

> [!question] **习题 31.5**
> 证明每个序拓扑空间是 Hausdorff 的。

**证明**：设 $x < y$。若存在 $z$ 使 $x < z < y$，取 $U = (-\infty, z)$，$V = (z, \infty)$。若 $x,y$ 相邻（之间无点），取 $U = (-\infty, y)$，$V = (x, \infty)$。则 $U \cap V = \varnothing$，$x \in U$，$y \in V$。$\square$

> [!question] **习题 31.6**
> 证明 $\mathbb{R}_\ell$ 是正规的。

**证明**：设 $A,B$ 为 $\mathbb{R}_\ell$ 中不相交闭集。对每个 $a \in A$，因 $a \notin B$ 且 $B$ 闭，存在 $\varepsilon_a > 0$ 使 $[a, a+\varepsilon_a) \cap B = \varnothing$。定义 $U = \bigcup_{a \in A} [a, a+\varepsilon_a)$。同理构造 $V = \bigcup_{b \in B} [b, b+\delta_b)$。需证 $U \cap V = \varnothing$：若 $x \in [a, a+\varepsilon_a) \cap [b, b+\delta_b)$，不妨设 $a < b$，则 $b < a+\varepsilon_a$ 蕴含 $b \in [a, a+\varepsilon_a)$，但 $b \in B$，与 $[a, a+\varepsilon_a) \cap B = \varnothing$ 矛盾。$\square$

> [!question] **习题 31.7**
> 证明正则空间的子空间是正则的。

**证明**：设 $Y \subseteq X$，$X$ 正则。任取 $y \in Y$ 和 $Y$ 中闭集 $B$ 不含 $y$。存在 $X$ 中闭集 $C$ 使 $B = C \cap Y$。因 $y \notin C$ 且 $X$ 正则，存在 $X$ 中不交开集 $U \ni y$，$V \supseteq C$。则 $U \cap Y$ 和 $V \cap Y$ 是 $Y$ 中分离 $y$ 和 $B$ 的不交开集。$\square$

> [!question] **习题 31.8**
> 证明 Hausdorff 空间中紧子集是闭集（已在 §26 证明，回顾之）。

**证明**：见 [[../Chapter 03 - Connectedness and Compactness/26_Compact_Spaces|§26 定理 26.3]]。$\square$

## 相关链接

- 上一节：[[30_Countability_Axioms|§30 The Countability Axioms]]
- 下一节：[[32_Normal_Spaces|§32 Normal Spaces]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]