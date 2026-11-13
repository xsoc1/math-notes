---
title: "Baire 纲定理"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-baire-theorems
  - theory-note
note_type: theory
source_section: "F/10 的纲定理部分；汪林 1.12"
exercise_range: "2.3 节"
status: "已补证"
---

# Baire 纲定理

在拓扑学与泛函分析中，“第一纲集（贫集）”从拓扑角度刻画了由可数多个“处处稀疏、不含任何闭内点”的集合叠加而成的薄集。**Baire 纲定理**揭示了完备度量空间一条极为深刻的拓扑丰满性：**任何非空完备度量空间（及其任意非空开子集）都绝不可能被可数多个无处稠密集所填满。**

## 1. 无处稠密集、第一纲集与第二纲集

在度量空间 $(X,d)$ 中，子集 $A\subseteq X$ 的“纲（Category）”始终是相对于环境空间 $X$ 的拓扑而言的。

> [!note] 定义 1.1 无处稠密集、第一纲集与第二纲集
> 设 $(X,d)$ 是度量空间，$A\subseteq X$。
> - **无处稠密集（Nowhere Dense Set，又称疏集）：** $A$ 的闭包在 $X$ 中的内部为空集，即
>   $$
>   \operatorname{Int}_X(\overline A)=\varnothing.
>   $$
>   等价地，对 $X$ 中的任意非空开集 $U$，都存在非空开子集 $V\subseteq U$ 使得 $V\cap A=\varnothing$（即 $\overline A$ 不包含任何非空开球，或补集 $X\setminus\overline A$ 在 $X$ 中是稠密开集）。
> - **第一纲集（Set of First Category，又称贫集 / Meager Set）：** 可以表示为**可数多个**无处稠密集之并的集合，即 $E=\bigcup_{n=1}^\infty A_n$，其中每个 $A_n$ 在 $X$ 中无处稠密。
> - **第二纲集（Set of Second Category）：** 在 $X$ 中不是第一纲集的集合。

*概念辨析：*
1. **对闭集而言，“无处稠密”恰等价于“无内点”：** 若 $F=\overline F$ 是闭集，则 $\operatorname{Int}_X(\overline F)=\operatorname{Int}_X(F)=\varnothing$，故闭集无处稠密当且仅当它不含任何内点。
2. **对一般非闭集而言，“无内点”绝不等同于“无处稠密”：** 例如有理数集 $\mathbb Q$ 在实数空间 $\mathbb R$ 中虽然没有内点（$\operatorname{Int}_{\mathbb R}\mathbb Q=\varnothing$），但由于其闭包是整个实数轴 $\overline{\mathbb Q}=\mathbb R$，故 $\operatorname{Int}_{\mathbb R}(\overline{\mathbb Q})=\mathbb R\neq\varnothing$，因此 **$\mathbb Q$ 在 $\mathbb R$ 中不是无处稠密集**！与此同时，由于 $\mathbb Q=\bigcup_{k=1}^\infty\{q_k\}$ 是可数个单点闭集（每个单点闭集在 $\mathbb R$ 中无内点从而无处稠密）的并集，所以 **$\mathbb Q$ 在 $\mathbb R$ 中确实是第一纲集**。

## 2. 预备引理：Cantor 闭集套定理

为了证明 Baire 纲定理，首先建立完备度量空间中的闭集套（或闭球套）交集非空定理：

> [!note] 引理 2.1 Cantor 闭集套定理
> 设 $(X,d)$ 是**完备**度量空间，$\{F_n\}_{n=1}^\infty$ 是一列非空闭子集，满足递减嵌套关系
> $$
> F_1\supseteq F_2\supseteq \cdots \supseteq F_n\supseteq \cdots,
> $$
> 且集合直径趋于零：
> $$
> \lim_{n\to\infty}\operatorname{diam}(F_n)=\lim_{n\to\infty}\sup_{x,y\in F_n}d(x,y)=0.
> $$
> 则无穷交集 $\bigcap_{n=1}^\infty F_n$ 非空，且恰好只包含唯一的一个点 $x^*\in X$。

**证明：** 对每个 $n\in\mathbb N$，从非空集合 $F_n$ 中任取一点 $x_n\in F_n$。当 $m,n\geq N$ 时，由递减包含关系可知 $x_m,x_n\in F_N$，故两点间距离满足
$$
d(x_m,x_n)\leq\operatorname{diam}(F_N)\longrightarrow 0\quad(N\to\infty).
$$
这说明 $\{x_n\}$ 是 $X$ 中的 Cauchy 序列。由 $X$ 的**完备性**，存在极限点 $x^*=\lim_{n\to\infty}x_n\in X$。对每一个固定的阶数 $N\in\mathbb N$，由于子列 $\{x_n\}_{n=N}^\infty\subseteq F_N$ 且 $F_N$ 是**闭集**，故极限点 $x^*\in F_N$。从而 $x^*\in\bigcap_{n=1}^\infty F_n$，交集非空。最后，若 $x^*,y^*\in\bigcap_{n=1}^\infty F_n$，则对一切 $n$ 有 $d(x^*,y^*)\leq\operatorname{diam}(F_n)\to 0$，故 $x^*=y^*$。$\square$

*注：如 [[泛函分析/01_度量空间及其完备化/08_度量空间的反例与辨析#3. 完备空间中的套闭球定理必须要求半径趋于零|01 专题第 8 节（汪林 1.12）]] 所示，若去掉直径（或套闭球半径）趋于零的条件，即便环境空间完备，递减非空闭球列的交集仍可能为空集。*

## 3. Baire 纲定理的完整证明

> [!note] 定理 3.1 Baire 纲定理（稠密开集交与第一纲集形式）
> 设 $(X,d)$ 是非空**完备**度量空间。则下列两条等价陈述成立：
> 1. **稠密开集交形式：** 若 $\{G_n\}_{n=1}^\infty$ 是 $X$ 中的一列**稠密开集**，则它们的可数交集 $\bigcap_{n=1}^\infty G_n$ 在 $X$ 中仍然**稠密**。
> 2. **纲的形式：** $X$ 中的任何非空开集 $U$（特别地，全空间 $X$ 自身）都是**第二纲集**，即不可能表示为可数个无处稠密集的并集。

**证明：**
1. **先证第 1 条（套闭球构造法）：**
   要证交集 $\bigcap_{n=1}^\infty G_n$ 在 $X$ 中稠密，只需证明对 $X$ 中的任意非空开集 $U$，交集 $U\cap\bigcap_{n=1}^\infty G_n\neq\varnothing$。
   - **第 $1$ 步：** 由于 $G_1$ 在 $X$ 中稠密且 $U$ 非空开，交集 $U\cap G_1$ 是非空开集。任取一点 $x_1\in U\cap G_1$，由开集定义存在开球 $B(x_1,\rho_1)\subseteq U\cap G_1$。取正半径 $0<r_1<\min\{\rho_1/2,\ 2^{-1}\}$，则非空闭球
     $$
     C_1=\overline B(x_1,r_1)\subseteq B(x_1,\rho_1)\subseteq U\cap G_1,\qquad \operatorname{diam}(C_1)\leq 2r_1<1.
     $$
   - **归纳第 $n+1$ 步：** 假设已选出非空闭球 $C_n=\overline B(x_n,r_n)$。由于开球 $B(x_n,r_n)$ 非空开，而 $G_{n+1}$ 在 $X$ 中是稠密开集，故交集 $B(x_n,r_n)\cap G_{n+1}$ 是非空开集。从中任取一点 $x_{n+1}$ 及充分小的正半径 $0<r_{n+1}<2^{-(n+1)}$，使得闭球满足
     $$
     C_{n+1}=\overline B(x_{n+1},r_{n+1})\subseteq B(x_n,r_n)\cap G_{n+1}\subseteq C_n\cap G_{n+1}.
     $$
   如此归纳得到一列递减嵌套的非空闭集 $\{C_n\}_{n=1}^\infty$，由于 $r_n<2^{-n}$，其直径满足 $\operatorname{diam}(C_n)\leq 2r_n<2^{1-n}\to 0$。由 **Cantor 闭集套定理（引理 2.1）**，存在公共点
   $$
   x^*\in\bigcap_{n=1}^\infty C_n\subseteq U\cap\bigcap_{n=1}^\infty G_n,
   $$
   故 $\bigcap_{n=1}^\infty G_n$ 在 $X$ 中稠密。

2. **第 1 条与第 2 条的等价性（De Morgan 对偶）：**
   假设存在非空开集 $U\subseteq\bigcup_{n=1}^\infty A_n$，其中每个 $A_n$ 无处稠密。令 $G_n=X\setminus\overline{A_n}$，由 $A_n$ 无处稠密（$\operatorname{Int}_X\overline{A_n}=\varnothing$）可知每个 $G_n$ 都是 $X$ 中的**稠密开集**！由第 1 条，交集 $\bigcap_{n=1}^\infty G_n$ 在 $X$ 中稠密，故必与非空开集 $U$ 相交：
   $$
   \varnothing\neq U\cap\bigcap_{n=1}^\infty G_n=U\setminus\bigcup_{n=1}^\infty\overline{A_n}\subseteq U\setminus\bigcup_{n=1}^\infty A_n=\varnothing,
   $$
   矛盾！反之，若 $\{G_n\}$ 为一列稠密开集，则 $F_n=X\setminus G_n$ 为无内点的闭集（即无处稠密集），由第 2 条知任何非空开集 $U$ 都不包含于 $\bigcup_{n=1}^\infty F_n$，即 $U\cap\bigcap_{n=1}^\infty G_n\neq\varnothing$。$\square$

## 4. 算子理论中最常用的推论：可数闭覆盖必有内点

在泛函分析后续的开映射定理与一致有界原理证明中，我们最常直接调用的是 Baire 纲定理的如下可数闭集覆盖形式：

> [!note] 推论 4.1 可数闭集覆盖的内点存在性
> 若非空完备度量空间 $X$ 可以表示为可数多个**闭集**的并集：
> $$
> X=\bigcup_{n=1}^\infty F_n\qquad(\text{每个 }F_n\text{ 为闭集}),
> $$
> 则其中**至少存在一个**闭集 $F_{N}$ 具有非空内部（即存在中心 $x_0\in X$ 和半径 $r>0$，使得开球 $B(x_0,r)\subseteq F_N$）。

**证明：** 若不然，假设对所有 $n\in\mathbb N$ 都有 $\operatorname{Int}_X(F_n)=\varnothing$。由于 $F_n$ 本身是闭集（$\overline{F_n}=F_n$），这意味着每个 $F_n$ 都是无处稠密集，从而非空完备空间 $X=\bigcup_{n=1}^\infty F_n$ 成为了第一纲集，直接与定理 3.1 矛盾！$\square$

## 5. 关于完备性与 Baire 空间的两个重要边界提醒

1. **不能省去完备性假设：** 在赋予通常距离的有理数空间 $X=\mathbb Q$ 中，由于没有孤立点，每一个单点集 $\{q_n\}$ 都是无内点的闭集（在 $\mathbb Q$ 中无处稠密）；而 $\mathbb Q=\bigcup_{n=1}^\infty\{q_n\}$，故不完备空间 $\mathbb Q$ 在其自身之中是**第一纲集**。
2. **“度量完备”是成为 Baire 空间的充分条件而非必要条件：** 在一般拓扑学中，满足定理 3.1 结论（任意可数个稠密开集之交仍稠密）的拓扑空间称为 **Baire 空间**。例如，开区间 $X=(-1,1)$ 在通常绝对值距离下固然不完备，但它与完备空间 $\mathbb R$ 拓扑同胚（见 [[泛函分析/01_度量空间及其完备化/08_度量空间的反例与辨析#4. 拓扑同胚不保持基本列与完备性|01 专题第 8 节]]），而“稠密开集”与“第一纲集”都是纯粹的拓扑概念，因此 $(-1,1)$ 作为拓扑空间依然是 Baire 空间（即在自身中是第二纲集）。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_开映射与闭图像定理|开映射中的闭层级]]
- [[03_一致有界原理与极限交换|一致有界中的闭层级]]
- [[泛函分析讲义上册习题册#2.3 开映射、闭图像与共鸣定理|原书 2.3 节]]

## 跨主题参照

- [[拓扑学 Munkres/Chapter 08 - Baire Spaces and Dimension Theory/48_Baire_Spaces#48.2 Baire 纲定理|Baire Spaces]]：对照一般拓扑学中完备度量空间与局部紧 Hausdorff 空间均为 Baire 空间的统一框架。
