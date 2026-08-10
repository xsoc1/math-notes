---
title: "§33 Urysohn 引理"
date: 2026-07-28
tags:
  - topology/munkres/chapter4
  - topology/urysohn-lemma
aliases:
  - "The Urysohn Lemma"
  - "33_The_Urysohn_Lemma"
---

# §33 The Urysohn Lemma

> [!abstract] 核心问题
> 正规空间中，不相交的闭集能否被**连续函数**（而不仅仅是开集）分离？Urysohn 引理给出肯定回答——这是点集拓扑学中最深刻的定理之一。

## 33.1 陈述与动机

> [!note] **定理 33.1（Urysohn 引理 / Urysohn Lemma）** ^theorem-33-1
> 设 $X$ 是正规空间，$A,B$ 是 $X$ 中不相交的闭集。则存在连续函数 $f: X \to [0,1]$ 使得 $f(A) = \{0\}$，$f(B) = \{1\}$。

>[!important] 意义：Urysohn 引理将"开集分离"提升为"连续函数分离"，为度量化定理、Tietze 扩张定理、完全正则性等铺平道路。


>[!important] **构造背后的直觉**
> Urysohn 引理的证明是拓扑学中最优美的构造性论证之一。核心想法：
>
> **第一步——"分层"**：我们想在 $A$（取值 $0$）和 $B$（取值 $1$）之间插入连续过渡。二进有理数 $P=\{m/2^n\}$ 在 $[0,1]$ 中稠密，我们为每个 $p\in P$ 分配一个开集 $U_p$，满足 $p<q\Rightarrow\overline{U}_p\subseteq U_q$。这就像在 $A$ 和 $B$ 之间"层层嵌套"开集，每层对应函数的一个水平集。
>
> **第二步——"插入"**：正规性（定理 32.1）恰好允许我们在 $\overline{U}_p\subseteq U_q$ 之间"插入"一个新的开集 $U_r$（$p<r<q$）。这类似于 Dedekind 分割的拓扑版本。
>
> **第三步——"读取"函数值**：定义 $f(x)=\inf\{p\mid x\in U_p\}$。直观上，$p$ 越小，$U_p$ 越"靠近" $A$；$p$ 越大，$U_p$ 越"靠近" $B$。$x$ 的函数值就是 $x$ 落在哪些"层"中的分界点。
>
> **为什么必须是二进有理数？** 因为归纳构造每次插入一个数时，只需为它在已有两数之间分配开集。二进有理数的树状结构恰好适合这种"二分插入"的归纳法。

## 33.2 证明

**证明**（Munkres 构造）：

**第一步：二进有理数开集族。** 令 $P = \mathbb{Q} \cap [0,1]$ 为 $[0,1]$ 中的二进有理数全体（即形如 $m/2^n$ 的有理数）。我们将构造一族开集 $\{U_p\}_{p \in P}$，满足：
$$p < q \implies \overline{U}_p \subseteq U_q, \quad A \subseteq U_0, \quad U_1 = X \setminus B$$

**第二步：归纳构造。** 将 $P$ 排列为序列 $p_1, p_2, \ldots$（$P$ 可数），其中 $p_1 = 1$，$p_2 = 0$。
- 首先定义 $U_1 = X \setminus B$（开集，$A \subseteq U_1$）。
- 由正规性（定理 32.1），存在开集 $U_0$ 使 $A \subseteq U_0 \subseteq \overline{U}_0 \subseteq U_1$。
- 假设对 $P_n = \{p_1, \ldots, p_n\}$ 已构造 $\{U_p\}_{p \in P_n}$，满足对 $P_n$ 中相邻的有理数 $p < q$ 有 $\overline{U}_p \subseteq U_q$。设 $p_{n+1} = r$，在 $P_n$ 中取其直接前驱 $p$ 和直接后继 $q$（$p < r < q$）。由归纳假设 $\overline{U}_p \subseteq U_q$，利用正规性（定理 32.1）插入 $U_r$ 使 $\overline{U}_p \subseteq U_r \subseteq \overline{U}_r \subseteq U_q$。

**第三步：定义函数。** 对每个 $x \in X$，定义
$$f(x) = \inf\{p \in P \mid x \in U_p\}$$
其中约定 $\inf \varnothing = 1$（即当 $x \notin U_1$ 时 $f(x)=1$，即 $x \in B$）。
- $x \in A$ 时，对任意 $p \geqslant 0$，$x \in A \subseteq U_0 \subseteq U_p$（若 $p > 0$ 则 $U_0 \subseteq U_p$），故 $f(x) = 0$。
- $x \in B = X \setminus U_1$ 时，$x$ 不属于任何 $U_p$（$p \leqslant 1$），故 $f(x) = 1$。

**第四步：连续性。** 需证对任意 $(a,b) \subseteq \mathbb{R}$，$f^{-1}((a,b))$ 是开集。只需验证形如 $f^{-1}((-\infty, b))$ 和 $f^{-1}((a, \infty))$ 的集合是开集：
- $f(x) < b \iff \exists p \in P,\ p < b$ 使 $x \in U_p \iff x \in \bigcup_{p < b} U_p$，故 $f^{-1}((-\infty, b)) = \bigcup_{p < b} U_p$ 是开集。
- $f(x) > a \iff \exists p \in P,\ p > a$ 使 $x \notin \overline{U}_p \iff x \in \bigcup_{p > a} (X \setminus \overline{U}_p)$，故 $f^{-1}((a, \infty)) = \bigcup_{p > a} (X \setminus \overline{U}_p)$ 是开集。

因此 $f$ 连续，且 $f(A)=\{0\}$，$f(B)=\{1\}$。$\square$

>[!tip] Urysohn 函数的构造技巧：利用可数稠密有序集的"插入"性质，结合正规性在开集族中逐次插入新的开集。这是二进有理数在拓扑构造中的经典应用。

## 33.3 推论

> [!note] **推论 33.2（完全正则性）**
> 每个正规空间是完全正则的（T₃½）。

**证明**：对正规空间 $X$，闭集 $B$ 和 $x \notin B$。因 $X$ 是 T₁，$\{x\}$ 是闭集。$\{x\}$ 与 $B$ 不交，由 Urysohn 引理存在连续函数 $f: X \to [0,1]$ 使 $f(x)=0$，$f(B)=1$。这正是完全正则性的定义。$\square$

> [!note] **推论 33.3（强弱分离性的统一）**
> 在正规空间中，"开集分离"与"连续函数分离"等价。Urysohn 引理给出了 $\Rightarrow$ 方向，反之若任意不交闭集可被连续函数分离，则它们也可被开集 $f^{-1}([0,1/2))$ 和 $f^{-1}((1/2,1])$ 分离。

>[!example] **例 33.1（Urysohn 函数的应用）**
> - 证明 $\mathbb{R}^n$ 中不相交闭集可被光滑函数分离（用卷积磨光 Urysohn 函数）。
> - 正规空间上"连续函数丰富"——Urysohn 引理保证了连续函数的存在性，是分析学中"截断函数"的拓扑基础。

## 33.4 习题解析

> [!question] **习题 33.1**
> 证明 Urysohn 引理的逆：若对 $X$ 中任意不交闭集 $A,B$ 存在连续函数 $f: X \to [0,1]$ 使 $f(A)=0$, $f(B)=1$，则 $X$ 正规（且 T₁）。

**证明**：设 $A,B$ 不交闭。取 $f$ 如假设。令 $U = f^{-1}([0, 1/3))$，$V = f^{-1}((2/3, 1])$。则 $U,V$ 是不交开集分别包含 $A,B$。$\square$

> [!question] **习题 33.2**
> 证明 Urysohn 引理中的函数可取为满足 $f(A)=\{0\}$ 且 $f(B)=\{a\}$ 的任意 $a>0$。

**证明**：取 Urysohn 函数 $g: X \to [0,1]$ 分离 $A,B$，令 $f = a \cdot g$。$\square$

> [!question] **习题 33.3**
> 设 $X$ 正规。证明存在连续函数 $f: X \to [0,1]$ 使 $f^{-1}(0)$ 恰为给定的闭集 $A$ 当且仅当 $A$ 是 $G_\delta$ 集（可数个开集的交）。

**证明**：（⇒）$f^{-1}(0) = \bigcap_{n=1}^{\infty} f^{-1}([0, 1/n))$，每个 $f^{-1}([0, 1/n))$ 是开集。
（⇐）设 $A = \bigcap_{n=1}^{\infty} U_n$，$U_n$ 开。对每个 $n$，$A$ 与 $X \setminus U_n$ 是不交闭集，由 Urysohn 引理存在 $f_n: X \to [0,1]$ 使 $f_n(A)=0$，$f_n(X \setminus U_n)=1$。令 $f = \sum_{n=1}^{\infty} 2^{-n} f_n$，则 $f$ 连续且 $f^{-1}(0) = A$。$\square$

> [!question] **习题 33.4**
> 证明每个度量空间是完全正则的。

**证明**：设 $(X,d)$ 为度量空间，$B$ 闭，$x \notin B$。定义 $f(y) = \min(d(y, B), 1)$（或 $f(y) = d(y, B) / (d(y, B) + d(y, x))$）。$f$ 连续且 $f(x)=0$，$f(B)=\{1\}$。另一构造：$f(y) = \frac{d(y, x)}{d(y, x) + d(y, B)}$。$\square$

> [!question] **习题 33.5**
> 构造一个完全正则但不是正规的空间。

**解**：Sorgenfrey 平面 $\mathbb{R}_\ell^2$ 是完全正则的（因 $\mathbb{R}_\ell$ 完全正则且乘积保持完全正则性），但由 Jones' Lemma（习题 32.7），$\mathbb{R}_\ell^2$ 不是正规的。$\square$

> [!question] **习题 33.6**
> 设 $X$ 是正规空间，$A$ 是闭 $G_\delta$ 集。证明存在连续函数 $f: X \to [0,1]$ 使 $f(x)=0$ 当且仅当 $x \in A$。

**证明**：由习题 33.3 直接得到。$\square$

> [!question] **习题 33.7**
> 证明 Urysohn 引理可加强为：存在连续函数 $f$ 使 $f(A)=\{0\}$，$f(B)=\{1\}$，且 $0 < f(x) < 1$ 对 $x \notin A \cup B$。

**证明**：Urysohn 引理的构造已保证此性质。若 $x \notin A \cup B$，则 $x \notin A$ 蕴含 $x \notin U_0$（若 $U_0$ 选得足够小）或至少存在 $p>0$ 使 $x \notin U_p$，且 $x \notin B$ 蕴含 $x \in U_1$，故 $f(x) \in (0,1)$。$\square$

> [!question] **习题 33.8**
> 证明 Tychonoff 旋轮板 (Tychonoff corkscrew) 是正则但非完全正则的经典反例。

**证明**（概述）：Tychonoff 旋轮板的构造涉及在 $\mathbb{R}$ 上附加"旋轮"拓扑，验证其为正则但不存在分离某些闭集和点的连续函数。详见 Steen & Seebach, *Counterexamples in Topology*。$\square$

## 相关链接

- 上一节：[[32_Normal_Spaces|§32 Normal Spaces]]
- 下一节：[[34_The_Urysohn_Metrization_Theorem|§34 The Urysohn Metrization Theorem]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]