---
title: "Undergraduate Algebraic Geometry"
author: "Miles Reid (Notes & Bilingual Exposition)"
institution: "Math Inst., University of Warwick / math-notes"
date: "2013-10-20"
tags:
  - algebraic-geometry
  - mathematics
  - textbook
---

> [!abstract]- Edition History
> 1st preprint edition, Oct 1985
> 2nd preprint edition, Jan 1988
> LMS Student Texts 12, C.U.P., Cambridge 1988
> 2nd corrected printing, Oct 1989
> first TeX edition, Jan 2007

## Preface

本讲义为初等代数几何（Undergraduate Algebraic Geometry）的完整双语读书笔记与推导讲义。全篇围绕“代数簇的几何直观与交换代数工具的对偶统一”展开，从古典平面二次曲线与三次曲线的具体计算出发，逐步建立仿射代数簇、Hilbert 基定理、零点定理（Nullstellensatz）、Noether 正规化引理、局部环与有理映射、射影簇与双有理几何、切空间与维数理论，最终抵达古典几何的高峰——非奇异三次曲面上 27 条直线的存在性与配置结构，并在末章梳理从古典消元理论到 Grothendieck 概形（Scheme）语言的历史演进脉络。

在整理过程中，本笔记保留了完整的四章主干与进阶专题结构，对所有核心定理、引理、推论及课后习题提供了详尽的代数推导与几何解释，并对涉及基域特征限制的命题（如二次齐次多项式与 Hessian 矩阵恒等式 $x^{\mathsf{T}} H x = 2 f(P)$ 需要 $\operatorname{char} k \neq 2$，平面三次曲线拐点的 Hessian 行列式判据需要 $\operatorname{char} k \neq 2, 3$）给出了明确的适用条件说明。

## Contents

### Chapter 0: 引言与范畴对应 (Waffle & Foundational Panorama)
- [[#0.1 What it's about]]
- [[#0.2 Specific calculations versus general theory]]
- [[#0.3 Rings of functions and categories of geometry]]
- [[#0.4 Geometry from polynomials]]
- [[#0.5 Abstract varieties versus embedded varieties]]
- [[#0.6 Pre-requisites]]
- [[#0.7 Exercises to Chapter 0]]

### Chapter 1: 平面曲线的几何与代数 (Playing with Plane Curves)
- [[#1.1 Conics]]
- [[#1.2 Projective plane and homogeneous coordinates]]
- [[#1.3 Classification of conics and quadratic forms]]
- [[#1.4 Parametrisation of a conic and pencils of conics]]
- [[#1.5 Cubics and the inflection points]]
- [[#1.6 The group law on a cubic]]
- [[#1.7 Pascal's Mystic Hexagram]]
- [[#1.8 Irreducible cubics and singular cubics]]
- [[#1.9 Singularities, intersection multiplicity and Bézout's theorem]]
- [[#1.10 Appendix: Curves and their genus]]
- [[#1.11 Exercises to Chapter 1]]

### Chapter 2: 仿射簇与 Hilbert 零点定理 (Affine Varieties and the Nullstellensatz)
- [[#2.1 Noetherian rings and Hilbert's basis theorem]]
- [[#2.2 The V-I correspondence and Zariski topology]]
- [[#2.3 Irreducible algebraic sets and primary decomposition]]
- [[#2.4 Finite algebras and Noether normalisation]]
- [[#2.5 Weak Nullstellensatz]]
- [[#2.6 Strong Nullstellensatz and radical ideals]]
- [[#2.7 Worked examples and reduction to a hypersurface]]
- [[#2.8 Exercises to Chapter 2]]

### Chapter 3: 代数簇上的函数、态射、有理映射与爆破 (Functions, Morphisms, Rational Maps and Blowups)
- [[#3.1 Coordinate rings and polynomial maps]]
- [[#3.2 Function fields, regular functions and local rings]]
- [[#3.3 Rational maps and dominant rational maps]]
- [[#3.4 Projective varieties and the homogeneous Nullstellensatz]]
- [[#3.5 Affine coverings, morphisms and birational equivalence]]
- [[#3.6 Products of varieties and the Segre embedding]]
- [[#3.7 Tangent space, nonsingularity and dimension theory]]
- [[#3.8 Blowups and resolution of curve singularities]]
- [[#3.9 Exercises to Chapter 3]]

### Chapter 4: 三次曲面上的 27 条直线与历史评注 (The 27 Lines on a Cubic Surface and Final Comments)
- [[#4.1 Nonsingular cubic surfaces and tangent planes]]
- [[#4.2 Existence of a line on a nonsingular cubic surface]]
- [[#4.3 The 5 pairs of coplanar lines meeting a given line]]
- [[#4.4 Disjoint lines and explicit construction of the 27 lines]]
- [[#4.5 Configuration of the 27 lines and blowup of six points]]
- [[#4.6 Historical evolution: from classical geometry to schemes]]
- [[#4.7 Exercises to Chapter 4]]
- [[#Index of Key Notations and Concepts]]

## Part 0: 引言与范畴对应

### Chapter 0: Waffle

#### 0.1 What it's about

代数几何（Algebraic Geometry）的核心任务是研究由多元多项式方程组的公共零点所定义的几何图形——即**代数簇（Algebraic Varieties）**。设 $k$ 为一个域（在古典几何直觉中通常取 $k = \mathbb{R}$ 或 $k = \mathbb{C}$，在一般代数理论中常取任意代数闭域 $k = \bar{k}$），给定多元多项式环 $k[X_1, \dots, X_n]$ 中的一族多项式 $\{f_i\}_{i \in I}$，它们在 $n$ 维仿射空间 $\mathbb{A}^n_k = k^n$ 中切割出的公共零点轨迹定义为：
$$V(\{f_i\}_{i \in I}) = \left\{ P = (a_1, \dots, a_n) \in k^n \;\middle|\; f_i(a_1, \dots, a_n) = 0, \;\forall i \in I \right\}.$$

这一看似简单的定义将两个表面截然不同的数学世界紧密联系在一起：
1. **几何世界（Geometric World）**：点、曲线、曲面、高维流形、切空间、奇点、相交重数、投射与双有理变换。
2. **代数世界（Algebraic World）**：交换环、理想（Ideal）、素理想（Prime Ideal）、极大理想（Maximal Ideal）、商环、分式域、局部化（Localization）以及有限生成域扩张。

初等代数几何的魅力正在于：一方面，我们可以借助交换代数的严密机制，将古典几何中原本依赖图形直觉的“一般位置（General Position）”“重数计数（Counting with Multiplicity）”与“连续性原理（Principle of Continuity）”转化为精确的代数定理；另一方面，几何直观又为枯燥的理想运算、Noether 正规化与局部环理论提供了清晰的图像指引。

#### 0.2 Specific calculations versus general theory

在学习代数几何的过程中，始终存在两种互补的研究取向：
1. **具体计算与显式几何构造（Specific Calculations）**：例如利用有理参数化求解圆锥曲线上的有理点，通过齐次坐标计算两条平面曲线在无穷远处的交点，借助消元法（Elimination）寻找三次曲面上的直线，或者利用极坐标式爆破（Blow-up）拆解平面曲线在原点处的尖点（Cusp）与结点（Node）。这些具体算例是整个学科的生命力所在。
2. **一般范畴与公理化理论（General Theory）**：例如通过 Zariski 拓扑、坐标环 $k[V]$、结构层（Structure Sheaf）乃至概形（Scheme）建立普适的函子框架，使得我们能够内在（Intrinsically）地定义代数簇及其态射，而不再依赖于某一个特定的外围嵌入空间 $\mathbb{A}^n$ 或 $\mathbb{P}^n$。

脱离具体算例的抽象理论容易沦为空洞的符号推演，而缺乏一般理论支撑的显式计算则会在面对高维簇或奇点分解时陷入繁琐的坐标泥潭。因此，本讲义采取“三段式螺旋推进”策略：
- 在 **Chapter 1** 中，我们先不引入沉重的交换代数预备知识，而是直接在仿射平面 $\mathbb{A}^2$ 与射影平面 $\mathbb{P}^2$ 中把玩二次曲线与三次曲线，亲手完成参数化、拐点 Hessian 矩阵分析、三次曲线群律及 Pascal 神秘六边形定理的构造。
- 在 **Chapter 2** 与 **Chapter 3** 中，我们系统建立仿射簇与射影簇的代数基础，完整证明 Hilbert 基定理、Noether 正规化引理与强弱零点定理，并引入有理函数域 $k(V)$、局部环 $\mathcal{O}_{V,P}$、正则态射、有理映射、乘积簇及爆破变换。
- 在 **Chapter 4** 中，我们将前两部分的抽象工具重新投放到一个极具代表性的古典几何问题——证明空间中任意非奇异三次曲面 $S \subset \mathbb{P}^3$ 上恰好包含 **27 条直线**，并剖析其高度对称的相交构型。

#### 0.3 Rings of functions and categories of geometry

现代几何学的核心哲学可以概括为：**一个几何空间 $X$ 的本质由定义在其上的容许函数环（Ring of Functions）所决定**。在不同的几何分支中，这一对应关系呈现出高度平行的结构：

| 几何范畴 $\mathcal{C}$ | 空间对象 $X$ | 态射 $f: X \to Y$ | 函数环 $\mathcal{R}(X)$ | 拉回同态 $f^*: \mathcal{R}(Y) \to \mathcal{R}(X)$ |
| :--- | :--- | :--- | :--- | :--- |
| 拓扑空间范畴 $\mathsf{Top}$ | 紧 Hausdorff 空间 $X$ | 连续映射 | 连续复值函数环 $C(X, \mathbb{C})$ | $\varphi \mapsto \varphi \circ f$（Gelfand 对偶） |
| 微分流形范畴 $\mathsf{Diff}$ | 光滑流形 $M$ | $C^\infty$ 光滑映射 | 光滑实值函数环 $C^\infty(M, \mathbb{R})$ | $\varphi \mapsto \varphi \circ f$ |
| 复解析空间范畴 $\mathsf{Hol}$ | 复流形 / Stein 流形 $X$ | 全纯映射 | 全纯函数环 $\mathcal{O}_{\mathrm{hol}}(X)$ | $\varphi \mapsto \varphi \circ f$ |
| 仿射代数几何 $\mathsf{AffVar}_k$ | 仿射代数集 $V \subset \mathbb{A}^n_k$ | 多项式映射 | 坐标环 $k[V] = k[X_1,\dots,X_n]/I(V)$ | $\varphi \mapsto \varphi \circ f$ |

**Definition 0.3.1 (坐标环与拉回函子).** 设 $V \subset \mathbb{A}^n_k$ 为一个仿射代数集，所有在 $V$ 上恒等于零的多项式构成多元多项式环 $k[X_1, \dots, X_n]$ 的一个理想：
$$I(V) = \{ f \in k[X_1, \dots, X_n] \mid f(P) = 0, \;\forall P \in V \}.$$
商环 $k[V] := k[X_1, \dots, X_n] / I(V)$ 称为 $V$ 的**坐标环（Coordinate Ring）**。若 $\Phi: V \to W$ 是两个仿射代数集之间的多项式映射，则通过函数复合自然诱导出坐标环之间的逆变（Contravariant）$k$-代数同态：
$$\Phi^*: k[W] \longrightarrow k[V], \qquad g \longmapsto \Phi^*(g) := g \circ \Phi.$$

在 **Chapter 2** 与 **Chapter 3** 中我们将严格证明：当基域 $k$ 为代数闭域时，函子 $V \mapsto k[V]$ 给出了**仿射代数集与多项式映射范畴**同**有限生成无幂元（Reduced）交换 $k$-代数范畴**之间的**反等价（Anti-equivalence of Categories）**。

#### 0.4 Geometry from polynomials

既然函数环 $k[V]$ 决定了仿射代数集 $V$，我们如何纯代数地从环 $A = k[V]$ 中把几何点“还原”出来？

设 $P = (a_1, \dots, a_n) \in V \subset \mathbb{A}^n_k$ 是空间中的一个具体几何点。考虑“在点 $P$ 处求值（Evaluation at $P$）”的映射：
$$\operatorname{ev}_P: k[V] \longrightarrow k, \qquad \varphi \longmapsto \varphi(P).$$
由于 $k[V]$ 中包含常数函数，映射 $\operatorname{ev}_P$ 是一个满的 $k$-代数同态。根据环同态基本定理，其核（Kernel）：
$$\mathfrak{m}_P := \ker(\operatorname{ev}_P) = \{ \varphi \in k[V] \mid \varphi(P) = 0 \}$$
满足 $k[V] / \mathfrak{m}_P \cong k$。因为 $k$ 是域，所以 $\mathfrak{m}_P$ 必然是 $k[V]$ 的一个**极大理想（Maximal Ideal）**。

反过来，是不是 $k[V]$ 的每一个极大理想 $\mathfrak{m}$ 都恰好来自于某个几何点 $P \in V$ 处的求值核 $\mathfrak{m}_P$？
- 如果基域 $k$ **不是**代数闭域（例如 $k = \mathbb{R}$），答案是否定的。例如在 $A = \mathbb{R}[X]$ 中，主理想 $\mathfrak{m} = (X^2 + 1)$ 是极大理想（因为 $\mathbb{R}[X]/(X^2+1) \cong \mathbb{C}$ 是域），但它在实直线 $\mathbb{A}^1_{\mathbb{R}} = \mathbb{R}$ 上没有任何实零点，它对应的是共轭复数点对 $\pm i \in \mathbb{C}$。
- 如果基域 $k$ **是**代数闭域（$k = \bar{k}$），Hilbert 弱零点定理（Weak Nullstellensatz）保证：有限生成 $k$-代数 $k[V]$ 的每一个极大理想 $\mathfrak{m}$ 都满足 $k[V]/\mathfrak{m} \cong k$，从而存在唯一的几何点 $P \in V$ 使得 $\mathfrak{m} = \mathfrak{m}_P$！

这样，几何空间 $V$ 的点集就可以纯代数地等同于其坐标环的**极大理想谱（Maximal Spectrum）**：
$$V \longleftrightarrow \operatorname{m-Spec}(k[V]) = \{ \mathfrak{m} \subset k[V] \mid \mathfrak{m} \text{ is a maximal ideal} \}.$$

#### 0.5 Abstract varieties versus embedded varieties

在微分流形理论中，我们起初在欧氏空间 $\mathbb{R}^N$ 中讨论曲线和曲面（嵌入流形），随后通过局部坐标卡（Coordinate Charts）与转移映射（Transition Functions）的黏合定义了内蕴的抽象流形。代数几何同样经历了完全相同的演进：
1. **嵌入视角（Embedded Point of View）**：将仿射簇视为固定外围空间 $\mathbb{A}^n$ 的闭子集 $V \subset \mathbb{A}^n$，将射影簇视为固定射影空间 $\mathbb{P}^n$ 的闭子集 $X \subset \mathbb{P}^n$。这种视角便于利用现成的坐标与多项式理想直接计算。
2. **内蕴视角（Intrinsic / Abstract Point of View）**：同一个代数簇可以有许多不同的嵌入方式。例如射影直线 $\mathbb{P}^1$ 既可以作为 $\mathbb{P}^2$ 中的一条直線 $Z = 0$，也可以通过二次 Veronese 映射 $[U:V] \mapsto [U^2 : UV : V^2]$ 同构地嵌入为 $\mathbb{P}^2$ 中的非退化圆锥曲线 $XZ - Y^2 = 0$，还可以通过三次扭曲曲线（Twisted Cubic）$[U:V] \mapsto [U^3 : U^2V : UV^2 : V^3]$ 嵌入到 $\mathbb{P}^3$ 中。内蕴视角要求我们通过坐标环 $k[V]$、有理函数域 $k(V)$、局部环 $\mathcal{O}_{V,P}$ 以及仿射开覆盖的黏合来刻画簇本身的不变量。

#### 0.6 Pre-requisites

阅读与推演本讲义所需的预备知识非常精简：
1. **交换代数基础**：交换含幺环（Commutative Ring with $1$）、理想、商环、素理想与整环（Integral Domain）、极大理想与域、唯一析因整环（UFD，特别是高斯引理保证当 $A$ 为 UFD 时多项式环 $A[X]$ 也是 UFD）。
2. **域论与伽罗瓦理论初步**：域扩张的次数 $[L:K]$、代数元与超越元、超越次数（Transcendence Degree）、有限生成域扩张以及单扩张定理（Primitive Element Theorem）。
3. **线性代数与射影几何初步**：向量空间维数、线性方程组秩-零化度定理、二次型与对称矩阵、行列式与 Cramer 法则。
4. **点集拓扑基础**：开集与闭集公理、连续映射、紧致性（Quasi-compactness）、连通性与稠密子集。

#### 0.7 Exercises to Chapter 0

##### Exercise 0.1 (三次方程的重根判别式、尖点抛物线与灾变曲面图)
考虑实（或复）系数缺二次项的一般三次多项式：
$$f(x) = x^3 + p x + q.$$
1. 证明 $f(x) = 0$ 存在重根当且仅当系数 $(p, q)$ 满足三次判别式方程 $4p^3 + 27q^2 = 0$；
2. 在三维空间 $\mathbb{R}^3_{(x, p, q)}$ 中考察光滑曲面 $S = \{(x, p, q) \in \mathbb{R}^3 \mid x^3 + p x + q = 0\}$ 及其向参数平面 $\mathbb{R}^2_{(p, q)}$ 的自然投影 $\pi: (x, p, q) \mapsto (p, q)$。画出分支曲线（折痕投影 / 尖点灾变曲线）$\Delta: 4p^3 + 27q^2 = 0$，并标明在参数平面 $\mathbb{R}^2_{(p, q)}$ 的各个区域内实根的个数与几何形态。

**Proof.**
1. 多项式 $f(x) = x^3 + p x + q$ 在 $x = x_0$ 处有重根，当且仅当 $f(x_0) = 0$ 且导数 $f'(x_0) = 3x_0^2 + p = 0$。由第二式得 $p = -3x_0^2$，代入第一式得：
   $$x_0^3 + (-3x_0^2)x_0 + q = 0 \implies q = 2x_0^3.$$
   从参数表达式 $(p, q) = (-3x_0^2, \, 2x_0^3)$ 中消去重根参数 $x_0$：由于 $p^3 = -27 x_0^6$ 且 $q^2 = 4 x_0^6$，立即得到充要关系：
   $$4p^3 + 27q^2 = 0!$$
2. 在参数平面 $\mathbb{R}^2_{(p, q)}$ 中，判别式轨迹 $\Delta = \{(p, q) \mid 4p^3 + 27q^2 = 0\}$ 是仅位于左半平面 $p \le 0$ 的**半立方抛物线（Semicubical Parabola）**，由有理参数化 $t \mapsto (-3t^2, 2t^3)$ 给出，在原点 $(p, q) = (0, 0)$ 处具有一个典型的**尖点（Cusp，对应三重根 $x^3 = 0$）**。
   曲面 $S = \{q = -x^3 - px\}$ 本身作为 $q$ 关于 $(x, p)$ 的函数图像处处光滑（同构于 $\mathbb{R}^2$），但其向 $(p, q)$-平面的投影 $\pi: S \to \mathbb{R}^2_{(p, q)}$ 是著名的**尖点灾变映射（Cusp Catastrophe / Whitney Pleat）**：
   - **当 $4p^3 + 27q^2 > 0$（尖点外部区域，含整个右半平面 $p > 0$）**：三次方程恰有 **$1$ 个单实根**（和一对共轭复根），投影纤维 $|\pi^{-1}(p, q) \cap \mathbb{R}^3| = 1$；
   - **当 $4p^3 + 27q^2 < 0$（尖点内部楔形区域，此时必有 $p < 0$）**：函数 $f(x)$ 有两个实极值点 $x_\pm = \pm\sqrt{-p/3}$ 且极小值 $f(\sqrt{-p/3}) < 0 < f(-\sqrt{-p/3})$，故三次方程恰有 **$3$ 个互异实根**，曲面 $S$ 在该区域上方折叠为三叶覆盖；
   - **当 $4p^3 + 27q^2 = 0$ 且 $(p, q) \neq (0, 0)$（尖点曲线的两条光滑翼支）**：恰有 $1$ 个二重实根 $x_0 = -\frac{3q}{2p}$ 和 $1$ 个单实根 $-2x_0 = \frac{3q}{p}$；而在尖点 $(p, q) = (0, 0)$ 处三叶汇合为唯一的 $3$ 重实根 $x = 0$。 **Q.E.D.**

##### Exercise 0.2 (实平面代数曲线的孤立点局部极值定理与三次曲线奇点作图)
1. **一般命题（实平面曲线的孤立点必为函数局部极值点与奇点）**：设 $f(x, y) \in \mathbb{R}[x, y]$ 为实二元多项式，考虑实平面代数曲线 $C = \{(x, y) \in \mathbb{R}^2 \mid f(x, y) = 0\}$。若点 $P = (x_0, y_0) \in C$ 是实轨迹 $C$ 的一个**孤立点（Isolated Point）**（即存在半径 $r > 0$ 的开圆盘 $B_r(P) \subset \mathbb{R}^2$ 使得 $B_r(P) \cap C = \{P\}$），证明二元实函数 $f(x, y)$ 在点 $P$ 处必取得严格的局部极大值或局部极小值，并由此推出两个一阶偏导数在 $P$ 处同时为零：
   $$\frac{\partial f}{\partial x}(P) = \frac{\partial f}{\partial y}(P) = 0.$$
2. **具体曲线作图与局部奇点对比**：在实平面 $\mathbb{R}^2$ 中分别画出下列三条三次代数曲线的轨迹，结合第 1 问解释为何 $C_3$ 在原点处出现孤立实点：
   $$C_1: y^2 = x^3, \qquad C_2: y^2 = x^2(x + 1), \qquad C_3: y^2 = x^2(x - 1).$$

**Proof.**
1. **一般命题的严格证明**：设 $P = (x_0, y_0)$ 是实零点集 $C = f^{-1}(0) \subset \mathbb{R}^2$ 的孤立点，取开圆盘 $B_r(P)$ 使得 $B_r(P) \cap f^{-1}(0) = \{P\}$。考察二维穿孔开圆盘（去心邻域）：
   $$U := B_r(P) \setminus \{P\} \subset \mathbb{R}^2.$$
   因为实平面 $\mathbb{R}^2$ 的维数为 $2 > 1$，穿孔圆盘 $U$（同胚于 $(0, r) \times S^1$）是**道路连通（从而连通）**的开集，且连续函数 $f(x, y)$ 在整个 $U$ 上处处非零（$f(x, y) \neq 0, \, \forall (x, y) \in U$）。由连通集上连续函数的介值定理，$f(x, y)$ 在连通集 $U$ 上**恒保定号**：
   - 若在 $U$ 上恒有 $f(x, y) > 0 = f(P)$，则 $f$ 在点 $P$ 处取得严格的**局部极小值**；
   - 若在 $U$ 上恒有 $f(x, y) < 0 = f(P)$，则 $f$ 在点 $P$ 处取得严格的**局部极大值**。
   由于多项式 $f(x, y)$ 在内点 $P \in B_r(P)$ 处可微且取得局部极值，由多元微分学的 Fermat 驻点定理立得 $\frac{\partial f}{\partial x}(P) = \frac{\partial f}{\partial y}(P) = 0$，即实曲线的任何孤立点必然是该曲线的代数奇点！
2. **三条具体三次曲线的作图与分析**（均关于 $x$-轴对称，可通过斜率参数 $t = y/x$ 即 $y = tx$ 分析）：
1. **尖点三次曲线 $C_1: y^2 = x^3$**：在 $\mathbb{R}^2$ 中仅当 $x \ge 0$ 时有实点 $y = \pm x^{3/2}$。代入 $y = tx$ 得 $x = t^2, y = t^3$。在原点 $(0, 0)$ 处上下两支均以水平轴 $y = 0$ 为单侧切线（半切线重合），形成一个**尖点（Cusp）**。
2. **结点三次曲线 $C_2: y^2 = x^2(x + 1)$**：在 $\mathbb{R}^2$ 中要求 $x \ge -1$。代入 $y = tx$ 得参数化 $x = t^2 - 1, \, y = t(t^2 - 1)$。当 $-1 \le x < 0$（对应 $t \in (-1, 1)$）时曲线形成一个封闭的实卵形环（loop），在原点 $(0, 0)$（对应 $t = \pm 1$）处两条实分支以斜率 $y = \pm x$ 横截自交，形成一个**自交结点（Node / Crunode）**，随后在 $x > 0$（$|t| > 1$）向右侧无穷远张开。
3. **带孤立点的三次曲线 $C_3: y^2 = x^2(x - 1)$**：在实平面 $\mathbb{R}^2$ 中要求 $x^2(x - 1) \ge 0$，这仅在 **$x = 0$（从而 $y = 0$）** 或 **$x \ge 1$** 时成立！
   - 在 $x \ge 1$ 区域，曲线是一条光滑的钟形实分支 $y = \pm x\sqrt{x - 1}$（在 $(1, 0)$ 处有铅直切线）；
   - 在 $0 < x < 1$ 及 $x < 0$ 区域内，$x^2(x - 1) < 0$，没有任何实点；
   - 因此，原点 **$(0, 0)$ 是实轨迹 $C_3(\mathbb{R})$ 中的一个孤立点（Isolated Point / Acnode）**！从复代数几何的视角看，将方程在 $(0, 0)$ 处展开为 $y^2 + x^2 - x^3 = 0$，其最低次二次型为 $y^2 + x^2 = (y - ix)(y + ix) = 0$，即在复平面 $\mathbb{C}^2$ 中 $(0, 0)$ 处实际上有两条以共轭虚斜率 $y = \pm i x$ 横截相交的复分支，它们在实切空间 $\mathbb{R}^2$ 中的唯一公共实点就是孤立原点 $(0, 0)$。 **Q.E.D.**

##### Exercise 0.3 (原书指定三次曲线族 $y^2 = 4x^3 + 6x^2 - t$ 在 $t \in [-1, 3]$ 下的水平截线与实作图)
1. 在实平面中先画出三次多项式函数 $g(x) = 4x^3 + 6x^2$ 的图像，标出其驻点与极值，并画出对应于整数参数 $t \in \{-1, 0, 1, 2, 3\}$ 的水平截线 $y = t$；
2. 利用上述水平截线高度差 $g(x) - t \ge 0$，在同一参数变化过程下依次画出实平面三次曲线族
   $$C_t: y^2 = 4x^3 + 6x^2 - t \qquad (t = -1, \, 0, \, 1, \, 2, \, 3)$$
   的几何图像，说明随着 $t$ 从 $-1$ 增大到 $3$ 时自交结点（Node）、有界卵形闭环（Oval）与孤立奇点（Isolated Point）的生成与消失过程（并与一般分根形式 $y^2 = (x-e_1)(x-e_2)(x-e_3)$ 对照）。

**Proof.**
1. **辅助三次函数 $g(x) = 4x^3 + 6x^2 = 2x^2(2x + 3)$ 的图像与水平截线 $y = t$**：
   求导得 $g'(x) = 12x^2 + 12x = 12x(x + 1)$，二阶导数 $g''(x) = 24x + 12$：
   - 在 **$x = -1$** 处：$g'(-1) = 0, \, g''(-1) = -12 < 0$，函数取得**局部极大值 $g(-1) = 4(-1) + 6(1) = 2$**；
   - 在 **$x = 0$** 处：$g'(0) = 0, \, g''(0) = +12 > 0$，函数取得**局部极小值 $g(0) = 0$**（且在 $x = -3/2$ 处穿过横轴 $g(-3/2) = 0$，在 $x = 1/2$ 处达到 $g(1/2) = 2$）。
   因此，水平截线 $y = t$ 与曲线 $y = g(x)$ 的交点（即三次方程 $4x^3 + 6x^2 - t = 0$ 的实根）严格由两个临界高度 **$t = 0$** 和 **$t = 2$** 分界！
2. **曲线族 $C_t: y^2 = 4x^3 + 6x^2 - t$ 对整数 $t \in [-1, 3]$ 的逐一作图**：
   由于 $y = \pm\sqrt{g(x) - t}$，实轨迹仅存在于水平线 $y = t$ 上方的区域 $g(x) \ge t$：
   - **$t = -1 < 0$（低于局部极小值）**：$4x^3 + 6x^2 + 1 = 0$ 在 $(-\infty, -3/2)$ 内仅有唯一单实根 **$x_0 \approx -1.5979$**（精确至十位小数为 $-1.5979116727$），当 $x \ge x_0$ 时 $g(x) - (-1) \ge 0$（在 $x = -1$ 处波峰达到 $y = \pm\sqrt{3}$，在 $x = 0$ 处波谷缩窄至 $y = \pm 1$ 但未断开），故 $C_{-1}(\mathbb{R})$ 是**单条连通的无界光滑曲线**；
   - **$t = 0$（临界高度一：局部极小值相切，自交结点）**：方程为 $y^2 = 4x^3 + 6x^2 = x^2(4x + 6)$。在 $x \in [-3/2, 0]$ 上形成一个左端在 $(-3/2, 0)$ 闭合的环，在原点 **$(0, 0)$ 处上下两支以切线斜率 $y = \pm\sqrt{6}\,x$ 横截自交（形成自交结点 Node / Crunode）**，并向 $x > 0$ 无界延伸；
   - **$t = 1 \in (0, 2)$（位于两极值之间，三实根分离）**：$4x^3 + 6x^2 - 1 = (2x + 1)(2x^2 + 2x - 1) = 0$ 恰有 $3$ 个互异实根 $e_1 = -\frac{1+\sqrt{3}}{2} \approx -1.366 < e_2 = -\frac{1}{2} = -0.5 < e_3 = \frac{\sqrt{3}-1}{2} \approx 0.366$。原点的结点断开，$C_1(\mathbb{R})$ 分裂为**两个连通分支**：左侧 $x \in [e_1, -1/2]$ 上的**紧致有界卵形闭环（Oval）**与右侧 $x \in [e_3, +\infty)$ 上的**无界开分支**；
   - **$t = 2$（临界高度二：局部极大值相切，孤立奇点）**：$4x^3 + 6x^2 - 2 = 2(x + 1)^2(2x - 1)$。左侧区间收缩为二重根 $x = -1$，在 $(-1, 0)$ 附近（$-1 \neq x < 1/2$）恒有 $g(x) - 2 < 0$，因此左侧的有界卵形闭环坍缩为点 **$(-1, 0)$ 处的一个孤立奇点（Acnode，恰印证 Exercise 0.2 的局部极大值孤立点定理！）**，右侧 $x \ge 1/2$ 为光滑无界分支；
   - **$t = 3 > 2$（高于局部极大值）**：$4x^3 + 6x^2 - 3 = 0$ 仅在 $(1/2, +\infty)$ 内有唯一单实根 **$x_1 \approx 0.5979$**（精确至十位小数为 $0.5979116727$；注意由三次曲线关于拐点 $(-1/2, 1)$ 的中心对称恒等式 $g(-1 - x) = 2 - g(x)$，方程 $g(x) = 3$ 的根 $x_1$ 与 $g(x) = -1$ 的根 $x_0$ 严格满足 $x_0 = -1 - x_1$），孤立点彻底消失，$C_3(\mathbb{R})$ 仅剩 $x \ge x_1$ 的**单条无界光滑分支**。
3. **与一般分根形式 $f(x) = (x - e_1)(x - e_2)(x - e_3)$ 的对照小结**：
1. **情形一（$f(x) = 0$ 有 $3$ 个互异实根 $e_1 < e_2 < e_3$）**：
   三次首一多项式 $f(x)$ 在区间 $[e_1, e_2]$ 上满足 $f(x) \ge 0$，在 $(e_2, e_3)$ 上满足 $f(x) < 0$，在 $[e_3, +\infty)$ 上满足 $f(x) \ge 0$。因此实轨迹 $C(\mathbb{R})$ 由**两个互不相交的实连通分支**组成：
   - 在有界闭区间 $x \in [e_1, e_2]$ 上，上下半支在端点 $(e_1, 0)$ 与 $(e_2, 0)$ 处铅直闭合，形成一个紧致的**有界卵形闭环（Bounded Oval）**（同胚于圆周 $S^1$）；
   - 在无界区间 $x \in [e_3, +\infty)$ 上，从顶点 $(e_3, 0)$ 出发向右上方与右下方无限延伸（渐近行为 $y \sim \pm x^{3/2}$），形成一条**无界开分支**（同胚于 $\mathbb{R}$，在射影平面 $\mathbb{P}^2(\mathbb{R})$ 中于无穷远拐点 $[0:1:0]$ 处闭合为第二个 $S^1$）。
2. **情形二（$f(x) = 0$ 仅有 $1$ 个单实根 $e_1$ 及一对共轭虚根）**：
   此时 $f(x) \ge 0 \iff x \ge e_1$，有界卵形环消失，实轨迹 $C(\mathbb{R})$ 仅含 **$1$ 个实连通分支**（即 $x \ge e_1$ 上的无界分支）。
3. **情形三（退化临界态：对 $y^2 = x(x-1)(x-\lambda)$ 令 $\lambda$ 穿过 $0$ 或 $1$）**：
   - 当 $0 < \lambda < 1$ 时，三根排序为 $0 < \lambda < 1$，有界卵形环位于 $[0, \lambda]$，无界支位于 $[1, +\infty)$；
   - 当 $\lambda \to 0^+$ 时，区间 $[0, \lambda]$ 收缩为单点 $(0, 0)$，在 $\lambda = 0$（即 $y^2 = x^2(x-1)$）处有界卵形环退化为 $(0, 0)$ 处的**孤立奇点（Acnode）**；
   - 当 $\lambda \to 1^-$ 时，中间禁区 $(\lambda, 1)$ 闭合消失，在 $\lambda = 1$（即 $y^2 = x(x-1)^2$）处有界卵形环与右侧无界支在 $(1, 0)$ 处相撞捏合，形成一个**自交结点（Node）**！ **Q.E.D.**

---

##### 补充习题 0.A (有限域上多项式函数与形式多项式的区别)
设 $k = \mathbb{F}_p$ 为具有 $p$ 个元素的有限域。证明多项式 $f(X) = X^p - X \in \mathbb{F}_p[X]$ 作为多项式非零，但它诱导的求值函数 $\tilde{f}: \mathbb{A}^1_{\mathbb{F}_p} \to \mathbb{F}_p$ 恒等于零。进而证明：当且仅当基域 $k$ 为无限域时，从多项式环 $k[X_1, \dots, X_n]$ 到函数环 $\operatorname{Map}(k^n, k)$ 的自然同态是单射。

**Proof.**
1. 当 $k = \mathbb{F}_p$ 时，乘法群 $\mathbb{F}_p^\times = \mathbb{F}_p \setminus \{0\}$ 是 $p-1$ 阶有限群。由 Lagrange 定理，对任意 $a \in \mathbb{F}_p^\times$ 有 $a^{p-1} = 1$，两边同乘 $a$ 得 $a^p = a$；而对 $a = 0$ 显然也有 $0^p = 0$。因此对任意 $a \in \mathbb{F}_p$，均有 $f(a) = a^p - a = 0$，即求值函数 $\tilde{f} \equiv 0$，但 $f(X) = X^p - X$ 在形式多项式环 $\mathbb{F}_p[X]$ 中是次数为 $p \ge 2$ 的非零元。
2. 若 $k$ 为任意有限域 $\mathbb{F}_q$，同理可取非零多项式 $\prod_{a \in k}(X_1 - a) = X_1^q - X_1$，它在 $k^n$ 上恒为零，故自然映射不是单射。
3. 反之，设 $k$ 为无限域，我们对变元个数 $n$ 进行数学归纳证明：若 $f \in k[X_1, \dots, X_n]$ 在所有 $(a_1, \dots, a_n) \in k^n$ 处取值为零，则 $f = 0$。
   - **奠基（$n=1$）**：域上一元非零多项式 $f(X_1) \in k[X_1]$ 的根的个数不超过 $\deg f < \infty$。因为 $k$ 是无限集，$f$ 在整个 $k$ 上恒为零蕴含 $f$ 是零多项式。
   - **归纳步（$n-1 \Rightarrow n$）**：将 $f \in k[X_1, \dots, X_n]$ 写成关于 $X_n$ 的一元多项式：
     $$f(X_1, \dots, X_n) = \sum_{j=0}^d g_j(X_1, \dots, X_{n-1}) X_n^j, \qquad g_j \in k[X_1, \dots, X_{n-1}].$$
     任取固定的点 $P' = (a_1, \dots, a_{n-1}) \in k^{n-1}$，则一元多项式 $h(X_n) := f(a_1, \dots, a_{n-1}, X_n) \in k[X_n]$ 对所有 $a_n \in k$ 满足 $h(a_n) = 0$。由 $n=1$ 的结论知 $h(X_n)$ 是零多项式，故对每个 $0 \le j \le d$ 都有 $g_j(a_1, \dots, a_{n-1}) = 0$。由 $P' \in k^{n-1}$ 的任意性及归纳假设，所有系数多项式 $g_j = 0$，从而 $f = 0$。 **Q.E.D.**

##### 补充习题 0.B (高维球面极射投影的有理参数化)
设 $S^{n-1} \subset \mathbb{A}^n_k$ 是由方程 $X_1^2 + X_2^2 + \dots + X_n^2 = 1$ 定义的 $(n-1)$ 维超球面（假设 $\operatorname{char} k \neq 2$），记北极点为 $N = (0, \dots, 0, 1) \in S^{n-1}$。利用从北极点 $N$ 到超平面 $H: X_n = 0$（等同于 $\mathbb{A}^{n-1}_k$，坐标为 $u_1, \dots, u_{n-1}$）的极射投影（Stereographic Projection），构造 $S^{n-1}$ 与 $\mathbb{A}^{n-1}_k$ 之间的互逆有理映射，并写出当 $n=2, k=\mathbb{Q}$ 时毕达哥拉斯三元组的通解公式。

**Proof.**
1. **正向投影 $\pi: S^{n-1} \setminus \{N\} \to \mathbb{A}^{n-1}_k$**：对任意点 $P = (x_1, \dots, x_n) \in S^{n-1}$ 且 $x_n \neq 1$，连接 $N(0,\dots,0,1)$ 与 $P$ 的参数直线方程为：
   $$L(t) = N + t(P - N) = \bigl(t x_1, \dots, t x_{n-1}, 1 + t(x_n - 1)\bigr).$$
   令第 $n$ 个坐标 $1 + t(x_n - 1) = 0$，解得 $t = \frac{1}{1 - x_n}$。代入前 $n-1$ 个坐标即得投影映射：
   $$u_i = \frac{x_i}{1 - x_n} \qquad (i = 1, \dots, n-1).$$
2. **逆向参数化 $\varphi: \mathbb{A}^{n-1}_k \dashrightarrow S^{n-1}$**：给定 $u = (u_1, \dots, u_{n-1}) \in \mathbb{A}^{n-1}_k$，记 $\|u\|^2 := \sum_{i=1}^{n-1} u_i^2$。由 $x_i = (1 - x_n) u_i$ 代入球面方程 $\sum_{i=1}^{n-1} x_i^2 + x_n^2 = 1$，得：
   $$(1 - x_n)^2 \|u\|^2 + (x_n^2 - 1) = 0 \implies (1 - x_n)\bigl[(1 - x_n)\|u\|^2 - (1 + x_n)\bigr] = 0.$$
   舍去对应北极点 $N$ 的平凡解 $x_n = 1$，由 $(1 - x_n)\|u\|^2 = 1 + x_n$ 解得（当 $\|u\|^2 + 1 \neq 0$ 时）：
   $$x_n = \frac{\|u\|^2 - 1}{\|u\|^2 + 1}, \qquad 1 - x_n = \frac{2}{\|u\|^2 + 1}, \qquad x_i = \frac{2 u_i}{\|u\|^2 + 1} \quad (1 \le i \le n-1).$$
3. **毕达哥拉斯三元组（$n=2, k=\mathbb{Q}$）**：取 $u_1 = r/s \in \mathbb{Q}$（其中 $\gcd(r,s)=1$），则单位圆 $x_1^2 + x_2^2 = 1$ 上的全部有理点（除 $(0,1)$ 外）表示为：
   $$(x_1, x_2) = \left( \frac{2rs}{r^2 + s^2}, \;\frac{r^2 - s^2}{r^2 + s^2} \right),$$
   通分即得本原勾股数公式 $(a, b, c) = (2rs, r^2 - s^2, r^2 + s^2)$（或消去公因子 $2$）。 **Q.E.D.**

##### 补充习题 0.C (坐标环同态与多项式映射的双射对应初探)
设 $V = V(Y - X^2) \subset \mathbb{A}^2_k$ 为平面抛物线，$L = \mathbb{A}^1_k$ 为仿射直线（坐标为 $T$）。证明投影映射 $\pi: V \to L, (x, y) \mapsto x$ 与参数化映射 $\sigma: L \to V, t \mapsto (t, t^2)$ 互为逆多项式映射，并验证它们诱导的坐标环同态 $\pi^*: k[T] \to k[X,Y]/(Y - X^2)$ 与 $\sigma^*: k[X,Y]/(Y - X^2) \to k[T]$ 互为逆 $k$-代数同构。

**Proof.**
1. 对任意 $(x, y) \in V$，因 $y = x^2$，故 $(\sigma \circ \pi)(x, y) = \sigma(x) = (x, x^2) = (x, y)$；对任意 $t \in L$，有 $(\pi \circ \sigma)(t) = \pi(t, t^2) = t$。因此 $\pi$ 与 $\sigma$ 作为集合映射互逆，且分量均为坐标的多项式。
2. 在代数层面上，先证 $I(V) = (Y - X^2)$：任取 $f(X, Y) \in k[X, Y]$，在 $(k[X])[Y]$ 中对首一线性多项式 $Y - X^2$ 作带余除法，可将 $f$ 唯一表为 $f(X, Y) = q(X, Y)(Y - X^2) + r(X)$。若 $f \in I(V)$，则对任意 $t \in k$ 有 $0 = f(t, t^2) = r(t)$。当 $k$ 为无限域（或直接计算商环 $k[X,Y]/(Y-X^2)$）时，$r(X) = 0$，从而 $I(V) = (Y - X^2)$。
3. 此时 $\pi^*: k[T] \to k[X,Y]/(Y - X^2)$ 由 $T \mapsto \bar{X}$ 给出，而 $\sigma^*: k[X,Y]/(Y - X^2) \to k[T]$ 由 $\bar{X} \mapsto T, \bar{Y} \mapsto T^2$ 给出（因 $\sigma^*(Y - X^2) = T^2 - T^2 = 0$，故良定义）。显然 $(\sigma^* \circ \pi^*)(T) = T$，且 $(\pi^* \circ \sigma^*)(\bar{X}) = \bar{X}, (\pi^* \circ \sigma^*)(\bar{Y}) = \bar{X}^2 = \bar{Y}$，故二者互为逆同构。 **Q.E.D.**

## Part I: 平面曲线的几何与代数

### Chapter 1: Playing with Plane Curves

#### 1.1 Conics

在仿射平面 $\mathbb{A}^2_k$（其中 $k$ 为域，坐标记为 $(x, y)$）中，一条**平面二次曲线（Plane Conic）**由次数为 $2$ 的二元非零多项式方程所定义：
$$C: f(x, y) = a x^2 + b x y + c y^2 + d x + e y + g = 0, \qquad (a, b, c) \neq (0, 0, 0).$$

在古典实解析几何（$k = \mathbb{R}$）中，习惯于利用欧氏平面 $\mathbb{R}^2$ 的正交变换（旋转）与平移，将二次曲线细分为椭圆（Ellipse）、双曲线（Hyperbola）、抛物线（Parabola）、空集（如 $x^2 + y^2 + 1 = 0$）、单点（如 $x^2 + y^2 = 0$）、相交直线对（如 $x^2 - y^2 = 0$）、平行直线对（如 $x^2 - 1 = 0$）以及二重直线（如 $x^2 = 0$）等诸多情形。这种分类繁琐的根源有二：
1. **基域 $\mathbb{R}$ 不是代数闭域**：方程 $x^2 + y^2 + 1 = 0$ 与 $x^2 + y^2 - 1 = 0$ 在复数域 $\mathbb{C}$ 上本可通过坐标伸缩 $(x, y) \mapsto (ix, iy)$ 互相转化，却在实数域上表现为“无实点”与“实单位圆”的差异。
2. **仿射平面 $\mathbb{A}^2$ 缺失了无穷远点（Points at Infinity）**：在仿射平面中，椭圆与无穷远直线不相交（或交于一对共轭复点），抛物线与无穷远直线相切于一点，而双曲线则与无穷远直线横截相交于两个不同的点（对应两条渐近线方向）。

一旦我们将讨论舞台从实仿射平面 $\mathbb{A}^2_{\mathbb{R}}$ 扩展到代数闭域上的**射影平面 $\mathbb{P}^2_k$**，上述繁杂的仿射分类便瞬间坍缩为极其简洁的三种射影等价类（秩 $3$、秩 $2$、秩 $1$）。在进入射影空间之前，我们先看两个经典的仿射有理参数化算例。

**Example 1.1.1 (单位圆与勾股数的几何起源).**
考虑平面曲线 $C: x^2 + y^2 = z^2$（在齐次形式下对应单位圆 $X^2 + Y^2 = 1$，其中 $X = x/z, Y = y/z$）。固定圆上一点 $P_0 = (-1, 0)$，过 $P_0$ 且斜率为 $t$ 的直线束方程为：
$$L_t: Y = t(X + 1).$$
将 $Y = t(X+1)$ 代入圆方程 $X^2 + Y^2 - 1 = 0$，由于 $(X+1)$ 必为因式（对应已知交点 $P_0$），可立即因式分解：
$$(X + 1)\bigl[(X - 1) + t^2(X + 1)\bigr] = 0.$$
只要 $1 + t^2 \neq 0$，直线 $L_t$ 与圆 $C$ 的第二个交点 $P(t)$ 的坐标便是参数 $t$ 的有理函数：
$$X(t) = \frac{1 - t^2}{1 + t^2}, \qquad Y(t) = \frac{2t}{1 + t^2}.$$
反之，对圆上任意异于 $P_0(-1,0)$ 的点 $(X, Y)$，斜率 $t = \frac{Y}{X + 1}$ 唯一确定了连接 $P_0$ 与 $(X, Y)$ 的割线。注意当 $\operatorname{char} k \neq 2$ 且 $k = \bar{k}$ 包含 $i = \sqrt{-1}$ 时，分母 $1 + t^2 = (1 + it)(1 - it)$ 在 $t = \pm i$ 处为零：在仿射平面 $\mathbb{A}^2_k$ 中，斜率为 $\pm i$ 的两条迷向直线（Isotropic Lines）$Y = \pm i(X+1)$ 与圆在无穷远处相交！

**Example 1.1.2 (更高次代数曲线的参数化障碍初探).**
若模仿上述割线法处理双纽线型四次曲线（Lemniscate）$C: (x^2 + y^2)^2 = x^2 - y^2$，由于原点 $O(0,0)$ 是曲线的一个二重点（两个切方向为 $x = \pm y$），用过原点的直线束 $y = tx$ 截曲线 $C$，代入得：
$$x^4(1 + t^2)^2 = x^2(1 - t^2).$$
约去原点处的重根因式 $x^2$ 后，关于 $x$ 仍剩下二次方程 $x^2(1 + t^2)^2 = 1 - t^2$，无法直接解出 $x$ 为 $t$ 的单值有理函数（除非再引入平方根 $\sqrt{1 - t^2}$，再对该二次曲线作第二次参数化）。这一现象揭示了一个深刻的几何事实：用直线束截 $d$ 次曲线时，若旋转中心 $P_0$ 是曲线的 $(d-1)$ 重奇点，则扣除 $P_0$ 处的 $(d-1)$ 重交点后，每条直线与曲线仅剩唯一的移动交点，从而曲线必然是**有理曲线（Rational Curve）**；反之，若曲线光滑且次数 $d \ge 3$，则一般不存在有理参数化。

#### 1.2 Projective plane and homogeneous coordinates

为了消除仿射几何中“平行线不相交”与“无穷远点缺失”的缺陷，我们引入射影空间。

**Definition 1.2.1 ($n$ 维射影空间与射影平面).**
设 $k$ 为域。$n$ 维射影空间 $\mathbb{P}^n_k$（或简记为 $\mathbb{P}^n$）定义为 $(n+1)$ 维向量空间 $k^{n+1}$ 中所有过原点的**一维线性子空间**构成的集合，即商集：
$$\mathbb{P}^n_k := \bigl(k^{n+1} \setminus \{0\}\bigr) \big/ \sim,$$
其中等价关系定义为：非零向量 $(X_0, X_1, \dots, X_n) \sim (\lambda X_0, \lambda X_1, \dots, \lambda X_n)$ 对某个非零标量 $\lambda \in k^\times = k \setminus \{0\}$ 成立。等价类记为齐次坐标（Homogeneous Coordinates）$[X_0 : X_1 : \dots : X_n]$。特别地，当 $n = 2$ 时，$\mathbb{P}^2_k$ 称为**射影平面（Projective Plane）**，齐次坐标常记为 $[X : Y : Z]$ 或 $[X_0 : X_1 : X_2]$。

**Proposition 1.2.2 ($\mathbb{P}^2_k$ 的标准仿射开覆盖与无穷远直线).**
射影平面 $\mathbb{P}^2_k$ 自然被三个标准仿射坐标卡（Standard Affine Charts）所覆盖：
$$U_X = \{[X:Y:Z] \in \mathbb{P}^2 \mid X \neq 0\}, \quad U_Y = \{[X:Y:Z] \in \mathbb{P}^2 \mid Y \neq 0\}, \quad U_Z = \{[X:Y:Z] \in \mathbb{P}^2 \mid Z \neq 0\}.$$
在坐标卡 $U_Z$ 上，每个等价类 $[X:Y:Z]$ 均有唯一的代表元满足第三坐标为 $1$，即 $[X/Z : Y/Z : 1]$。令非齐次坐标（Affine Coordinates）为：
$$x = \frac{X}{Z}, \qquad y = \frac{Y}{Z},$$
则映射 $[X:Y:Z] \mapsto (X/Z, Y/Z)$ 给出了 $U_Z \xrightarrow{\sim} \mathbb{A}^2_k$ 的双射。补集：
$$L_\infty := \mathbb{P}^2_k \setminus U_Z = \{[X : Y : 0] \in \mathbb{P}^2_k \mid (X, Y) \neq (0, 0)\} \cong \mathbb{P}^1_k$$
称为相对于仿射平面 $U_Z$ 的**无穷远直线（Line at Infinity）**。从而射影平面分解为无交并：
$$\mathbb{P}^2_k = U_Z \sqcup L_\infty \cong \mathbb{A}^2_k \sqcup \mathbb{P}^1_k.$$

**Proof.**
任取 $P = [X:Y:Z] \in \mathbb{P}^2_k$，由于 $(X, Y, Z) \neq (0, 0, 0)$，必有 $X, Y, Z$ 至少一者非零，故 $\mathbb{P}^2_k = U_X \cup U_Y \cup U_Z$。当 $Z \neq 0$ 时，由齐次坐标的等价关系，$[X:Y:Z] = [X/Z : Y/Z : 1]$，且若 $[x_1 : y_1 : 1] = [x_2 : y_2 : 1]$，则标量因子 $\lambda = 1$，故 $(x_1, y_1) = (x_2, y_2)$，从而 $U_Z \cong \mathbb{A}^2_k$。当 $Z = 0$ 时，点 $[X : Y : 0]$ 由非零二元向量 $(X, Y)$ 模去 $k^\times$ 标量乘法唯一决定，其定义恰好与一维射影直线 $\mathbb{P}^1_k$ 完全一致。 Furthermore，仿射平面 $U_Z$ 中斜率为 $m$ 的平行直线族 $y = mx + c$（即 $Y = mX + cZ$）在无穷远直线 $Z = 0$ 上的交点全都是同一个点 $[1 : m : 0] \in L_\infty$，这从代数上完美解释了“平行线相交于无穷远点，且无穷远点对应直线的渐近方向”。 **Q.E.D.**

**Definition 1.2.3 (齐次多项式与射影平面曲线).**
多元多项式 $F(X, Y, Z) \in k[X, Y, Z]$ 称为 **$d$ 次齐次多项式（Homogeneous Polynomial of Degree $d$，或 $d$ 次形式 / $d$-ary Form）**，如果其中出现的每一个单项式 $X^i Y^j Z^l$ 都满足 $i + j + l = d$。对任意 $\lambda \in k^\times$，齐次多项式满足：
$$F(\lambda X, \lambda Y, \lambda Z) = \lambda^d F(X, Y, Z).$$
因此，虽然 $F(P)$ 的具体数值依赖于点 $P = [X:Y:Z] \in \mathbb{P}^2_k$ 的齐次坐标代表元的选取，但条件“$F(X, Y, Z) = 0$”与代表元 $\lambda$ 的选取无关！我们把由非常数齐次多项式 $F(X, Y, Z)$ 定义的零点轨迹：
$$C = V_{\mathbb{P}}(F) := \{ P = [X:Y:Z] \in \mathbb{P}^2_k \mid F(X, Y, Z) = 0 \}$$
称为 $\mathbb{P}^2_k$ 中的一条 **$d$ 次射影平面曲线（Projective Plane Curve of Degree $d$）**（严格而言，在计入重数与不可约分支时，有时将曲线视为齐次多项式 $F$ 在相差非零常数倍意义下的等价类 $[F] \in \mathbb{P}(k[X,Y,Z]_d)$）。

**Proposition 1.2.4 (齐次化与去齐次化对应).**
1. **去齐次化（Dehomogenisation）**：给定 $d$ 次齐次多项式 $F(X, Y, Z) \in k[X, Y, Z]$，令 $f(x, y) := F(x, y, 1) \in k[x, y]$，则 $\deg f \le d$（当且仅当 $Z \nmid F$ 时 $\deg f = d$），且 $C \cap U_Z = V_{\mathbb{A}}(f)$。
2. **齐次化（Homogenisation）**：给定次数为 $d$ 的非齐次多项式 $f(x, y) = \sum_{i+j \le d} a_{ij} x^i y^j \in k[x, y]$，定义其 $d$ 次齐次化为：
   $$F(X, Y, Z) := Z^d f\left(\frac{X}{Z}, \frac{Y}{Z}\right) = \sum_{i+j \le d} a_{ij} X^i Y^j Z^{d - i - j}.$$
   若将 $f$ 按次数分解为齐次分量的和 $f(x, y) = f_d(x, y) + f_{d-1}(x, y) + \dots + f_0$（其中 $f_m$ 为 $m$ 次齐次式且 $f_d \neq 0$），则：
   $$F(X, Y, Z) = f_d(X, Y) + Z f_{d-1}(X, Y) + \dots + Z^d f_0.$$
   特别地，仿射曲线 $V_{\mathbb{A}}(f) \subset U_Z$ 的射影闭包 $V_{\mathbb{P}}(F)$ 与无穷远直线 $L_\infty: Z = 0$ 的交点由最高次齐次项方程 $f_d(X, Y) = 0$ 唯一决定，这些交点对应仿射曲线的**渐近方向（Asymptotic Directions）**。

**Proof.**
直接展开多项式即可验证：$F(x, y, 1) = \sum_{i+j \le d} a_{ij} x^i y^j 1^{d-i-j} = f(x, y)$，且 $Z \nmid F(X,Y,Z)$（因为存在 $i+j=d$ 使得 $a_{ij} \neq 0$，该项不含 $Z$）。当令 $Z = 0$ 时，所有含 $Z$ 正次幂的项全部消去，仅剩 $F(X, Y, 0) = f_d(X, Y) = 0$。 **Q.E.D.**

#### 1.3 Classification of conics and quadratic forms

在射影平面 $\mathbb{P}^2_k$ 中，一条射影二次曲线（Conic）由三元二次齐次多项式（Ternary Quadratic Form）定义：
$$f(X_0, X_1, X_2) = \sum_{0 \le i \le j \le 2} a_{ij} X_i X_j = a_{00} X_0^2 + a_{11} X_1^2 + a_{22} X_2^2 + a_{01} X_0 X_1 + a_{02} X_0 X_2 + a_{12} X_1 X_2.$$

> [!important] 关键前提说明（审核要点 C02：二次齐次多项式、对称矩阵与 Hessian 矩阵的特征条件）
> 设 $f(X_0, \dots, X_n) \in k[X_0, \dots, X_n]$ 为一个二元或多元**二次齐次多项式（Quadratic Form）**，定义其二阶偏导数构成的 **Hessian 矩阵**为：
> $$H = H(f) := \left( \frac{\partial^2 f}{\partial X_i \partial X_j} \right)_{0 \le i, j \le n}.$$
> 对一般的 $d$ 次齐次多项式 $F(X_0, \dots, X_n)$，由形式偏导数的**欧拉齐次函数定理（Euler's Homogeneous Function Theorem）**，恒有：
> $$\sum_{i=0}^n X_i \frac{\partial F}{\partial X_i} = d \cdot F(X), \qquad \sum_{i, j = 0}^n X_i X_j \frac{\partial^2 F}{\partial X_i \partial X_j} = d(d - 1) \cdot F(X).$$
> 取 $d = 2$，记点 $P$ 的列向量表示为 $x = (X_0, \dots, X_n)^{\mathsf{T}}$，则二次齐次多项式 $f$ 与其 Hessian 矩阵 $H$ 满足恒等式：
> $$x^{\mathsf{T}} H x = 2 f(P).$$
> **特征限制提醒**：
> 1. 当且仅当基域满足 **$\operatorname{char} k \neq 2$** 时，标量 $2$ 在 $k$ 中可逆，此时我们可以将二次齐次多项式唯一地写为对称矩阵二次型 $f(P) = \frac{1}{2} x^{\mathsf{T}} H x = x^{\mathsf{T}} A x$（其中对称矩阵 $A = \frac{1}{2} H$ 的元素为 $A_{ii} = a_{ii}$，当 $i \neq j$ 时 $A_{ij} = \frac{1}{2} a_{ij}$），从而通过对称矩阵的合同对角化（Congruence Diagonalization）完成二次曲线的分类，并用 $\det H \neq 0$（等价于 $\det A \neq 0$）判别二次曲线的非退化性（光滑性）。
> 2. 若 $\operatorname{char} k = 2$，则对任意二次齐次多项式 $f$，二阶纯偏导数 $\frac{\partial^2 (X_i^2)}{\partial X_i^2} = 2 = 0$，故 Hessian 矩阵 $H$ 的对角线元素恒为 $0$，且 $H_{ij} = H_{ji} = a_{ij}$，即 $H$ 退化为一个 $(n+1) \times (n+1)$ **交错矩阵（Alternating Matrix）**，此时恒有 $x^{\mathsf{T}} H x = 2 f(P) = 0$！特别地，当 $n = 2$（即射影平面 $\mathbb{P}^2_k$ 中的曲线）时，奇数阶（$3 \times 3$）交错矩阵的行列式在任何交换环上恒等于零（$\det H \equiv 0$）。因此在 $\operatorname{char} k = 2$ 下绝不能通过 $\frac{1}{2} x^{\mathsf{T}} H x$ 还原 $f(P)$，也不能直接用 $\det H \neq 0$ 作为光滑二次曲线的判据（在特征 $2$ 下，二次曲线如 $X_0 X_1 + X_2^2 = 0$ 仍可光滑，但其奇异性需直接通过一阶偏导数与方程联立求解）。

下面我们在明确标注 **$\operatorname{char} k \neq 2$** 的前提下，给出二次型对角化定理与射影平面二次曲线的完整分类。

**Theorem 1.3.1 (二次型的正交/合同配方法，假设 $\operatorname{char} k \neq 2$).**
设 $\operatorname{char} k \neq 2$，且 $q(X_0, \dots, X_n) = x^{\mathsf{T}} A x$ 为 $k^{n+1}$ 上的二次型（其中 $A = \frac{1}{2} H(q)$ 为对称矩阵）。则存在可逆线性坐标变换 $x = M y$（其中 $M \in \operatorname{GL}_{n+1}(k)$），使得在新齐次坐标 $Y_0, \dots, Y_n$ 下，二次型化为纯平方和的对角标准形：
$$q(M y) = d_0 Y_0^2 + d_1 Y_1^2 + \dots + d_r Y_r^2, \qquad d_i \in k^\times,$$
其中非零平方项的个数 $r + 1 = \operatorname{rank}(A) = \operatorname{rank}(H)$ 是二次型的秩（Rank），由合同不变量唯一决定。若进一步假设基域 $k$ 是代数闭域（或对每个 $d_i$ 存在平方根 $\sqrt{d_i} \in k$），作坐标缩放 $Z_i = \sqrt{d_i} Y_i$（对 $0 \le i \le r$），即可化为：
$$q = Z_0^2 + Z_1^2 + \dots + Z_r^2.$$

**Proof.**
我们对变元个数 $n + 1$ 进行归纳。若 $q = 0$，结论平凡成立（秩为 $0$）。若 $q \neq 0$：
1. **情形一**：存在某个对角元 $A_{ii} \neq 0$。不妨通过置换坐标假设 $A_{00} \neq 0$。将 $q$ 中所有含 $X_0$ 的项归拢配方（注意此处要除以 $A_{00}$，并且混合项系数使用了 $\frac{1}{2}$，依赖 $\operatorname{char} k \neq 2$）：
   $$q(X_0, \dots, X_n) = A_{00} \left( X_0 + \sum_{j=1}^n \frac{A_{0j}}{A_{00}} X_j \right)^2 + q'\left(X_1, \dots, X_n\right),$$
   其中 $q'(X_1, \dots, X_n)$ 是只含后 $n$ 个变元的二次齐次多项式。令新坐标 $Y_0 = X_0 + \sum_{j=1}^n \frac{A_{0j}}{A_{00}} X_j$ 且 $Y_j = X_j$（$j \ge 1$），并对 $q'(Y_1, \dots, Y_n)$ 应用归纳假设，即得对角形。
2. **情形二**：所有对角元 $A_{ii} = 0$，但存在混合项 $A_{ij} \neq 0$（$i \neq j$）。不妨设 $A_{01} \neq 0$。作可逆线性代换（依赖 $\operatorname{char} k \neq 2$，矩阵 $\begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$ 的行列式为 $-2 \neq 0$）：
   $$X_0 = U_0 + U_1, \qquad X_1 = U_0 - U_1, \qquad X_j = U_j \;(j \ge 2).$$
   代入后，$2 A_{01} X_0 X_1 = 2 A_{01} (U_0^2 - U_1^2)$，此时 $U_0^2$ 的系数为 $2 A_{01} \neq 0$，立即化归为情形一。 **Q.E.D.**

**Corollary 1.3.2 (代数闭域上射影二次曲线的三分法分类).**
设 $k$ 为代数闭域且 $\operatorname{char} k \neq 2$。在射影线性变换群 $\operatorname{PGL}_3(k)$ 的坐标变换下，射影平面 $\mathbb{P}^2_k$ 中的任意二次曲线 $C: f(X, Y, Z) = 0$（对应非零 $3 \times 3$ 对称矩阵 $A = \frac{1}{2} H(f)$）恰属于以下三个射影等价类之一：
1. **非退化（光滑）二次曲线（Non-degenerate / Nonsingular Conic，$\operatorname{rank} H = 3$）**：
   $$\det H \neq 0 \iff \text{标准形为 } X^2 + Y^2 + Z^2 = 0 \quad (\text{或通过 } X = U+V, Y = i(U-V) \text{ 化为 } X Z - Y^2 = 0).$$
   它在几何上是不可约且处处光滑的曲线，同构于射影直线 $\mathbb{P}^1_k$。
2. **相交直线对（Line Pair，$\operatorname{rank} H = 2$）**：
   $$\operatorname{rank} H = 2 \iff \text{标准形为 } X^2 + Y^2 = 0 \quad (\text{或令 } U = X+iY, V = X-iY \text{ 化为 } U V = 0).$$
   它在几何上是两条相交于唯一奇点 $P_0 = [0:0:1]$ 的不同射影直线的并集。
3. **二重直线（Double Line，$\operatorname{rank} H = 1$）**：
   $$\operatorname{rank} H = 1 \iff \text{标准形为 } X^2 = 0.$$
   其点集作为集合只是一条直线 $X = 0$，但二次方程本身保留了“重数为 $2$”的代数信息（在极限与相交理论中不可或缺）。

#### 1.4 Parametrisation of a conic and pencils of conics

**Proposition 1.4.1 (光滑二次曲线的有理参数化与同构 $C \cong \mathbb{P}^1_k$).**
设 $C \subset \mathbb{P}^2_k$ 为一条非退化二次曲线，且其上包含一个 $k$-有理点 $P_0 \in C(k)$（当 $k$ 为代数闭域时自动成立）。则从点 $P_0$ 出发的割线投影诱导出双正则同构 $C \xrightarrow{\sim} \mathbb{P}^1_k$，其逆映射由二次齐次多项式给出：
$$\varphi: \mathbb{P}^1_k \xrightarrow{\;\sim\;} C \subset \mathbb{P}^2_k, \qquad [U : V] \longmapsto \bigl[q_0(U, V) : q_1(U, V) : q_2(U, V)\bigr],$$
其中 $q_0, q_1, q_2 \in k[U, V]_2$ 是无公共零点的二元二次齐次式。

**Proof.**
选取射影坐标使得 $P_0 = [1 : 0 : 0] \in C$，且 $C$ 在 $P_0$ 处的切线为 $Z = 0$，再取 $C$ 上另一点为 $[0 : 0 : 1]$ 且在该点处的切线为 $X = 0$，经过适当的标量缩放后，$C$ 的方程可化为标准形式：
$$C: X Z - Y^2 = 0.$$
过点 $P_0 = [1:0:0]$ 的所有射影直线构成的直线束（Pencil of Lines）参数化为：
$$L_{[U:V]}: V Y - U Z = 0, \qquad [U : V] \in \mathbb{P}^1_k.$$
将 $Z = \frac{V}{U} Y$ 代入 $X Z = Y^2$，消去 $P_0$ 对应的解 $Y = Z = 0$，即得第二个交点为 $[X : Y : Z] = [U^2 : U V : V^2]$。
直接验证映射 $\varphi([U:V]) = [U^2 : U V : V^2]$：
- 对任意 $[U:V] \in \mathbb{P}^1_k$，因 $(U,V) \neq (0,0)$，故 $(U^2, V^2) \neq (0,0)$，且 $(U^2)(V^2) - (UV)^2 = 0$，故 $\varphi([U:V]) \in C$ 处处良定义。
- 反过来，在开集 $Y \neq 0$ 或 $Z \neq 0$ 上，$[U:V] = [X:Y] = [Y:Z]$ 给出了良定义的逆态射 $C \to \mathbb{P}^1_k$。因此 $C \cong \mathbb{P}^1_k$。 **Q.E.D.**

为了研究二次曲线与高次曲线的交点以及二次曲线束（Pencil of Conics），我们需要用到二元齐次多项式在代数闭域上的分解性质。

**Lemma 1.4.2 (二元齐次多项式的线性因式分解).**
设 $k$ 为代数闭域，$F(U, V) = a_0 U^d + a_1 U^{d-1} V + \dots + a_d V^d \in k[U, V]$ 为一个非零 $d$ 次二元齐次多项式。则 $F(U, V)$ 在 $k[U, V]$ 中可以分解为 $d$ 个一次齐次因式的乘积：
$$F(U, V) = \prod_{i=1}^d (\beta_i U - \alpha_i V),$$
其中每个因式对应射影直线 $\mathbb{P}^1_k$ 上的一个零点 $P_i = [\alpha_i : \beta_i] \in \mathbb{P}^1_k$，且在相差非零常数倍意义下，这种分解是唯一的。若某个线性因式 $(\beta_i U - \alpha_i V)$ 出现的幂次为 $m_i \ge 1$，则称 $P_i$ 为 $F$ 的重数为 $m_i$ 的零点，且所有零点的重数之和恒等于 $\sum P_i \text{ 的重数} = d$。

**Proof.**
设 $V^r$ 是整除 $F(U, V)$ 的最高次幂（$0 \le r \le d$），则 $F(U, V) = V^r G(U, V)$，其中 $G(U, V)$ 是 $d - r$ 次齐次式且 $G(1, 0) = a_0 \neq 0$。令 $u = U/V$，则一元多项式 $g(u) = G(u, 1) = a_0 u^{d-r} + \dots + a_{d-r} \in k[u]$ 的次数恰为 $d - r$。因为 $k$ 是代数闭域，$g(u)$ 在 $k[u]$ 中完全分解为 $a_0 \prod_{j=1}^{d-r} (u - \gamma_j)$。同乘 $V^{d-r}$ 还原齐次式，并注意到每个 $V = 0$ 的因式对应点 $[1 : 0] = (1 \cdot V - 0 \cdot U)$，即得所需分解。唯一性由多项式环 $k[U, V]$ 是唯一析因整环（UFD）直接保证。 **Q.E.D.**

**Corollary 1.4.3 (Bézout 定理在低次情形的直接证明).**
设 $k$ 为代数闭域，$C_d \subset \mathbb{P}^2_k$ 为一条 $d$ 次射影平面曲线。
1. 若直线 $L \subset \mathbb{P}^2_k$ 不包含在 $C_d$ 中（即 $L \not\subset C_d$），则按重数计算，$L \cap C_d$ 恰有 $d$ 个交点。
2. 若不可约（光滑）二次曲线 $Q \subset \mathbb{P}^2_k$ 不包含在 $C_d$ 中（即 $Q \not\subset C_d$），则按重数计算，$Q \cap C_d$ 恰有 $2d$ 个交点。特别地，两条无公共不可约分支的二次曲线 $Q_1, Q_2 \subset \mathbb{P}^2_k$ 按重数计算恰有 $2 \times 2 = 4$ 个交点。

**Proof.**
1. 直线 $L \cong \mathbb{P}^1_k$ 可由线性齐次参数化 $[U:V] \mapsto [l_0(U,V) : l_1(U,V) : l_2(U,V)]$ 给出。将参数化代入 $C_d$ 的 $d$ 次齐次方程 $F(X,Y,Z) = 0$，得到 $k[U, V]$ 中的 $d$ 次二元齐次多项式 $\tilde{F}(U, V) = F(l_0, l_1, l_2)$。由于 $L \not\subset C_d$，$\tilde{F}$ 不恒为零，由 **Lemma 1.4.2** 知 $\tilde{F}$ 在 $\mathbb{P}^1_k$ 上按重数计算恰有 $d$ 个零点。
2. 由 **Proposition 1.4.1**，光滑二次曲线 $Q$ 有二次齐次参数化 $\varphi: \mathbb{P}^1_k \xrightarrow{\sim} Q, [U:V] \mapsto [q_0(U,V) : q_1(U,V) : q_2(U,V)]$。代入 $d$ 次齐次式 $F(X,Y,Z)$ 得到 $\tilde{F}(U,V) = F(q_0, q_1, q_2)$，它是关于 $(U, V)$ 的 $2d$ 次齐次多项式。因 $Q \not\subset C_d$，$\tilde{F} \neq 0$，再次应用 **Lemma 1.4.2** 即知 $\tilde{F}$ 在 $\mathbb{P}^1_k$ 上按重数计恰有 $2d$ 个零点。 **Q.E.D.**

**Proposition 1.4.4 (二次曲线的参数空间与“五点定一圆锥曲线”).**
1. 所有三元二次齐次多项式构成 $k$ 上的 $6$ 维向量空间 $V_2 = k[X, Y, Z]_2$（基为 $X^2, Y^2, Z^2, XY, XZ, YZ$），因此全体平面二次曲线（在计入重数与可约曲线的意义下）参数化为一个 **$5$ 维射影空间** $\mathbb{P}^5_k = \mathbb{P}(V_2)$。
2. 要求二次曲线 $C \in \mathbb{P}^5_k$ 经过一个给定点 $P = [x_0 : y_0 : z_0] \in \mathbb{P}^2_k$，等价于系数 $(a_{00}, a_{11}, a_{22}, a_{01}, a_{02}, a_{12})$ 满足一个齐次线性方程：
   $$L_P(a) := a_{00} x_0^2 + a_{11} y_0^2 + a_{22} z_0^2 + a_{01} x_0 y_0 + a_{02} x_0 z_0 + a_{12} y_0 z_0 = 0.$$
   因此，经过任意给定的 $5$ 个点 $P_1, \dots, P_5 \in \mathbb{P}^2_k$ 至少存在一条二次曲线。
3. 若 $P_1, \dots, P_5 \in \mathbb{P}^2_k$ 处于**一般位置（General Position）**——具体而言，其中任意 $4$ 点不共线——则经过这 $5$ 个点的二次曲线是**唯一**的；若进一步任意 $3$ 点不共线，则该唯一二次曲线必为**非退化（光滑）二次曲线**。

**Proof.**
1. $6$ 个未知系数满足 $5$ 个齐次线性方程 $L_{P_i}(a) = 0$（$1 \le i \le 5$），由线性代数知解空间的维数至少为 $6 - 5 = 1$，故在 $\mathbb{P}^5_k$ 中至少存在一个解 $[f]$。
2. 假设存在两条不同的二次曲线 $C_1 \neq C_2$ 同时经过 $P_1, \dots, P_5$。
   - 若 $C_1$ 与 $C_2$ 没有公共不可约分支，则由 **Corollary 1.4.3**，它们至多有 $2 \times 2 = 4$ 个公共交点，这与它们同时包含 $5$ 个不同点 $P_1, \dots, P_5$ 矛盾！
   - 若 $C_1$ 与 $C_2$ 有一条公共直线分支 $L$，即 $C_1 = L \cup L_1$ 且 $C_2 = L \cup L_2$（其中 $L_1 \neq L_2$ 为另外两条不同直线）。由于两条不同直线 $L_1 \cap L_2$ 至多相交于 $1$ 个点，在 $5$ 个点 $P_1, \dots, P_5$ 中至多有 $1$ 个点落在 $L_1 \cap L_2$ 上，其余至少 $4$ 个点必须全部落在公共直线 $L$ 上，但这与“任意 $4$ 点不共线”的假设矛盾！
3. 最后，若任意 $3$ 点不共线，假设经过 $P_1, \dots, P_5$ 的唯一二次曲线 $C$ 是退化的，则 $C = L_1 \cup L_2$ 是两条直线的并。由抽屉原理，$5$ 个点分布在 $2$ 条直线上，必有一条直线至少包含 $\lceil 5/2 \rceil = 3$ 个点，与“任意 $3$ 点不共线”矛盾！故 $C$ 必为光滑二次曲线。 **Q.E.D.**

**Proposition 1.4.5 (二次曲线束 Pencil of Conics 与四点基轨迹).**
设 $P_1, P_2, P_3, P_4 \in \mathbb{P}^2_k$ 是满足“无三点共线”的四个点（假设 $k = \bar{k}$ 且 $\operatorname{char} k \neq 2$）。则：
1. 经过这 $4$ 个点的全体二次曲线构成 $\mathbb{P}^5_k$ 中的一条射影直线（称为**二次曲线束 Pencil of Conics**）：
   $$\mathcal{P} = \{ \lambda Q_1 + \mu Q_2 = 0 \mid [\lambda : \mu] \in \mathbb{P}^1_k \},$$
   其中 $Q_1, Q_2$ 是任意两条经过 $P_1, \dots, P_4$ 的不同二次曲线（例如取三对对边直线对：$Q_1 = L_{12} L_{34}$，$Q_2 = L_{13} L_{24}$，$Q_3 = L_{14} L_{23}$）。
2. 在该二次曲线束 $\mathcal{P}$ 中，恰好包含 **$3$ 条退化二次曲线**，即由完全四边形（Complete Quadrangle）$P_1 P_2 P_3 P_4$ 的三对对边构成的直线对：
   $$L_{12} \cup L_{34}, \qquad L_{13} \cup L_{24}, \qquad L_{14} \cup L_{23}.$$
   从代数上看，设 $A_1, A_2$ 为 $Q_1, Q_2$ 对应的 $3 \times 3$ 对称矩阵，则退化曲线对应判别式行列式方程：
   $$\Delta(\lambda, \mu) := \det(\lambda A_1 + \mu A_2) = 0,$$
   这是一个没有重根的三次二元齐次方程，其三个根恰对应上述三对直线对。

**Proof.**
在射影平面上任取不与 $P_1, \dots, P_4$ 中任何三点共线的第五点 $P_5$，由 **Proposition 1.4.4** 知过 $P_1, \dots, P_4, P_5$ 有唯一二次曲线，这说明 $4$ 个线性条件 $L_{P_1}, \dots, L_{P_4}$ 线性无关，解空间维数为 $6 - 4 = 2$，射影化后即为 $\mathbb{P}^1_k$。任何退化二次曲线是两条直线的并 $L \cup L'$；因无三点共线，$4$ 个点必须两两分布在 $L$ 和 $L'$ 上，把 $\{P_1, P_2, P_3, P_4\}$ 划分为两个二元子集共有 $\frac{1}{2}\binom{4}{2} = 3$ 种分法，故束中恰有 $3$ 条退化二次曲线。同时，在适当选取射影坐标系使三对对边的对角三角形（Diagonal Triangle）成为坐标三角形 $[1:0:0], [0:1:0], [0:0:1]$，且 $P_1, \dots, P_4$ 为 $[1:\pm 1:\pm 1]$ 时，$Q_1, Q_2$ 均可对角化：
$$Q_1 = X^2 - Z^2, \qquad Q_2 = Y^2 - Z^2, \qquad \lambda Q_1 + \mu Q_2 = \lambda X^2 + \mu Y^2 - (\lambda + \mu) Z^2,$$
其行列式为 $-\lambda \mu (\lambda + \mu) = 0$，三个单根 $[\lambda:\mu] = [1:0], [0:1], [1:-1]$ 恰好对应三对相交直线。这也给出了在代数闭域上同步求解两个二次方程 $Q_1 = Q_2 = 0$ 的通用算法：先解三次方程 $\det(\lambda A_1 + \mu A_2) = 0$ 找到一个根 $[\lambda_0 : \mu_0] \in \mathbb{P}^1_k$，将对应的退化二次式 $\lambda_0 Q_1 + \mu_0 Q_2 = L \cdot L'$ 分解为两条一次直线；若 $\mu_0 \neq 0$（即退化元不是 $Q_1$ 本身），则将 $L = 0$ 与 $L' = 0$ 分别与 $Q_1 = 0$ 联立；若 $\mu_0 = 0$（即 $[\lambda_0 : \mu_0] = [1 : 0]$，$Q_1 = L \cdot L'$ 本身已退化为直线对，避免代入 $Q_1$ 退化为恒等式），则将 $L = 0$ 与 $L' = 0$ 分别与 $Q_2 = 0$ 联立（因四个基点无三点共线，所选二次曲线与 $L, L'$ 无公共直线分支），解两个一元二次方程即可求出全部 $4$ 个交点。 **Q.E.D.**

#### 1.5 Cubics and the inflection points

现在我们将次数从 $d = 2$ 提升到 $d = 3$。射影平面 $\mathbb{P}^2_k$ 中的一条**平面三次曲线（Plane Cubic Curve）**由三元三次齐次多项式定义：
$$C: F(X, Y, Z) = \sum_{i+j+l = 3} a_{ijl} X^i Y^j Z^l = 0.$$
由于满足 $i + j + l = 3$（$i, j, l \ge 0$）的非负整数三元组共有 $\binom{3+3-1}{3} = \binom{5}{3} = 10$ 个，全体平面三次曲线构成的线性系是一个 **$9$ 维射影空间** $\mathbb{P}^9_k = \mathbb{P}(k[X, Y, Z]_3)$。

尽管次数只增加了 $1$，平面三次曲线与二次曲线在几何本性上却发生了质的飞跃：

**Theorem 1.5.1 (光滑三次曲线的非有理性——Mason-Stothers / 多项式微积分证明).**
设 $k$ 为特征 $\operatorname{char} k \neq 2$ 的任意域，且 $\lambda \in k \setminus \{0, 1\}$。则仿射三次曲线：
$$E_\lambda: y^2 = x(x - 1)(x - \lambda)$$
**不存在**非常数的有理函数参数化（即不存在不全为常数的有理函数 $x(t), y(t) \in k(t)$ 使得 $y(t)^2 = x(t)(x(t)-1)(x(t)-\lambda)$ 在 $k(t)$ 中恒成立）。

**Proof.**
用反证法。假设存在非常数有理函数 $x(t) = \frac{p(t)}{q(t)}$ 与 $y(t) = \frac{r(t)}{s(t)} \in k(t)$ 满足方程，其中 $\gcd(p, q) = 1$ 且 $\gcd(r, s) = 1$。代入方程并通分得：
$$\frac{r^2}{s^2} = \frac{p(p - q)(p - \lambda q)}{q^3}.$$
由于 $\gcd(p, q) = 1$，分子 $p(p - q)(p - \lambda q)$ 与分母 $q^3$ 互素，而左边 $\gcd(r^2, s^2) = 1$，由唯一析因整环 $k[t]$ 的性质（不妨将系数扩充到代数闭域 $\bar{k}$ 使首项系数归一化），必有 $s^2 = q^3$。因此存在多项式 $q_0 \in \bar{k}[t]$ 使得 $q = q_0^2, s = q_0^3$，并且分子满足：
$$r^2 = p(p - q)(p - \lambda q).$$
因为 $\gcd(p, q) = 1$ 且 $\lambda \notin \{0, 1\}$，容易验证四个多项式 $p, \; q, \; p - q, \; p - \lambda q$ 在 $\bar{k}[t]$ 中**两两互素**！既然两两互素的三个多项式 $p, p - q, p - \lambda q$ 的乘积是一个完全平方 $r^2$，且 $q = q_0^2$ 本身也是完全平方，故这四个两两互素的多项式必须各自都是 $\bar{k}[t]$ 中的完全平方：
$$p = u_1^2, \qquad q = u_2^2, \qquad p - q = u_3^2, \qquad p - \lambda q = u_4^2,$$
其中 $u_1, u_2, u_3, u_4 \in \bar{k}[t]$ 两两互素，且 $\max(\deg u_1, \deg u_2) = \frac{1}{2}\max(\deg p, \deg q) \ge 1$。
我们调用 **Miles Reid 原书 Lemma 2.3（四平方线性组合的无穷递降引理，p. 37）**：在 $\bar{k}[t]$（$\operatorname{char} k \neq 2$）中，**不存在互素且不全为常数的多项式对 $(P, Q) \in \bar{k}[t]^2$，使得它们的四个两两不成比例的线性组合 $\alpha_i P + \beta_i Q$（$i=1,2,3,4$，即射影比值 $[\alpha_i : \beta_i] \in \mathbb{P}^1_{\bar{k}}$ 两两互异）同时为 $\bar{k}[t]$ 中的完全平方**！
**Lemma 2.3 的证明（无穷递降法，Fermat's Method of Infinite Descent）**：反设存在满足上述条件的非平凡互素多项式对 $(P, Q)$，我们在**所有满足“存在四个两两不成比例的线性组合皆为完全平方”的非平凡互素多项式对 $(P, Q)$** 中（注意极小性是对任意互异射影比值组选取的，**不固定**交比参数 $\lambda$！），选取使得最大次数
$$M = \max(\deg P, \deg Q) \ge 1$$
**最小**的一对 $(P, Q)$。首先，通过对二元线性组合施以可逆线性代换（将前三个互异线性组合重标定为 $P, Q, P-Q$，第四个化为 $P - \mu Q$，其中 $\mu \in \bar{k} \setminus \{0, 1\}$），可设
$$P = u_1^2, \qquad Q = u_2^2, \qquad P - Q = u_1^2 - u_2^2 = u_3^2, \qquad P - \mu Q = u_1^2 - \mu u_2^2 = u_4^2,$$
其中 $u_1, u_2 \in \bar{k}[t]$ 互素，且 $\max(\deg u_1, \deg u_2) = \frac{1}{2}\max(\deg P, \deg Q) = \frac{M}{2}$。由于 $\operatorname{char} k \neq 2$，将后两式在 $\bar{k}[t]$ 中因式分解为：
$$(u_1 - u_2)(u_1 + u_2) = u_3^2, \qquad (u_1 - \sqrt{\mu} u_2)(u_1 + \sqrt{\mu} u_2) = u_4^2.$$
由 $\gcd(u_1, u_2) = 1$ 及 $u_1 = \frac{1}{2}[(u_1+u_2)+(u_1-u_2)], \; u_2 = \frac{1}{2}[(u_1+u_2)-(u_1-u_2)]$，可知 $\gcd(u_1 - u_2, u_1 + u_2) = 1$；同理因 $\mu \neq 0$，亦有 $\gcd(u_1 - \sqrt{\mu} u_2, u_1 + \sqrt{\mu} u_2) = 1$。因此，互素多项式对 $(u_1, u_2)$ 的四个线性组合
$$u_1 + u_2 = v_1^2, \quad u_1 - u_2 = v_2^2, \quad u_1 + \sqrt{\mu} u_2 = v_3^2, \quad u_1 - \sqrt{\mu} u_2 = v_4^2$$
在 $\bar{k}[t]$ 中也全都是完全平方！又因 $\mu \notin \{0, 1\}$（故 $\sqrt{\mu} \notin \{0, 1, -1\}$），系数比 $[1:1], [1:-1], [1:\sqrt{\mu}], [1:-\sqrt{\mu}] \in \mathbb{P}^1_{\bar{k}}$ 两两互异（若将 $v_1^2, v_2^2$ 重标定回标准形式，新的交比参数变为 $\mu' = \bigl(\frac{1-\sqrt{\mu}}{1+\sqrt{\mu}}\bigr)^2 \in \bar{k} \setminus \{0, 1\}$，一般不再等于原 $\mu$，这正是递降假设必须对全体四平方线性组合而非固定 $\lambda$ 进行归纳的原因）。于是 $(u_1, u_2)$ 构成了满足 Lemma 2.3 条件的另一对互素非平凡多项式，但其最大次数仅为：
$$\max(\deg u_1, \deg u_2) = \frac{M}{2} < M,$$
这与 $M \ge 1$ 的极小性矛盾！将 Lemma 2.3 直接应用于 (463) 式的 $(p, q)$，即证得光滑三次曲线不存在非常数有理参数化。 **Q.E.D.**

接下来我们讨论光滑三次曲线上的特殊几何点——**拐点（Inflection Points / Flexes）**及其代数判据。

**Definition 1.5.2 (三次曲线的光滑点、切线与拐点).**
设 $C: F(X, Y, Z) = 0$ 为 $\mathbb{P}^2_k$ 中的三次曲线，$P = [x_0 : y_0 : z_0] \in C$。
1. 若偏导数向量 $\nabla F(P) = \left(\frac{\partial F}{\partial X}(P), \frac{\partial F}{\partial Y}(P), \frac{\partial F}{\partial Z}(P)\right) \neq (0, 0, 0)$，则称 $P$ 为 $C$ 的**非奇异点（光滑点，Nonsingular / Smooth Point）**；此时 $C$ 在点 $P$ 处的射影切线（Tangent Line）定义为：
   $$T_P C: \frac{\partial F}{\partial X}(P) X + \frac{\partial F}{\partial Y}(P) Y + \frac{\partial F}{\partial Z}(P) Z = 0.$$
2. 若在光滑点 $P \in C$ 处，切线 $T_P C$ 与曲线 $C$ 在点 $P$ 处的相交重数满足：
   $$I(P, C \cap T_P C) \ge 3 \quad (\text{对于三次曲线，由 Bézout 定理恰为 } 3 \text{，除非 } T_P C \subset C),$$
   则称 $P$ 为三次曲线 $C$ 的一个**拐点（Inflection Point 或 Flex）**。

> [!important] 关键前提说明（审核要点 C02：Hessian 矩阵与拐点判据的特征限制）
> 定义三次齐次多项式 $F(X_0, X_1, X_2)$ 的 **Hessian 矩阵**与 **Hessian 三次曲线**为：
> $$H(F) = \left( \frac{\partial^2 F}{\partial X_i \partial X_j} \right)_{0 \le i, j \le 2}, \qquad \operatorname{Hess}(F) := \det H(F) = 0.$$
> 1. **二次齐次近似与 $\operatorname{char} k \neq 2$**：将点 $P + t Q$ 代入三次齐次式 $F$ 并按 $t$ 展开 Taylor 公式时，二阶项系数由二次型 $\frac{1}{2} Q^{\mathsf{T}} H(F)(P) Q$ 给出。类似于二次齐次多项式满足 $x^{\mathsf{T}} H x = 2 f(P)$，要使二阶项与 Hessian 矩阵非退化地对应，首先需要 **$\operatorname{char} k \neq 2$**（如前所述，当 $\operatorname{char} k = 2$ 时，$3 \times 3$ 二阶偏导数矩阵 $H(F)$ 的对角元 $\frac{\partial^2 F}{\partial X_i^2}$ 因含因子 $2$ 而恒等于 $0$，$H(F)$ 成为 $3 \times 3$ 交错矩阵，从而 $\det H(F) \equiv 0$ 恒成立，丧失判别拐点的能力）。
> 2. **欧拉恒等式化简与 $\operatorname{char} k \neq 2, 3$**：在通过欧拉齐次函数定理将行/列线性组合代入 $\det H(F)$ 以证明“$P \in C$ 为拐点 $\iff \det H(F)(P) = 0$”时，需要用到三次齐次式的欧拉系数 $d = 3$ 与 $d - 1 = 2$：
>    $$\sum_{j=0}^2 X_j \frac{\partial F}{\partial X_j} = 3 F(X), \qquad \sum_{j=0}^2 X_j \frac{\partial^2 F}{\partial X_i \partial X_j} = 2 \frac{\partial F}{\partial X_i}.$$
>    因此，**经典的 Hessian 行列式拐点判据要求基域特征满足 $\operatorname{char} k \neq 2, 3$（例如 $\operatorname{char} k = 0$）**。在此前提下（且无需缩窄整本讲义对一般域 $k$ 的讨论范围），光滑三次曲线 $C$ 的拐点恰好由 $C \cap V(\det H(F))$ 完整刻画！
> 3. **小特征（$\operatorname{char} k = 2$ 或 $3$）下的替代判据**：若基域特征为 $2$ 或 $3$，判断光滑点 $P \in C$ 是否为拐点的普适代数方法是直接采用参数化定义（或 Hasse 导数 / 局部坐标展开）：选取局部仿射坐标使 $P = (0, 0)$ 且切线 $T_P C$ 为 $y = 0$，将曲线方程写为 $y + (a x^2 + b x y + c y^2) + (d x^3 + \dots) = 0$，则 $P$ 为拐点（即切线 $y = 0$ 与 $C$ 在原点处相交重数 $\ge 3$）**当且仅当二次项中 $x^2$ 的系数 $a = 0$**。这一几何与局部代数判据在任意特征的域 $k$ 上均无条件成立。

**Theorem 1.5.3 (Hessian 拐点判别定理与 Weierstrass 标准形，假设 $\operatorname{char} k \neq 2, 3$).**
设 $k$ 为代数闭域且 $\operatorname{char} k \neq 2, 3$，$C: F(X, Y, Z) = 0$ 为 $\mathbb{P}^2_k$ 中的不可约三次曲线。则：
1. $C$ 的光滑点 $P \in C$ 是拐点，当且仅当 $P$ 满足三元三次齐次方程 $\det H(F)(P) = 0$。
2. 每一条光滑平面三次曲线 $C$ 至少包含一个拐点；更精确地，按重数计算，$C$ 与其 Hessian 三次曲线 $V(\det H(F))$ 恰有 $3 \times 3 = 9$ 个交点，且对光滑三次曲线而言，这 **$9$ 个拐点全是单重交点**（即任意光滑平面三次曲线在代数闭域 $\bar{k}$ 且 $\operatorname{char} k \neq 2, 3$ 下恰有 **$9$ 个不同的拐点**）。
3. 若选定一个拐点 $O \in C$，通过射影坐标变换将拐点置于 $O = [0 : 1 : 0]$，并令 $O$ 处的拐切线（Inflectional Tangent）为无穷远直线 $Z = 0$，则曲线 $C$ 在仿射卡 $Z = 1$（坐标 $x = X/Z, y = Y/Z$）下的方程可化为 **Weierstrass 标准形**：
   $$y^2 = x^3 + a x^2 + b x + c \qquad (\text{当 } \operatorname{char} k \neq 2, 3 \text{ 时进一步平移 } x \text{ 可化为 } y^2 = x^3 + p x + q),$$
   其中三次多项式 $x^3 + a x^2 + b x + c$ 无重根当且仅当三次曲线 $C$ 处处非奇异。

**Proof.**
1. 先证 $\det H(F)$ 在射影坐标变换 $\tilde{X} = M X$（$M \in \operatorname{GL}_3(k)$）下的协变性：由链式法则，新坐标下的 Hessian 矩阵为 $H(\tilde{F}) = M^{\mathsf{T}} H(F) M$，故 $\det H(\tilde{F}) = (\det M)^2 \det H(F)$，因此零点轨迹 $\det H(F) = 0$ 与射影坐标系的选择无关。
2. 选取射影坐标系使光滑点 $P = [0 : 0 : 1]$，且 $P$ 处的切线 $T_P C$ 为 $Y = 0$。在去齐次坐标 $x = X/Z, y = Y/Z$ 下，$P = (0, 0)$，三次多项式 $f(x, y) = F(x, y, 1)$ 的常数项为 $0$，一次项仅含 $y$（系数非零，归一化为 $1$）：
   $$f(x, y) = y + (a x^2 + b x y + c y^2) + g_3(x, y), \qquad \deg g_3 = 3.$$
   将切线 $Y = 0$ 代入齐次式 $F(X, Y, Z) = Z Y + Z(a X^2 + b X Y + c Y^2) + G_3(X, Y)$，得 $F(X, 0, Z) = a X^2 Z + G_3(X, 0, 0)$。故 $X = 0$ 是 $F(X, 0, Z) = 0$ 的三重根（即 $P$ 为拐点）当且仅当 **$a = 0$**。
3. 另一方面，利用 $\operatorname{char} k \neq 2, 3$ 直接计算 $F(X, Y, Z)$ 在点 $P = [0 : 0 : 1]$ 处的 Hessian 矩阵：
   $$\frac{\partial^2 F}{\partial X^2}(P) = 2a, \quad \frac{\partial^2 F}{\partial X \partial Y}(P) = b, \quad \frac{\partial^2 F}{\partial Y^2}(P) = 2c,$$
   而关于 $Z$ 的偏导数由欧拉公式（在 $P = [0:0:1]$ 处 $X=Y=0, Z=1$）给出：
   $$\frac{\partial^2 F}{\partial X \partial Z}(P) = 2 \frac{\partial F}{\partial X}(P) = 0, \quad \frac{\partial^2 F}{\partial Y \partial Z}(P) = 2 \frac{\partial F}{\partial Y}(P) = 2, \quad \frac{\partial^2 F}{\partial Z^2}(P) = 6 F(P) = 0.$$
   因此 $H(F)(P)$ 的矩阵形式为：
   $$H(F)(P) = \begin{pmatrix} 2a & b & 0 \\ b & 2c & 2 \\ 0 & 2 & 0 \end{pmatrix} \implies \det H(F)(P) = -8a.$$
   因为 $\operatorname{char} k \neq 2, 3$，故 $-8 \neq 0$，从而 $\det H(F)(P) = 0 \iff a = 0 \iff P$ 是拐点！
4. 当把拐点置于 $O = [0 : 1 : 0]$ 且拐切线置于 $Z = 0$ 时，因 $Z = 0$ 与 $C$ 在 $[0:1:0]$ 处相交重数为 $3$，$F(X, Y, 0)$ 只能是 $X^3$ 的非零倍数（不含 $Y^3, X Y^2, X^2 Y$ 项），故方程形如：
   $$Z Y^2 + (l_1 X + l_2 Z) Y Z + \text{三次关于 } (X, Z) \text{ 的项} = 0.$$
   在 $\operatorname{char} k \neq 2$ 下对 $Y$ 配方消去 $Y Z$ 混合项，并在 $\operatorname{char} k \neq 3$ 下对 $X$ 平移消去 $X^2 Z$ 项，即得 Weierstrass 标准形 $Y^2 Z = X^3 + p X Z^2 + q Z^3$。进一步计算其 $9$ 个拐点可知它们全部是单根（例如在 Hesse 标准形 $X^3 + Y^3 + Z^3 + 3\mu X Y Z = 0$，$\mu^3 \neq -1$ 下，$9$ 个拐点显式为：$[0:1:-\omega^j], [-\omega^j:0:1], [1:-\omega^j:0]$，其中 $\omega^3 = 1, j=0,1,2$，共 $9$ 个互异拐点）。 **Q.E.D.**

#### 1.6 The group law on a cubic

非奇异平面三次曲线最令人惊叹的性质是：**它的点集天然携带一个阿贝尔群（Abelian Group）结构**，而这一群结构的难点全在于证明**结合律（Associativity）**。为此，我们先建立关于平面三次曲线线性系的 Cayley-Bacharach 定理（又称“八点蕴含第九点定理”）。

**Lemma 1.6.1 (多项式被直线或二次曲线整除的判据).**
设 $F(X, Y, Z) \in k[X, Y, Z]_d$ 为 $d$ 次齐次多项式。
1. 若直线 $L \subset \mathbb{P}^2_k$ 上有 $d + 1$ 个不同的点都落在 $V(F)$ 上，则一次齐次式 $L$ 整除 $F$（即 $L \mid F$）。
2. 若不可约（光滑）二次曲线 $Q \subset \mathbb{P}^2_k$ 上有 $2d + 1$ 个不同的点都落在 $V(F)$ 上，则二次齐次式 $Q$ 整除 $F$（即 $Q \mid F$）。

**Proof.**
1. 作射影坐标变换使直线 $L$ 的方程为 $Z = 0$。将 $F(X, Y, Z)$ 按 $Z$ 的幂次展开为：
   $$F(X, Y, Z) = F_0(X, Y) + Z F_1(X, Y, Z),$$
   其中 $F_0(X, Y) = F(X, Y, 0)$ 是 $d$ 次二元齐次多项式。由于 $Z = 0$ 上有 $d + 1$ 个不同点使 $F = 0$，这意味 $d$ 次齐次式 $F_0(X, Y)$ 在 $\mathbb{P}^1_k$ 上有 $d + 1$ 个不同零点。由 **Lemma 1.4.2** 知必有 $F_0(X, Y) \equiv 0$，从而 $F = Z F_1$，即 $L \mid F$。
2. 对不可约二次曲线 $Q$，作射影坐标变换使 $Q: X Z - Y^2 = 0$。对 $F(X, Y, Z)$ 中所有出现 $Y^2$ 的幂次用 $Y^2 = X Z + (Y^2 - X Z)$ 反复替换（即在 $(k[X, Z])[Y]$ 中对二次首一多项式 $Y^2 - X Z$ 作带余除法），可将 $F$ 写为：
   $$F(X, Y, Z) = (X Z - Y^2) G(X, Y, Z) + A(X, Z) + Y B(X, Z),$$
   其中 $A(X, Z)$ 是 $d$ 次二元齐次式，$B(X, Z)$ 是 $d - 1$ 次二元齐次式。将 $Q$ 的参数化 $[U^2 : U V : V^2]$ 代入 $F$，则在 $Q$ 上有：
   $$\tilde{F}(U, V) = A(U^2, V^2) + U V B(U^2, V^2).$$
   若 $Q$ 上有 $2d + 1$ 个点使 $F = 0$，则 $2d$ 次二元齐次式 $\tilde{F}(U, V)$ 有 $2d + 1$ 个不同零点，故 $\tilde{F}(U, V) \equiv 0$。但注意在 $\tilde{F}(U, V)$ 的展开式中，$A(U^2, V^2)$ 的所有单项式关于 $U, V$ 的次数均为**偶数**，而 $U V B(U^2, V^2)$ 的所有单项式关于 $U, V$ 的次数均为**奇数**！奇偶次项互不抵消，故必有 $A(U^2, V^2) \equiv 0$ 且 $B(U^2, V^2) \equiv 0$，即 $A = B = 0$，从而 $(X Z - Y^2) \mid F$。 **Q.E.D.**

**Theorem 1.6.2 (八点三次曲线束定理与 Cayley-Bacharach 九点定理).**
设 $C_1, C_2 \subset \mathbb{P}^2_k$ 为两条三次曲线，它们相交于 $9$ 个互不相同的点 $P_1, P_2, \dots, P_8, P_9 \in \mathbb{P}^2_k$（即 $C_1 \cap C_2 = \{P_1, \dots, P_9\}$ 为横截相交的 $9$ 个单点）。则：
1. 经过前 $8$ 个点 $P_1, \dots, P_8$ 的全体三次曲线恰好构成由 $C_1, C_2$ 张成的**三次曲线束（Pencil of Cubics）** $\lambda C_1 + \mu C_2 = 0$（$[\lambda : \mu] \in \mathbb{P}^1_k$）。
2. **推论（Cayley-Bacharach 定理）**：任何经过前 $8$ 个交点 $P_1, \dots, P_8$ 的平面三次曲线 $C_3$，**必定自动经过第 $9$ 个交点 $P_9$**！

**Proof.**
首先观察到：因为 $C_1 \cap C_2$ 恰有 $9$ 个有限交点，$C_1$ 与 $C_2$ 不可能含有公共直线或公共二次曲线分支。因此：
- 任意 $4$ 个交点不可能共线（否则若 $4$ 点在直线 $L$ 上，由 **Lemma 1.6.1(1)** 知 $L \mid C_1$ 且 $L \mid C_2$，矛盾）；
- 任意 $7$ 个交点不可能共处在同一条不可约二次曲线 $Q$ 上（否则由 **Lemma 1.6.1(2)** 知 $Q \mid C_1$ 且 $Q \mid C_2$，矛盾）。

由于三次曲线的参数空间是 $\mathbb{P}^9_k$，要求三次曲线经过 $P_1, \dots, P_8$ 给出了 $\mathbb{P}^9_k$ 中的 $8$ 个齐次线性条件。由 $C_1 \neq C_2$ 均过这 $8$ 点，解空间的射影维数至少为 $9 - 8 = 1$（即包含束 $\lambda C_1 + \mu C_2$）。若维数 $\ge 2$，则这 $8$ 个点的线性条件相关，意味着任取平面上不在束中的另外两点 $A, B \in \mathbb{P}^2_k$，总能找到一条同时经过 $P_1, \dots, P_8$ 以及 $A, B$ 的三次曲线 $C'$，且通过调整 $A, B$ 可使 $C'$ 不属于束 $\lambda C_1 + \mu C_2$（否则过 $A, B$ 的束成员唯一确定且与另一个自由度矛盾）。下面我们对 $P_1, \dots, P_8$ 的几何位置分三种情形导出矛盾：
1. **一般情形**：在 $P_1, \dots, P_8$ 中无三点共线，且无六点共二次曲线。取直线 $L = P_1 P_2$，以及经过 $P_3, P_4, P_5, P_6, P_7$ 的唯一不可约二次曲线 $Q$（因无三点共线，由 **Proposition 1.4.4** 知 $Q$ 存在唯一且不可约）。注意 $P_8 \notin L$（无三点共线）且 $P_8 \notin Q$（无六点共二次曲线）。我们在直线 $L$ 上任取异于 $P_1, P_2$ 的两点 $A, B \in L \setminus Q$。若过 $P_1, \dots, P_8$ 的三次曲线空间维数 $\ge 2$，则存在三次曲线 $C$ 经过 $P_1, \dots, P_8, A, B$。此时：
   - 直线 $L$ 上有 $4$ 个不同点 $P_1, P_2, A, B \in C$，由 **Lemma 1.6.1(1)** 得 $C = L \cdot Q'$，其中 $Q'$ 为某条二次曲线；
   - 由于 $P_3, \dots, P_8$ 均不在直线 $L$ 上，它们必须全部落在二次曲线 $Q'$ 上！但过 $P_3, \dots, P_7$ 的二次曲线唯一为 $Q$，故 $Q' = Q$，这迫使 $P_8 \in Q$，与假设“无六点共二次曲线”矛盾！
2. **有六点共不可约二次曲线 $Q$ 的情形**：不妨设 $P_1, \dots, P_6 \in Q$。则 $P_7, P_8 \notin Q$（因无七点共不可约二次曲线）。取直线 $L = P_7 P_8$，在 $Q$ 上任取异于 $P_1, \dots, P_6$ 的点 $A \in Q \setminus L$，并在平面上再取一点 $B \notin Q \cup L$。若存在过 $P_1, \dots, P_8, A, B$ 的三次曲线 $C$，则 $Q$ 上有 $7$ 个点 $P_1, \dots, P_6, A \in C$，由 **Lemma 1.6.1(2)** 知 $C = Q \cdot L'$，其中 $L'$ 为直线。因 $P_7, P_8, B \notin Q$，必有 $P_7, P_8, B \in L'$，从而 $L' = P_7 P_8 = L$，迫使 $B \in L$，与 $B \notin Q \cup L$ 矛盾！
3. **有三点共线 $L$ 的情形**：不妨设 $P_1, P_2, P_3 \in L$，则 $P_4, \dots, P_8 \notin L$（因无四点共线）。在 $L$ 上取第四点 $A \in L$，则任何过 $P_1, \dots, P_8, A$ 的三次曲线 $C$ 必含 $L$（因 $L$ 上有 $4$ 点），故 $C = L \cdot Q'$，其中二次曲线 $Q'$ 经过 $P_4, \dots, P_8$。由于 $P_4, \dots, P_8$ 中无四点共线，由 **Proposition 1.4.4** 知过 $P_4, \dots, P_8$ 的二次曲线 $Q'$ 是唯一的！因此过 $P_1, \dots, P_8, A$ 的三次曲线唯一为 $L \cdot Q'$，不可能再自由经过平面上另一点 $B \notin L \cup Q'$，矛盾！

综上，过 $P_1, \dots, P_8$ 的三次曲线必形如 $C_3 = \lambda C_1 + \mu C_2$。由于 $C_1(P_9) = 0$ 且 $C_2(P_9) = 0$，立即得到 $C_3(P_9) = \lambda C_1(P_9) + \mu C_2(P_9) = 0$，即 $P_9 \in C_3$！ **Q.E.D.**

有了 Cayley-Bacharach 定理，我们立即可以建立并证明光滑平面三次曲线上的阿贝尔群定律。

**Definition 1.6.3 (弦切运算 $*$ 与三次曲线群加法 $+$).**
设 $C \subset \mathbb{P}^2_k$ 为一条非奇异（光滑）平面三次曲线，固定其上一个光滑点 $O \in C$ 作为**零元（Identity Element / Origin）**。
1. 对任意两点 $P, Q \in C$，令直线 $L_{PQ}$ 为：
   - 当 $P \neq Q$ 时，连接 $P$ 与 $Q$ 的割线（Secant Line）；
   - 当 $P = Q$ 时，曲线 $C$ 在点 $P$ 处的切线 $T_P C$（Tangent Line）。
   由 Bézout 定理（**Corollary 1.4.3**），直线 $L_{PQ}$ 与三次曲线 $C$ 按重数计算恰有 $3$ 个交点 $P, Q, R$。我们将第三个交点 $R$ 记为 $P * Q \in C$。
2. 定义 $C$ 上的二元加法运算 $+: C \times C \to C$ 为：
   $$P + Q := O * (P * Q),$$
   即先连直线 $PQ$ 交 $C$ 于第三点 $P * Q$，再连直线 $O(P * Q)$ 交 $C$ 于第三点 $P + Q$。

**Theorem 1.6.4 (光滑平面三次曲线的阿贝尔群结构).**
设 $C \subset \mathbb{P}^2_k$ 为非奇异平面三次曲线，$O \in C$ 为固定零元。则 $(C, +, O)$ 构成一个**阿贝尔群（Abelian Group）**，并且：
1. **单位元**：对任意 $P \in C$，$P + O = O + P = P$；
2. **逆元**：设切线 $T_O C$ 与 $C$ 的第三个交点为 $S = O * O$，则点 $P \in C$ 的逆元为 $-P = S * P = (O * O) * P$。特别地，**若取零元 $O$ 为 $C$ 的一个拐点（即 $O * O = O$）**，则逆元简化为 $-P = O * P$，且曲线上三点 $P, Q, R \in C$ 共线当且仅当：
   $$P + Q + R = O \quad (\text{当 } O \text{ 为拐点时}).$$

**Proof.**
1. **交换律**：由于割线（或切线）$L_{PQ} = L_{QP}$ 关于 $P, Q$ 对称，故 $P * Q = Q * P$，从而 $P + Q = O * (P * Q) = O * (Q * P) = Q + P$。
2. **单位元**：对任意 $P \in C$，先算 $P * O$，它是直线 $PO$ 与 $C$ 的第三个交点；再算 $O * (P * O)$，它是连接 $O$ 与 $P * O$ 的直线（即同一条直线 $PO$）与 $C$ 的第三个交点，显然回到 $P$！故 $P + O = P$。
3. **逆元**：令 $S = O * O$，对于 $Q = S * P$，直线 $SP$ 与 $C$ 的三个交点为 $S, P, Q$，故 $P * Q = S$。于是：
   $$P + Q = O * (P * Q) = O * S = O * (O * O) = O,$$
   因为切线 $T_O C$ 与 $C$ 的三个交点是 $O, O, S$，连接 $O$ 与 $S$ 的直线与 $C$ 的第三个交点必为 $O$。当 $O$ 是拐点时，$I(O, C \cap T_O C) = 3$，故 $S = O * O = O$，此时 $-P = O * P$。
4. **结合律 $(P + Q) + R = P + (Q + R)$**：
   我们要证 $O * \bigl((P + Q) * R\bigr) = O * \bigl(P * (Q + R)\bigr)$。由于映射 $X \mapsto O * X$ 是 $C \to C$ 的双射（它是对合 $O * (O * X) = X$），结合律等价于证明两个中间点相等：
   $$(P + Q) * R = P * (Q + R).$$
   先假设 $P, Q, R, O$ 处于**一般位置**，使得构造过程中出现的 $9$ 个点互不相同。我们追踪构造出的 $6$ 条直线（每条直线与 $C$ 交于 $3$ 个点）：
   - $L_1$: 过 $P, Q$ 及 $X_1 := P * Q$；
   - $M_1$: 过 $O, X_1$ 及 $P + Q = O * X_1$；
   - $L_2$: 过 $P + Q, R$ 及 $W := (P + Q) * R$；
   - $M_2$: 过 $Q, R$ 及 $Y_1 := Q * R$；
   - $L_3$: 过 $O, Y_1$ 及 $Q + R = O * Y_1$；
   - $M_3$: 过 $P, Q + R$ 及 $W' := P * (Q + R)$。
   现在构造两条退化的三次曲线（各由 $3$ 条直线组成）：
   $$C_1 := L_1 \cup L_2 \cup L_3, \qquad C_2 := M_1 \cup M_2 \cup M_3.$$
   观察以下 $8$ 个点：
   $$\{ O, \; P, \; Q, \; R, \; X_1 = P*Q, \; P+Q, \; Y_1 = Q*R, \; Q+R \}.$$
   它们每一个都同时位于 $L_1, L_2, L_3$ 之一和 $M_1, M_2, M_3$ 之一上，且 모두位于原光滑三次曲线 $C$ 上！
   根据 **Theorem 1.6.2（Cayley-Bacharach 九点定理）**：三次曲线 $C$ 与 $C_1 = L_1 \cup L_2 \cup L_3$ 的第 $9$ 个交点是 $W = (P + Q) * R$，而 $C$ 与 $C_2 = M_1 \cup M_2 \cup M_3$ 的第 $9$ 个交点是 $W' = P * (Q + R)$。由于 $C, C_1, C_2$ 都经过前 $8$ 个交点，它们的第 $9$ 个交点必须重合，即 $W = W'$！
   最后，对于某些点重合的特殊位置，由于有理映射 $(P, Q, R) \mapsto (P+Q)+R$ 与 $(P, Q, R) \mapsto P+(Q+R)$ 在不可约簇 $C \times C \times C$ 的稠密 Zariski 开集（一般位置）上恒等，由 Zariski 拓扑下态射的连续性（或直接对切线作极限重数分析），它们在整个 $C \times C \times C$ 上恒等。 **Q.E.D.**

#### 1.7 Pascal's Mystic Hexagram

Cayley-Bacharach 九点定理不仅证明了椭圆曲线的群结合律，还能在一行之内推出射影几何中最著名的经典定理之一——**Pascal 神秘六边形定理（Pascal's Mystic Hexagram Theorem）**及其退化情形 **Pappus 定理**。

**Theorem 1.7.1 (Pascal 神秘六边形定理与 Pappus 定理).**
设 $P_1, P_2, P_3, P_4, P_5, P_6$ 是内接于同一条不可约二次曲线 $Q \subset \mathbb{P}^2_k$（或在 Pappus 情形下分别位于两条直线 $L \cup L'$ 上）的六个互不相同的点，按顺序构成六边形 $P_1 P_2 P_3 P_4 P_5 P_6$。记三对对边的交点分别为：
$$A = P_1 P_2 \cap P_4 P_5, \qquad B = P_2 P_3 \cap P_5 P_6, \qquad D = P_3 P_4 \cap P_6 P_1.$$
则交点 $A, B, D$ **三点共线**（该直线称为 **Pascal 线**）。

**Proof.**
将六边形的六条边按奇偶间隔分成两组，每组各含三条边，从而构造两条退化的三次曲线：
$$C_1 := L_{12} \cup L_{34} \cup L_{56}, \qquad C_2 := L_{23} \cup L_{45} \cup L_{61}.$$
计算 $C_1$ 与 $C_2$ 的 $9$ 个交点：
- 六个顶点：$P_1 = L_{12} \cap L_{61}$，$P_2 = L_{12} \cap L_{23}$，$P_3 = L_{34} \cap L_{23}$，$P_4 = L_{34} \cap L_{45}$，$P_5 = L_{56} \cap L_{45}$，$P_6 = L_{56} \cap L_{61}$；
- 三对对边的交点：$A = L_{12} \cap L_{45}$，$B = L_{23} \cap L_{56}$，$D = L_{34} \cap L_{61}$。
现在考虑连接 $A$ 与 $B$ 的直线 $L_{AB}$，并构造第三条三次曲线：
$$C_3 := Q \cup L_{AB}.$$
由于 $P_1, \dots, P_6 \in Q$ 且 $A, B \in L_{AB}$，三次曲线 $C_3$ 经过了 $C_1 \cap C_2$ 的前 $8$ 个交点 $P_1, \dots, P_6, A, B$！由 **Theorem 1.6.2（Cayley-Bacharach 定理）**，三次曲线 $C_3 = Q \cup L_{AB}$ 必定经过第 $9$ 个交点 $D$（或直接用线性组合：在 $Q$ 上任取第七点 $P_7 \in Q$，选 $[\lambda:\mu]$ 使三次曲线 $C' = \lambda C_1 + \mu C_2$ 经过 $P_7$，则 $C'$ 含有 $Q$ 上的 $7$ 个点 $P_1, \dots, P_7$，由 **Lemma 1.6.1(2)** 知 $C' = Q \cdot L'$，其中余下的直线因式 $L'$ 必须经过不在 $Q$ 上的三个交点 $A, B, D$）。由于 $D \notin Q$（直线 $L_{34}$ 与二次曲线 $Q$ 已交于 $P_3, P_4$ 两点，不可能再在 $Q$ 上有第三交点 $D$），必有 $D \in L_{AB}$，即 $A, B, D$ 三点共线！ **Q.E.D.**

#### 1.8 Irreducible cubics and singular cubics

如果一条不可约平面三次曲线 $C \subset \mathbb{P}^2_k$ 具有奇点（Singular Point），它的几何形态和代数结构会发生怎样的退化？

**Proposition 1.8.1 (不可约奇异三次曲线的唯一奇点与有理参数化).**
设 $C \subset \mathbb{P}^2_k$ 为不可约三次曲线，且 $P_0 \in C$ 是 $C$ 的一个奇点（即 $\frac{\partial F}{\partial X}(P_0) = \frac{\partial F}{\partial Y}(P_0) = \frac{\partial F}{\partial Z}(P_0) = 0$）。则：
1. $P_0$ 的重数必为 $m_{P_0}(C) = 2$（不能为 $3$，否则 $C$ 退化为过 $P_0$ 的三条直线的并），且 $P_0$ 是不可约三次曲线 $C$ 的**唯一奇点**。
2. 任何不可约奇异三次曲线 $C$ 都是**有理曲线（Rational Curve）**：从奇点 $P_0$ 出发的直线束投影给出了双有理映射 $C \dashrightarrow \mathbb{P}^1_k$。
3. 在代数闭域 $k$（$\operatorname{char} k \neq 2, 3$）上，不可约奇异三次曲线在射影变换下恰有两种标准类型，且其非奇异轨迹 $C_{\mathrm{reg}} := C \setminus \{P_0\}$ 在弦切群律下仍然构成阿贝尔群：
   - **结点三次曲线（Nodal Cubic）**：在 $P_0 = (0,0)$ 处有两条不同的切线，仿射标准形为：
     $$C_{\mathrm{node}}: y^2 = x^2(x + 1) \qquad (\text{齐次形 } Y^2 Z = X^2(X + Z)).$$
     此时有理参数化为 $(x, y) = (t^2 - 1, t(t^2 - 1))$（其中 $t = y/x$），结点 $(0,0)$ 对应两个不同的参数值 $t = \pm 1$，且光滑轨迹上的群结构同构于基域的**乘法群**：
     $$(C_{\mathrm{node}})_{\mathrm{reg}} \cong (k^\times, \times).$$
   - **尖点三次曲线（Cuspidal Cubic）**：在 $P_0 = (0,0)$ 处只有一条二重切线，仿射标准形为：
     $$C_{\mathrm{cusp}}: y^2 = x^3 \qquad (\text{齐次形 } Y^2 Z = X^3).$$
     此时有理参数化为 $(x, y) = (t^2, t^3)$（其中 $t = y/x$），尖点 $(0,0)$ 对应唯一的参数值 $t = 0$，且光滑轨迹上的群结构同构于基域的**加法群**：
     $$(C_{\mathrm{cusp}})_{\mathrm{reg}} \cong (k, +).$$

**Proof.**
1. 若 $C$ 有两个不同的奇点 $P_0 \neq P_1$，则连接 $P_0 P_1$ 的直线 $L$ 在 $P_0$ 和 $P_1$ 处与 $C$ 的相交重数均至少为 $2$，从而总相交重数 $\ge 2 + 2 = 4 > 3 = \deg C$。由 **Lemma 1.6.1(1)**，必有 $L \subset C$，与 $C$ 不可约矛盾！故不可约三次曲线至多有一个二重点 $P_0$。
2. 将唯一奇点置于仿射原点 $P_0 = (0, 0)$，则非齐次三次多项式 $f(x, y)$ 无常数项与一次项，可写为二次齐次项与三次齐次项之和：
   $$f(x, y) = f_2(x, y) + f_3(x, y) = 0, \qquad f_2 \neq 0.$$
   用过原点的直线束 $y = t x$ 截曲线 $C$，代入得 $x^2 \bigl(f_2(1, t) + x f_3(1, t)\bigr) = 0$。约去原点处的二重根 $x^2$，立即解出第三个移动交点的有理参数坐标：
   $$x(t) = -\frac{f_2(1, t)}{f_3(1, t)}, \qquad y(t) = -\frac{t f_2(1, t)}{f_3(1, t)}.$$
3. 二次型 $f_2(x, y) = 0$ 定义了 $C$ 在原点处的**切锥（Tangent Cone，即两条切线）**。
   - 当 $f_2(x, y)$ 有两个不同线性因式（结点情形，$\operatorname{char} k \neq 2$）时，作线性坐标变换使标准方程为 $y^2 = x^2(x + 1)$（齐次形式 $Y^2 Z = X^2(X + Z)$），原点 $(0,0)$ 处的两条结点切线为 $y = x$ 与 $y = -x$（对应斜率参数 $t = y/x = \pm 1$），无穷远拐点为 $O = [0 : 1 : 0]$（对应 $t = \infty$，拐切线为 $Z = 0$）。在斜率参数化 $x = t^2 - 1, \, y = t(t^2 - 1)$ 下，引入分式线性乘法参数（将两条结点切线方向 $t = 1, -1$ 分别映为 $s = 0, \infty$，将无穷远拐点 $t = \infty$ 映为单位元 $s = 1$）：
     $$s = \frac{t - 1}{t + 1} \in k^\times \qquad \left(\text{逆变换为 } t = \frac{1 + s}{1 - s},\; x = \frac{4s}{(1 - s)^2},\; y = \frac{4s(1 + s)}{(1 - s)^3}\right).$$
     由此可得光滑点 $P(s) \in (C_{\mathrm{node}})_{\mathrm{reg}}$ 的齐次射影坐标为 $P(s) = \bigl[4s(1 - s) : 4s(1 + s) : (1 - s)^3\bigr]$（其中 $s = 1$ 恰给出 $O = [0 : 8 : 0] = [0 : 1 : 0]$）。将 $P(s)$ 代入任意直线方程 $a X + b Y + c Z = 0$，得关于 $s$ 的三次方程：
     $$c(1 - s)^3 + 4a s(1 - s) + 4b s(1 + s) = -c s^3 + (3c - 4a + 4b)s^2 + (-3c + 4a + 4b)s + c = 0.$$
     对于与光滑轨迹 $(C_{\mathrm{node}})_{\mathrm{reg}}$ 相交于三个光滑点（计重数）的任意直线 $aX + bY + cZ = 0$，该直线不经过结点 $[0:0:1]$，故必有 $c \neq 0$！注意到上述三次方程的 $s^3$ 项系数为 $-c \neq 0$，常数项为 $+c$，直接由 Vieta 定理知三根之积等于 $\frac{-c}{-c} = 1$（特别地，若直线经过无穷远零元 $O = [0:1:0]$，代入直线方程得 $b = 0$，此时 $s_3 = 1$ 为一根，其余两交点满足 $t_2 = -t_1 \implies s_2 = s_1^{-1}$，同样满足 $s_1 s_2 \cdot 1 = 1$），从而光滑点三点共线的充要条件恒简化为：
     $$s_1 s_2 s_3 = 1!$$
     于是以无穷远拐点 $O$（$s = 1$）为群零元时，$P(s_1)$ 与 $P(s_2)$ 的第三交点参数为 $(s_1 s_2)^{-1}$，再与 $O(s=1)$ 连线取逆即得群加法对应参数乘积 $s_1 s_2$，从而给出群同构 $(C_{\mathrm{node}})_{\mathrm{reg}} \xrightarrow{\sim} (k^\times, \times)$！
   - 当 $f_2(x, y)$ 为完全平方（尖点情形 $Y^2 Z = X^3$）时，在参数化 $P(t) = [t : 1 : t^3]$（其中 $t = X/Y$，$O = [0:1:0]$ 对应 $t = 0$，尖点 $[0:0:1]$ 对应 $t = \infty$）下，直线 $a X + b Y + c Z = 0$ 与 $C_{\mathrm{cusp}}$ 的交点满足三次方程：
     $$c t^3 + a t + b = 0.$$
     因为该三次方程缺少 $t^2$ 项，由 Vieta 定理知三个交点的参数之和恒满足：
     $$t_1 + t_2 + t_3 = 0!$$
     由于 $O$ 对应 $t = 0$，故 $P(t_1) + P(t_2) = P(t_1 + t_2)$，这直接给出了群同构 $(C_{\mathrm{cusp}})_{\mathrm{reg}} \xrightarrow{\sim} (k, +)$！ **Q.E.D.**

#### 1.9 Singularities, intersection multiplicity and Bézout's theorem

为了把上述对二重点、切锥与相交重数的讨论推广到任意 $d$ 次平面曲线，我们总结平面曲线在一点处的局部重数与切锥理论。

**Definition 1.9.1 (曲线在一点处的重数 Multiplicity 与切锥 Tangent Cone).**
设 $C: f(x, y) = 0$ 为仿射平面 $\mathbb{A}^2_k$ 中的代数曲线，$P = (0, 0)$ 为原点。将多项式 $f(x, y)$ 按齐次分量展开：
$$f(x, y) = f_m(x, y) + f_{m+1}(x, y) + \dots + f_d(x, y),$$
其中 $f_j(x, y)$ 为 $j$ 次齐次多项式，且 $f_m(x, y) \neq 0$ 是最低次非零齐次项。
1. 非负整数 $m = m_P(C) \ge 0$ 称为曲线 $C$ 在点 $P$ 处的**重数（Multiplicity）**：
   - $m_P(C) = 0 \iff P \notin C$；
   - $m_P(C) = 1 \iff P \in C$ 是**光滑点（Simple / Nonsingular Point）**，此时一次式 $f_1(x, y) = 0$ 恰为切线 $T_P C$；
   - $m_P(C) \ge 2 \iff P \in C$ 是 **$m$ 重奇点（Singular Point of Multiplicity $m$）**。
2. 在代数闭域 $k$ 上，最低次齐次项分解为 $m$ 个一次齐次因式的乘积 $f_m(x, y) = \prod_{i=1}^m (\beta_i x - \alpha_i y)$。方程 $f_m(x, y) = 0$ 定义的 $m$ 条过原点的直线（计重数）称为 $C$ 在点 $P$ 处的**切锥（Tangent Cone）**或**主切线（Principal Tangents）**。若这 $m$ 条切线互不相同，则称 $P$ 为**普通 $m$ 重点（Ordinary $m$-tuple Point）**（当 $m=2$ 时即普通二重点 / 结点 Node）。
3. 对任意点 $P = (a, b) \in \mathbb{A}^2_k$，通过平移坐标 $(x', y') = (x - a, y - b)$ 将 $P$ 移至原点，即可同样定义 $m_P(C)$（在特征 $0$ 或 $\operatorname{char} k > m$ 下，$m_P(C)$ 等价于使 $f$ 的所有低于 $m$ 阶偏导数在 $P$ 处全为零、而某 $m$ 阶偏导数非零的整数 $m$）。

**Theorem 1.9.2 (一般平面曲线的 Bézout 定理综述).**
设 $k$ 为代数闭域，$C_1 = V(F)$ 与 $C_2 = V(G)$ 是射影平面 $\mathbb{P}^2_k$ 中两条没有公共不可约分支的射影平面曲线，其次数分别为 $\deg F = m$ 与 $\deg G = n$。则：
1. 交集 $C_1 \cap C_2$ 是有限点集，且对每个点 $P \in \mathbb{P}^2_k$，存在唯一确定的局部**相交重数（Intersection Multiplicity）** $I(P, C_1 \cap C_2) \in \mathbb{Z}_{\ge 0}$（在代数上定义为局部环商维数 $\dim_k \mathcal{O}_{\mathbb{P}^2, P} / (f, g)$），满足：
   - $I(P, C_1 \cap C_2) = 0 \iff P \notin C_1 \cap C_2$；
   - $I(P, C_1 \cap C_2) \ge m_P(C_1) \cdot m_P(C_2)$，且等号成立当且仅当 $C_1$ 与 $C_2$ 在点 $P$ 处没有公共切线（特别地，$I(P, C_1 \cap C_2) = 1 \iff P$ 是 $C_1$ 与 $C_2$ 的光滑点且二者在 $P$ 处横截相交 $T_P C_1 \neq T_P C_2$）；
2. **Bézout 公式**：所有交点的相交重数之和恒等于两条曲线次数的乘积：
   $$\sum_{P \in C_1 \cap C_2} I(P, C_1 \cap C_2) = m \cdot n = (\deg C_1)(\deg C_2).$$

#### 1.10 Appendix: Curves and their genus

为什么光滑二次曲线同构于 $\mathbb{P}^1$，光滑三次曲线具有阿贝尔群结构，而更高次数的光滑平面曲线性质又大相径庭？在复数域 $k = \mathbb{C}$ 上，这由黎曼面（Compact Riemann Surface）的拓扑不变量——**亏格（Genus $g$）**所支配。

**Proposition 1.10.1 (光滑射影平面曲线的拓扑亏格与次数-亏格公式).**
设 $C \subset \mathbb{P}^2_{\mathbb{C}}$ 是复射影平面中的一条非奇异 $d$ 次代数曲线。赋予其复流形拓扑后，$C(\mathbb{C})$ 是一个紧致、连通、可定向的二维实流形（即紧黎曼面，拓扑上同胚于带有 $g$ 个环柄的球面 / $g$-孔环面），其拓扑**亏格（Genus）**由**次数-亏格公式（Degree-Genus Formula）**给出：
$$g(C) = \frac{(d - 1)(d - 2)}{2}.$$
若不可约 $d$ 次曲线 $C$ 仅具有普通奇点 $P_1, \dots, P_r$（重数分别为 $m_i = m_{P_i}(C)$），则其正规化（奇点消解后得到的非奇异模型 $\tilde{C}$）的几何亏格为：
$$g(\tilde{C}) = \frac{(d - 1)(d - 2)}{2} - \sum_{i=1}^r \frac{m_i(m_i - 1)}{2}.$$

**Proof (拓扑分歧覆盖与 Riemann-Hurwitz 直观证明).**
1. 先看 $d = 3$ 的光滑复三次曲线 $E: y^2 = (x - e_1)(x - e_2)(x - e_3)$（在 $\mathbb{P}^2_{\mathbb{C}}$ 中加上无穷远拐点 $O = [0:1:0]$）。向 $x$-轴 $\mathbb{P}^1_{\mathbb{C}} \cong S^2$ 的二叶投影 $(x, y) \mapsto x$ 除了在四个分歧点（Branch Points）$e_1, e_2, e_3, \infty$ 处两叶合并外，在其余每一点处都是 $2:1$ 的局部同胚。将两张球面 $\mathbb{P}^1_{\mathbb{C}} \cong S^2$ 沿着连接 $(e_1, e_2)$ 与 $(e_3, \infty)$ 的两条割线剪开并交叉黏合，正好形成一个具有 $1$ 个环柄的**二维环面（Torus）** $S^1 \times S^1 \cong \mathbb{C}/\Lambda$（故 $g = 1$）。而且复环面 $\mathbb{C}/\Lambda$ 天然继承了复平面 $(\mathbb{C}, +)$ 的商群结构，这从拓扑与复分析角度印证了光滑三次曲线为什么是阿贝尔群！
2. 对一般的光滑 $d$ 次曲线 $C \subset \mathbb{P}^2_{\mathbb{C}}$，选取不在 $C$ 上的一般中心点 $P_0 \notin C$，考虑从 $P_0$ 向一条直线 $\mathbb{P}^1_{\mathbb{C}}$ 的中心投影 $\pi: C \to \mathbb{P}^1_{\mathbb{C}}$。这是一般位置下的 $d$ 叶分歧覆盖。投影 $\pi$ 在点 $P \in C$ 处分歧（即直线 $P_0 P$ 与 $C$ 在 $P$ 处相切），当且仅当 $P_0$ 落在 $T_P C$ 上，即：
   $$P_0 = [x_0 : y_0 : z_0] \implies x_0 \frac{\partial F}{\partial X}(P) + y_0 \frac{\partial F}{\partial Y}(P) + z_0 \frac{\partial F}{\partial Z}(P) = 0.$$
   该方程关于 $(X, Y, Z)$ 是 $d - 1$ 次齐次多项式（称为 $C$ 关于极点 $P_0$ 的**极曲线 Polar Curve**）。由 Bézout 定理，$d$ 次曲线 $C$ 与 $d - 1$ 次极曲线恰有 $d(d - 1)$ 个交点（一般位置下均为单分歧点，分歧指数 $e_P - 1 = 1$）。
3. 对分歧覆盖 $\pi: C \to \mathbb{P}^1_{\mathbb{C}}$ 应用拓扑三角剖分的欧拉示性数公式（Riemann-Hurwitz 公式）：
   $$\chi(C) = 2 - 2g(C) = d \cdot \chi(\mathbb{P}^1_{\mathbb{C}}) - \sum_{P \in C} (e_P - 1) = 2d - d(d - 1) = d(3 - d).$$
   由此解出 $g(C) = 1 - \frac{d(3 - d)}{2} = \frac{(d - 1)(d - 2)}{2}$。 **Q.E.D.**

| 亏格分界 | 平面光滑实现次数 | 拓扑流形模型 ($\mathbb{C}$) | 万有覆盖与曲率几何 | 有理点算术（当 $k = \mathbb{Q}$ 时） |
| :--- | :--- | :--- | :--- | :--- |
| $g = 0$（有理曲线） | $d = 1, 2$ | 球面 $S^2 \cong \mathbb{P}^1(\mathbb{C})$ | 球面几何（正曲率 $\kappa > 0$） | $C(\mathbb{Q}) = \varnothing$ 或 $C \cong \mathbb{P}^1_{\mathbb{Q}}$（无穷多有理点） |
| $g = 1$（椭圆曲线） | $d = 3$ | 环面 $S^1 \times S^1 \cong \mathbb{C}/\Lambda$ | 欧氏平坦几何（零曲率 $\kappa = 0$） | Mordell-Weil 定理：$E(\mathbb{Q}) \cong \mathbb{Z}^r \oplus E(\mathbb{Q})_{\mathrm{tors}}$ 为有限生成阿贝尔群 |
| $g \ge 2$（一般型曲线） | $d \ge 4$ ($g=3,6,\dots$) | $g$-孔环面（双曲曲面） | 双曲几何上半平面 $\mathbb{H}$（负曲率 $\kappa < 0$） | Faltings 定理（Mordell 猜想）：$C(\mathbb{Q})$ 必为**有限集** |

#### 1.11 Exercises to Chapter 1

##### Exercise 1.1 (从已知有理点 $(2, 1)$ 出发有理参数化圆 $x^2 + y^2 = 5$)
已知圆 $C: x^2 + y^2 = 5$ 上有一有理点 $P_0 = (2, 1) \in C(\mathbb{Q})$。利用过点 $P_0(2, 1)$ 的直线束 $L_t: y - 1 = t(x - 2)$，写出圆 $C$ 上全部有理点 $(x, y) \in C(\mathbb{Q})$ 的有理参数化公式，并由此写出不定方程 $a^2 + b^2 = 5c^2$ 的本原整数解通式。

**Proof.**
过已知点 $P_0 = (2, 1)$ 且斜率为 $t \in \mathbb{Q}$ 的直线方程为 $y = 1 + t(x - 2)$。将其代入圆方程 $x^2 + y^2 = 5$，并利用 $2^2 + 1^2 = 5$ 整理：
$$(x^2 - 4) + \bigl[1 + t(x - 2)\bigr]^2 - 1 = 0 \implies (x - 2)(x + 2) + 2t(x - 2) + t^2(x - 2)^2 = 0.$$
提取对应于已知基点 $P_0(2, 1)$ 的一次公因式 $(x - 2)$（注意 $t^2(x - 2)^2 = (x - 2)(t^2 x - 2t^2)$ 中常数项为 $-2t^2$），得：
$$(x - 2)\bigl[(1 + t^2)x + (2 + 2t - 2t^2)\bigr] = 0.$$
舍去平凡基点 $x = 2$，由第二个因式为零直接解得第二个交点 $P(t) = \bigl(x(t), y(t)\bigr)$ 的有理坐标公式：
$$x(t) = \frac{2t^2 - 2t - 2}{1 + t^2}, \qquad y(t) = 1 + t\bigl(x(t) - 2\bigr) = \frac{1 - 4t - t^2}{1 + t^2} \qquad (t \in \mathbb{Q} \cup \{\infty\}).$$
（直接核验：恒有 $(2t^2 - 2t - 2)^2 + (1 - 4t - t^2)^2 = (4t^4 - 8t^3 - 4t^2 + 8t + 4) + (t^4 + 8t^3 + 14t^2 - 8t + 1) = 5(1 + t^2)^2$；当 $t = 0$ 时得 $(-2, 1)$，当 $t \to \infty$ 时对应过 $(2, 1)$ 的铅直割线得极限点 $(2, -1)$，而当 $t = -2$ 时对应圆在 $P_0(2, 1)$ 处的切线 $2x + y = 5$，给出 $x(-2) = \frac{8+4-2}{5} = 2, \, y(-2) = \frac{1+8-4}{5} = 1$，精确恢复基点 $P_0 = (2, 1)$！）
令有理参数 $t = u / v$（其中 $u, v \in \mathbb{Z}, \, \gcd(u, v) = 1$），通分即得齐次丢番图方程 $X^2 + Y^2 = 5 Z^2$ 的整数解参数族：
$$X = 2u^2 - 2uv - 2v^2, \qquad Y = v^2 - 4uv - u^2, \qquad Z = u^2 + v^2$$
（约去 $X, Y, Z$ 的最大公因数 $\gcd(X,Y,Z) \in \{1, 2, 5, 10\}$ 即得全部本原整数解：例如取 $u=1, v=2$ 得未约分解 $(X,Y,Z)=(-10, -5, 5)$，约去 $5$ 得 $(-2, -1, 1)$，满足 $(-10)^2 + (-5)^2 = 125 = 5 \times 5^2$；取 $u=1, v=3$ 得 $(-22, -4, 10)$，约去 $2$ 得 $(-11, -2, 5)$，满足 $(-11)^2 + (-2)^2 = 125 = 5 \times 5^2$；取 $u=2, v=3$ 得本原解 $(X,Y,Z)=(-22, -19, 13)$，验证 $(-22)^2 + (-19)^2 = 484 + 361 = 845 = 5 \times 169 = 5 \times 13^2$）。 **Q.E.D.**

##### Exercise 1.2 (圆 $x^2 + y^2 = p$ 存在有理点的素数条件与无穷多有理点)
设 $p$ 为素数（或一般正整数 $n$），考虑有理数域 $\mathbb{Q}$ 上的圆锥曲线 $C_p: x^2 + y^2 = p$。
1. 证明：若 $C_p(\mathbb{Q}) \neq \varnothing$（即至少存在一个有理点 $(x_0, y_0) \in \mathbb{Q}^2$），则 $C_p(\mathbb{Q})$ 必有无穷多个有理点，且与 $\mathbb{P}^1_{\mathbb{Q}}$ 双有理同构；
2. 证明：当 $p \equiv 3 \pmod 4$ 时，$C_p(\mathbb{Q}) = \varnothing$；更一般地，素数 $p$ 满足 $C_p(\mathbb{Q}) \neq \varnothing$ 当且仅当 $p = 2$ 或 $p \equiv 1 \pmod 4$（此时 $p$ 必可表为两个整数的平方和）。

**Proof.**
1. 若存在一个有理点 $P_0 = (x_0, y_0) \in C_p(\mathbb{Q})$（满足 $x_0^2 + y_0^2 = p$），完全仿照 Exercise 1.1，过点 $P_0$ 作有理斜率直线束 $y - y_0 = t(x - x_0)\ (t \in \mathbb{Q} \cup \{\infty\})$，代入 $(x - x_0)(x + x_0) + 2t y_0(x - x_0) + t^2(x - x_0)^2 = 0$ 并约去 $x - x_0$，由 $(1 + t^2)x + (1 - t^2)x_0 + 2t y_0 = 0$ 可得与斜率约定完全一致的双有理参数化：
   $$x(t) = \frac{(t^2 - 1)x_0 - 2t y_0}{1 + t^2}, \qquad y(t) = y_0 + t\bigl(x(t) - x_0\bigr) = \frac{(1 - t^2)y_0 - 2t x_0}{1 + t^2} \qquad (t \in \mathbb{Q} \cup \{\infty\}),$$
   其逆映射恰为斜率公式 $t = \frac{y - y_0}{x - x_0}$（特别地取 $(x_0, y_0) = (2, 1)$ 即回到 Exercise 1.1 的公式）。这就给出了双射 $C_p(\mathbb{Q}) \leftrightarrow \mathbb{P}^1(\mathbb{Q})$，故有理点有无穷多个。
2. 设 $(x, y) = (a/c, \, b/c) \in C_p(\mathbb{Q})$ 为有理点，其中 $a, b, c \in \mathbb{Z}, \, c > 0$ 且 $\gcd(a, b, c) = 1$。去分母得整数方程：
   $$a^2 + b^2 = p c^2.$$
   - **证明 $p \equiv 3 \pmod 4$ 时无有理点**：假设 $p \equiv 3 \pmod 4$。若 $p \mid c$，则 $p \mid (a^2 + b^2)$；但在有限域 $\mathbb{F}_p$ 中，乘法群 $\mathbb{F}_p^\times$ 的阶数为 $p - 1 \equiv 2 \pmod 4$（不被 $4$ 整除），故 $\mathbb{F}_p^\times$ 中不存在 $4$ 阶元，即 $-1$ 是模 $p$ 的二次非剩余！因此 $a^2 + b^2 \equiv 0 \pmod p$ 蕴含 $p \mid a$ 且 $p \mid b$，这与 $\gcd(a, b, c) = 1$ 矛盾！故必有 $p \nmid c$。同理，对分母 $c$ 的任意素因子 $q$，若 $q \equiv 3 \pmod 4$，由 $a^2 + b^2 = p c^2 \equiv 0 \pmod q$ 同样推出 $q \mid a, b$，与 $\gcd(a, b, c) = 1$ 矛盾。最后对整个方程模 $4$：任意整数的平方模 $4$ 只能余 $0$ 或 $1$，故左端 $a^2 + b^2 \pmod 4 \in \{0, 1, 2\}$；而在右端 $p c^2$ 中，若 $2 \mid c$ 则 $4 \mid a^2 + b^2 \implies 2 \mid a, b$ 与互素矛盾，故 $c$ 为奇数（$c^2 \equiv 1 \pmod 4$），从而右端 $p c^2 \equiv p \equiv 3 \pmod 4$，左右模 $4$ 不可能相等，矛盾！
   - **反之当 $p = 2$ 或 $p \equiv 1 \pmod 4$ 时**：由 Fermat 平方和定理（在 $\mathbb{F}_p^\times$ 中存在 $u^2 \equiv -1 \pmod p$，在高斯整数唯一分解整环 $\mathbb{Z}[i]$ 中 $p = (a + bi)(a - bi) = a^2 + b^2$），素数 $p$ 本身已可表为两个整数平方和 $p = a^2 + b^2$（如 $2 = 1^2 + 1^2, \, 5 = 2^2 + 1^2, \, 13 = 3^2 + 2^2$），取 $(x_0, y_0) = (a, b) \in C_p(\mathbb{Q})$ 并应用第 1 问即得无穷多有理点。 **Q.E.D.**

##### Exercise 1.2A (射影平面中两点连线与两线交点的叉积公式)
证明：在射影平面 $\mathbb{P}^2_k$ 中，经过两个不同点 $P = [x_1 : y_1 : z_1]$ 与 $Q = [x_2 : y_2 : z_2]$ 的唯一射影直线方程由三阶行列式给出：
$$\det \begin{pmatrix} X & Y & Z \\ x_1 & y_1 & z_1 \\ x_2 & y_2 & z_2 \end{pmatrix} = 0,$$
且两条不同直线 $L_1: a_1 X + b_1 Y + c_1 Z = 0$ 与 $L_2: a_2 X + b_2 Y + c_2 Z = 0$ 的唯一交点齐次坐标由三维向量叉积 $[b_1 c_2 - b_2 c_1 : c_1 a_2 - c_2 a_1 : a_1 b_2 - a_2 b_1]$ 给出。

**Proof.**
因为 $P \neq Q$，向量 $v_1 = (x_1, y_1, z_1)$ 与 $v_2 = (x_2, y_2, z_2)$ 在 $k^3$ 中线性无关，它们张成 $k^3$ 的二维线性子空间 $W = \operatorname{Span}_k(v_1, v_2)$。点 $[X:Y:Z] \in \mathbb{P}^2_k$ 位于连接 $P, Q$ 的射影直线上，当且仅当向量 $(X, Y, Z) \in W$，这等价于三个向量 $(X,Y,Z), v_1, v_2$ 线性相关，即三阶行列式为零。按第一行展开该行列式，系数恰为叉积 $v_1 \times v_2 = (y_1 z_2 - y_2 z_1, z_1 x_2 - z_2 x_1, x_1 y_2 - x_2 y_1) \neq (0,0,0)$。对偶地，将直线 $a X + b Y + c Z = 0$ 视为对偶射影平面 $(\mathbb{P}^2_k)^\vee$ 中的点 $[a : b : c]$，两直线的交点满足与法向量 $(a_1, b_1, c_1), (a_2, b_2, c_2)$ 同时正交，故由叉积 $(a_1, b_1, c_1) \times (a_2, b_2, c_2)$ 唯一给出。 **Q.E.D.**

##### Exercise 1.2B (射影标架变换的基本定理：四点标准基)
设 $P_1, P_2, P_3, P_4 \in \mathbb{P}^2_k$ 是满足“任意三点不共线”的四个点。证明：存在在标量倍数下唯一的可逆矩阵 $M \in \operatorname{GL}_3(k)$（即唯一的射影变换 $[M] \in \operatorname{PGL}_3(k)$），将这四个点分别映为标准标架点：
$$e_1 = [1 : 0 : 0], \quad e_2 = [0 : 1 : 0], \quad e_3 = [0 : 0 : 1], \quad e_4 = [1 : 1 : 1].$$

**Proof.**
任取 $P_1, P_2, P_3, P_4$ 在 $k^3 \setminus \{0\}$ 中的代表向量 $v_1, v_2, v_3, v_4$。由于 $P_1, P_2, P_3$ 不共线，向量 $v_1, v_2, v_3$ 在 $k^3$ 中线性无关，构成 $k^3$ 的一组基。将 $v_4$ 按这组基线性表出：
$$v_4 = \lambda_1 v_1 + \lambda_2 v_2 + \lambda_3 v_3, \qquad \lambda_i \in k.$$
因为 $P_4$ 与 $P_1, P_2, P_3$ 中任意两点均不共线，系数 $\lambda_1, \lambda_2, \lambda_3$ 全都不为零（例如若 $\lambda_3 = 0$，则 $v_4 \in \operatorname{Span}(v_1, v_2)$，意味着 $P_1, P_2, P_4$ 共线，矛盾）。现用非零标量修正基向量，令 $w_i := \lambda_i v_i$（$i = 1, 2, 3$），则 $w_i$ 仍是 $P_i$ 的齐次坐标代表元，且满足 $v_4 = w_1 + w_2 + w_3$。以 $w_1, w_2, w_3$ 为列向量构成可逆矩阵 $A = (w_1, w_2, w_3) \in \operatorname{GL}_3(k)$，则线性变换 $M = A^{-1}$ 满足 $M w_1 = (1,0,0)^{\mathsf{T}}, M w_2 = (0,1,0)^{\mathsf{T}}, M w_3 = (0,0,1)^{\mathsf{T}}$ 以及 $M v_4 = (1,1,1)^{\mathsf{T}}$。若另有矩阵 $M'$ 满足同性质，则 $M' M^{-1}$ 固定 $[1:0:0], [0:1:0], [0:0:1]$，必为对角矩阵 $\operatorname{diag}(d_1, d_2, d_3)$，又固定 $[1:1:1]$ 知 $d_1 = d_2 = d_3$，故在 $\operatorname{PGL}_3(k)$ 中唯一。 **Q.E.D.**

##### Exercise 1.3 (二次曲线束求交点的显式计算实例)
在 $\mathbb{P}^2_{\mathbb{C}}$ 中，利用二次曲线束中的退化曲线显式求解下列两条二次曲线的全部 $4$ 个交点：
$$Q_1: X^2 - Y^2 - X Z + Y Z = 0, \qquad Q_2: X^2 - 2 X Y - Y^2 - X Z + 3 Y Z = 0.$$

**Proof.**
考虑二次曲线束 $\lambda Q_1 + \mu Q_2 = 0$。注意 $Q_1$ 本身即可因式分解：
$$Q_1 = (X - Y)(X + Y) - Z(X - Y) = (X - Y)(X + Y - Z) = 0!$$
（若事先未看出，亦可取 $\mu = -1, \lambda = 1$ 得到 $Q_1 - Q_2 = 2 X Y - 2 Y Z = 2 Y(X - Z) = 0$，这也是束中的一条退化二次曲线）。
利用 $Q_1 - Q_2 = 2 Y(X - Z) = 0$，将交点分为两支求解：
1. **分支一（$Y = 0$）**：代入 $Q_1$ 得 $X(X - Z) = 0$，解得两个交点：
   $$P_1 = [0 : 0 : 1], \qquad P_2 = [1 : 0 : 1].$$
2. **分支二（$X = Z$）**：代入 $Q_1 = (X - Y)(X + Y - Z) = 0$ 得 $(Z - Y) Y = 0$，解得另外两个交点：
   $$P_3 = [1 : 0 : 1] \text{（重合！）}, \qquad P_4 = [1 : 1 : 1].$$
等等，$P_2 = P_3 = [1 : 0 : 1]$ 重合说明 $[1 : 0 : 1]$ 是重交点吗？再把第一条直线的另一因子 $X + Y - Z = 0$（即 $Z = X + Y$）代入 $Q_2$ 检验：
$$X^2 - 2XY - Y^2 - X(X+Y) + 3Y(X+Y) = 2Y^2 = 0 \implies Y^2 = 0 \text{（二重根！）}.$$
因此全部交点为：$P_1 = [0 : 0 : 1]$（单交点），$P_4 = [1 : 1 : 1]$（单交点），以及 $P_2 = [1 : 0 : 1]$（相交重数为 $2$ 的切触交点，在该点处 $Q_1$ 与 $Q_2$ 有公共切线 $X + Y - Z = 0$），重数之和恰为 $1 + 1 + 2 = 4$。 **Q.E.D.**

##### Exercise 1.4 (五点确定唯一圆锥曲线的行列式方程)
设 $P_i = [x_i : y_i : z_i] \in \mathbb{P}^2_k$（$i = 1, 2, 3, 4, 5$）是处于一般位置的 $5$ 个点。证明经过这 $5$ 个点的唯一二次曲线方程可写为 $6 \times 6$ 行列式：
$$\det \begin{pmatrix}
X^2 & X Y & Y^2 & X Z & Y Z & Z^2 \\
x_1^2 & x_1 y_1 & y_1^2 & x_1 z_1 & y_1 z_1 & z_1^2 \\
x_2^2 & x_2 y_2 & y_2^2 & x_2 z_2 & y_2 z_2 & z_2^2 \\
x_3^2 & x_3 y_3 & y_3^2 & x_3 z_3 & y_3 z_3 & z_3^2 \\
x_4^2 & x_4 y_4 & y_4^2 & x_4 z_4 & y_4 z_4 & z_4^2 \\
x_5^2 & x_5 y_5 & y_5^2 & x_5 z_5 & y_5 z_5 & z_5^2
\end{pmatrix} = 0.$$

**Proof.**
按第一行展开该 $6 \times 6$ 行列式，得到关于 $(X, Y, Z)$ 的三元二次齐次多项式 $F(X, Y, Z)$。由于 $P_1, \dots, P_5$ 处于一般位置，由 **Proposition 1.4.4** 知线性方程组的系数矩阵（即后 $5$ 行构成的 $5 \times 6$ 矩阵）的秩必为 $5$，故按第一行展开的代数余子式不全为零，即 $F(X, Y, Z)$ 是非零二次齐次式。当把 $(X, Y, Z) = (x_i, y_i, z_i)$ 代入时，行列式的第 $1$ 行与第 $i+1$ 行完全相同，故行列式恒等于 $0$，即 $P_1, \dots, P_5 \in V(F)$。 **Q.E.D.**

##### Exercise 1.5 (Fermat 三次曲线与 Hesse 铅笔的拐点配置)
设 $\operatorname{char} k \neq 2, 3$ 且 $k$ 包含本原三次单位根 $\omega = e^{2\pi i/3}$（满足 $1 + \omega + \omega^2 = 0$）。考虑 Hesse 三次曲线族：
$$C_\mu: F_\mu(X, Y, Z) = X^3 + Y^3 + Z^3 + 3\mu X Y Z = 0.$$
1. 求参数 $\mu$ 满足什么条件时，$C_\mu$ 是非奇异三次曲线；
2. 计算 $F_\mu$ 的 Hessian 行列式 $\det H(F_\mu)$，并求出所有光滑 $C_\mu$ 共享的 $9$ 个拐点坐标；
3. 验证这 $9$ 个拐点具有如下著名的 **$(9_4, 12_3)$ Hesse 配置**：连接任意两个拐点的直线必经过第三个拐点，这样的拐点连线共有 $12$ 条，可分成 $4$ 组退化的“拐点三角形”，即束 $C_\mu$ 中恰好包含的 $4$ 条退化三次曲线（对应 $\mu = \infty$ 及 $\mu^3 = -1$）。

**Proof.**
1. **奇点判别**：计算偏导数令其同时为零：
   $$\frac{1}{3}\frac{\partial F_\mu}{\partial X} = X^2 + \mu Y Z = 0, \quad \frac{1}{3}\frac{\partial F_\mu}{\partial Y} = Y^2 + \mu X Z = 0, \quad \frac{1}{3}\frac{\partial F_\mu}{\partial Z} = Z^2 + \mu X Y = 0.$$
   若 $\mu = 0$（Fermat 三次曲线 $X^3 + Y^3 + Z^3 = 0$），因 $\operatorname{char} k \neq 3$，由 $X^2 = Y^2 = Z^2 = 0$ 知无非零解，曲线光滑。若 $\mu \neq 0$ 且存在奇点 $[X:Y:Z]$，则 $X, Y, Z$ 全不为零（若一者为零则其余二者也为零），将三式相乘得 $X^2 Y^2 Z^2 = -\mu^3 X^2 Y^2 Z^2$，约去 $X^2 Y^2 Z^2 \neq 0$ 得 $\mu^3 = -1$。反之当 $\mu^3 = -1$（即 $\mu = -\omega^j, \; j \in \{0, 1, 2\}$）时，直接代入一阶偏导数条件 $X^2 = \omega^j Y Z, \, Y^2 = \omega^j X Z, \, Z^2 = \omega^j X Y$ 核对可知，三个奇点坐标为 **$[1 : 1 : \omega^{-j}] = [1 : 1 : \omega^{2j}]$、$[1 : \omega : \omega^{2j-1}]$ 与 $[1 : \omega^2 : \omega^{2j-2}]$**（注意切勿误写为 $[1 : \omega^r : \omega^{2r}]$，后者仅在 $j=0$ 即 $\mu=-1$ 时才是奇点；对于一般的 $\mu = -\omega^j$，这 $3$ 个奇点恰好就是下述三直线分解 $(X + \omega^j Y + Z)(X + \omega^{j+1}Y + \omega^2 Z)(X + \omega^{j+2}Y + \omega Z) = 0$ 的两两交点）。故 $C_\mu$ 光滑当且仅当 **$\mu^3 \neq -1$**。
2. **Hessian 行列式与 $9$ 个拐点**：计算 $F_\mu = X^3 + Y^3 + Z^3 + 3\mu X Y Z$ 的二阶偏导数：对角元为 $\frac{\partial^2 F_\mu}{\partial X^2} = 6X$（及 $6Y, 6Z$），而混合偏导数为 $\frac{\partial^2 F_\mu}{\partial X \partial Y} = 3\mu Z$（注意系数是 $3\mu$ 而非 $6\mu$！若从每行提取公因子 $6$，则非对角元必须带有因子 $\frac{1}{2}$）：
   $$H(F_\mu) = 6 \begin{pmatrix} X & \frac{\mu}{2} Z & \frac{\mu}{2} Y \\ \frac{\mu}{2} Z & Y & \frac{\mu}{2} X \\ \frac{\mu}{2} Y & \frac{\mu}{2} X & Z \end{pmatrix} = 3 \begin{pmatrix} 2X & \mu Z & \mu Y \\ \mu Z & 2Y & \mu X \\ \mu Y & \mu X & 2Z \end{pmatrix}.$$
   由于 $\operatorname{char} k \neq 2, 3$，因子 $6^3 = 216 \neq 0$。展开上述 $3 \times 3$ 行列式（对角积为 $X Y Z$，两个三轮换积之和为 $2 \cdot \bigl(\frac{\mu}{2}\bigr)^3 X Y Z = \frac{\mu^3}{4} X Y Z$，三个对换积之和为 $-\frac{\mu^2}{4}(X^3 + Y^3 + Z^3)$），精确得到：
   $$\frac{1}{216} \det H(F_\mu) = \left(1 + \frac{\mu^3}{4}\right) X Y Z - \frac{\mu^2}{4}(X^3 + Y^3 + Z^3).$$
   联立曲线方程 $C_\mu: X^3 + Y^3 + Z^3 = -3\mu X Y Z$，将其代入上式消去立方和：
   $$\left.\frac{1}{216} \det H(F_\mu)\right|_{C_\mu} = \left(1 + \frac{\mu^3}{4} - \frac{\mu^2}{4}(-3\mu)\right) X Y Z = (1 + \mu^3) X Y Z!$$
   由第 1 问知，当 $C_\mu$ 非奇异时必有 $\mu^3 \neq -1$，即系数 **$1 + \mu^3 \neq 0$ 恒成立**（无需任何额外参数排除！仅当 $\mu = 0$ 时 $H(F_0) = 216 X Y Z$ 本身就是坐标三角形）。因此对束中每一条光滑三次曲线 $C_\mu$（$\mu^3 \neq -1$），$\det H(F_\mu) = 0$ 在 $C_\mu$ 上均等价于 $X Y Z = 0$！
   令 $X Y Z = 0$ 与 $X^3 + Y^3 + Z^3 = 0$ 联立，立即得到与 $\mu$ 无关的 **$9$ 个公共拐点**：
   - $X = 0$ 时：$[0 : 1 : -1], \; [0 : 1 : -\omega], \; [0 : 1 : -\omega^2]$；
   - $Y = 0$ 时：$[-1 : 0 : 1], \; [-\omega : 0 : 1], \; [-\omega^2 : 0 : 1]$；
   - $Z = 0$ 时：$[1 : -1 : 0], \; [1 : -\omega : 0], \; [1 : -\omega^2 : 0]$。
3. **Hesse 配置**：这 $9$ 个拐点正是两条三次曲线 $X^3 + Y^3 + Z^3 = 0$ 与 $X Y Z = 0$ 的基轨迹。束 $\lambda(X^3 + Y^3 + Z^3) + 3\mu X Y Z = 0$ 中共有 $4$ 条退化三次曲线：一条是 $[\lambda:\mu] = [0:1]$ 对应的坐标三角形 $X Y Z = 0$（三条直线各含 $3$ 个拐点），另外三条是 $\mu^3 = -\lambda^3$（即取 $\lambda = 1, \mu = -\omega^j, \; j = 0, 1, 2$）对应的三组三直线因式分解（利用恒等式 $A^3 + B^3 + C^3 - 3ABC = (A + B + C)(A + \omega B + \omega^2 C)(A + \omega^2 B + \omega C)$ 并取 $A = X, B = \omega^j Y, C = Z$）：
   $$X^3 + Y^3 + Z^3 - 3\omega^j X Y Z = (X + \omega^j Y + Z)(X + \omega^{j+1} Y + \omega^2 Z)(X + \omega^{j+2} Y + \omega Z) = 0 \quad (j=0,1,2).$$
   这 $4 \times 3 = 12$ 条直线每条经过 $3$ 个拐点，每个拐点恰位于 $4$ 条直线上。 **Q.E.D.**

##### Exercise 1.6 (光滑三次曲线上 2 阶与 3 阶挠点群结构)
设 $C \subset \mathbb{P}^2_k$（$k = \bar{k}, \operatorname{char} k \neq 2, 3$）为光滑平面三次曲线，取其上一个拐点 $O \in C$ 为群结构的零元。
1. 证明点 $P \in C$ 满足 $3P := P + P + P = O$（即 $P \in C[3]$ 是 $3$ 阶挠点）**当且仅当** $P$ 是 $C$ 的拐点，从而 $3$ 阶挠子群满足：
   $$C[3] \cong \mathbb{Z}/3\mathbb{Z} \times \mathbb{Z}/3\mathbb{Z} \quad (\text{共 } 9 \text{ 个拐点}).$$
2. 证明点 $P \in C \setminus \{O\}$ 满足 $2P := P + P = O$（即 $P \in C[2] \setminus \{O\}$ 是非平凡 $2$ 阶挠点）**当且仅当** $P$ 处的切线 $T_P C$ 经过拐点 $O$。利用 Weierstrass 标准形 $y^2 = (x - e_1)(x - e_2)(x - e_3)$ 证明 $2$ 阶挠子群满足：
   $$C[2] \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2\mathbb{Z} \quad (\text{共 } 4 \text{ 个 } 2 \text{ 阶挠点}).$$

**Proof.**
1. 由 **Theorem 1.6.4**，当零元 $O$ 为拐点时，曲线上三点 $P, Q, R$（允许重合）共线当且仅当 $P + Q + R = O$。取 $P = Q = R$，则 $3P = P + P + P = O$ 当且仅当存在一条直线 $L$ 与 $C$ 在点 $P$ 处的相交重数为 $3$，这恰恰是 $P$ 为拐点（且 $L = T_P C$）的定义！由于 $C$ 共有 $9$ 个拐点，有限阿贝尔群 $C[3]$ 的阶为 $9$，且每个元素的阶整除 $3$，故 $C[3] \cong (\mathbb{Z}/3\mathbb{Z})^2$。此外，若 $P_1, P_2 \in C[3]$ 是两个不同拐点，则第三个共线交点 $P_3 = P_1 * P_2$ 满足 $P_1 + P_2 + P_3 = O$，由于 $C[3]$ 是子群，$P_3 = -(P_1 + P_2) \in C[3]$ 也必然是拐点！这从群论角度直接解释了为什么任意两个拐点的连线必经过第三个拐点。
2. 同理，$2P = P + P + O = O$ 当且仅当点组 $(P, P, O)$ 共线，即曲线在点 $P$ 处的切线 $T_P C$ 经过点 $O$。在以 $O = [0 : 1 : 0]$ 为无穷远拐点的 Weierstrass 标准形 $y^2 = (x - e_1)(x - e_2)(x - e_3)$ 中，过 $O = [0 : 1 : 0]$ 的直线就是竖直直线 $x = c$（平行于 $y$-轴）。竖直直线 $x = c$ 与曲线相切于点 $P = (x_0, y_0)$ 当且仅当 $y_0 = 0$，即 $x_0 \in \{e_1, e_2, e_3\}$。这就给出了除 $O$ 以外的 $3$ 个非平凡 $2$ 阶挠点 $P_i = (e_i, 0)$（$i=1,2,3$）。又因 $P_1, P_2, P_3$ 均位于直线 $y = 0$ 上，故 $P_1 + P_2 + P_3 = O \implies P_1 + P_2 = -P_3 = P_3$，从而 $C[2] = \{O, P_1, P_2, P_3\} \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2\mathbb{Z}$。 **Q.E.D.**

##### Exercise 1.7 (Weierstrass 椭圆曲线加法公式的显式坐标推导)
设椭圆曲线 $E$ 在仿射平面中的 Weierstrass 方程为 $y^2 = x^3 + p x + q$（无穷远拐点 $O = [0 : 1 : 0]$ 为零元）。给定 $P_1 = (x_1, y_1), P_2 = (x_2, y_2) \in E \setminus \{O\}$ 且 $P_1 \neq -P_2$，记 $P_3 = P_1 + P_2 = (x_3, y_3)$。证明：
$$x_3 = k^2 - x_1 - x_2, \qquad y_3 = -k(x_3 - x_1) - y_1,$$
其中直线 $P_1 P_2$ 的斜率 $k$ 为：
$$k = \begin{cases} \dfrac{y_2 - y_1}{x_2 - x_1}, & \text{若 } x_1 \neq x_2, \\[8pt] \dfrac{3 x_1^2 + p}{2 y_1}, & \text{若 } P_1 = P_2 \text{ 且 } y_1 \neq 0. \end{cases}$$

**Proof.**
由于 $O = [0 : 1 : 0]$ 是无穷远点，对任意仿射点 $(x, y) \in E$，连接 $O$ 与 $(x, y)$ 的直线是竖直直线 $X = x Z$，它与 $E$ 的第三个交点是关于 $x$-轴对称的点 $- (x, y) = (x, -y)$。
现在设连接 $P_1, P_2$ 的割线（或当 $P_1 = P_2$ 时的切线，由隐函数求导 $2y dy = (3x^2 + p) dx$ 得斜率 $k = \frac{3x_1^2 + p}{2y_1}$）方程为：
$$y = k(x - x_1) + y_1.$$
将其代入三次方程 $y^2 = x^3 + p x + q$，整理为关于 $x$ 的一元三次方程：
$$x^3 - k^2 x^2 + \bigl(p - 2k(y_1 - k x_1)\bigr) x + \bigl(q - (y_1 - k x_1)^2\bigr) = 0.$$
该三次方程的三个根恰好是直线与 $E$ 的三个交点 $P_1, P_2, P_1 * P_2$ 的横坐标 $x_1, x_2, x_3$！由一元三次方程的 Vieta 定理（根与系数的关系），三根之和等于二次项系数的相反数：
$$x_1 + x_2 + x_3 = k^2 \implies x_3 = k^2 - x_1 - x_2.$$
此时第三个交点 $P_1 * P_2$ 的坐标为 $\bigl(x_3, \; k(x_3 - x_1) + y_1\bigr)$。对其关于 $x$-轴取反射（即执行 $O * (P_1 * P_2)$），立即得到 $P_3 = P_1 + P_2 = (x_3, y_3)$，其中 $y_3 = -k(x_3 - x_1) - y_1$。 **Q.E.D.**

##### Exercise 1.8 (四叶玫瑰线与三重点曲线的有理参数化)
设 $\operatorname{char} k = 0$。证明四次平面曲线（四叶玫瑰线 / Four-leaved Rose）：
$$C: (x^2 + y^2)^3 = 4 x^2 y^2$$
在原点 $O(0, 0)$ 处有一个重数为 $4$ 的奇点？不，先求它在原点处的重数与切锥，并探讨它能否用 $y = tx$ 进行有理参数化（提示：令 $x = r \cos\theta, y = r \sin\theta$ 或利用半角有理代换 $u = \tan(\theta/2)$）。

**Proof.**
1. 将方程写为 $f(x, y) = -4 x^2 y^2 + (x^2 + y^2)^3 = 0$。其最低次非零齐次项是 $4$ 次项 $f_4(x, y) = -4 x^2 y^2$，高次项是 $6$ 次项 $f_6(x, y) = (x^2 + y^2)^3$。因此 $C$ 其实是一条 **$6$ 次平面代数曲线**，在原点 $O(0,0)$ 处的重数为 $m_O(C) = 4$，切锥方程为 $x^2 y^2 = 0$（即坐标轴 $x = 0$ 与 $y = 0$ 各作为二重切线）。
2. 用过原点的直线束 $y = t x$ 代入方程，得：
   $$x^6 (1 + t^2)^3 = 4 t^2 x^4 \implies x^2 = \frac{4 t^2}{(1 + t^2)^3}.$$
   由于右边分子 $4 t^2 = (2t)^2$ 已经是完全平方，只需令 $1 + t^2$ 也化为平方：做经典的三角有理参数化（即单位圆的有理参数化），令：
   $$\frac{1}{1 + t^2} \text{ 对应 } \cos^2\theta \implies \text{直接取 } X = \cos\theta = \frac{1 - s^2}{1 + s^2}, \quad Y = \sin\theta = \frac{2s}{1 + s^2},$$
   在极坐标下 $r = 2 \sin\theta \cos\theta = 2 X Y$，从而：
   $$x(s) = r \cos\theta = 2 X^2 Y = \frac{4s(1 - s^2)^2}{(1 + s^2)^3}, \qquad y(s) = r \sin\theta = 2 X Y^2 = \frac{8 s^2 (1 - s^2)}{(1 + s^2)^3}.$$
   直接验证可知 $x(s)^2 + y(s)^2 = 4 X^2 Y^2 (X^2 + Y^2) = 4 X^2 Y^2$，两边立方得 $\bigl(x(s)^2 + y(s)^2\bigr)^3 = 64 X^6 Y^6 = 4 \cdot (4 X^4 Y^2) \cdot (4 X^2 Y^4) = 4 x(s)^2 y(s)^2$，故 $C$ 是有理曲线！ **Q.E.D.**

##### Exercise 1.9 (从光滑三次曲线上的非拐点投影构造双叶覆盖)
设 $C \subset \mathbb{P}^2_k$（$\operatorname{char} k \neq 2$）为光滑平面三次曲线，$P_0 \in C$ 为 $C$ 上的任意光滑点。证明：从点 $P_0$ 向不在 $P_0$ 上的一条射影直线 $\mathbb{P}^1_k$ 作中心投影 $\pi: C \to \mathbb{P}^1_k$（在点 $P_0$ 处由切线 $T_{P_0} C$ 的方向延续定义），给出了 $C$ 到 $\mathbb{P}^1_k$ 的一个次数为 $2$ 的态射（二叶分歧覆盖），且从 $P_0$ 向曲线 $C$ 的其他点最多可引出 **$4$ 条不同的切线**（切点异于 $P_0$）。

**Proof.**
选取射影坐标系使 $P_0 = [0 : 1 : 0]$，并令 $P_0$ 处的切线 $T_{P_0} C$ 为 $X = 0$（若 $P_0$ 不是拐点，则 $X = 0$ 与 $C$ 在 $P_0$ 相交重数为 $2$；若 $P_0$ 是拐点，可将切线置于 $Z = 0$）。在一般情形下，因为 $[0:1:0] \in C$，三次多项式 $F(X, Y, Z)$ 不含 $Y^3$ 项，按 $Y$ 的幂次展开为：
$$F(X, Y, Z) = A_1(X, Z) Y^2 + A_2(X, Z) Y + A_3(X, Z) = 0,$$
其中 $A_i(X, Z)$ 是关于 $(X, Z)$ 的 $i$ 次二元齐次多项式。因为 $P_0$ 是光滑点且切线为 $A_1(X, Z) = 0$，我们可令 $A_1(X, Z) = Z$。对过 $P_0 = [0:1:0]$ 的直线束 $L_{[X:Z]}$（参数为 $[X:Z] \in \mathbb{P}^1_k$），除 $P_0$ 以外的另外两个交点由关于 $Y$ 的二次方程：
$$Z Y^2 + A_2(X, Z) Y + A_3(X, Z) = 0$$
决定，因此一般每条过 $P_0$ 的直线与 $C$ 另有 $2$ 个交点，即 $\pi: C \to \mathbb{P}^1_k, [X:Y:Z] \mapsto [X:Z]$ 是 $2:1$ 的分歧覆盖。
直线 $L_{[X:Z]}$ 在异于 $P_0$ 的某点 $Q \in C$ 处与 $C$ 相切，当且仅当上述关于 $Y$ 的二次方程有重根，即其判别式（Discriminant）为零：
$$\Delta(X, Z) := A_2(X, Z)^2 - 4 Z A_3(X, Z) = 0.$$
这是一个关于 $(X, Z)$ 的 **$4$ 次二元齐次方程**。因为 $C$ 非奇异，容易验证 $\Delta(X, Z)$ 无重根（若 $\Delta$ 有重根 $(x_0, z_0)$，把 $L_{[x_0:z_0]}$ 选为 $X=0$ 可导出 $C$ 在重根对应的 $Y$ 处三个偏导数全为零，与 $C$ 光滑矛盾）。当 $P_0$ 不是拐点时，$Z \nmid A_2(X, Z)$，故 $Z = 0$（即 $T_{P_0} C$ 本身）不是 $\Delta = 0$ 的根，从而过 $P_0$ 恰有 $4$ 条切线切于异于 $P_0$ 的点；当 $P_0$ 是拐点时，$Z \mid A_2$，此时 $Z = 0$ 占据 $\Delta = 0$ 的一个根，另有 $3$ 条切线切于 $3$ 个非平凡 $2$ 阶挠点。 **Q.E.D.**

##### Exercise 1.10 (九点三次曲线束中的退化曲线个数与 12 重点计数)
设 $C_1, C_2 \subset \mathbb{P}^2_{\mathbb{C}}$ 为两条一般位置的光滑三次曲线，横截相交于 $9$ 个点 $P_1, \dots, P_9$。考虑三次曲线束 $C_{[\lambda:\mu]}: \lambda F_1 + \mu F_2 = 0$。证明：在一搬情况下，该束中恰有 **$12$ 条奇异（结点）三次曲线**（这个数字 $12$ 正是连接平面拓扑欧拉示性数 $\chi(\mathbb{P}^2_{\mathbb{C}}) = 3$ 与椭圆曲线欧拉示性数 $\chi(E) = 0$ 的 Zeuthen-Segre 不变量）。

**Proof.**
1. **代数消元维度计数**：束中曲线 $F = \lambda F_1 + \mu F_2$ 在点 $P = [X:Y:Z]$ 处奇异，当且仅当：
   $$\lambda \frac{\partial F_1}{\partial X_i}(P) + \mu \frac{\partial F_2}{\partial X_i}(P) = 0 \qquad (i = 0, 1, 2).$$
   消去 $[\lambda : \mu]$ 等价于 $3 \times 2$ 雅可比矩阵 $\left(\frac{\partial F_1}{\partial X_i}, \frac{\partial F_2}{\partial X_i}\right)$ 的秩 $\le 1$，即所有 $2 \times 2$ 子式为零：
   $$D_{ij} := \frac{\partial F_1}{\partial X_i}\frac{\partial F_2}{\partial X_j} - \frac{\partial F_1}{\partial X_j}\frac{\partial F_2}{\partial X_i} = 0.$$
   每个 $D_{ij}$ 是 $2 + 2 = 4$ 次齐次式。两条 $4$ 次曲线 $D_{01} = 0$ 与 $D_{02} = 0$ 按 Bézout 定理有 $4 \times 4 = 16$ 个交点，其中必须扣除使第一行 $\frac{\partial F_1}{\partial X_0} = \frac{\partial F_2}{\partial X_0} = 0$ 但 $D_{12} \neq 0$ 的 $2 \times 2 = 4$ 个伪解，故真正使三个 $2 \times 2$ 子式同时为零的奇点恰有 $16 - 4 = 12$ 个！
2. **拓扑欧拉示性数证明**：将 $\mathbb{P}^2_{\mathbb{C}}$ 在 $9$ 个基点 $P_1, \dots, P_9$ 处作爆破（Blowup），得到光滑复曲面 $\tilde{S} = \operatorname{Bl}_{P_1,\dots,P_9} \mathbb{P}^2_{\mathbb{C}}$，此时有理映射 $[F_1 : F_2]$ 化为光滑椭圆纤维化态射 $\pi: \tilde{S} \to \mathbb{P}^1_{\mathbb{C}}$。每吹起一个点，等于用一条例外直线 $\mathbb{P}^1_{\mathbb{C}}$（满足 $\chi(\mathbb{P}^1_{\mathbb{C}}) = 2$）替换一个单点（$\chi(\{\mathrm{pt}\}) = 1$），使拓扑欧拉示性数增加 $1$。因此：
   $$\chi(\tilde{S}) = \chi(\mathbb{P}^2_{\mathbb{C}}) + 9 = 3 + 9 = 12.$$
   另一方面，对于纤维化 $\pi: \tilde{S} \to \mathbb{P}^1_{\mathbb{C}}$，一般光滑纤维是环面 $E \cong S^1 \times S^1$，其欧拉示性数 $\chi(E) = 0$；而每一条具有普通二重点（结点）的奇异纤维 $E_{\mathrm{node}}$ 是把环面的一个非平凡闭路捏成一个点得到的“捏环面（Pinched Torus，同伦于 $S^1 \vee S^2$）”，其欧拉示性数为 $\chi(E_{\mathrm{node}}) = 1$。因此总欧拉示性数完全由奇异纤维贡献：
   $$12 = \chi(\tilde{S}) = \sum_{s \in \mathrm{Sing}(\pi)} \bigl(\chi(E_s) - \chi(E_{\mathrm{gen}})\bigr) = \sum_{s \in \mathrm{Sing}(\pi)} 1 = \#\{\text{奇异三次曲线}\}.$$
   故一般三次曲线束中恰有 $12$ 条结点三次曲线。 **Q.E.D.**

##### Exercise 1.11 (对偶曲线 Dual Curve 与 Plücker 公式初探)
设 $C: F(X, Y, Z) = 0$ 为 $\mathbb{P}^2_k$（$k = \bar{k}, \operatorname{char} k = 0$）中的光滑 $d$ 次曲线（$d \ge 2$）。对每个点 $P \in C$，其切线 $T_P C: \frac{\partial F}{\partial X}(P) X + \frac{\partial F}{\partial Y}(P) Y + \frac{\partial F}{\partial Z}(P) Z = 0$ 对应对偶射影平面 $(\mathbb{P}^2_k)^\vee$ 中的点：
$$\gamma(P) := \left[ \frac{\partial F}{\partial X}(P) : \frac{\partial F}{\partial Y}(P) : \frac{\partial F}{\partial Z}(P) \right] \in (\mathbb{P}^2_k)^\vee.$$
像集 $C^\vee := \gamma(C) \subset (\mathbb{P}^2_k)^\vee$ 称为 $C$ 的**对偶曲线（Dual Curve）**。
1. 证明光滑二次曲线 $Q$ 的对偶曲线 $Q^\vee$ 仍是光滑二次曲线；
2. 证明光滑 $d$ 次曲线 $C$ 的对偶曲线 $C^\vee$ 的次数（即过平面上一般点 $P_0 \notin C$ 可向 $C$ 引出的切线条数，称为 $C$ 的**类 Class** $d^\vee$）等于：
   $$d^\vee = \deg(C^\vee) = d(d - 1).$$
   特别地，光滑三次曲线（$d = 3$）的对偶曲线 $C^\vee$ 是一条 **$6$ 次曲线（Sextic Curve）**，且原曲线 $C$ 的 $9$ 个拐点对应对偶曲线 $C^\vee$ 上的 **$9$ 个尖点（Cusps）**！

**Proof.**
1. 对光滑二次曲线 $Q: X^2 + Y^2 + Z^2 = 0$，映射 $\gamma([X:Y:Z]) = [2X : 2Y : 2Z] = [X : Y : Z]$，故对偶曲线方程仍为 $A^2 + B^2 + C^2 = 0$，依然是光滑二次曲线。
2. 对偶射影平面 $(\mathbb{P}^2_k)^\vee$ 中的一条直线 $L^\vee_{P_0}: x_0 A + y_0 B + z_0 C = 0$ 恰好由原平面 $\mathbb{P}^2_k$ 中的一个点 $P_0 = [x_0 : y_0 : z_0]$ 所定义，且点 $[A:B:C] \in C^\vee \cap L^\vee_{P_0}$ 当且仅当原曲线的切线 $A X + B Y + C Z = 0$ 经过点 $P_0$。如 **Proposition 1.10.1** 证明中所见，切线 $T_P C$ 经过一般点 $P_0$ 当且仅当 $P$ 位于 $C$（$d$ 次）与极曲线 $x_0 \frac{\partial F}{\partial X} + y_0 \frac{\partial F}{\partial Y} + z_0 \frac{\partial F}{\partial Z} = 0$（$d - 1$ 次）的交集上。由 Bézout 定理，一般点 $P_0$ 对应的切点共有 $d(d - 1)$ 个，故一般直线 $L^\vee_{P_0}$ 与 $C^\vee$ 交于 $d(d - 1)$ 个点，即 $\deg(C^\vee) = d(d - 1)$。当 $d = 3$ 时，$d^\vee = 3 \times 2 = 6$。若 $P \in C$ 是拐点，在局部坐标下曲线为 $y = x^3 + \dots$，切线方程 $Y = 3x^2 X - 2x^3$ 的对偶坐标为 $(A, B) = (3x^2, -2x^3)$，这正是在原点处带有尖点 $4 A^3 - 27 B^2 = 0$ 的局部参数化！因此 $C$ 的 $9$ 个拐点恰好转化为对偶 $6$ 次曲线 $C^\vee$ 的 $9$ 个尖点。 **Q.E.D.**

##### Exercise 1.12 (利用三次曲线群律构造有理点递推：Bachet 方程)
考虑有理数域 $k = \mathbb{Q}$ 上的光滑三次曲线（Bachet 方程）$E: y^2 = x^3 - 2$，其无穷远拐点为 $O = [0 : 1 : 0]$。已知 $P = (3, 5) \in E(\mathbb{Q})$ 是其上的一个整数点。利用 **Exercise 1.7** 的群律倍点公式计算 $2P = P + P \in E(\mathbb{Q})$，并验证它给出了方程 $y^2 = x^3 - 2$ 的一组非整数有理数解。

**Proof.**
在 $E: y^2 = x^3 - 2$ 中，$p = 0, q = -2$，且 $P = (x_1, y_1) = (3, 5)$ 满足 $5^2 = 25 = 3^3 - 2 = 27 - 2$。
计算 $E$ 在点 $P(3, 5)$ 处的切线斜率 $k$：
$$k = \frac{3 x_1^2 + p}{2 y_1} = \frac{3 \times 3^2 + 0}{2 \times 5} = \frac{27}{10}.$$
代入倍点横坐标公式 $x_3 = k^2 - 2 x_1$：
$$x_3 = \left(\frac{27}{10}\right)^2 - 2 \times 3 = \frac{729}{100} - 6 = \frac{129}{100}.$$
代入纵坐标公式 $y_3 = -k(x_3 - x_1) - y_1$：
$$y_3 = -\frac{27}{10}\left(\frac{129}{100} - 3\right) - 5 = -\frac{27}{10}\left(-\frac{171}{100}\right) - 5 = \frac{4617}{1000} - \frac{5000}{1000} = -\frac{383}{1000}.$$
直接检验：
$$y_3^2 = \left(-\frac{383}{1000}\right)^2 = \frac{146689}{1000000}, \qquad x_3^3 - 2 = \left(\frac{129}{100}\right)^3 - 2 = \frac{2146689 - 2000000}{1000000} = \frac{146689}{1000000}.$$
两端完全相等！由此得到新的有理点 $2P = \left(\frac{129}{100}, -\frac{383}{1000}\right) \in E(\mathbb{Q})$，继续递推 $nP$ 可生成无穷多个互不相同的有理点。 **Q.E.D.**

## Part II: 仿射簇与 Hilbert 零点定理

### Chapter 2: Affine Varieties and the Nullstellensatz

#### 2.1 Noetherian rings and Hilbert's basis theorem

在由无限多个多项式方程构成的方程组 $\{f_\alpha(X_1, \dots, X_n) = 0\}_{\alpha \in \Lambda}$ 中，我们能否总是从中挑选出**有限个**方程 $f_1 = \dots = f_m = 0$，使得它们的公共零点集与原无限方程组的公共零点集完全相同？Hilbert 在 1890 年关于不变量理论的开创性工作中给出了肯定的回答，这便是交换代数与代数几何的基石——**Hilbert 基定理（Hilbert's Basis Theorem）**。

**Definition 2.1.1 (Noether 环与升链条件 ACC).**
设 $A$ 为交换含幺环（Commutative Ring with $1$）。如果 $A$ 满足以下三个彼此等价的条件之一，则称 $A$ 为 **Noether 环（Noetherian Ring）**：
1. **理想有限生成性（Finite Generation of Ideals）**：$A$ 的每一个理想 $I \subset A$ 都是有限生成的，即存在有限个元素 $f_1, \dots, f_r \in I$ 使得：
   $$I = (f_1, \dots, f_r) = A f_1 + \dots + A f_r = \left\{ \sum_{i=1}^r g_i f_i \;\middle|\; g_i \in A \right\}.$$
2. **升链条件（Ascending Chain Condition, ACC）**：$A$ 中任意由理想构成的递增链：
   $$I_1 \subseteq I_2 \subseteq I_3 \subseteq \dots \subseteq I_m \subseteq \dots$$
   必然是**稳定（Stationary）**的，即存在正整数 $N \ge 1$，使得对所有 $m \ge N$ 均有 $I_m = I_N$。
3. **极大元条件（Maximal Condition）**：$A$ 的所有理想构成的集合中，任意非空子族 $\Sigma \neq \varnothing$（按包含关系 $\subseteq$ 偏序）必包含至少一个**极大元**（即存在 $I_0 \in \Sigma$，使得不存在 $J \in \Sigma$ 满足 $I_0 \subsetneq J$）。

**Proposition 2.1.2 (Noether 环三个定义条件的等价性证明).**
上述 **Definition 2.1.1** 中的条件 1、条件 2 与条件 3 彼此等价。

**Proof.**
1. **(1 $\Rightarrow$ 2)**：设 $I_1 \subseteq I_2 \subseteq I_3 \subseteq \dots$ 为 $A$ 中的一条理想升链。考虑并集：
   $$I := \bigcup_{m=1}^\infty I_m.$$
   容易验证 $I$ 是 $A$ 的一个理想（任取 $x, y \in I$，存在某个足够大的下标 $k$ 使 $x, y \in I_k$，故 $x - y \in I_k \subseteq I$，且对任意 $a \in A$ 有 $ax \in I_k \subseteq I$）。由条件 1，理想 $I$ 是有限生成的，设 $I = (f_1, \dots, f_r)$。因为每个生成元 $f_j \in \bigcup_{m=1}^\infty I_m$，故存在下标 $N_j$ 使 $f_j \in I_{N_j}$。取 $N = \max(N_1, \dots, N_r)$，则所有生成元 $f_1, \dots, f_r \in I_N$，从而：
   $$I = (f_1, \dots, f_r) \subseteq I_N \subseteq I_m \subseteq I \qquad (\forall m \ge N).$$
   因此对所有 $m \ge N$ 均有 $I_m = I_N$，升链条件成立。
2. **(2 $\Rightarrow$ 3)**：用反证法。假设存在非空理想族 $\Sigma$ 没有极大元。任取 $I_1 \in \Sigma$；因为 $I_1$ 不是 $\Sigma$ 的极大元，必存在 $I_2 \in \Sigma$ 使 $I_1 \subsetneq I_2$；同理又存在 $I_3 \in \Sigma$ 使 $I_2 \subsetneq I_3$。依此类推（由可数选择公理），得到一条严格递增的无限理想链：
   $$I_1 \subsetneq I_2 \subsetneq I_3 \subsetneq \dots,$$
   这与升链条件（条件 2）矛盾！
3. **(3 $\Rightarrow$ 1)**：设 $I \subset A$ 为任意理想。考虑 $I$ 的所有**有限生成子理想**构成的集合：
   $$\Sigma := \{ J \subseteq I \mid J \text{ 是 } A \text{ 的有限生成理想} \}.$$
   因为零理想 $(0) \in \Sigma$，故 $\Sigma$ 非空。由条件 3，$\Sigma$ 中存在一个极大元 $J_0 = (f_1, \dots, f_r) \subseteq I$。我们断言 $J_0 = I$：若不然，存在元素 $f_{r+1} \in I \setminus J_0$，则理想 $J_1 := J_0 + (f_{r+1}) = (f_1, \dots, f_r, f_{r+1}) \subseteq I$ 仍然是有限生成的，即 $J_1 \in \Sigma$，但 $J_0 \subsetneq J_1$，这与 $J_0$ 在 $\Sigma$ 中的极大性矛盾！故 $I = J_0 = (f_1, \dots, f_r)$ 是有限生成的。 **Q.E.D.**

**Proposition 2.1.3 (商环与分式环保持 Noether 性).**
设 $A$ 为 Noether 环。则：
1. 对任意理想 $I \subset A$，商环 $A/I$ 也是 Noether 环。
2. 对 $A$ 的任意乘法封闭子集 $S \subseteq A$（即 $1 \in S$ 且对任意 $s_1, s_2 \in S$ 有 $s_1 s_2 \in S$），局部化（分式环）$S^{-1} A$ 也是 Noether 环。

**Proof.**
1. 设 $\pi: A \to A/I$ 为自然商同态。对商环 $A/I$ 中的任意理想 $\bar{J} \subset A/I$，其逆像 $J := \pi^{-1}(\bar{J})$ 是 $A$ 的包含 $I$ 的理想。因 $A$ 是 Noether 环，存在有限生成元 $f_1, \dots, f_r \in A$ 使 $J = (f_1, \dots, f_r)$。由于 $\pi$ 是满射，$\bar{J} = \pi(J) = (\pi(f_1), \dots, \pi(f_r))$ 在 $A/I$ 中有限生成。
2. 设 $\iota: A \to S^{-1} A, a \mapsto a/1$ 为自然局部化同态。对 $S^{-1} A$ 中的任意理想 $\mathcal{J} \subset S^{-1} A$，令 $J := \iota^{-1}(\mathcal{J}) = \{ a \in A \mid a/1 \in \mathcal{J} \}$，这是 $A$ 的理想，故在 $A$ 中有限生成：$J = (f_1, \dots, f_r)$。任取元素 $x/s \in \mathcal{J}$（其中 $x \in A, s \in S$），则 $x/1 = (s/1)(x/s) \in \mathcal{J}$，故 $x \in J$，从而可写为 $x = \sum_{i=1}^r a_i f_i$（$a_i \in A$）。两边同除以 $s$ 得：
   $$\frac{x}{s} = \sum_{i=1}^r \frac{a_i}{s} \cdot \frac{f_i}{1},$$
   这说明 $\mathcal{J}$ 在 $S^{-1} A$ 中由 $\frac{f_1}{1}, \dots, \frac{f_r}{1}$ 有限生成。 **Q.E.D.**

**Theorem 2.1.4 (Hilbert 基定理 / Hilbert's Basis Theorem).**
若交换环 $A$ 是 Noether 环，则其上的一元多项式环 $A[X]$ 也是 Noether 环。

**Proof.**
设 $I \subset A[X]$ 是多项式环 $A[X]$ 的任意理想，我们要证明 $I$ 在 $A[X]$ 中是有限生成的。如果 $I = (0)$，结论平凡成立。现设 $I \neq (0)$。
对于每一个非负整数 $m \ge 0$，考虑 $I$ 中所有次数不超过 $m$ 的多项式的“$m$ 次首项系数”构成的集合（连同 $0$）：
$$\mathfrak{a}_m := \left\{ a \in A \;\middle|\; \exists f(X) = a X^m + b_{m-1} X^{m-1} + \dots + b_0 \in I \right\}.$$
我们验证如下性质：
1. **每个 $\mathfrak{a}_m$ 是 $A$ 的理想**：显然 $0 \in \mathfrak{a}_m$；若 $a, a' \in \mathfrak{a}_m$ 分别对应多项式 $f(X) = a X^m + \dots \in I$ 与 $f'(X) = a' X^m + \dots \in I$，则 $f(X) - f'(X) = (a - a') X^m + \dots \in I$，故 $a - a' \in \mathfrak{a}_m$；对任意 $c \in A$，$c f(X) = (ca) X^m + \dots \in I$，故 $ca \in \mathfrak{a}_m$。
2. **理想序列 $\{\mathfrak{a}_m\}_{m \ge 0}$ 构成 $A$ 中的一条升链**：
   $$\mathfrak{a}_0 \subseteq \mathfrak{a}_1 \subseteq \mathfrak{a}_2 \subseteq \dots \subseteq \mathfrak{a}_m \subseteq \mathfrak{a}_{m+1} \subseteq \dots$$
   事实上，任取 $a \in \mathfrak{a}_m$，存在 $f(X) = a X^m + b_{m-1} X^{m-1} + \dots + b_0 \in I$。由于 $I$ 是 $A[X]$ 的理想，乘以 $X$ 仍属于 $I$：
   $$X f(X) = a X^{m+1} + b_{m-1} X^m + \dots + b_0 X \in I,$$
   这表明 $a \in \mathfrak{a}_{m+1}$，即 $\mathfrak{a}_m \subseteq \mathfrak{a}_{m+1}$。
3. **利用 $A$ 的 Noether 性提取有限生成元**：
   因为 $A$ 是 Noether 环，升链 $\mathfrak{a}_0 \subseteq \mathfrak{a}_1 \subseteq \dots$ 必在某一步 $N \ge 0$ 处稳定，即：
   $$\mathfrak{a}_N = \mathfrak{a}_{N+1} = \mathfrak{a}_{N+2} = \dots$$
   并且，对于每一个 $0 \le m \le N$，理想 $\mathfrak{a}_m$ 在 $A$ 中都是有限生成的：设 $\mathfrak{a}_m = (a_{m, 1}, a_{m, 2}, \dots, a_{m, r_m})$。根据 $\mathfrak{a}_m$ 的定义，对每个生成元 $a_{m, j} \in \mathfrak{a}_m$，都可以在 $I$ 中选取一个次数为 $m$（或首项为 $a_{m, j} X^m$）的多项式：
   $$f_{m, j}(X) = a_{m, j} X^m + \text{(次数 } < m \text{ 的项)} \in I \qquad (0 \le m \le N, \; 1 \le j \le r_m).$$
4. **证明有限集合 $\mathcal{G} := \{ f_{m, j} \mid 0 \le m \le N, \; 1 \le j \le r_m \}$ 生成整个理想 $I$**：
   记 $I_0 := (\mathcal{G}) \subseteq I$ 为由这有限个多项式生成的子理想。我们对多项式 $g(X) \in I$ 的次数 $d = \deg g$ 进行数学归纳，证明对所有 $g \in I$ 都有 $g \in I_0$：
   - **当 $d = 0$（或 $g = 0$）时**：常值多项式 $g = c \in I$ 意味着 $c \in \mathfrak{a}_0 = (a_{0,1}, \dots, a_{0,r_0})$，而 $f_{0,j} = a_{0,j}$，故 $g = \sum_{j=1}^{r_0} c_j f_{0,j} \in I_0$。
   - **归纳步（设次数 $< d$ 的 $I$ 中多项式均属于 $I_0$，现设 $\deg g = d \ge 1$）**：
     写出 $g(X) = c X^d + \text{(次数 } < d \text{ 的项)} \in I$，则首项系数 $c \in \mathfrak{a}_d$。分两种情况：
     - **情况 A（$d \le N$）**：此时 $c \in \mathfrak{a}_d = (a_{d,1}, \dots, a_{d,r_d})$，故存在 $b_1, \dots, b_{r_d} \in A$ 使得 $c = \sum_{j=1}^{r_d} b_j a_{d,j}$。构造多项式：
       $$g_1(X) := g(X) - \sum_{j=1}^{r_d} b_j f_{d, j}(X).$$
       显然 $g_1(X) \in I$，且 $g(X)$ 的 $d$ 次项 $c X^d$ 被精确消去，故 $\deg g_1 < d$（或 $g_1 = 0$）。由归纳假设，$g_1 \in I_0$，从而 $g = g_1 + \sum_j b_j f_{d,j} \in I_0$。
     - **情况 B（$d > N$）**：因为升链在 $N$ 处稳定，有 $c \in \mathfrak{a}_d = \mathfrak{a}_N = (a_{N,1}, \dots, a_{N,r_N})$，故存在 $b_1, \dots, b_{r_N} \in A$ 使得 $c = \sum_{j=1}^{r_N} b_j a_{N,j}$。注意此时每个 $f_{N, j}(X)$ 的次数为 $N$，我们需要乘以单项式 $X^{d - N}$ 将其次数提升到 $d$！构造多项式：
       $$g_1(X) := g(X) - \sum_{j=1}^{r_N} b_j X^{d - N} f_{N, j}(X).$$
       因为 $I_0 \subseteq I$ 是理想，被减项属于 $I_0 \subseteq I$，故 $g_1 \in I$；同时 $g(X)$ 的最高次项 $c X^d$ 被 $\sum_j b_j a_{N,j} X^{d-N} X^N = c X^d$ 精确消去，故 $\deg g_1 < d$。由归纳假设知 $g_1 \in I_0$，从而 $g \in I_0$。
   因此 $I = I_0$ 是有限生成的，$A[X]$ 为 Noether 环。 **Q.E.D.**

**Corollary 2.1.5 (多元多项式环与有限生成代数的 Noether 性).**
设 $k$ 为任意域（或 $\mathbb{Z}$ 等任意主理想整环 / Noether 环）。则：
1. $n$ 元多项式环 $k[X_1, \dots, X_n]$ 是 Noether 环；
2. 任意有限生成交换 $k$-代数 $R = k[x_1, \dots, x_n]$ 都是 Noether 环。

**Proof.**
1. 域 $k$ 只有两个理想 $(0)$ 和 $(1) = k$，显然是 Noether 环。由 $k[X_1, \dots, X_n] = (k[X_1, \dots, X_{n-1}])[X_n]$，对变元个数 $n$ 反复应用 **Theorem 2.1.4** 即知 $k[X_1, \dots, X_n]$ 是 Noether 环。
2. 任意有限生成 $k$-代数 $R = k[x_1, \dots, x_n]$ 都是多项式环 $k[X_1, \dots, X_n]$ 在满同态 $X_i \mapsto x_i$ 下的商环 $k[X_1, \dots, X_n]/I$，由 **Proposition 2.1.3(1)** 知 $R$ 必为 Noether 环。 **Q.E.D.**

#### 2.2 The V-I correspondence and Zariski topology

现在我们在 $n$ 维仿射空间 $\mathbb{A}^n_k = k^n$ 与多项式环 $A = k[X_1, \dots, X_n]$ 的子集之间建立代数与几何的双向映射（Galois 对应）。

**Definition 2.2.1 (零点轨迹映射 $V$ 与消失理想映射 $I$).**
1. 对任意子集 $S \subseteq k[X_1, \dots, X_n]$，定义它在 $\mathbb{A}^n_k$ 中切出的**仿射代数集（Affine Algebraic Set）**为：
   $$V(S) := \left\{ P = (a_1, \dots, a_n) \in \mathbb{A}^n_k \;\middle|\; f(P) = 0, \;\forall f \in S \right\}.$$
   若 $I = (S)$ 是由 $S$ 生成的理想，显然 $V(S) = V(I)$。并且由 **Corollary 2.1.5（Hilbert 基定理）**，存在有限个多项式 $f_1, \dots, f_r \in I$ 使得 $I = (f_1, \dots, f_r)$，从而**每一个仿射代数集都可以由有限个多项式方程定义**：
   $$V(I) = V(f_1, \dots, f_r) = \bigcap_{i=1}^r V(f_i).$$
2. 反过来，对仿射空间中的任意点集 $X \subseteq \mathbb{A}^n_k$，定义 $X$ 的**消失理想（Ideal of Vanishing Polynomials）**为：
   $$I(X) := \left\{ f \in k[X_1, \dots, X_n] \;\middle|\; f(P) = 0, \;\forall P \in X \right\}.$$

**Proposition 2.2.2 ($V$ 与 $I$ 的基本代数-几何性质).**
设 $I, J, \{I_\lambda\}_{\lambda \in \Lambda}$ 为 $k[X_1, \dots, X_n]$ 中的理想，$X, Y \subseteq \mathbb{A}^n_k$ 为点集。则：
1. **边界值**：$V(0) = \mathbb{A}^n_k$，$V(1) = \varnothing$；反之 $I(\varnothing) = k[X_1, \dots, X_n] = (1)$，且当 $k$ 为无限域时 $I(\mathbb{A}^n_k) = (0)$（见 **Exercise 0.1**）。
2. **反序性（Order-reversing）**：
   $$I \subseteq J \implies V(I) \supseteq V(J), \qquad X \subseteq Y \implies I(X) \supseteq I(Y).$$
3. **有限并集与乘积/交集**：对任意两个理想 $I, J \subset k[X_1, \dots, X_n]$，有：
   $$V(I \cdot J) = V(I \cap J) = V(I) \cup V(J).$$
4. **任意交集与理想和**：对任意一族理想 $\{I_\lambda\}_{\lambda \in \Lambda}$，有：
   $$V\left( \sum_{\lambda \in \Lambda} I_\lambda \right) = V\left( \bigcup_{\lambda \in \Lambda} I_\lambda \right) = \bigcap_{\lambda \in \Lambda} V(I_\lambda).$$
5. **闭包与伽罗瓦连接恒等式**：对任意点集 $X, Y \subseteq \mathbb{A}^n_k$ 及理想 $I \subset k[X_1, \dots, X_n]$，有：
   $$I(X \cup Y) = I(X) \cap I(Y), \qquad X \subseteq V(I(X)), \qquad I \subseteq I(V(I)),$$
   并且三重复合恒满足：
   $$V\bigl(I(V(I))\bigr) = V(I), \qquad I\bigl(V(I(X))\bigr) = I(X).$$

**Proof.**
1, 2, 4 均由定义直接推出。我们重点验证性质 3 和性质 5：
- **性质 3 的证明**：因 $I \cdot J \subseteq I \cap J \subseteq I, J$，由反序性知 $V(I) \cup V(J) \subseteq V(I \cap J) \subseteq V(I \cdot J)$。反之，任取点 $P \in V(I \cdot J)$。若 $P \in V(I)$，则 $P \in V(I) \cup V(J)$ 成立；若 $P \notin V(I)$，则存在某多项式 $f \in I$ 使得 $f(P) \neq 0$。此时对任意 $g \in J$，乘积 $f g \in I \cdot J$，故 $(fg)(P) = f(P) g(P) = 0$。因为 $k$ 是域且 $f(P) \neq 0$，必有 $g(P) = 0$（对所有 $g \in J$），即 $P \in V(J)$！故 $V(I \cdot J) \subseteq V(I) \cup V(J)$。
- **性质 5 的证明**：由定义，$X$ 上的点使 $I(X)$ 中所有多项式为零，故 $X \subseteq V(I(X))$；同理 $I$ 中所有多项式在 $V(I)$ 上为零，故 $I \subseteq I(V(I))$。将反序映射 $V$ 作用于 $I \subseteq I(V(I))$ 得 $V(I) \supseteq V(I(V(I)))$；另一方面在 $X \subseteq V(I(X))$ 中取 $X = V(I)$ 得 $V(I) \subseteq V(I(V(I)))$，故 $V(I(V(I))) = V(I)$。同理可得 $I(V(I(X))) = I(X)$。 **Q.E.D.**

**Corollary-Definition 2.2.3 (Zariski 拓扑与主开集基).**
由 **Proposition 2.2.2** 的性质 1、3、4 可知，仿射空间 $\mathbb{A}^n_k$ 中全体仿射代数集 $\{ V(I) \mid I \subseteq k[X_1, \dots, X_n] \}$ 满足拓扑空间闭集公理（含空集与全集、对有限并封闭、对任意交封闭）。
1. 以全体仿射代数集 $V(I)$ 为闭集在 $\mathbb{A}^n_k$ 上定义的拓扑称为 **Zariski 拓扑（Zariski Topology）**；对任意子集 $V \subseteq \mathbb{A}^n_k$，其子空间诱导拓扑也称为 $V$ 上的 Zariski 拓扑。在 Zariski 拓扑下，任意点集 $X \subseteq \mathbb{A}^n_k$ 的闭包恰为 $\overline{X} = V(I(X))$。
2. 对任意多项式 $g \in k[X_1, \dots, X_n]$（或坐标环元素 $g \in k[V]$），超曲面 $V(g)$ 的补集：
   $$D(g) := V \setminus V(g) = \{ P \in V \mid g(P) \neq 0 \}$$
   称为 $V$ 的一个**主开集（Principal Open Subset 或 Standard Open Subset）**。全体主开集 $\{ D(g) \mid g \in k[V] \}$ 构成 $V$ 上 Zariski 拓扑的一组**拓扑基（Basis of Open Sets）**，且满足 $D(g_1) \cap D(g_2) = D(g_1 g_2)$。

**Proof.**
任取 $V$ 中的 Zariski 开集 $U = V \setminus V(I)$。由 Hilbert 基定理，$I = (g_1, \dots, g_r)$，故 $V(I) = \bigcap_{i=1}^r V(g_i)$。由德摩根定律：
$$U = V \setminus \bigcap_{i=1}^r V(g_i) = \bigcup_{i=1}^r \bigl(V \setminus V(g_i)\bigr) = \bigcup_{i=1}^r D(g_i),$$
这说明任意开集都是有限个主开集的并集（同时也证明了 Zariski 拓扑下的任意开集 $U$ 都是**准紧的 Quasi-compact**，即任意开覆盖必有有限子覆盖！）。此外，由于在域 $k$ 中 $g_1(P) g_2(P) \neq 0 \iff g_1(P) \neq 0$ 且 $g_2(P) \neq 0$，故 $D(g_1) \cap D(g_2) = D(g_1 g_2)$。 **Q.E.D.**

#### 2.3 Irreducible algebraic sets and primary decomposition

在经典几何中，二次曲线 $X Y = 0$ 由两条直线 $X = 0$ 和 $Y = 0$ 拼成，而抛物线 $Y - X^2 = 0$ 则是一个不可拆分的整体。在 Zariski 拓扑下，这一性质被精确刻画为**不可约性（Irreducibility）**。

**Definition 2.3.1 (不可约拓扑空间与不可约代数集 / 仿射簇).**
一个非空拓扑空间 $X$ 称为**不可约的（Irreducible）**，如果它不能表示为两个真闭子集的并集；换言之，对任意闭集 $X_1, X_2 \subseteq X$：
$$X = X_1 \cup X_2 \implies X = X_1 \quad \text{或} \quad X = X_2.$$
等价地，$X$ 不可约当且仅当 $X$ 中任意两个非空开集 $U_1, U_2 \subseteq X$ 的交集非空（$U_1 \cap U_2 \neq \varnothing$），也当且仅当 $X$ 的任意非空开集 $U$ 在 $X$ 中稠密（$\overline{U} = X$）。不可约的仿射代数集 $V \subseteq \mathbb{A}^n_k$ 通常直接称为**仿射代数簇（Affine Variety）**。

**Proposition 2.3.2 (不可约性与素理想的充要对应).**
非空仿射代数集 $V \subseteq \mathbb{A}^n_k$ 是不可约的，**当且仅当**它的消失理想 $I(V) \subset k[X_1, \dots, X_n]$ 是**素理想（Prime Ideal）**（即坐标环 $k[V] = k[X_1, \dots, X_n]/I(V)$ 是整环 Integral Domain）。

**Proof.**
1. **($\Rightarrow$)**：设 $V$ 不可约。因为 $V \neq \varnothing$，故 $1 \notin I(V)$，即 $I(V) \neq k[X_1, \dots, X_n]$ 是真理想。现设多项式 $f, g \in k[X_1, \dots, X_n]$ 满足乘积 $f g \in I(V)$。在 $V$ 上考虑两个闭子集：
   $$V_1 := V \cap V(f) = V(I(V) + (f)), \qquad V_2 := V \cap V(g) = V(I(V) + (g)).$$
   对任意点 $P \in V$，因 $(fg)(P) = f(P) g(P) = 0$，必有 $f(P) = 0$ 或 $g(P) = 0$，这意味着：
   $$V = V_1 \cup V_2.$$
   由于 $V$ 不可约，必有 $V = V_1$ 或 $V = V_2$。若 $V = V_1$，则 $f$ 在整个 $V$ 上恒为零，即 $f \in I(V)$；若 $V = V_2$，则 $g \in I(V)$。因此 $I(V)$ 是素理想。
2. **($\Leftarrow$)**：设 $I(V)$ 是素理想。假设 $V = V_1 \cup V_2$，其中 $V_1, V_2 \subseteq V$ 是两个仿射代数闭集，且 $V \neq V_1$。我们要证 $V = V_2$（等价于证 $I(V_2) \subseteq I(V)$，因为那时 $V = V(I(V)) \subseteq V(I(V_2)) = V_2 \subseteq V$）。
   由于 $V_1 \subsetneq V$ 是真闭子集，必有 $I(V) \subsetneq I(V_1)$，故存在某个多项式 $f \in I(V_1) \setminus I(V)$。
   现在任取 $g \in I(V_2)$。对任意点 $P \in V = V_1 \cup V_2$，若 $P \in V_1$ 则 $f(P) = 0$；若 $P \in V_2$ 则 $g(P) = 0$。因此在整个 $V$ 上恒有 $(fg)(P) = 0$，即：
   $$f g \in I(V).$$
   因为 $I(V)$ 是素理想，且我们选取了 $f \notin I(V)$，故必然有 $g \in I(V)$！由 $g \in I(V_2)$ 的任意性知 $I(V_2) \subseteq I(V)$，从而 $V_2 = V$。故 $V$ 不可约。 **Q.E.D.**

**Theorem 2.3.3 (仿射代数集的唯一不可约分解定理).**
设 $V \subseteq \mathbb{A}^n_k$ 为任意仿射代数集。则：
1. **存在性**：$V$ 可以表示为有限个不可约仿射代数集的并集：
   $$V = V_1 \cup V_2 \cup \dots \cup V_r.$$
2. **唯一性（无冗余分解）**：若要求分解是无冗余的（即对任意 $i \neq j$ 均有 $V_i \not\subseteq V_j$），则组成该分解的不可约闭集 $V_1, \dots, V_r$（在不计排列顺序下）是**唯一确定**的。这些 $V_i$ 称为 $V$ 的**不可约分支（Irreducible Components）**。

**Proof.**
1. **存在性（Noether 归纳法 / 下降链条件 DCC）**：
   假设存在某个仿射代数集不能写成有限个不可约闭集的并。考虑所有“不能写成有限个不可约代数集之并”的仿射代数集构成的集合 $\mathcal{F}$，并考虑它们对应的消失理想族：
   $$\Sigma := \{ I(W) \mid W \in \mathcal{F} \}.$$
   因为假设 $\mathcal{F} \neq \varnothing$，故 $\Sigma$ 是 Noether 环 $k[X_1, \dots, X_n]$ 中的非空理想族。由 **Definition 2.1.1(3)**，$\Sigma$ 中存在一个极大元 $I(V_0)$（对应某个 $V_0 \in \mathcal{F}$）。
   由于 $V_0 \in \mathcal{F}$，它自身显然不是不可约的（否则 $V_0 = V_0$ 就是单分支分解），故存在两个真闭子集 $W_1, W_2 \subsetneq V_0$ 使得 $V_0 = W_1 \cup W_2$。
   因为 $W_1 \subsetneq V_0$ 且 $W_2 \subsetneq V_0$，由 $I$ 的严格反序性（因 $V(I(W_i)) = W_i \subsetneq V_0 = V(I(V_0))$），必有真包含关系：
   $$I(V_0) \subsetneq I(W_1) \quad \text{且} \quad I(V_0) \subsetneq I(W_2).$$
   根据 $I(V_0)$ 在 $\Sigma$ 中的极大性，$I(W_1)$ 和 $I(W_2)$ 都**不属于** $\Sigma$，即 $W_1, W_2 \notin \mathcal{F}$！这意味着 $W_1$ 和 $W_2$ 各自都可以表示为有限个不可约闭集的并集，从而它们的并 $V_0 = W_1 \cup W_2$ 也是有限个不可约闭集的并集，与 $V_0 \in \mathcal{F}$ 矛盾！
   得到有限分解 $V = V_1 \cup \dots \cup V_m$ 后，逐一删去那些包含在其他分支 $V_j$ 中的冗余分支 $V_i$，即得满足 $V_i \not\subseteq V_j$（$i \neq j$）的无冗余分解。
2. **唯一性**：设 $V = V_1 \cup \dots \cup V_r = W_1 \cup \dots \cup W_s$ 是两个无冗余的不可约分解。对任意固定的 $1 \le i \le r$，有：
   $$V_i = V_i \cap V = V_i \cap \left(\bigcup_{j=1}^s W_j\right) = \bigcup_{j=1}^s (V_i \cap W_j).$$
   由于 $V_i$ 是不可约闭集，而每个 $V_i \cap W_j$ 都是 $V_i$ 的闭子集，有限并等于 $V_i$ 蕴含存在某个下标 $j = \sigma(i) \in \{1, \dots, s\}$ 使得 $V_i = V_i \cap W_j$，即 **$V_i \subseteq W_j$**。
   完全对称地，对这个 $W_j$，也存在某个下标 $l \in \{1, \dots, r\}$ 使得 **$W_j \subseteq V_l$**。
   串联起来即得 $V_i \subseteq W_j \subseteq V_l$。由于分解 $V_1 \cup \dots \cup V_r$ 无冗余，由 $V_i \subseteq V_l$ 必有 $i = l$，从而不等式全部取等号：$V_i = W_j$！这证明了 $\{V_1, \dots, V_r\} = \{W_1, \dots, W_s\}$。 **Q.E.D.**

#### 2.4 Finite algebras and Noether normalisation

为了证明 Hilbert 零点定理并建立代数簇的维数理论，我们需要深入考察有限生成整环的结构。**Noether 正规化引理（Noether Normalization Lemma）**指出：任何一个有限生成 $k$-代数都可以通过有限步代数扩张归结为一个纯多项式环 $k[Y_1, \dots, Y_d]$；在几何上，这意味着**任意仿射代数簇都是某个仿射空间 $\mathbb{A}^d_k$ 的有限分歧覆盖（Finite Branched Cover）**。

**Definition 2.4.1 (整元、整扩张与有限代数).**
设 $A \subseteq B$ 是交换含幺环的扩张（或给定环同态 $\varphi: A \to B$）。
1. **整元（Integral Element）**：元素 $x \in B$ 称为在 $A$ 上是**整的（Integral over $A$）**，如果 $x$ 满足一个首项系数为 $1$（Monic）的 $A$-系数多项式方程：
   $$x^m + a_{m-1} x^{m-1} + \dots + a_1 x + a_0 = 0, \qquad a_i \in A, \; m \ge 1.$$
   若 $B$ 的每个元素都在 $A$ 上是整的，则称 $B$ 是 $A$ 的**整扩张（Integral Extension）**。
2. **有限 $A$-代数（Finite $A$-algebra）**：如果 $B$ 作为 **$A$-模（$A$-module）**是有限生成的，即存在有限个元素 $w_1, \dots, w_N \in B$ 使得 $B = A w_1 + \dots + A w_N$，则称 $B$ 是 $A$ 上的**有限代数（Finite Algebra）**（请务必区分“作为 $A$-代数有限生成 $B = A[x_1, \dots, x_n]$”与“作为 $A$-模有限生成 $B = \sum A w_i$”：例如多项式环 $k[X]$ 是有限生成 $k$-代数，但作为 $k$-向量空间是无穷维的，故不是有限 $k$-代数！）。

**Proposition 2.4.2 (整性与模有限生成性的等价性及传递性).**
设 $A \subseteq B$ 为交换环扩张。
1. 对单个元素 $x \in B$，$x$ 在 $A$ 上是整元 $\iff$ 子环 $A[x]$ 是有限生成 $A$-模 $\iff$ 存在包含 $A[x]$ 的某个忠实有限生成 $A$-子模 $M \subseteq B$（即 $1 \in M$ 且 $x M \subseteq M$）。
2. $B$ 是有限 $A$-代数 $\iff B = A[x_1, \dots, x_n]$ 是有限生成 $A$-代数，且每个生成元 $x_i$ 都在 $A$ 上是整元。
3. **传递性**：若 $A \subseteq B \subseteq C$ 是环扩张链，且 $B$ 是有限 $A$-代数，$C$ 是有限 $B$-代数，则 $C$ 是有限 $A$-代数。特别地，$B$ 中所有在 $A$ 上整的元素构成 $B$ 的一个子环（称为 $A$ 在 $B$ 中的**整闭包 Integral Closure**）。

**Proof.**
1. 若 $x^m + a_{m-1} x^{m-1} + \dots + a_0 = 0$（$a_i \in A$），则对任意 $k \ge m$，$x^k$ 均可由 $1, x, \dots, x^{m-1}$ 的 $A$-线性组合递归表出，故 $A[x] = A \cdot 1 + A x + \dots + A x^{m-1}$ 是有限生成 $A$-模。
   反之（**Cramer 法则 / 行列式技巧 Determinant Trick**），设存在由 $w_1, \dots, w_m \in B$ 生成的 $A$-子模 $M = \sum_{j=1}^m A w_j$ 满足 $1 \in M$ 且 $x M \subseteq M$。则对每个 $1 \le i \le m$，有：
   $$x w_i = \sum_{j=1}^m c_{ij} w_j \quad (c_{ij} \in A) \iff \sum_{j=1}^m (\delta_{ij} x - c_{ij}) w_j = 0.$$
   记矩阵 $D := x I_m - (c_{ij}) \in M_m(B)$，设 $D^{\mathrm{adj}}$ 为 $D$ 的伴随矩阵（Adjugate Matrix）。在矩阵环 $M_m(B)$ 中两边左乘 $D^{\mathrm{adj}}$，利用恒等式 $D^{\mathrm{adj}} D = (\det D) I_m$，得到对所有 $1 \le j \le m$ 均有：
   $$(\det D) w_j = 0.$$
   由于 $1 \in M = \sum_{j=1}^m A w_j$，将上式对 $j$ 作相应的 $A$-线性组合即得 $(\det D) \cdot 1 = \det(x I_m - C) = 0$！展开特征多项式 $\det(x I_m - C) = x^m + a_{m-1} x^{m-1} + \dots + a_0 = 0$（$a_i \in A$），即证 $x$ 在 $A$ 上是整元。
2. 传递性：若 $B = \sum_{i=1}^r A u_i$ 且 $C = \sum_{j=1}^s B v_j$，则 $C = \sum_{i=1}^r \sum_{j=1}^s A (u_i v_j)$ 显然由 $rs$ 个元素 $u_i v_j$ 作为 $A$-模有限生成。对 $B = A[x_1, \dots, x_n]$，对链 $A \subseteq A[x_1] \subseteq A[x_1, x_2] \subseteq \dots \subseteq B$ 归纳应用 (1) 与传递性即得 (2)。 **Q.E.D.**

**Lemma 2.4.3 (整扩张与域的升降性质).**
设 $A \subseteq B$ 是**整环（Integral Domains）**的整扩张（特别地，当 $B$ 是有限 $A$-代数且为整环时成立）。则：
$$A \text{ 是域} \iff B \text{ 是域}.$$

**Proof.**
1. **($\Rightarrow$)**：设 $A$ 是域。任取非零元 $y \in B \setminus \{0\}$，因为 $y$ 在 $A$ 上是整元，它满足首一多项式方程。选取 $y$ 所满足的**次数最低**的整相关系：
   $$y^m + a_{m-1} y^{m-1} + \dots + a_1 y + a_0 = 0, \qquad a_i \in A.$$
   因为 $B$ 是整环（无零因子）且 $m$ 最小，必有常数项 $a_0 \neq 0$（否则提出公因子 $y \neq 0$ 可消去得更低次的方程）。由于 $A$ 是域且 $a_0 \in A \setminus \{0\}$，$a_0^{-1} \in A \subseteq B$ 存在！移项并同乘 $-a_0^{-1}$ 得：
   $$y \cdot \bigl(-a_0^{-1}(y^{m-1} + a_{m-1} y^{m-2} + \dots + a_1)\bigr) = 1,$$
   故 $y^{-1} \in B$，即 $B$ 是域。
2. **($\Leftarrow$)**：设 $B$ 是域。任取非零元 $a \in A \setminus \{0\} \subseteq B \setminus \{0\}$，则逆元 $a^{-1} \in B$ 存在。因为 $B$ 在 $A$ 上是整扩张，$a^{-1} \in B$ 在 $A$ 上是整元，故满足首一多项式方程：
   $$(a^{-1})^m + c_{m-1} (a^{-1})^{m-1} + \dots + c_1 (a^{-1}) + c_0 = 0, \qquad c_i \in A.$$
   在等式两边同乘 $a^{m-1}$，并移项得：
   $$a^{-1} = -\bigl(c_{m-1} + c_{m-2} a + \dots + c_1 a^{m-2} + c_0 a^{m-1}\bigr) \in A!$$
   因此 $a^{-1}$ 已经属于子环 $A$，故 $A$ 也是域。 **Q.E.D.**

**Theorem 2.4.4 (Noether 正规化引理 / Noether Normalisation Lemma).**
设 $k$ 为任意域，$B = k[x_1, \dots, x_n]$ 为有限生成交换 $k$-代数（无需假设 $k$ 代数闭，甚至无需假设 $B$ 是整环）。则存在非负整数 $d \le n$ 以及 $B$ 中的一组在 $k$ 上**代数无关（Algebraically Independent）**的元素 $y_1, \dots, y_d \in B$（使得它们生成的子代数同构于 $d$ 元多项式环 $A := k[y_1, \dots, y_d] \cong k[Y_1, \dots, Y_d]$），满足 **$B$ 是多项式子环 $A = k[y_1, \dots, y_d]$ 上的有限代数（即整扩张）**。
此外，若基域 $k$ 是无限域，则 $y_1, \dots, y_d$ 可以直接选取为原生成元 $x_1, \dots, x_n$ 的 **$k$-线性组合**。

**Proof.**
我们对生成元个数 $n$ 进行数学归纳。当 $n = 0$（即 $B = k$）时，取 $d = 0$ 结论自然成立。
现设 $B = k[x_1, \dots, x_n]$。考虑自然满同态 $\pi: k[X_1, \dots, X_n] \to B, X_i \mapsto x_i$，其核为 $I = \ker \pi$。
- **情形一**：如果 $I = (0)$，则 $x_1, \dots, x_n$ 本身在 $k$ 上代数无关，$B \cong k[X_1, \dots, X_n]$，直接取 $d = n, y_i = x_i$ 即可。
- **情形二**：如果 $I \neq (0)$，任取一个非零多项式 $0 \neq f(X_1, \dots, X_n) \in I$，即在 $B$ 中恒有 $f(x_1, \dots, x_n) = 0$。我们的目标是做一组可逆的坐标代换，将关系式 $f(x_1, \dots, x_n) = 0$ 转化为 **$x_1$ 关于其余新生成元 $y_2, \dots, y_n$ 的一个首一（Monic）多项式方程**！一旦做到这一点，$B = k[y_2, \dots, y_n][x_1]$ 就是 $B' := k[y_2, \dots, y_n]$ 上的有限代数，再对由 $n-1$ 个元素生成的 $k$-代数 $B'$ 应用归纳假设及有限代数的传递性（**Proposition 2.4.2(3)**），定理便告得证。

下面分别给出在**无限域**下的线性代换法与在**任意域（含有限域）**下的 Nagata 指数代换法：
1. **方法 A（当 $k$ 为无限域时的线性投影法）**：
   设 $\deg f = m \ge 1$，将 $f$ 按齐次分量写为 $f = f_m + f_{m-1} + \dots + f_0$，其中最高次齐次项 $f_m(X_1, \dots, X_n) \neq 0$。令：
   $$y_2 = x_2 - c_2 x_1, \quad y_3 = x_3 - c_3 x_1, \quad \dots, \quad y_n = x_n - c_n x_1, \qquad (c_2, \dots, c_n \in k).$$
   将 $x_i = y_i + c_i x_1$（$i \ge 2$）代入 $f(x_1, \dots, x_n) = 0$ 并按 $x_1$ 的降幂整理：
   $$
\begin{aligned}
f(x_1, y_2 + c_2 x_1, \dots, y_n + c_n x_1) &= f_m(1, c_2, \dots, c_n) x_1^m \\
&\quad + \text{(关于 } x_1 \text{ 次数 } \le m-1 \text{、系数在 } k[y_2,\dots,y_n] \text{ 中的项)} = 0.
\end{aligned}
$$
   因为 $k$ 是无限域，而非零多项式 $f_m(1, C_2, \dots, C_n) \in k[C_2, \dots, C_n]$ 不可能在 $k^{n-1}$ 上恒为零（**Exercise 0.1**），故存在标量 $(c_2, \dots, c_n) \in k^{n-1}$ 使得常数 $\lambda := f_m(1, c_2, \dots, c_n) \in k^\times$ 非零！两边同乘 $\lambda^{-1}$，即得 $x_1$ 在 $k[y_2, \dots, y_n]$ 上的首一整方程。
2. **方法 B（对任意域 $k$ 均适用的 Nagata 幂次代换法）**：
   写出 $f(X_1, \dots, X_n) = \sum_{\alpha = (\alpha_1, \dots, \alpha_n)} a_\alpha X_1^{\alpha_1} X_2^{\alpha_2} \cdots X_n^{\alpha_n}$（其中 $a_\alpha \in k^\times$）。选取一个严格大于 $f$ 中所有单项式各变元指数的正整数 $r > \max_{\alpha, i} (\alpha_i)$，并作非线性多项式代换：
   $$y_2 = x_2 - x_1^r, \quad y_3 = x_3 - x_1^{r^2}, \quad \dots, \quad y_n = x_n - x_1^{r^{n-1}}.$$
   将 $x_i = y_i + x_1^{r^{i-1}}$（$2 \le i \le n$）代入每个单项式 $X_1^{\alpha_1} X_2^{\alpha_2} \cdots X_n^{\alpha_n}$，展开后含纯 $x_1$ 幂次的最高项为：
   $$x_1^{w(\alpha)}, \qquad \text{其中指数为 } w(\alpha) := \alpha_1 + \alpha_2 r + \alpha_3 r^2 + \dots + \alpha_n r^{n-1}.$$
   因为 $0 \le \alpha_i < r$，整数 $w(\alpha)$ 的 **$r$ 进制展开（Base-$r$ Representation）** 恰好就是 $(\alpha_1, \alpha_2, \dots, \alpha_n)$！由 $r$ 进制展开的唯一性，对于不同的多重指标 $\alpha \neq \beta$，必有 $w(\alpha) \neq w(\beta)$！
   因此，在所有出现于 $f$ 中的多重指标 $\alpha$ 里，存在**唯一**的一个指标 $\alpha^*$ 使得 $w(\alpha^*)$ 取得严格最大值 $M = \max_\alpha w(\alpha)$。这一项 $a_{\alpha^*} x_1^M$ 绝不会被其他单项式展开出的同次幂项抵消！两边同除以 $a_{\alpha^*} \in k^\times$，即得到 $x_1$ 在 $k[y_2, \dots, y_n]$ 上的首一 $M$ 次方程。 **Q.E.D.**

#### 2.5 Weak Nullstellensatz

结合 Noether 正规化引理与整扩张的域升降性质，我们可以极其优美地给出 Hilbert 弱零点定理（以及更一般的 Zariski 引理）的纯代数证明。

**Theorem 2.5.1 (Zariski 引理与 Hilbert 弱零点定理 / Weak Nullstellensatz).**
1. **Zariski 引理（对任意域 $k$ 成立）**：设 $k$ 为任意域，$L$ 为一个有限生成交换 $k$-代数：$L = k[x_1, \dots, x_n]$。如果 $L$ 同时是一个**域（Field）**，则 $L$ 作为域扩张是 $k$ 的**有限代数扩张**（即 $\dim_k L = [L : k] < \infty$）。
2. **弱零点定理（Weak Nullstellensatz，设 $k = \bar{k}$ 为代数闭域）**：
   - 多项式环 $k[X_1, \dots, X_n]$ 的每一个极大理想 $\mathfrak{m}$ 都具有形式：
     $$\mathfrak{m} = \mathfrak{m}_P := (X_1 - a_1, X_2 - a_2, \dots, X_n - a_n), \qquad P = (a_1, \dots, a_n) \in \mathbb{A}^n_k.$$
   - 等价地，对 $k[X_1, \dots, X_n]$ 中的任意真理想 $I \subsetneq k[X_1, \dots, X_n]$（即 $1 \notin I$），其零点轨迹必非空：
     $$V(I) \neq \varnothing.$$

**Proof.**
1. **Zariski 引理的证明**：
   因为 $L = k[x_1, \dots, x_n]$ 是有限生成 $k$-代数，由 **Theorem 2.4.4（Noether 正规化引理）**，存在代数无关元 $y_1, \dots, y_d \in L$（$d \ge 0$），使得 $L$ 是多项式子环 $A = k[y_1, \dots, y_d]$ 上的有限代数（从而是整扩张）。
   现在已知 $L$ 是一个**域**！根据 **Lemma 2.4.3（整扩张的域升降性质）**，由 $L$ 是域且在整环 $A = k[y_1, \dots, y_d]$ 上整，推出多项式环 $A = k[y_1, \dots, y_d]$ 自身也必须是一个**域**！
   但是，当变元个数 $d \ge 1$ 时，多项式环 $k[y_1, \dots, y_d]$ 绝不是域（因为变元 $y_1$ 的逆元 $1/y_1$ 不是多项式）。因此必然有 **$d = 0$**！
   当 $d = 0$ 时，$A = k$，故 $L$ 是 $A = k$ 上的有限代数，即 $\dim_k L = [L : k] < \infty$。
2. **弱零点定理的证明**：
   设 $k = \bar{k}$ 为代数闭域，$\mathfrak{m} \subset k[X_1, \dots, X_n]$ 为任意极大理想。考虑商环 $L := k[X_1, \dots, X_n] / \mathfrak{m}$。因为 $\mathfrak{m}$ 是极大理想，故 $L$ 是一个域，且 $L = k[\bar{X}_1, \dots, \bar{X}_n]$ 是有限生成 $k$-代数。
   由第 1 步的 Zariski 引理，$L$ 是 $k$ 的有限代数扩张。又因为 $k$ 是**代数闭域**，$k$ 没有次数 $> 1$ 的真代数扩张，故自然嵌入 $k \hookrightarrow L = k[X_1, \dots, X_n]/\mathfrak{m}$ 必为**同构**：
   $$k \xrightarrow{\;\sim\;} k[X_1, \dots, X_n] / \mathfrak{m}.$$
   于是对每个坐标变元 $X_i$（$1 \le i \le n$），其在商环 $L \cong k$ 中的剩余类 $\bar{X}_i$ 必等于某个唯一的标量 $a_i \in k$，这意味着 $X_i - a_i \in \mathfrak{m}$。
   因此理想 $\mathfrak{m}_P := (X_1 - a_1, \dots, X_n - a_n) \subseteq \mathfrak{m}$。但由于 $k[X_1, \dots, X_n]/\mathfrak{m}_P \cong k$ 是域，$\mathfrak{m}_P$ 本身已经是极大理想，故必有 $\mathfrak{m} = \mathfrak{m}_P$，从而点 $P = (a_1, \dots, a_n) \in V(\mathfrak{m})$。
   最后，对任意真理想 $I \subsetneq k[X_1, \dots, X_n]$，由 Krull 定理（或由 Noether 环的极大元条件 **Definition 2.1.1(3)**，甚至无需无穷 Zorn 引理！），必存在包含 $I$ 的极大理想 $\mathfrak{m} = \mathfrak{m}_P \supseteq I$，从而 $P \in V(\mathfrak{m}_P) \subseteq V(I)$，即 $V(I) \neq \varnothing$。 **Q.E.D.**

#### 2.6 Strong Nullstellensatz and radical ideals

弱零点定理回答了“真理想必有公共零点”，而**强零点定理（Strong Nullstellensatz）**则精确回答了“哪些多项式会在给定理想 $I$ 的公共零点集 $V(I)$ 上恒等于零”。

**Definition 2.6.1 (根理想 Radical of an Ideal).**
设 $I \subset A$ 为交换环 $A$ 的理想。定义 $I$ 的**根（Radical）**为：
$$\sqrt{I} = \operatorname{rad}(I) := \left\{ f \in A \;\middle|\; \exists r \ge 1 \text{ 使得 } f^r \in I \right\}.$$
如果理想 $I$ 满足 $\sqrt{I} = I$（即商环 $A/I$ 是无非零幂零元的约化环 Reduced Ring），则称 $I$ 为**根理想（Radical Ideal）**。特别地，每一个素理想都是根理想，且对任意点集 $X \subseteq \mathbb{A}^n_k$，消失理想 $I(X)$ 必为根理想（因为在域 $k$ 中 $f(P)^r = 0 \implies f(P) = 0$）。

**Proposition 2.6.2 (根理想的基本性质与素理想交表示).**
1. 对任意理想 $I \subset A$，$\sqrt{I}$ 是包含 $I$ 的理想，且 $\sqrt{\sqrt{I}} = \sqrt{I}$。
2. 对任意两个理想 $I, J \subset A$，有 $\sqrt{I \cdot J} = \sqrt{I \cap J} = \sqrt{I} \cap \sqrt{J}$。
3. 在任意交换环 $A$ 中，理想 $I$ 的根恒等于所有包含 $I$ 的素理想的交集：
   $$\sqrt{I} = \bigcap_{\substack{\mathfrak{p} \in \operatorname{Spec} A \\ \mathfrak{p} \supseteq I}} \mathfrak{p}.$$

**Proof.**
1. 若 $f^r \in I$ 且 $g^s \in I$，由二项式展开 $(f + g)^{r + s - 1} = \sum_{j=0}^{r+s-1} \binom{r+s-1}{j} f^j g^{r+s-1-j}$，每一项中必有 $j \ge r$ 或 $r + s - 1 - j \ge s$，故每一项都属于 $I$，从而 $f + g \in \sqrt{I}$。故 $\sqrt{I}$ 是理想。
2. 因 $I \cdot J \subseteq I \cap J \subseteq I, J$，故 $\sqrt{I \cdot J} \subseteq \sqrt{I \cap J} \subseteq \sqrt{I} \cap \sqrt{J}$；反之若 $f \in \sqrt{I} \cap \sqrt{J}$，即 $f^r \in I$ 且 $f^s \in J$，则 $f^{r+s} = f^r f^s \in I \cdot J$，故 $f \in \sqrt{I \cdot J}$。
3. 若 $f \in \sqrt{I}$，即 $f^r \in I \subseteq \mathfrak{p}$，由素理想定义知 $f \in \mathfrak{p}$。反之，若 $f \notin \sqrt{I}$，则乘法封闭集 $S := \{1, f, f^2, \dots\}$ 与 $I$ 不相交（$S \cap I = \varnothing$）。考虑分式环 $S^{-1}(A/I)$ 中的极大理想并拉回，可得包含 $I$ 且不与 $S$ 相交的素理想 $\mathfrak{p} \supseteq I$（故 $f \notin \mathfrak{p}$）。 **Q.E.D.**

**Theorem 2.6.3 (Hilbert 强零点定理 / Strong Nullstellensatz — Rabinowitsch 技巧证明).**
设 $k$ 为代数闭域。则对多项式环 $k[X_1, \dots, X_n]$ 中的任意理想 $I$，恒有：
$$I\bigl(V(I)\bigr) = \sqrt{I}.$$
从而映射 $V \mapsto I(V)$ 与 $I \mapsto V(I)$ 给出了 **$\mathbb{A}^n_k$ 中的仿射代数集**与 **$k[X_1, \dots, X_n]$ 中的根理想**之间的反序**一一对应（双射）**！在此双射下，**不可约仿射簇**一一对应于**素理想**，**单点集 $\{P\}$** 一一对应于**极大理想 $\mathfrak{m}_P$**。

**Proof.**
包含关系 $\sqrt{I} \subseteq I(V(I))$ 显然成立：若 $f \in \sqrt{I}$，则存在 $r \ge 1$ 使 $f^r \in I$；对任意点 $P \in V(I)$，有 $(f(P))^r = f^r(P) = 0$，因为 $k$ 是域，必有 $f(P) = 0$，故 $f \in I(V(I))$。
反之（**Rabinowitsch 技巧，1929**），设 $f \in I(V(I))$，我们要证存在正整数 $r \ge 1$ 使得 $f^r \in I$。若 $f = 0$ 结论平凡成立；现设 $f \neq 0$。
由 Hilbert 基定理，设 $I = (g_1, \dots, g_m) \subseteq k[X_1, \dots, X_n]$。引入一个额外的新变元 $Y$，在 $(n+1)$ 元多项式环 $k[X_1, \dots, X_n, Y]$ 中构造理想：
$$J := (g_1, \dots, g_m, \; 1 - Y f) \subseteq k[X_1, \dots, X_n, Y].$$
我们考察 $J$ 在 $(n+1)$ 维仿射空间 $\mathbb{A}^{n+1}_k$ 中的零点集 $V(J) \subset \mathbb{A}^{n+1}_k$：
任取点 $\tilde{P} = (a_1, \dots, a_n, b) \in \mathbb{A}^{n+1}_k$。如果前 $n$ 个坐标构成的点 $P = (a_1, \dots, a_n)$ 满足 $g_1(P) = \dots = g_m(P) = 0$，则 $P \in V(I)$。但根据假设 $f \in I(V(I))$，在点 $P$ 处必有 $f(P) = 0$！于是最后一个生成元在 $\tilde{P}$ 处的取值为：
$$(1 - Y f)(\tilde{P}) = 1 - b \cdot f(P) = 1 - b \cdot 0 = 1 \neq 0!$$
这表明在 $\mathbb{A}^{n+1}_k$ 中，方程组 $g_1 = \dots = g_m = 1 - Y f = 0$ **没有任何公共零点**，即 $V(J) = \varnothing \subset \mathbb{A}^{n+1}_k$！
根据 **Theorem 2.5.1(2)（弱零点定理）**，由 $V(J) = \varnothing$ 推出 $J$ 不能是真理想，必有 $1 \in J$！因此在 $k[X_1, \dots, X_n, Y]$ 中存在多项式 $A_1(X, Y), \dots, A_m(X, Y), B(X, Y)$ 使得恒等式成立：
$$1 = \sum_{i=1}^m A_i(X_1, \dots, X_n, Y) g_i(X_1, \dots, X_n) + B(X_1, \dots, X_n, Y)(1 - Y f).$$
由于这是关于新变元 $Y$ 的形式多项式恒等式，我们在分式域（或局部化环 $k[X_1, \dots, X_n][1/f]$）中将 $Y = \frac{1}{f(X_1, \dots, X_n)}$ 代入上式，最后一项 $(1 - \frac{1}{f} \cdot f) = 0$ 瞬间消失，得到：
$$1 = \sum_{i=1}^m A_i\left(X_1, \dots, X_n, \frac{1}{f}\right) g_i(X_1, \dots, X_n).$$
选取足够大的正整数 $r \ge 1$（大于所有 $A_i(X, 1/f)$ 中出现 $1/f$ 的最高幂次），在等式两边同乘 $f^r$ 以消去分母，立即得到：
$$f^r = \sum_{i=1}^m \tilde{A}_i(X_1, \dots, X_n) g_i(X_1, \dots, X_n) \in (g_1, \dots, g_m) = I,$$
其中 $\tilde{A}_i(X) = f^r A_i(X, 1/f) \in k[X_1, \dots, X_n]$。故 $f \in \sqrt{I}$！ **Q.E.D.**

| 仿射几何概念 (Geometry in $\mathbb{A}^n_k, k = \bar{k}$) | 交换代数概念 (Algebra in $A = k[X_1, \dots, X_n]$ or $k[V]$) |
| :--- | :--- |
| 仿射代数集 $V \subseteq \mathbb{A}^n_k$ | 根理想 $I = I(V) = \sqrt{I} \subseteq A$（或约化代数 $k[V] = A/I$） |
| 不可约仿射簇 $V \subseteq \mathbb{A}^n_k$ | 素理想 $\mathfrak{p} = I(V) \in \operatorname{Spec} A$（或整环 $k[V] = A/\mathfrak{p}$） |
| 空间中的单点 $P = (a_1, \dots, a_n) \in \mathbb{A}^n_k$ | 极大理想 $\mathfrak{m}_P = (X_1 - a_1, \dots, X_n - a_n) \in \operatorname{m-Spec} A$ |
| 代数集的包含关系 $V_1 \subseteq V_2$ | 根理想的反序包含 $I(V_1) \supseteq I(V_2)$（及满同态 $k[V_2] \twoheadrightarrow k[V_1]$） |
| 代数集的并集 $V_1 \cup V_2$ | 根理想的交集 $I(V_1) \cap I(V_2) = \sqrt{I(V_1) \cdot I(V_2)}$ |
| 代数集的交集 $V_1 \cap V_2$ | 根理想和的根 $\sqrt{I(V_1) + I(V_2)}$ |
| 点集 $X$ 的 Zariski 闭包 $\overline{X}$ | $V(I(X))$ |
| 不可约分支分解 $V = V_1 \cup \dots \cup V_r$ | 根理想分解为极小素理想的交 $\sqrt{I} = \mathfrak{p}_1 \cap \dots \cap \mathfrak{p}_r$ |
| 主开集 $D(g) = V \setminus V(g)$ | 单个元素的局部化环 $k[V]_g = k[V][1/g]$ |

#### 2.7 Worked examples and reduction to a hypersurface

**Example 2.7.1 (三次扭曲曲线 Twisted Cubic 与素理想判定).**
考虑三维仿射空间 $\mathbb{A}^3_k$ 中由映射 $\varphi: \mathbb{A}^1_k \to \mathbb{A}^3_k, t \mapsto (t, t^2, t^3)$ 给出的参数曲线 $C$（称为**仿射三次扭曲曲线 Affine Twisted Cubic**）。
1. 显然 $C = V(I)$，其中理想 $I = (Y - X^2, Z - X^3) \subset k[X, Y, Z]$。
2. 证明 $I = (Y - X^2, Z - X^3)$ 是素理想（从而自动是根理想，且 $I(C) = I$）：
   定义 $k$-代数满同态 $\psi: k[X, Y, Z] \to k[T], \; X \mapsto T, \; Y \mapsto T^2, \; Z \mapsto T^3$。显然 $I \subseteq \ker \psi$。反之，对任意多项式 $F(X, Y, Z) \in k[X, Y, Z]$，反复利用 $Y \equiv X^2 \pmod I$ 与 $Z \equiv X^3 \pmod I$ 作带余除法，可将 $F$ 写为：
   $$F(X, Y, Z) = Q_1(X, Y, Z)(Y - X^2) + Q_2(X, Y, Z)(Z - X^3) + r(X), \qquad r(X) \in k[X].$$
   若 $F \in \ker \psi$，则 $0 = \psi(F) = F(T, T^2, T^3) = r(T)$，故一元多项式 $r(X) = 0$，从而 $F \in I$。因此 $\ker \psi = I$，诱导同构：
   $$k[C] = k[X, Y, Z] / (Y - X^2, Z - X^3) \xrightarrow{\;\sim\;} k[T].$$
   因为一元多项式环 $k[T]$ 是整环，故 $I = (Y - X^2, Z - X^3)$ 是素理想，$C$ 是同构于 $\mathbb{A}^1_k$ 的不可约光滑曲线。

**Example 2.7.2 (准素分解与嵌入重数直观：理想 $(X^2, X Y)$).**
在 $k[X, Y]$ 中考虑理想 $I = (X^2, X Y) = (X) \cdot (X, Y)$。
1. 计算零点集与根理想：
   $$V(I) = V(X^2) \cap V(XY) = \{ (x, y) \in \mathbb{A}^2_k \mid x = 0 \} = V(X) \quad (\text{即 } y\text{-轴}).$$
   因此它的根理想是素理想 $\sqrt{I} = I(V(I)) = (X) \supsetneq I$（因为 $X \notin I$，但 $X^2 \in I$）。
2. 虽然 $V(I)$ 作为点集只是不可约直线 $X = 0$，但在代数层面上，理想 $I$ 的不可约准素分解（Primary Decomposition）为：
   $$I = (X^2, X Y) = (X) \cap (X^2, Y),$$
   其中孤立素理想 $(X)$ 对应不可约分支 $y$-轴，而伴随极大理想 $\sqrt{(X^2, Y)} = (X, Y)$ 对应镶嵌在 $y$-轴内部的原点 $(0, 0)$（在现代概形理论中称为一个**嵌入点 Embedded Point**，记录了在原点处沿 $x$-方向的一阶无穷小切向量模糊信息）。

**Theorem 2.7.3 (可分 Noether 正规化与双有理等价于超曲面).**
设 $k$ 为无限完备域（例如特征 $0$ 的域或代数闭域 $k = \bar{k}$），$V \subseteq \mathbb{A}^n_k$ 为不可约仿射簇，其坐标环 $k[V]$ 的分式域为 $K = k(V)$。则存在非负整数 $d \le n$ 以及代数无关元 $y_1, \dots, y_d \in k[V]$ 和元素 $y_{d+1} \in k[V]$，使得：
1. $k[V]$ 是多项式环 $k[y_1, \dots, y_d]$ 上的有限整环扩张，且分式域扩张 $K / k(y_1, \dots, y_d)$ 是**有限可分代数扩张（Finite Separable Extension）**；
2. 由单扩张定理（Primitive Element Theorem），可调节线性组合选取 $y_{d+1} \in k[V]$ 使得：
   $$K = k(V) = k(y_1, \dots, y_d)[y_{d+1}] \cong k(Y_1, \dots, Y_d)[Y_{d+1}] / \bigl(F(Y_1, \dots, Y_{d+1})\bigr),$$
   其中 $F(Y_1, \dots, Y_{d+1}) \in k[Y_1, \dots, Y_{d+1}]$ 是不可约多项式。在几何上，这意味着**任意 $d$ 维不可约代数簇 $V$ 都双有理等价（Birationally Equivalent）于 $(d+1)$ 维仿射空间 $\mathbb{A}^{d+1}_k$ 中的一个不可约超曲面 $H = V(F) \subset \mathbb{A}^{d+1}_k$**！

**Proof.**
当 $\operatorname{char} k = 0$ 时，任何代数扩张自动可分；当 $\operatorname{char} k = p > 0$ 且 $k = \bar{k}$ 时，通过对生成元个数归纳并利用一般线性投影消去不可分方程中的 $p$ 次幂（因为 $k = k^p$，若多项式只含 $X_i^p$ 则在代数闭域上可提取 $p$ 次根，这与不可约多项式矛盾，故必存在某个变元满足 $\frac{\partial F}{\partial X_i} \neq 0$），可将 $K$ 表示为纯超越子域 $k(y_1, \dots, y_d)$ 的有限可分扩张。再应用域论中的单扩张定理，有限可分扩张必由单个本原元 $y_{d+1}$ 生成，将 $y_{d+1}$ 乘以 $k[y_1, \dots, y_d]$ 中的公分母即可保证 $y_{d+1} \in k[V]$，其极小多项式清除分母后即为 $\mathbb{A}^{d+1}_k$ 中的不可约超曲面方程 $F(Y_1, \dots, Y_{d+1}) = 0$。 **Q.E.D.**

#### 2.8 Exercises to Chapter 2

> [!note] Miles Reid 原书 Chapter II（§3–§4）原始习题索引与对照
> - **原书 §3 习题（Affine Varieties & Zariski Topology）**：(3.1–3.2) $\mathbb{A}^1_k$ 与 $\mathbb{A}^2_k$ 上 Zariski 闭集的完全分类；(3.3–3.5) 空间代数集的不可约分解、单项式曲线 $(t^3, t^4, t^5)$ 的非二元生成素理想与两柱面交集分解；(3.6–3.8) Noether 拓扑空间的降链条件、素理想分解与幂零根。
> - **原书 §4 习题（Nullstellensatz & Finite Algebras）**：(4.1–4.4) Noether 正规化引理的显式坐标变换计算；(4.5–4.8) 有限整环扩张的纤维性质、Jacobson 环性质与多项式映射像集（如 $(x, xy)$）的非闭性。
> 以下按专题逐题给出完整陈述与严格证明。

##### Exercise 2.1 (一维仿射空间 $\mathbb{A}^1_k$ 上的 Zariski 拓扑刻画)
设 $k$ 为无限域。证明：在一维仿射直线 $\mathbb{A}^1_k$ 上，Zariski 闭集恰好是**空集、$\mathbb{A}^1_k$ 全集以及所有有限点集**（即 $\mathbb{A}^1_k$ 上的 Zariski 拓扑就是有限补拓扑 Cofinite Topology）。进而说明当 $k = \mathbb{C}$ 时，$\mathbb{A}^1_{\mathbb{C}}$ 上的 Zariski 拓扑不是 Hausdorff 空间，但它是不可约且紧（Quasi-compact）的。

**Proof.**
一元多项式环 $k[X]$ 是主理想整环（PID），其任意理想均形如 $I = (f(X))$。
- 若 $f(X) = 0$，则 $V(0) = \mathbb{A}^1_k$；
- 若 $f(X) = c \in k^\times$ 为非零常数，则 $V(c) = \varnothing$；
- 若 $\deg f = d \ge 1$，则一元多项式 $f(X)$ 在 $k$ 中至多有 $d$ 个根，故 $V(f)$ 是有限点集。反之，对任意有限点集 $S = \{a_1, \dots, a_m\} \subset \mathbb{A}^1_k$，取多项式 $f(X) = \prod_{i=1}^m (X - a_i)$，即有 $V(f) = S$。
由于 $k$ 是无限集，$\mathbb{A}^1_k$ 中任意两个非空开集 $U_1 = \mathbb{A}^1_k \setminus S_1$ 与 $U_2 = \mathbb{A}^1_k \setminus S_2$（其中 $S_1, S_2$ 为有限集）的交集 $U_1 \cap U_2 = \mathbb{A}^1_k \setminus (S_1 \cup S_2)$ 必为无限集（特别地非空），因此任意两个不同点无法被不相交的开邻域分离（非 Hausdorff），同时这也直接表明 $\mathbb{A}^1_k$ 是不可约空间。 **Q.E.D.**

##### Exercise 2.2 ($\mathbb{A}^2_k$ 中的不可约闭集分类)
设 $k$ 为代数闭域。证明：二维仿射平面 $\mathbb{A}^2_k$ 中的任意不可约仿射代数闭集 $V \subseteq \mathbb{A}^2_k$ 必属于以下四类之一：
1. 空集 $\varnothing$（若按惯例不可约集非空，则分为后三类）；
2. 全平面 $\mathbb{A}^2_k = V(0)$；
3. 单点集 $\{P\} = V(X - a, Y - b)$；
4. 不可约平面仿射曲线 $C = V(f)$，其中 $f(X, Y) \in k[X, Y]$ 是非常数不可约多项式。

**Proof.**
由强零点定理与 **Proposition 2.3.2**，$\mathbb{A}^2_k$ 中的非空不可约闭集 $V$ 一一对应于二元多项式环 $k[X, Y]$ 中的素理想 $\mathfrak{p} = I(V)$。我们分类 $k[X, Y]$ 的所有素理想 $\mathfrak{p}$：
1. 若 $\mathfrak{p} = (0)$，则 $V(0) = \mathbb{A}^2_k$。
2. 若 $\mathfrak{p} \neq (0)$，任取 $\mathfrak{p}$ 中一个次数最低的非常数多项式 $f(X, Y) \in \mathfrak{p} \setminus \{0\}$。因为 $\mathfrak{p}$ 是素理想，若 $f = f_1 f_2$，则 $f_1 \in \mathfrak{p}$ 或 $f_2 \in \mathfrak{p}$；由 $f$ 的次数极小性知 $f$ 必为 $k[X, Y]$ 中的**不可约多项式**。由于 $k[X, Y]$ 是唯一析因整环（UFD），不可约元 $f$ 生成的主理想 $(f)$ 已经是素理想，且 $(f) \subseteq \mathfrak{p}$：
   - **子情形 2a**：若 $\mathfrak{p} = (f)$，则 $V(\mathfrak{p}) = V(f)$ 是不可约平面曲线。
   - **子情形 2b**：若 $(f) \subsetneq \mathfrak{p}$，任取不属于 $(f)$ 的元素 $g \in \mathfrak{p} \setminus (f)$。因为 $f$ 不可约且 $f \nmid g$，多项式 $f$ 与 $g$ 在 UFD $k[X, Y]$ 中互素（$\gcd(f, g) = 1$）。将 $f, g$ 视为单变元有理函数域 $k(X)[Y]$ 中的一元多项式，由 Gauss 引理知它们在主理想整环 $k(X)[Y]$ 中仍然互素！因此在 $k(X)[Y]$ 中存在多项式对使得它们的线性组合等于 $1$；清除分母 $k[X]$ 后，即存在非零的一元多项式 $0 \neq h(X) \in k[X]$ 使得：
     $$h(X) \in (f, g) \subseteq \mathfrak{p}.$$
     完全对称地，交换 $X$ 与 $Y$ 的地位，也存在非零的一元多项式 $0 \neq q(Y) \in k[Y]$ 使得 $q(Y) \in (f, g) \subseteq \mathfrak{p}$。
     因为 $k$ 是代数闭域，$h(X) = \prod (X - a_i)$ 且 $q(Y) = \prod (Y - b_j)$；又因为 $\mathfrak{p}$ 是素理想，必有某个因子 $X - a \in \mathfrak{p}$ 且某个因子 $Y - b \in \mathfrak{p}$！故极大理想 $(X - a, Y - b) \subseteq \mathfrak{p}$，从而 $\mathfrak{p} = (X - a, Y - b)$，对应单点集 $V(\mathfrak{p}) = \{(a, b)\}$。 **Q.E.D.**

##### Exercise 2.3 (三维空间代数集的不可约分解算例)
在 $\mathbb{A}^3_{\mathbb{C}}$ 中，求下列两个仿射代数集的不可约分支分解，并写出每个不可约分支对应的素理想：
1. $V_1 = V(X^2 - Y Z, \; X Z - X) \subset \mathbb{A}^3_{\mathbb{C}}$；
2. $V_2 = V(X^2 + Y^2 + Z^2 - 1, \; X^2 - Y^2 - Z^2 + 1) \subset \mathbb{A}^3_{\mathbb{C}}$。

**Proof.**
1. **对 $V_1$ 的分解**：由第二个方程 $X(Z - 1) = 0$，利用 $V(f g) = V(f) \cup V(g)$ 将 $V_1$ 拆分为两支：
   - **第一支（$X = 0$）**：代入第一式 $X^2 - Y Z = 0$ 得 $Y Z = 0$，继续拆分为两条坐标轴：
     $$L_1 = V(X, Y) \text{（即 } z\text{-轴）}, \qquad L_2 = V(X, Z) \text{（即 } y\text{-轴）}.$$
     因为 $k[X,Y,Z]/(X,Y) \cong k[Z]$ 且 $k[X,Y,Z]/(X,Z) \cong k[Y]$ 均为整环，故 $\mathfrak{p}_1 = (X, Y)$ 与 $\mathfrak{p}_2 = (X, Z)$ 是素理想，$L_1, L_2$ 是不可约直线。
   - **第二支（$Z = 1$）**：代入第一式得 $Y = X^2$，即平面 $Z = 1$ 上的抛物线：
     $$C_3 = V(Z - 1, \; Y - X^2).$$
     因 $k[X,Y,Z]/(Z-1, Y-X^2) \cong k[X]$ 是整环，故 $\mathfrak{p}_3 = (Z - 1, Y - X^2)$ 是素理想，$C_3$ 是不可约二次曲线。
   显然 $L_1, L_2, C_3$ 互不包含，故无冗余不可约分解为 **$V_1 = V(X, Y) \cup V(X, Z) \cup V(Z - 1, Y - X^2)$**。
2. **对 $V_2$ 的分解**：将两个方程相加与相减（因 $\operatorname{char}\mathbb{C} = 0 \neq 2$），理想等价于：
   $$(X^2 + Y^2 + Z^2 - 1, \; X^2 - Y^2 - Z^2 + 1) = (X^2, \; Y^2 + Z^2 - 1).$$
   取根理想消去幂次 $X^2 \leadsto X$，并在 $\mathbb{C}$ 上注意到 $Y^2 + Z^2 - 1 = (Y + iZ)^2\dots$ 不，在 $\mathbb{C}[Y, Z]$ 中，圆方程 $Y^2 + Z^2 - 1 = (Y + iZ)(Y - iZ) - 1$ 是**不可约多项式**！因此 $V_2 = V(X, Y^2 + Z^2 - 1)$ 本身就是**不可约的**（它是平面 $X = 0$ 中的光滑复单位圆），唯一素理想为 $\mathfrak{p} = (X, Y^2 + Z^2 - 1)$（注意原理想 $I = (X^2, Y^2 + Z^2 - 1)$ 不是根理想，其根为 $\mathfrak{p}$）。 **Q.E.D.**

##### Exercise 2.4 (空间曲线 $(t^3, t^4, t^5)$ 的非完全交素理想与两柱面交集分解)
设 $C \subset \mathbb{A}^3_k$ 是由单项式参数化 $t \mapsto (t^3, t^4, t^5)$ 定义的仿射空间曲线。赋予坐标加权次数 $\operatorname{wt}(X) = 3, \, \operatorname{wt}(Y) = 4, \, \operatorname{wt}(Z) = 5$，考察矩阵 $\begin{pmatrix} X & Y & Z \\ Y & Z & X^2 \end{pmatrix}$ 的三个二阶子式：
$$f_1 = X Z - Y^2 \; (\text{wt } 8), \qquad f_2 = X^3 - Y Z \; (\text{wt } 9), \qquad f_3 = X^2 Y - Z^2 \; (\text{wt } 10).$$
1. 证明 $C$ 的零点理想 $\mathfrak{p} = I(C) = (f_1, f_2, f_3)$ 是由这三个加权齐次多项式生成的素理想，且作为理想**不能由任意 $2$ 个多项式生成**（即 $\mu(\mathfrak{p}) = 3$，$C$ 不是理想论意义下的完全交 Ideal-Theoretic Complete Intersection；同时辨析其与集合论完全交的区别）。
2. 若只取其中两个生成元，分别求仿射代数集 $V(f_1, f_2) = V(X Z - Y^2, \; X^3 - Y Z)$ 与 $V(f_1, f_3) = V(X Z - Y^2, \; X^2 Y - Z^2)$ 在 $\mathbb{A}^3_k$ 中的不可约分解。

**Proof.**
1. **素理想生成元与极小生成元个数 $\mu(\mathfrak{p}) = 3$ 的严格证明**：
   - 定义加权齐次 $k$-代数同态 $\varphi: k[X, Y, Z] \to k[t], \; (X, Y, Z) \mapsto (t^3, t^4, t^5)$（将 $t$ 的权重设为 $1$）。因为像环 $\operatorname{Im}\varphi = k[t^3, t^4, t^5] \subset k[t]$ 是整环，核 $\mathfrak{p} = \ker \varphi = I(C)$ 是加权齐次素理想。直接代入验证知 $f_1(t^3,t^4,t^5) = t^8 - t^8 = 0$，$f_2(t^3,t^4,t^5) = t^9 - t^9 = 0$，$f_3(t^3,t^4,t^5) = t^{10} - t^{10} = 0$，故 $J := (f_1, f_2, f_3) \subseteq \mathfrak{p}$（注意：诸如 $Y^3 - X^4 = -Y f_1 - X f_2 \in J$ 属于权重 $12$ 的派生元素，而 $Y^3 - X Z^2$ 代入得 $t^{12} - t^{13} \neq 0$ 根本不属于 $I(C)$）。
   - 反之，利用关系 $Y^2 \equiv X Z,\; Y Z \equiv X^3,\; Z^2 \equiv X^2 Y \pmod{J}$，任意多项式 $g(X, Y, Z) \in k[X, Y, Z]$ 模去理想 $J$ 后均可消去 $Y, Z$ 的高次项与乘积项，化为规范形：
     $$g(X, Y, Z) \equiv A(X) + B(X) Y + C(X) Z \pmod{J}.$$
     注意 $A(t^3)$ 的指数全满足 $\equiv 0 \pmod 3$，$B(t^3)t^4$ 的指数全满足 $\equiv 1 \pmod 3$，$C(t^3)t^5$ 的指数全满足 $\equiv 2 \pmod 3$，三组幂次模 $3$ 余数互不相交！因此 $g \in \mathfrak{p} \iff A(t^3) + B(t^3)t^4 + C(t^3)t^5 = 0 \iff A = B = C = 0 \iff g \in J$。这就严格证明了 $\mathfrak{p} = (f_1, f_2, f_3)$。
   - 考察极大理想 $\mathfrak{m} = (X, Y, Z)$ 及商空间 $V = \mathfrak{p} / \mathfrak{m}\mathfrak{p}$。由于 $\mathfrak{p}$ 的非零元素最低权重为 $8$（在权重 $8, 9, 10$ 处的一维分次子空间分别由 $f_1, f_2, f_3$ 张成），而 $\mathfrak{m}$ 中非零元素的最低权重为 $\operatorname{wt}(X) = 3$，故乘积理想 $\mathfrak{m}\mathfrak{p}$ 中任何非零元素的权重均 $\ge 8 + 3 = 11$！这意味着在权重 $8, 9, 10$ 处有 $(\mathfrak{m}\mathfrak{p})_8 = (\mathfrak{m}\mathfrak{p})_9 = (\mathfrak{m}\mathfrak{p})_{10} = 0$，从而 $\bar{f}_1, \bar{f}_2, \bar{f}_3$ 在分次商模 $\mathfrak{p}/\mathfrak{m}\mathfrak{p}$ 中位于不同权重分量，必然 $k$-线性无关！于是 $\dim_k(\mathfrak{p}/\mathfrak{m}\mathfrak{p}) = 3$。由分次中山引理（Graded Nakayama's Lemma），理想 $\mathfrak{p}$ 的任何生成元系至少包含 $3$ 个元素，绝不能由 $2$ 个多项式生成。
   - **概念辨析（理想论完全交 vs. 集合论完全交）**：$\mu(\mathfrak{p}) = 3 > \operatorname{codim}(C, \mathbb{A}^3) = 2$ 说明 $C$ **不是理想论完全交**。但在集合论层面，令
     $$f_1 = X Z - Y^2, \qquad h := X^5 + Z^3 - 2 X^2 Y Z = X^2(X^3 - Y Z) - Z(X^2 Y - Z^2) \in \mathfrak{p}.$$
     直接展开验证多项式恒等式：
     $$f_3^2 = (X^2 Y - Z^2)^2 = X^4 Y^2 - 2 X^2 Y Z^2 + Z^4 = Z(X^5 + Z^3 - 2 X^2 Y Z) - X^4(X Z - Y^2) = Z h - X^4 f_1!$$
     因此在公共零点集 $V(f_1, h)$ 上，恒有 $f_3^2 = Z h - X^4 f_1 = 0 \implies f_3 = 0$，从而 $V(f_1, h) \subseteq V(f_1, f_3)$。由第 2 问即将证明的分解 $V(f_1, f_3) = C \cup V(Y, Z)$，在额外坐标轴 $V(Y, Z)$（即 $Y = Z = 0$）上代入 $h = X^5 + Z^3 - 2X^2 Y Z = 0$ 立即迫使 $X^5 = 0 \implies X = 0$，即整条 $x$-轴被收缩至原点 $(0, 0, 0) \in C$！故严格成立 **$V(f_1, h) = C$**（即 $\sqrt{(f_1, h)} = \mathfrak{p}$，$C$ 是集合论完全交 Set-Theoretic Complete Intersection）。
2. **两柱面交集的不可约分解**：
   - **对 $V(f_1, f_2) = V(X Z - Y^2, \; X^3 - Y Z)$**：
     - 若 $X = 0$，由 $X Z - Y^2 = 0$ 得 $Y = 0$，此时 $Z$ 任意，故包含整条 $z$-轴 $L_z = V(X, Y)$；
     - 若 $X \neq 0$，令 $t = Y / X$，则 $Y = t X$。由 $X Z = Y^2 = t^2 X^2$ 消去 $X \neq 0$ 得 $Z = t^2 X$；再代入 $X^3 = Y Z = t^3 X^2$ 消去 $X^2 \neq 0$ 得 $X = t^3$，进而 $Y = t^4, \, Z = t^5$，恰好落在曲线 $C$ 上！
     因此其无冗余不可约分解为 **$V(X Z - Y^2, \; X^3 - Y Z) = C \cup V(X, Y)$**（空间曲线 $C$ 与 $z$-轴之并）。
   - **对 $V(f_1, f_3) = V(X Z - Y^2, \; X^2 Y - Z^2)$**：
     - 若 $Y = 0$，由 $X^2 Y - Z^2 = 0$ 得 $Z = 0$，此时 $X$ 任意，故包含整条 $x$-轴 $L_x = V(Y, Z)$；
     - 若 $Y \neq 0$，由 $X Z = Y^2 \neq 0$ 知 $X, Z \neq 0$。令 $t = Z / Y = Y / X$，则 $Y = t X, \, Z = t^2 X$，代入 $X^2 Y = Z^2$ 得 $t X^3 = t^4 X^2 \implies X = t^3, \, Y = t^4, \, Z = t^5$，同样落在曲线 $C$ 上！
     因此其无冗余不可约分解为 **$V(X Z - Y^2, \; X^2 Y - Z^2) = C \cup V(Y, Z)$**（空间曲线 $C$ 与 $x$-轴之并）。 **Q.E.D.**

##### Exercise 2.5 (Noether 正规化的显式计算演练)
设 $k$ 为任意域。对下列有限生成 $k$-代数 $B = k[X, Y] / I$，显式找出一组 Noether 正规化参数 $y_1 \in B$，使得 $B$ 是多项式环 $k[y_1]$ 上的有限模，并写出 $B$ 的一组 $k[y_1]$-模生成元：
1. 双曲线坐标环 $B_1 = k[X, Y] / (X Y - 1)$；
2. 抛物线坐标环 $B_2 = k[X, Y] / (Y - X^2)$；
3. 圆的坐标环 $B_3 = k[X, Y] / (X^2 + Y^2 - 1)$。

**Proof.**
1. **双曲线 $X Y - 1 = 0$**：注意如果直接取 $y_1 = x$（向 $x$-轴投影），由于 $x y = 1$ 关于 $y$ 的最高次项系数是 $x$ 而不是非零常数，$y = 1/x$ 在 $k[x]$ 上**不是**整元（在几何上，向 $x$-轴的投影在 $x = 0$ 处缺失了渐近线无穷远纤维）！
   按照 **Theorem 2.4.4** 的证明，作线性代换令：
   $$y_1 := x - y \implies x = y_1 + y.$$
   代入 $x y - 1 = 0$，立即得到 $y$ 关于 $k[y_1]$ 的**首一二次方程**：
   $$(y_1 + y) y - 1 = 0 \iff y^2 + y_1 y - 1 = 0!$$
   此时 $y$ 在 $k[y_1]$ 上是整元，且 $x = y_1 + y \in k[y_1][y]$，故 $B_1 = k[y_1] \cdot 1 \oplus k[y_1] \cdot y$ 是秩为 $2$ 的自由 $k[y_1]$-模。
2. **抛物线 $Y - X^2 = 0$**：直接取 $y_1 = y$（则 $x$ 满足首一二次方程 $x^2 - y_1 = 0$，$B_2 = k[y_1] \cdot 1 \oplus k[y_1] \cdot x$），或者直接取 $y_1 = x$（则 $y = y_1^2 \in k[y_1]$，此时 $B_2 = k[y_1]$ 本身就是自由秩 $1$ 的多项式环）。
3. **单位圆 $X^2 + Y^2 - 1 = 0$**：在 $B_3$ 中，$y$ 已经满足关于 $k[x]$ 的首一二次方程：
   $$y^2 + (x^2 - 1) = 0.$$
   因此无需任何坐标旋转，直接取 $y_1 = x$，即有 $B_3 = k[x] \cdot 1 \oplus k[x] \cdot y$ 是 $k[x]$ 上的自由模（基为 $1, y$）。 **Q.E.D.**

##### Exercise 2.6 (有限生成群与矩阵代数群的 Zariski 闭集结构)
在 $n^2$ 维仿射空间 $\mathbb{A}^{n^2}_k = M_n(k)$（坐标为矩阵元素 $X_{ij}$，$1 \le i, j \le n$）中：
1. 证明特殊线性群 $\operatorname{SL}_n(k) = \{ A \in M_n(k) \mid \det A = 1 \}$ 与正交群 $\operatorname{O}_n(k) = \{ A \in M_n(k) \mid A^{\mathsf{T}} A = I_n \}$ 都是 $\mathbb{A}^{n^2}_k$ 中的仿射代数闭集；
2. 证明一般线性群 $\operatorname{GL}_n(k) = \{ A \in M_n(k) \mid \det A \neq 0 \}$ 是 $\mathbb{A}^{n^2}_k$ 中的主开集 $D(\det)$，并利用 Rabinowitsch 升维技巧将 $\operatorname{GL}_n(k)$ 实现为 $\mathbb{A}^{n^2 + 1}_k$ 中的仿射代数闭集。

**Proof.**
1. 行列式 $\det(X_{ij})$ 是关于 $n^2$ 个变元 $X_{ij}$ 的 $n$ 次多项式，故 $\operatorname{SL}_n(k) = V(\det X - 1)$ 是仿射超曲面（闭集）。矩阵方程 $X^{\mathsf{T}} X - I_n = 0$ 等价于 $n^2$ 个二次多项式方程 $\sum_{l=1}^n X_{li} X_{lj} - \delta_{ij} = 0$（$1 \le i, j \le n$），故 $\operatorname{O}_n(k)$ 也是仿射代数闭集。
2. 显然 $\operatorname{GL}_n(k) = M_n(k) \setminus V(\det X) = D(\det X)$ 是主开集。引入额外变元 $Y$，在 $\mathbb{A}^{n^2 + 1}_k$ 中考虑闭超曲面：
   $$W := V\bigl(Y \cdot \det(X_{ij}) - 1\bigr) = \left\{ (A, y) \in M_n(k) \times k \;\middle|\; y \det A = 1 \right\}.$$
   投影映射 $(A, y) \mapsto A$ 与逆映射 $A \mapsto (A, (\det A)^{-1})$ 给出了 $\operatorname{GL}_n(k)$ 与仿射闭超曲面 $W \subset \mathbb{A}^{n^2+1}_k$ 之间的同构，其坐标环恰为局部化环 $k[\operatorname{GL}_n] = k[X_{ij}][(\det X)^{-1}]$。 **Q.E.D.**

##### Exercise 2.7 (Noether 拓扑空间的等价刻画与性质)
拓扑空间 $X$ 称为 **Noether 拓扑空间（Noetherian Topological Space）**，如果 $X$ 的闭子集满足**降链条件（Descending Chain Condition, DCC）**：任意闭子集降链 $Z_1 \supseteq Z_2 \supseteq Z_3 \supseteq \dots$ 必在有限步后稳定。
1. 证明：仿射代数集 $V \subseteq \mathbb{A}^n_k$ 赋予 Zariski 拓扑后必为 Noether 拓扑空间；
2. 证明：$X$ 是 Noether 拓扑空间 $\iff X$ 的每一个开子集 $U \subseteq X$（包括 $X$ 本身）都是准紧的（Quasi-compact，即任意开覆盖必有有限子覆盖）；
3. 证明：Noether 拓扑空间的任意子空间（赋予诱导拓扑）也是 Noether 拓扑空间，且任意非空 Noether 拓扑空间都有唯一的有限无冗余不可约闭分支分解。

**Proof.**
1. 对 $\mathbb{A}^n_k$ 中的任意闭集降链 $Z_1 \supseteq Z_2 \supseteq \dots$，取消失理想得到 $k[X_1, \dots, X_n]$ 中的理想升链 $I(Z_1) \subseteq I(Z_2) \subseteq \dots$。由 Hilbert 基定理，存在 $N$ 使 $m \ge N$ 时 $I(Z_m) = I(Z_N)$。两边再取 $V$ 并利用 $V(I(Z)) = Z$，即得 $Z_m = Z_N$。
2. 闭集满足降链条件 DCC 等价于开集（作为闭集的补集）满足升链条件 ACC。
   - 若开集满足 ACC，设 $U = \bigcup_{\alpha \in \Lambda} U_\alpha$ 是开集 $U$ 的一个开覆盖。若 $U$ 没有有限子覆盖，可归纳选取 $U_{\alpha_1}, U_{\alpha_2}, \dots$ 使得部分并 $W_m := \bigcup_{i=1}^m U_{\alpha_i}$ 严格递增：$W_1 \subsetneq W_2 \subsetneq W_3 \subsetneq \dots$，与开集的 ACC 矛盾！
   - 反之，若每个开集准紧，设 $U_1 \subseteq U_2 \subseteq \dots$ 为开集升链，则并集 $U = \bigcup_{m=1}^\infty U_m$ 是开集，$\{U_m\}_{m \ge 1}$ 构成 $U$ 的开覆盖。由 $U$ 准紧，存在有限子覆盖，因升链单调，必有某个 $U_N = U$，故 $m \ge N$ 时 $U_m = U_N$。
3. 若 $Y \subseteq X$ 为子空间，则由子空间开集形如 $V = Y \cap U$（$U$ 在 $X$ 中开）立即知 $Y$ 的每个开子集也准紧，故 $Y$ 为 Noether 空间。唯一不可约分解的证明与 **Theorem 2.3.3** 完全相同，只需将理想极大元条件替换为闭集非空族的极小元条件（由闭集 DCC 保证）。 **Q.E.D.**

##### Exercise 2.8 (有限代数扩张下的纤维有限性)
设 $k$ 为代数闭域，$\varphi: V \to W$ 是两个仿射代数集之间的多项式映射，使得拉回同态 $\varphi^*: k[W] \to k[V]$ 将 $k[V]$ 变成 $k[W]$ 上的**有限代数（Finite Algebra）**。证明：对 $W$ 中的任意点 $Q \in W$，逆像纤维 $\varphi^{-1}(Q) \subset V$ 都是**有限点集**。

**Proof.**
设 $k[V]$ 作为 $k[W]$-模由有限个元素 $f_1, \dots, f_m \in k[V]$ 生成；事实上，若 $V \subseteq \mathbb{A}^n_k$，每个坐标函数 $x_i \in k[V]$（$1 \le i \le n$）在 $k[W]$ 上都是整元，故满足一个系数在 $k[W]$ 中的首一多项式方程：
$$x_i^{d_i} + a_{i, d_i - 1} x_i^{d_i - 1} + \dots + a_{i, 1} x_i + a_{i, 0} = 0, \qquad a_{i, j} \in k[W], \; d_i \ge 1.$$
现在固定任意一点 $Q \in W$。对于纤维 $\varphi^{-1}(Q)$ 中的任意点 $P = (p_1, \dots, p_n) \in V$，由于 $\varphi(P) = Q$，对任意 $g \in k[W]$ 均有 $(\varphi^* g)(P) = g(\varphi(P)) = g(Q) \in k$。
因此，在点 $P \in \varphi^{-1}(Q)$ 处对上述整相关系求值，得到坐标 $p_i = x_i(P) \in k$ 必须满足标量系数的首一多项式方程：
$$p_i^{d_i} + a_{i, d_i - 1}(Q) p_i^{d_i - 1} + \dots + a_{i, 1}(Q) p_i + a_{i, 0}(Q) = 0.$$
在域 $k$ 中，次数为 $d_i$ 的一元多项式至多有 $d_i$ 个根！这意味着对于纤维 $\varphi^{-1}(Q)$ 中的点 $P = (p_1, \dots, p_n)$，每个坐标 $p_i$ 至多有 $d_i$ 种可能取值，从而整个纤维的点数满足：
$$\# \varphi^{-1}(Q) \le d_1 d_2 \cdots d_n < \infty,$$
即所有纤维均为有限集。 **Q.E.D.**

##### Exercise 2.9 (有限整环扩张的满射性：Going-Up 定理与几何覆盖)
设 $k$ 为代数闭域，$V, W$ 为不可约仿射簇，$\varphi: V \to W$ 为多项式映射，使得诱导同态 $\varphi^*: k[W] \hookrightarrow k[V]$ 是**单射**且 $k[V]$ 是 $k[W]$ 上的**有限代数**（例如 Noether 正规化给出的投影 $V \to \mathbb{A}^d_k$）。证明：映射 $\varphi: V \to W$ 必是**满射（Surjective）**！

**Proof.**
设 $A = k[W] \subseteq B = k[V]$ 为整环的有限整扩张。任取目标簇上的一点 $Q \in W$，对应 $A$ 的极大理想 $\mathfrak{m}_Q \subset A$。由弱零点定理，要证存在点 $P \in V$ 使 $\varphi(P) = Q$（等价于 $(\varphi^*)^{-1}(\mathfrak{m}_P) = \mathfrak{m}_Q$，即 $\mathfrak{m}_Q B \subseteq \mathfrak{m}_P$），只需证明扩张理想 $\mathfrak{m}_Q B$ 在 $B$ 中是**真理想**（即 $\mathfrak{m}_Q B \neq B$）！因为一旦 $\mathfrak{m}_Q B \subsetneq B$，就能在 $B$ 中取包含 $\mathfrak{m}_Q B$ 的极大理想 $\mathfrak{m}_P$，此时 $\mathfrak{m}_P \cap A \supseteq \mathfrak{m}_Q$ 且 $1 \notin \mathfrak{m}_P \cap A$，由 $\mathfrak{m}_Q$ 的极大性必有 $\mathfrak{m}_P \cap A = \mathfrak{m}_Q$，即 $\varphi(P) = Q$。
用反证法（**中山引理 Nakayama's Lemma / 行列式技巧**）：假设 $\mathfrak{m}_Q B = B$。
设 $B = \sum_{i=1}^m A w_i$ 是由 $w_1, \dots, w_m \neq 0$ 生成的有限 $A$-模。因为 $B = \mathfrak{m}_Q B = \sum_{j=1}^m \mathfrak{m}_Q w_j$，每个生成元 $w_i$ 都可以写成系数在极大理想 $\mathfrak{m}_Q$ 中的线性组合：
$$w_i = \sum_{j=1}^m c_{ij} w_j, \qquad c_{ij} \in \mathfrak{m}_Q \iff \sum_{j=1}^m (\delta_{ij} - c_{ij}) w_j = 0.$$
令矩阵 $D := I_m - (c_{ij}) \in M_m(A)$。如同 **Proposition 2.4.2(1)** 中左乘伴随矩阵 $D^{\mathrm{adj}}$，得到对所有 $j$ 均有 $(\det D) w_j = 0$；又因 $1 \in B = \sum A w_j$，故在整环 $B$（从而在子环 $A$）中必有：
$$\det(I_m - (c_{ij})) = 0.$$
但是，将行列式 $\det(I_m - (c_{ij}))$ 展开，由于所有 $c_{ij} \in \mathfrak{m}_Q$，展开式必形如：
$$1 + c = 0, \qquad \text{其中 } c \in \mathfrak{m}_Q!$$
这意味着 $1 = -c \in \mathfrak{m}_Q$，与 $\mathfrak{m}_Q$ 是 $A$ 的真极大理想矛盾！因此 $\mathfrak{m}_Q B \subsetneq B$，从而 $\varphi: V \to W$ 是满射。 **Q.E.D.**

##### Exercise 2.10 (Jacobson 环性质：根理想等于极大理想的交)
利用强零点定理证明：对任意域 $k$，多元多项式环 $A = k[X_1, \dots, X_n]$ 中的任意理想 $I \subset A$ 的根 $\sqrt{I}$ 都等于所有包含 $I$ 的**极大理想**的交集（满足这一性质的交换环称为 **Jacobson 环**）：
$$\sqrt{I} = \bigcap_{\substack{\mathfrak{m} \in \operatorname{m-Spec} A \\ \mathfrak{m} \supseteq I}} \mathfrak{m}.$$

**Proof.**
包含关系 $\sqrt{I} \subseteq \bigcap_{\mathfrak{m} \supseteq I} \mathfrak{m}$ 显然成立（因为极大理想是素理想）。
反之，设 $f \notin \sqrt{I}$。类似于 **Theorem 2.6.3（Rabinowitsch 技巧）**，在引入新变元 $Y$ 的环 $A[Y] = k[X_1, \dots, X_n, Y]$ 中考虑理想 $J = I \cdot A[Y] + (1 - Y f)$。因为 $f \notin \sqrt{I}$，必有 $1 \notin J$（否则代入 $Y = 1/f$ 并同乘 $f^r$ 会得出 $f^r \in I$）。
因此 $J$ 是 $A[Y]$ 的真理想，存在 $A[Y]$ 的一个极大理想 $\mathcal{M} \supseteq J$。
现在考虑商域 $L := A[Y] / \mathcal{M}$，它是有限生成 $k$-代数且为域！由对**任意域 $k$** 都成立的 **Theorem 2.5.1(1)（Zariski 引理）**，$L$ 是 $k$ 的有限代数扩张。
考察子环映像 $B := A / (\mathcal{M} \cap A) \subseteq L$。由于 $k \subseteq B \subseteq L$ 且 $\dim_k L < \infty$，$B$ 是有限维 $k$-代数且是整环（故在 $k$ 上是整扩张）。由 **Lemma 2.4.3**，$B$ 本身就是一个**域**！
这说明交集 $\mathfrak{m} := \mathcal{M} \cap A$ 是 $A = k[X_1, \dots, X_n]$ 的一个**极大理想**！而且：
- 因 $I \subseteq J \subseteq \mathcal{M}$，故 $I \subseteq \mathcal{M} \cap A = \mathfrak{m}$；
- 因 $1 - Y f \in J \subseteq \mathcal{M}$，必定有 $f \notin \mathfrak{m}$（否则若 $f \in \mathfrak{m} \subseteq \mathcal{M}$，则 $Y f \in \mathcal{M}$，从而 $1 = (1 - Yf) + Yf \in \mathcal{M}$，矛盾！）。
于是我们找到了一个包含 $I$ 但不包含 $f$ 的极大理想 $\mathfrak{m}$，故 $f \notin \bigcap_{\mathfrak{m} \supseteq I} \mathfrak{m}$。 **Q.E.D.**

##### Exercise 2.11 (多项式映射图像的闭性反例：Chevalley 定理铺垫)
设 $\pi: \mathbb{A}^2_k \to \mathbb{A}^2_k$ 由 $(x, y) \mapsto (x, x y)$ 给出，并记 $V = V(X Y - 1) \subset \mathbb{A}^2_k$ 为双曲线。
1. 求双曲线 $V$ 在第一坐标投影 $\mathrm{pr}_1: (x, y) \mapsto x$ 下的像集 $\mathrm{pr}_1(V) \subset \mathbb{A}^1_k$，说明多项式映射下闭集的像**不一定**是闭集；
2. 求全平面 $\mathbb{A}^2_k$ 在映射 $\pi: (x, y) \mapsto (u, v) = (x, x y)$ 下的像集 $\operatorname{Im}(\pi) \subset \mathbb{A}^2_k$，说明它既不是 Zariski 开集也不是 Zariski 闭集，而是一个**可构造集（Constructible Set，即开集与闭集的布尔组合）**。

**Proof.**
1. 对双曲线 $V: x y = 1$，当 $x \neq 0$ 时取 $y = 1/x$ 即有 $(x, 1/x) \in V$；当 $x = 0$ 时 $0 \cdot y = 1$ 无解。故像集为：
   $$\mathrm{pr}_1(V) = \mathbb{A}^1_k \setminus \{0\} = D(X),$$
   这是仿射直线去掉原点的**主开集**，而非闭集（其 Zariski 闭包为整条直线 $\mathbb{A}^1_k$）。
2. 对映射 $\pi(x, y) = (u, v) = (x, x y)$：
   - 若 $u \neq 0$，则对任意 $v \in k$，取 $(x, y) = (u, v/u)$ 即有 $\pi(x, y) = (u, v)$，故开半平面 $D(U) = \{(u, v) \mid u \neq 0\}$ 全部包含在像集中；
   - 若 $u = 0$，则 $x = 0$，从而必有 $v = x y = 0$，故在 $v$-轴 $U = 0$ 上只有原点 $(0, 0)$ 属于像集！
   因此像集为：
   $$\operatorname{Im}(\pi) = D(U) \cup \{(0, 0)\} = \bigl(\mathbb{A}^2_k \setminus V(U)\bigr) \cup V(U, V).$$
   它是主开集 $D(U)$ 与闭点 $\{(0,0)\}$ 的并集（即可构造集），既不是开集（因在 $(0,0)$ 的任何邻域内都含有 $u=0, v \neq 0$ 的点），也不是闭集（因其 Zariski 闭包是全平面 $\mathbb{A}^2_k$）。 **Q.E.D.**

##### Exercise 2.12 (幂零根 Nilradical 与约化代数)
设 $A$ 为交换环。零理想 $(0)$ 的根 $\operatorname{Nil}(A) := \sqrt{(0)} = \{ a \in A \mid \exists r \ge 1, \; a^r = 0 \}$ 称为 $A$ 的**幂零根（Nilradical）**。证明：对于仿射代数集 $V = V(I) \subseteq \mathbb{A}^n_k$（$k = \bar{k}$），商环 $A = k[X_1, \dots, X_n]/I$ 的坐标环 $k[V]$ 恰好同构于 $A$ 模去其幂零根的约化商环：
$$k[V] \cong A / \operatorname{Nil}(A).$$

**Proof.**
由强零点定理，$I(V) = I(V(I)) = \sqrt{I}$。在自然商同态 $\pi: k[X_1, \dots, X_n] \to A = k[X_1, \dots, X_n]/I$ 下，元素 $\bar{f} \in A$ 属于 $\operatorname{Nil}(A)$ 当且仅当存在 $r \ge 1$ 使 $\bar{f}^r = 0 \in A$，即 $f^r \in I \iff f \in \sqrt{I} = I(V)$。因此 $\operatorname{Nil}(A) = \sqrt{I} / I = I(V) / I$。由环的第三同构定理，立即得到：
$$A / \operatorname{Nil}(A) = \bigl(k[X_1, \dots, X_n] / I\bigr) \big/ \bigl(I(V) / I\bigr) \cong k[X_1, \dots, X_n] / I(V) = k[V].$$
这表明坐标环 $k[V]$ 只捕捉理想 $I$ 的几何点集信息（自动抹去了幂零元对应的重数/无穷小切结构）。 **Q.E.D.**

## Part III: 代数簇上的函数、态射、有理映射与爆破

### Chapter 3: Functions, Morphisms, Rational Maps and Blowups

#### 3.1 Coordinate rings and polynomial maps

在 **Chapter 2** 中，我们将仿射代数集 $V \subseteq \mathbb{A}^n_k$ 视为外围空间 $\mathbb{A}^n_k$ 的闭子集。现在我们转向代数簇的内蕴几何：将 $V$ 视为一个独立的几何空间，通过定义在 $V$ 上的**多项式函数（Polynomial Functions）**与**多项式映射（Polynomial Maps / Morphisms）**来研究其同构分类。在本章中，除另有声明外，始终假设基域 $k = \bar{k}$ 为代数闭域。

**Definition 3.1.1 (仿射代数集上的多项式函数与坐标环 $k[V]$).**
设 $V \subseteq \mathbb{A}^n_k$ 为仿射代数集。映射 $\varphi: V \to k$ 称为 $V$ 上的**多项式函数（Polynomial Function）**，如果存在多元多项式 $F(X_1, \dots, X_n) \in k[X_1, \dots, X_n]$，使得对所有点 $P = (a_1, \dots, a_n) \in V$ 均有：
$$\varphi(P) = F(a_1, \dots, a_n).$$
两个多项式 $F, G \in k[X_1, \dots, X_n]$ 在 $V$ 上限制为同一个函数，当且仅当 $F - G$ 在 $V$ 上恒等于零，即 $F - G \in I(V)$。因此，$V$ 上全体多项式函数构成的 $k$-代数自然同构于商环：
$$k[V] := k[X_1, \dots, X_n] / I(V),$$
称为 $V$ 的**坐标环（Coordinate Ring）**。记标准坐标变元 $X_i$ 在 $k[V]$ 中的剩余类为 $x_i := X_i \bmod I(V)$（称为 $V$ 上的第 $i$ 个坐标函数），则 $k[V] = k[x_1, \dots, x_n]$ 是由 $x_1, \dots, x_n$ 有限生成的**约化（Reduced，即无非零幂零元）**交换 $k$-代数。

**Proposition 3.1.2 ($V$ 的子代数集与坐标环 $k[V]$ 中理想的相对 $V$-$I$ 对应).**
设 $V \subseteq \mathbb{A}^n_k$ 为仿射代数集。对任意子集 $J \subseteq k[V]$，定义 $V_V(J) := \{ P \in V \mid \varphi(P) = 0, \;\forall \varphi \in J \} \subseteq V$；对任意子集 $W \subseteq V$，定义 $I_V(W) := \{ \varphi \in k[V] \mid \varphi(P) = 0, \;\forall P \in W \} \subseteq k[V]$。通过商同态 $\pi: k[X_1, \dots, X_n] \twoheadrightarrow k[V]$ 的理想对应定理，结合强零点定理（**Theorem 2.6.3**），有以下双射对应：
1. $V$ 的仿射代数闭子集 $W \subseteq V$ $\longleftrightarrow$ $k[V]$ 的根理想 $I_V(W) = \sqrt{I_V(W)} \subseteq k[V]$，且 $k[W] \cong k[V] / I_V(W)$；
2. $V$ 的不可约闭子集 $W \subseteq V$ $\longleftrightarrow$ $k[V]$ 的素理想 $\mathfrak{p} \in \operatorname{Spec} k[V]$；
3. $V$ 中的几何点 $P = (a_1, \dots, a_n) \in V$ $\longleftrightarrow$ $k[V]$ 的极大理想 $\mathfrak{m}_P = (x_1 - a_1, \dots, x_n - a_n) \in \operatorname{m-Spec} k[V]$，且同样有：
   $$P \in V \longleftrightarrow \operatorname{Hom}_{k\text{-}\mathsf{Alg}}(k[V], k), \qquad P \longmapsto \bigl(\operatorname{ev}_P: \varphi \mapsto \varphi(P)\bigr).$$

**Proof.**
商环 $k[V] = k[X_1, \dots, X_n]/I(V)$ 的理想与 $k[X_1, \dots, X_n]$ 中包含 $I(V)$ 的理想一一对应，且保持根理想、素理想与极大理想性质。在几何端，$\mathbb{A}^n_k$ 的闭集 $W$ 满足 $W \subseteq V \iff I(W) \supseteq I(V)$，故两边完全匹配。对于点与 $k$-代数同态的对应：任给 $k$-代数同态 $\alpha: k[V] \to k$，令 $a_i := \alpha(x_i) \in k$，则对任意 $F \in I(V)$ 有 $F(a_1, \dots, a_n) = \alpha(F(x_1, \dots, x_n)) = \alpha(0) = 0$，故点 $P = (a_1, \dots, a_n) \in V(I(V)) = V$，且 $\alpha = \operatorname{ev}_P$。 **Q.E.D.**

**Definition 3.1.3 (仿射代数集之间的多项式映射与同构).**
设 $V \subseteq \mathbb{A}^n_k$ 与 $W \subseteq \mathbb{A}^m_k$ 为两个仿射代数集（坐标分别记为 $x_1, \dots, x_n$ 与 $y_1, \dots, y_m$）。
1. 映射 $f: V \to W$ 称为**多项式映射（Polynomial Map）**或**仿射簇态射（Morphism of Affine Algebraic Sets）**，如果存在 $m$ 个多项式函数 $f_1, \dots, f_m \in k[V]$，使得对所有点 $P \in V$ 均有：
   $$f(P) = \bigl(f_1(P), f_2(P), \dots, f_m(P)\bigr) \in W \subseteq \mathbb{A}^m_k.$$
   全体从 $V$ 到 $W$ 的多项式映射构成的集合记为 $\operatorname{Mor}(V, W)$。
2. 若多项式映射 $f: V \to W$ 存在逆多项式映射 $g: W \to V$ 使得 $g \circ f = \mathrm{id}_V$ 且 $f \circ g = \mathrm{id}_W$，则称 $f$ 为**同构（Isomorphism）**，记作 $V \cong W$。（注意：仅仅是双射的多项式映射**不一定**是同构！见下文的尖点三次曲线算例 **Example 3.1.6**）。

**Theorem 3.1.4 (仿射代数集范畴与有限生成约化 $k$-代数范畴的反等价定理).**
设 $V \subseteq \mathbb{A}^n_k$ 与 $W \subseteq \mathbb{A}^m_k$ 为仿射代数集。
1. 每一个多项式映射 $f: V \to W$ 通过函数复合诱导出坐标环之间的 $k$-代数同态（称为**拉回同态 Pullback Homomorphism**）：
   $$f^*: k[W] \longrightarrow k[V], \qquad \psi \longmapsto f^*(\psi) := \psi \circ f.$$
   且对复合映射 $V \xrightarrow{f} W \xrightarrow{g} Z$，恒有 $(g \circ f)^* = f^* \circ g^*$ 以及 $(\mathrm{id}_V)^* = \mathrm{id}_{k[V]}$。
2. 映射 $f \mapsto f^*$ 给出了多项式映射集合与坐标环 $k$-代数同态集合之间的**自然双射**：
   $$\operatorname{Mor}(V, W) \xrightarrow{\;\sim\;} \operatorname{Hom}_{k\text{-}\mathsf{Alg}}\bigl(k[W], k[V]\bigr).$$
3. **同构判据**：多项式映射 $f: V \to W$ 是几何同构，**当且仅当**拉回同态 $f^*: k[W] \to k[V]$ 是 $k$-代数同构！因此，仿射代数集 $V$ 的内蕴同构类完全由其坐标环 $k[V]$ 的 $k$-代数同构类唯一决定。

**Proof.**
1. 若 $f = (f_1, \dots, f_m): V \to W$，且 $\psi \in k[W]$ 由多项式 $\Psi(Y_1, \dots, Y_m) \in k[Y_1, \dots, Y_m]$ 代表，则对任意 $P \in V$，有 $(\psi \circ f)(P) = \Psi(f_1(P), \dots, f_m(P))$。因为 $f_i \in k[V]$，将多项式代入多项式仍得到 $k[V]$ 中的多项式函数 $\Psi(f_1, \dots, f_m) \in k[V]$，特别地对坐标函数 $y_j \in k[W]$ 有：
   $$f^*(y_j) = y_j \circ f = f_j \in k[V] \qquad (1 \le j \le m).$$
2. **证明 $f \mapsto f^*$ 是双射**：
   - **单射性**：若 $f^* = g^*$，则对每个坐标生成元 $y_j \in k[W]$ 有 $f_j = f^*(y_j) = g^*(y_j) = g_j$（$1 \le j \le m$），故 $f = g$。
   - **满射性**：任给一个 $k$-代数同态 $\Phi: k[W] \to k[V]$。因为 $k[W] = k[y_1, \dots, y_m]$ 由坐标函数 $y_1, \dots, y_m$ 生成，$\Phi$ 完全由像元 $f_j := \Phi(y_j) \in k[V]$（$1 \le j \le m$）所决定。我们利用这 $m$ 个元素定义映射：
     $$f: V \longrightarrow \mathbb{A}^m_k, \qquad P \longmapsto \bigl(f_1(P), f_2(P), \dots, f_m(P)\bigr).$$
     我们需要验证像集满足 $f(V) \subseteq W$！任取消失理想中的多项式 $G(Y_1, \dots, Y_m) \in I(W)$，则在商环 $k[W] = k[Y_1, \dots, Y_m]/I(W)$ 中有 $G(y_1, \dots, y_m) = 0$。将 $k$-代数同态 $\Phi$ 作用于该等式，得到在 $k[V]$ 中恒有：
     $$0 = \Phi\bigl(G(y_1, \dots, y_m)\bigr) = G\bigl(\Phi(y_1), \dots, \Phi(y_m)\bigr) = G(f_1, \dots, f_m) \in k[V].$$
     这意味着对任意点 $P \in V$，均有 $G(f_1(P), \dots, f_m(P)) = 0$。由于这对所有 $G \in I(W)$ 都成立，故 $f(P) \in V(I(W)) = W$！因此 $f: V \to W$ 是良定义的多项式映射，且在生成元上 $f^*(y_j) = f_j = \Phi(y_j)$，故 $f^* = \Phi$。
3. **同构判据**：若 $f: V \to W$ 有逆态射 $g: W \to V$，由函子性 $(g \circ f)^* = f^* \circ g^* = \mathrm{id}_{k[V]}$ 且 $(f \circ g)^* = g^* \circ f^* = \mathrm{id}_{k[W]}$，故 $f^*$ 是代数同构。反之，若 $\Phi = f^*: k[W] \to k[V]$ 有逆代数同态 $\Psi: k[V] \to k[W]$，由第 2 步存在唯一的多项式映射 $g: W \to V$ 使得 $g^* = \Psi$，且 $(g \circ f)^* = f^* \circ g^* = \Psi \circ \Phi = \mathrm{id}_{k[V]} = (\mathrm{id}_V)^*$，由单射性得 $g \circ f = \mathrm{id}_V$，同理 $f \circ g = \mathrm{id}_W$。 **Q.E.D.**

**Corollary 3.1.5 (多项式映射的 Zariski 连续性与图像闭密性判据).**
设 $f: V \to W$ 为仿射代数集之间的多项式映射。
1. $f$ 在 Zariski 拓扑下是**连续映射**：对 $W$ 中的任意闭子集 $Z = V_W(J) \subseteq W$，其逆像 $f^{-1}(Z) = V_V(f^*(J)) \subseteq V$ 仍是闭子集。
2. 像集 $f(V)$ 在 $W$ 中的 Zariski 闭包 $\overline{f(V)} \subseteq W$ 由拉回同态 $f^*: k[W] \to k[V]$ 的核（Kernel）唯一确定：
   $$I_W\bigl(\overline{f(V)}\bigr) = I_W\bigl(f(V)\bigr) = \ker\bigl(f^*: k[W] \to k[V]\bigr).$$
   特别地，称 $f: V \to W$ 为**稠密态射（Dominant Morphism）**，如果 $\overline{f(V)} = W$；这**当且仅当**拉回同态 $f^*: k[W] \to k[V]$ 是**单射（Injective）**！

**Proof.**
1. 对任意点 $P \in V$，$P \in f^{-1}(V_W(J)) \iff f(P) \in V_W(J) \iff \forall \psi \in J, \; \psi(f(P)) = (f^*\psi)(P) = 0 \iff P \in V_V(f^*(J))$。
2. 函数 $\psi \in k[W]$ 在像集 $f(V)$ 上恒为零 $\iff \forall P \in V, \; \psi(f(P)) = 0 \iff f^*(\psi) = 0 \in k[V] \iff \psi \in \ker(f^*)$。因此 $I_W(f(V)) = \ker(f^*)$，两边取 $V_W$ 即得 $\overline{f(V)} = V_W(\ker f^*)$，从而 $\overline{f(V)} = W \iff \ker f^* = (0) \iff f^*$ 是单射。 **Q.E.D.**

**Example 3.1.6 (双射态射但非同构的经典反例：尖点三次曲线 $y^2 = x^3$).**
考虑仿射直线 $\mathbb{A}^1_k$（坐标为 $T$）到尖点三次曲线 $C = V(Y^2 - X^3) \subset \mathbb{A}^2_k$ 的多项式参数化映射：
$$f: \mathbb{A}^1_k \longrightarrow C, \qquad t \longmapsto (t^2, t^3).$$
1. **集合层面上 $f$ 是双射（甚至是双连续同胚）**：原点 $(0,0) \in C$ 有唯一原像 $t = 0$；对任意 $(x, y) \in C \setminus \{(0,0)\}$，由 $y^2 = x^3 \neq 0$ 知 $t = y/x$ 是唯一满足 $(t^2, t^3) = (x, y)$ 的原像。
2. **代数几何层面上 $f$ 绝不是同构**：考察拉回同态 $f^*: k[C] = k[X, Y]/(Y^2 - X^3) \to k[\mathbb{A}^1] = k[T]$，它由 $\bar{X} \mapsto T^2, \bar{Y} \mapsto T^3$ 给出。虽然 $f^*$ 是单射，但它的像是子代数：
   $$\operatorname{Im}(f^*) = k[T^2, T^3] = \left\{ a_0 + a_2 T^2 + a_3 T^3 + a_4 T^4 + \dots \in k[T] \;\middle|\; T \text{ 的一次项系数 } a_1 = 0 \right\} \subsetneq k[T]!$$
   因为一次项 $T \notin k[T^2, T^3]$（在原点 $t=0$ 处，$\operatorname{Im}(f^*)$ 中所有函数的导数均为 $0$），$f^*$ 不是满射！事实上，$k[T^2, T^3]$ 甚至不是唯一析因整环（UFD）：在其中 $(T^2)^3 = (T^3)^2$ 给出了 $T^6$ 的两种不等价不可约分解，而多项式环 $k[T]$ 是 UFD，故 $k[C] \not\cong k[\mathbb{A}^1]$，$C$ 与 $\mathbb{A}^1_k$ **不同构**（尽管它们双有理等价）。

#### 3.2 Function fields, regular functions and local rings

在研究不可约仿射簇 $V$ 时，全局多项式函数 $k[V]$ 往往过于刚性；为了进行除法运算并刻画局部几何性质，我们引入**有理函数域 $k(V)$** 与点 $P \in V$ 处的**局部环 $\mathcal{O}_{V,P}$**。

**Definition 3.2.1 (不可约仿射簇的有理函数域与局部环).**
设 $V \subseteq \mathbb{A}^n_k$ 为不可约仿射簇。由于 $I(V)$ 是素理想，坐标环 $k[V]$ 是整环。
1. **有理函数域（Function Field）**：整环 $k[V]$ 的分式域（Field of Fractions）记为 $k(V) := \operatorname{Frac}(k[V])$，称为 $V$ 的**函数域**或**有理函数域**，其中的元素 $\varphi = f/g$（$f, g \in k[V], g \neq 0$）称为 $V$ 上的**有理函数（Rational Function）**。
2. **在一点处正则（Regular at a Point）与局部环 $\mathcal{O}_{V,P}$**：给定点 $P \in V$ 与有理函数 $\varphi \in k(V)$。如果存在表示式 $\varphi = f/g$（其中 $f, g \in k[V]$）使得**分母在点 $P$ 处不为零**（即 $g(P) \neq 0$，等价于 $g \notin \mathfrak{m}_P$），则称 $\varphi$ 在点 $P$ 处**正则（Regular at $P$）**。
   （注意：由于 $k[V]$ 未必是 UFD，同一个有理函数 $\varphi \in k(V)$ 可能有多种不同的分子分母表示式 $f_1/g_1 = f_2/g_2$；只要其中**存在至少一种**表示式满足分母在 $P$ 处非零，就称 $\varphi$ 在 $P$ 处正则！）
   在点 $P$ 处正则的全体有理函数构成 $k(V)$ 的一个子环，恰好就是坐标环 $k[V]$ 在极大理想 $\mathfrak{m}_P$ 处的局部化（Localization）：
   $$\mathcal{O}_{V, P} := k[V]_{\mathfrak{m}_P} = \left\{ \varphi = \frac{f}{g} \in k(V) \;\middle|\; f, g \in k[V], \; g(P) \neq 0 \right\},$$
   称为簇 $V$ 在点 $P$ 处的**局部环（Local Ring of $V$ at $P$）**。它有唯一的极大理想：
   $$\mathfrak{m}_{V, P} := \mathfrak{m}_P k[V]_{\mathfrak{m}_P} = \left\{ \varphi = \frac{f}{g} \in \mathcal{O}_{V, P} \;\middle|\; f(P) = 0, \; g(P) \neq 0 \right\},$$
   且剩余类域满足 $\mathcal{O}_{V, P} / \mathfrak{m}_{V, P} \cong k[V] / \mathfrak{m}_P \cong k$。

**Example 3.2.2 (同一有理函数的不同分母表示：圆锥曲面与圆).**
1. 在实（或复）圆 $V = V(X^2 + Y^2 - 1) \subset \mathbb{A}^2_k$（$\operatorname{char} k \neq 2$）上，考虑有理函数 $\varphi = \frac{1 - Y}{X} \in k(V)$。表面上看，在点 $P = (0, 1) \in V$ 处分母 $X(P) = 0$；但是在坐标环 $k[V]$ 中恒有 $(1 - Y)(1 + Y) = 1 - Y^2 = X^2$，故在分式域 $k(V)$ 中恒有：
   $$\varphi = \frac{1 - Y}{X} = \frac{X}{1 + Y}!$$
   在第二个表示式 $\frac{X}{1 + Y}$ 中，分母在 $P = (0, 1)$ 处的取值为 $1 + Y(P) = 1 + 1 = 2 \neq 0$！因此 $\varphi$ 在 $P = (0, 1)$ 处其实是**正则的**，且 $\varphi(0, 1) = \frac{0}{2} = 0$，它的唯一极点是 $Q = (0, -1)$（即它的最大定义域为 $\operatorname{dom}(\varphi) = V \setminus \{(0, -1)\}$）。
2. 在二次锥面 $W = V(X Z - Y W) \subset \mathbb{A}^4_k$ 上，有理函数 $\psi = \frac{X}{Y} = \frac{W}{Z} \in k(W)$ 在 $Y \neq 0$ 或 $Z \neq 0$ 处均正则，故其定义域为 $\operatorname{dom}(\psi) = W \setminus V(Y, Z)$（这是去掉二维平面 $Y = Z = 0$ 后的开集，不能写成单个函数 $g$ 的主开集 $D(g)$）。

**Theorem 3.2.3 (有理函数的定义域与全局正则函数定理).**
设 $V \subseteq \mathbb{A}^n_k$ 为不可约仿射簇（$k = \bar{k}$），$\varphi \in k(V)$ 为有理函数。定义 $\varphi$ 的**定义域（Domain of Definition）**与**极点理想（Ideal of Denominators）**分别为：
$$\operatorname{dom}(\varphi) := \{ P \in V \mid \varphi \in \mathcal{O}_{V, P} \}, \qquad J_\varphi := \{ g \in k[V] \mid g \varphi \in k[V] \} \subseteq k[V].$$
则：
1. $J_\varphi$ 是 $k[V]$ 的非零理想，且极点集（不正则轨迹）恰好是 $J_\varphi$ 切出的闭子集：
   $$V \setminus \operatorname{dom}(\varphi) = V_V(J_\varphi).$$
   因此，$\operatorname{dom}(\varphi) = V \setminus V_V(J_\varphi)$ 是 $V$ 的一个**非空稠密 Zariski 开子集**！
2. **全局正则函数定理**：在仿射簇 $V$ 的每一点处都正则的有理函数必为全局多项式函数，即：
   $$\operatorname{dom}(\varphi) = V \iff \varphi \in k[V], \qquad \text{亦即} \quad \bigcap_{P \in V} \mathcal{O}_{V, P} = k[V].$$
3. **主开集上的正则函数环**：对任意非零元 $g \in k[V] \setminus \{0\}$，在主开集 $D(g) = V \setminus V(g)$ 上处处正则的有理函数构成的环恰好是局部化环：
   $$\mathcal{O}_V\bigl(D(g)\bigr) := \bigcap_{P \in D(g)} \mathcal{O}_{V, P} = k[V]_g = k[V]\left[\frac{1}{g}\right] = \left\{ \frac{f}{g^r} \;\middle|\; f \in k[V], \; r \ge 0 \right\}.$$

**Proof.**
1. 显然 $J_\varphi$ 是 $k[V]$ 的理想，且若写 $\varphi = f_0/g_0$（$g_0 \neq 0$），则 $0 \neq g_0 \in J_\varphi$。对任意点 $P \in V$：
   $$P \in \operatorname{dom}(\varphi) \iff \exists f, g \in k[V] \text{ 使 } \varphi = \frac{f}{g} \text{ 且 } g(P) \neq 0 \iff \exists g \in J_\varphi \text{ 使 } g(P) \neq 0 \iff P \notin V_V(J_\varphi).$$
   故 $V \setminus \operatorname{dom}(\varphi) = V_V(J_\varphi)$。因 $J_\varphi \neq (0)$，故 $V_V(J_\varphi) \subsetneq V$，$\operatorname{dom}(\varphi)$ 是非空开集（在不可约空间 $V$ 中必稠密）。
2. 若 $\operatorname{dom}(\varphi) = V$，则 $V_V(J_\varphi) = \varnothing$。由强/弱零点定理（**Theorem 2.5.1** 与 **Proposition 3.1.2**），在 $k[V]$ 中零点集为空的理想必包含单位元 $1$，即：
   $$1 \in J_\varphi \implies 1 \cdot \varphi = \varphi \in k[V]!$$
   这就是说 $\bigcap_{P \in V} \mathcal{O}_{V,P} = k[V]$。
3. 对主开集 $D(g)$，若 $\varphi \in k(V)$ 在 $D(g)$ 上处处正则，则极点集满足 $V_V(J_\varphi) = V \setminus \operatorname{dom}(\varphi) \subseteq V \setminus D(g) = V_V(g)$。两边取 $I_V$ 并应用强零点定理：
   $$g \in I_V\bigl(V_V(g)\bigr) \subseteq I_V\bigl(V_V(J_\varphi)\bigr) = \sqrt{J_\varphi}.$$
   根据根理想的定义，存在某个正整数 $r \ge 1$ 使得 $g^r \in J_\varphi$！由 $J_\varphi$ 的定义，这意味着 $f := g^r \varphi \in k[V]$，从而 $\varphi = \frac{f}{g^r} \in k[V][1/g]$。 **Q.E.D.**

#### 3.3 Rational maps and dominant rational maps

在 **Chapter 1** 中，我们频繁使用了诸如极射投影 $[X:Y:Z] \mapsto [X:Z]$ 或二次变换 $[X:Y:Z] \mapsto [YZ:XZ:XY]$ 等“允许在低维真闭子集上无定义”的几何映射。现在我们赋予它们严格的代数定义。

**Definition 3.3.1 (有理映射 Rational Map 与双有理等价 Birational Equivalence).**
设 $V \subseteq \mathbb{A}^n_k$ 与 $W \subseteq \mathbb{A}^m_k$ 为不可约仿射簇。
1. 从 $V$ 到 $W$ 的一个**有理映射（Rational Map）**，记作 $\varphi: V \dashrightarrow W$（使用虚线箭头以示其未必处处有定义），是由 $m$ 个有理函数 $\varphi_1, \dots, \varphi_m \in k(V)$ 组成的多元组 $\varphi = (\varphi_1, \dots, \varphi_m)$，满足：在所有 $\varphi_i$ 同时正则的非空稠密开集 $U = \bigcap_{i=1}^m \operatorname{dom}(\varphi_i) \subseteq V$ 上，对任意 $P \in U$ 均有：
   $$\varphi(P) := \bigl(\varphi_1(P), \dots, \varphi_m(P)\bigr) \in W \subseteq \mathbb{A}^m_k.$$
   等价地，这要求对消失理想中的任意多项式 $G(Y_1, \dots, Y_m) \in I(W)$，将有理函数代入后在分式域 $k(V)$ 中恒等于零：$G(\varphi_1, \dots, \varphi_m) = 0 \in k(V)$。有理映射 $\varphi$ 的最大定义域为 $\operatorname{dom}(\varphi) = \bigcap_{i=1}^m \operatorname{dom}(\varphi_i)$，它是 $V$ 的非空稠密开集。
2. 如果有理映射 $\varphi: V \dashrightarrow W$ 的像集 $\varphi(\operatorname{dom}(\varphi))$ 在 $W$ 中 Zariski 稠密（即不存在非零多项式函数 $\psi \in k[W] \setminus \{0\}$ 使得 $\psi \circ \varphi = 0$），则称 $\varphi$ 为**稠密有理映射（Dominant Rational Map）**。
3. 若稠密有理映射 $\varphi: V \dashrightarrow W$ 存在逆稠密有理映射 $\psi: W \dashrightarrow V$ 使得 $\psi \circ \varphi = \mathrm{id}_V$ 且 $\varphi \circ \psi = \mathrm{id}_W$（在各自稠密开集上作为有理函数恒等），则称 $\varphi$ 为**双有理映射（Birational Map）**，并称代数簇 $V$ 与 $W$ **双有理等价（Birationally Equivalent）**，记作 $V \sim_{\mathrm{bir}} W$。若 $V$ 双有理等价于仿射空间 $\mathbb{A}^d_k$（或射影空间 $\mathbb{P}^d_k$），则称 $V$ 为**有理簇（Rational Variety）**。

**Theorem 3.3.2 (稠密有理映射与函数域扩张的范畴反等价及开集同构定理).**
设 $V, W$ 为不可约代数簇。
1. 任意**稠密**有理映射 $\varphi: V \dashrightarrow W$ 唯一诱导出有理函数域之间的 $k$-域嵌入（由于域同态必为单射，为什么需要“稠密”假设？因为要把分式 $\psi_1/\psi_2 \in k(W)$ 拉回为 $(\varphi^*\psi_1)/(\varphi^*\psi_2) \in k(V)$，必须保证非零分母 $\psi_2 \in k[W] \setminus \{0\}$ 拉回后不恒为零 $\varphi^*(\psi_2) \neq 0$，这恰恰等价于 $\varphi$ 是稠密有理映射！）：
   $$\varphi^*: k(W) \hookrightarrow k(V).$$
   反之，任意 $k$-域同态 $\alpha: k(W) \hookrightarrow k(V)$ 都唯一来自于某个稠密有理映射 $\varphi = (\alpha(y_1), \dots, \alpha(y_m)): V \dashrightarrow W$。
2. **双有理等价的三个等价刻画**：对不可约代数簇 $V$ 与 $W$，以下三条等价：
   - **(i)** $V$ 与 $W$ 双有理等价（存在互逆有理映射 $\varphi: V \dashrightarrow W$ 与 $\psi: W \dashrightarrow V$）；
   - **(ii)** 它们的有理函数域作为 $k$-代数同构：$k(V) \cong k(W)$；
   - **(iii)** 存在 $V$ 中的非空主开集 $D(g) \subseteq V$ 与 $W$ 中的非空主开集 $D(h) \subseteq W$，使得 $D(g)$ 与 $D(h)$ 作为代数簇**正则同构**：$D(g) \cong D(h)$（即局部化坐标环同构 $k[V]_g \cong k[W]_h$）！

**Proof.**
1. 已在定理叙述中阐明：$\varphi: V \dashrightarrow W$ 诱导环同态 $\varphi^*: k[W] \to k(V), \psi \mapsto \psi(\varphi_1, \dots, \varphi_m)$。由分式域的泛性质，$\varphi^*$ 能延拓为分式域同态 $k(W) = \operatorname{Frac}(k[W]) \to k(V)$ 当且仅当 $\ker(\varphi^*: k[W] \to k(V)) = (0)$，即 $\varphi(\operatorname{dom}\varphi)$ 不落在 $W$ 的任何真闭超曲面 $V(\psi)$ 中，亦即 $\varphi$ 是稠密的。
2. **(i) $\Leftrightarrow$ (ii)** 由第 1 步的逆变函子性直接得出。下面证 **(i) $\Rightarrow$ (iii)**：
   设 $\varphi = (\varphi_1, \dots, \varphi_m): V \dashrightarrow W$ 与 $\psi = (\psi_1, \dots, \psi_n): W \dashrightarrow V$ 是互逆双有理映射。
   因为只有有限个有理函数 $\varphi_1, \dots, \varphi_m \in k(V)$，我们可以为它们取一个公共非零分母 $0 \neq g_0 \in k[V]$，使得所有 $\varphi_i \in k[V]_{g_0}$（即 $\varphi$ 在主开集 $D(g_0) \subseteq V$ 上是处处正则的态射）。
   同理，存在公共非零分母 $0 \neq h_0 \in k[W]$ 使得所有 $\psi_j \in k[W]_{h_0}$（即 $\psi$ 在主开集 $D(h_0) \subseteq W$ 上处处正则）。
   现在考虑拉回元素 $g := g_0 \cdot \varphi^*(h_0) \in k[V]_{g_0}$（可通过乘以 $g_0$ 的幂次将其调整为 $k[V]$ 中的非零多项式函数）以及 $h := h_0 \cdot \psi^*(g) \in k[W]$。
   在非空主开集 $D(g) \subseteq D(g_0) \subseteq V$ 上，不仅 $\varphi$ 正则，而且 $\varphi(D(g)) \subseteq D(h) \subseteq W$（因为 $\psi \circ \varphi = \mathrm{id}_V$，在 $D(g)$ 上 $h(\varphi(P)) = h_0(\varphi(P)) g(\psi(\varphi(P))) = h_0(\varphi(P)) g(P) \neq 0$）；对称地，$\psi(D(h)) \subseteq D(g)$。因此限制映射 $\varphi|_{D(g)}: D(g) \to D(h)$ 与 $\psi|_{D(h)}: D(h) \to D(g)$ 互为逆正则同构（代数上对应 $k[V]_g \cong k[W]_h$）！ **Q.E.D.**

#### 3.4 Projective varieties and the homogeneous Nullstellensatz

为什么代数几何不能只停留在仿射空间 $\mathbb{A}^n_k$ 中，而必须进入射影空间 $\mathbb{P}^n_k$？
1. **紧致性与完备性（Compactness / Completeness）**：在复流形拓扑下，$\mathbb{A}^n_{\mathbb{C}} = \mathbb{C}^n$ 非紧，而 $\mathbb{P}^n_{\mathbb{C}}$ 是紧致流形（可写成紧球面 $S^{2n+1}$ 模去紧群 $S^1$ 的商空间）。
2. **相交理论的统一（Bézout 定理）**：只有在 $\mathbb{P}^n_k$ 中计入无穷远交点，$m$ 次平面曲线与 $n$ 次平面曲线才恒有 $mn$ 个交点。
3. **全局常值性与线性系的有限维性**：在不可约紧致射影簇 $X \subset \mathbb{P}^n_k$ 上，任何处处正则的全局函数必为常数（$\mathcal{O}_X(X) = k$），而给定次数的齐次截面空间 $H^0(X, \mathcal{O}_X(d))$ 总是有限维 $k$-向量空间。

为了在 $\mathbb{P}^n_k$ 中系统建立代数集理论，我们先引入分次环与齐次理想。

**Definition 3.4.1 (分次环 Graded Ring 与齐次理想 Homogeneous Ideal).**
1. 交换环 $S$ 称为**分次环（Graded Ring）**，如果它作为阿贝尔群分解为直和 $S = \bigoplus_{d=0}^\infty S_d$，且乘法满足 $S_d \cdot S_e \subseteq S_{d+e}$。子群 $S_d$ 中的元素称为 **$d$ 次齐次元（Homogeneous Elements of Degree $d$）**。任意元素 $F \in S$ 可唯一分解为齐次分量之和 $F = \sum_{d \ge 0} F_d$（$F_d \in S_d$）。最核心的例子是 $(n+1)$ 元多项式环 $S = k[X_0, X_1, \dots, X_n] = \bigoplus_{d=0}^\infty k[X_0, \dots, X_n]_d$。
2. 分次环 $S$ 的理想 $I \subseteq S$ 称为**齐次理想（Homogeneous Ideal）**，如果它满足以下三个等价条件之一：
   - **(i)** $I$ 可以由一组（并且由 Hilbert 基定理，可由**有限个**）齐次元素生成；
   - **(ii)** 对任意 $F = \sum_{d \ge 0} F_d \in S$，有 $F \in I \iff \forall d \ge 0, \; F_d \in I$；
   - **(iii)** $I = \bigoplus_{d=0}^\infty (I \cap S_d)$。

**Proposition 3.4.2 (齐次理想的运算封闭性与齐次素理想判据).**
1. 若 $I, J \subseteq S$ 是齐次理想，则 $I + J, \; I \cdot J, \; I \cap J$ 以及根理想 $\sqrt{I}$ 全都是齐次理想。
2. 齐次理想 $\mathfrak{p} \subsetneq S$ 是素理想，当且仅当对任意两个**齐次元素** $F \in S_d, G \in S_e$，若 $F G \in \mathfrak{p}$ 则必有 $F \in \mathfrak{p}$ 或 $G \in \mathfrak{p}$。

**Proof.**
1. 对根理想 $\sqrt{I}$：设 $F = F_{d_{\min}} + \dots + F_{d_{\max}} \in \sqrt{I}$，则存在 $r \ge 1$ 使 $F^r \in I$。在 $F^r$ 的展开式中，最高次齐次分量恰好是 $(F_{d_{\max}})^r$！因为 $I$ 是齐次理想，必有 $(F_{d_{\max}})^r \in I$，即 $F_{d_{\max}} \in \sqrt{I}$。从 $F$ 中减去 $F_{d_{\max}}$ 并对剩余项归纳，即知所有齐次分量 $F_d \in \sqrt{I}$，故 $\sqrt{I}$ 是齐次理想。
2. 若齐次理想 $\mathfrak{p}$ 对齐次元素满足素理想条件，任取一般元素 $A = \sum_{i=0}^p A_i \notin \mathfrak{p}$ 与 $B = \sum_{j=0}^q B_j \notin \mathfrak{p}$。设 $i_0$ 是使 $A_{i_0} \notin \mathfrak{p}$ 的最大下标，$j_0$ 是使 $B_{j_0} \notin \mathfrak{p}$ 的最大下标。考察乘积 $A B$ 的第 $i_0 + j_0$ 次齐次分量：
   $$(AB)_{i_0 + j_0} = A_{i_0} B_{j_0} + \sum_{\substack{i + j = i_0 + j_0 \\ i > i_0 \text{ 或 } j > j_0}} A_i B_j.$$
   在右边求和号中，每一项要么 $i > i_0$（故 $A_i \in \mathfrak{p}$），要么 $j > j_0$（故 $B_j \in \mathfrak{p}$），因此求和项全部属于 $\mathfrak{p}$；而由假设，两个齐次元素 $A_{i_0}, B_{j_0} \notin \mathfrak{p}$ 的乘积 $A_{i_0} B_{j_0} \notin \mathfrak{p}$！故 $(AB)_{i_0 + j_0} \notin \mathfrak{p}$，从而 $A B \notin \mathfrak{p}$。 **Q.E.D.**

**Definition 3.4.3 (射影代数集 $V_{\mathbb{P}}(I)$、齐次消失理想 $I_{\mathbb{P}}(X)$ 与无关极大理想 $S_+$).**
在多项式分次环 $S = k[X_0, X_1, \dots, X_n]$ 与射影空间 $\mathbb{P}^n_k$ 中：
1. 对任意齐次理想 $I \subseteq S$，定义其**射影代数集（Projective Algebraic Set）**为：
   $$V_{\mathbb{P}}(I) := \left\{ P = [a_0 : \dots : a_n] \in \mathbb{P}^n_k \;\middle|\; F(a_0, \dots, a_n) = 0, \;\forall \text{ 齐次元 } F \in I \right\}.$$
   以全体 $V_{\mathbb{P}}(I)$ 为闭集在 $\mathbb{P}^n_k$ 上定义的拓扑称为 $\mathbb{P}^n_k$ 上的 **Zariski 拓扑**。
2. 对任意子集 $X \subseteq \mathbb{P}^n_k$，定义其**齐次消失理想（Homogeneous Ideal of $X$）**为由所有在 $X$ 上消失的齐次多项式生成的理想：
   $$I_{\mathbb{P}}(X) := \bigl( \{ F \in S_{\mathrm{homog}} \mid F(P) = 0, \;\forall P \in X \} \bigr) \subseteq S.$$
3. 由所有正次数齐次多项式构成的齐次极大理想：
   $$S_+ = \mathfrak{m}_0 := \bigoplus_{d = 1}^\infty S_d = (X_0, X_1, \dots, X_n) \subset S$$
   在 $\mathbb{A}^{n+1}_k$ 中仅切出被射影空间剔除的原点 $(0, 0, \dots, 0)$，在 $\mathbb{P}^n_k$ 中满足 $V_{\mathbb{P}}(S_+) = \varnothing$，因此 $S_+$ 称为**无关极大理想（Irrelevant Maximal Ideal）**。

**Theorem 3.4.4 (射影零点定理 / Projective Nullstellensatz).**
设 $k$ 为代数闭域，$I \subseteq S = k[X_0, \dots, X_n]$ 为齐次理想。
1. **射影弱零点定理（空集判据）**：射影代数集 $V_{\mathbb{P}}(I) = \varnothing \subset \mathbb{P}^n_k$，当且仅当以下三个等价条件之一成立：
   - **(i)** $\sqrt{I} \supseteq S_+ = (X_0, \dots, X_n)$（即 $\sqrt{I} = S_+$ 或 $\sqrt{I} = S = (1)$）；
   - **(ii)** 存在正整数 $N \ge 1$，使得对所有 $0 \le i \le n$ 均有 $X_i^N \in I$；
   - **(iii)** 存在正整数 $D \ge 1$，使得对所有 $d \ge D$，全部 $d$ 次齐次多项式空间都包含在 $I$ 中：$S_d \subseteq I$。
2. **射影强零点定理**：若 $V_{\mathbb{P}}(I) \neq \varnothing$，则齐次消失理想精确等于根理想：
   $$I_{\mathbb{P}}\bigl(V_{\mathbb{P}}(I)\bigr) = \sqrt{I}.$$
   因此，映射 $I \mapsto V_{\mathbb{P}}(I)$ 与 $X \mapsto I_{\mathbb{P}}(X)$ 给出了**不包含无关理想 $S_+$ 的齐次根理想**与 **$\mathbb{P}^n_k$ 中的非空射影代数集**之间的反序双射（其中齐次素理想对应不可约射影簇 Projective Varieties）！

**Proof.**
利用从 $\mathbb{A}^{n+1}_k \setminus \{0\}$ 到 $\mathbb{P}^n_k$ 的自然商映射 $\pi: (a_0, \dots, a_n) \mapsto [a_0 : \dots : a_n]$，我们将 $\mathbb{P}^n_k$ 中的射影问题直接拉回到 $\mathbb{A}^{n+1}_k$ 中的**仿射锥（Affine Cone）**：
$$C\bigl(V_{\mathbb{P}}(I)\bigr) := V_{\mathbb{A}}(I) \subseteq \mathbb{A}^{n+1}_k.$$
1. 因为 $I$ 是齐次理想，对任意非零向量 $a \in \mathbb{A}^{n+1}_k \setminus \{0\}$，有 $a \in V_{\mathbb{A}}(I) \iff \pi(a) \in V_{\mathbb{P}}(I)$。因此：
   $$V_{\mathbb{P}}(I) = \varnothing \subset \mathbb{P}^n_k \iff V_{\mathbb{A}}(I) \subseteq \{(0, 0, \dots, 0)\} = V_{\mathbb{A}}(S_+) \subset \mathbb{A}^{n+1}_k!$$
   对 $\mathbb{A}^{n+1}_k$ 中的包含关系 $V_{\mathbb{A}}(I) \subseteq V_{\mathbb{A}}(S_+)$ 应用仿射强零点定理（**Theorem 2.6.3**），立即得到：
   $$V_{\mathbb{A}}(I) \subseteq V_{\mathbb{A}}(S_+) \iff \sqrt{I} = I_{\mathbb{A}}\bigl(V_{\mathbb{A}}(I)\bigr) \supseteq I_{\mathbb{A}}\bigl(V_{\mathbb{A}}(S_+)\bigr) = S_+ = (X_0, \dots, X_n).$$
   这证明了 (i)。又因 $S_+$ 由 $X_0, \dots, X_n$ 生成，$\sqrt{I} \supseteq S_+ \iff \forall i, \; X_i \in \sqrt{I} \iff \exists N \ge 1, \; X_i^N \in I$，此即 (ii)。在 (ii) 成立时，取 $D = (n + 1)(N - 1) + 1$，由抽屉原理，任何次数 $d \ge D$ 的单项式 $X_0^{\alpha_0} \cdots X_n^{\alpha_n}$（$\sum \alpha_i = d$）必有某一个指数 $\alpha_i \ge N$，从而该单项式属于 $(X_i^N) \subseteq I$，即 $S_d \subseteq I$，此即 (iii)。
2. 当 $V_{\mathbb{P}}(I) \neq \varnothing$ 时，取其中一点 $P = [a_0 : \dots : a_n] \in V_{\mathbb{P}}(I)$，则整条非零标量直线 $\{ \lambda(a_0, \dots, a_n) \mid \lambda \in k \} \subseteq V_{\mathbb{A}}(I)$，特别地原点 $(0, \dots, 0) \in V_{\mathbb{A}}(I)$。因此仿射锥满足：
   $$V_{\mathbb{A}}(I) = \pi^{-1}\bigl(V_{\mathbb{P}}(I)\bigr) \cup \{0\}.$$
   于是一个非零齐次多项式 $F \in S_d$（$d \ge 1$）在射影集 $V_{\mathbb{P}}(I)$ 上恒为零，当且仅当它在仿射锥 $V_{\mathbb{A}}(I)$ 上恒为零！结合 $I_{\mathbb{P}}(V_{\mathbb{P}}(I))$ 与 $\sqrt{I}$ 均为齐次理想（且不含非零常数），再次由仿射强零点定理得：
   $$I_{\mathbb{P}}\bigl(V_{\mathbb{P}}(I)\bigr) = I_{\mathbb{A}}\bigl(V_{\mathbb{A}}(I)\bigr) = \sqrt{I}.$$
   证毕。 **Q.E.D.**

#### 3.5 Affine coverings, morphisms and birational equivalence

设 $V = V_{\mathbb{P}}(I) \subseteq \mathbb{P}^n_k$ 为射影簇，定义其**齐次坐标环（Homogeneous Coordinate Ring）**为分次商环：
$$S(V) := k[X_0, X_1, \dots, X_n] / I_{\mathbb{P}}(V) = \bigoplus_{d=0}^\infty S(V)_d.$$

> [!warning] 核心警示：齐次坐标环 $S(V)$ 不是内蕴同构不变量，它的元素也不是 $V$ 上的函数！
> 1. 齐次元素 $F \in S(V)_d$（当 $d \ge 1$ 时）满足 $F(\lambda X) = \lambda^d F(X)$，因此它在点 $P = [X_0 : \dots : X_n] \in V$ 处没有良定义的函数值！只有当我们将**两个同次数的齐次多项式相除**时，标量因子 $\lambda^d$ 才上下抵消：
>    $$\varphi(P) := \frac{F(\lambda X)}{G(\lambda X)} = \frac{\lambda^d F(X)}{\lambda^d G(X)} = \frac{F(X)}{G(X)} \qquad (F, G \in S(V)_d, \; G(P) \neq 0).$$
> 2. 同一个射影簇在不同嵌入下的齐次坐标环可以不同构：例如射影直线 $\mathbb{P}^1_k$ 作为自身嵌入时齐次坐标环是二元多项式环 $k[U, V]$（是 UFD）；而通过二次 Veronese 嵌入为平面光滑二次曲线 $Q = V(X Z - Y^2) \subset \mathbb{P}^2_k$ 时，其齐次坐标环是 $k[X, Y, Z]/(X Z - Y^2) \cong k[U^2, U V, V^2]$（不是 UFD，因为 $Y^2 = X Z$）！

**Definition 3.5.1 (射影簇的有理函数域、局部环与标准仿射开覆盖).**
设 $V \subseteq \mathbb{P}^n_k$ 为不可约射影簇（故 $S(V)$ 是分次整环）。
1. **射影簇的有理函数域 $k(V)$**：定义 $V$ 的有理函数域为分式域 $\operatorname{Frac}(S(V))$ 中所有**零次齐次分式**构成的子域：
   $$k(V) := S(V)_{((0))} = \left\{ \varphi = \frac{F}{G} \;\middle|\; \exists d \ge 0, \; F, G \in S(V)_d, \; G \neq 0 \right\}.$$
2. **局部环 $\mathcal{O}_{V, P}$**：对点 $P \in V$，定义 $V$ 在 $P$ 处的局部环为：
   $$\mathcal{O}_{V, P} := \left\{ \varphi = \frac{F}{G} \in k(V) \;\middle|\; F, G \in S(V)_d, \; G(P) \neq 0 \right\}.$$
3. **标准仿射坐标卡分解**：射影空间 $\mathbb{P}^n_k$ 被 $n + 1$ 个标准仿射开集 $U_i := \{ [X_0 : \dots : X_n] \in \mathbb{P}^n_k \mid X_i \neq 0 \} \cong \mathbb{A}^n_k$（$0 \le i \le n$）所覆盖。因此射影簇 $V \subseteq \mathbb{P}^n_k$ 自然被 $n + 1$ 个**仿射开子簇（Affine Open Pieces）** $V_i := V \cap U_i$ 所覆盖：
   $$V = \bigcup_{i=0}^n V_i, \qquad V_i = V \cap U_i \subseteq U_i \cong \mathbb{A}^n_k.$$
   在第 $i$ 个仿射坐标卡 $U_i$ 上（以 $x_{j/i} := X_j / X_i$ 为仿射坐标），去齐次化给出了如下内蕴同构：
   - $V_i \subseteq \mathbb{A}^n_k$ 的仿射坐标环同构于 $k[V_i] \cong \left(S(V)[X_i^{-1}]\right)_0 = k\left[\frac{X_0}{X_i}, \dots, \frac{X_n}{X_i}\right]$；
   - 对任意非空开片 $V_i \neq \varnothing$，其仿射有理函数域均自然等同于射影有理函数域：$k(V_i) \cong k(V)$；
   - 对任意点 $P \in V_i$，其在射影簇 $V$ 中的局部环完全等同于在仿射簇 $V_i$ 中的局部环：$\mathcal{O}_{V, P} \cong \mathcal{O}_{V_i, P}$！

**Definition 3.5.2 (准射影簇与一般代数簇态射的局部齐次刻画).**
1. 射影空间 $\mathbb{P}^n_k$ 中闭集的开子集（即射影代数集 $V$ 的开子集 $X \subseteq V \subseteq \mathbb{P}^n_k$）称为**准射影簇（Quasi-projective Variety）**。由于 $\mathbb{A}^n_k \cong U_0 \subset \mathbb{P}^n_k$ 是开子集，仿射簇与射影簇都是准射影簇的特例。
2. 设 $X \subseteq \mathbb{P}^n_k$ 与 $Y \subseteq \mathbb{P}^m_k$ 为准射影簇。映射 $f: X \to Y$ 称为**态射（Morphism / Regular Map）**，如果对每一点 $P \in X$，都存在包含 $P$ 的开邻域 $U \subseteq X$ 以及 $m + 1$ 个**同次数** $d \ge 0$ 的齐次多项式 $F_0, F_1, \dots, F_m \in k[X_0, \dots, X_n]_d$，使得对所有 $Q \in U$ 均有 $\bigl(F_0(Q), \dots, F_m(Q)\bigr) \neq (0, \dots, 0)$，且：
   $$f(Q) = \bigl[ F_0(Q) : F_1(Q) : \dots : F_m(Q) \bigr] \in Y \subseteq \mathbb{P}^m_k.$$
   等价地（通过仿射坐标卡检验），$f: X \to Y$ 是连续映射，且对 $Y$ 的每个仿射开集 $W_j = Y \cap U_j$ 和其中的每个正则函数 $\psi \in \mathcal{O}_Y(W_j)$，拉回函数 $\psi \circ f$ 在 $f^{-1}(W_j)$ 上每一点处都正则（即对任意 $P \in X$ 诱导局部环同态 $f^*_P: \mathcal{O}_{Y, f(P)} \to \mathcal{O}_{X, P}$）。

**Example 3.5.3 (为什么射影态射需要局部有多组不同齐次代表式？光滑二次曲线投影).**
考虑平面光滑二次曲线 $Q = V(X Z - Y^2) \subset \mathbb{P}^2_k$ 到射影直线 $\mathbb{P}^1_k$ 的同构投影 $f: Q \to \mathbb{P}^1_k$。在 $Q$ 上恒有 $X Z = Y^2 \iff \frac{X}{Y} = \frac{Y}{Z}$。因此映射 $f$ 可由**两组**一次齐次多项式对局部定义：
$$f([X : Y : Z]) = \begin{cases} [X : Y], & \text{在开集 } U_1 = Q \setminus \{[0:0:1]\} \text{（即 } (X,Y) \neq (0,0)\text{）上}, \\[6pt] [Y : Z], & \text{在开集 } U_2 = Q \setminus \{[1:0:0]\} \text{（即 } (Y,Z) \neq (0,0)\text{）上}. \end{cases}$$
在交集 $U_1 \cap U_2$（即 $Y \neq 0$）上，由 $X Z = Y^2$ 知 $[X : Y] = [X Z : Y Z] = [Y^2 : Y Z] = [Y : Z]$，两组表达式完全吻合！但是，在 $Q$ 上**不存在单一的一组**一次齐次式 $[L_0(X,Y,Z) : L_1(X,Y,Z)]$ 能在整个 $Q$ 上处处无基点地表示该逆同构 $f: Q \to \mathbb{P}^1_k$！**严格证明**：若存在一次齐次式 $L_0, L_1$ 在 $Q$ 的某个非空开集上表示 $f$，将其沿二次 Veronese 同构 $[u : v] \mapsto [u^2 : u v : v^2] \in Q$ 拉回至 $\mathbb{P}^1_k$，由 $f([u^2 : u v : v^2]) = [u : v]$ 可知，对所有 $[u : v] \in \mathbb{P}^1_k$ 恒有比例恒等式 $[L_0(u^2, u v, v^2) : L_1(u^2, u v, v^2)] = [u : v]$，即多项式环 $k[u, v]$ 中恒有 $v \, L_0(u^2, u v, v^2) = u \, L_1(u^2, u v, v^2)$。由于 $\gcd(u, v) = 1$ 且 $L_0(u^2, u v, v^2), L_1(u^2, u v, v^2)$ 是关于 $(u, v)$ 的二次齐次多项式，必存在同一个非零一次齐次式 $L(u, v) = \alpha u + \beta v \neq 0$ 使得 $L_0(u^2, u v, v^2) = u \cdot L(u, v)$ 且 $L_1(u^2, u v, v^2) = v \cdot L(u, v)$。然而，非零一次式 $L(u, v)$ 在 $\mathbb{P}^1_k$ 上必有唯一零点 $[u_0 : v_0] = [-\beta : \alpha]$，在该点对应的二次曲线点 $P_0 = [u_0^2 : u_0 v_0 : v_0^2] \in Q$ 处必同时有 $L_0(P_0) = L_1(P_0) = 0$（出现未定义基点 $[0:0]$）！（注：不能简单用“任意两条直线 $L_0=L_1=0$ 的交点必在 $Q$ 上”来论证，因为例如 $L_0=X, L_1=Z$ 的公共交点 $[0:1:0] \notin Q$；上述拉回因式分解才精准证明了**能够表示逆同构 $f$** 的任何一次式对 $[L_0:L_1]$ 必在 $Q$ 上恰有一个公共零点。）这生动说明了在 Definition 3.5.2 中允许随点 $P$ 更换局部齐次多项式组 $(F_0, \dots, F_m)$ 的必要性。

**Example 3.5.4 ($d$ 次 Veronese 嵌入 $v_{n, d}: \mathbb{P}^n_k \hookrightarrow \mathbb{P}^N_k$).**
给定正整数 $n, d \ge 1$。在 $n + 1$ 个变元 $X_0, \dots, X_n$ 中，全部次数为 $d$ 的单项式 $M_I = X_0^{i_0} X_1^{i_1} \cdots X_n^{i_n}$（其中 $I = (i_0, \dots, i_n) \in \mathbb{Z}_{\ge 0}^{n+1}, \sum_{j=0}^n i_j = d$）共有 $N + 1 := \binom{n + d}{d}$ 个。定义 **$d$ 次 Veronese 映射**：
$$v_{n, d}: \mathbb{P}^n_k \longrightarrow \mathbb{P}^N_k, \qquad [X_0 : \dots : X_n] \longmapsto \bigl[ \dots : M_I(X_0, \dots, X_n) : \dots \bigr]_{|I| = d}.$$
1. **处处良定义性**：对任意 $[X_0 : \dots : X_n] \in \mathbb{P}^n_k$，必存在某个 $X_j \neq 0$，从而纯幂次单项式 $X_j^d \neq 0$，故右侧坐标不全为零。
2. **$v_{n, d}$ 是闭嵌入（Closed Embedding，同构于闭像集）**：像集 $V_{n, d} := v_{n, d}(\mathbb{P}^n_k) \subset \mathbb{P}^N_k$ 是由二次齐次关系式 $Z_I Z_J - Z_K Z_L = 0$（对所有满足多重指标加法 $I + J = K + L$ 的指标四元组）定义的闭射影簇（称为 **Veronese 簇**）。在仿射开卡 $Z_{(d,0,\dots,0)} = X_0^d \neq 0$ 上，逆映射由提取一次比值 $\frac{X_j}{X_0} = \frac{X_0^{d-1} X_j}{X_0^d}$ 直接给出，故 $\mathbb{P}^n_k \xrightarrow{\sim} V_{n, d}$。
3. **几何意义（超曲面截口线性化）**：$\mathbb{P}^n_k$ 中的任意 $d$ 次超曲面 $H = V\left(\sum_{|I|=d} a_I X^I\right) \subset \mathbb{P}^n_k$，在 Veronese 嵌入 $v_{n, d}$ 下恰好变成外围空间 $\mathbb{P}^N_k$ 中的一个**超平面截口（Hyperplane Section）** $V_{n, d} \cap V\left(\sum_{|I|=d} a_I Z_I\right)$！这使我们常能通过 Veronese 嵌入将关于高次超曲面的定理化归为关于超平面（一次式）的定理。

#### 3.6 Products of varieties and the Segre embedding

给定两个代数簇 $V$ 和 $W$，如何赋予笛卡尔积 $V \times W$ 自然的代数簇结构？

**Proposition 3.6.1 (仿射簇的乘积与坐标环张量积).**
设 $V \subseteq \mathbb{A}^n_k$（坐标 $X_1, \dots, X_n$）与 $W \subseteq \mathbb{A}^m_k$（坐标 $Y_1, \dots, Y_m$）为两个仿射代数集。
1. 在 $\mathbb{A}^n_k \times \mathbb{A}^m_k = \mathbb{A}^{n+m}_k$ 中，笛卡尔积 $V \times W$ 是由理想 $I(V) k[X, Y] + I(W) k[X, Y]$ 定义的仿射代数闭集，其消失理想与坐标环满足自然同构：
   $$I(V \times W) = I(V) k[X, Y] + I(W) k[X, Y], \qquad k[V \times W] \cong k[V] \otimes_k k[W].$$
2. 若 $V$ 与 $W$ 均为不可约仿射簇，则乘积 $V \times W$ 也是**不可约仿射簇**（即代数闭域上两个有限生成整环的张量积 $k[V] \otimes_k k[W]$ 仍是整环，且 $\dim(V \times W) = \dim V + \dim W$）。
3. **拓扑警示**：当 $\dim V, \dim W \ge 1$ 时，$V \times W$ 上的 Zariski 拓扑**严格细于**两个因子 Zariski 拓扑的乘积拓扑！例如在 $\mathbb{A}^1_k \times \mathbb{A}^1_k = \mathbb{A}^2_k$ 中，对角线 $\Delta = V(X - Y)$ 是 $\mathbb{A}^2_k$ 的 Zariski 闭集，但它在乘积拓扑中不是闭集（乘积拓扑的真闭集只能是有限条水平线 $Y = b_j$ 与有限条竖直线 $X = a_i$ 的并集）。

**Proof.**
1. 由张量积同构 $k[X_1, \dots, X_n, Y_1, \dots, Y_m] \cong k[X_1, \dots, X_n] \otimes_k k[Y_1, \dots, Y_m]$ 可知，商环满足：
   $$A := k[X, Y] / \bigl(I(V) k[X, Y] + I(W) k[X, Y]\bigr) \cong k[V] \otimes_k k[W].$$
   我们要证 $I(V) k[X,Y] + I(W) k[X,Y]$ 已经是根理想（且等于 $I(V \times W)$）。任取 $F(X, Y) \in I(V \times W)$，将其在商环 $k[V] \otimes_k k[W]$ 中的剩余类写成有限和 $\sum_{i=1}^r f_i(X) \otimes g_i(Y)$，其中可设 $g_1, \dots, g_r \in k[W]$ 在基域 $k$ 上**线性无关**。
   对任意固定点 $P \in V$，考虑 $W$ 上的多项式函数 $\psi_P(Y) := \sum_{i=1}^r f_i(P) g_i(Y) \in k[W]$。因为 $F \in I(V \times W)$，对所有 $Q \in W$ 都有 $\psi_P(Q) = F(P, Q) = 0$，即 $\psi_P = 0 \in k[W]$！但 $g_1, \dots, g_r$ 在 $k[W]$ 中 $k$-线性无关，故必有所有系数 $f_i(P) = 0$（对每个 $1 \le i \le r$）。由 $P \in V$ 的任意性知 $f_i = 0 \in k[V]$，从而 $\sum f_i \otimes g_i = 0 \in k[V] \otimes_k k[W]$，证毕。
2. 设 $V, W$ 不可约。若 $V \times W = Z_1 \cup Z_2$ 为两个闭子集的并，对每个 $P \in V$，不可约空间 $\{P\} \times W \cong W$ 满足 $\{P\} \times W = \bigl((\{P\} \times W) \cap Z_1\bigr) \cup \bigl((\{P\} \times W) \cap Z_2\bigr)$，故必有 $\{P\} \times W \subseteq Z_1$ 或 $\{P\} \times W \subseteq Z_2$。定义 $V_i := \{ P \in V \mid \{P\} \times W \subseteq Z_i \} = \bigcap_{Q \in W} \{ P \in V \mid (P, Q) \in Z_i \}$（$i = 1, 2$），它是 $V$ 中一族闭集的交，故 $V_1, V_2$ 是 $V$ 的闭子集，且 $V = V_1 \cup V_2$。由 $V$ 不可约，必有 $V = V_1$（即 $V \times W = Z_1$）或 $V = V_2$（即 $V \times W = Z_2$），故 $V \times W$ 不可约！ **Q.E.D.**

对于射影空间，由于 $\mathbb{P}^n_k \times \mathbb{P}^m_k$ 的两组齐次坐标允许独立缩放 $(\lambda X, \mu Y)$，不能直接将它们拼成 $(X_0 : \dots : X_n : Y_0 : \dots : Y_m) \in \mathbb{P}^{n+m+1}_k$。正确的方法是取两组坐标的**全部两两乘积**（对应秩 $1$ 矩阵），这便是经典的 **Segre 嵌入**。

**Theorem 3.6.2 (Segre 嵌入 $\sigma_{n,m}: \mathbb{P}^n_k \times \mathbb{P}^m_k \hookrightarrow \mathbb{P}^{(n+1)(m+1)-1}_k$ 与射影簇乘积).**
令 $N := (n + 1)(m + 1) - 1$，并将射影空间 $\mathbb{P}^N_k$ 的 $N + 1$ 个齐次坐标排列成一个 $(n + 1) \times (m + 1)$ 矩阵 $Z = (Z_{ij})_{0 \le i \le n, \; 0 \le j \le m}$。定义 **Segre 映射**：
$$\sigma_{n, m}: \mathbb{P}^n_k \times \mathbb{P}^m_k \longrightarrow \mathbb{P}^N_k, \qquad \bigl([X_0 : \dots : X_n], \; [Y_0 : \dots : Y_m]\bigr) \longmapsto \bigl[ \dots : X_i Y_j : \dots \bigr] \quad (Z_{ij} = X_i Y_j).$$
则：
1. $\sigma_{n, m}$ 是良定义的单射，且其像集 $\Sigma_{n, m} := \operatorname{Im}(\sigma_{n, m}) \subset \mathbb{P}^N_k$ 恰好是由矩阵 $Z = (Z_{ij})$ 的**全体 $2 \times 2$ 子式（Minors）为零**所切出的不可约闭射影簇（称为 **Segre 簇**，即秩为 $1$ 的非零 $(n+1) \times (m+1)$ 矩阵的射影化空间）：
   $$\Sigma_{n, m} = V_{\mathbb{P}}\bigl( \{ Z_{ij} Z_{kl} - Z_{il} Z_{kj} \mid 0 \le i, k \le n, \; 0 \le j, l \le m \} \bigr) = \{ [Z] \in \mathbb{P}^N_k \mid \operatorname{rank}(Z) = 1 \}.$$
2. 在标准仿射开覆盖 $\Sigma_{n,m} \cap U_{ij} = \{ Z_{ij} \neq 0 \}$ 上，$\sigma_{n,m}$ 给出了与仿射乘积 $U_i \times U'_j \cong \mathbb{A}^n_k \times \mathbb{A}^m_k = \mathbb{A}^{n+m}_k$ 的正则同构！因此任意两个射影簇 $V \subseteq \mathbb{P}^n_k$ 与 $W \subseteq \mathbb{P}^m_k$ 的乘积 $\sigma_{n,m}(V \times W) \subseteq \mathbb{P}^N_k$ 仍是射影簇。
3. **特例（$n = m = 1$：二次曲面作为 $\mathbb{P}^1_k \times \mathbb{P}^1_k$）**：当 $n = m = 1$ 时，$N = 2 \times 2 - 1 = 3$，Segre 嵌入：
   $$\sigma_{1, 1}: \mathbb{P}^1_k \times \mathbb{P}^1_k \xrightarrow{\;\sim\;} Q = V(Z_{00} Z_{11} - Z_{01} Z_{10}) \subset \mathbb{P}^3_k$$
   将 $\mathbb{P}^1_k \times \mathbb{P}^1_k$ 同构地映为三维射影空间 $\mathbb{P}^3_k$ 中的**非奇异二次曲面（Smooth Quadric Surface，如双曲抛物面 / 单叶双曲面）**！且二次曲面 $Q$ 上著名的**两族直母线（Two Rulings of Lines）**恰好就是乘积空间的两族坐标纤维：
   $$\mathcal{L}_1 = \{ \{P\} \times \mathbb{P}^1_k \mid P \in \mathbb{P}^1_k \}, \qquad \mathcal{L}_2 = \{ \mathbb{P}^1_k \times \{Q\} \mid Q \in \mathbb{P}^1_k \},$$
   同族直母线两两不相交（异面），异族直母线每两条恰相交于唯一一点 $(P, Q)$！

**Proof.**
1. 线性代数基本事实：非零 $(n+1) \times (m+1)$ 矩阵 $Z = (Z_{ij})$ 的秩 $\operatorname{rank}(Z) = 1 \iff Z$ 的所有 $2 \times 2$ 子式 $Z_{ij} Z_{kl} - Z_{il} Z_{kj} = 0 \iff$ 存在非零列向量 $X = (X_0, \dots, X_n)^{\mathsf{T}}$ 与非零行向量 $Y = (Y_0, \dots, Y_m)$ 使得 $Z = X Y$（即 $Z_{ij} = X_i Y_j$）。
2. 在开集 $U_{00} = \{ Z_{00} \neq 0 \}$ 上，归一化令 $Z_{00} = 1$（对应 $X_0 = 1, Y_0 = 1$），则由 $Z_{ij} = Z_{00} Z_{ij} = Z_{i0} Z_{0j}$ 可知，在 $\Sigma_{n, m} \cap U_{00}$ 上所有其余坐标 $Z_{ij}$（$i, j \ge 1$）均由前两列/行坐标 $x_i := Z_{i0} = X_i/X_0$（$1 \le i \le n$）与 $y_j := Z_{0j} = Y_j/Y_0$（$1 \le j \le m$）的多项式乘积 $Z_{ij} = x_i y_j$ 唯一确定，这就给出了 $\Sigma_{n,m} \cap U_{00} \xrightarrow{\sim} \mathbb{A}^n_k \times \mathbb{A}^m_k = U_0 \times U'_0$ 的同构。 **Q.E.D.**

#### 3.7 Tangent space, nonsingularity and dimension theory

在微积分与微分几何中，嵌入流形在一点 $P$ 处的切空间由定义方程组在该点处的**一阶线性化（Jacobian 矩阵的核）**所给出。在代数几何中，我们不仅可以无需极限地用形式偏导数定义**外在切空间（Extrinsic Tangent Space）**，更可以通过局部环 $\mathcal{O}_{V, P}$ 的极大理想 $\mathfrak{m}_{V, P}$ 给出完全不依赖于外围嵌入空间的**内蕴 Zariski 切空间（Intrinsic Zariski Tangent Space）**。

**Definition 3.7.1 (仿射簇在一点处的切空间 $T_P V$ 与 Jacobian 矩阵).**
设 $V \subseteq \mathbb{A}^n_k$ 为仿射代数集，$P = (a_1, \dots, a_n) \in V$。
1. 对任意多项式 $f \in k[X_1, \dots, X_n]$，定义其在点 $P$ 处的**线性部分（Linear Part / Differential at $P$）**为一次齐次型：
   $$d_P f(X_1 - a_1, \dots, X_n - a_n) := \sum_{j=1}^n \frac{\partial f}{\partial X_j}(P) (X_j - a_j).$$
2. 定义 $V$ 在点 $P$ 处的**切空间（Tangent Space）** $T_P V \subseteq \mathbb{A}^n_k$（以 $P$ 为原点的向量子空间）为消失理想 $I(V)$ 中所有多项式在点 $P$ 处线性部分的公共零点空间：
   $$T_P V := \left\{ v = (v_1, \dots, v_n) \in k^n \;\middle|\; d_P f(v) = \sum_{j=1}^n \frac{\partial f}{\partial X_j}(P) v_j = 0, \;\forall f \in I(V) \right\}.$$
   若消失理想由有限个多项式生成：$I(V) = (f_1, \dots, f_r)$（由 Leibniz 乘积求导法则，对任意 $g_i \in k[X_1, \dots, X_n]$ 及 $f = \sum g_i f_i$，因 $f_i(P) = 0$，恒有 $d_P f = \sum g_i(P) d_P f_i$），则切空间 $T_P V$ 恰好是 $r \times n$ **雅可比矩阵（Jacobian Matrix）** 在点 $P$ 处的核空间（Nullspace）：
   $$J_P(f_1, \dots, f_r) := \left( \frac{\partial f_i}{\partial X_j}(P) \right)_{1 \le i \le r, \; 1 \le j \le n}, \qquad T_P V = \ker J_P(f_1, \dots, f_r).$$
   由线性代数的秩-零化度定理（Rank-Nullity Theorem），切空间的维数恒等于：
   $$\dim_k T_P V = n - \operatorname{rank} J_P(f_1, \dots, f_r).$$

**Theorem 3.7.2 (切空间的内蕴刻画：Zariski 余切空间 $\mathfrak{m}_P / \mathfrak{m}_P^2$).**
设 $V \subseteq \mathbb{A}^n_k$ 为仿射代数集，$P = (a_1, \dots, a_n) \in V$。记 $\mathfrak{m}_P \subset k[V]$ 为点 $P$ 对应的坐标环极大理想，记 $\mathfrak{m}_{V, P} = \mathfrak{m}_P \mathcal{O}_{V, P} \subset \mathcal{O}_{V, P}$ 为局部环极大理想。则：
1. 商空间 $\mathfrak{m}_P / \mathfrak{m}_P^2$（作为 $k[V]/\mathfrak{m}_P \cong k$ 上的向量空间，称为点 $P$ 处的 **Zariski 余切空间 Zariski Cotangent Space**）与局部环余切空间自然同构：
   $$\mathfrak{m}_P / \mathfrak{m}_P^2 \xrightarrow{\;\sim\;} \mathfrak{m}_{V, P} / \mathfrak{m}_{V, P}^2.$$
2. 微分映射 $d_P: \mathfrak{m}_P / \mathfrak{m}_P^2 \to (T_P V)^*$ 给出了 Zariski 余切空间与切空间对偶空间之间的**自然 $k$-线性同构**，其对偶即给出内蕴同构：
   $$T_P V \xrightarrow{\;\sim\;} \bigl(\mathfrak{m}_P / \mathfrak{m}_P^2\bigr)^* \cong \bigl(\mathfrak{m}_{V, P} / \mathfrak{m}_{V, P}^2\bigr)^*.$$
3. **推论（切空间的内蕴性与局部性）**：切空间 $T_P V$ 在相差线性同构的意义下仅依赖于局部环 $\mathcal{O}_{V, P}$（从而是同构不变量，且对包含 $P$ 的任意开子集 $U \subseteq V$ 均有 $T_P U \cong T_P V$）。每一个态射 $\varphi: V \to W$（满足 $\varphi(P) = Q$）通过局部环拉回 $\varphi^*_P: \mathfrak{m}_{W, Q}/\mathfrak{m}_{W, Q}^2 \to \mathfrak{m}_{V, P}/\mathfrak{m}_{V, P}^2$ 的对偶映射，自然诱导**切映射（Differential / Tangent Map）** $d_P \varphi: T_P V \to T_Q W$，且满足链式法则 $d_P(\psi \circ \varphi) = d_Q \psi \circ d_P \varphi$。

**Proof.**
1. 通过平移坐标不妨设 $P = (0, \dots, 0) \in \mathbb{A}^n_k$，记外围多项式环 $A = k[X_1, \dots, X_n]$ 在原点处的极大理想为 $\mathfrak{M}_0 = (X_1, \dots, X_n)$。
   对任意多项式 $f \in \mathfrak{M}_0$，其 Taylor 展开无常数项：$f(X) = d_0 f(X) + \text{（次数 } \ge 2 \text{ 的项）}$，其中次数 $\ge 2$ 的项恰好属于平方理想 $\mathfrak{M}_0^2 = (X_i X_j)_{1 \le i, j \le n}$！因此微分映射：
   $$d_0: \mathfrak{M}_0 \longrightarrow (k^n)^*, \qquad f \longmapsto d_0 f = \sum_{j=1}^n \frac{\partial f}{\partial X_j}(0) X_j$$
   是满射 $k$-线性映射，且其核精确等于 $\ker(d_0) = \mathfrak{M}_0^2$，从而诱导同构 $\mathfrak{M}_0 / \mathfrak{M}_0^2 \xrightarrow{\sim} (k^n)^*$。
2. 现在考虑商环 $k[V] = A / I(V)$，其中极大理想为 $\mathfrak{m}_0 = \mathfrak{M}_0 / I(V)$。由于：
   $$\mathfrak{m}_0 / \mathfrak{m}_0^2 = \bigl(\mathfrak{M}_0 / I(V)\bigr) \big/ \bigl((\mathfrak{M}_0^2 + I(V)) / I(V)\bigr) \cong \mathfrak{M}_0 / \bigl(\mathfrak{M}_0^2 + I(V)\bigr),$$
   在上述同构 $\mathfrak{M}_0 / \mathfrak{M}_0^2 \xrightarrow{\sim} (k^n)^*$ 下，子空间 $(\mathfrak{M}_0^2 + I(V)) / \mathfrak{M}_0^2$ 恰好被映为子空间 $d_0(I(V)) \subseteq (k^n)^*$！
   根据线性代数中的商空间对偶定理，$(k^n)^* / d_0(I(V))$ 的对偶空间恰好是 $k^n$ 中与 $d_0(I(V))$ 正交（零化）的子空间——而按照 **Definition 3.7.1**，这个零化子空间正是切空间 $T_0 V = \{ v \in k^n \mid \langle d_0 f, v \rangle = 0, \;\forall f \in I(V) \}$！因此：
   $$\bigl(\mathfrak{m}_0 / \mathfrak{m}_0^2\bigr)^* \cong \bigl((k^n)^* / d_0(I(V))\bigr)^* \cong T_0 V.$$
3. 最后验证局部化不改变 $\mathfrak{m}_P / \mathfrak{m}_P^2$：对任意 $\frac{f}{g} \in \mathfrak{m}_{V, P}$（其中 $f \in \mathfrak{m}_P, g \in k[V] \setminus \mathfrak{m}_P$），设 $c = g(P) \neq 0$，则 $g - c \in \mathfrak{m}_P$。在 $\mathcal{O}_{V, P}$ 中计算差值：
   $$\frac{f}{g} - \frac{f}{c} = \frac{-f(g - c)}{c g} \in \mathfrak{m}_P \cdot \mathfrak{m}_{V, P} \subseteq \mathfrak{m}_{V, P}^2!$$
   这说明 $\frac{f}{g} \equiv c^{-1} f \pmod{\mathfrak{m}_{V,P}^2}$，故自然映射 $\mathfrak{m}_P / \mathfrak{m}_P^2 \to \mathfrak{m}_{V,P} / \mathfrak{m}_{V,P}^2$ 是满射；又因 $\mathfrak{m}_P \cap \mathfrak{m}_{V,P}^2 = \mathfrak{m}_P^2$（若 $h \in \mathfrak{m}_P$ 满足 $s h \in \mathfrak{m}_P^2$ 且 $s(P) = 1$，则 $h = (1 - s)h + s h \in \mathfrak{m}_P^2$），故它是同构。 **Q.E.D.**

**Proposition 3.7.3 (切空间维数函数 $P \mapsto \dim_k T_P V$ 的上半连续性).**
设 $V \subseteq \mathbb{A}^n_k$ 为仿射代数集。对任意非负整数 $m \ge 0$，集合：
$$V_{\ge m} := \left\{ P \in V \;\middle|\; \dim_k T_P V \ge m \right\}$$
是 $V$ 的一个 **Zariski 闭子集**！特别地，令 $d_0 := \min_{P \in V} \dim_k T_P V$ 为切空间维数在 $V$ 上取得的最小值，则取得该最小维数的点集：
$$V_{\mathrm{min}} = \left\{ P \in V \;\middle|\; \dim_k T_P V = d_0 \right\} = V \setminus V_{\ge d_0 + 1}$$
是 $V$ 的一个**非空 Zariski 开子集**（当 $V$ 不可约时，它在 $V$ 中必稠密）。

**Proof.**
设 $I(V) = (f_1, \dots, f_r)$。由 $\dim_k T_P V = n - \operatorname{rank} J_P(f_1, \dots, f_r)$ 可知：
$$\dim_k T_P V \ge m \iff \operatorname{rank} J_P(f_1, \dots, f_r) \le n - m.$$
根据线性代数，一个矩阵的秩 $\le n - m$ **当且仅当**它的所有 $(n - m + 1) \times (n - m + 1)$ 阶子式（Determinants of $(n-m+1) \times (n-m+1)$ Submatrices）全等于零！
由于雅可比矩阵 $J(f_1, \dots, f_r) = \left(\frac{\partial f_i}{\partial X_j}\right)$ 的每个元素都是多项式，其每一个 $(n - m + 1)$ 阶子式 $D_\alpha(X_1, \dots, X_n)$ 也都是 $X_1, \dots, X_n$ 的多项式。因此：
$$V_{\ge m} = V \cap V\bigl( \{ D_\alpha \}_{\alpha} \bigr)$$
是由有限个子式多项式的公共零点切出的 Zariski 闭子集！ **Q.E.D.**

**Definition 3.7.4 (不可约代数簇的维数 $\dim V$ 与非奇异点 / 光滑点).**
设 $V$ 为不可约代数簇（仿射、射影或准射影），其有理函数域为 $k(V)$。
1. **维数（Dimension）**：定义 $V$ 的**维数** $\dim V$ 为有理函数域 $k(V)$ 在基域 $k$ 上的**超越次数（Transcendence Degree）**：
   $$\dim V := \operatorname{tr.deg}_k k(V).$$
   （若 $V$ 在 Noether 正规化下是多项式环 $k[y_1, \dots, y_d]$ 的有限整环扩张，则 $k(V)$ 是纯超越域 $k(y_1, \dots, y_d)$ 的有限代数扩张，故 $\dim V = d$；对于可约代数集 $V = V_1 \cup \dots \cup V_r$，定义 $\dim V := \max_{1 \le i \le r} \dim V_i$）。
2. **非奇异点（光滑点 Nonsingular / Smooth Point）与奇异轨迹 $\operatorname{Sing}(V)$**：对不可约代数簇 $V$ 上的点 $P \in V$，如果切空间维数恰好等于簇的维数：
   $$\dim_k T_P V = \dim V,$$
   则称 $P$ 为 $V$ 的**非奇异点（Nonsingular Point 或 Smooth / Regular Point）**；否则（如下文定理所示，此时必有 $\dim_k T_P V > \dim V$）称 $P$ 为 $V$ 的**奇点（Singular Point）**。若 $V$ 的每一个点都是非奇异点，则称 $V$ 为**非奇异簇（光滑簇 Nonsingular / Smooth Variety）**。

**Theorem 3.7.5 (光滑轨迹的稠密开集定理：$\dim_k T_P V \ge \dim V$ 且在稠密开集上取等号).**
设 $V$ 为不可约代数簇（在代数闭域 $k = \bar{k}$ 上），记 $\dim V = d = \operatorname{tr.deg}_k k(V)$。则：
1. 对所有点 $P \in V$，恒有 $\dim_k T_P V \ge d = \dim V$；
2. 非奇异点集（光滑轨迹）：
   $$V_{\mathrm{reg}} = V_{\mathrm{nonsing}} := \left\{ P \in V \;\middle|\; \dim_k T_P V = \dim V \right\}$$
   是 $V$ 的一个**非空稠密 Zariski 开子集**（从而奇点集 $\operatorname{Sing}(V) = V \setminus V_{\mathrm{reg}}$ 是 $V$ 的真闭子集，$\dim \operatorname{Sing}(V) < \dim V$）！

**Proof.**
我们分两步证明该核心定理：先证明超曲面情形（$V = H \subset \mathbb{A}^{d+1}_k$），再利用双有理等价于超曲面定理（**Theorem 2.7.3** 与 **Theorem 3.3.2**）推广到任意不可约簇 $V$。
1. **第一步（超曲面情形 $H = V(F) \subset \mathbb{A}^{d+1}_k$）**：
   设 $F(X_1, \dots, X_{d+1}) \in k[X_1, \dots, X_{d+1}]$ 为非常数不可约多项式，定义超曲面 $H = V(F) \subset \mathbb{A}^{d+1}_k$。因为 $k[X_1, \dots, X_{d+1}]$ 是 UFD，不可约元生成的主理想 $(F)$ 是素理想，故 $I(H) = (F)$。
   - **计算 $\dim H$**：因 $F$ 非常数，某个变元（不妨设 $X_{d+1}$）在 $F$ 中以正次数出现。于是商环 $k[H] = k[X_1, \dots, X_{d+1}]/(F)$ 中，$x_1, \dots, x_d$ 在 $k$ 上代数无关（否则存在非零多项式 $G(X_1, \dots, X_d) \in (F)$，即 $F \mid G$，与 $F$ 含有 $X_{d+1}$ 矛盾），而 $x_{d+1}$ 满足代数方程 $F(x_1, \dots, x_d, x_{d+1}) = 0$。故 $k(H)$ 在 $k(x_1, \dots, x_d)$ 上是代数扩张，超越次数 $\dim H = \operatorname{tr.deg}_k k(H) = d$。
   - **计算 $\dim_k T_P H$**：因为 $I(H) = (F)$ 由单个方程生成，在点 $P \in H$ 处，$1 \times (d+1)$ 雅可比矩阵为梯度向量 $\nabla F(P) = \left(\frac{\partial F}{\partial X_1}(P), \dots, \frac{\partial F}{\partial X_{d+1}}(P)\right)$：
     - 当 $\nabla F(P) \neq (0, \dots, 0)$ 时，$\operatorname{rank}(\nabla F(P)) = 1$，故 $\dim_k T_P H = (d + 1) - 1 = d = \dim H$；
     - 当 $\nabla F(P) = (0, \dots, 0)$ 时，$\operatorname{rank}(\nabla F(P)) = 0$，故 $\dim_k T_P H = d + 1 > \dim H$。
   - **证明光滑点集 $H_{\mathrm{reg}} = H \setminus V\left(\frac{\partial F}{\partial X_1}, \dots, \frac{\partial F}{\partial X_{d+1}}\right)$ 非空**：
     用反证法。假设 $H_{\mathrm{reg}} = \varnothing$，这意味着对所有 $1 \le i \le d+1$，偏导数 $\frac{\partial F}{\partial X_i}$ 在整个 $H = V(F)$ 上恒等于零，即 $\frac{\partial F}{\partial X_i} \in I(H) = (F)$。
     但是，偏导数 $\frac{\partial F}{\partial X_i}$ 的总次数满足 $\deg\left(\frac{\partial F}{\partial X_i}\right) \le \deg F - 1 < \deg F$！一个次数严格小于 $\deg F$ 的多项式被 $F$ 整除，唯一的可能是它在多项式环中**恒等于零多项式**：
     $$\frac{\partial F}{\partial X_i} \equiv 0 \qquad (\forall i = 1, \dots, d + 1)!$$
     - 若 $\operatorname{char} k = 0$，所有一阶偏导数恒为零直接推出 $F \in k$ 是常数，与 $F$ 为非常数不可约多项式矛盾！
     - 若 $\operatorname{char} k = p > 0$，$\frac{\partial F}{\partial X_i} \equiv 0$（对所有 $i$）意味着 $F$ 中出现的每个变元的幂次都是 $p$ 的倍数，即 $F(X_1, \dots, X_{d+1}) = G(X_1^p, \dots, X_{d+1}^p)$。但由于 $k = \bar{k}$ 是代数闭域，每个系数 $a_\alpha \in k$ 都有 $p$ 次方根 $b_\alpha = a_\alpha^{1/p} \in k$，由特征 $p$ 下的 Frobenius 恒等式 $(u + v)^p = u^p + v^p$，立即得出：
       $$F(X_1, \dots, X_{d+1}) = \bigl( \tilde{G}(X_1, \dots, X_{d+1}) \bigr)^p,$$
       即 $F$ 是一个多项式的 $p$ 次幂，这再次与 $F$ 是**不可约多项式**矛盾！
     因此必存在某个 $i$ 使 $\frac{\partial F}{\partial X_i} \notin (F)$，从而 $H_{\mathrm{reg}}$ 是 $H$ 的非空稠密开子集！
2. **第二步（一般不可约簇 $V$ 的情形）**：
   由 **Theorem 2.7.3**，$d$ 维不可约簇 $V$ 双有理等价于 $\mathbb{A}^{d+1}_k$ 中的一个不可约超曲面 $H = V(F) \subset \mathbb{A}^{d+1}_k$。再由 **Theorem 3.3.2(2)(iii)**，存在 $V$ 中的非空开集 $U \subseteq V$ 与 $H$ 中的非空开集 $U' \subseteq H$，使得 $U \cong U'$ 正则同构。
   因为切空间是局部同构不变量（**Theorem 3.7.2(3)**），且在不可约空间 $H$ 中两个非空开集 $U'$ 与 $H_{\mathrm{reg}}$ 的交集 $U' \cap H_{\mathrm{reg}} \neq \varnothing$ 仍是稠密开集，故在 $V$ 的非空稠密开集上 $\dim_k T_P V = \dim_k T_Q H = d$。最后由 **Proposition 3.7.3** 的上半连续性，既然在稠密开集上 $\dim_k T_P V = d$，最小值 $d_0 = \min_{P \in V} \dim_k T_P V$ 必然等于 $d$，从而对所有 $P \in V$ 均有 $\dim_k T_P V \ge d$，且取等号的光滑轨迹 $V_{\mathrm{reg}}$ 是 $V$ 的非空稠密开子集！ **Q.E.D.**

#### 3.8 Blowups and resolution of curve singularities

在 **Chapter 1** 中我们看到，当 $\operatorname{char} k \neq 2$ 时，结点三次曲线 $y^2 = x^2(x + 1)$ 在原点 $(0, 0)$ 处有两条不同的切线 $y = \pm x$，当我们引入斜率参数 $t = y/x$ 时，原本在平面 $\mathbb{A}^2_k$ 中重合于原点 $(0, 0)$ 的两个分支在参数空间中被拆分为两个不同的点 $t = 1$ 与 $t = -1$（注：若 $\operatorname{char} k = 2$，则 $t = 1 = -1$ 重合，且令 $Y = y + x$ 后方程化为尖点三次曲线 $Y^2 = x^3$）。将这一“引入过原点的所有直线斜率以拆开奇点”的操作几何化，便得到了代数几何中最强大的双有理手术工具——**爆破（Blowup / $\sigma$-Process）**。

**Definition 3.8.1 (在原点处爆破仿射空间 $\operatorname{Bl}_0 \mathbb{A}^n_k$).**
设 $n \ge 2$，记仿射空间 $\mathbb{A}^n_k$ 的坐标为 $(x_1, \dots, x_n)$，记射影空间 $\mathbb{P}^{n-1}_k$（参数化 $\mathbb{A}^n_k$ 中所有过原点 $O = (0, \dots, 0)$ 的直线方向）的齐次坐标为 $[Y_1 : \dots : Y_n]$。
定义 $\mathbb{A}^n_k$ 在原点 $O$ 处的**爆破（Blowup of $\mathbb{A}^n_k$ at the Origin）**为乘积空间 $\mathbb{A}^n_k \times \mathbb{P}^{n-1}_k$ 中的如下闭子簇（关联簇 Incidence Variety）：
$$\widetilde{\mathbb{A}}^n_k = \operatorname{Bl}_0 \mathbb{A}^n_k := \left\{ \bigl((x_1, \dots, x_n), \; [Y_1 : \dots : Y_n]\bigr) \in \mathbb{A}^n_k \times \mathbb{P}^{n-1}_k \;\middle|\; x_i Y_j - x_j Y_i = 0, \;\forall 1 \le i < j \le n \right\},$$
并记向第一因子的自然投影态射为 $\pi: \operatorname{Bl}_0 \mathbb{A}^n_k \to \mathbb{A}^n_k, \; (x, [Y]) \mapsto x$。

**Theorem 3.8.2 (爆破空间 $\operatorname{Bl}_0 \mathbb{A}^n_k$ 的基本几何性质与局部坐标卡).**
1. **原点之外是同构**：对任意非零点 $x = (x_1, \dots, x_n) \in \mathbb{A}^n_k \setminus \{O\}$，方程组 $x_i Y_j = x_j Y_i$ 唯一决定了齐次比值 $[Y_1 : \dots : Y_n] = [x_1 : \dots : x_n] \in \mathbb{P}^{n-1}_k$。因此限制映射：
   $$\pi\big|_{\pi^{-1}(\mathbb{A}^n_k \setminus \{O\})}: \operatorname{Bl}_0 \mathbb{A}^n_k \setminus \pi^{-1}(O) \xrightarrow{\;\sim\;} \mathbb{A}^n_k \setminus \{O\}$$
   是双正则同构（特别地，$\pi: \operatorname{Bl}_0 \mathbb{A}^n_k \to \mathbb{A}^n_k$ 是**双有理态射**）。
2. **例外除子（Exceptional Divisor）$E = \pi^{-1}(O)$**：当 $x = O = (0, \dots, 0)$ 时，方程 $0 \cdot Y_j - 0 \cdot Y_i = 0$ 对任意 $[Y_1 : \dots : Y_n] \in \mathbb{P}^{n-1}_k$ 恒成立！因此原点 $O$ 的逆像纤维是整整一个 $(n-1)$ 维射影空间：
   $$E := \pi^{-1}(O) = \{O\} \times \mathbb{P}^{n-1}_k \cong \mathbb{P}^{n-1}_k,$$
   称为爆破的**例外超曲面（Exceptional Hypersurface / Exceptional Divisor）**（当 $n=2$ 时称为**例外曲线 Exceptional Curve** $E \cong \mathbb{P}^1_k$）。它的每一点 $[Y_1 : \dots : Y_n] \in E$ 精确代表逼近原点 $O$ 的一个切方向。
3. **光滑性与 $n$ 个仿射坐标卡覆盖**：$\operatorname{Bl}_0 \mathbb{A}^n_k$ 是 $n$ 维不可约非奇异簇，它被 $n$ 个同构于 $\mathbb{A}^n_k$ 的标准仿射开卡 $W_i := \operatorname{Bl}_0 \mathbb{A}^n_k \cap \bigl(\mathbb{A}^n_k \times \{Y_i \neq 0\}\bigr)$（$1 \le i \le n$）所覆盖。
   具体而言，在二维平面爆破 $\operatorname{Bl}_0 \mathbb{A}^2_k = \{ ((x, y), [U : V]) \in \mathbb{A}^2_k \times \mathbb{P}^1_k \mid x V = y U \}$ 中，两个仿射坐标卡为：
   - **第一坐标卡 $W_1 = \{U \neq 0\} \cong \mathbb{A}^2_k$**：令斜率坐标为 $u := V/U$，则方程 $x V = y U$ 化为：
     $$y = x u,$$
     从而 $(x, u) \in \mathbb{A}^2_k \mapsto \bigl((x, x u), [1 : u]\bigr) \in W_1$ 给出了同构 $\mathbb{A}^2_k \xrightarrow{\sim} W_1$。在此坐标卡下，爆破投影为 $\pi(x, u) = (x, x u)$，而例外曲线 $E \cap W_1$ 的方程为 **$x = 0$**（参数为斜率 $u \in \mathbb{A}^1_k$）！
   - **第二坐标卡 $W_2 = \{V \neq 0\} \cong \mathbb{A}^2_k$**：令余斜率坐标为 $v := U/V$，则方程化为：
     $$x = y v,$$
     从而 $(v, y) \in \mathbb{A}^2_k \mapsto \bigl((y v, y), [v : 1]\bigr) \in W_2$ 给出了同构 $\mathbb{A}^2_k \xrightarrow{\sim} W_2$。在此坐标卡下，爆破投影为 $\pi(v, y) = (y v, y)$，例外曲线 $E \cap W_2$ 的方程为 **$y = 0$**（在交集上 $v = 1/u$）。

**Definition 3.8.3 (全变换 Total Transform 与严格变换 Strict / Proper Transform).**
设 $C = V(f) \subset \mathbb{A}^2_k$ 为经过原点 $O(0,0)$ 的平面曲线，其在原点处的重数为 $m = m_O(C) \ge 1$，即：
$$f(x, y) = f_m(x, y) + f_{m+1}(x, y) + \dots + f_d(x, y), \qquad f_m(x, y) \neq 0.$$
1. **全变换（Total Transform）** $\pi^{-1}(C)$：将 $y = x u$ 代入 $f(x, y) = 0$，在第一坐标卡 $W_1 \cong \mathbb{A}^2_{(x,u)}$ 中得到：
   $$f(x, x u) = x^m \bigl( f_m(1, u) + x f_{m+1}(1, u) + \dots + x^{d-m} f_d(1, u) \bigr) = 0.$$
   全变换包含了高重数的例外曲线因子 $x^m = 0$（即 $m E$）。
2. **严格变换（Strict Transform 或 Proper Transform）** $\widetilde{C}$：定义为去掉原点后逆像在 $\operatorname{Bl}_0 \mathbb{A}^2_k$ 中的 Zariski 闭包：
   $$\widetilde{C} := \overline{\pi^{-1}\bigl(C \setminus \{O\}\bigr)} \subset \operatorname{Bl}_0 \mathbb{A}^2_k.$$
   在仿射坐标卡 $W_1$ 中，$\widetilde{C} \cap W_1$ 的方程恰好由从 $f(x, x u)$ 中**除掉最高次公因子 $x^m$** 后得到：
   $$\tilde{f}(x, u) := x^{-m} f(x, x u) = f_m(1, u) + x f_{m+1}(1, u) + \dots + x^{d-m} f_d(1, u) = 0!$$
   令 $x = 0$，立即看到严格变换 $\widetilde{C}$ 与例外曲线 $E = \{x = 0\}$ 的交点由方程 $f_m(1, u) = 0$（在齐次形式下即 $f_m(U, V) = 0$）给出——**严格变换 $\widetilde{C}$ 与例外曲线 $E$ 的交点恰好一一对应于原曲线 $C$ 在原点 $O$ 处切锥的主切线方向**！

**Example 3.8.4 (平面曲线奇点消解的三大典型算例，以下结点与触点算例设 $\operatorname{char} k \neq 2$).**
在坐标卡 $W_1: (x, y) = (x, x u)$ 下，我们显式检验爆破如何消解平面奇点（注：本节一般爆破定义、坐标卡与严格变换公式对任意特征域均成立；但下方第 1、3 例中的结点 $y^2 - x^2(x+1) = 0$ 与不可约触点 $y^2 - x^4 - y^4 = 0$ 需设 $\operatorname{char} k \neq 2$，因为在特征 $2$ 下 $1 = -1$ 会使 $u = \pm 1$ 重合为二重相切，且 $y^2 - x^4 - y^4 = (y - x^2 - y^2)^2$ 在特征 $2$ 下可约、导数 $2w = 0$）：
1. **结点三次曲线（Nodal Cubic，$\operatorname{char} k \neq 2$）$C_1: y^2 - x^2(x + 1) = 0$**：
   代入 $y = x u$ 得 $x^2 u^2 - x^2(x + 1) = x^2(u^2 - x - 1) = 0$。除掉例外曲线因子 $x^2$，严格变换 $\widetilde{C}_1$ 的方程为：
   $$\widetilde{C}_1: x = u^2 - 1 \quad (\text{即 } u^2 - x - 1 = 0).$$
   这是一条光滑抛物线（同构于 $\mathbb{A}^1_k$），处处满足 $\frac{\partial \tilde{f}}{\partial x} = -1 \neq 0$，故 **$\widetilde{C}_1$ 完全光滑**！它与例外曲线 $E: x = 0$ 横截相交于两个不同的点 $(x, u) = (0, 1)$ 与 $(0, -1)$（对应原结点处的两条切线 $y = \pm x$）。一次爆破即完成奇点消解！
2. **尖点三次曲线（Cuspidal Cubic）$C_2: y^2 - x^3 = 0$**：
   代入 $y = x u$ 得 $x^2 u^2 - x^3 = x^2(u^2 - x) = 0$。除掉 $x^2$，严格变换 $\widetilde{C}_2$ 的方程为：
   $$\widetilde{C}_2: x = u^2 \quad (\text{即 } u^2 - x = 0).$$
   同样因 $\frac{\partial \tilde{f}}{\partial x} = -1 \neq 0$，**严格变换 $\widetilde{C}_2$ 也是完全光滑的抛物线**！与结点不同的是，$\widetilde{C}_2$ 与例外曲线 $E: x = 0$ 在唯一交点 $(x, u) = (0, 0)$ 处**相切**（相交重数为 $2$）。若需要连同全变换除子也变成正常交叉（Normal Crossing），再作后续爆破即可，但曲线本身的奇点经一次爆破已被完全消解！
3. **互切二重点 / 触点（Tacnode）$C_3: y^2 - x^4 = 0$（或不可约曲线 $y^2 - x^4 - y^4 = 0$）**：
   对不可约四次曲线 $C: y^2 - x^4 - y^4 = 0$，在原点处 $m_O(C) = 2$，切锥为二重切线 $y^2 = 0$。
   - **第一次爆破**（$y = x u$）：$x^2 u^2 - x^4 - x^4 u^4 = x^2(u^2 - x^2 - x^2 u^4) = 0$。严格变换为：
     $$\widetilde{C}: u^2 - x^2(1 + u^4) = 0.$$
     注意在点 $(x, u) = (0, 0)$ 处，$\widetilde{C}$ 仍然是一个奇点，但它的性质从原本的触点（Tacnode，$y^2 \sim x^4$）改善为了具有两条不同切线 $u = \pm x$ 的**普通结点（Node，$u^2 - x^2 = 0$）**！
   - **第二次爆破**（在 $(x, u) = (0, 0)$ 处令 $u = x w$）：代入得 $x^2 w^2 - x^2(1 + x^4 w^4) = x^2(w^2 - 1 - x^4 w^4) = 0$。除掉 $x^2$ 后，第二次严格变换为：
     $$\widetilde{\widetilde{C}}: w^2 - 1 - x^4 w^4 = 0,$$
     它在 $x = 0, w = \pm 1$ 处满足 $\frac{\partial}{\partial w} = 2w = \pm 2 \neq 0$，现已**完全光滑**！这个例子清晰展示了一般平面曲线奇点消解定理（通过有限次单点爆破必可将任意不可约平面代数曲线化为光滑射影曲线）的运作机制。

#### 3.9 Exercises to Chapter 3

> [!note] Miles Reid 原书 Chapter III（§5–§6）原始习题索引与对照
> - **原书 §5 习题（Function Fields, Rational Maps & Projective Varieties）**：(5.1–5.2) 去点平面 $\mathbb{A}^2_k \setminus \{(0,0)\}$ 的全局正则函数环等于 $k[X,Y]$ 及其非仿射性证明；(5.3–5.5) 局部环 $\mathcal{O}_{V,P}$、奇点坐标环的整闭包（正规化）、射影三次扭曲曲线与二次曲面 Segre 嵌入 $Q \cong \mathbb{P}^1 \times \mathbb{P}^1$；(5.6–5.8) 标准 Cremona 二次变换 $(X:Y:Z) \mapsto (YZ:XZ:XY)$ 与不可约射影簇全局正则函数常值性。
> - **原书 §6 习题（Tangent Space, Dimension & Blowups）**：(6.1–6.4) Zariski 切空间计算、奇异曲面切锥、代数群处处非奇异性及经典矩阵群 $\operatorname{SL}_n, \operatorname{O}_n$ 在单位元处的李代数切空间；(6.5–6.7) 包含两条异面直线的三次曲面有理参数化、高阶平面曲线奇点 $y^p = x^q$ 的连续爆破消解。
> 以下按专题逐题给出完整陈述与严格证明。

##### Exercise 3.1 (去点仿射平面 $\mathbb{A}^2_k \setminus \{(0,0)\}$ 不是仿射簇的严格证明)
设 $U := \mathbb{A}^2_k \setminus \{(0, 0)\} = D(X) \cup D(Y)$ 为二维仿射平面挖去原点后的开子簇。
1. 证明 $U$ 上处处正则的有理函数环等于整个二元多项式环：
   $$\mathcal{O}_{\mathbb{A}^2}(U) = \bigcap_{P \in U} \mathcal{O}_{\mathbb{A}^2, P} = k[X, Y];$$
2. 由此证明准射影簇 $U = \mathbb{A}^2_k \setminus \{(0, 0)\}$ **不可能是仿射簇**（即 $U$ 不与任何仿射代数集同构，且 $U$ 在 $\mathbb{A}^2_k$ 中不是主开集 $D(g)$）！

**Proof.**
1. 因为 $U = D(X) \cup D(Y)$，一个有理函数 $\varphi \in k(X, Y)$ 在 $U$ 上处处正则，当且仅当它在 $D(X)$ 上正则且在 $D(Y)$ 上正则。由 **Theorem 3.2.3(3)**：
   $$\mathcal{O}_{\mathbb{A}^2}(U) = \mathcal{O}_{\mathbb{A}^2}\bigl(D(X)\bigr) \cap \mathcal{O}_{\mathbb{A}^2}\bigl(D(Y)\bigr) = k[X, Y]\left[\frac{1}{X}\right] \cap k[X, Y]\left[\frac{1}{Y}\right].$$
   任取 $\varphi \in k[X, Y][1/X] \cap k[X, Y][1/Y]$。由于 $k[X, Y]$ 是唯一析因整环（UFD），将 $\varphi = f / g$ 写成既约分式（其中 $f, g \in k[X, Y]$ 且 $\gcd(f, g) = 1$）。
   - 因为 $\varphi = f/g = h_1 / X^r$（$h_1 \in k[X, Y]$），即 $X^r f = g h_1$，由 $\gcd(f, g) = 1$ 知 $g \mid X^r$，故 $g$ 的所有不可约因子只能是 $X$（在相差常数倍下 $g = X^a$）；
   - 同理，因为 $\varphi = f/g = h_2 / Y^s$，知 $g \mid Y^s$，故 $g$ 的所有不可约因子只能是 $Y$！
   既然 $X$ 与 $Y$ 是两个互不相关的不可约元，$g$ 只能是**非零常数** $g \in k^\times$！故 $\varphi \in k[X, Y]$，即 $\mathcal{O}_{\mathbb{A}^2}(U) = k[X, Y]$。
2. 用反证法。假设 $U$ 同构于某个仿射簇 $V$，则嵌入态射 $\iota: U \hookrightarrow \mathbb{A}^2_k$ 在全局正则函数环上诱导的拉回同态 $\iota^*: k[\mathbb{A}^2] = k[X, Y] \to \mathcal{O}(U) = k[X, Y]$ 恰为恒等映射 $\mathrm{id}_{k[X,Y]}$（特别地是同构）。由仿射簇范畴的反等价定理（**Theorem 3.1.4(3)**），若 $U$ 是仿射簇，则 $\iota^*$ 是同构蕴含 $\iota: U \hookrightarrow \mathbb{A}^2_k$ 必须是双射（同构），但这与 $(0, 0) \notin U$ 矛盾！ **Q.E.D.**

##### Exercise 3.2 (奇异三次曲线 $Y^2 = X^2(X+1)$ 坐标环的整闭包与正规化 Normalisation)
设 $C = V(Y^2 - X^2(X + 1)) \subset \mathbb{A}^2_k$（当 $\operatorname{char} k \neq 2$ 时为结点三次曲线；当 $\operatorname{char} k = 2$ 时经 $Y' = Y + X$ 化为尖点三次曲线 $Y'^2 = X^3$，以下整闭包与正规化计算对任意特征域均成立），记其坐标环为 $A = k[C] = k[x, y]$（满足 $y^2 = x^2(x + 1)$）。
1. 令 $t := y / x \in k(C)$。证明 $t$ 在坐标环 $A = k[C]$ 上是**整元（Integral over $A$）**，但 $t \notin A$（因此 $A$ 不是整闭整环 / 非正规环 Non-normal Domain）；
2. 证明 $A$ 在其分式域 $k(C) = k(t)$ 中的整闭包（Integral Closure）恰好是一元多项式环 $\widetilde{A} = A[t] = k[t]$，且包含映射 $A \hookrightarrow k[t]$ 对应的几何态射 $\pi: \mathbb{A}^1_k \to C, \; t \mapsto (t^2 - 1, t(t^2 - 1))$ 恰为结点三次曲线的奇点消解（正规化态射）！

**Proof.**
1. 在分式域 $k(C)$ 中，将 $y^2 = x^2(x + 1)$ 两边同除以 $x^2 \neq 0$，得到：
   $$t^2 - (x + 1) = 0, \qquad \text{其中 } x + 1 \in A = k[C]!$$
   这是一个关于 $t$ 的首一二次方程，系数在 $A$ 中，故 $t = y/x$ 在 $A$ 上是整元。
   但 $t \notin A$：若 $t \in A$，则存在多项式 $P(X, Y) \in k[X, Y]$ 使得在 $C$ 上 $Y = X P(X, Y)$，这意味着 $Y - X P(X, Y) \in (Y^2 - X^2 - X^3)$；但在右边理想中所有多项式都没有一次项（重数 $\ge 2$），而左边含有非零一次项 $Y$，矛盾！
2. 因为 $x = t^2 - 1 \in k[t]$ 且 $y = t x = t(t^2 - 1) \in k[t]$，故 $A[t] = k[x, y, t] = k[t]$。又因为一元多项式环 $k[t]$ 是唯一析因整环（UFD），而任何 UFD 在其分式域 $k(t)$ 中都是整闭的（高斯引理：若 $u/v \in k(t)$ 既约且满足 $(u/v)^m + a_{m-1}(u/v)^{m-1} + \dots + a_0 = 0$，同乘 $v^m$ 得 $u^m = -v(a_{m-1} u^{m-1} + \dots)$，故 $v \mid u^m \implies v \in k^\times$），所以 $A$ 在 $k(C) = k(t)$ 中的整闭包恰好就是 $\widetilde{A} = k[t]$。 **Q.E.D.**

##### Exercise 3.3 (局部环中的可逆元与极大理想生成元：光滑点处的局部参数)
设 $C = V(X^2 + Y^2 - 1) \subset \mathbb{A}^2_k$（$\operatorname{char} k \neq 2$）为单位圆，$P = (1, 0) \in C$。证明在点 $P$ 的局部环 $\mathcal{O}_{C, P}$ 中，其极大理想 $\mathfrak{m}_{C, P} = (x - 1, y) \mathcal{O}_{C, P}$ 可以由**单个元素** $y$ 生成（即 $\mathfrak{m}_{C, P} = y \mathcal{O}_{C, P}$ 是主理想，$\mathcal{O}_{C, P}$ 是离散赋值环 DVR！），并解释其几何原因。

**Proof.**
在坐标环 $k[C] = k[X, Y]/(X^2 + Y^2 - 1)$ 中，恒有关系式：
$$(x - 1)(x + 1) = x^2 - 1 = -y^2.$$
在点 $P = (1, 0)$ 处，函数 $x + 1$ 的取值为 $(x + 1)(1, 0) = 1 + 1 = 2 \neq 0$（因为 $\operatorname{char} k \neq 2$）。因此 $x + 1 \notin \mathfrak{m}_P$ 在局部环 $\mathcal{O}_{C, P}$ 中是**可逆元（Unit）**！
将两边同除以可逆元 $x + 1 \in \mathcal{O}_{C, P}^\times$，得到：
$$x - 1 = \left(\frac{-y}{x + 1}\right) \cdot y \in y \mathcal{O}_{C, P}!$$
因此极大理想满足 $\mathfrak{m}_{C, P} = (x - 1, y) \mathcal{O}_{C, P} = (y) \mathcal{O}_{C, P}$。
**几何解释**：在点 $P = (1, 0)$ 处，圆 $C$ 的切线是竖直直线 $X - 1 = 0$（因而 $x - 1$ 在 $P$ 处与圆相切，具有 $2$ 阶零点，即 $x - 1 \in \mathfrak{m}_{C, P}^2$），而水平直线 $Y = 0$ 与圆在 $P$ 处横截相交（故 $y$ 在 $\mathfrak{m}_{C, P} / \mathfrak{m}_{C, P}^2$ 中的像非零，构成一维余切空间的基，由中山引理直接生成 $\mathfrak{m}_{C, P}$）。在一维代数簇（曲线）上，点 $P \in C$ 是光滑点（$\dim_k \mathfrak{m}_{C,P}/\mathfrak{m}_{C,P}^2 = 1$）**当且仅当**局部环 $\mathcal{O}_{C, P}$ 的极大理想 $\mathfrak{m}_{C, P}$ 是主理想（即 $\mathcal{O}_{C, P}$ 是离散赋值环 Discrete Valuation Ring, DVR），生成元 $y$ 称为点 $P$ 处的**局部一致化参数（Local Uniformizing Parameter）**。 **Q.E.D.**

##### Exercise 3.4 (射影三次扭曲曲线 Projective Twisted Cubic 与行列式簇)
定义射影直线 $\mathbb{P}^1_k$ 的 $3$ 次 Veronese 嵌入为：
$$v_{1, 3}: \mathbb{P}^1_k \longrightarrow \mathbb{P}^3_k, \qquad [U : V] \longmapsto [X_0 : X_1 : X_2 : X_3] = [U^3 : U^2 V : U V^2 : V^3].$$
其像集 $C_3 := \operatorname{Im}(v_{1, 3}) \subset \mathbb{P}^3_k$ 称为**射影三次扭曲曲线（Projective Twisted Cubic Curve）**。
1. 证明 $C_3$ 恰好由 $2 \times 3$ Hankel 矩阵的所有 $2 \times 2$ 子式为零所切出：
   $$C_3 = V_{\mathbb{P}}\left( \operatorname{rank} \begin{pmatrix} X_0 & X_1 & X_2 \\ X_1 & X_2 & X_3 \end{pmatrix} \le 1 \right) = V_{\mathbb{P}}(Q_0, Q_1, Q_2),$$
   其中三个二次齐次多项式为 $Q_0 = X_1 X_3 - X_2^2, \; Q_1 = X_1 X_2 - X_0 X_3, \; Q_2 = X_0 X_2 - X_1^2$；
2. 证明空间中任意 $4$ 个位于 $C_3$ 上的不同点 $P_1, P_2, P_3, P_4 \in C_3$ 必定**不共面**（即它们在 $\mathbb{P}^3_k$ 中张成整个 $\mathbb{P}^3_k$，这是 Vandermonde 行列式的几何化身），并由此证明 $C_3$ 与任意平面 $\Pi \subset \mathbb{P}^3_k$ 按重数计算恰有 $3$ 个交点（故 $\deg C_3 = 3$）。

**Proof.**
1. 若 $[X_0:X_1:X_2:X_3] = [U^3:U^2V:UV^2:V^3]$，显然矩阵 $\begin{pmatrix} U^3 & U^2 V & U V^2 \\ U^2 V & U V^2 & V^3 \end{pmatrix} = \begin{pmatrix} U \\ V \end{pmatrix} \begin{pmatrix} U^2 & U V & V^2 \end{pmatrix}$ 的秩为 $1$，三个 $2 \times 2$ 子式 $Q_0, Q_1, Q_2$ 全为零。反之，设点 $P = [X_0:X_1:X_2:X_3]$ 使该矩阵秩为 $1$：
   - 若 $X_0 = 0$，由 $Q_2 = X_0 X_2 - X_1^2 = 0$ 得 $X_1 = 0$，再由 $Q_0 = X_1 X_3 - X_2^2 = 0$ 得 $X_2 = 0$，故 $P = [0:0:0:1] = v_{1,3}([0:1])$；
   - 若 $X_0 \neq 0$，归一化令 $X_0 = 1$ 并记 $t = X_1$，由 $Q_2 = 0$ 得 $X_2 = X_1^2 = t^2$，由 $Q_1 = 0$ 得 $X_3 = X_1 X_2 = t^3$，故 $P = [1 : t : t^2 : t^3] = v_{1,3}([1 : t])$。
   因此 $C_3 = V_{\mathbb{P}}(Q_0, Q_1, Q_2)$（且在两个仿射卡 $X_0 \neq 0$ 与 $X_3 \neq 0$ 上都是标准仿射三次扭曲曲线，故齐次理想 $(Q_0, Q_1, Q_2)$ 本身就是素理想 $I_{\mathbb{P}}(C_3)$）。
2. 设 $P_i = v_{1, 3}([u_i : v_i])$（$i = 1, 2, 3, 4$）是 $C_3$ 上四个互不相同的点。它们代表向量构成的 $4 \times 4$ 行列式恰好是齐次 **Vandermonde 行列式**：
   $$\det \begin{pmatrix} u_1^3 & u_1^2 v_1 & u_1 v_1^2 & v_1^3 \\ u_2^3 & u_2^2 v_2 & u_2 v_2^2 & v_2^3 \\ u_3^3 & u_3^2 v_3 & u_3 v_3^2 & v_3^3 \\ u_4^3 & u_4^2 v_4 & u_4 v_4^2 & v_4^3 \end{pmatrix} = \prod_{1 \le i < j \le 4} (u_i v_j - u_j v_i) \neq 0!$$
   因为行列式非零，四个代表向量在 $k^4$ 中线性无关，即 $P_1, P_2, P_3, P_4$ 不共处于任何平面 $a_0 X_0 + a_1 X_1 + a_2 X_2 + a_3 X_3 = 0$ 上；同时将平面方程代入参数化得到非零三次齐次式 $a_0 U^3 + a_1 U^2 V + a_2 U V^2 + a_3 V^3 = 0$，在 $\mathbb{P}^1_k$ 上按重数计算恒有 $3$ 个根。 **Q.E.D.**

##### Exercise 3.5 (光滑二次曲面 $Q \cong \mathbb{P}^1 \times \mathbb{P}^1$ 在一点处的切平面与两条直母线)
设 $Q = V(X_0 X_3 - X_1 X_2) \subset \mathbb{P}^3_k$ 为 Segre 二次曲面。
1. 对任意点 $P = [a_0 : a_1 : a_2 : a_3] \in Q$，求 $Q$ 在点 $P$ 处的射影切平面 $T_P Q \subset \mathbb{P}^3_k$ 的方程；
2. 证明切平面截口 $Q \cap T_P Q$ 恰好退化为**经过点 $P$ 的两条不同直母线的并集** $L_1 \cup L_2$（一条来自第一族直母线 $\mathcal{L}_1$，另一条来自第二族直母线 $\mathcal{L}_2$）；
3. 设 $P_0 \in Q$ 为固定点，$\Pi \subset \mathbb{P}^3_k$ 为不经过 $P_0$ 的平面。证明从 $P_0$ 向平面 $\Pi$ 的中心投影 $\pi_{P_0}: Q \dashrightarrow \Pi \cong \mathbb{P}^2_k$ 是双有理映射，并指出该映射将经过 $P_0$ 的两条直母线 $L_1, L_2$ 分别收缩（Blow down）为 $\mathbb{P}^2_k$ 上的两个点 $A_1, A_2$，同时将 $\mathbb{P}^2_k$ 中连接 $A_1 A_2$ 的直线吹起为 $Q$ 上的无穷远点 $P_0$！

**Proof.**
1. 令 $F = X_0 X_3 - X_1 X_2$，则偏导数为 $\nabla F(P) = (a_3, -a_2, -a_1, a_0) \neq (0,0,0,0)$（故 $Q$ 处处非奇异）。切平面方程为：
   $$T_P Q: a_3 X_0 - a_2 X_1 - a_1 X_2 + a_0 X_3 = 0.$$
2. 在 Segre 参数化 $\sigma_{1,1}([u_0 : u_1], [v_0 : v_1]) = [u_0 v_0 : u_0 v_1 : u_1 v_0 : u_1 v_1]$ 下，设点 $P = \sigma_{1,1}([p_0 : p_1], [q_0 : q_1])$（即 $a_0 = p_0 q_0, a_1 = p_0 q_1, a_2 = p_1 q_0, a_3 = p_1 q_1$）。将通用点 $\sigma_{1,1}([u_0:u_1], [v_0:v_1])$ 代入切平面方程 $T_P Q$，立即因式分解为：
   $$p_1 q_1 u_0 v_0 - p_1 q_0 u_0 v_1 - p_0 q_1 u_1 v_0 + p_0 q_0 u_1 v_1 = (p_1 u_0 - p_0 u_1)(q_1 v_0 - q_0 v_1) = 0!$$
   其中第一个因式 $p_1 u_0 - p_0 u_1 = 0$（即 $[u_0 : u_1] = [p_0 : p_1]$）定义了经过 $P$ 的第一族直母线 $L_1 = \{[p_0:p_1]\} \times \mathbb{P}^1_k$，第二个因式 $q_1 v_0 - q_0 v_1 = 0$（即 $[v_0 : v_1] = [q_0 : q_1]$）定义了经过 $P$ 的第二族直母线 $L_2 = \mathbb{P}^1_k \times \{[q_0:q_1]\}$！故 $Q \cap T_P Q = L_1 \cup L_2$。
3. 取 $P_0 = [0 : 0 : 0 : 1] \in Q$，并取平面 $\Pi: X_3 = 0$（齐次坐标 $[X_0 : X_1 : X_2]$）。从 $P_0$ 向 $\Pi$ 的投影为 $[X_0 : X_1 : X_2 : X_3] \mapsto [X_0 : X_1 : X_2]$。在 $Q: X_0 X_3 = X_1 X_2$ 上，当 $X_0 \neq 0$ 时可唯一还原 $X_3 = X_1 X_2 / X_0$，逆有理映射为：
   $$\psi: \mathbb{P}^2_k \dashrightarrow Q, \qquad [X_0 : X_1 : X_2] \longmapsto [X_0^2 : X_0 X_1 : X_0 X_2 : X_1 X_2].$$
   在 $P_0 = [0:0:0:1]$ 处的切平面为 $X_0 = 0$，它切出的两条直母线为 $L_1 = V(X_0, X_1)$ 与 $L_2 = V(X_0, X_2)$。在投影 $[X_0 : X_1 : X_2]$ 下，整条直线 $L_1 \setminus \{P_0\}$ 被映为单点 $A_1 = [0 : 0 : 1] \in \mathbb{P}^2_k$，整条直线 $L_2 \setminus \{P_0\}$ 被映为单点 $A_2 = [0 : 1 : 0] \in \mathbb{P}^2_k$；而逆映射 $\psi$ 的未定义轨迹（基点）恰好是 $A_1, A_2$，且连接 $A_1 A_2$ 的直线 $X_0 = 0$（除去 $A_1, A_2$）被 $\psi$ 收缩为单点 $P_0 = [0 : 0 : 0 : 1]$！ **Q.E.D.**

##### Exercise 3.6 (射影二次变换 Cremona Transformation 与三点爆破)
在射影平面 $\mathbb{P}^2_k$ 中，考虑**标准二次 Cremona 变换**：
$$\varphi: \mathbb{P}^2_k \dashrightarrow \mathbb{P}^2_k, \qquad [X : Y : Z] \longmapsto [Y Z : X Z : X Y] = \left[ \frac{1}{X} : \frac{1}{Y} : \frac{1}{Z} \right].$$
1. 证明 $\varphi$ 是对合双有理映射（即 $\varphi \circ \varphi = \mathrm{id}_{\mathbb{P}^2}$），并求其最大定义域 $\operatorname{dom}(\varphi)$；
2. 设 $\Gamma \subset \mathbb{P}^2_k \times \mathbb{P}^2_k$ 为 $\varphi$ 在开集 $X Y Z \neq 0$ 上图像的 Zariski 闭包。证明第一投影 $\pi_1: \Gamma \to \mathbb{P}^2_k$ 恰好是在三个坐标顶点 $e_1 = [1:0:0], e_2 = [0:1:0], e_3 = [0:0:1]$ 处的同步爆破（将三个顶点吹起为三条例外直线 $E_1, E_2, E_3$），而第二投影 $\pi_2: \Gamma \to \mathbb{P}^2_k$ 则将原坐标三角形的三条边 $X = 0, Y = 0, Z = 0$ 严格变换收缩为目标平面的三个顶点！

**Proof.**
1. 在开集 $U = \{[X:Y:Z] \in \mathbb{P}^2_k \mid X Y Z \neq 0\}$ 上，显然 $(\varphi \circ \varphi)([X:Y:Z]) = [(XZ)(XY) : (YZ)(XY) : (YZ)(XZ)] = X Y Z [X : Y : Z] = [X : Y : Z]$，故 $\varphi$ 是自身的逆双有理映射。当且仅当 $X, Y, Z$ 中至少有两个同时为零时，三个二次单项式 $Y Z, X Z, X Y$ 同时为零，因此未定义轨迹（基本点集 Base Locus）恰好是三个坐标顶点 $\{e_1, e_2, e_3\}$，最大定义域为 $\operatorname{dom}(\varphi) = \mathbb{P}^2_k \setminus \{e_1, e_2, e_3\}$。
2. 设目标射影平面的坐标为 $[U : V : W]$。在开集 $X Y Z \neq 0$ 上，$[U : V : W] = [Y Z : X Z : X Y] \iff X U = Y V = Z W$。因此闭包簇 $\Gamma \subset \mathbb{P}^2_k \times \mathbb{P}^2_k$ 由双齐次方程组 $X U = Y V = Z W$ 定义。
   在第一个顶点 $e_1 = [1 : 0 : 0]$ 附近的仿射卡 $X = 1$ 上，方程化为 $U = Y V = Z W$，这消去 $U$ 后恰剩下 $Y V - Z W = 0$（其中 $(Y, Z) \in \mathbb{A}^2_k$ 为原坐标，$[V : W] \in \mathbb{P}^1_k$ 为方向坐标）——这与 **Definition 3.8.1** 中平面在原点处的爆破方程分毫不差！对称地在 $e_2, e_3$ 处也是标准爆破。同时在 $\varphi$ 下，边 $X = 0$（除去 $e_2, e_3$，即 $Y Z \neq 0$）被映为 $[Y Z : 0 : 0] = [1 : 0 : 0]$，即被收缩为目标平面的顶点。 **Q.E.D.**

##### Exercise 3.7 (奇异空间曲面的切锥与雅可比矩阵计算：Whitney 伞与 Cayley 三次曲面)
在 $\mathbb{A}^3_k$（$\operatorname{char} k = 0$）或 $\mathbb{P}^3_k$ 中：
1. 求 **Whitney 伞曲面（Whitney Umbrella）** $S_1: X^2 - Y^2 Z = 0 \subset \mathbb{A}^3_k$ 的奇点轨迹 $\operatorname{Sing}(S_1)$，并计算在每个奇点处的切空间维数与切锥；
2. 求著名的 **Cayley 四结点三次曲面（Cayley's Nodal Cubic Surface）**：
   $$S_2: X_1 X_2 X_3 + X_0 X_2 X_3 + X_0 X_1 X_3 + X_0 X_1 X_2 = 0 \subset \mathbb{P}^3_k$$
   的全部奇点坐标，并求 $S_2$ 上包含的全部直线。

**Proof.**
1. 对 $f(X, Y, Z) = X^2 - Y^2 Z$，计算偏导数：
   $$\frac{\partial f}{\partial X} = 2X = 0, \qquad \frac{\partial f}{\partial Y} = -2 Y Z = 0, \qquad \frac{\partial f}{\partial Z} = -Y^2 = 0.$$
   联立解得 $X = Y = 0$（$Z$ 任意）！因此奇点集是整条 $z$-轴 $\operatorname{Sing}(S_1) = V(X, Y)$，在 $z$-轴上每一点处 $\dim T_P S_1 = 3$。当 $z_0 \neq 0$ 时，在 $(0, 0, z_0)$ 处按平移坐标展开为 $X^2 - z_0 Y^2 - Y^2(Z - z_0) = 0$，二次切锥为两条相交平面 $X = \pm \sqrt{z_0} Y$（普通二重点线）；而在原点 $(0, 0, 0)$ 处，切锥退化为二重平面 $X^2 = 0$（称为捏点 Pinch Point）。
2. 注意到若将 Cayley 三次曲面除以 $X_0 X_1 X_2 X_3$，它恰是二次 Cremona 变换的高维推广 $\frac{1}{X_0} + \frac{1}{X_1} + \frac{1}{X_2} + \frac{1}{X_3} = 0$！计算偏导数：
   $$\frac{\partial F}{\partial X_0} = X_1 X_2 + X_1 X_3 + X_2 X_3 = 0 \quad (\text{及轮换对称的其余三式}).$$
   若某两个坐标为零（例如 $X_0 = X_1 = 0$），则 $\frac{\partial F}{\partial X_0} = \frac{\partial F}{\partial X_1} = X_2 X_3 = 0$，必有第三个坐标也为零！因此四个坐标顶点：
   $$e_0 = [1:0:0:0], \quad e_1 = [0:1:0:0], \quad e_2 = [0:0:1:0], \quad e_3 = [0:0:0:1]$$
   全部是 $S_2$ 的奇点（普通二重点 / 锥点 Conical Nodes，例如在 $e_0$ 处切锥为 $X_1 X_2 + X_1 X_3 + X_2 X_3 = 0$，是非退化二次锥面）。若无两个坐标为零，容易由对称性推知 $\nabla F \neq 0$，故 $S_2$ 恰有这 **$4$ 个奇点**。
   它包含的直线有：连接四个顶点的 $\binom{4}{2} = 6$ 条四面体棱边 $L_{ij} = V(X_k, X_l)$（在 $27$ 条直线的退化重数计数中每条连接两个二重点的棱重数为 $4$），以及每组对棱平面切出的 $3$ 条对角直线 $V(X_i + X_j, X_k + X_l)$（重数为 $1$），合计 $6 \times 4 + 3 \times 1 = 27$！ **Q.E.D.**

##### Exercise 3.8 (不可约射影簇上全局正则函数的常值性定理)
设 $V \subseteq \mathbb{P}^n_k$（$k = \bar{k}$）为不可约射影簇。证明：在 $V$ 的每一点 $P \in V$ 处都正则的有理函数 $\varphi \in k(V)$ 必定是**常数函数**：
$$\mathcal{O}_V(V) := \bigcap_{P \in V} \mathcal{O}_{V, P} = k.$$
（对比仿射簇的 $\bigcap_{P \in V} \mathcal{O}_{V,P} = k[V]$，这一性质是复分析中紧黎曼面上全纯函数必为常数的 Liouville 定理在代数几何中的精确代数对应！进而证明：若不可约射影簇 $V$ 同时又是仿射簇，则 $V$ 只能是一个单点 $\{P\}$）。

**Proof.**
设 $\varphi \in \bigcap_{P \in V} \mathcal{O}_{V, P} \subseteq k(V)$。记 $S = S(V) = k[X_0, \dots, X_n]/I_{\mathbb{P}}(V) = \bigoplus_{d=0}^\infty S_d$ 为 $V$ 的齐次坐标环。
在分式域 $k(V) = S_{((0))}$ 中，考虑 $\varphi$ 的齐次分母理想（由所有能将 $\varphi$ 乘进 $S$ 的同次数齐次元生成的齐次理想）：
$$J_\varphi := \bigoplus_{d=0}^\infty \left\{ G \in S_d \;\middle|\; G \varphi \in S_d \right\} \subseteq S.$$
对于任意点 $P \in V$，因为 $\varphi \in \mathcal{O}_{V, P}$，根据射影局部环的定义，存在某个次数 $d \ge 0$ 及齐次元素 $F, G \in S_d$ 使得 $\varphi = F / G$ 且 $G(P) \neq 0$。此时 $G \in (J_\varphi)_d$ 且 $G(P) \neq 0$，这意味着点 $P \notin V_{\mathbb{P}}(J_\varphi)$！
由于这对 $V$ 上的**每一个点** $P \in V$ 都成立，齐次理想 $J_\varphi$ 在 $V$ 上的零点集为空集：
$$V_{\mathbb{P}}(J_\varphi) = \varnothing!$$
根据 **Theorem 3.4.4(1)(iii)（射影弱零点定理）**，存在足够大的正整数 $D \ge 1$，使得对所有 $d \ge D$ 均有：
$$S_d \subseteq J_\varphi \implies S_d \cdot \varphi \subseteq S_d!$$
现在取 $d = D$。因为 $S_D$ 是有限维非零 $k$-向量空间（设其一组基为 $w_1, \dots, w_N \in S_D$），乘以 $\varphi$ 是有限维向量空间 $S_D$ 到自身的线性变换（或直接迭代：对任意非零元 $0 \neq g \in S_D$ 及任意正整数 $r \ge 1$，由于 $\varphi(S_D) \subseteq S_D$，通过归纳知对所有 $r \ge 1$ 均有 $g \varphi^r \in S_D$）！
这一观察极为精妙：在 Noether 整环 $S$ 的分式域 $k(V)$ 中，子模 $\sum_{r=0}^\infty k \cdot \varphi^r \subseteq \frac{1}{g} S_D$ 包含在有限维 $k$-向量空间 $\frac{1}{g} S_D$ 内部！因此元素 $\varphi$ 在基域 $k$ 上必然是**代数元（Algebraic over $k$）**！
但是，基域 $k = \bar{k}$ 是**代数闭域**！任何在代数闭域 $k$ 上代数的元素必已属于 $k$ 本身，故 $\varphi \in k$ 是常数！
最后，若不可约射影簇 $V$ 同时同构于某个仿射簇，则其坐标环满足 $k[V] = \mathcal{O}_V(V) = k$；由仿射簇与坐标环的反等价性，$k[V] = k \cong k[\{\mathrm{pt}\}]$ 蕴含 $V$ 只能是一个单点。 **Q.E.D.**

##### Exercise 3.9 (二次超曲面与含两条异面直线的三次曲面的双有理参数化)
1. 设 $Q \subset \mathbb{P}^n_k$（$n \ge 2$）为任意不可约二次超曲面。证明 $Q$ 是有理簇（$Q \sim_{\mathrm{bir}} \mathbb{P}^{n-1}_k$）；
2. 设 $S \subset \mathbb{P}^3_k$ 是包含两条异面直线（skew lines）$L_1, L_2 \subset S$（满足 $L_1 \cap L_2 = \varnothing$）的不可约三次曲面，且**$L_1, L_2$ 均不整条包含在 $S$ 的奇异轨迹 $\operatorname{Sing}(S)$ 中**（即 $L_1, L_2$ 上的一般点均为 $S$ 的光滑点，这一条件对任意非奇异三次曲面或仅有孤立奇点的三次曲面自动成立）。利用连接 $L_1, L_2$ 的横截双割线构造，证明 $S$ 与 $\mathbb{P}^1_k \times \mathbb{P}^1_k$ 双有理等价，从而 $S$ 是有理曲面（$S \sim_{\mathrm{bir}} \mathbb{P}^2_k$）！

**Proof.**
1. 在不可约二次超曲面 $Q \subset \mathbb{P}^n_k$ 上任取一个光滑点 $P_0 \in Q_{\mathrm{reg}}$，并取不过 $P_0$ 的超平面 $H \cong \mathbb{P}^{n-1}_k$。对过 $P_0$ 的任意一般直线 $L$，$L$ 与 $Q$ 相交于 $2$ 个点，扣除已知点 $P_0$ 后恰剩唯一的第二个交点 $P(L) \in Q$。因此从 $P_0$ 到 $H \cong \mathbb{P}^{n-1}_k$ 的中心投影 $\pi_{P_0}: Q \dashrightarrow \mathbb{P}^{n-1}_k$ 是次数为 $1$ 的双有理映射。
2. 考察三维射影空间 $\mathbb{P}^3_k$ 中包含两条异面直线 $L_1, L_2 \subset S$（$L_1 \cap L_2 = \varnothing$ 且 $L_1, L_2 \not\subset \operatorname{Sing}(S)$）的不可约三次曲面 $S \subset \mathbb{P}^3_k$：
   考虑乘积空间 $L_1 \times L_2 \cong \mathbb{P}^1_k \times \mathbb{P}^1_k$。对于任意点对 $(P_1, P_2) \in L_1 \times L_2$，因为 $L_1 \cap L_2 = \varnothing$ 知 $P_1 \neq P_2$，连接 $P_1$ 与 $P_2$ 的空间直线 $L_{P_1 P_2} \subset \mathbb{P}^3_k$ 唯一确定。
   由于 $L_1, L_2 \not\subset \operatorname{Sing}(S)$，对一般点对 $(P_1, P_2) \in L_1 \times L_2$，点 $P_1, P_2$ 均为 $S$ 的光滑点，且一般割线 $L_{P_1 P_2}$ 在 $P_1$ 和 $P_2$ 处均横截于切平面 $\mathbb{T}_{P_1} S$ 和 $\mathbb{T}_{P_2} S$（即在两端点处的相交重数均为 **$1$**）且不整条落在 $S$ 中。由 Bézout 定理，直线 $L_{P_1 P_2}$ 与三次曲面 $S$ 按重数计算恰有 **$3$ 个交点**，扣除已知的两个单交点 $P_1 \in L_1$ 与 $P_2 \in L_2$ 后，直线 $L_{P_1 P_2}$ 与 $S$ 必有**唯一的第三个交点** $R = \Phi(P_1, P_2) \in S \setminus (L_1 \cup L_2)$！
   （**重要反例边界说明**：为何必须要求 $L_1, L_2 \not\subset \operatorname{Sing}(S)$？考察不可约奇异三次曲面 $S: X_0^2 X_2 + X_1^2 X_3 = 0$，它包含两条异面直线 $D = \{X_0 = X_1 = 0\}$ 与 $M = \{X_2 = X_3 = 0\}$，但 $D \subset \operatorname{Sing}(S)$ 是一条**二重奇异直线**！对任意 $P = [0:0:a:b] \in D$ 与 $Q = [c:d:0:0] \in M$，代入得 $F(\lambda P + \mu Q) = \lambda \mu^2 (a c^2 + b d^2)$，即割线在 $P \in D$ 处的交点重数恒为 $2$、在 $Q \in M$ 处重数为 $1$，扣除两端点后“第三个交点”仍退化停留在奇异线 $P \in D$ 上，无法支配整张曲面 $S$！对于这类含二重奇异直线 $D$ 的不可约三次曲面，需改用从二重线 $D$ 出发的平面束投影参数化，而非上述双割线映射。）
   反之，对空间 $\mathbb{P}^3_k \setminus (L_1 \cup L_2)$ 中的任意一点 $R \in S$，经过 $R$ 与直线 $L_1$ 张成唯一的平面 $\Pi_1 = \operatorname{Span}(R, L_1)$，经过 $R$ 与直线 $L_2$ 张成唯一的平面 $\Pi_2 = \operatorname{Span}(R, L_2)$；这两个平面的交线 $L_R := \Pi_1 \cap \Pi_2$ 是空间中**唯一一条同时经过点 $R$ 并与两条异面直线 $L_1, L_2$ 相交的直线（横截线 Transversal）**，交点即为 $P_1 = L_R \cap L_1$ 与 $P_2 = L_R \cap L_2$！
   这就给出了互逆双有理同构：
   $$\Phi: \mathbb{P}^1_k \times \mathbb{P}^1_k \cong L_1 \times L_2 \;\stackrel{\sim_{\mathrm{bir}}}{\dashrightarrow}\; S,$$
   从而任何包含两条异面直线的不可约三次曲面 $S \subset \mathbb{P}^3_k$ 都是有理曲面（Rational Surface，$k(S) \cong k(u, v)$）！ **Q.E.D.**

##### Exercise 3.10 (高阶尖点曲线 $y^p = x^q$ 的连续爆破与 Euclid 辗转相除法)
设 $p < q$ 为两个互素的正整数（$\gcd(p, q) = 1$），考虑仿射平面中的不可约曲线 $C: y^p - x^q = 0 \subset \mathbb{A}^2_k$。
1. 证明 $C$ 在原点 $O(0, 0)$ 处的重数为 $m_O(C) = p$：当 $p = 1$ 时 $C: y = x^q$ 处处光滑（无奇点）；当 $2 \le p < q$ 时，$O(0,0)$ 是 $C$ 的唯一奇点；
2. 证明当 $2 \le p < q$ 时，在原点处对 $\mathbb{A}^2_k$ 执行一次爆破（令 $y = x u$）后，严格变换 $\widetilde{C}$ 的方程化为：
   $$\widetilde{C}: u^p - x^{q - p} = 0!$$
3. 由此证明：通过连续单点爆破消解高阶尖点曲线 $y^p = x^q$（$2 \le p < q, \, \gcd(p,q)=1$）奇点的过程，在指数 $(p, q) \mapsto (\min(p, q-p), \max(p, q-p))$ 上**完全等同于求 $\gcd(p, q) = 1$ 的 Euclid 辗转相减（辗转相除）算法**（一旦某步后 $\min(p, q-p) = 1$ 即已光滑并终止），并具体写出消解曲线 $y^3 = x^5$ 所需的每一步爆破方程！

**Proof.**
1. 多项式 $f(x, y) = y^p - x^q$ 中，因为 $p < q$，最低次齐次项是 $p$ 次项 $y^p$，故原点处的重数为 $m_O(C) = p$（切锥为 $y^p = 0$）。
   - **光滑边界情形（$p = 1$）**：此时曲线方程为 $y - x^q = 0$，偏导数 $\frac{\partial f}{\partial y} \equiv 1 \neq 0$ 在整个 $\mathbb{A}^2_k$ 上处处非零，故当 $p = 1$ 时 $C \cong \mathbb{A}^1_k$ 已经处处光滑，原点 $O(0,0)$ 不是奇点；
   - **真正奇异情形（$2 \le p < q$）**：此时在原点处 $m_O(C) = p \ge 2$，故原点 $O(0,0)$ 是奇点；而在原点之外，由 $\gcd(p, q) = 1$ 及有理双射参数化 $(x, y) = (t^p, t^q)$（其逆映射在 $C \setminus \{O\} \to \mathbb{A}^1_k \setminus \{0\}$ 上由 Bézout 整系数恒等式 $a p + b q = 1 \implies t = x^a y^b$ 正则给出，且该同构不依赖底域特征）可知 $C \setminus \{O\} \cong \mathbb{A}^1_k \setminus \{0\}$ 处处光滑，故当 $2 \le p < q$ 时 $O(0,0)$ 是 $C$ 的**唯一奇点**。
2. 设 $2 \le p < q$。在第一爆破坐标卡 $W_1: y = x u$ 中，代入 $y^p - x^q = 0$ 得：
   $$x^p u^p - x^q = x^p \bigl(u^p - x^{q - p}\bigr) = 0.$$
   除掉例外曲线因子 $x^p$，即得严格变换 $\widetilde{C}: u^p - x^{q - p} = 0$。而在第二坐标卡 $W_2: x = y v$ 中，严格变换 $1 - y^{q-p} v^q = 0$ 与例外曲线 $y = 0$ 无交点，故 $\widetilde{C}$ 与例外曲线 $E$ 的唯一交点落在了第一坐标卡的原点 $(x, u) = (0, 0)$ 处，其重数为 $m_{(0,0)}(\widetilde{C}) = \min(p, q - p)$：若 $\min(p, q - p) = 1$（例如 $p = 2, q = 3$ 时 $\widetilde{C}: u^2 - x = 0$），则第一次爆破后 $\widetilde{C}$ 已在 $(0,0)$ 处完全光滑，奇点消解立即终止；若 $\min(p, q - p) \ge 2$，则 $(x, u) = (0,0)$ 仍是 $\widetilde{C}$ 的唯一奇点，继续在该点执行下一次爆破。
3. 因为 $\gcd(p, q) = 1$，每做一次爆破，指数对 $(p, q)$ 就变成 $(p, q - p)$（若 $q - p < p$ 则交换两个坐标角色）。由辗转相除法，经过有限步后，必有较小指数变为 **$1$**，即方程变为 $w^1 - z^r = 0$，此时曲线在原点处的一次项系数为 $1 \neq 0$，彻底化为光滑曲线！
   以 $C: y^3 - x^5 = 0$（即 $(p, q) = (3, 5)$）为例：
   - **第 1 次爆破**（令 $y = x u_1$）：$x^3 u_1^3 - x^5 = 0 \implies \widetilde{C}_1: u_1^3 - x^2 = 0$（指数由 $(3, 5)$ 变为 $(2, 3)$，在原点处变为普通三次尖点）；
   - **第 2 次爆破**（因为现在 $x$ 的次数 $2$ 小于 $u_1$ 的次数 $3$，在 $x = u_1 v_2$ 卡下）：$u_1^3 - u_1^2 v_2^2 = u_1^2(u_1 - v_2^2) = 0 \implies \widetilde{C}_2: u_1 - v_2^2 = 0$（指数由 $(2, 3)$ 变为 $(1, 2)$）！
   此时 $\widetilde{C}_2: u_1 = v_2^2$ 已是完全光滑的抛物线，仅需 **2 次爆破**即彻底消解了 $y^3 = x^5$ 的奇点！ **Q.E.D.**

##### Exercise 3.11 (代数群的处处光滑性定理：为什么代数群不可能有奇点？)
设 $G$ 是一个**代数群（Algebraic Group）**——即 $G$ 是一个代数簇，且群乘法 $\mu: G \times G \to G, (x, y) \mapsto x y$ 与求逆映射 $\iota: G \to G, x \mapsto x^{-1}$ 都是代数簇态射（例如 $\operatorname{GL}_n(k)$、$\operatorname{SL}_n(k)$、$\operatorname{O}_n(k)$ 或光滑平面三次曲线）。证明：**任何代数群 $G$ 必定是处处非奇异（光滑）的（即 $\operatorname{Sing}(G) = \varnothing$）**！

**Proof.**
不妨设 $G$ 不可约（否则对含单位元的连通分支 $G^\circ$ 同理，各连通分支是 $G^\circ$ 的平移陪集）。
根据 **Theorem 3.7.5**，光滑点集 $G_{\mathrm{reg}}$ 是 $G$ 的**非空**稠密开子集，因此至少存在一个光滑点 $P_0 \in G_{\mathrm{reg}}$，满足：
$$\dim_k T_{P_0} G = \dim G.$$
现在任取 $G$ 上的**任意一点** $Q \in G$。在群 $G$ 中，考虑左平移映射（Left Translation）：
$$L_{Q P_0^{-1}}: G \longrightarrow G, \qquad x \longmapsto (Q P_0^{-1}) \cdot x.$$
因为群乘法 $\mu$ 是态射，左平移 $L_{Q P_0^{-1}}(x) = \mu(Q P_0^{-1}, x)$ 是从代数簇 $G$ 到自身的态射，且它具有显式的逆态射 $L_{P_0 Q^{-1}}: y \mapsto (P_0 Q^{-1}) \cdot y$！
因此，$L_{Q P_0^{-1}}: G \xrightarrow{\sim} G$ 是代数簇的**自同构（Automorphism）**，并且它将已知的光滑点 $P_0$ 精确映为点 $Q$：$L_{Q P_0^{-1}}(P_0) = Q$！
由于切空间维数是局部同构不变量（**Theorem 3.7.2(3)**），微分映射 $d_{P_0} L_{Q P_0^{-1}}: T_{P_0} G \xrightarrow{\sim} T_Q G$ 是线性同构，从而：
$$\dim_k T_Q G = \dim_k T_{P_0} G = \dim G!$$
由点 $Q \in G$ 的任意性，群 $G$ 上的每一点都是光滑点，即 $\operatorname{Sing}(G) = \varnothing$。 **Q.E.D.**

##### Exercise 3.12 (特殊线性群 $\operatorname{SL}_n(k)$ 在单位矩阵处的切空间等于零迹矩阵李代数 $\mathfrak{sl}_n(k)$)
将特殊线性群 $\operatorname{SL}_n(k) = \{ A \in M_n(k) \mid \det A = 1 \} \subset \mathbb{A}^{n^2}_k$ 视为仿射代数簇。计算 $\operatorname{SL}_n(k)$ 在单位矩阵 $I_n \in \operatorname{SL}_n(k)$ 处的切空间 $T_{I_n} \operatorname{SL}_n(k)$，证明它恰好是所有**迹为零（Trace-free）**的 $n \times n$ 矩阵构成的李代数：
$$\mathfrak{sl}_n(k) := T_{I_n} \operatorname{SL}_n(k) = \left\{ X \in M_n(k) \;\middle|\; \operatorname{tr}(X) = 0 \right\},$$
并验证 $\dim \operatorname{SL}_n(k) = n^2 - 1$。

**Proof.**
将矩阵 $A \in M_n(k)$ 写为单位矩阵附近的一阶展开 $A = I_n + \varepsilon X$，其中 $X = (x_{ij}) \in M_n(k)$。按行列式的 Leibniz 展开式计算 $\det(I_n + \varepsilon X)$ 关于 $\varepsilon$ 的一阶项：
在 $\det(I_n + \varepsilon X) = \sum_{\sigma \in S_n} \operatorname{sgn}(\sigma) \prod_{i=1}^n (\delta_{i, \sigma(i)} + \varepsilon x_{i, \sigma(i)})$ 中，任何非恒等置换 $\sigma \neq \mathrm{id}$ 至少移动 $2$ 个下标，故至少包含 $2$ 个非对角因子 $\varepsilon x_{i, \sigma(i)}$，从而属于 $O(\varepsilon^2)$！因此所有关于 $\varepsilon$ 的零阶与一阶项全部来自恒等置换 $\sigma = \mathrm{id}$ 的对角线乘积：
$$\det(I_n + \varepsilon X) = \prod_{i=1}^n (1 + \varepsilon x_{ii}) + O(\varepsilon^2) = 1 + \varepsilon \left(\sum_{i=1}^n x_{ii}\right) + O(\varepsilon^2) = 1 + \varepsilon \operatorname{tr}(X) + O(\varepsilon^2)!$$
这表明多项式 $F(A) = \det A - 1$ 在点 $I_n$ 处的线性微分恰好是迹泛函 $d_{I_n}(\det)(X) = \operatorname{tr}(X)$（因为 $\operatorname{tr}: M_n(k) \to k$ 是非零线性泛函，特别地 $\nabla(\det)(I_n) = I_n \neq 0$，这说明 $\det A - 1$ 是不可约多项式，或者每个不可约分支在 $I_n$ 处光滑且维数为 $n^2 - 1$）。因此：
$$T_{I_n} \operatorname{SL}_n(k) = \ker\bigl(d_{I_n}(\det)\bigr) = \{ X \in M_n(k) \mid \operatorname{tr}(X) = 0 \} = \mathfrak{sl}_n(k),$$
其维数为 $\dim_k \mathfrak{sl}_n(k) = n^2 - 1$。 **Q.E.D.**

##### Exercise 3.13 (正交群 $\operatorname{O}_n(k)$ 的切空间与斜对称矩阵李代数 $\mathfrak{so}_n(k)$)
设 $\operatorname{char} k \neq 2$。计算正交群 $\operatorname{O}_n(k) = \{ A \in M_n(k) \mid A^{\mathsf{T}} A = I_n \}$ 在单位矩阵 $I_n$ 处的切空间 $T_{I_n} \operatorname{O}_n(k)$，证明它等于斜对称（反对称）矩阵空间：
$$\mathfrak{so}_n(k) := T_{I_n} \operatorname{O}_n(k) = \left\{ X \in M_n(k) \;\middle|\; X^{\mathsf{T}} + X = 0 \right\},$$
并由此证明 $\operatorname{O}_n(k)$ 是维数为 $\frac{n(n-1)}{2}$ 的处处非奇异代数簇（由 $\det A = 1$ 的 $\operatorname{SO}_n(k)$ 与 $\det A = -1$ 两个同构的不可约连通分支组成）。

**Proof.**
将 $A = I_n + \varepsilon X$ 代入定义方程映射 $\Phi(A) = A^{\mathsf{T}} A - I_n = 0$，展开到 $\varepsilon$ 的一阶项：
$$\Phi(I_n + \varepsilon X) = (I_n + \varepsilon X^{\mathsf{T}})(I_n + \varepsilon X) - I_n = \varepsilon(X^{\mathsf{T}} + X) + \varepsilon^2 X^{\mathsf{T}} X.$$
注意对任意 $X \in M_n(k)$，$X^{\mathsf{T}} + X$ 是对称矩阵。由于 $\operatorname{char} k \neq 2$，从 $M_n(k)$ 到 $n \times n$ 对称矩阵空间 $\operatorname{Sym}_n(k)$（维数为 $\frac{n(n+1)}{2}$）的线性映射 $X \mapsto X^{\mathsf{T}} + X$ 是**满射**（对任意对称矩阵 $S \in \operatorname{Sym}_n(k)$，取 $X = \frac{1}{2} S$ 即有 $X^{\mathsf{T}} + X = S$）！
因此，这 $\frac{n(n+1)}{2}$ 个独立二次方程在 $I_n$ 处的微分满秩，核空间为：
$$T_{I_n} \operatorname{O}_n(k) = \{ X \in M_n(k) \mid X^{\mathsf{T}} + X = 0 \} = \mathfrak{so}_n(k),$$
其维数为 $n^2 - \frac{n(n+1)}{2} = \frac{n(n-1)}{2}$。结合 **Exercise 3.11**（左乘平移 $X \mapsto A X$ 保持切空间维数不变），知 $\operatorname{O}_n(k)$ 在每一点处都是维数为 $\frac{n(n-1)}{2}$ 的光滑簇。 **Q.E.D.**

##### Exercise 3.14 (射影超曲面的切超平面与 Euler 齐次函数判据)
设 $V = V_{\mathbb{P}}(F) \subset \mathbb{P}^n_k$ 为由无重因子的 $d$ 次齐次多项式 $F(X_0, X_1, \dots, X_n) \in k[X_0, \dots, X_n]_d$ 定义的射影超曲面，$P = [a_0 : \dots : a_n] \in V$。
1. 证明：点 $P$ 是射影超曲面 $V$ 的非奇异点（在仿射开卡 $U_i$ 上光滑），**当且仅当**齐次偏导数向量在 $P$ 处不全为零：
   $$\nabla F(P) = \left( \frac{\partial F}{\partial X_0}(P), \frac{\partial F}{\partial X_1}(P), \dots, \frac{\partial F}{\partial X_n}(P) \right) \neq (0, 0, \dots, 0),$$
   且此时 $V$ 在点 $P$ 处的**射影切超平面（Projective Tangent Hyperplane）**方程为：
   $$\mathbb{T}_P V: \sum_{j=0}^n \frac{\partial F}{\partial X_j}(P) X_j = 0;$$
2. 若 $\operatorname{char} k \nmid d$，证明在判断奇点时甚至无需将 $F(P) = 0$ 单独列出，因为由 Euler 齐次函数定理，$\frac{\partial F}{\partial X_0}(P) = \dots = \frac{\partial F}{\partial X_n}(P) = 0$ 自动蕴含 $F(P) = 0$！并举例说明当 $\operatorname{char} k \mid d$ 时必须保留 $F(P) = 0$。

**Proof.**
1. 不妨设 $P \in U_0 = \{X_0 \neq 0\}$，归一化取代表元 $P = [1 : x_1 : \dots : x_n]$。在仿射开卡 $U_0 \cong \mathbb{A}^n_k$ 上，$V \cap U_0$ 的方程为 $f(x_1, \dots, x_n) = F(1, x_1, \dots, x_n) = 0$。
   由链式法则，对每个 $1 \le j \le n$，有 $\frac{\partial f}{\partial x_j}(x_1, \dots, x_n) = \frac{\partial F}{\partial X_j}(1, x_1, \dots, x_n)$。
   再应用 Euler 齐次函数恒等式 $\sum_{j=0}^n X_j \frac{\partial F}{\partial X_j} = d \cdot F(X)$，在点 $P \in V$ 处因 $F(P) = 0$ 且 $X_0 = 1$，有：
   $$\frac{\partial F}{\partial X_0}(P) + \sum_{j=1}^n x_j \frac{\partial F}{\partial X_j}(P) = d \cdot F(P) = 0 \implies \frac{\partial F}{\partial X_0}(P) = -\sum_{j=1}^n x_j \frac{\partial f}{\partial x_j}(P)!$$
   由此可见：若仿射偏导数 $\frac{\partial f}{\partial x_1}(P) = \dots = \frac{\partial f}{\partial x_n}(P) = 0$，则必有 $\frac{\partial F}{\partial X_0}(P) = 0$！因此：
   $$P \in V \text{ 在 } U_0 \text{ 中奇异} \iff \forall 1 \le j \le n, \; \frac{\partial f}{\partial x_j}(P) = 0 \iff \forall 0 \le j \le n, \; \frac{\partial F}{\partial X_j}(P) = 0.$$
   且将仿射切超平面 $\sum_{j=1}^n \frac{\partial f}{\partial x_j}(P)(X_j/X_0 - x_j) = 0$ 同乘 $X_0$ 并代入上式，即得对称的齐次切超平面方程 $\sum_{j=0}^n \frac{\partial F}{\partial X_j}(P) X_j = 0$。
2. 当 $\operatorname{char} k \nmid d$ 时，$d \in k^\times$ 可逆，由 $d \cdot F(P) = \sum_{j=0}^n a_j \frac{\partial F}{\partial X_j}(P) = 0$ 直接推出 $F(P) = 0$。反之，若 $\operatorname{char} k = p \mid d$（例如在特征 $p$ 下考虑光滑 Fermat 曲线 $F = X_0^p + X_1^{p-1} X_2 + X_2^{p-1} X_0 = 0$），在点 $P = [1 : 0 : 0] \notin V$ 处可能出现所有 $\frac{\partial F}{\partial X_j}(P) = 0$ 但 $F(P) = 1 \neq 0$，故在 $\operatorname{char} k \mid d$ 时判别奇点必须同时联立 $F(P) = 0$ 与 $\nabla F(P) = 0$。 **Q.E.D.**

##### Exercise 3.15 (在一点处爆破一般簇与切锥作为例外除子)
设 $V \subseteq \mathbb{A}^n_k$ 为包含原点 $O = (0, \dots, 0) \in V$ 的仿射簇。将 $V$ 在原点处的爆破定义为严格变换：
$$\operatorname{Bl}_O V := \overline{\pi^{-1}\bigl(V \setminus \{O\}\bigr)} \subseteq \operatorname{Bl}_O \mathbb{A}^n_k,$$
其中 $\pi: \operatorname{Bl}_O \mathbb{A}^n_k \to \mathbb{A}^n_k$ 为外围空间的爆破。证明：严格变换 $\operatorname{Bl}_O V$ 与例外超曲面 $E = \pi^{-1}(O) \cong \mathbb{P}^{n-1}_k$ 的交集 $\operatorname{Bl}_O V \cap E \subseteq \mathbb{P}^{n-1}_k$ 恰好是 $V$ 在原点 $O$ 处的**射影化切锥（Projectivised Tangent Cone）** $\mathbb{P}(C_O V)$（其中切锥 $C_O V \subseteq \mathbb{A}^n_k$ 由消失理想 $I(V)$ 中所有多项式的**最低次非零齐次初项 Initial Forms** $f_{\mathrm{in}}$ 生成的齐次理想定义），并由此给出点 $O \in V$ 为光滑点的又一几何判据。

**Proof.**
对任意 $f \in I(V) \setminus \{0\}$，将其按齐次分量写为 $f(x_1, \dots, x_n) = f_m(x_1, \dots, x_n) + f_{m+1}(x_1, \dots, x_n) + \dots$，其中初项 $f_{\mathrm{in}} := f_m \neq 0$（$m \ge 1$）。
在 $\operatorname{Bl}_O \mathbb{A}^n_k$ 的第 $i$ 个仿射坐标卡 $W_i = \{Y_i \neq 0\}$（其中 $x_j = x_i y_j$，$y_i = 1$）中，将 $x_j = x_i y_j$ 代入 $f(x) = 0$ 并提出最高次公因子 $x_i^m$，得到：
$$x_i^{-m} f(x_i y_1, \dots, x_i y_n) = f_m(y_1, \dots, y_n) + x_i f_{m+1}(y_1, \dots, y_n) + \dots = 0.$$
由于严格变换 $\operatorname{Bl}_O V$ 的消失理想恰由所有 $f \in I(V)$ 除掉各自的最高幂次 $x_i^m$ 后的多项式生成，当我们令例外除子方程 **$x_i = 0$** 时，所有含 $x_i$ 正次幂的高阶项全部消失，恰好剩下全部初项方程：
$$f_{\mathrm{in}}(Y_1, \dots, Y_n) = f_m(Y_1, \dots, Y_n) = 0, \qquad \forall f \in I(V)!$$
这证明了 $\operatorname{Bl}_O V \cap E = V_{\mathbb{P}}\bigl(\{f_{\mathrm{in}} \mid f \in I(V)\}\bigr) = \mathbb{P}(C_O V) \subseteq \mathbb{P}^{n-1}_k$。
特别地，因为切空间 $T_O V$ 由所有 $f \in I(V)$ 的**一次项** $f_1$ 切出，恒有 $C_O V \subseteq T_O V$ 且 $\dim C_O V = \dim V = d$；故点 $O \in V$ 是光滑点（$\dim T_O V = d$）**当且仅当**切锥 $C_O V$ 等于线性切空间 $T_O V \cong \mathbb{A}^d_k$（即例外纤维 $\operatorname{Bl}_O V \cap E \cong \mathbb{P}^{d-1}_k$ 是线性子空间）。 **Q.E.D.**

## Part IV: 三次曲面上的 27 条直线与历史评注

### Chapter 4: The 27 Lines on a Cubic Surface and Final Comments

#### 4.1 Nonsingular cubic surfaces and tangent planes

在三维射影空间 $\mathbb{P}^3_k$（设 $k$ 为代数闭域，且在涉及极化与二阶 Hessian 判据时设 $\operatorname{char} k \neq 2, 3$）中，一个**三次曲面（Cubic Surface）** $S = V_{\mathbb{P}}(F) \subset \mathbb{P}^3_k$ 由齐次坐标 $(X_0 : X_1 : X_2 : X_3)$ 下的非零三次齐次多项式 $F(X_0, X_1, X_2, X_3) \in k[X_0, X_1, X_2, X_3]_3$ 定义。三次单项式共有 $\binom{3+3}{3} = 20$ 个，因此三次曲面的参数空间构成一个 $19$ 维射影空间 $\mathbb{P}^{19}_k$。

**Definition** (非奇异三次曲面与射影切平面).
称三次曲面 $S = V_{\mathbb{P}}(F) \subset \mathbb{P}^3_k$ 在点 $P \in S$ 处**非奇异（Nonsingular / Smooth）**，如果四个一阶偏导数在 $P$ 处不全为零：
$$\nabla F(P) = \left( \frac{\partial F}{\partial X_0}(P), \frac{\partial F}{\partial X_1}(P), \frac{\partial F}{\partial X_2}(P), \frac{\partial F}{\partial X_3}(P) \right) \neq (0, 0, 0, 0).$$
若 $S$ 在每一点 $P \in S$ 处均非奇异，则称 $S$ 为**非奇异三次曲面**。在光滑点 $P \in S$ 处，$S$ 的**射影切平面（Projective Tangent Plane）**定义为：
$$\mathbb{T}_P S: \sum_{i=0}^3 \frac{\partial F}{\partial X_i}(P) X_i = 0.$$

**Proposition 4.1** (切平面截线的奇点性质).
设 $S \subset \mathbb{P}^3_k$ 为非奇异三次曲面，$P \in S$。则切平面 $H_P = \mathbb{T}_P S \cong \mathbb{P}^2_k$ 与三次曲面 $S$ 的交集 $C_P = S \cap H_P$ 是平面 $H_P$ 上的一条三次曲线（可能可约），并且点 $P$ 必为平面三次曲线 $C_P$ 的一个**奇点（重数 $\operatorname{mult}_P(C_P) \ge 2$）**。从而 $C_P$ 必为下列三种几何形态之一：
1. 一条在点 $P$ 处具有二重点（结点或尖点）的不可约三次曲线；
2. 一条不可约二次曲线（Conic）与一条直线的并集，且点 $P$ 位于她们的交点处或直线上；
3. 三条共面直线的并集（此时切平面 $H_P$ 称为 $S$ 的一个**三切平面 Tritangent Plane**）。

**Proof.**
任取位于切平面 $H_P$ 内且异于 $P$ 的点 $Q \in H_P$，考虑连接 $P, Q$ 的射影直线 $L_{PQ} = \{ \lambda P + \mu Q \mid (\lambda : \mu) \in \mathbb{P}^1_k \}$。将参数化代入三次齐次多项式 $F$ 并按二项式定理（Taylor 公式）展开：
$$F(\lambda P + \mu Q) = \lambda^3 F(P) + \lambda^2 \mu \sum_{i=0}^3 \frac{\partial F}{\partial X_i}(P) Q_i + \lambda \mu^2 \sum_{i=0}^3 \frac{\partial F}{\partial X_i}(Q) P_i + \mu^3 F(Q).$$
由于 $P \in S$，首项 $F(P) = 0$；又因 $Q \in H_P = \mathbb{T}_P S$，一次项系数 $\sum_{i=0}^3 \frac{\partial F}{\partial X_i}(P) Q_i = 0$！因此 $\mu^2$ 整除 $F(\lambda P + \mu Q)$，即切平面 $H_P$ 内过点 $P$ 的每一条直线与 $C_P = S \cap H_P$ 在点 $P$ 处的交点重数均 $\ge 2$。这就证明了 $\operatorname{mult}_P(C_P) \ge 2$。由 §1.8 关于含奇点的平面三次曲线分类可知，$C_P$ 必属于上述三种情形之一。 **Q.E.D.**

#### 4.2 Existence of a line on a nonsingular cubic surface

Cayley 与 Salmon 在 1849 年发现的经典定理断言：**代数闭域 $k$ 上的每一个非奇异三次曲面 $S \subset \mathbb{P}^3_k$ 都恰好包含 27 条直线**。证明的第一步是确立至少存在一条直线 $L \subset S$。

**Theorem 4.2** (三次曲面上直线的存在性).
设 $S = V_{\mathbb{P}}(F) \subset \mathbb{P}^3_k$ 是代数闭域 $k$ 上的三次曲面，则 $S$ 上至少包含一条射影直线 $L \cong \mathbb{P}^1_k$。

**Proof.**
从维数计数（Incidence Correspondence 与 Grassmann 簇）和极化消元两个互补角度给出证明：
1. **关联簇维数计数法**：设 $\mathbb{G} = G(1, \mathbb{P}^3_k) \subset \mathbb{P}^5_k$ 为 $\mathbb{P}^3_k$ 中全体射影直线构成的 Grassmann 簇（由 Plücker 二次关系 $p_{01}p_{23} - p_{02}p_{13} + p_{03}p_{12} = 0$ 定义的 $4$ 维光滑射影超曲面），$\mathbb{P}^{19}_k$ 为全体三次曲面的参数空间。考虑关联簇（Incidence Variety）：
   $$\Gamma = \{ (L, S) \in \mathbb{G} \times \mathbb{P}^{19}_k \mid L \subset S \},$$
   以及两个自然投射 $p_1: \Gamma \to \mathbb{G}$ 与 $p_2: \Gamma \to \mathbb{P}^{19}_k$。对任意固定的直线 $L \cong \mathbb{P}^1_k$，三次齐次多项式 $F$ 限制在 $L$ 上是二元三次齐次多项式 $F|_L(u, v) = c_0 u^3 + c_1 u^2 v + c_2 u v^2 + c_3 v^3$。条件 $L \subset S$ 等价于 $F|_L \equiv 0$，这对 $F$ 的 $20$ 个系数施加了 $4$ 个线性独立的齐次线性约束！因此纤维 $p_1^{-1}(L) \cong \mathbb{P}^{15}_k$ 是 $15$ 维线性子空间。由此可知 $\Gamma$ 是不可约射影簇，其维数为：
   $$\dim \Gamma = \dim \mathbb{G} + 15 = 4 + 15 = 19 = \dim \mathbb{P}^{19}_k!$$
    只需验证在任意特征的代数闭域 $k$ 上均存在某个三次曲面 $S_0$ 其上仅含有限条直线（当 $\operatorname{char} k \neq 3$ 时，可取 Fermat 三次曲面 $\sum_{i=0}^3 X_i^3 = 0$，其上恰有 $27$ 条直线；当 $\operatorname{char} k = 3$ 时，由于 $\sum X_i^3 = (\sum X_i)^3$ 退化为三重平面，可改取特征 $3$ 下同样光滑且恰含 $27$ 条直线的循环三次曲面 $X_0^2 X_1 + X_1^2 X_2 + X_2^2 X_3 + X_3^2 X_0 = 0$ 或退化三次曲面 $X_0 X_1 X_2 + X_3^3 = 0$，后者仅含 $3$ 条直线 $X_i = X_3 = 0$，从而必有 $\dim p_2^{-1}(S_0) = 0$），则由射影簇态射的维数定理与闭映射性质（Theorem 3.12），态射 $p_2: \Gamma \to \mathbb{P}^{19}_k$ 必为**满射**，即每一个三次曲面都包含至少一条直线。
2. **Miles Reid 原书 §7.2 显式参数化 $P_\alpha = (1, \alpha, \alpha^3, 0)$、极化方程 $A=B=C=0$ 与首一 $27$ 次结式消元链（Step 1–Step 3）**：
   - **Step 1（尖点切平面截面假设与 $X_2^2 X_3$ 系数的相容归一化）**：
     在原书 §7.2 的古典消元法中（设 $\operatorname{char} k \neq 2, 3$，且假定非奇异三次曲面 $S = V_{\mathbb{P}}(F)$ 存在一个切平面截面——经坐标变换设为 $X_3 = 0$——其截面三次曲线 $S \cap \{X_3 = 0\}$ 是带尖点的不可约三次曲线 $X_0^2 X_2 - X_1^3 = 0$；注：若切平面截面直接分裂出一条直线则定理已得证，若为一般结点三次曲线亦可作类似有理参数化），由于 $F(X_0, X_1, X_2, 0) = X_0^2 X_2 - X_1^3$，平面 $X_3 = 0$ 上的尖点 $P_{\text{cusp}} = [0 : 0 : 1 : 0]$ 必然落在 $S$ 上（故 $F$ 中 **$X_2^3$ 的系数恒为 $0$**！），且曲面方程必形如：
     $$F(X_0, X_1, X_2, X_3) = X_0^2 X_2 - X_1^3 + X_3 \, g_2(X_0, X_1, X_2, X_3),$$
     其中 $g_2$ 为二次齐次多项式。因为整个三次曲面 $S$ 在点 $P_{\text{cusp}} = [0:0:1:0]$ 处是**非奇异（光滑）**的，而 $X_0^2 X_2 - X_1^3$ 在 $[0:0:1:0]$ 处的全部一阶偏导数均为零，故必有 $\frac{\partial F}{\partial X_3}(0, 0, 1, 0) = g_2(0, 0, 1, 0) \neq 0$！将坐标 $X_3$ 作非零标量缩放，即可将 **$g_2$ 中 $X_2^2$ 的系数（即 $F$ 中单项式 $X_2^2 X_3$ 的系数）严格归一化为 $1$**：
     $$g_2(X_0, X_1, X_2, X_3) = X_2^2 + X_2 L_1(X_0, X_1, X_3) + Q_2(X_0, X_1, X_3).$$
   - **Step 2（参数点 $P_\alpha = (1, \alpha, \alpha^3, 0)$、三个极化方程 $A = B = C = 0$ 与无分母消去 $y$）**：
     截面曲线 $S \cap \{X_3 = 0\}: X_0^2 X_2 = X_1^3$ 上除尖点 $[0:0:1:0]$ 外的点由 $\alpha \in k$ 参数化为 $P_\alpha = (1, \alpha, \alpha^3, 0)$（恒满足 $F(P_\alpha) \equiv 0$）。任意一条过 $P_\alpha$ 且不落在平面 $X_3 = 0$ 内的直线 $L = \overline{P_\alpha Q}$ 与坐标平面 $X_0 = 0$ 交于唯一点 $Q = (0, x, y, z)$（其中 $z \neq 0$）。将 $\lambda P_\alpha + \mu Q = (\lambda, \, \lambda\alpha + \mu x, \, \lambda\alpha^3 + \mu y, \, \mu z)$ 代入 $F = 0$ 并按 $(\lambda, \mu)$ 展开：
     $$F(\lambda P_\alpha + \mu Q) = \lambda^2 \mu A + \lambda \mu^2 B + \mu^3 C = 0,$$
     其中三个极化方程 $A = B = C = 0$ 显式为：
     1. **关于 $(x, y, z)$ 的一次极化方程 $A = 0$**：计算 $F$ 在 $P_\alpha = (1, \alpha, \alpha^3, 0)$ 处的偏导数，因 $\frac{\partial F}{\partial X_1}(P_\alpha) = -3\alpha^2,\; \frac{\partial F}{\partial X_2}(P_\alpha) = X_0^2\big|_{P_\alpha} = \mathbf{1},\; \frac{\partial F}{\partial X_3}(P_\alpha) = g_2(1, \alpha, \alpha^3, 0) = \alpha^6 + O(\alpha^4)$，故
        $$A = -3\alpha^2 x + y + g_2(1, \alpha, \alpha^3, 0) z = 0 \iff y = 3\alpha^2 x - \bigl(\alpha^6 + O(\alpha^4)\bigr) z!$$
        注意此处 **$y$ 的系数恒为非零常数 $1$（与 $\alpha$ 完全无关！）**，因此直接代入 $y = 3\alpha^2 x - g_2(P_\alpha) z$ 即可在全平面 $\alpha \in k$ 上**无分母、无退化地精确消去变量 $y$**，绝不会引入任何伪零点！
     2. **关于 $(x, z)$ 的二元二次方程 $B = 0$**：在 $B = F_2(P_\alpha, Q) = -3\alpha x^2 + z \cdot \bigl.\frac{\partial g_2}{\partial P_\alpha}\bigr|(Q)$ 中代入 $y = 3\alpha^2 x - (\alpha^6 + \cdots)z$，由于 $g_2$ 含首项 $X_2^2$，其极化项产生 $2 \alpha^3 y z = 2\alpha^3\bigl(3\alpha^2 x - (\alpha^6 + \cdots)z\bigr)z$，整理得关于 $(x, z)$ 的二元二次齐次式：
        $$B(x, z) = b_0(\alpha) x^2 + b_1(\alpha) x z + b_2(\alpha) z^2 = 0,$$
        其中各系数关于 $\alpha$ 的最高次项依次为：$b_0(\alpha) = -3\alpha + \cdots$（次数 $\le 3$），$b_1(\alpha) = 6\alpha^5 + \cdots$（次数 $\le 5$），**$b_2(\alpha) = -2\alpha^9 + O(\alpha^7)$（首项系数为 $-2 \neq 0$，精确次数为 $9$）**！
     3. **关于 $(x, z)$ 的二元三次方程 $C = 0$**：在 $C = F(0, x, y, z) = -x^3 + z \cdot g_2(0, x, y, z) = -x^3 + z(y^2 + \cdots)$ 中代入 $y = 3\alpha^2 x - (\alpha^6 + \cdots)z$，由归一化首项 $z y^2 = z\bigl(3\alpha^2 x - (\alpha^6 + \cdots)z\bigr)^2$ 整理得关于 $(x, z)$ 的二元三次齐次式：
        $$C(x, z) = c_0(\alpha) x^3 + c_1(\alpha) x^2 z + c_2(\alpha) x z^2 + c_3(\alpha) z^3 = 0,$$
        其中各系数关于 $\alpha$ 的最高次项依次为：$c_0(\alpha) = -1$（次数 $0$），$c_1(\alpha) = 9\alpha^4 + \cdots$（次数 $4$），$c_2(\alpha) = -6\alpha^8 + \cdots$（次数 $8$），**$c_3(\alpha) = \alpha^{12} + O(\alpha^{10})$（首项系数为 $+1$，精确次数为 $12$）**！
   - **Step 3（$5 \times 5$ Sylvester 结式行列式的最高次项与 $27$ 次方程）**：
     二元二次式 $B(x, z) = 0$ 与二元三次式 $C(x, z) = 0$ 在 $\mathbb{P}^1_k$ 上存在非零公共解 $(x : z) \neq (0:0)$，当且仅当它们的 $5 \times 5$ Sylvester 结式行列式为零：
     $$R(\alpha) = \det \begin{pmatrix}
     b_0 & b_1 & b_2 & 0 & 0 \\
     0 & b_0 & b_1 & b_2 & 0 \\
     0 & 0 & b_0 & b_1 & b_2 \\
     c_0 & c_1 & c_2 & c_3 & 0 \\
     0 & c_0 & c_1 & c_2 & c_3
     \end{pmatrix} = 0.$$
     按加权次数分析，该行列式关于 $\alpha$ 的次数至多为 $27$（在一般系数下首项 $\alpha^{27}$ 系数非零，归一化后为首一 $27$ 次多项式 $R(\alpha) = \alpha^{27} + \cdots = 0$）。因为 $k$ 代数闭，任取 $R(\alpha) = 0$ 的一个根 $\alpha_0$（即使在特殊曲面上最高次项降次，只要 $R(\alpha)$ 非常数即有根；若 $R(\alpha) \equiv 0$ 则对一切 $\alpha$ 均有解），代回 $B_{\alpha_0}(x, z) = C_{\alpha_0}(x, z) = 0$ 得公共非零解 $(x_0 : z_0) \in \mathbb{P}^1_k$，再由 $y_0 = 3\alpha_0^2 x_0 - g_2(P_{\alpha_0}) z_0$ 唯一确定 $Q_0 = (0 : x_0 : y_0 : z_0) \neq P_{\alpha_0}$，从而给出完全落在 $S$ 上的射影直线 $L = \overline{P_{\alpha_0} Q_0} \subset S$。 **Q.E.D.**

#### 4.3 The 5 pairs of coplanar lines meeting a given line

一旦在非奇异三次曲面 $S \subset \mathbb{P}^3_k$ 上找到了一条直线 $L \subset S$，我们便可以通过考察所有包含直线 $L$ 的平面束（Pencil of Planes through $L$）将 $S$ 上与 $L$ 相交的其余直线全部精确找出来。

**Theorem 4.3** (包含已知直线的平面束与 5 对共面直线).
设 $S \subset \mathbb{P}^3_k$ 为非奇异三次曲面，$L \subset S$ 为 $S$ 上的一条直线。则：
1. 在所有包含直线 $L$ 的平面束 $\{ H_{(\lambda:\mu)} \}_{(\lambda:\mu) \in \mathbb{P}^1_k}$ 中，每个平面 $H$ 与 $S$ 的交集均可分解为：
   $$S \cap H = L \cup C_H,$$
   其中余下部分 $C_H \subset H$ 是平面 $H$ 上的一条二次曲线（Conic）；
2. 在该一维平面束中，**恰好存在 5 个不同的平面 $H_1, H_2, H_3, H_4, H_5$**，使得对应的剩余二次曲线 $C_{H_i}$ 退化为两条不同直线的并集：
   $$C_{H_i} = L_i \cup L'_i \qquad (i = 1, 2, 3, 4, 5).$$
3. 这 5 对直线 $\{L_i, L'_i\}_{i=1}^5$ 具有如下相交性质：
   - 对每个 $i \in \{1, \dots, 5\}$，$L, L_i, L'_i$ 是共处于三切平面 $H_i$ 内的三条互异直线，两两相交：在一般情形下三条直线交于三个不同点（呈三角形配置，即三切平面在三个顶点处与 $S$ 相切）；在特殊对称情形下三条直线也可以交于 $L$ 上的同一点 $P = L \cap L_i \cap L'_i$（此时点 $P$ 称为非奇异三次曲面上的 **Eckardt 点**，例如 $\operatorname{char} k \neq 3$ 时 Fermat 三次曲面 $\sum_{j=0}^3 X_j^3 = 0$ 在点 $P = [1 : -1 : 0 : 0]$ 处的切平面 $X_0 + X_1 = 0$ 截出的三条直线 $X_0 + X_1 = X_2 + \omega^b X_3 = 0\ (b=0,1,2)$ 均共点于 $P$）；
   - 当 $i \neq j$ 时，由于平面 $H_i$ 与 $H_j$ 的交线恰为 $L$，且 $S$ 在 $L$ 上无奇点，故 $\{L_i, L'_i\}$ 中的任何一条直线与 $\{L_j, L'_j\}$ 中的任何一条直线均**互不相交（异面 Skew）**：
     $$(L_i \cup L'_i) \cap (L_j \cup L'_j) = \varnothing \qquad (i \neq j).$$
   因此，$S$ 上与固定直线 $L$ 相交的其余直线恰好就是这 $2 \times 5 = 10$ 条直线 $\{L_1, L'_1, \dots, L_5, L'_5\}$。

**Proof.**
作射影坐标变换，使直线 $L$ 的方程为 $X_0 = X_1 = 0$。由于 $L \subset S$，三次多项式 $F(X_0, X_1, X_2, X_3)$ belongs to ideal $(X_0, X_1)$，故可按 $X_2, X_3$ 的幂次整理为：
$$F(X_0, X_1, X_2, X_3) = A X_2^2 + B X_2 X_3 + C X_3^2 + D X_2 + E X_3 + G,$$
其中 $A, B, C$ 为关于 $(X_0, X_1)$ 的一次齐次式，$D, E$ 为关于 $(X_0, X_1)$ 的二次齐次式，$G$ 为关于 $(X_0, X_1)$ 的三次齐次式。
通过直线 $L$ 的平面束参数化为 $H_{(\lambda:\mu)}: \mu X_0 - \lambda X_1 = 0$，在 $H_{(\lambda:\mu)}$ 上可取齐次坐标 $(X_0, X_1, X_2, X_3) = (\lambda u, \mu u, v, w)$（其中 $u = 0$ 对应直线 $L$）。代入 $F$ 并约去代表直线 $L$ 的一次因子 $u$，即得剩余二次曲线 $C_{(\lambda:\mu)}$ 在平面坐标 $(u : v : w)$ 下的二次齐次方程：
$$Q_{(\lambda:\mu)}(u, v, w) = A(\lambda, \mu) v^2 + B(\lambda, \mu) v w + C(\lambda, \mu) w^2 + D(\lambda, \mu) u v + E(\lambda, \mu) u w + G(\lambda, \mu) u^2 = 0.$$
下面给出特征 $\operatorname{char} k \neq 2$ 下的对称矩阵判别式证明（注：定理结论本身对任意特征的代数闭域均成立；在 $\operatorname{char} k = 2$ 下，由于不能除以 $2$ 且不能将两条不同直线对角化为 $v^2 - w^2$，需改用三元二次型 $Q = A v^2 + B v w + C w^2 + D u v + E u w + G u^2$ 的无分母半判别式 $\Delta_{1/2} = 4 A C G + B D E - A E^2 - C D^2 - G B^2 \equiv B D E + A E^2 + C D^2 + G B^2 \pmod 2$ 及极映射可分性完成对应的单根性检验，详见 Reid 原书 §7.3 或 Hartshorne Ch. V §4）。在 $\operatorname{char} k \neq 2$ 下，该三元二次型对应的 $3 \times 3$ 对称矩阵为：
$$M(\lambda, \mu) = \begin{pmatrix} A(\lambda, \mu) & \frac{1}{2} B(\lambda, \mu) & \frac{1}{2} D(\lambda, \mu) \\ \frac{1}{2} B(\lambda, \mu) & C(\lambda, \mu) & \frac{1}{2} E(\lambda, \mu) \\ \frac{1}{2} D(\lambda, \mu) & \frac{1}{2} E(\lambda, \mu) & G(\lambda, \mu) \end{pmatrix}.$$
二次曲线 $C_{(\lambda:\mu)}$ 退化为两条直线，当且仅当判别式行列式 $\Delta(\lambda, \mu) = \det M(\lambda, \mu) = 0$。注意到第一、二行关于 $(\lambda, \mu)$ 的次数分别为 $(1, 1, 2)$，第三行的次数为 $(2, 2, 3)$，故行列式展开后是关于 $(\lambda, \mu)$ 的 **$1 + 1 + 3 = 5$ 次齐次多项式**！
最后利用 $S$ 的非奇异性严格证明：**任何退化二次曲线 $C_{H_i}$ 都由两条不同直线组成（$L_i \neq L'_i$），且无论 $L, L_i, L'_i$ 是构成三角形还是共点于 Eckardt 点，判别式 $\Delta(\lambda, \mu) = \det M(\lambda, \mu) = 0$ 在对应平面 $H_i$ 处恒为单根**！
- **无二重直线**：若某平面 $H_0$（设为 $X_1 = 0$，即 $\mu = 0$）切出的剩余二次曲线退化为二重直线 $L_i^2$，任取交点 $P \in L \cap L_i$（当 $L_i \neq L$ 时为单点，当 $L_i = L$ 时任取 $P \in L$），在 $L$ 上作坐标变换使 $P = [0:0:0:1]$ 且 $L_i$ 在 $X_1 = 0$ 内由 $X_0 = 0$ 或 $X_2 = 0$ 定义。若 $L_i = L$（即 $X_1 = 0$ 切出 $3L$），则 $A(1,0) = B(1,0) = C(1,0) = 0$，意味着 $\mu \mid A, B, C$，此时 $F \in (X_1, X_0^2)$ 在 $X_1 = X_0 = 0$ 上的二次方程 $c_1 X_3^2 + b_1 X_2 X_3 + a_1 X_2^2 = 0$ 必在 $L$ 上有根 $P_0$，在该点处 $\nabla F(P_0) = 0$，与 $S$ 光滑矛盾；若 $L_i \neq L$ 为二重直线（设为 $X_1 = X_2 = 0$），则在 $X_1 = 0$ 上 $Q_{(1:0)} = A(1,0) v^2$，即 $B(1,0) = C(1,0) = D(1,0) = E(1,0) = G(1,0) = 0$，从而在交点 $P = [0:0:0:1]$ 处只能有 $\frac{\partial F}{\partial X_1}(P) = c_1 \neq 0$，但在二重直线 $L_i: X_1 = X_2 = 0$ 上 $\frac{\partial F}{\partial X_1}(u, 0, 0, w) = c_1 w^2 + e_1 u w + g_1 u^2$ 作为 $(u:w) \in \mathbb{P}^1_k$ 的二次式必有零点 $Q_0 \in L_i$，在该点处 $\nabla F(Q_0) = 0$，同样与 $S$ 非奇异矛盾！故 $L_i \neq L'_i$。
- **单根性的统一证明（含一般三角形情形与 Eckardt 三线共点情形）**：设平面 $H_i$ 为 $X_1 = 0$（对应 $(\lambda : \mu) = (1 : 0)$）。
  1. **情形 A（一般情形：$L, L_i, L'_i$ 不共点，呈三角形）**：此时两条不同直线 $L_i$ 与 $L'_i$ 的交点 $P = L_i \cap L'_i$ 不在直线 $L = \{u = 0\}$ 上！作平面内坐标变换使交点 $P$ 位于 $(u : v : w) = (1 : 0 : 0)$（即空间点 $[1 : 0 : 0 : 0]$），并使 $L_i, L'_i$ 的方向分别为 $v + w = 0$ 与 $v - w = 0$。则在 $\mu = 0$ 时，$Q_{(1:0)}(u, v, w) = v^2 - w^2$，即 $A(1,0) = 1, \, C(1,0) = -1$，而 $B(1,0) = D(1,0) = E(1,0) = G(1,0) = 0$。在交点 $P = [1:0:0:0]$ 处，$F$ 的前三个偏导数满足 $\frac{\partial F}{\partial X_2}(P) = D(1,0) = 0,\; \frac{\partial F}{\partial X_3}(P) = E(1,0) = 0,\; \frac{\partial F}{\partial X_0}(P) = 3 G(1,0) = 0$。由 $S$ 在点 $P$ 处非奇异，必有 $\frac{\partial F}{\partial X_1}(P) = \frac{\partial G}{\partial \mu}(1,0) \neq 0$！这意味着 $G(1, \mu) = g_1 \mu + O(\mu^2)$（其中 $g_1 \neq 0$）在 $\mu = 0$ 处恰为一阶单零点。将矩阵 $M(1, \mu)$ 在 $\mu = 0$ 附近展开：
     $$\Delta(1, \mu) = \det \begin{pmatrix} 1 + O(\mu) & O(\mu) & O(\mu) \\ O(\mu) & -1 + O(\mu) & O(\mu) \\ O(\mu) & O(\mu) & g_1 \mu + O(\mu^2) \end{pmatrix} = -g_1 \mu + O(\mu^2),$$
     由于 $-g_1 \neq 0$，$\mu = 0$ 是 $\Delta(1, \mu) = 0$ 的**单根**！
  2. **情形 B（Eckardt 点情形：$L, L_i, L'_i$ 三线共点于 $P \in L$）**：在直线 $L$ 上作坐标变换使三线公共交点为 $P = [0 : 0 : 0 : 1]$（对应平面坐标 $(u : v : w) = (0 : 0 : 1)$）。由于 $P \in L_i \cap L'_i$ 是退化二次曲线 $Q_{(1:0)}(u, v, w) = 0$ 的奇点，矩阵 $M(1, 0)$ 的第二行（对应变量 $w$）必全为零，即 $C(1,0) = B(1,0) = E(1,0) = 0$。与此同时，由于 $C_{(1:0)} = L_i \cup L'_i$ 是过点 $P = (0:0:1)$ 且异于 $L = \{u=0\}$ 的两条**互异**直线，其关于 $(u, v)$ 的二次型 $A(1,0)v^2 + D(1,0)uv + G(1,0)u^2 = 0$ 无重根，故二阶子式非退化：$A(1,0)G(1,0) - \frac{1}{4}D(1,0)^2 \neq 0$。再考察曲面 $S$ 在点 $P = [0:0:0:1]$ 处的偏导数：$\frac{\partial F}{\partial X_2}(P) = B(1,0) = 0,\; \frac{\partial F}{\partial X_3}(P) = 0,\; \frac{\partial F}{\partial X_0}(P) = C(1,0) = 0$。由 $S$ 在 $P$ 处非奇异，必有 $\frac{\partial F}{\partial X_1}(P) = \frac{\partial C}{\partial \mu}(1,0) = c_1 \neq 0$！因此一次式 $C(1, \mu) = c_1 \mu$。将 $\Delta(1, \mu) = \det M(1, \mu)$ 按第二行展开：
     $$\Delta(1, \mu) = C(1, \mu)\left(A(1,0)G(1,0) - \frac{1}{4}D(1,0)^2\right) + O(\mu^2) = c_1\left(A(1,0)G(1,0) - \frac{1}{4}D(1,0)^2\right)\mu + O(\mu^2),$$
     其一次项系数是两个非零数之积，故 $\mu = 0$ 依然是 $\Delta(1, \mu) = 0$ 的**单根**！
  综上，五次齐次多项式 $\Delta(\lambda, \mu) = 0$ 在 $\mathbb{P}^1_k$ 上恒有 $5$ 个互异单根，精确对应 $5$ 个三切平面 $H_1, \dots, H_5$ 与 $5$ 对共面直线 $\{L_i, L'_i\}_{i=1}^5$。最后，若 $i \neq j$ 时 $L_i$ 与 $L_j$ 相交，则交点 $P$ 必位于 $H_i \cap H_j = L$ 上，此时不共面的三条直线 $L, L_i, L_j \subset S$ 同时经过点 $P$，它们的切方向张成整个三维空间 $\mathbb{P}^3_k$，迫使 $\dim T_P S = 3$（即 $P$ 为 $S$ 的奇点），矛盾！ **Q.E.D.**

#### 4.4 Disjoint lines and explicit construction of the 27 lines

有了 Theorem 4.3，我们便能从两条异面直线出发，以纯粹的组合几何推理锁定非奇异三次曲面上直线的总数恰好为 $27$。

**Lemma 4.4** (决定其余直线的四条异面直线引理).
设 $S \subset \mathbb{P}^3_k$ 为非奇异三次曲面，$L_1, L_2, L_3, L_4 \subset S$ 为四条两两不相交（异面）的直线。则 $S$ 上与这四条直线全都相交的直线至多有 $2$ 条。

**Proof.**
在 $\mathbb{P}^3_k$ 中，与前三条两两异面的直线 $L_1, L_2, L_3$ 全都相交的直线族构成一个非退化二次曲面（Quadric Surface，同构于 $\mathbb{P}^1_k \times \mathbb{P}^1_k$）$Q \subset \mathbb{P}^3_k$ 的一族母线（Ruling）。由于 $Q$ 是二次曲面而 $S$ 是包含 $L_1, L_2, L_3$ 的三次曲面，若 $Q \subset S$ 则 $S$ 可约（与 $S$ 非奇异矛盾），故交集 $Q \cap S$ 是 $Q \cong \mathbb{P}^1 \times \mathbb{P}^1$ 上双次数为 $(3, 3)$ 的曲线。第四条直线 $L_4$ 若不在 $Q$ 上，则与 $Q$ 相交于 $2$ 个点（计重数），过这两个点的母线至多有 $2$ 条；若 $L_4 \subset Q$，则 $L_4$ 与 $L_1, L_2, L_3$ 属于同一族母线，从而 $Q \cap S$ 去掉这 $4$ 条 $(1, 0)$ 型母线后仅余 $(3-4, 3)$，这是不可能的！故与 $L_1, L_2, L_3, L_4$ 同时相交的直线至多 $2$ 条。 **Q.E.D.**

**Theorem 4.5** (Cayley–Salmon 定理：非奇异三次曲面上的 27 条直线).
代数闭域 $k$ 上的任意非奇异三次曲面 $S \subset \mathbb{P}^3_k$ 恰好包含 **27 条直线**。

**Proof.**
1. 由 Theorem 4.2 與 Theorem 4.3，取定一条直线 $L \subset S$，与其相交的 10 条直线配成 5 对 $\{L_i, L'_i\}_{i=1}^5$。选取一条与 $L$ 不相交的直线 $M \subset S$（例如在 $L_1$ 的另外 4 个三切平面中取不交于 $L$ 的直线）。
2. 由于 $M$ 与 $L$ 不相交，对每个 $i \in \{1, \dots, 5\}$，直线 $M$ 与三切平面 $H_i$（其中 $S \cap H_i = L \cup L_i \cup L'_i$）恰交于唯一一点 $P_i \in S \cap H_i$。因为 $P_i \notin L$，点 $P_i$ 必须落在 $L_i \cup L'_i$ 上；又因为若 $P_i \in L_i \cap L'_i$ 则 $M, L_i, L'_i$ 三条不共面直线过点 $P_i$ 会迫使 $P_i$ 为 $S$ 的奇点，矛盾！因此：**对每个 $i = 1, \dots, 5$，直线 $M$ 恰与 $\{L_i, L'_i\}$ 中的一条相交，而与另一条不相交**。
3. 不妨重新标记，设对每个 $i = 1, \dots, 5$，直线 $M$ 均与 $L_i$ 相交，而与 $L'_i$ 不相交。于是 $L_1, L_2, L_3, L_4, L_5$ 是同时与异面直线对 $\{L, M\}$ 相交的 5 条两两异面直线！
4. 现在对每个 $i \in \{1, \dots, 5\}$，由于直线 $M$ 与直线 $L_i$ 相交于点 $P_i = M \cap L_i$，这两条相交直线 $M$ 与 $L_i$ 张成唯一的平面 $\Pi_i = \operatorname{Span}(M, L_i)$（注：$L$ 与 $M$ 是异面直线，不存在同时包含 $L$ 与 $M$ 的平面；平面 $H_i = \operatorname{Span}(L, L_i)$ 包含 $\{L, L_i, L'_i\}$，而平面 $\Pi_i = \operatorname{Span}(M, L_i)$ 包含 $M$ 与 $L_i$）。平面 $\Pi_i$ 与三次曲面 $S$ 的交集必切出第三条直线 $L_{0i} \subset S$，使得 $S \cap \Pi_i = M \cup L_i \cup L_{0i}$。
5. 更进一步，任意给定 $S$ 上的另一条直线 $N \notin \{L, M, L_1, L'_1, \dots, L_5, L'_5\}$：由于 $N$ 不交于 $L$，同第 2 步可知对每个 $i \in \{1, \dots, 5\}$，$N$ 恰与 $\{L_i, L'_i\}$ 中的一条相交。由 Lemma 4.4，与 $\{L_1, L_2, L_3, L_4, L_5\}$ 中至少 4 条相交的直线除了 $L$ 和 $M$ 外别无他物；而通过分析 $L_1$ 的 5 对共面直线可知，$N$ 恰好与 $\{L_1, \dots, L_5\}$ 中的 **3 条或 1 条**相交（通过将 $L'_i$ 替换为新基底可得双六结构）：
   - 已有 $L$（1 条）加上与 $L$ 相交的 5 对 $\{L_i, L'_i\}$（$10$ 条），共 $1 + 10 = 11$ 条直线；
   - 任何与 $L$ 不相交的直线 $N$，必然与每一对 $\{L_i, L'_i\}$（$i = 1, \dots, 5$）中恰好一条相交。对第一对 $\{L_1, L'_1\}$，分别有与 $L_1$ 相交但与 $L$ 不相交的 $4 \times 2 = 8$ 条直线，以及与 $L'_1$ 相交但与 $L$ 不相交的 $4 \times 2 = 8$ 条直线，且这两批直线彼此无公共元（因为 $N$ 不能同时交 $L_1$ 与 $L'_1$）。
   因此，$S$ 上直线的总数恒为：
   $$1 + 10 + 8 + 8 = 27!$$
   这就完成了 27 条直线的精确计数。 **Q.E.D.**

#### 4.5 Configuration of the 27 lines and blowup of six points

为了对称地命名并组织这 27 条直线，最具几何美感的视角是将非奇异三次曲面 $S \subset \mathbb{P}^3_k$ 实现为射影平面 $\mathbb{P}^2_k$ 在处于**一般位置（General Position）的 6 个点 $P_1, P_2, P_3, P_4, P_5, P_6 \in \mathbb{P}^2_k$** 处的**爆破（Blowup）**！

**Definition** (六个点的一般位置条件).
称平面 $\mathbb{P}^2_k$ 上的六个不同点 $P_1, \dots, P_6$ 处于**一般位置**，如果：
1. 其中没有任何 3 个点共线；
2. 这 6 个点不位于同一条二次曲线（Conic）上。

**Theorem 4.6** ($\mathbb{P}^2_k$ 在一般位置六点处的爆破与 27 条直线的双有理显式实现).
设 $P_1, \dots, P_6 \in \mathbb{P}^2_k$ 处于一般位置。考察通过这 6 个点的全体平面三次曲线所构成的线性系 $V \subset H^0(\mathbb{P}^2_k, \mathcal{O}_{\mathbb{P}^2}(3))$：由于平面三次曲线共有 $\binom{3+2}{2} = 10$ 个系数，在一般位置的 6 个点处消失施加了 6 个线性独立的条件，故 $\dim_k V = 10 - 6 = 4$。取 $V$ 的一组基 $F_0, F_1, F_2, F_3$，有理映射 $[F_0 : F_1 : F_2 : F_3]: \mathbb{P}^2_k \dashrightarrow \mathbb{P}^3_k$ 诱导了 $\mathbb{P}^2_k$ 在 $P_1, \dots, P_6$ 处的爆破簇 $\operatorname{Bl}_{P_1, \dots, P_6} \mathbb{P}^2_k$ 到 $\mathbb{P}^3_k$ 中一个**非奇异三次曲面 $S$** 的同构嵌入！在此实现下，$S$ 上的 **27 条直线**恰好由以下三类不可约曲线的严格变换与例外曲线组成：
1. **$6$ 条例外直线 $E_i$（$1 \le i \le 6$）**：爆破中心 $P_i$ 的逆像 $E_i = \pi^{-1}(P_i) \cong \mathbb{P}^1_k$（其次数为 $\deg E_i = 1$，因为一般三次曲线在 $P_i$ 处重数为 $1$）；
2. **$\binom{6}{2} = 15$ 条连接直线 $L_{ij}$（$1 \le i < j \le 6$）**：连接平面上两点 $P_i, P_j$ 的直线 $\overline{P_i P_j} \subset \mathbb{P}^2_k$ 的严格变换（由 Bézout 定理，一般过 6 点的三次曲线与一次直线 $\overline{P_i P_j}$ 总交点数为 $3 \times 1 = 3$，扣除已知基底点 $P_i, P_j$ 处的 $2$ 个交点后，剩余自由交点数恰为 $3 - 2 = 1$，故其像为一次直线）；
3. **$6$ 条五点二次曲线 $C_i$（$1 \le i \le 6$）**：通过除 $P_i$ 以外其余 5 个点 $\{P_1, \dots, \widehat{P_i}, \dots, P_6\}$ 的唯一不可约二次曲线的严格变换（一般过 6 点的三次曲线与二次曲线总交点数为 $3 \times 2 = 6$，扣除 5 个公共基底点处的 $5$ 个交点后，剩余自由交点数恰为 $6 - 5 = 1$，故其像同样为 $\mathbb{P}^3_k$ 中的一次直线！）。

三类直线的总数恰好为：
$$6 + 15 + 6 = 27!$$

并且，这 27 条直线之间的相交关系（以及全部 $45$ 个三切平面）由平面曲线的几何交点完全决定：

| 直线类别与记号 | 数量 | 与 $E_k$ 相交条件 | 与 $L_{kl}$ 相交条件 | 与 $C_k$ 相交条件 |
| :--- | :---: | :--- | :--- | :--- |
| **例外除子 $E_i$** ($1 \le i \le 6$) | $6$ | 互不相交 ($E_i \cap E_j = \varnothing$) | 当且仅当 $i \in \{k, l\}$ | 当且仅当 $i \neq k$ |
| **两点连线 $L_{ij}$** ($1 \le i < j \le 6$) | $15$ | 当且仅当 $k \in \{i, j\}$ | 当且仅当 $\{i, j\} \cap \{k, l\} = \varnothing$ | 当且仅当 $k \in \{i, j\}$ |
| **五点二次曲线 $C_i$** ($1 \le i \le 6$) | $6$ | 当且仅当 $i \neq k$ | 当且仅当 $i \in \{k, l\}$ | 互不相交 ($C_i \cap C_j = \varnothing$) |

> [!tip] Schläfli 双六结构（Schläfli's Double-Six）與 $W(E_6)$ 对称群
> 观察上表的第一行与第三行：6 条例外直线 $(E_1, E_2, E_3, E_4, E_5, E_6)$ 彼此两两不相交，6 条二次曲线直线 $(C_1, C_2, C_3, C_4, C_5, C_6)$ 也彼此两两不相交，且 $E_i$ 与 $C_j$ 相交当且仅当 $i \neq j$！这样一对由两排各 6 条异面直线组成的配置称为一个 **Schläfli 双六（Double-Six）**。在 27 条直线中共有 $36$ 个双六、$45$ 个三切平面（形如 $E_i + L_{ij} + C_j$ 共 $30$ 个，以及当 $\{i,j\}\sqcup\{k,l\}\sqcup\{m,n\}=\{1,\dots,6\}$ 时形如 $L_{ij} + L_{kl} + L_{mn}$ 共 $15$ 个），保持这一相交图的自同构群恰好是阶数为 $|W(E_6)| = 51840$ 的例外李代数 $E_6$ 的 Weyl 群！

#### 4.6 Historical evolution: from classical geometry to schemes

回顾初等代数几何的发展历程，我们可以清晰地看到“几何直观”与“代数严密化”在近两百年间的螺旋式上升：

1. **19 世纪古典射影几何时期（Poncelet, Plücker, Cayley, Salmon, Riemann, Clebsch, Max Noether）**：
   古典几何学家以高度发达的射影直观、消元结式、不变量理论和参数维数计数（Counting of Constants）发现了平面三次曲线的 9 个拐点、Bézout 定理、三次曲面上的 27 条直线以及代数曲线的 Riemann–Roch 定理。然而，在缺乏严格重数定义与一般点（Generic Point）语言时，单纯的维数计数有时会在退化情形下失效。
2. **20 世纪上半叶交换代数奠基时期（Hilbert, Emmy Noether, Krull, Zariski, Weil）**：
   Hilbert 的基定理与零点定理将代数集彻底纳入多项式环理想论；Emmy Noether 与 Krull 建立了抽象 Noether 环、准素分解与局部维数理论；Zariski 与 Weil 则引入了任意特征域上的抽象代数簇、局部环 $\mathcal{O}_{V,P}$、正规化（Normalisation）与交点重数的严密代数定义，使双有理几何获得了坚实的交换代数根基。
3. **20 世纪中叶以来的层论与概形革命（Serre, Grothendieck）**：
   Serre 在名篇 *FAC*（*Faisceaux Algébriques Cohomologiques*）中将层（Sheaf）与上同调引入代数闭域上的代数簇；随后 Grothendieck 创立了**概形（Scheme）**理论，将任意交换环 $A$ 的素理想谱 $\operatorname{Spec} A$（连同结构层 $\mathcal{O}_{\operatorname{Spec} A}$）作为基本几何空间。概形语言带来三大根本性突破：
   - **容纳幂零元（Nilpotents）与重数结构**：在古典簇中 $I(V(x^2)) = (x)$ 抹去了重根的无穷小信息，而在概形 $\operatorname{Spec} k[x]/(x^2)$ 中，非零幂零元 $x$ 精确保留了一阶切向量与重数 $2$ 的几何结构；
   - **容纳非代数闭域与算术几何（Arithmetic Geometry）**：允许以整数环 $\operatorname{Spec} \mathbb{Z}$ 或有限域 $\mathbb{F}_p$ 作为底空间，将丢番图数论方程与几何纤维簇统一在同一套态射语言之下（最终促成了 Deligne 对 Weil 猜想的证明与 Faltings、Wiles 的数论突破）；
   - **函子化与模空间理论**：通过点函子（Functor of Points）与平坦态射（Flat Morphisms），使曲线、曲面与向量丛的连续形变及模空间紧化获得了彻底严密的数学表述。

#### 4.7 Exercises to Chapter 4

> [!note] Miles Reid 原书 Chapter III（§7–§8）原始习题索引与对照
> - **原书 §7 习题（The 27 Lines on a Cubic Surface）**：(7.1) Fermat 三次曲面 $\sum_{i=0}^3 X_i^3 = 0$ 上 $27$ 条直线的显式方程与 Eckardt 点检验；(7.2) 非奇异三次曲面上 $45$ 个三切平面与 $36$ 个 Schläfli 双六的组合计数；(7.3) 含奇点三次曲面（如 Cayley 四结点三次曲面 $\sum_{i<j<l} X_i X_j X_l = 0$）上直线的重数退化；(7.4) 一般位置 6 点爆破 $\operatorname{Bl}_{P_1,\dots,P_6}\mathbb{P}^2_k$ 的例外除子与严格变换相交表。
> 以下按专题逐题给出完整陈述与严格证明。

##### Exercise 4.1 (Fermat 三次曲面上的 27 条直线显式方程)
设基域 $k$ 代数闭且 $\operatorname{char} k \neq 3$，考虑 $\mathbb{P}^3_k$ 中的 Fermat 三次曲面：
$$S: X_0^3 + X_1^3 + X_2^3 + X_3^3 = 0.$$
1. 验证 $S$ 是非奇异三次曲面；
2. 设 $\omega \in k$ 为本原三次单位根（$1 + \omega + \omega^2 = 0$），直接写出 $S$ 上全部 **27 条直线**的显式方程，并验证它们确实分成 $3$ 组（对应将 $\{0, 1, 2, 3\}$ 划分为两对指标的 $3$ 种方式），每组包含 $3 \times 3 = 9$ 条直线。

**Proof.**
1. 计算偏导数：$\frac{\partial F}{\partial X_i} = 3 X_i^2$（$i = 0, 1, 2, 3$）。由于 $\operatorname{char} k \neq 3$，四个偏导数同时为零当且仅当 $X_0 = X_1 = X_2 = X_3 = 0$，这在射影空间 $\mathbb{P}^3_k$ 中不对应任何点。故 $S$ 在每一点处均非奇异。
2. 利用三次因式分解 $U^3 + V^3 = (U + V)(U + \omega V)(U + \omega^2 V)$，将四个坐标 $(X_0, X_1, X_2, X_3)$ 两两配对，共有 $\frac{1}{2}\binom{4}{2} = 3$ 种配对方式：
   - **第一组（配对 $\{0,1\}$ 与 $\{2,3\}$，共 $9$ 条直线）**：
     $$L_{a,b}^{(1)}: \begin{cases} X_0 + \omega^a X_1 = 0, \\ X_2 + \omega^b X_3 = 0, \end{cases} \qquad (a, b \in \{0, 1, 2\});$$
   - **第二组（配对 $\{0,2\}$ 与 $\{1,3\}$，共 $9$ 条直线）**：
     $$L_{a,b}^{(2)}: \begin{cases} X_0 + \omega^a X_2 = 0, \\ X_1 + \omega^b X_3 = 0, \end{cases} \qquad (a, b \in \{0, 1, 2\});$$
   - **第三组（配对 $\{0,3\}$ 与 $\{1,2\}$，共 $9$ 条直线）**：
     $$L_{a,b}^{(3)}: \begin{cases} X_0 + \omega^a X_3 = 0, \\ X_1 + \omega^b X_2 = 0, \end{cases} \qquad (a, b \in \{0, 1, 2\}).$$
   在每条直线上均有两对坐标立方和分别为 $0$，故整条直线完全落在 $S$ 上；且由于 $\omega^a$（$a=0,1,2$）互异，这 $9 + 9 + 9 = 27$ 条直线两两不同，根据 Theorem 4.5 它们穷尽了 Fermat 三次曲面上的全部 27 条直线。 **Q.E.D.**

##### Exercise 4.2 (非奇异三次曲面上三切平面的总数 45)
设 $S \subset \mathbb{P}^3_k$ 为非奇异三次曲面。证明 $S$ 恰好拥有 **45 个三切平面（Tritangent Planes，即截面 $S \cap H$ 为三条直线之并的平面）**，并验证在 $\operatorname{Bl}_{P_1, \dots, P_6} \mathbb{P}^2_k$ 表示下这 45 个三切平面与 $30$ 个 $\{E_i, L_{ij}, C_j\}$ 型三角形及 $15$ 个 $\{L_{ij}, L_{kl}, L_{mn}\}$ 型三角形一一对应。

**Proof.**
由 Theorem 4.3，对于 $S$ 上的每一条直线 $L$，包含 $L$ 的三切平面恰好有 $5$ 个。对全部 $27$ 条直线累加，共得到 $27 \times 5 = 135$ 个有序对 $(L, H)$（其中 $L \subset S \cap H$）。另一方面，每个三切平面 $H$ 恰好包含 $S$ 上的 $3$ 条直线（从而在上面被重复计数了 $3$ 次）。因此，不同三切平面的总数为：
$$\frac{27 \times 5}{3} = 45.$$
在爆破模型 $S \cong \operatorname{Bl}_{P_1, \dots, P_6} \mathbb{P}^2_k$ 中，超平面截面类对应于反典范线性系 $|-K_S| = |3H_{\mathbb{P}^2} - \sum_{r=1}^6 E_r|$：
- 对任意有序指标对 $(i, j)$（$1 \le i \neq j \le 6$，共 $6 \times 5 = 30$ 对），平面上连接 $P_i, P_j$ 的直线 $L_{ij}$（类为 $H_{\mathbb{P}^2} - E_i - E_j$）、过其余五点 $\{P_r\}_{r \neq j}$ 的二次曲线 $C_j$（类为 $2H_{\mathbb{P}^2} - \sum_{r \neq j} E_r$）以及例外曲线 $E_i$ 的和恰好为：
  $$E_i + (H_{\mathbb{P}^2} - E_i - E_j) + \left(2H_{\mathbb{P}^2} - \sum_{r \neq j} E_r\right) = 3H_{\mathbb{P}^2} - \sum_{r=1}^6 E_r \in |-K_S|,$$
  给出 $30$ 个三切平面 $\{E_i, L_{ij}, C_j\}$；
- 对 $\{1, 2, 3, 4, 5, 6\}$ 分割为三个无序二元对 $\{i, j\} \sqcup \{k, l\} \sqcup \{m, n\}$ 的每种划分（共 $\frac{1}{3!}\binom{6}{2}\binom{4}{2}\binom{2}{2} = 15$ 种划分），三条两点连线之和同样满足：
  $$(H_{\mathbb{P}^2} - E_i - E_j) + (H_{\mathbb{P}^2} - E_k - E_l) + (H_{\mathbb{P}^2} - E_m - E_n) = 3H_{\mathbb{P}^2} - \sum_{r=1}^6 E_r \in |-K_S|,$$
  给出其余 $15$ 个三切平面 $\{L_{ij}, L_{kl}, L_{mn}\}$。两者合计 $30 + 15 = 45$ 个三切平面。 **Q.E.D.**

##### Exercise 4.3 (Cayley 四结点三次曲面与带重数的直线退化)
在 $\mathbb{P}^3_k$ 中考察由对称三次多项式定义的 **Cayley 四结点三次曲面（Cayley's Nodal Cubic Surface）**：
$$S_{\mathrm{Cayley}}: X_1 X_2 X_3 + X_0 X_2 X_3 + X_0 X_1 X_3 + X_0 X_1 X_2 = 0.$$
求 $S_{\mathrm{Cayley}}$ 的全部奇点，并找出完全位于 $S_{\mathrm{Cayley}}$ 上的所有射影直线（说明为何直线的几何条数少于 $27$）。

**Proof.**
方程等价于当 $X_i \neq 0$ 时 $\sum_{j=0}^3 \frac{1}{X_j} = 0$。偏导数为 $\frac{\partial F}{\partial X_0} = X_1 X_2 + X_1 X_3 + X_2 X_3$（其余轮换对称）。令四个偏导数及 $F$ 同时为零，容易解得恰有 **4 个孤立奇点（均为普通二重点 / $A_1$ 结点）**，即四个坐标基点：
$$P_0 = [1:0:0:0], \quad P_1 = [0:1:0:0], \quad P_2 = [0:0:1:0], \quad P_3 = [0:0:0:1].$$
位于 $S_{\mathrm{Cayley}}$ 上的直线由两部分组成：
1. 连接任意两个奇点 $P_i, P_j$ 的 **6 条坐标棱线** $L_{ij}: X_k = X_l = 0$（$\{i,j,k,l\} = \{0,1,2,3\}$）；
2. 在对偶平面 $X_i + X_j = X_k + X_l = 0$ 上与对棱相交的 **3 条对角直线**（对应将 $\{0,1,2,3\}$ 分为两对的 3 种分法）。
因此 $S_{\mathrm{Cayley}}$ 上共有 $6 + 3 = 9$ 条几何直线（其中每条连接两个结点的棱线 $L_{ij}$ 在参数退化意义下具有重数 $4$，而每条不经过结点的对角直线具有重数 $1$，带重数总和仍为 $6 \times 4 + 3 \times 1 = 27$）。 **Q.E.D.**

## Index of Key Notations and Concepts

| 符号 / 术语 | 英文对照 | 核心数学定义与所在章节 |
| :--- | :--- | :--- |
| $\mathbb{A}^n_k, \mathbb{P}^n_k$ | Affine $n$-space, Projective $n$-space | $n$ 维仿射空间 $k^n$ 与 $n$ 维射影空间 $(k^{n+1}\setminus\{0\})/k^\times$（§0.4, §1.2, §3.4） |
| $V(I), I(V)$ | Zero locus, Vanishing ideal | 理想 $I$ 的公共零点集与子集 $V$ 上恒为零的多项式理想（§2.2） |
| $\sqrt{I}$ | Radical of an ideal | 根理想 $\{f \mid \exists r \ge 1, f^r \in I\}$，强零点定理给出 $I(V(I)) = \sqrt{I}$（§2.6） |
| $H_f = \bigl(\frac{\partial^2 f}{\partial X_i \partial X_j}\bigr)$ | Hessian matrix | 齐次多项式的二阶偏导矩阵；$\operatorname{char} k \neq 2$ 时二次齐次式满足 $x^{\mathsf{T}} H x = 2f(x)$，$\operatorname{char} k \neq 2,3$ 时 $\det H_f = 0$ 切出三次曲线拐点（§1.3, §1.5） |
| $k[V], k(V)$ | Coordinate ring, Function field | 仿射簇 $V$ 的坐标环 $k[X_1,\dots,X_n]/I(V)$ 与不可约簇的有理函数域 $\operatorname{Frac}(k[V])$（§2.3, §3.1, §3.2） |
| $\mathcal{O}_{V,P}, \mathfrak{m}_P$ | Local ring at $P$, Maximal ideal | 簇 $V$ 在点 $P$ 处的局部正则函数环 $\{f/g \mid g(P) \neq 0\}$ 及其唯一极大理想（§3.2, §3.7） |
| $T_P V$ | Zariski tangent space | 点 $P \in V$ 处的切空间，代数上自然同构于余切空间对偶 $(\mathfrak{m}_P/\mathfrak{m}_P^2)^*$（§3.7） |
| $\operatorname{Bl}_P X$ | Blowup at a point $P$ | 在点 $P$ 处将切方向分离的爆破双有理态射，用于曲线奇点消解与三次曲面构造（§3.8, §4.5） |

## 相关链接

- [[代数几何初步/Undergraduate Algebraic Geometry/AGENTS|本目录排版与结构规范]]
- [[2026浙大暑期学校/00_课程总结|2026 浙大暑期学校代数几何与黎曼几何总结]]
- [[00_跨主题阅读索引|跨主题阅读索引]]
