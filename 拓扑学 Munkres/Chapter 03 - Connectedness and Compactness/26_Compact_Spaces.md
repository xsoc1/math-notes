---
title: "§26 紧空间"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/compactness
aliases:
  - "Compact Spaces"
  - "26_Compact_Spaces"
---

# §26 Compact Spaces

> [!abstract] 核心问题
> 紧致性如何推广"有界闭区间"的有限覆盖性质？它为何是拓扑学中最重要的不变性质之一？


>[!important] **紧性——"有限"的拓扑替代品**
> 紧性是拓扑学中最重要的概念之一。它的定义（每个开覆盖有有限子覆盖）初看令人费解——为什么要定义这样一个条件？
>
> **动机**：在分析学中，闭区间 $[a,b]$ 有许多好性质（有界序列有收敛子列、连续函数达到最大最小值、一致连续……）。这些性质的证明最终都依赖同一个事实：$[a,b]$ 的每个开覆盖有有限子覆盖（Heine-Borel 定理）。紧性正是将这一事实抽象为一般拓扑空间的定义。
>
> **三个等价的思考角度**：
> - **覆盖语言**：每个开覆盖有有限子覆盖（定义，最适合一般证明）
> - **有限交性质**：具有有限交性质的闭集族有非空交（对偶形式，在 Tychonoff 定理证明中关键）
> - **序列语言**（仅度量空间）：每个序列有收敛子列（列紧性）
>
> **紧性的"魔术"**：紧空间上的连续函数自动有界且达到最值；紧空间到 Hausdorff 空间的连续双射自动是同胚；紧空间的闭子集紧；紧空间的连续像是紧的。简言之，紧性把"无限"问题转化为"有限"问题。

## 26.1 开覆盖与紧致性

> [!note] **定义 26.1（覆盖 / Cover）**
> $X$ 的一族子集 $\mathcal{A} = \{A_\alpha\}$ 称为 $X$ 的一个**覆盖 (cover)**，若 $\bigcup A_\alpha = X$。若每个 $A_\alpha$ 是开集，称为**开覆盖 (open cover)**。

> [!note] **定义 26.2（紧空间 / Compact Space）**
> 拓扑空间 $X$ 称为 **紧的 (compact)**，若 $X$ 的每个开覆盖有有限子覆盖。
>
> 对子集 $Y \subseteq X$，称 $Y$ 是紧子集，若 $Y$ 在子空间拓扑下是紧空间。

>[!important] 紧致性是有限维分析中"有界闭 = 紧"这一结论在一般拓扑空间中的推广。

> [!example] **例 26.1**
> - $\mathbb{R}$ 不是紧的：$\{(-n, n)\}_{n \in \mathbb{N}}$ 是开覆盖但无有限子覆盖。
> - $(0,1]$ 不是紧的：$\{(\frac{1}{n}, 1]\}_{n \in \mathbb{N}}$ 无有限子覆盖。
> - 任意有限空间是紧的。
> - 有限补拓扑下任意空间是紧的（每个开集已覆盖了除有限个点外的全空间）。

## 26.2 紧致性的基本性质

> [!note] **定理 26.2（闭子集紧）** ^thm-26-2
> 紧空间的每个闭子集是紧的。

**证明**：设 $Y \subseteq X$ 闭，$X$ 紧。设 $\{U_\alpha\}$ 是 $Y$ 的一族开覆盖（$U_\alpha$ 在 $Y$ 中开）。则存在 $X$ 中开集 $V_\alpha$ 使得 $U_\alpha = V_\alpha \cap Y$。于是 $\{V_\alpha\} \cup \{X \setminus Y\}$ 是 $X$ 的开覆盖（因为 $X \setminus Y$ 是开集）。由 $X$ 的紧性，有有限子覆盖 $\{V_{\alpha_1}, \ldots, V_{\alpha_n}, X \setminus Y\}$。则 $\{U_{\alpha_1}, \ldots, U_{\alpha_n}\}$ 覆盖 $Y$。$\square$

> [!note] **定理 26.3（Hausdorff 空间中紧子集闭）** ^thm-26-3
> Hausdorff 空间的每个紧子集是闭集。

**证明**：设 $Y \subseteq X$ 紧，$X$ Hausdorff。往证 $X \setminus Y$ 开。取 $x \in X \setminus Y$。对每个 $y \in Y$，由 Hausdorff 性质，存在不交开集 $U_y \ni x$ 和 $V_y \ni y$。$\{V_y \cap Y\}_{y \in Y}$ 是 $Y$ 的开覆盖。由 $Y$ 紧，有有限子覆盖 $\{V_{y_1}, \ldots, V_{y_n}\}$。令 $U = \bigcap_{i=1}^n U_{y_i}$，$V = \bigcup_{i=1}^n V_{y_i}$。则 $U$ 是 $x$ 的开邻域，$U \cap Y = \varnothing$（因 $U \cap V = \varnothing$ 且 $Y \subseteq V$）。故 $x$ 是 $X \setminus Y$ 的内点。$\square$

> [!note] **定理 26.5（连续像紧）** ^thm-26-5
> 紧空间的连续像是紧的。

**证明**：设 $f: X \to Y$ 连续，$X$ 紧。设 $\{V_\alpha\}$ 是 $f(X)$ 的开覆盖。则 $\{f^{-1}(V_\alpha)\}$ 是 $X$ 的开覆盖。由 $X$ 紧，有有限子覆盖 $f^{-1}(V_{\alpha_1}), \ldots, f^{-1}(V_{\alpha_n})$。则 $V_{\alpha_1}, \ldots, V_{\alpha_n}$ 覆盖 $f(X)$。$\square$

>[!important] **推论 26.6**：紧空间到 Hausdorff 空间的连续双射是同胚。
>
> **证明**：只需证逆映射连续。设 $F \subseteq X$ 闭。因 $X$ 紧，$F$ 紧（定理 26.2）。因 $f$ 连续，$f(F)$ 紧（定理 26.5）。因 $Y$ Hausdorff，$f(F)$ 闭（定理 26.3）。故 $(f^{-1})^{-1}(F) = f(F)$ 闭，$f^{-1}$ 连续。$\square$

## 26.3 积空间的紧致性

> [!note] **定理 26.6（管引理 / Tube Lemma）** ^thm-26-7
> 设 $X$ 紧，$Y$ 任意，$x_0 \in X$。若 $N \subseteq X \times Y$ 是开集且包含 $\{x_0\} \times Y$，则存在 $x_0$ 的开邻域 $W \subseteq X$ 使得 $W \times Y \subseteq N$。

**证明**：对每个 $(x_0, y) \in \{x_0\} \times Y$，因 $N$ 开，存在基开集 $U_y \times V_y$ 满足 $(x_0, y) \in U_y \times V_y \subseteq N$。$\{U_y\}_{y \in Y}$ 覆盖 $\{x_0\} \times Y$ 在 $X$ 中的投影……实际上 $\{x_0\} \times Y$ 同胚于 $Y$，但我们需要 $U_y$ 覆盖 $x_0$ 在 $X$ 中的邻域。由 $\{x_0\} \times Y$ 的紧性（同胚于 $Y$，但 $Y$ 不一定紧——这里需要用另一种方式），在管引理的标准证明中实际上假设 $Y$ 紧。

**标准证明**（需 $Y$ 也紧）：覆盖 $\{x_0\} \times Y$ 的每个点 $(x_0, y)$ 有一个基开邻域 $U_y \times V_y \subseteq N$。$\{V_y\}$ 是 $Y$ 的开覆盖。由 $Y$ 紧，有有限子覆盖 $V_{y_1}, \ldots, V_{y_n}$。取 $W = \bigcap_{i=1}^n U_{y_i}$，则 $W \times Y \subseteq N$。$\square$

> [!note] **定理 26.6（有限积紧）** ^thm-26-6
> 紧空间的有限积是紧的。

**证明**（两个空间的积）：
设 $X, Y$ 紧。设 $\mathcal{A}$ 是 $X \times Y$ 的开覆盖。对每个 $x \in X$，$\{x\} \times Y$ 同胚于 $Y$，故紧。取 $\mathcal{A}$ 的有限子族覆盖 $\{x\} \times Y$，并设其并为 $N_x$。由管引理，存在开集 $W_x \ni x$ 使得 $W_x \times Y \subseteq N_x$。$\{W_x\}_{x \in X}$ 是 $X$ 的开覆盖，由 $X$ 紧，有有限子覆盖 $W_{x_1}, \ldots, W_{x_m}$。则每个 $W_{x_i} \times Y$ 被 $\mathcal{A}$ 的有限子族覆盖，合起来是 $X \times Y$ 的有限子覆盖。$\square$

## 26.4 有限交性质

> [!note] **定理 26.8（有限交性质 / Finite Intersection Property）**
> $X$ 紧 $\iff$ 对 $X$ 的任意具有**有限交性质**的闭集族 $\mathcal{C}$（即 $\mathcal{C}$ 中任意有限子族的交非空），有 $\bigcap_{C \in \mathcal{C}} C \neq \varnothing$。

**证明**：
- ($\Rightarrow$)：若 $\bigcap \mathcal{C} = \varnothing$，则 $\{X \setminus C \mid C \in \mathcal{C}\}$ 是 $X$ 的开覆盖。由紧性，有有限子覆盖，即存在 $C_1, \ldots, C_n$ 使得 $\bigcup(X \setminus C_i) = X$，故 $\bigcap C_i = \varnothing$，与有限交性质矛盾。
- ($\Leftarrow$)：逆否命题类似论证。$\square$

## 26.5 习题解析

> [!question] **习题 26.1**
> 设 $X$ 紧，$\{A_n\}$ 是 $X$ 的闭子集嵌套序列：$A_1 \supseteq A_2 \supseteq \cdots$，且每个 $A_n$ 非空。证明 $\bigcap A_n \neq \varnothing$。

**证明**：$\{A_n\}$ 具有有限交性质（因序列递减，任意有限交 = 最小指标的那个，非空）。由定理 26.8，$\bigcap A_n \neq \varnothing$。$\square$

> [!question] **习题 26.2**
> 设 $X$ 紧，$f: X \to \mathbb{R}$ 连续。证明 $f$ 有界且取到最大/最小值。

**证明**：由定理 26.5，$f(X)$ 是 $\mathbb{R}$ 的紧子集。$\mathbb{R}$ 中紧子集有界闭（见 §27 Heine-Borel），故 $f$ 有界且 $\sup f(X)$ 和 $\inf f(X)$ 在 $f(X)$ 中（闭集包含确界），故取到最大/最小值。$\square$

> [!question] **习题 26.3**
> 证明紧空间的无穷子集必有极限点。

**证明**：设 $X$ 紧，$A \subseteq X$ 无限。假若 $A$ 无极限点，则对每个 $x \in X$，存在开邻域 $U_x$ 使得 $U_x \cap A \subseteq \{x\}$（即 $U_x$ 最多含 $A$ 中一个点）。$\{U_x\}_{x \in X}$ 是 $X$ 的开覆盖。由紧性，有有限子覆盖 $U_{x_1}, \ldots, U_{x_n}$。则 $A \subseteq \bigcup U_{x_i}$，每个 $U_{x_i}$ 最多含 $A$ 中一个点，故 $A$ 有限，矛盾。$\square$

> [!question] **习题 26.4**
> 设 $X$ 是紧度量空间。证明 $X$ 有可数基（即第二可数，见 Chapter 4）。

**证明**：对每个 $n \in \mathbb{N}^+$，$\{B(x, \frac{1}{n}) \mid x \in X\}$ 是 $X$ 的开覆盖。由紧性，有有限子覆盖 $\mathcal{B}_n$。令 $\mathcal{B} = \bigcup_n \mathcal{B}_n$，则 $\mathcal{B}$ 可数。往证 $\mathcal{B}$ 是基：对任意开集 $U$ 和 $x \in U$，存在 $n$ 使 $B(x, \frac{2}{n}) \subseteq U$。取 $B(y, \frac{1}{n}) \in \mathcal{B}_n$ 覆盖 $x$，则 $x \in B(y, \frac{1}{n}) \subseteq B(x, \frac{2}{n}) \subseteq U$。$\square$

> [!question] **习题 26.5**
> 设 $A, B$ 是不交紧子集，$X$ Hausdorff。证明存在不交开集 $U \supseteq A$，$V \supseteq B$。

**证明**：固定 $a \in A$。对每个 $b \in B$，存在不交开集 $U_{a,b} \ni a$ 和 $V_{a,b} \ni b$。$\{V_{a,b}\}_{b \in B}$ 覆盖 $B$。由 $B$ 紧，有有限子覆盖 $V_{a,b_1}, \ldots, V_{a,b_n}$。令 $U_a = \bigcap_i U_{a,b_i}$，$V_a = \bigcup_i V_{a,b_i}$，则 $U_a \cap V_a = \varnothing$。

现在 $\{U_a\}_{a \in A}$ 覆盖 $A$。由 $A$ 紧，有有限子覆盖 $U_{a_1}, \ldots, U_{a_m}$。令 $U = \bigcup_j U_{a_j}$，$V = \bigcap_j V_{a_j}$，则 $U \cap V = \varnothing$，$A \subseteq U$，$B \subseteq V$。$\square$

> [!question] **习题 26.6**
> 设 $f: X \to Y$ 连续，$X$ 紧，$Y$ Hausdorff。证明 $f$ 是闭映射。

**证明**：设 $C \subseteq X$ 闭。$X$ 紧 $\implies C$ 紧（定理 26.2）。$f$ 连续 $\implies f(C)$ 紧（定理 26.5）。$Y$ Hausdorff $\implies f(C)$ 闭（定理 26.3）。$\square$

> [!question] **习题 26.7**
> 证明紧度量空间是完备的（完备度量空间的定义见 Chapter 7）。

**证明**：设 $(x_n)$ 是紧度量空间 $X$ 中的 Cauchy 列。由紧性，$(x_n)$ 有收敛子列 $x_{n_k} \to x$。Cauchy 列若有收敛子列则整体收敛到同一极限：$\forall \varepsilon > 0$，存在 $N$ 使 $m,n \geqslant N$ 时 $d(x_m, x_n) < \varepsilon/2$；取 $n_k \geqslant N$ 使 $d(x_{n_k}, x) < \varepsilon/2$，则对 $n \geqslant N$，$d(x_n, x) < \varepsilon$。$\square$

> [!question] **习题 26.8**
> 设 $X$ 紧，$Y$ 紧。证明 $X \times Y$ 紧（不用管引理）。

**证明**：已由定理 26.6 给出（使用管引理）。若不用管引理，可使用 Alexander 子基定理：积拓扑的子基为 $\{\pi_1^{-1}(U) \mid U \subseteq X \text{ 开}\} \cup \{\pi_2^{-1}(V) \mid V \subseteq Y \text{ 开}\}$。由 $X, Y$ 紧可推出任意子基覆盖有有限子覆盖。$\square$

> [!question] **习题 26.12**
> 设 $X$ 紧，$(Y, d)$ 是度量空间。证明 $C(X, Y)$（赋予一致度量 $\overline{\rho}$）中的紧子集在一致拓扑下是闭的。

**证明**：一致拓扑是度量拓扑，故 Hausdorff。紧子集在 Hausdorff 空间中闭（定理 26.3）。$\square$

## 相关链接

- 上一节：[[25_Components_and_Local_Connectedness|§25 Components and Local Connectedness]]
- 下一节：[[27_Compact_Subspaces_of_R|§27 Compact Subspaces of the Real Line]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
