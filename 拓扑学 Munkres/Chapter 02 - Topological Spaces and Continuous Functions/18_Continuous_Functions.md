---
title: "§18 连续函数"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/continuous-function
  - topology/homeomorphism
aliases:
  - "Continuous Functions"
  - "18_Continuous_Functions"
---

# §18 Continuous Functions

> [!abstract] 核心问题
> 拓扑空间中连续性的精确定义是什么？如何证明三种等价刻画？同胚是什么？


>[!important] **为什么用"开集原像开"定义连续？**
> 在 $\mathbb{R}^n$ 中，连续性的 $\varepsilon$-$\delta$ 定义依赖度量。在一般拓扑空间中我们没有度量，但注意到：$f$ 在 $\varepsilon$-$\delta$ 意义下连续 $\iff$ 每个开集的原像是开集。因此，"开集原像开"是连续性的**无度量**推广。
>
> **核心直觉**：连续映射不能"撕裂"空间——它将开集（无边界区域）拉回为开集（仍无边界区域）。如果原像出现了"边界"（非开），说明映射在某处不连续。
>
> **三种等价刻画**（定理 18.1）：开集原像开 $\iff$ 闭集原像闭 $\iff$ 闭包映射 $f(\overline{A})\subseteq\overline{f(A)}$ $\iff$ 邻域语言。每种刻画在不同场合各有优势。

## 18.1 连续函数的定义

> [!note] **定义 18.1（连续函数 / Continuous Function）**
> 设 $X, Y$ 是拓扑空间。映射 $f: X \to Y$ 称为 **连续 (continuous)**，若对 $Y$ 中每个开集 $V$，其原像 $f^{-1}(V)$ 是 $X$ 中的开集。

>[!important] 注意：连续性定义用的是**原像**保开——不是像！这是拓扑连续性与分析中 $\varepsilon$-$\delta$ 定义的统一推广。

> [!note] **定理 18.1（连续性的等价条件）** ^theorem-18-1
> 设 $f: X \to Y$ 是映射。以下等价：
> 1. $f$ 连续；
> 2. 对 $X$ 的每个子集 $A$，$f(\overline{A}) \subseteq \overline{f(A)}$；
> 3. 对 $Y$ 中每个闭集 $B$，$f^{-1}(B)$ 是 $X$ 中的闭集；
> 4. 对每个 $x \in X$ 和 $f(x)$ 的每个邻域 $V$，存在 $x$ 的邻域 $U$ 使得 $f(U) \subseteq V$。

**证明**（(1) $\Rightarrow$ (2)）：
设 $f$ 连续，$A \subseteq X$。任取 $x \in \overline{A}$。设 $V$ 是 $f(x)$ 的任意开邻域。则 $f^{-1}(V)$ 是包含 $x$ 的开集，故 $f^{-1}(V) \cap A \neq \varnothing$。取 $a \in f^{-1}(V) \cap A$，则 $f(a) \in V \cap f(A) \neq \varnothing$。故 $f(x) \in \overline{f(A)}$。

（(2) $\Rightarrow$ (3)）：
设 $B \subseteq Y$ 是闭集。令 $A = f^{-1}(B)$。由 (2)，
$$f(\overline{A}) \subseteq \overline{f(A)} \subseteq \overline{B} = B$$
故 $\overline{A} \subseteq f^{-1}(B) = A$，从而 $A = \overline{A}$ 是闭集。

（(3) $\Rightarrow$ (1)）：
若 $V \subseteq Y$ 是开集，则 $Y \setminus V$ 是闭集。由 (3)，$f^{-1}(Y \setminus V) = X \setminus f^{-1}(V)$ 是闭集，故 $f^{-1}(V)$ 是开集。

（(1) $\Rightarrow$ (4)）：
设 $V$ 是 $f(x)$ 的邻域，取 $f(x)$ 的开邻域 $V_0 \subseteq V$。令 $U = f^{-1}(V_0)$，则 $U$ 是包含 $x$ 的开集，且 $f(U) = V_0 \subseteq V$。

（(4) $\Rightarrow$ (1)）略。$\square$

## 18.2 连续函数的构造

> [!note] **定理 18.2（连续函数的复合与限制）** ^theorem-18-2
> 1. **恒等映射** $\operatorname{id}_X: X \to X$ 连续；
> 2. 若 $f: X \to Y$，$g: Y \to Z$ 连续，则 $g \circ f: X \to Z$ 连续；
> 3. 若 $f: X \to Y$ 连续，$A \subseteq X$ 是子空间，则 $f|_A: A \to Y$ 连续；
> 4. 若 $f: X \to Y$ 连续，且 $f(X) \subseteq Z \subseteq Y$，则限制陪域 $f: X \to Z$ 也连续（$Z$ 赋予子空间拓扑）。

**证明**（仅证 (2)）：
设 $W$ 是 $Z$ 中开集。则 $(g \circ f)^{-1}(W) = f^{-1}(g^{-1}(W))$。由 $g$ 连续，$g^{-1}(W)$ 是 $Y$ 中开集；由 $f$ 连续，$f^{-1}(g^{-1}(W))$ 是 $X$ 中开集。$\square$

## 18.3 积拓扑是使投影连续的最粗拓扑

> [!note] **定理 18.4（到积空间的连续映射）**
> 设 $f: A \to X \times Y$，其分量函数为 $f_1 = \pi_1 \circ f$ 和 $f_2 = \pi_2 \circ f$。则 $f$ 连续 $\iff$ $f_1$ 和 $f_2$ 都连续。

**证明**：
- ($\Rightarrow$)：投影连续，复合投影仍连续。
- ($\Leftarrow$)：积拓扑的基成员为 $U \times V$（$U, V$ 开）。$f^{-1}(U \times V) = f_1^{-1}(U) \cap f_2^{-1}(V)$，由 $f_1, f_2$ 连续知这是开集的有限交，故是开集。而任意开集是基成员的并，其原像是原像的并（$f^{-1}$ 保持并运算）。$\square$

## 18.4 同胚

> [!note] **定义 18.2（同胚 / Homeomorphism）**
> 设 $f: X \to Y$ 是双射。若 $f$ 和 $f^{-1}$ 都连续，则称 $f$ 是一个 **同胚 (homeomorphism)**，$X$ 和 $Y$ 称为 **同胚的 (homeomorphic)**，记作 $X \cong Y$。

>[!important] 同胚是拓扑学中的"等价关系"——同胚的空间具有完全相同的拓扑性质。

> [!example] **例 18.1**
> - 任意开区间 $(a,b) \cong \mathbb{R}$（通过 $f(x) = \tan(\frac{\pi}{b-a}(x - \frac{a+b}{2}))$）；
> - $S^1 \setminus \{p\} \cong \mathbb{R}$（球极投影）；
> - $(0,1) \not\cong [0,1]$（前者非紧，后者紧——紧性见第三章）。

> [!note] **定义 18.3（拓扑嵌入 / Topological Imbedding）**
> 连续单射 $f: X \to Y$ 称为 **拓扑嵌入 (imbedding)**，若 $f: X \to f(X)$ 是同胚（$f(X)$ 赋予 $Y$ 的子空间拓扑）。

## 18.5 习题解析

> [!question] **习题 18.1**
> 证明连续函数的 $\varepsilon$-$\delta$ 定义（在度量空间中）等价于拓扑定义。

**证明**：在度量空间中，开集定义为开球的任意并。$f$ 在 $\varepsilon$-$\delta$ 意义下连续 $\iff$ 对每个 $x$ 和 $\varepsilon > 0$，存在 $\delta > 0$ 使得 $f(B_\delta(x)) \subseteq B_\varepsilon(f(x))$ $\iff$ 对每个开球 $B_\varepsilon(f(x))$，其原像包含一个开球 $B_\delta(x)$ $\iff$ 每个开集的原像是开集（由基的性质）。$\square$

> [!question] **习题 18.4**
> 设 $X$ 和 $Y$ 是拓扑空间，$Y$ 是 Hausdorff 的。若 $f,g: X \to Y$ 是连续函数，证明 $\{x \in X \mid f(x) = g(x)\}$ 是闭集。

**证明**：定义 $h: X \to Y \times Y$ 为 $h(x) = (f(x), g(x))$。由定理 18.4，$h$ 连续。$Y$ 是 Hausdorff 的 $\iff$ 对角线 $\Delta = \{(y,y) \mid y \in Y\}$ 在 $Y \times Y$ 中闭（习题 17.13）。则 $\{x \mid f(x)=g(x)\} = h^{-1}(\Delta)$ 是闭集（连续映射下闭集的原像是闭集）。$\square$

> [!question] **习题 18.6**
> 找出 $f: \mathbb{R} \to \mathbb{R}$ 连续，但将开集映为开集的映射（开映射）不连续的例子。以及连续但不开映射的例子。

**解**：
- 开映射但不连续：在 $\mathbb{R}$ 上赋予离散拓扑，$f(x)=x$ 视为到标准 $\mathbb{R}$ 的映射时是开映射（每个集合在离散拓扑中是开集），但不是开映射因为标准拓扑中的开集在离散拓扑中也是开集……实际上这个映射是连续的。需要更精细的例子：取 $f(x)=x$，将标准 $\mathbb{R}$ 映到离散 $\mathbb{R}$——不连续（单点集的原像是单点集，但标准拓扑中的单点集不是开集），但是开映射（标准开集在离散拓扑中当然是开集）。
- 连续但不开：$f(x)=x^2$ 在 $\mathbb{R}$ 上连续，但 $f((-1,1)) = [0,1)$ 不是开集。

> [!question] **习题 18.12**
> 设 $f: X \to Y$ 连续且 $Y$ 是 Hausdorff 的。证明 $f$ 的图像 $G_f = \{(x, f(x)) \mid x \in X\}$ 在 $X \times Y$ 中是闭集。

**证明**：定义 $F: X \times Y \to Y \times Y$ 为 $F(x,y) = (f(x), y)$。则 $F$ 连续（分量连续）。$G_f = F^{-1}(\Delta)$，而 $\Delta$ 在 $Y \times Y$ 中闭（$Y$ Hausdorff）。故 $G_f$ 是闭集。$\square$

## 相关链接

- 上一节：[[17_Closed_Sets_and_Limit_Points|§17 Closed Sets and Limit Points]]
- 下一节：[[19_The_Product_Topology|§19 The Product Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
