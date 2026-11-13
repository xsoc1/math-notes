---
title: "Lax–Milgram 与稳定性"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-baire-theorems
  - theory-note
note_type: theory
source_section: "F/10 第 40–44 页及稳定性部分"
exercise_range: "2.3 节的方法补充"
status: "已补证"
---

# Lax-Milgram 与稳定性

在 [[泛函分析/08_Riesz表示与变分问题/02_弱解与变分不等式|08 专题第 2 节]] 中，我们利用 Riesz 表示定理直接求解了对称正定双线性形式（如 Poisson 方程的梯度内积 $(\nabla u,\nabla v)_{L^2}$）对应的变分方程。然而，当偏微分方程中含有非对称的一阶对流项（如 $-\Delta u+b\cdot\nabla u+cu=g$）或复系数项时，对应的半双线性形式 $a(x,y)$ **不再对称**，因而不能直接将其视作一个新的内积。**Lax-Milgram 定理**正是为了解决非对称变分问题而建立的核心工具：它利用**有界性**将形式转化为有界线性算子 $A$，利用**强制性（Coercivity）**提供的对角下界同时确立算子 $A$ 的单射性、闭值域性以及值域正交补为零（满射性），从而在不依赖 Baire 纲定理的情况下，直接给出解的存在唯一性与定量稳定性估计。

## 1. Lax-Milgram 定理的陈述

> [!note] 定理 1.1 Lax-Milgram 定理
> 设 $H$ 是实或复 **Hilbert 空间**，$a:H\times H\to\mathbb K$ 是半双线性形式（对第一变量 $x$ 线性，对第二变量 $y$ 共轭线性），满足以下两个条件：
> 1. **有界性：** 存在常数 $M\geq 0$，使得对一切 $x,y\in H$ 都有
>    $$
>    |a(x,y)|\leq M\|x\|\cdot\|y\|;
>    $$
> 2. **强制性（正定下界）：** 存在常数 $\delta>0$，使得对一切 $x\in H$ 都有
>    $$
>    |a(x,x)|\geq\delta\|x\|^2.
>    $$
> 则对任意给定的连续线性泛函 $f\in H^*$，在 $H$ 中**存在唯一**的解向量 $y\in H$，使得对一切测试向量 $x\in H$ 恒有
> $$
> a(x,y)=f(x)\qquad(\forall x\in H),
> $$
> 且解满足先验稳定性估计：
> $$
> \|y\|_H\leq\frac{1}{\delta}\|f\|_{H^*}.
> $$

*注：在偏微分方程文献中，强制性条件常写作实部下界 $\operatorname{Re}a(x,x)\geq\delta\|x\|^2$；由于 $|a(x,x)|\geq\operatorname{Re}a(x,x)$，实部下界显然蕴含上述绝对值下界 $|a(x,x)|\geq\delta\|x\|^2$。下面直接针对更宽泛的绝对值下界给出完整证明。*

## 2. 定理的证明：下界估计、闭值域与正交补排除

**证明：**
首先，由 [[泛函分析/08_Riesz表示与变分问题/01_Riesz表示定理#2. 有界半双线性形式与有界线性算子的一一对应|08 专题定理 2.1（有界半双线性形式的算子表示）]] 及 Riesz 表示定理，存在唯一的有界线性算子 $A\in\mathcal L(H,H)$（满足 $\|A\|\leq M$）使得对一切 $x,y\in H$ 有
$$
a(x,y)=(x,Ay),
$$
且存在唯一的表示元 $z_f\in H$（满足 $\|z_f\|_H=\|f\|_{H^*}$）使得 $f(x)=(x,z_f)$。于是，原变分方程 $a(x,y)=f(x)$（$\forall x\in H$）完全等价于 Hilbert 空间 $H$ 中的算子方程：
$$
Ay=z_f.
$$
因此，只需证明算子 $A:H\to H$ 是双射且 $\|A^{-1}\|\leq 1/\delta$。证明分为三步：

1. **第一步：由强制性导出算子下界与单射性。**
   对任意 $y\in H$，结合强制性条件与 Cauchy-Schwarz 不等式，可得
   $$
   \delta\|y\|^2\leq|a(y,y)|=|(y,Ay)|\leq\|y\|\cdot\|Ay\|.
   $$
   当 $y\neq 0$ 时两边同除以 $\|y\|$（$y=0$ 时亦成立），即得算子 $A$ 的一致下界估计：
   $$
   \|Ay\|\geq\delta\|y\|\qquad(\forall y\in H).
   \tag{1}
   $$
   特别地，若 $Ay=0$，则由式 (1) 立得 $\|y\|=0\implies y=0$，故 $A$ 是**单射**。

2. **第二步：由一致下界与空间完备性证明值域 $R(A)$ 是闭子空间。**
   设序列 $\{w_n\}\subseteq R(A)$ 在 $H$ 中收敛于 $w\in H$，其中 $w_n=Ay_n$（$y_n\in H$）。对任意 $n,m\in\mathbb N$，将式 (1) 应用于差向量 $y_n-y_m$，得
   $$
   \|y_n-y_m\|\leq\frac{1}{\delta}\|Ay_n-Ay_m\|=\frac{1}{\delta}\|w_n-w_m\|\longrightarrow 0\quad(n,m\to\infty).
   $$
   这说明原像序列 $\{y_n\}$ 是 $H$ 中的 Cauchy 序列。由 **Hilbert 空间 $H$ 的完备性**，存在 $y\in H$ 使得 $y_n\to y$；再由有界算子 $A$ 的连续性得 $w=\lim_{n\to\infty}Ay_n=Ay\in R(A)$。故值域 $R(A)$ 是 $H$ 中的**闭线性子空间**。

3. **第三步：利用强制性排除遗漏方向，证明 $R(A)=H$（满射性）。**
   由于 $R(A)$ 是闭子空间，由正交直和分解定理（[[泛函分析/06_Hilbert空间与正交方法/03_投影定理与最小二乘#3. 闭线性子空间与正交直和分解定理|06 专题定理 3.1]]），要证 $R(A)=H$，只需证明其正交补 $R(A)^\perp=\{0\}$！
   任取向量 $v\in R(A)^\perp$，则对一切 $y\in H$ 都有 $(v,Ay)=0$。特别地，在其中取 $y=v$，并结合强制性下界，立得
   $$
   \delta\|v\|^2\leq|a(v,v)|=|(v,Av)|=0\quad\Longrightarrow\quad v=0!
   $$
   因此 $R(A)^\perp=\{0\}$，从而闭子空间 $R(A)=\overline{R(A)}=\bigl(R(A)^\perp\bigr)^\perp=\{0\}^\perp=H$，即 $A$ 是**满射**。

综上所述，$A:H\to H$ 是双射，唯一解为 $y=A^{-1}z_f$，且由下界式 (1) 直接给出定量估计
$$
\|y\|_H=\|A^{-1}z_f\|_H\leq\frac{1}{\delta}\|z_f\|_H=\frac{1}{\delta}\|f\|_{H^*}.
$$
注意此处逆算子有界且范数不超过 $1/\delta$ 是由显式下界式 (1) 直接定量给出的，完全无需借助非定量的逆算子定理。$\square$

## 3. 条件辨析：强制性、算子下界与可逆性的逻辑关系

在理解 Lax-Milgram 定理时，应当严格区分以下三个不同层次的性质：

1. **强制性 $|(x,Ax)|\geq\delta\|x\|^2$ 是算子 $A$ 可逆的充分条件，而非必要条件：**
   在二维实欧氏平面 $\mathbb R^2$ 上，取逆时针旋转 $90^\circ$ 的正交矩阵 $A=\begin{pmatrix}0 & -1\\ 1 & 0\end{pmatrix}$，并定义双线性形式 $a(x,y)=(x,Ay)$。显然 $A$ 是等距双射（可逆且 $\|A^{-1}\|=1$），但由于对任意向量 $x\in\mathbb R^2$ 都有 $Ax\perp x$，故对角项恒为零：
   $$
   a(x,x)=(x,Ax)=0\qquad(\forall x\in\mathbb R^2),
   $$
   完全不满足强制性条件！
2. **仅凭算子下界 $\|Ay\|\geq\delta\|y\|$ 只能保证“单射 + 闭值域”，不能保证“满射”：**
   在 $\ell^2$ 上考察单侧右移算子 $S(x_1,x_2,\ldots)=(0,x_1,x_2,\ldots)$。它满足等距性质 $\|Sx\|_2=\|x\|_2$（即具有下界 $\delta=1$），因此是单射且值域 $R(S)=\{y\in\ell^2:y_1=0\}$ 是闭子空间；但 $R(S)^\perp=\operatorname{span}\{e_1\}\neq\{0\}$，$S$ 并不是满射。Lax-Milgram 定理之所以能同时得到满射性，是因为它的假设是更强的内积对角下界 $|(y,Ay)|\geq\delta\|y\|^2$，该条件不仅通过 Cauchy-Schwarz 蕴含了 $\|Ay\|\geq\delta\|y\|$，还在证明第三步中直接扼杀了正交补 $R(A)^\perp$ 中的非零向量。

## 4. 对称能量极小化与一般非对称变分方程的联系

- **对称情形：** 在实 Hilbert 空间 $H$ 中，若双线性形式 $a(x,y)$ 除了有界与强制（$a(x,x)\geq\delta\|x\|^2$）外还满足**对称性** $a(x,y)=a(y,x)$，则 $a(\cdot,\cdot)$ 本身就定义了 $H$ 上的一个与原内积等价的新内积（因为 $\delta\|x\|^2\leq a(x,x)\leq M\|x\|^2$）。此时，Lax-Milgram 定理直接退化为在新内积 $a(\cdot,\cdot)$ 下应用 Riesz 表示定理，且变分方程 $a(x,y)=f(x)$ 恰等价于二次能量泛函 $J(v)=\frac{1}{2}a(v,v)-f(v)$ 的极小化问题（见 [[泛函分析/08_Riesz表示与变分问题/02_弱解与变分不等式#3. Dirichlet 变分原理：弱解与能量泛函极小化的等价性|08 专题定理 3.1]]）。
- **非对称情形：** 当 $a(x,y)\neq a(y,x)$ 时，由于二次型 $a(v,v)$ 的一阶变分只能反映 $a$ 的对称部分 $\frac{1}{2}(a(x,y)+a(y,x))$，非对称变分方程 $a(x,y)=f(x)$ 一般不再对应于单个实标量泛函 $J(v)$ 的极小化问题；此时 Lax-Milgram 定理超越了经典变分极值法的局限，依然保证了非对称弱解的存在唯一性。

## 5. 算子方程逼近的 Lax 型稳定性与收敛性等价原理

在求解算子方程 $Ax=b$ 时，若用一列近似算子方程 $A_nx_n=b_n$ 逼近原方程，近似解 $x_n$ 何时收敛于真解 $x$？结合 [[03_一致有界原理与极限交换#3. Banach-Steinhaus 强收敛定理（Banach 空间上：一致有界 + 稠密集收敛 $\iff$ 全空间强收敛）|上一篇讲义的一致有界原理与强收敛推广定理]]，可以在同一对 Banach 空间上建立“相容性 + 稳定性 $\iff$ 收敛性”的严格理论原型：

> [!note] 定理 5.1 算子方程逼近的稳定性与收敛性定理
> 设 $X,Y$ 是 Banach 空间，$A\in\mathcal L(X,Y)$ 与 $A_n\in\mathcal L(X,Y)$（$n\in\mathbb N$）均为具有有界逆的双射算子。假设逼近格式满足**相容性**（即在 $X$ 的某个稠密子空间 $D$ 上有 $\lim_{n\to\infty}A_nd=Ad$，且 $\sup_{n\geq 1}\|A_n\|<\infty$，从而由定理 3.1 对一切 $x\in X$ 有 $A_nx\to Ax$）。则下列两条陈述等价：
> 1. **一致稳定性：** 逆算子族的算子范数一致有界，即存在常数 $C>0$ 使得
>    $$
>    \sup_{n\geq 1}\bigl\|A_n^{-1}\bigr\|_{\mathcal L(Y,X)}\leq C<\infty;
>    $$
> 2. **解的收敛性：** 对任意满足 $\lim_{n\to\infty}b_n=b$ 的右端项序列（或对每个固定的右端项 $b_n=b\in Y$），近似方程 $A_nx_n=b_n$ 的解序列 $x_n=A_n^{-1}b_n$ 在 $X$ 中按范数收敛于真解 $x=A^{-1}b$。

**证明：**
- **$1\Longrightarrow 2$（相容性 + 稳定性 $\implies$ 收敛性）：**
  设 $\sup_n\|A_n^{-1}\|\leq C$，且 $b_n\to b$。利用代数分解 $x_n-x=A_n^{-1}(b_n-A_nx)=A_n^{-1}\bigl((b_n-b)+(Ax-A_nx)\bigr)$，直接估计可得
  $$
  \|x_n-x\|_X=\bigl\|A_n^{-1}(b_n-A_nx)\bigr\|_X
  \leq C\Bigl(\|b_n-b\|_Y+\|Ax-A_nx\|_Y\Bigr).
  $$
  当 $n\to\infty$ 时，由右端收敛 $\|b_n-b\|_Y\to 0$ 以及在固定真解 $x\in X$ 处的强收敛 $\|Ax-A_nx\|_Y\to 0$，立即得出 $\|x_n-x\|_X\to 0$！
- **$2\Longrightarrow 1$（收敛性 $\implies$ 稳定性）：**
  反之，若对每个固定的右端项 $b\in Y$，解序列 $x_n=A_n^{-1}b$ 均在 $X$ 中收敛，则有界线性算子序列 $\{A_n^{-1}\}_{n=1}^\infty\subseteq\mathcal L(Y,X)$ 在完备 Banach 空间 $Y$ 的每一点 $b\in Y$ 处均收敛（从而逐点有界）。对 Banach 空间 $Y$ 上的算子族 $\{A_n^{-1}\}$ 应用**一致有界原理（定理 1.1）**，立得 $\sup_{n\geq 1}\|A_n^{-1}\|<\infty$。$\square$

## 相关链接

- [[00_专题总览|专题总览]]
- [[03_一致有界原理与极限交换|稠密集推广与统一界]]
- [[泛函分析/08_Riesz表示与变分问题/01_Riesz表示定理|形式对应算子]]
- [[泛函分析/08_Riesz表示与变分问题/02_弱解与变分不等式|对称能量应用]]
- [[泛函分析讲义上册习题册#2.3 开映射、闭图像与共鸣定理|原书 2.3 节]]
- [[数学物理方程/05_强极值原理与第二边值问题的唯一性#5.4.4 弱形式与 Lax--Milgram 预览|强极值原理与第二边值问题的唯一性]]
