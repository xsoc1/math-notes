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
> 在一般拓扑空间之间，如何脱离 $\varepsilon$-$\delta$ 距离语言给出“连续映射”的公理化定义？连续性的四种等价刻画（开集原像、闭包包含、闭集原像、逐点邻域）如何互相转化？什么样的拓扑空间在拓扑学意义下被视为“同一个空间”（同胚）？

> [!important] **为什么用“开集的原像是开集”来定义连续？**
> 在数学分析与度量空间中，函数 $f$ 的连续性是用 $\varepsilon$-$\delta$ 语言定义的：在每一点 $x$ 处，要把像点 $f(y)$ 控制在 $f(x)$ 的 $\varepsilon$-开球邻域内，只需将自变量 $y$ 控制在 $x$ 的某个 $\delta$-开球邻域内。在一般拓扑空间中虽然没有距离，但开球的角色被一般“开集”所取代：容易验证，$\varepsilon$-$\delta$ 连续性等价于“目标空间中每一个开集的原像都是定义域中的开集”。因此，**“开集原像为开集”是连续性概念最纯粹、最自然的无度量推广**。
>
> **核心几何直觉**：连续映射允许对空间进行弯曲、拉伸或压缩，但绝不允许把空间“撕裂”。如果在映射 $f: X \to Y$ 下某处发生了撕裂（例如跳跃间断），原本在 $X$ 中紧挨着某子集 $A$ 的极限点 $x \in \overline{A}$，其像 $f(x)$ 就会被远远甩在 $\overline{f(A)}$ 之外，违反闭包保持性质 $f(\overline{A}) \subseteq \overline{f(A)}$。

## 18.1 连续函数的定义与等价刻画

> [!note] **定义 18.1（连续函数 / Continuous Function）**
> 设 $X$ 和 $Y$ 是两个拓扑空间。称映射 $f: X \to Y$ 是 **连续的（continuous）**，如果对于 $Y$ 中的每一个开集 $V$，它在 $f$ 下的原像
> $$f^{-1}(V) = \{x \in X \mid f(x) \in V\}$$
> 都是 $X$ 中的开集。

> [!important] **注意方向：连续性要求的是“原像 $f^{-1}$ 保开”，而非正向像 $f$ 保开！**
> 之所以用原像 $f^{-1}$ 而不是正向像 $f$，一方面是因为映射的原像运算 $f^{-1}$ 完美保持任意并、任意交与补集运算；另一方面，许多最基本的连续函数（如常值函数 $f(x) \equiv c$ 或二次函数 $f(x) = x^2$）都不会把开集映为开集（正向像保开的映射另称为**开映射 / open map**）。
> 此外，若 $Y$ 的拓扑由某组基 $\mathcal{B}$（或子基 $\mathcal{S}$）生成，则由于开集是基元素（或子基有限交）的并集且 $f^{-1}$ 保持并集与交集，**要检验 $f: X \to Y$ 连续，只需验证 $Y$ 的每个基元素 $B \in \mathcal{B}$（或每个子基元素 $S \in \mathcal{S}$）的原像 $f^{-1}(B)$ 在 $X$ 中是开集即可**。

> [!note] **定理 18.1（连续映射的四个等价条件）** ^theorem-18-1
> 设 $X$ 和 $Y$ 是拓扑空间，$f: X \to Y$ 是映射。则以下四个陈述彼此等价：
> 1. $f$ 是连续映射（即 $Y$ 中每个开集的原像在 $X$ 中是开集）；
> 2. 对于 $X$ 的任意子集 $A$，均有 $f(\overline{A}) \subseteq \overline{f(A)}$；
> 3. 对于 $Y$ 中的每一个闭集 $B$，其原像 $f^{-1}(B)$ 在 $X$ 中是闭集；
> 4. 对于每一个点 $x \in X$ 以及 $f(x)$ 在 $Y$ 中的每一个邻域 $V$，都存在 $x$ 在 $X$ 中的一个邻域 $U$，使得 $f(U) \subseteq V$。
>
> 若条件 (4) 对某个特定的点 $x \in X$ 成立，则称 $f$ **在点 $x$ 处连续（continuous at $x$）**。

**证明**：我们按循环链 $(1) \Rightarrow (2) \Rightarrow (3) \Rightarrow (1)$ 以及 $(1) \iff (4)$ 给出完整证明：
- **$((1) \Rightarrow (2))$**：设 $f$ 连续，$A \subseteq X$。任取 $x \in \overline{A}$，我们需要证明 $f(x) \in \overline{f(A)}$。为此，任取包含 $f(x)$ 的开邻域 $V \subseteq Y$。因为 $f$ 连续，$f^{-1}(V)$ 是 $X$ 中包含点 $x$ 的开邻域。由于 $x \in \overline{A}$，由闭包邻域判据（定理 17.5）知 $f^{-1}(V) \cap A \neq \varnothing$。取一点 $a \in f^{-1}(V) \cap A$，则 $f(a) \in V$ 且 $f(a) \in f(A)$，即 $V \cap f(A) \neq \varnothing$。由开邻域 $V \ni f(x)$ 的任意性及定理 17.5，立得 $f(x) \in \overline{f(A)}$，故 $f(\overline{A}) \subseteq \overline{f(A)}$。
- **$((2) \Rightarrow (3))$**：设 $B$ 是 $Y$ 中的闭集（即 $\overline{B} = B$），记其原像为 $A = f^{-1}(B) \subseteq X$。我们要证 $A$ 在 $X$ 中是闭集，这等价于证 $\overline{A} = A$（只需证 $\overline{A} \subseteq A$）。应用条件 (2)，并利用 $f(A) = f(f^{-1}(B)) \subseteq B$，有：
  $$f(\overline{A}) \subseteq \overline{f(A)} \subseteq \overline{B} = B$$
  两边同时取原像 $f^{-1}$，得 $\overline{A} \subseteq f^{-1}(f(\overline{A})) \subseteq f^{-1}(B) = A$。结合 $A \subseteq \overline{A}$ 知 $\overline{A} = A$，故 $A = f^{-1}(B)$ 是 $X$ 中的闭集。
- **$((3) \Rightarrow (1))$**：任取 $Y$ 中的开集 $V$，则其补集 $B = Y \setminus V$ 是 $Y$ 中的闭集。由条件 (3)，原像 $f^{-1}(B)$ 在 $X$ 中是闭集。而由原像对补集的保持性质有：
  $$f^{-1}(B) = f^{-1}(Y \setminus V) = X \setminus f^{-1}(V)$$
  因为 $X \setminus f^{-1}(V)$ 是闭集，所以 $f^{-1}(V)$ 是 $X$ 中的开集。
- **$((1) \iff (4))$**：
  - 若 (1) 成立，对任意 $x \in X$ 及包含 $f(x)$ 的开邻域 $V$，直接取 $U = f^{-1}(V)$，则 $U$ 是包含 $x$ 的开邻域且 $f(U) = f(f^{-1}(V)) \subseteq V$，故 (4) 成立。
  - 反之若 (4) 成立，任取 $Y$ 中开集 $V$。对原像 $f^{-1}(V)$ 中的任意点 $x$，有 $f(x) \in V$，故 $V$ 是 $f(x)$ 的开邻域。由 (4) 知存在包含 $x$ 的开邻域 $U_x \subseteq X$ 使得 $f(U_x) \subseteq V$，即 $x \in U_x \subseteq f^{-1}(V)$。由逐点开邻域判据（习题 12.1），$f^{-1}(V) = \bigcup_{x \in f^{-1}(V)} U_x$ 是开集的并集，因而在 $X$ 中是开集。$\square$

## 18.2 同胚与拓扑嵌入（Homeomorphisms and Imbeddings）

> [!note] **定义 18.2（同胚 / Homeomorphism）**
> 设 $X$ 和 $Y$ 是拓扑空间，$f: X \to Y$ 是一个**双射（bijection）**。若映射 $f: X \to Y$ 与其逆映射 $f^{-1}: Y \to X$ **都是连续的**，则称 $f$ 是一个 **同胚（homeomorphism）**，并称空间 $X$ 与 $Y$ 是 **同胚的（homeomorphic）**，记作 $X \cong Y$。

> [!important] **同胚的本质：拓扑结构的同构**
> 注意双射 $f: X \to Y$ 的逆映射 $f^{-1}$ 连续，等价于对 $X$ 中的任意开集 $U$，$(f^{-1})^{-1}(U) = f(U)$ 在 $Y$ 中是开集（即 $f$ 也是开映射）。因此，同胚映射 $f$ 不仅给出了点集 $X$ 与 $Y$ 之间的一一对应，而且给出了**开集族 $\mathcal{T}_X$ 与 $\mathcal{T}_Y$ 之间的一一对应**：
> $$U \text{ 在 } X \text{ 中开} \iff f(U) \text{ 在 } Y \text{ 中开}$$
> 凡是仅由集合与开集公理所定义的性质（如连通性、紧致性、Hausdorff 性质、可度量化等），在同胚映射下都完全保持不变，这类性质统称为**拓扑性质（topological properties）**或**拓扑不变量**。

> [!note] **定义 18.3（拓扑嵌入 / Topological Imbedding）**
> 设 $f: X \to Y$ 是一个**连续单射（injective continuous map）**。记 $Z = f(X) \subseteq Y$ 为像集，并在 $Z$ 上赋予 $Y$ 的子空间拓扑。若限制陪域后的双射 $f': X \to Z$（定义为 $f'(x) = f(x)$）是一个从 $X$ 到 $Z$ 的同胚，则称 $f: X \to Y$ 是 $X$ 到 $Y$ 中的一个 **拓扑嵌入（topological imbedding）**。

> [!example] **例 18.1（经典同胚与非同胚对比例子）**
> 1. **开区间与全实直线同胚**：开区间 $(-1, 1)$ 与实直线 $\mathbb{R}$ 同胚，同胚映射可取 $f(x) = \frac{x}{1 - x^2}$（或正切映射 $x \mapsto \tan(\frac{\pi}{2}x)$），其全域良定义的连续逆映射为
>    $$f^{-1}(y) = \frac{2y}{\sqrt{1 + 4y^2} + 1} \qquad (\forall y \in \mathbb{R})$$
>    （注：采用分母有理化后的上式可使 $y = 0$ 处也直接良定义为 $f^{-1}(0) = 0$，避免 $\frac{\sqrt{1+4y^2}-1}{2y}$ 在 $y = 0$ 处出现 $0/0$ 未定式）。同理，任意非空有界开区间 $(a, b)$ 均可通过 $x \mapsto \tan\bigl(\frac{\pi}{b-a}(x - \frac{a+b}{2})\bigr)$ 与 $\mathbb{R}$ 同胚。
> 2. **圆周挖去一点与实直线同胚（$S^1 \setminus \{p\} \cong \mathbb{R}$）**：单位圆周 $S^1 \subseteq \mathbb{R}^2$ 挖去北极点 $p = (0, 1)$ 后的子空间，通过球极投影（stereographic projection）$(x, y) \mapsto \frac{x}{1 - y}$ 与实直线 $\mathbb{R}$ 同胚（其连续逆映射为 $t \mapsto \bigl(\frac{2t}{t^2+1}, \frac{t^2-1}{t^2+1}\bigr)$）。
> 3. **开区间 $(0, 1)$ 与闭区间 $[0, 1]$ 不同胚（$(0, 1) \not\cong [0, 1]$）**：这将在第三章通过紧致性（$[0, 1]$ 紧致而 $(0, 1)$ 非紧）或连通性割点性质（从 $[0, 1]$ 挖去端点 $0$ 后 $(0, 1]$ 仍连通，而从 $(0, 1)$ 挖去任意一点 $x_0$ 后 $(0, x_0) \cup (x_0, 1)$ 均不连通）严格证明。
> 4. **连续双射未必是同胚**！考虑半开区间 $X = [0, 1) \subseteq \mathbb{R}$ 与单位圆周 $Y = S^1 = \{(\cos 2\pi t, \sin 2\pi t) \mid t \in [0, 1)\} \subseteq \mathbb{R}^2$。映射 $f: [0, 1) \to S^1$，$f(t) = (\cos 2\pi t, \sin 2\pi t)$ 是**连续双射**，但它的逆映射 $f^{-1}$ 在点 $(1, 0) = f(0)$ 处**不连续**：在 $[0, 1)$ 的子空间拓扑中，$[0, 1/4)$ 是开集，但它的正向像 $f([0, 1/4))$ 在圆周 $S^1$ 上对应从 $(1,0)$ 逆时针到 $(0,1)$ 的半开圆弧，由于缺失了从下半圆逼近 $(1,0)$ 的一侧，该圆弧在 $S^1$ 中不是开集！

## 18.3 构造连续函数的常用法则（含粘合引理）

> [!note] **定理 18.2（构造连续函数的基本法则）** ^theorem-18-2
> 设 $X, Y, Z$ 是拓扑空间。
> 1. **（常值映射）** 若 $f: X \to Y$ 将 $X$ 的所有点映为同一个定点 $y_0 \in Y$，则 $f$ 连续；
> 2. **（包含映射）** 若 $A$ 是 $X$ 的子空间，则包含映射 $j: A \hookrightarrow X$（$j(a) = a$）连续；
> 3. **（复合映射）** 若 $f: X \to Y$ 和 $g: Y \to Z$ 都连续，则复合映射 $g \circ f: X \to Z$ 连续；
> 4. **（限制定义域）** 若 $f: X \to Y$ 连续，且 $A$ 是 $X$ 的子空间，则限制映射 $f|_A = f \circ j: A \to Y$ 连续；
> 5. **（限制或扩大陪域）** 设 $Z$ 是 $Y$ 的子空间且包含像集 $f(X) \subseteq Z$，则映射 $f: X \to Y$ 连续**当且仅当**限制陪域后的映射 $g: X \to Z$（$g(x) = f(x)$）连续；
> 6. **（开集局部性质）** 若 $X = \bigcup_\alpha U_\alpha$ 可以写为一族**开集** $U_\alpha$ 的并集，且对每个 $\alpha$，限制映射 $f|_{U_\alpha}: U_\alpha \to Y$ 都连续，则 $f: X \to Y$ 在全空间上连续。

**证明**：
- (1) 对 $Y$ 中任意开集 $V$，若 $y_0 \in V$ 则 $f^{-1}(V) = X$，若 $y_0 \notin V$ 则 $f^{-1}(V) = \varnothing$，均为开集。
- (2) 对 $X$ 中开集 $U$，$j^{-1}(U) = U \cap A$ 恰为 $A$ 的子空间开集。
- (3) 对 $Z$ 中开集 $W$，$(g \circ f)^{-1}(W) = f^{-1}(g^{-1}(W))$，由 $g$ 和 $f$ 依次保开原像即得。
- (4) $f|_A = f \circ j$ 为两个连续映射的复合。
- (5) 若 $f$ 连续，对 $Z$ 中开集 $V = W \cap Z$（$W$ 在 $Y$ 中开），因 $f(X) \subseteq Z$，有 $g^{-1}(V) = f^{-1}(W \cap Z) = f^{-1}(W)$ 在 $X$ 中开；反之 $f = j_Z \circ g$ 为 $g$ 与包含映射 $j_Z: Z \hookrightarrow Y$ 的复合。
- (6) 对 $Y$ 中任意开集 $V$，注意到 $(f|_{U_\alpha})^{-1}(V) = f^{-1}(V) \cap U_\alpha$。因为 $f|_{U_\alpha}$ 连续，故 $f^{-1}(V) \cap U_\alpha$ 在子空间 $U_\alpha$ 中开；又因 $U_\alpha$ 本身在 $X$ 中是开集，由引理 16.2 知 $f^{-1}(V) \cap U_\alpha$ 在 $X$ 中也是开集。于是
  $$f^{-1}(V) = \bigcup_{\alpha} \bigl(f^{-1}(V) \cap U_\alpha\bigr)$$
  是 $X$ 中一族开集的并集，从而在 $X$ 中是开集。$\square$

当我们将空間拆分为**有限个闭集**（如分段函数在闭区间端点处拼接）时，有极为实用的**粘合引理（Pasting Lemma）**：

> [!note] **定理 18.3（粘合引理 / The Pasting Lemma）** ^theorem-18-3
> 设 $X = A \cup B$，其中 $A$ 和 $B$ 都是 $X$ 中的**闭集**（或都是开集）。设 $f: A \to Y$ 和 $g: B \to Y$ 都是连续映射。若在公共交集上两者取值一致，即：
> $$\forall x \in A \cap B, \quad f(x) = g(x)$$
> 则将 $f$ 和 $g$ 拼接起来定义的分段映射 $h: X \to Y$：
> $$h(x) = \begin{cases} f(x), & x \in A, \\ g(x), & x \in B \end{cases}$$
> 是 $X$ 到 $Y$ 的连续映射。

**证明**：当 $A, B$ 都是闭集时，利用定理 18.1(3)（闭集原像判据）最为简洁。任取 $Y$ 中的闭集 $C$，由原像运算性质有：
$$h^{-1}(C) = f^{-1}(C) \cup g^{-1}(C)$$
因为 $f: A \to Y$ 连续，故 $f^{-1}(C)$ 在子空间 $A$ 中是闭集；又因 $A$ 本身在母空间 $X$ 中是闭集，由定理 17.3 知 $f^{-1}(C)$ 在母空间 $X$ 中也是闭集。同理，$g^{-1}(C)$ 在母空间 $X$ 中也是闭集。因此 $h^{-1}(C)$ 是 $X$ 中两个闭集的有限并集，从而在 $X$ 中是闭集。由定理 18.1(3) 知 $h$ 连续。$\square$

> [!warning] **注意：粘合引理对无穷多个闭集的并集不成立！**
> 若 $X = \bigcup_{n=1}^\infty A_n$ 是可数无穷多个闭集的并，即使 $h|_{A_n}$ 在每个闭集 $A_n$ 上连续，拼接后的 $h$ 也未必连续（因为无穷多个闭集的并集未必是闭集，例如取 $A_n = [1/(n+1), 1/n]$ 与 $A_0 = \{0\}$，可构造在 $0$ 处不连续的函数）。

> [!note] **定理 18.4（映射到积空间的连续性判据）** ^theorem-18-4
> 设映射 $f: A \to X \times Y$ 由形式 $f(a) = \bigl(f_1(a), f_2(a)\bigr)$ 给出，其中 $f_1 = \pi_1 \circ f: A \to X$ 和 $f_2 = \pi_2 \circ f: A \to Y$ 称为 $f$ 的**坐标分量函数（coordinate functions）**。则映射 $f: A \to X \times Y$ 连续，**当且仅当两个坐标分量函数 $f_1$ 和 $f_2$ 都连续**。

**证明**：
- ($\Rightarrow$)：因为坐标投射 $\pi_1: X \times Y \to X$ 和 $\pi_2: X \times Y \to Y$ 在积拓扑下连续，若 $f$ 连续，则复合映射 $f_1 = \pi_1 \circ f$ 和 $f_2 = \pi_2 \circ f$ 必连续。
- ($\Leftarrow$)：设 $f_1, f_2$ 都连续。我们只需验证积拓扑的任意基元素 $U \times V$（其中 $U$ 在 $X$ 中开，$V$ 在 $Y$ 中开）的原像在 $A$ 中是开集。注意到对任意 $a \in A$：
  $$a \in f^{-1}(U \times V) \iff f(a) \in U \times V \iff f_1(a) \in U \text{ 且 } f_2(a) \in V$$
  即
  $$f^{-1}(U \times V) = f_1^{-1}(U) \cap f_2^{-1}(V)$$
  因为 $f_1, f_2$ 连续，$f_1^{-1}(U)$ 和 $f_2^{-1}(V)$ 都是 $A$ 中的开集，故它们的交集 $f^{-1}(U \times V)$ 也是 $A$ 中的开集。因此 $f$ 连续。$\square$

## 18.4 习题解析

> [!question] **习题 18.1**
> 证明对于实变函数 $f: \mathbb{R} \to \mathbb{R}$，微积分中的 $\varepsilon$-$\delta$ 连续定义与拓扑学中的开集原像定义完全等价。

**证明**：在标准拓扑下，$\mathbb{R}$ 中点 $x$ 的开球邻域就是开区间 $(x - \delta, x + \delta)$。微积分中 $f$ 在每一点 $x \in \mathbb{R}$ 处满足 $\varepsilon$-$\delta$ 连续，意思是：对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得 $f\bigl((x-\delta, x+\delta)\bigr) \subseteq \bigl(f(x)-\varepsilon, f(x)+\varepsilon\bigr)$。由于开区间构成 $\mathbb{R}$ 标准拓扑的基，这与定理 18.1(4) 的逐点邻域刻画完全等价，从而与定义 18.1（开集原像为开集）完全等价。$\square$

> [!question] **习题 18.4（原笔记题：Hausdorff 空间中连续映射的相等集为闭集；关联原书 §18 Exercise 13）**
> 设 $X$ 和 $Y$ 是拓扑空间，其中 $Y$ 是 Hausdorff 空间。若 $f, g: X \to Y$ 是连续映射，证明相等集 $E = \{x \in X \mid f(x) = g(x)\}$ 在 $X$ 中是闭集。

**证明**：构造到积空间的映射 $h: X \to Y \times Y, \, h(x) = \bigl(f(x), g(x)\bigr)$。由定理 18.4 知 $h$ 连续。因为 $Y$ 是 Hausdorff 空间，由习题 17.13 知对角线 $\Delta = \{(y, y) \mid y \in Y\}$ 在 $Y \times Y$ 中是闭集。而相等集恰为对角线的连续原像 $E = h^{-1}(\Delta)$，由定理 18.1(3) 知 $E$ 在 $X$ 中是闭集。$\square$

> [!question] **习题 18.6（原笔记补充题：开映射与连续映射的独立性对比）**
> 寻找一个不连续但将开集映为开集（开映射）的例子，以及一个连续但不是开映射的例子。

**解**：
1. **开映射但不连续**：设 $X = (\mathbb{R}, \mathcal{T}_{\text{std}})$ 为赋予标准拓扑的实数集，$Y = (\mathbb{R}, \mathcal{T}_d)$ 为赋予离散拓扑的实数集，考虑恒等映射 $f: X \to Y, \, f(x) = x$。
   - **是开映射**：因为目标空间 $Y$ 是离散拓扑，$Y$ 的任意子集都是开集，故对 $X$ 中任意开集 $U$，像集 $f(U) = U$ 在 $Y$ 中当然是开集；
   - **不连续**：单点集 $\{0\}$ 在离散空间 $Y$ 中是开集，但其原像 $f^{-1}(\{0\}) = \{0\}$ 在标准实直线 $X$ 中不是开集，故 $f$ 在每一点处均不连续。
2. **连续但不是开映射**：取标准实直线上的函数 $f: \mathbb{R} \to \mathbb{R}, \, f(x) = x^2$。它是连续函数，但它将开区间 $U = (-1, 1)$ 映为半开半闭区间 $f((-1, 1)) = [0, 1)$，后者在 $\mathbb{R}$ 中不是开集。

> [!question] **习题 18.6 补充（原书 §18 Exercise 6, p. 111：恰好在一点处连续的函数）**
> 寻找一个函数 $f: \mathbb{R} \to \mathbb{R}$，使其在**恰好一点**处连续，而在其余所有点处均不连续。

**解**：定义修正的 Dirichlet 函数 $f: \mathbb{R} \to \mathbb{R}$ 为：
$$f(x) = \begin{cases} x, & x \in \mathbb{Q}, \\ 0, & x \in \mathbb{R} \setminus \mathbb{Q}. \end{cases}$$
- **在 $x = 0$ 处连续**：对任意 $\varepsilon > 0$，取 $\delta = \varepsilon$，当 $|x - 0| < \delta$ 时恒有 $|f(x) - f(0)| \leqslant |x| < \varepsilon$，故 $f$ 在 $0$ 处连续；
- **在任意 $x_0 \neq 0$ 处不连续**：取 $\varepsilon = |x_0| / 2 > 0$，在 $x_0$ 的任意开区间邻域 $(x_0 - \delta, x_0 + \delta)$ 内既含有有理数 $q$（满足 $|f(q) - x_0| = |q - x_0|$ 任意小）又含有无理数 $r$（满足 $f(r) = 0$），故像集直径不小于 $|x_0|/2$，$f$ 在 $x_0 \neq 0$ 处不连续。$\square$

> [!question] **习题 18.12 & 18.13（原书 §18 Exercise 13, p. 112 及图像闭集性质：稠密子集延拓唯一性与连续函数图像）**
> 设 $X$ 是拓扑空间，$Y$ 是 **Hausdorff 空间**，$f, g: X \to Y$ 是两个连续映射。证明：
> 1. 相等集 $E = \{x \in X \mid f(x) = g(x)\}$ 在 $X$ 中是闭集；
> 2. 若 $f$ 和 $g$ 在 $X$ 的某个稠密子集 $D \subseteq X$（即 $\overline{D} = X$）上恒相等（$f|_D = g|_D$），则 $f = g$ 在整个 $X$ 上恒成立；
> 3. 连续映射 $f: X \to Y$ 的图像 $G_f = \{(x, f(x)) \mid x \in X\}$ 在积空间 $X \times Y$ 中是闭集。

**证明**：
1. 构造到积空间的映射 $h: X \to Y \times Y, \, h(x) = \bigl(f(x), g(x)\bigr)$。因为两个分量 $f, g$ 均连续，由定理 18.4 知 $h$ 是连续映射。由于 $Y$ 是 Hausdorff 空间，由习题 17.13 知对角线 $\Delta = \{(y, y) \mid y \in Y\}$ 在 $Y \times Y$ 中是闭集。而相等集恰好是对角线在连续映射 $h$ 下的原像：
   $$E = \{x \in X \mid f(x) = g(x)\} = h^{-1}(\Delta)$$
   由定理 18.1(3)（闭集的连续原像是闭集），$E$ 在 $X$ 中是闭集。
2. 若在稠密子集 $D$ 上有 $f|_D = g|_D$，则 $D \subseteq E$。由于 $E$ 是闭集，必有 $X = \overline{D} \subseteq \overline{E} = E \subseteq X$，即 $E = X$，故对所有 $x \in X$ 均有 $f(x) = g(x)$。
3. 构造映射 $F: X \times Y \to Y \times Y, \, F(x, y) = \bigl(f(x), y\bigr)$。因为两个坐标分量 $(x,y) \mapsto f(\pi_1(x,y))$ 与 $(x,y) \mapsto \pi_2(x,y)$ 都连续，由定理 18.4 知 $F$ 连续。由于图像 $G_f = F^{-1}(\Delta)$ 是闭集 $\Delta \subseteq Y \times Y$ 的连续原像，故 $G_f$ 在 $X \times Y$ 中是闭集。$\square$

## 相关链接

- 上一节: [[17_Closed_Sets_and_Limit_Points|§17 Closed Sets and Limit Points]]
- 下一节: [[19_The_Product_Topology|§19 The Product Topology]]
- 返回总览: [[00_Chapter_02_Overview|Chapter 2 Overview]]
