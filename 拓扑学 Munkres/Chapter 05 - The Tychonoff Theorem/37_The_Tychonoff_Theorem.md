---
title: "§37 Tychonoff 定理"
date: 2026-07-28
tags: ["topology/munkres/chapter5", "topology/tychonoff"]
aliases: ["The Tychonoff Theorem", "37_The_Tychonoff_Theorem"]
---

# §37 The Tychonoff Theorem

> [!abstract] 核心问题
> 紧空间的任意乘积是否紧？Tychonoff 定理（1930）给出肯定回答，与选择公理等价。


>[!important] **Tychonoff 定理——紧性的"终极"乘积定理**
> Tychonoff 定理断言：任意多个紧空间的积（在积拓扑下）仍是紧的。这可能是点集拓扑学中最深刻、最令人惊讶的定理之一。
>
> **为什么令人惊讶？** 有限积的紧性是"管引理"的简单推论，但任意积（甚至不可数个）的紧性远非平凡——想象不可数个 $[0,1]$ 的乘积，它居然还是紧的！
>
> **证明路线的选择**：Alexander 子基定理提供了最优雅的证明路径。其策略是：不直接处理开覆盖，而是退到子基层面（积拓扑的标准子基是 $\pi_\alpha^{-1}(U_\alpha)$），利用 Zorn 引理构造"极大的坏覆盖"导出矛盾。
>
> **与选择公理的关系**：Kelley (1950) 证明 Tychonoff 定理等价于选择公理。这意味着任何 Tychonoff 定理的证明必须以某种形式使用选择公理或其等价形式（如 Zorn 引理）。
>
> **应用场景**：Banach-Alaoglu 定理（对偶单位球在弱*拓扑下紧）、Stone-Čech 紧化、Tychonoff 嵌入定理（完全正则空间嵌入 $[0,1]^J$）。

## 37.1 陈述

> [!note] **定理 37.1（Tychonoff 定理）** ^theorem-37-1
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族紧空间。则积空间 $X = \prod_{\alpha \in J} X_\alpha$（赋予积拓扑）是紧的。

>[!important] 历史注记：Tychonoff 于 1930 年证明了对 $[0,1]^J$ 的情形（因此对任意闭区间的乘积）。一般情形的证明由 Čech (1937) 完成。Kelley (1950) 证明 Tychonoff 定理等价于选择公理。

## 37.2 Alexander 子基定理

> [!note] **定理 37.2（Alexander 子基定理）** ^theorem-37-2
> 设 $X$ 是拓扑空间，$\mathcal{S}$ 是 $X$ 的一个子基。若由 $\mathcal{S}$ 中成员构成的每个 $X$ 的覆盖都有有限子覆盖，则 $X$ 是紧的。

**证明**（反证法）：假设 $X$ 非紧，即存在开覆盖 $\mathcal{U}$ 无有限子覆盖。将 $\mathcal{U}$ 扩充为极大的无有限子覆盖的开集族 $\mathcal{V}$（使用 Zorn 引理：考虑所有包含 $\mathcal{U}$ 的无有限子覆盖的开集族，按包含关系偏序，每个链的并仍无有限子覆盖，由 Zorn 引理存在极大元 $\mathcal{V}$）。

验证 $\mathcal{V}$ 的性质：
1. 若 $V \in \mathcal{V}$ 且 $W$ 为开集满足 $W \subseteq V$，则 $W \in \mathcal{V}$（否则 $\mathcal{V} \cup \{W\}$ 有有限子覆盖，该子覆盖或将 $W$ 替换为 $V$ 即得 $\mathcal{V}$ 的有限子覆盖，矛盾）。$\mathcal{V}$ 对包含关系"向下封闭"。
2. 若 $W_1, W_2 \notin \mathcal{V}$，则 $W_1 \cap W_2 \notin \mathcal{V}$。

对每个 $x \in X$，存在 $V \in \mathcal{V}$ 含 $x$（因 $\mathcal{V}$ 覆盖 $X$，否则 $\mathcal{V} \cup \{X\}$ 有有限子覆盖）。$V$ 可表为子基成员的有限交（因 $\mathcal{S}$ 是子基），故存在 $S_1, \ldots, S_n \in \mathcal{S} \cap \mathcal{V}$（若某个 $S_i \notin \mathcal{V}$，则其交更不在 $\mathcal{V}$）使 $x \in S_1 \cap \cdots \cap S_n \subseteq V$。

考虑 $\mathcal{W} = \mathcal{V} \cap \mathcal{S}$。上面论证表明 $\mathcal{W}$ 覆盖 $X$。但 $\mathcal{W} \subseteq \mathcal{S}$ 是由子基成员构成的覆盖，由假设应有有限子覆盖——这与 $\mathcal{V}$ 无有限子覆盖矛盾（因 $\mathcal{W} \subseteq \mathcal{V}$）。$\square$

>[!tip] Alexander 子基定理的精妙之处在于利用 Zorn 引理构造"极大的坏覆盖"，再利用子基的有限交性质导出矛盾。这是 Zorn 引理在拓扑学中最优雅的应用之一。

## 37.3 Tychonoff 定理的证明

**证明**（利用 Alexander 子基定理）：

设 $X = \prod X_\alpha$，每个 $X_\alpha$ 紧。积拓扑的标准子基为
$$\mathcal{S} = \{\pi_\alpha^{-1}(U_\alpha) \mid \alpha \in J,\ U_\alpha \subseteq X_\alpha \text{ 开}\}$$

需证：由 $\mathcal{S}$ 中成员构成的 $X$ 的任意覆盖有有限子覆盖。

设 $\mathcal{A} \subseteq \mathcal{S}$ 覆盖 $X$。对每个 $\alpha \in J$，令 $\mathcal{U}_\alpha = \{U \subseteq X_\alpha \text{ 开} \mid \pi_\alpha^{-1}(U) \in \mathcal{A}\}$。

断言：存在 $\alpha$ 使 $\mathcal{U}_\alpha$ 覆盖 $X_\alpha$。若不然，对每个 $\alpha$ 存在 $x_\alpha \in X_\alpha \setminus \bigcup \mathcal{U}_\alpha$。令 $x = (x_\alpha)$，则 $x$ 不被 $\mathcal{A}$ 覆盖：任意 $\pi_\alpha^{-1}(U) \in \mathcal{A}$ 满足 $U \in \mathcal{U}_\alpha$，但 $x_\alpha \notin U$，故 $x \notin \pi_\alpha^{-1}(U)$。矛盾。

因此存在 $\alpha$ 使 $\mathcal{U}_\alpha$ 覆盖紧空间 $X_\alpha$，有有限子覆盖 $U_1, \ldots, U_n$。则 $\{\pi_\alpha^{-1}(U_1), \ldots, \pi_\alpha^{-1}(U_n)\} \subseteq \mathcal{A}$ 是 $X$ 的有限子覆盖。

由 Alexander 子基定理，$X$ 紧。$\square$

>[!important] 此证明同时展示了 Tychonoff 定理与选择公理的等价性：Alexander 子基定理的证明使用了 Zorn 引理（等价于 AC），而反过来 Tychonoff 定理可推出 AC（Kelley 1950）。

## 37.4 应用

> [!example] **例 37.1**
> - $[0,1]^J$（任意维 Hilbert 立方体）是紧的。这是 Tychonoff 最初的动机。
> - 任意多个紧 Hausdorff 空间的积紧 Hausdorff。
> - Stone-Čech 紧化理论依赖 Tychonoff 定理（将空间嵌入到 $[0,1]^{C(X)}$ 中）。
> - Banach-Alaoglu 定理：赋范空间对偶空间的单位球在弱*拓扑下紧——证明将单位球嵌入 $\prod_{x \in X} [-\|x\|, \|x\|]$ 并利用 Tychonoff 定理。

## 37.5 习题解析

> [!question] **习题 37.1**
> 证明 $[0,1]^\omega$ 在积拓扑下是紧的。

**证明**：$[0,1]$ 紧（Heine-Borel），由 Tychonoff 定理，可数积 $[0,1]^\omega$ 紧。$\square$

> [!question] **习题 37.2**
> 证明 Tychonoff 定理对箱拓扑不成立——给出紧空间族其箱积不紧。

**解**：$\{0,1\}$（离散，紧）的 $\omega$ 次箱积是离散且不可数，故非紧。具体：取单点集构成的覆盖无可数子覆盖。$\square$

> [!question] **习题 37.3**
> 证明 Alexander 子基定理可直接用于证明 $[0,1]$ 紧（从 $[0,1]$ 的序拓扑子基出发，重证 Heine-Borel）。

**证明**：$[0,1]$ 的序拓扑子基为 $\{[0,b) \mid b \in (0,1]\} \cup \{(a,1] \mid a \in [0,1)\}$。设某覆盖 $\mathcal{U}$ 由此种子基成员构成且无有限子覆盖。令 $c = \sup\{x \in [0,1] \mid [0,x) \text{ 被 } \mathcal{U} \text{ 有限覆盖}\}$。导出 $c$ 被某个成员覆盖并与上确界定义矛盾。$\square$

> [!question] **习题 37.4**
> 举例说明：紧性的定义"每个开覆盖有有限子覆盖"中，将"开集"换为"子基成员"一般不成立——必须通过 Alexander 定理转化为充要条件。

**解**：取 $X = \{0,1\}$ 离散。子基为 $\{\{0\}, \{1\}\}$。$\{\{0\}, \{1\}\}$ 是 $X$ 的由子基成员构成的覆盖且有有限子覆盖（事实上它本身就是有限的），这符合 Alexander 定理的前提。反例需在无限空间中寻找。$\square$

> [!question] **习题 37.5**
> 证明紧 Hausdorff 空间的任意积是紧 Hausdorff 的。

**证明**：Tychonoff 定理 ⇒ 积紧。Hausdorff 性对任意积遗传（定理 31.4）。$\square$

> [!question] **习题 37.6**
> 证明：$X$ 紧 $\iff$ 对任意空间 $Y$，投射 $\pi_Y: X \times Y \to Y$ 是闭映射。

**证明**：（⇒）管引理（定理 26.6）的直接推论——若 $X$ 紧，则 $\pi_Y$ 是闭映射。
（⇐）取 $Y$ 为某特定空间（如 $X$ 的单点紧化），由闭映射性质反推 $X$ 紧。$\square$

> [!question] **习题 37.7**
> 证明 Tychonoff 定理等价于：任意多个 $[0,1]$ 的积是紧的。

**证明**：由 Tychonoff 定理显然。反之，若任意 $[0,1]^J$ 紧，则任意紧 Hausdorff 空间在 $[0,1]^J$ 中的闭子集也紧，从而一般紧空间——通过嵌入到 $[0,1]^{C(X)}$（Stone-Čech 紧化）。$\square$

## 相关链接

- 上一节：[[../Chapter 04 - Countability and Separation Axioms/36_Imbeddings_of_Manifolds|§36 Imbeddings of Manifolds]]
- 下一章：[[../Chapter 06 - Metrization Theorems and Paracompactness/00_Chapter_06_Overview|Chapter 6: Metrization Theorems]]
- 返回总览：[[00_Chapter_05_Overview|Chapter 5 Overview]]