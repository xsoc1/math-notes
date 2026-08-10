---
title: "§36 流形的嵌入"
date: 2026-07-28
tags: ["topology/munkres/chapter4", "topology/manifolds"]
aliases: ["Imbeddings of Manifolds", "36_Imbeddings_of_Manifolds"]
---

# §36 Imbeddings of Manifolds

> [!abstract] 核心问题
> 紧流形能否作为某个 $\mathbb{R}^N$ 的子空间（即嵌入到 Euclid 空间）？本节利用前几节建立的全部工具（Urysohn 引理、单位分解、紧性）给出肯定回答。

## 36.1 流形的定义

> [!note] **定义 36.1（m-维流形 / m-Manifold）**
> 空间 $X$ 称为 **m-维流形 (m-manifold)**，若 $X$ 是 Hausdorff 的、第二可数的，且每点 $x \in X$ 有一个邻域同胚于 $\mathbb{R}^m$（或同胚于 $\mathbb{R}^m$ 中的开集）。

>[!important] Munkres 对流形附带了第二可数条件（保证仿紧性和可度量化）。有些教材仅要求 Hausdorff + 局部 Euclid。

> [!example] **例 36.1**
> - $\mathbb{R}^m$ 本身是 $m$-流形。
> - $m$-球面 $S^m = \{x \in \mathbb{R}^{m+1} \mid \|x\| = 1\}$ 是紧 $m$-流形。
> - $m$-环面 $T^m = S^1 \times \cdots \times S^1$ 是紧 $m$-流形。
> - 实射影空间 $\mathbb{R}P^m$ 是紧 $m$-流形。
> - 任何非空开子集构成的流形称为**开流形**（如 $\mathbb{R}^m \setminus \{0\}$）。

## 36.2 单位分解 (Partition of Unity)

> [!note] **定理 36.1（有限单位分解的存在性）** ^theorem-36-1
> 设 $\{U_1, \ldots, U_n\}$ 是正规空间 $X$ 的有限开覆盖。则存在连续函数 $\phi_i: X \to [0,1]$（$i = 1, \ldots, n$）满足：
> 1. $\operatorname{supp}(\phi_i) \subseteq U_i$（支集包含于 $U_i$）；
> 2. $\sum_{i=1}^n \phi_i(x) = 1$ 对所有 $x \in X$。

**证明**（归纳法）：
- **$n=2$**：$X = U_1 \cup U_2$。$X \setminus U_2$ 和 $X \setminus U_1$ 是不交闭集（分别包含于 $U_1$ 和 $U_2$）。由 Urysohn 引理存在连续函数 $\psi: X \to [0,1]$ 使 $\psi(X \setminus U_2) = 0$，$\psi(X \setminus U_1) = 1$。令 $\phi_1 = 1-\psi$，$\phi_2 = \psi$，则 $\phi_1+\phi_2=1$，且 $\operatorname{supp}(\phi_1) \subseteq U_1$，$\operatorname{supp}(\phi_2) \subseteq U_2$。
- **归纳步**：假设对 $n-1$ 个开集成立。对 $\{U_1, \ldots, U_n\}$，令 $U = U_1 \cup \cdots \cup U_{n-1}$。对 $\{U, U_n\}$ 应用 $n=2$ 情形得 $\alpha, \alpha_n$。将 $\alpha$ 限制到 $U$ 的每个 $U_i$（$i < n$）再由归纳假设调整……（细节见 Munkres）。$\square$

## 36.3 紧流形的嵌入

> [!note] **定理 36.2（紧流形可嵌入 $\mathbb{R}^N$）** ^theorem-36-2
> 每个紧 $m$-流形可嵌入到 $\mathbb{R}^N$（对某个 $N$）。

**证明**：
**第一步：有限坐标卡覆盖。** 由紧性，存在有限个坐标卡 $h_i: U_i \to \mathbb{R}^m$（$i=1,\ldots,k$），其中 $\{U_i\}$ 覆盖 $X$，$\overline{U}_i$ 紧。

**第二步：截断函数。** 对每个 $i$，取开集 $V_i$ 使 $\overline{V}_i \subseteq U_i$ 且 $\{V_i\}$ 仍覆盖 $X$（由正规性和紧性）。由 Urysohn 引理，存在连续函数 $\lambda_i: X \to [0,1]$ 使 $\lambda_i(\overline{V}_i) = 1$，$\lambda_i(X \setminus U_i) = 0$。

**第三步：构造嵌入。** 定义 $F: X \to \mathbb{R}^{k(m+1)}$：
$$F(x) = (\lambda_1(x), \lambda_1(x) \cdot h_1(x), \ldots, \lambda_k(x), \lambda_k(x) \cdot h_k(x))$$
其中 $\lambda_i(x) \cdot h_i(x)$ 理解为：在 $U_i$ 外取值 $0$（因 $\lambda_i=0$）。

**单射性**：若 $F(x)=F(y)$，则对每个 $i$，$\lambda_i(x)=\lambda_i(y)$。取 $i$ 使 $x \in V_i$，则 $\lambda_i(x)=1$，故 $\lambda_i(y)=1$ 且 $h_i(x)=h_i(y)$。因 $h_i$ 是同胚（单射），$x=y$。

**连续性**：每个分量连续（$\lambda_i$ 连续，$h_i$ 在 $U_i$ 上连续且乘 $\lambda_i$ 后连续地延拓到 $X$）。

**$F$ 是嵌入**：紧空间到 Hausdorff 空间的连续单射是嵌入（定理 26.6）。$\square$

>[!important] 实际上，Whitney 嵌入定理给出了更紧的界：每个 $m$-流形可嵌入到 $\mathbb{R}^{2m}$（甚至 $\mathbb{R}^{2m-1}$）。Munkres 的初等证明对 $N$ 不做优化，但已足够深刻。

## 36.4 习题解析

> [!question] **习题 36.1**
> 证明每个流形是局部紧的。

**证明**：每点有邻域同胚于 $\mathbb{R}^m$，而 $\mathbb{R}^m$ 是局部紧的。同胚保持局部紧性。$\square$

> [!question] **习题 36.2**
> 证明每个流形是正则的（从而完全正则、正规）。

**证明**：流形局部紧 Hausdorff $\Rightarrow$ 正则（习题 32.3）。第二可数 + 正则 $\Rightarrow$ 正规（定理 32.6）。$\square$

> [!question] **习题 36.3**
> 证明每个紧流形可度量化。

**证明**：紧流形是第二可数（由定义）+ Hausdorff $\Rightarrow$ 正规 $\Rightarrow$ 正则。第二可数 + 正则 $\Rightarrow$ 可度量化（Urysohn 度量化定理）。$\square$

> [!question] **习题 36.4**
> 证明紧流形的有限积仍是紧流形。

**证明**：两个 $m_1$-流形和 $m_2$-流形的积是 $(m_1+m_2)$-流形：每点取坐标卡之积。紧性由 Tychonoff 定理，第二可数性由可数积保持。$\square$

> [!question] **习题 36.5**
> 证明 $S^1$ 不是单点集，但 $S^1$ 可嵌入 $\mathbb{R}^2$。推广至 $S^n$ 嵌入 $\mathbb{R}^{n+1}$。

**证明**：$S^n$ 作为 $\mathbb{R}^{n+1}$ 的子空间天然嵌入。这是流形嵌入的最简单情形——球面不需"扭曲"就已经是 Euclid 空间的子集。$\square$

> [!question] **习题 36.6**
> 证明流形是道路连通的当且仅当它是连通的。

**证明**：流形是局部道路连通的（每点有同胚于 $\mathbb{R}^m$ 的邻域），连通 + 局部道路连通 $\iff$ 道路连通（定理 25.5）。$\square$

## 相关链接

- 上一节：[[35_The_Tietze_Extension_Theorem|§35 The Tietze Extension Theorem]]
- 下一章：[[../Chapter 05 - The Tychonoff Theorem/37_The_Tychonoff_Theorem|§37 The Tychonoff Theorem]]
- 返回总览：[[00_Chapter_04_Overview|Chapter 4 Overview]]