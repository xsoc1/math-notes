---
title: "§15 积拓扑（有限积）"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/product-topology
aliases:
  - "The Product Topology on X×Y"
  - "15_The_Product_Topology_on_XxY"
---

# §15 两个空间的积拓扑 (The Product Topology on $X \times Y$)

> [!abstract] 核心问题
> 给定两个拓扑空间 $X$ 和 $Y$，如何在笛卡尔积 $X \times Y$ 上自然地定义一个拓扑（即**积拓扑**），使其与 $X, Y$ 原有的拓扑结构紧密相容，并使得坐标投射映射 $\pi_1, \pi_2$ 成为具有良好泛性质的连续开映射？

## 15.1 积拓扑的定义与基 (Definition and Basis of Product Topology)

> [!note] **定义 15.1 (积拓扑 / Product Topology)** ^def-15-1
> 设 $X$ 和 $Y$ 是两个拓扑空间。在笛卡尔积集合 $X \times Y$ 上，由全体形如 $U \times V$（其中 $U$ 是 $X$ 中的开集，$V$ 是 $Y$ 中的开集）的子集构成的集族：
> $$
> \mathcal{B} = \{ U \times V \mid U \in \mathcal{T}_X, \, V \in \mathcal{T}_Y \}
> $$
> 所生成的拓扑，称为 $X \times Y$ 上的**积拓扑 (Product Topology)**。赋予了积拓扑的空间 $X \times Y$ 称为**积空间 (Product Space)**。

我们需要验证上述集族 $\mathcal{B}$ 确实满足拓扑基的两条公理：
1. **覆盖性**：因为 $X \in \mathcal{T}_X$ 且 $Y \in \mathcal{T}_Y$，整个空间 $X \times Y \in \mathcal{B}$ 本身就是一个基元素，故显然覆盖 $X \times Y$ 中的每一个点。
2. **交集性**：对任意两个基元素 $U_1 \times V_1, U_2 \times V_2 \in \mathcal{B}$，由集合运算恒等式有：
   $$
   (U_1 \times V_1) \cap (U_2 \times V_2) = (U_1 \cap U_2) \times (V_1 \cap V_2)
   $$
   由于 $U_1 \cap U_2 \in \mathcal{T}_X$ 且 $V_1 \cap V_2 \in \mathcal{T}_Y$，两个基元素的交集本身依然属于 $\mathcal{B}$。因此 $\mathcal{B}$ 构成 $X \times Y$ 上的一组拓扑基。

> [!warning] **易错警示：$X \times Y$ 中的开集未必都具有“开集 $\times$ 开集”的矩形形式**
> 形如 $U \times V$（$U$ 在 $X$ 中开，$V$ 在 $Y$ 中开）的集合仅仅是积拓扑的**基元素（开矩形）**，而非积拓扑中的全部开集。例如，在欧氏平面 $\mathbb{R} \times \mathbb{R} = \mathbb{R}^2$ 中，开单位圆盘 $B = \{(x,y) \mid x^2 + y^2 < 1\}$ 是积拓扑下的开集（它可以表示为无穷多个开矩形的并），但它本身绝不能写成两个一维子集笛卡尔积 $U \times V$ 的形式。

### 由因子空间的拓扑基生成积空间的拓扑基

在实际应用中，$X$ 和 $Y$ 的拓扑通常已经由各自的拓扑基 $\mathcal{B}_X$ 和 $\mathcal{B}_Y$ 给出。下面的定理表明，只需将两者的基元素两两作笛卡尔积，即可直接得到积空间的拓扑基。

> [!note] **定理 15.1 (因子空间的基决定积空间的基)** ^theorem-15-1
> 若 $\mathcal{B}$ 是拓扑空间 $X$ 的拓扑基，$\mathcal{C}$ 是拓扑空间 $Y$ 的拓扑基，则集族
> $$
> \mathcal{D} = \{ B \times C \mid B \in \mathcal{B}, \, C \in \mathcal{C} \}
> $$
> 是 $X \times Y$ 上积拓扑的一组拓扑基。

**证明**：利用基的判别准则（Munkres 引理 13.2）。任取积拓扑下的开集 $W \subset X \times Y$ 及点 $x \times y \in W$。根据积拓扑的定义，存在开矩形基元素 $U \times V$（其中 $U \in \mathcal{T}_X, V \in \mathcal{T}_Y$），使得：
$$
x \times y \in U \times V \subset W
$$
这意味 $x \in U$ 且 $y \in V$。因为 $\mathcal{B}$ 和 $\mathcal{C}$ 分别是 $X$ 和 $Y$ 的拓扑基，存在基元素 $B \in \mathcal{B}$ 和 $C \in \mathcal{C}$，使得 $x \in B \subset U$ 且 $y \in C \subset V$。于是：
$$
x \times y \in B \times C \subset U \times V \subset W
$$
其中 $B \times C \in \mathcal{D}$。同时每个 $B \times C$ 显然是积拓扑中的开集。由引理 13.2 即知 $\mathcal{D}$ 是 $X \times Y$ 积拓扑的一组基。 $\square$

> [!example] **例 15.1 ($\mathbb{R}^2$ 上的标准拓扑与积拓扑一致)**
> 在实直线 $\mathbb{R}$ 上，全体开区间 $\mathcal{B} = \{(a,b) \mid a < b\}$ 构成标准拓扑的基。由定理 15.1，平面 $\mathbb{R} \times \mathbb{R}$ 上由全体开矩形 $(a,b) \times (c,d)$ 构成的集族生成了 $\mathbb{R} \times \mathbb{R}$ 的积拓扑，这与欧氏平面 $\mathbb{R}^2$ 的标准度量拓扑完全一致。

## 15.2 投射映射与子基刻画 (Projections and Subbasis)

> [!note] **定义 15.2 (坐标投射映射 / Projections)** ^def-15-2
> 设 $\pi_1: X \times Y \to X$ 和 $\pi_2: X \times Y \to Y$ 分别定义为：
> $$
> \pi_1(x, y) = x, \qquad \pi_2(x, y) = y
> $$
> 映射 $\pi_1$ 和 $\pi_2$ 分别称为 $X \times Y$ 到第一因子空间和第二因子空间上的**投射映射（Projections）**。

显然，$\pi_1$ 和 $\pi_2$ 都是满射（只要 $X, Y$ 非空）。对于任意开集 $U \subset X$ 和 $V \subset Y$，其原像分别为柱状集：
$$
\pi_1^{-1}(U) = U \times Y, \qquad \pi_2^{-1}(V) = X \times V
$$
由于 $X$ 和 $Y$ 在各自空间中是开集，$U \times Y$ 和 $X \times V$ 都是积拓扑中的开集，因此 **$\pi_1$ 和 $\pi_2$ 在积拓扑下是连续映射**。而且，对任意基元素 $U \times V$，由于 $\pi_1(U \times V) = U$（当 $V \neq \varnothing$）且任意开集是基元素的并（投射保持任意并），可知 **$\pi_1$ 和 $\pi_2$ 还是开映射（Open Maps）**（注意：投射映射一般**不是闭映射**，例如双曲线 $\{(x,y)\in\mathbb{R}^2 \mid xy = 1\}$ 在 $\mathbb{R}^2$ 中是闭集，但它在第一坐标轴上的投影 $\pi_1(\{xy=1\}) = \mathbb{R}\setminus\{0\}$ 不是闭集）。

进一步，注意到任意开矩形基元素均可表示为两个柱状原像的交集：
$$
U \times V = (U \times Y) \cap (X \times V) = \pi_1^{-1}(U) \cap \pi_2^{-1}(V)
$$
由此立即可得积拓扑的子基刻画定理：

> [!note] **定理 15.2 (积拓扑的子基刻画)** ^theorem-15-2
> 集族
> $$
> \mathcal{S} = \{ \pi_1^{-1}(U) \mid U \text{ 在 } X \text{ 中开} \} \cup \{ \pi_2^{-1}(V) \mid V \text{ 在 } Y \text{ 中开} \}
> $$
> 构成 $X \times Y$ 上积拓扑的一组**子基 (Subbasis)**。

**证明**：设 $\mathcal{T}$ 为 $X \times Y$ 上的积拓扑，$\mathcal{T}'$ 为由子基 $\mathcal{S}$ 生成的拓扑。因为 $\mathcal{S}$ 中的每个元素 $U \times Y$ 或 $X \times V$ 均属于 $\mathcal{T}$，故由 $\mathcal{S}$ 的有限交之并构成的 $\mathcal{T}'$ 必满足 $\mathcal{T}' \subset \mathcal{T}$。反之，积拓扑 $\mathcal{T}$ 的任意基元素 $U \times V = \pi_1^{-1}(U) \cap \pi_2^{-1}(V)$ 恰好是 $\mathcal{S}$ 中两个元素的有限交，因而属于 $\mathcal{S}$ 生成的拓扑基，故 $\mathcal{T} \subset \mathcal{T}'$。因此 $\mathcal{T} = \mathcal{T}'$。 $\square$

> [!tip] **数学思想：使投射映射连续的“最粗拓扑”与无穷乘积的伏笔**
> 定理 15.2 揭示了积拓扑的本质特征：**积拓扑是 $X \times Y$ 上使得两个坐标投射 $\pi_1, \pi_2$ 同时连续的最粗（最小）拓扑**。当后续章节（§19）将有限乘积推广到无穷乘积 $\prod_{\alpha \in J} X_\alpha$ 时，用“全体开集之笛卡尔积 $\prod U_\alpha$”定义的是箱拓扑（Box Topology），而沿着定理 15.2“以全体坐标投射原像 $\pi_\beta^{-1}(U_\beta)$ 作为子基”所定义的才是真正保持紧致性（Tychonoff 定理）与连通性的**Tychonoff 积拓扑**。

## 15.3 重点习题解析 (Selected Exercises)

> [!question] **习题 15.3 (积空间中的内部、闭包与边界运算)**
> 设 $A \subset X$，$B \subset Y$。证明在积空间 $X \times Y$ 中恒有：
> 1. $\overline{A \times B} = \overline{A} \times \overline{B}$；
> 2. $\operatorname{Int}(A \times B) = \operatorname{Int}(A) \times \operatorname{Int}(B)$。

**证明**：
1. **闭包的乘积公式**：
   - 先证 $\overline{A \times B} \subset \overline{A} \times \overline{B}$：设 $(x, y) \in \overline{A \times B}$。任取 $x$ 在 $X$ 中的开邻域 $U$ 以及 $y$ 在 $Y$ 中的开邻域 $V$，则 $U \times V$ 是 $(x, y)$ 在 $X \times Y$ 中的开邻域。因为 $(x, y) \in \overline{A \times B}$，必有 $(U \times V) \cap (A \times B) \neq \varnothing$。由 $(U \times V) \cap (A \times B) = (U \cap A) \times (V \cap B)$ 非空可知，$U \cap A \neq \varnothing$ 且 $V \cap B \neq \varnothing$。由 $U, V$ 的任意性得 $x \in \overline{A}$ 且 $y \in \overline{B}$，故 $(x, y) \in \overline{A} \times \overline{B}$。
   - 再证 $\overline{A} \times \overline{B} \subset \overline{A \times B}$：设 $(x, y) \in \overline{A} \times \overline{B}$，即 $x \in \overline{A}$ 且 $y \in \overline{B}$。任取 $(x, y)$ 在积拓扑下的基本开邻域 $U \times V$（其中 $U$ 是 $x$ 的开邻域，$V$ 是 $y$ 的开邻域）。由闭包判据知 $U \cap A \neq \varnothing$ 且 $V \cap B \neq \varnothing$，从而 $(U \times V) \cap (A \times B) = (U \cap A) \times (V \cap B) \neq \varnothing$。因此 $(x, y) \in \overline{A \times B}$。
2. **内部的乘积公式**：
   - 因为 $\operatorname{Int}(A)$ 在 $X$ 中开，$\operatorname{Int}(B)$ 在 $Y$ 中开，故 $\operatorname{Int}(A) \times \operatorname{Int}(B)$ 是包含于 $A \times B$ 的开集，由内部的最大性得 $\operatorname{Int}(A) \times \operatorname{Int}(B) \subset \operatorname{Int}(A \times B)$。
   - 反之，对任意 $(x, y) \in \operatorname{Int}(A \times B)$，存在基本开邻域 $U \times V$ 使得 $(x, y) \in U \times V \subset A \times B$，从而 $x \in U \subset A$ 且 $y \in V \subset B$，即 $x \in \operatorname{Int}(A)$ 且 $y \in \operatorname{Int}(B)$，故 $\operatorname{Int}(A \times B) \subset \operatorname{Int}(A) \times \operatorname{Int}(B)$。 $\square$

## 相关链接

- [[00_跨主题阅读索引|跨主题阅读索引]]
