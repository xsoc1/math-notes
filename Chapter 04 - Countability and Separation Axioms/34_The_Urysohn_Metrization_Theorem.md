---
title: "§34 Urysohn 度量化定理"
date: 2026-07-28
tags: ["topology/munkres/chapter4", "topology/metrization"]
aliases: ["The Urysohn Metrization Theorem", "34_The_Urysohn_Metrization_Theorem"]
---

# §34 The Urysohn Metrization Theorem

> [!abstract] 核心问题
> 一个拓扑空间何时同胚于某个度量空间（即可度量化）？Urysohn 度量化定理给出最经典的条件：第二可数 + 正则 ⇒ 可度量化。


>[!important] **度量化问题的意义**
> "这个空间上有度量吗？"——这是拓扑学最自然的问题之一。度量空间有极好的性质（第一可数、正规、完全正则等），但许多拓扑空间并非天然带有度量。Urysohn 度量化定理给出了最经典的回答。
>
> **证明策略的直觉**：将抽象空间"编织"进具体的可度量化空间 $[0,1]^\omega$ 中。分三步：
> 1. 利用正则性和第二可数性，构造一族可数多个连续函数，它们能"区分"每个点和每个不含它的闭集。
> 2. 将这些函数打包为一个映射 $F:X\to[0,1]^\omega$。由函数的"区分"性质，$F$ 是单射且是嵌入。
> 3. $[0,1]^\omega$ 可度量化（定理 21.4），子空间保持可度量化，故 $X$ 可度量化。
>
> **条件是否可以放宽？** 可以。Nagata-Smirnov 定理将"第二可数"放宽为"$\sigma$-局部有限基"，Bing 定理放宽为"$\sigma$-离散基"。但 Urysohn 定理因其条件的简洁性和证明的优美性，仍是度量化理论的起点。

## 34.1 度量化问题

> [!note] **定义 34.1（可度量化 / Metrizable）**
> 空间 $X$ 称为 **可度量化的 (metrizable)**，若存在 $X$ 上的度量 $d$，使得 $d$ 诱导的拓扑等于 $X$ 的给定拓扑。

>[!important] 度量空间有很多好性质：第一可数、正规、完全正则等。度量化定理将这些性质"打包"为简洁的拓扑条件。

## 34.2 嵌入到 $[0,1]^\omega$

> [!note] **定理 34.1（嵌入定理 / Embedding Theorem）** ^theorem-34-1
> 设 $X$ 是 T₁ 空间，$\{f_n\}_{n \in \mathbb{N}^+}$ 是一族连续函数 $f_n: X \to [0,1]$，满足：对任意闭集 $A \subseteq X$ 和 $x \notin A$，存在 $n$ 使 $f_n(x) > 0$ 而 $f_n(A) = \{0\}$。则映射
> $$F(x) = (f_1(x), f_2(x), \ldots)$$
> 是 $X$ 到 $[0,1]^\omega$ 的嵌入。

**证明**：
- **连续性**：$F$ 到每个坐标 $\pi_n \circ F = f_n$ 连续，故 $F$ 连续（积拓扑的万有性质）。
- **单射**：若 $x \neq y$，取 $A = \{y\}$（单点集闭因为 T₁），由条件存在 $n$ 使 $f_n(x) > 0$ 而 $f_n(y) = 0$，故 $F(x) \neq F(y)$。
- **$F: X \to F(X)$ 是开映射**：只需证 $F$ 将 $X$ 的基开集映为 $F(X)$ 中的开集。设 $U$ 开，$x \in U$。取 $A = X \setminus U$（闭集），由条件存在 $n$ 使 $f_n(x) > 0$，$f_n(A) = 0$。令
  $$V = \pi_n^{-1}((0, \infty)) \cap F(X)$$
  则 $F(x) \in V$（因 $f_n(x) > 0$），且对任意 $y \in X$，若 $F(y) \in V$ 则 $f_n(y) > 0$，故 $y \notin A$ 即 $y \in U$。因此 $F(U)$ 在 $F(X)$ 中是开集（$F(U) = V$ 绕 $x$ 而言）。更精确地，$F(U)$ 可表示为 $F(X)$ 中开集的并。$\square$

>[!tip] 这一定理的关键在于：从连续函数族到积空间的赋值映射，在适当的"分离"条件下是嵌入。它本质上是 Tychonoff 嵌入定理的预热。

## 34.3 Urysohn 度量化定理

> [!note] **定理 34.2（Urysohn 度量化定理）** ^theorem-34-2
> 每个第二可数的正则空间（等价地，每个第二可数的 T₃ 空间）是可度量化的。

**证明**：设 $X$ 是第二可数的正则空间。

**第一步：构造可数函数族。** 由定理 32.6，第二可数 + 正则 ⇒ 正规。设 $\mathcal{B} = \{B_n\}$ 为 $X$ 的可数基。考虑所有满足 $\overline{B}_m \subseteq B_n$ 的基成员对 $(B_m, B_n)$——有可数多个这样的对。对每对 $(B_m, B_n)$ 满足 $\overline{B}_m \subseteq B_n$，由 Urysohn 引理存在连续函数 $g_{m,n}: X \to [0,1]$ 使 $g_{m,n}(\overline{B}_m) = \{0\}$，$g_{m,n}(X \setminus B_n) = \{1\}$。

**第二步：验证嵌入条件。** 设 $A$ 闭，$x \notin A$。则 $x \in X \setminus A$（开集）。存在基成员 $B_n$ 使 $x \in B_n \subseteq X \setminus A$。由正则性，存在基成员 $B_m$ 使 $x \in B_m \subseteq \overline{B}_m \subseteq B_n$。考虑相应的 $g_{m,n}$：$g_{m,n}(x) = 0$（因 $x \in \overline{B}_m$），而 $g_{m,n}(A) = 1$（因 $A \subseteq X \setminus B_n$）。

**第三步：嵌入。** 将可数多个 $g_{m,n}$ 重排为序列 $\{f_k\}$。由定理 34.1，$F(x) = (f_1(x), f_2(x), \ldots)$ 给出 $X$ 到 $[0,1]^\omega$ 的嵌入。

**第四步：$[0,1]^\omega$ 可度量化。** $[0,1]^\omega$ 在积拓扑下可度量化（定理 21.4）。度量子空间的子空间仍可度量化，故 $X$（同胚于 $[0,1]^\omega$ 的子空间）可度量化。$\square$

>[!important] Urysohn 度量化定理是"范畴论"式的证明典范：构造一族连续函数作为"坐标"，将抽象空间嵌入到具体的可度量化空间 $[0,1]^\omega$ 中。

## 34.4 推论

> [!note] **推论 34.3**
> 紧 Hausdorff 空间可度量化 $\iff$ 它是第二可数的。

**证明**：紧 Hausdorff $\Rightarrow$ 正规 $\Rightarrow$ 正则。第二可数 + 正则 $\Rightarrow$ 可度量化（定理 34.2）。反之，紧度量空间是第二可数的（习题 30.4）。$\square$

## 34.5 习题解析

> [!question] **习题 34.1**
> 举例说明正则性条件在 Urysohn 度量化定理中不可省略。

**解**：$\mathbb{R}_K$ 拓扑（$K=\{1/n\}$，基为 $(a,b)$ 和 $(a,b) \setminus K$）是第二可数、Hausdorff，但非正则：$K$ 是闭集，$0 \notin K$，但 $0$ 的任意邻域与 $K$ 的任意邻域均相交。故 $\mathbb{R}_K$ 不可度量化。$\square$

> [!question] **习题 34.2**
> 证明可度量化空间的子空间可度量化。

**证明**：若 $d$ 是 $X$ 上的度量，则 $d|_{Y \times Y}$ 是 $Y$ 上诱导子空间拓扑的度量。$\square$

> [!question] **习题 34.3**
> 证明可度量化空间的可数积可度量化。

**证明**：设 $(X_n, d_n)$ 为度量空间。定义 $D(x,y) = \sum_{n=1}^{\infty} \frac{\min(d_n(x_n, y_n), 1)}{2^n}$。$D$ 是积空间上的度量且诱导积拓扑（类似于定理 21.4 的证明）。$\square$

> [!question] **习题 34.4**
> 证明局部紧 Hausdorff 空间可度量化 $\iff$ 它是第二可数的。

**证明**：（⇒）局部紧 Hausdorff 空间若可度量化，则它是局部紧度量空间。局部可度量空间的第一可数性结合局部紧性……实际上，局部紧度量空间不一定第二可数（如不可数离散空间）。但局部紧 + 第二可数 ⇒ 可度量化（定理 34.2，因为局部紧 Hausdorff ⇒ 正则）。
（⇐）若 $X$ 局部紧 Hausdorff 且第二可数，则 $X$ 正则（习题 32.3），由 Urysohn 度量化定理可度量化。$\square$

> [!question] **习题 34.5**
> 证明 $[0,1]^\omega$（积拓扑）不是局部紧的。

**证明**：若 $[0,1]^\omega$ 局部紧，则某点有紧邻域 $C$。$C$ 包含形如 $\prod U_n$（仅有限个 $U_n \neq [0,1]$）的基开集，此基开集的闭包 $\prod \overline{U}_n$（由 Tychonoff 定理紧）。但其闭包包含坐标全为 $[0,1]$ 的"大"乘积，在积拓扑下非紧——矛盾。实际上，无穷维积空间中"箱"的闭包是闭箱（紧），但无限乘积的整体非紧。更简单的论证：$[0,1]^\omega$ 中每个基开集的闭包非紧（习题 29.4），故非局部紧。$\square$

> [!question] **习题 34.6**
> 设 $X$ 紧 Hausdorff。证明 $X$ 可度量化 $\iff$ 对角映射 $X \to X \times X$ 的原像具有可数基。

**证明**：（较难，利用 $C(X)$ 的可分性和 Stone-Weierstrass 定理）。$\square$

> [!question] **习题 34.7**
> 证明：若 $X$ 是 $T_1$ 空间且有一个函数族 $\{f_n\}$ 如定理 34.1 所述，则 $X$ 可度量化。

**证明**：定理 34.1 给出嵌入 $F: X \hookrightarrow [0,1]^\omega$。$[0,1]^\omega$ 可度量化，子空间可度量化，故 $X$ 同胚于可度量化空间的子空间，从而可度量化。$\square$

## 相关链接
- 上一节：[[33_The_Urysohn_Lemma|§33 The Urysohn Lemma]]
- 下一节：[[35_The_Tietze_Extension_Theorem|§35 The Tietze Extension Theorem]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]