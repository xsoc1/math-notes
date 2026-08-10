---
title: "§24 实直线的连通子集"
date: 2026-07-08
tags:
  - topology/munkres/chapter3
  - topology/connectedness
  - topology/real-line
aliases:
  - "Connected Subspaces of the Real Line"
  - "24_Connected_Subspaces_of_R"
---

# §24 Connected Subspaces of the Real Line

> [!abstract] 核心问题
> $\mathbb{R}$ 中哪些子集是连通的？答案极其简洁：恰是区间。由此得到微积分中的介值定理。

## 24.1 区间与线性连续统

> [!note] **定义 24.1（区间）**
> 全序集 $L$ 的子集 $Y$ 称为 **凸的 (convex)**（或区间），若对任意 $a < b \in Y$，整个 $[a,b] \subseteq Y$。

> [!note] **定义 24.2（线性连续统）**
> 多于一个元素的全序集 $L$ 称为 **线性连续统 (linear continuum)**，若：
> 1. $L$ 有最小上界性质；
> 2. 对任意 $x < y \in L$，存在 $z$ 使得 $x < z < y$。

>[!important] $\mathbb{R}$ 是线性连续统，$\mathbb{R}^2$ 在字典序下也是线性连续统。

## 24.2 主要定理

> [!note] **定理 24.1（线性连续统的连通子集）** ^thm-24-1
> 若 $L$ 是线性连续统（赋予序拓扑），则 $L$ 连通，且 $L$ 的每个区间（凸子集）连通。反之，$L$ 的连通子集必为区间。

**证明**（$L$ 自身连通）：
假设 $L = A \cup B$ 是一个分离，$A, B$ 是非空不交开集。取 $a \in A$，$b \in B$，不妨设 $a < b$。令
$$A_0 = A \cap [a, b],\quad c = \sup A_0$$
则 $c \in [a, b]$。

- 若 $c \in A$：由于 $A$ 是开集，存在区间 $(c-\varepsilon, c+\varepsilon) \subseteq A$，这与 $c = \sup A_0$ 矛盾（$c+\varepsilon/2$ 仍在 $A_0$ 中）。
- 若 $c \in B$：由于 $B$ 是开集，存在区间 $(c-\varepsilon, c+\varepsilon) \subseteq B$。由确界定义，$A_0$ 中有元在 $(c-\varepsilon, c]$ 中，与 $B \cap A_0 = \varnothing$ 矛盾。

故 $L$ 连通。区间的连通性类似证明（$L$ 的区间在子空间拓扑下是另一个线性连续统）。

**反之**：若 $Y \subseteq L$ 连通但不是区间，则存在 $a < c < b$ 满足 $a,b \in Y$ 但 $c \notin Y$。则 $Y = (Y \cap (-\infty, c)) \cup (Y \cap (c, +\infty))$ 给出 $Y$ 的一个分离，矛盾。$\square$

>[!important] **推论**：$\mathbb{R}$ 的连通子集 = $\varnothing$、单点集、所有类型的区间：$(a,b), [a,b], (a,b], [a,b), (a,+\infty), [a,+\infty), (-\infty,b), (-\infty,b], \mathbb{R}$。

> [!note] **定理 24.3（介值定理 / Intermediate Value Theorem）** ^thm-24-3
> 设 $f: X \to \mathbb{R}$ 连续，$X$ 连通。若 $a, b \in X$ 且 $r \in \mathbb{R}$ 满足 $f(a) < r < f(b)$，则存在 $c \in X$ 使得 $f(c) = r$。

**证明**：$f(X)$ 是 $\mathbb{R}$ 中连通子集（定理 23.5），故为区间（定理 24.1）。$f(a), f(b) \in f(X)$，故 $[f(a), f(b)] \subseteq f(X)$，从而 $r \in f(X)$。$\square$

## 24.3 道路连通性

> [!note] **定义 24.3（道路 / Path）**
> 空间 $X$ 中的一条**道路 (path)** 是连续映射 $f: [0,1] \to X$。点 $f(0)$ 和 $f(1)$ 分别称为道路的起点和终点。

> [!note] **定义 24.4（道路连通）**
> $X$ 称为 **道路连通的 (path-connected)**，若对任意 $x, y \in X$，存在从 $x$ 到 $y$ 的道路。

> [!note] **定理 24.4**
> 道路连通 $\implies$ 连通。

**证明**：假设 $X$ 不连通，存在连续满射 $g: X \to \{0,1\}$。取 $x \in g^{-1}(\{0\}), y \in g^{-1}(\{1\})$。因 $X$ 道路连通，存在道路 $f: [0,1] \to X$ 连接 $x,y$。则 $g \circ f: [0,1] \to \{0,1\}$ 连续，且 $(g \circ f)(0)=0, (g \circ f)(1)=1$。但 $[0,1]$ 连通，矛盾。$\square$

>[!warning] 连通 $\not\Rightarrow$ 道路连通！经典反例：拓扑学家的正弦曲线（见习题 24.4）。

## 24.4 习题解析

> [!question] **习题 24.1**
> 证明 $\mathbb{R}$ 的下限拓扑 $\mathbb{R}_\ell$（基为 $[a,b)$）是不连通的。

**证明**：$(-\infty, 0)$ 和 $[0, +\infty)$ 都是 $\mathbb{R}_\ell$ 中的开集（$[0,+\infty) = \bigcup_{n}[0, n)$），二者不交且覆盖 $\mathbb{R}$，给出 $\mathbb{R}_\ell$ 的一个分离。$\square$

> [!question] **习题 24.2**
> 设 $f: S^1 \to \mathbb{R}$ 连续。证明存在 $x \in S^1$ 使得 $f(x) = f(-x)$。

**证明**：定义 $g: S^1 \to \mathbb{R}$ 为 $g(x) = f(x) - f(-x)$。则 $g(-x) = f(-x) - f(x) = -g(x)$。若 $g$ 恒为零则已证。否则存在 $x_0$ 使 $g(x_0) > 0$，则 $g(-x_0) < 0$。由于 $S^1$ 连通，$g(S^1)$ 是连通集（区间），包含正数和负数，故必包含 $0$。存在 $x$ 使 $g(x)=0$，即 $f(x)=f(-x)$。$\square$

> [!question] **习题 24.3（不动点定理的特例）**
> 设 $f: [0,1] \to [0,1]$ 连续。证明存在 $c \in [0,1]$ 使得 $f(c) = c$。

**证明**：定义 $g(x) = f(x) - x$。$g(0) = f(0) \geqslant 0$，$g(1) = f(1) - 1 \leqslant 0$。若 $g(0) = 0$ 或 $g(1) = 0$，已得不动点。否则 $g(0) > 0 > g(1)$，由介值定理，存在 $c \in (0,1)$ 使 $g(c)=0$，即 $f(c)=c$。$\square$

> [!question] **习题 24.4（拓扑学家的正弦曲线）**
> 设 $S = \{(x, \sin(1/x)) \mid 0 < x \leqslant 1\} \subseteq \mathbb{R}^2$。证明 $\overline{S} = S \cup (\{0\} \times [-1,1])$ 连通但不道路连通。

**证明**：$S$ 是 $(0,1]$ 在连续映射 $x \mapsto (x, \sin(1/x))$ 下的像，故 $S$ 连通。由引理 23.3，$\overline{S}$ 连通。

不道路连通：假设存在从 $(0,0)$ 到 $(\frac{1}{\pi}, 0)$ 的道路 $\gamma(t)=(\gamma_1(t), \gamma_2(t))$。由 $\gamma_1$ 的连续性，可取序列 $t_n \to 0^+$ 使 $\gamma_1(t_n) = \frac{1}{(2n+1/2)\pi}$（$\sin = 1$），则 $\gamma_2(t_n) \to 1 \neq 0 = \gamma_2(0)$，与 $\gamma_2$ 连续性矛盾。$\square$

> [!question] **习题 24.6**
> 证明线性连续统在序拓扑下是局部连通的（见 [[25_Components_and_Local_Connectedness|§25]]）。

**证明**：线性连续统的基由开区间构成，而开区间连通（定理 24.1），故每个点有一组连通的基邻域，从而空间局部连通。$\square$

> [!question] **习题 24.8**
> 设 $X$ 是全序集，赋予序拓扑。若 $X$ 连通，则 $X$ 是线性连续统。

**证明**：
1. 稠密性：假若存在 $a<b$ 之间无其他元。则 $(-\infty, b)$ 和 $(a, +\infty)$ 覆盖 $X$ 且不交（因 $a,b$ 之间无元），矛盾。
2. 最小上界性质：设 $A \subseteq X$ 非空有上界但无最小上界。考虑 $U = \{x \mid x \leqslant a \text{ 对某 } a \in A\}$ 和 $V = \{x \mid x > a \text{ 对所有 } a \in A\}$，这是 $X$ 的一个分离，矛盾。$\square$

> [!question] **习题 24.9**
> 证明 $\mathbb{R}^2$ 中删除可数个点后仍是道路连通的（从而连通）。

**证明**：设 $D \subseteq \mathbb{R}^2$ 可数。对任意 $x,y \notin D$，需构造从 $x$ 到 $y$ 的道路避开 $D$。取不共线的第三点 $z \notin D$（因 $\mathbb{R}^2$ 不可数，可避免 $D$）。由 $x$ 到 $z$、$z$ 到 $y$ 的线段只有可数个可能经过 $D$ 中的点。对于每条线段，可以在 $z$ 附近略微绕开。由于 $D$ 可数而绕行方向有不可数种，总可找到连接 $x$ 和 $y$ 的道路。$\square$

## 相关链接

- 上一节：[[23_Connected_Spaces|§23 Connected Spaces]]
- 下一节：[[25_Components_and_Local_Connectedness|§25 Components and Local Connectedness]]
- 返回总览：[[00_Chapter_03_Overview|Chapter 3 Overview]]
