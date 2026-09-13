---
title: 完备性与 Fourier 收敛
date: 2026-09-13
tags:
  - SL
  - spectral-theory
  - completeness
  - fourier-expansion
  - compact-self-adjoint
aliases:
  - SL 完备性
  - 特征函数完备性
  - Fourier 收敛
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\08_completeness.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: drafting
prerequisites:
  - "[[06_特征函数正交性与广义Fourier级数]]"
  - "[[07_自伴边界条件与Hilbert空间框架]]"
  - "[[09_Green函数预解式与紧性]]"
enduring_understanding: "特征函数系的完备性来自预解算子的紧自伴性；L² 收敛与逐点收敛是两件不同的事。"
essential_question: "为什么正则 SL 问题的特征函数一定张满整个 L²_r 空间？"
performance_evidence: "能完整复述完备性证明，能区分 L² 收敛与逐点收敛，并能正确处理 Dirichlet 正弦级数例子。"
---

# 10 完备性与 Fourier 收敛

> [!info] 本讲位置
> 模块 D：预解式与谱结构。前置：[[06_特征函数正交性与广义Fourier级数]]、
> [[07_自伴边界条件与Hilbert空间框架]]、[[09_Green函数预解式与紧性]]；
> 下一讲：11 特征值渐近与 Weyl 公式。

> [!abstract] 本讲目标
> 证明正则 SL 问题的特征函数系在带权空间 $L^2_r(a,b)$ 中完备；
> 说清 $L^2$ 收敛与逐点收敛的条件差别；给出一批例子与反例。

> [!question] 基本问题
> 为什么特征函数系“不多不少”，恰好构成 $L^2_r(a,b)$ 的一组完备正交基？

> [!note] 物理来源：热方程长期行为与谱几何
> 热方程的解 $u=\sum c_ne^{-\lambda_nt}e_n(x)$ 表明：
> 每个模态以速率 $\lambda_n$ 衰减，长时间由 $\lambda_1$ 主导，衰减率为谱隙；
> 若初始温度与第一模态正交，则衰减率变为 $\lambda_2$。
> 完备性保证任意 $f\in L^2_r$ 都能这样展开，这是谱方法的物理基础。
> 对鼓面，特征值决定鼓声频率；Weyl 定律回答“有多少模态低于给定频率”，
> 而 Kac 的“听音辨鼓”问题问：鼓声能否唯一决定鼓的形状？
> 这是后续谱几何与逆问题的入口。

## 0. 依赖检查表

写这一讲之前，先核对每个概念在哪里定义过。

| 本讲用到的概念 | 首次定义 | 本讲中的用途 |
|---|---|---|
| 带权空间 $L^2_r(a,b)$ 与内积 $(f,g)_r$ | [[06_特征函数正交性与广义Fourier级数]] | 展开所在的 Hilbert 空间 |
| 广义 Fourier 系数、Bessel 不等式、Parseval | [[06_特征函数正交性与广义Fourier级数]] | 完备性的等价刻画 |
| 算子 $A y=\frac1rLy$ 与定义域 $D(A)$ | [[06_特征函数正交性与广义Fourier级数]] | 把 SL 问题写成算子问题 |
| 自伴、对称 | [[07_自伴边界条件与Hilbert空间框架]] | $A$ 的自伴性 |
| Green 函数、预解算子、紧性 | [[09_Green函数预解式与紧性]] | 构造紧自伴预解式 $T$ |
| 紧自伴算子的谱定理 | 本讲 §2（泛函分析标准定理） | 完备性证明的核心工具 |
| 特征值渐近与 Weyl 公式 | 第 11 讲 | 逐点/一致收敛的定量估计（本讲只用定性定理） |

> [!warning] 本讲不重复定义的内容
> 以上概念都已在前置讲次中出现。若读者对 $L^2_r$、自伴性或紧预解式不熟悉，
> 先回看 [[06_特征函数正交性与广义Fourier级数]]、[[07_自伴边界条件与Hilbert空间框架]]、
> [[09_Green函数预解式与紧性]]。

## 1. 从“形式展开”到“完备性”

在 [[06_特征函数正交性与广义Fourier级数]] 中已经证明：

- 不同特征值的特征函数在 $L^2_r$ 中正交；
- 对任意 $f\in L^2_r$，Bessel 不等式成立：
  $$
  \sum_{n=0}^{\infty}|c_n|^2\le \|f\|_r^2,
  \qquad c_n=(f,e_n)_r;
  $$
- 如果特征函数系完备，则 Parseval 恒等式成立，并且
  $$
  f=\sum_{n=0}^{\infty}c_ne_n
  \quad\text{（在 }L^2_r\text{ 中）};\tag{10.1}
  $$
- 当时把“完备性”的证明路线指向了本讲。

本讲要补上的正是这一步：**证明正则 SL 问题的特征函数系确实完备**。
证明的路线是：

$$
\text{自伴性}+\text{Green 函数}
\;\Longrightarrow\;
\text{预解算子 }T\text{ 紧自伴}
\;\Longrightarrow\;
\text{紧自伴谱定理}
\;\Longrightarrow\;
\text{特征函数系完备}.
$$

## 2. 紧自伴算子的谱定理

先把核心工具陈述清楚。它是泛函分析中的标准定理，证明路线放在本讲 §2.2。

### 2.1 定理的精确陈述

> [!theorem] 紧自伴算子的谱定理
> 设 $H$ 是复 Hilbert 空间，$T:H\to H$ 是紧自伴算子。则：
> 1. $T$ 的特征值都是实数；每个非零特征值的重数是有限的；
> 2. $T$ 的非零特征值至多可数，按绝对值排列
>    $$
>    |\mu_1|\ge|\mu_2|\ge|\mu_3|\ge\cdots>0,
>    $$
>    并且 $\mu_n\to0$；
> 3. 存在由 $T$ 的特征向量组成的正交规范系 $\{e_n\}$，使得
>    $$
>    H=\ker T\oplus \overline{\operatorname{span}\{e_n\}},
>    \tag{10.2}
>    $$
>    并且对每个 $f\in H$，
>    $$
>    Tf=\sum_{n}\mu_n(f,e_n)e_n
>    \quad\text{（在 }H\text{ 中收敛）}.
>    \tag{10.3}
>    $$
> 特别地，若 $\ker T=\{0\}$，则 $\{e_n\}$ 是 $H$ 的完备正交规范基。

> [!note] 为什么需要紧性
> 一般的自伴算子可以有连续谱，特征向量不足以张满 Hilbert 空间。
> 紧性是“特征值只能趋于 0、特征向量张满空间”的关键。

### 2.2 谱定理的证明路线

以下五步给出定理的完整证明思路。每一步都可以独立复核。

**第一步：最大特征值一定存在。**
对自伴算子 $T$，有
$$
\|T\|=\sup_{\|f\|=1}|(Tf,f)|.
\tag{10.4}
$$
记右端为 $M$。若 $T\neq0$，取单位向量列 $f_k$ 使
$(Tf_k,f_k)\to M$（必要时把 $T$ 换成 $-T$）。由 $T$ 紧，
$\{Tf_k\}$ 有收敛子列，仍记为 $Tf_k\to w$。利用
$$
\|Tf_k-Mf_k\|^2
=\|Tf_k\|^2-2M(Tf_k,f_k)+M^2
\le M^2-2M(Tf_k,f_k)+M^2\to0,
$$
可知 $f_k\to e:=w/M$。于是 $\|e\|=1$ 且 $Te=Me$。
这样得到了模最大的特征值 $\mu_1=M$ 与对应的单位特征向量 $e_1$。

**第二步：正交补不变。**
令 $H_1=\{e_1\}^\perp$。对 $f\in H_1$，
$$
(Tf,e_1)=(f,Te_1)=\mu_1(f,e_1)=0,
$$
故 $T(H_1)\subset H_1$。把 $T$ 限制到 $H_1$ 上，仍是紧自伴算子。

**第三步：迭代。**
在 $H_1$ 上重复第一步，得到 $e_2$ 与 $\mu_2$，满足
$|\mu_1|\ge|\mu_2|>0$。继续下去，得到正交规范列
$\{e_n\}$ 与非零实数 $\mu_n$，满足
$$
Te_n=\mu_n e_n,
\qquad
|\mu_1|\ge|\mu_2|\ge\cdots>0.
$$

**第四步：$\mu_n\to0$ 且重数有限。**
若非零特征值满足 $|\mu_n|\ge\varepsilon>0$ 对无穷多个 $n$ 成立，
则当 $n\neq m$ 时
$$
\|Te_n-Te_m\|^2=|\mu_n|^2+|\mu_m|^2\ge2\varepsilon^2.
$$
这与 $T$ 紧（单位球的像完全有界）矛盾，故 $\mu_n\to0$。
重数有限：若 $E_\mu$ 是特征值 $\mu\neq0$ 的特征子空间，则 $T$ 把
$E_\mu$ 的单位球映成半径 $|\mu|$ 的球；由 $T$ 紧，这个球完全有界，
故 $E_\mu$ 有限维。

**第五步：分解与展开。**
取一个极大的正交规范特征向量族 $\{e_n\}$（Zorn 引理保证存在），
并记
$$
K=\left(\overline{\operatorname{span}\{e_n\}}\right)^\perp.
$$
由第二步，$K$ 是 $T$-不变子空间。若 $T|_K\neq0$，则由第一步，
$T|_K$ 有特征向量，这与 $\{e_n\}$ 的极大性矛盾。故 $T|_K=0$，
即 $K\subset\ker T$。因此
$$
H=\ker T\oplus\overline{\operatorname{span}\{e_n\}}.
$$
对任意 $f$，写 $f=\sum(f,e_n)e_n+g$，其中 $g\in K\subset\ker T$，
则
$$
Tf=\sum_n\mu_n(f,e_n)e_n.
$$
证明完成。 $\square$

> [!tip] 可引用的标准教材
> 紧自伴算子谱定理的完整证明可参见：
> - M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*，定理 VI.16；
> - G. Teschl, *Mathematical Methods in Quantum Mechanics*，第 2 章；
> - J. Weidmann, *Linear Operators in Hilbert Spaces*，第 6 章。

## 3. 正则 SL 问题的自伴性与紧预解式

现在把谱定理用到 SL 问题上。设正则 SL 问题
$$
-(p y')'+q y=\lambda r y,
\qquad x\in(a,b),
$$
满足
$$
p\in C^1[a,b],\quad p>0,\quad q,r\in C[a,b],\quad r>0,
$$
以及分离型（或一般自伴）边界条件。令
$$
H=L^2_r(a,b),
\qquad
A y=\frac1r Ly,
$$
定义域
$$
D(A)=\left\{y\in C^2[a,b]:\ y\text{ 满足边界条件},\ Ly\in L^2_r(a,b)\right\}.
$$

### 3.1 $A$ 是对称的且有一个实预解点

[[07_自伴边界条件与Hilbert空间框架]] 已经证明 $A$ 是对称的：
$$
(Au,v)_r=(u,Av)_r,
\qquad
u,v\in D(A).
\tag{10.5}
$$
[[09_Green函数预解式与紧性]] 证明了：对不在谱中的 $\lambda$，
$$
R_\lambda=(A-\lambda I)^{-1}
$$
可以用 Green 函数表示，并且当 $\lambda\in\mathbb R$ 时 $R_\lambda$ 自伴。
特别地，取 $\lambda_0$ 充分小（小于 $A$ 的下界），则 $A-\lambda_0I$ 可逆，
并且
$$
T:=R_{\lambda_0}=(A-\lambda_0I)^{-1}:H\to H
\tag{10.6}
$$
是**紧自伴**算子。

这里补一个之前省略的细节：**$A$ 不只是对称的，它实际上自伴**。

> [!proposition] 对称性 + 实预解点 $\Rightarrow$ 自伴
> 设 $A$ 是对称算子，且存在实数 $\lambda_0$ 使 $A-\lambda_0I$
> 是从 $D(A)$ 到 $H$ 的双射。则 $A$ 自伴。

**证明** 对称性给出 $A\subset A^*$。任取 $g\in D(A^*)$，令
$h=(A^*-\lambda_0I)g\in H$。因为 $A-\lambda_0I$ 满射，
存在 $f\in D(A)$ 使
$$
(A-\lambda_0I)f=h.
$$
于是
$$
(A^*-\lambda_0I)(g-f)=0.
$$
对任意 $v\in D(A)$，
$$
(g-f,(A-\lambda_0I)v)
=((A^*-\lambda_0I)(g-f),v)=0.
$$
由于 $A-\lambda_0I$ 满射，$(g-f)\perp H$，故 $g=f\in D(A)$。
因此 $D(A^*)=D(A)$，$A$ 自伴。 $\square$

> [!note] 为什么取 $\lambda_0$ 充分小
> 正则 SL 算子 $A$ 下方有界。取 $\lambda_0$ 小于下界时，
> $A-\lambda_0I$ 是正算子，$T$ 是正紧自伴算子，并且 $\ker T=\{0\}$。

### 3.2 完备性定理

> [!theorem] 正则 SL 问题的完备性
> 设 $A$ 是上述正则 SL 算子。则存在一组由 $A$ 的特征函数组成的
> 正交规范系 $\{e_n\}_{n=0}^{\infty}$，使它是 $H=L^2_r(a,b)$ 的
> 完备正交规范基。
> 等价地：若 $f\in L^2_r(a,b)$ 满足
> $$
> (f,e_n)_r=0
> \qquad\text{对所有 }n,
> $$
> 则 $f=0$。

**证明** 取 $\lambda_0$ 充分小，令 $T=(A-\lambda_0I)^{-1}$。

1. 由 §3.1，$T$ 紧、自伴、单射（$\ker T=\{0\}$）。
2. 对 $T$ 使用紧自伴算子谱定理，得到 $H$ 的一组由 $T$ 的特征向量
   组成的完备正交规范基 $\{e_n\}$。
3. 若 $Te_n=\mu_ne_n$，$\mu_n\neq0$，则
   $$
   e_n=\mu_n(A-\lambda_0I)e_n,
   $$
   即
   $$
   Ae_n=\left(\lambda_0+\frac1{\mu_n}\right)e_n.
   $$
   所以 $e_n$ 是 $A$ 的特征函数。
   反过来，若 $Ae=\lambda e$，则 $Te=(\lambda-\lambda_0)^{-1}e$。
4. 因此 $\{e_n\}$ 正是 $A$ 的特征函数系，并且它在 $H$ 中完备。
   若 $f$ 与所有 $e_n$ 正交，则由完备性 $f=0$。 $\square$

> [!corollary] 特征值的排序与增长
> 取 $\lambda_0$ 小于 $A$ 的下界时，$T$ 的特征值满足
> $$
> \mu_0\ge\mu_1\ge\mu_2\ge\cdots>0,
> \qquad
> \mu_n\to0.
> $$
> 于是 $A$ 的特征值
> $$
> \lambda_n=\lambda_0+\frac1{\mu_n}
> $$
> 构成严格递增序列，并且
> $$
> \lambda_n\to+\infty.
> $$

> [!warning] 记号约定
> $A$ 的特征值是否从 $\lambda_0$ 开始编号取决于边界条件。
> Neumann 问题有零特征值 $\lambda_0=0$；Dirichlet 问题从 $\lambda_1$ 开始。
> 本讲的公式对两种编号都成立，只需把求和指标理解为实际出现的指标集。

## 4. Bessel、Parseval 与完备性的等价刻画

### 4.1 三个等价命题

> [!theorem] 完备性的等价刻画
> 设 $\{e_n\}$ 是复 Hilbert 空间 $H$ 中的正交规范系。则下列命题等价：
> 1. $\{e_n\}$ 完备：若 $f\perp e_n$ 对一切 $n$ 成立，则 $f=0$；
> 2. 对每个 $f\in H$，
>    $$
>    f=\sum_{n}(f,e_n)e_n
>    \quad\text{（在 }H\text{ 中收敛）};
>    $$
> 3. 对每个 $f\in H$，Parseval 恒等式成立：
>    $$
>    \|f\|^2=\sum_{n}|(f,e_n)|^2.
>    $$

**证明** $(2)\Rightarrow(3)$：若 $f$ 等于级数的和，由范数的连续性，
$$
\|f\|^2
=\lim_{N\to\infty}\left\|\sum_{n=0}^N(f,e_n)e_n\right\|^2
=\lim_{N\to\infty}\sum_{n=0}^N|(f,e_n)|^2
=\sum_{n=0}^\infty|(f,e_n)|^2.
$$

$(3)\Rightarrow(1)$：若 $f\perp e_n$ 对一切 $n$，则所有系数为零，
Parseval 给出 $\|f\|^2=0$，故 $f=0$。

$(1)\Rightarrow(2)$：由 Bessel 不等式，部分和
$$
S_N=\sum_{n=0}^N(f,e_n)e_n
$$
满足
$$
\|S_M-S_N\|^2=\sum_{n=N+1}^M|(f,e_n)|^2\to0,
$$
故 $S_N$ 在 $H$ 中收敛到某个 $g$。对每个 $m$，
$$
(f-g,e_m)=\lim_{N\to\infty}(f-S_N,e_m)=0,
$$
故 $f-g$ 与所有 $e_n$ 正交。由完备性 $f-g=0$，即 $f=g$。
$\square$

### 4.2 对 SL 特征函数系的应用

由 §3 的完备性定理与 §4.1，立即可得：

> [!corollary] 特征展开
> 设 $\{e_n\}$ 是正则 SL 问题的归一化特征函数系。则对任意
> $f\in L^2_r(a,b)$，
> $$
> f=\sum_{n=0}^{\infty}(f,e_n)_r\,e_n
> \quad\text{（在 }L^2_r\text{ 中）},
> \tag{10.7}
> $$
> 并且
> $$
> \|f\|_r^2=\sum_{n=0}^{\infty}|(f,e_n)_r|^2.
> \tag{10.8}
> $$

> [!important] 完备性不等于逐点收敛
> (10.7) 是无条件成立的 $L^2_r$ 收敛，但它**没有**说级数在每一点
> 收敛到 $f(x)$。逐点收敛需要额外的正则性条件，见 §5。

## 5. $L^2$ 收敛与逐点收敛

### 5.1 两种收敛的定义

设 $f\in L^2_r(a,b)$，$c_n=(f,e_n)_r$，部分和
$$
S_N(x)=\sum_{n=0}^N c_ne_n(x).
$$

- **$L^2_r$ 收敛**：
  $$
  \|f-S_N\|_r=\left(\int_a^b r(x)|f(x)-S_N(x)|^2dx\right)^{1/2}\to0.
  $$
- **逐点收敛**：对每个固定的 $x$，$S_N(x)\to f(x)$。
- **一致收敛**：$\sup_{x\in[a,b]}|f(x)-S_N(x)|\to0$。

$L^2$ 收敛只控制“平均误差”，不控制个别点。下面给出一个标准例子。

> [!example] 阶梯函数：$L^2$ 收敛但端点不连续
> 在 $[0,\pi]$ 上取
> $$
> f(x)=\begin{cases}1,&0<x<\pi,\\0,&x=0\text{ 或 }x=\pi.\end{cases}
> $$
> 它的正弦级数为（见 §6.2）
> $$
> f(x)\sim\sum_{k=0}^{\infty}\frac{4}{(2k+1)\pi}\sin((2k+1)x).
> $$
> 由 Parseval，该级数在 $L^2(0,\pi)$ 中收敛到 $f$。
> 在每点 $x\in(0,\pi)$ 也收敛到 $1$；但在端点 $0,\pi$ 处收敛到 $0$。
> 因此它在 $[0,\pi]$ 上不一致收敛：一致极限必须连续，而 $f$ 不连续。

### 5.2 Dirichlet 正弦级数的逐点收敛定理

先处理标架问题：$[0,\pi]$，$p=r=1$，$q=0$，Dirichlet 边界条件。
此时
$$
e_n(x)=\sqrt{\frac2\pi}\sin(nx),
\qquad n=1,2,\dots
$$
是 $L^2(0,\pi)$ 的完备正交规范基（由 §3 的完备性定理）。
对 $f\in L^2(0,\pi)$，正弦系数为
$$
c_n=(f,e_n)=\sqrt{\frac2\pi}\int_0^\pi f(t)\sin(nt)\,dt.
$$

> [!theorem] Dirichlet–Jordan（正弦级数形式）
> 设 $f$ 在 $[0,\pi]$ 上逐段 $C^1$。则对每个 $x\in(0,\pi)$，
> $$
> \sum_{n=1}^{\infty}c_ne_n(x)
> =\frac{f(x+)+f(x-)}2,
> \qquad
> c_n=(f,e_n)_r,\quad e_n(x)=\sqrt{\frac2\pi}\sin(nx).
> $$
> 在 $x=0$ 与 $x=\pi$ 处，级数收敛到 $0$。
> 若进一步要求 $f$ 连续、$f(0)=f(\pi)=0$，则收敛在 $[0,\pi]$ 上一致。

**证明路线** 把 $f$ 作奇延拓到 $(-\pi,\pi)$，再以 $2\pi$ 为周期延拓，
得到函数 $F$。则 $f$ 的正弦级数正好是 $F$ 的 Fourier 级数。
$F$ 在 $\mathbb R$ 上逐段 $C^1$、有界变差，由经典的
Dirichlet–Jordan 定理，$F$ 的 Fourier 级数在每点 $x$ 收敛到
$\frac{F(x+)+F(x-)}2$。
- 对 $x\in(0,\pi)$，$F(x)=f(x)$，故极限是 $\frac{f(x+)+f(x-)}2$。
- 在 $x=0,\pi$ 处，$F$ 的奇延拓使左右极限互为相反数，
  平均值为 $0$。
- 若 $f$ 连续且 $f(0)=f(\pi)=0$，则 $F$ 在圆周上连续且逐段 $C^1$，
  经典定理的“连续时有界变差函数”版本给出一致收敛。 $\square$

> [!tip] 经典 Dirichlet–Jordan 定理
> 若 $F$ 是 $2\pi$-周期函数，在 $[-\pi,\pi]$ 上有界变差
> （总变差有限；逐段 $C^1$ 函数都有界变差），则
> $F$ 的 Fourier 级数在每点 $x$ 收敛到
> $\frac{F(x+)+F(x-)}2$；若 $F$ 连续，则收敛一致。
> 完整证明可参见 A. Zygmund, *Trigonometric Series*, 第 2 章；
> 或 E. C. Titchmarsh, *Eigenfunction Expansions*, 第 1 章。

### 5.3 一般正则 SL 问题的展开定理

对一般系数 $p,q,r$，逐点收敛的证明更复杂，但结论形式相同。

> [!theorem] Sturm–Liouville 展开定理（引用）
> 设正则自伴 SL 问题满足通常的正则性假设，$f$ 在 $[a,b]$ 上逐段 $C^1$
> 且满足该问题的边界条件（或满足相应的端点匹配条件）。
> 则特征函数展开
> $$
> \sum_{n=0}^{\infty}c_ne_n(x),
> \qquad c_n=(f,e_n)_r
> $$
> 在每个内点 $x\in(a,b)$ 收敛到
> $\frac{f(x+)+f(x-)}2$。
> 若 $f\in C^1[a,b]$ 且满足边界条件，则收敛在 $[a,b]$ 上一致。

**证明路线** 用 Green 函数把部分和写成积分算子：
$$
S_N(x)=\int_a^b G_N(x,t)f(t)r(t)\,dt,
$$
其中谱核
$$
G_N(x,t)=\sum_{n=0}^N e_n(x)e_n(t)
$$
满足与 Green 函数类似的跳量条件。利用 $G_N$ 的局部化估计
与 Riemann–Lebesgue 引理（$L^1$ 函数的 Fourier 系数趋于 $0$），可以把 $S_N(x)-f(x)$ 写成
一个在 $x$ 附近局部化、其余部分振荡趋于零的积分。
对逐段 $C^1$ 的 $f$，局部部分给出
$\frac{f(x+)+f(x-)}2$，振荡部分趋于零。
完整证明见 E. C. Titchmarsh, *Eigenfunction Expansions*, 第 1 章；
或 A. Zettl, *Sturm–Liouville Theory*, 第 16 章及其参考文献。

> [!warning] 边界条件与端点行为
> 若 $f$ 不满足边界条件，级数在端点处通常收敛到边界值的平均或
> 某种延拓值，而不一定收敛到 $f(a)$ 或 $f(b)$。
> 例如 Dirichlet 正弦级数在 $0,\pi$ 处总收敛到 $0$。

## 6. 例子与反例

### 6.1 Dirichlet 正弦级数：$f(x)=x$

取 $[0,\pi]$，$f(x)=x$。正弦系数为
$$
b_n=\frac2\pi\int_0^\pi t\sin(nt)\,dt
=\frac{2(-1)^{n+1}}n.
$$
因此
$$
x\sim 2\sum_{n=1}^{\infty}\frac{(-1)^{n+1}}{n}\sin(nx),
\qquad 0<x<\pi.
\tag{10.9}
$$
在 $x=0,\pi$ 处，级数收敛到 $0$（不是 $f$ 的端点值）。
由 Parseval 恒等式，
$$
\int_0^\pi x^2dx=\frac{\pi^3}3
=\frac{\pi}{2}\sum_{n=1}^{\infty}b_n^2
=2\pi\sum_{n=1}^{\infty}\frac1{n^2},
$$
故
$$
\sum_{n=1}^{\infty}\frac1{n^2}=\frac{\pi^2}{6}.
\tag{10.10}
$$
在 (10.9) 中取 $x=\pi/2$：
$$
\frac\pi2=2\sum_{n=1}^{\infty}\frac{(-1)^{n+1}}{n}\sin\frac{n\pi}2
=2\sum_{k=0}^{\infty}\frac{(-1)^k}{2k+1},
$$
故
$$
\sum_{k=0}^{\infty}\frac{(-1)^k}{2k+1}=\frac\pi4.
\tag{10.11}
$$

### 6.2 阶梯函数与 Gibbs 现象

取
$$
f(x)=\begin{cases}1,&0<x<\pi,\\0,&x=0\text{ 或 }x=\pi.\end{cases}
$$
正弦系数只在奇数 $n$ 非零：
$$
b_n=\frac2\pi\int_0^\pi\sin(nt)\,dt
=\frac{2}{n\pi}(1-\cos n\pi)
=\begin{cases}
\dfrac4{n\pi},&n\text{ 为奇数},\\[2mm]
0,&n\text{ 为偶数}.
\end{cases}
$$
于是
$$
f(x)\sim\frac4\pi\sum_{k=0}^{\infty}\frac{\sin((2k+1)x)}{2k+1}.
\tag{10.12}
$$
由 Dirichlet–Jordan 定理，(10.12) 在 $0<x<\pi$ 收敛到 $1$，
在端点收敛到 $0$。部分和 $S_N$ 是连续函数，但极限函数不连续，
所以收敛不一致。

在端点附近，部分和会出现约 $8.95\%$ 的过冲，称为 **Gibbs 现象**。
这说明即使级数逐点收敛，也可能在跳跃点附近产生一致的振荡误差。
详见 Zygmund, *Trigonometric Series*, 第 3 章。

### 6.3 反例：连续函数的 Fourier 级数可以逐点发散

$L^2$ 完备性只保证 $L^2$ 收敛，不能推出对每个连续函数都逐点收敛。
经典反例是 du Bois-Reymond（1873）构造的连续 $2\pi$-周期函数，
它的 Fourier 级数在某一点发散。因此：

- “特征函数系在 $L^2_r$ 中完备”是正确的；
- “对任意连续 $f$，特征展开在每点收敛到 $f$”是错误的；
- 需要额外的正则性（逐段 $C^1$、有界变差等）才能得到逐点收敛。

## 7. 与项目文档的联系

本讲的完备性证明是模块 3 左定空间完备性文档的**模型证明**：

- `SL_h2_completeness_proof.pdf`：在更强范数空间 $H^2$ 中证明完备性；
- `SL_h3_completeness_proof.pdf`：$H^3$ 完备性；
- `SL_hs_orthogonal_systems_proof.pdf`：一般 $H^s$ 的正交系与完备性。

这些文档的抽象结构与本讲相同：
**紧嵌入 + 左定算子 + 自伴谱定理**。
区别在于：
- 本讲的空间是 $L^2_r$，证明已由本讲给出；
- 项目文档处理的是尺度空间 $H^s=D(A^{s/2})$ 中的完备性，
  需要额外的插值与紧嵌入估计，属于左定理论模块（21–26 讲）。

> [!warning] 证据分层
> 本讲的标准理论按 `STRICT` 处理（紧自伴谱定理作为泛函分析标准定理引用）；
> 项目文档中的结论按各自审计状态标注，不在本讲混用。

## 参考

> [!info] 标准参考与延伸阅读
> - A. Zettl, *Sturm–Liouville Theory*, AMS, 2005, Ch. 4 §4.11–§4.12（Green 核算子、
>   有限实谱），Ch. 16（展开定理文献路线）。
> - G. Teschl, *Ordinary Differential Equations and Dynamical Systems*, AMS, 2012,
>   第 5 章 Sturm–Liouville 理论。
> - E. C. Titchmarsh, *Eigenfunction Expansions Associated with Second-Order
>   Differential Equations, Part I*, Oxford, 1962, 第 1 章。
> - M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*,
>   定理 VI.16（紧自伴谱定理）。
> - A. Zygmund, *Trigonometric Series*, 3rd ed., Cambridge, 2002,
>   第 2、3 章（Dirichlet–Jordan 定理与 Gibbs 现象）。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

紧自伴预解式是完备性的分析根源：
$$
\text{Green 函数}\Rightarrow \text{紧自伴预解式 }T
\Rightarrow \text{紧自伴谱定理}
\Rightarrow \text{特征函数系构成 }L^2_r\text{ 的完备正交基}.
$$
$L^2$ 收敛是无条件成立的；逐点收敛需要逐段 $C^1$ 或更强的正则性，
且端点与跳跃点需要单独讨论。

## 习题

> [!question] 10.1
> 设 $\{e_n\}$ 是复 Hilbert 空间 $H$ 中的正交规范系。证明：
> $\{e_n\}$ 完备当且仅当对一切 $f\in H$，Parseval 恒等式成立。

> [!question] 10.2
> 补全紧自伴算子谱定理第一步的证明：证明自伴算子 $T$ 满足
> $$
> \|T\|=\sup_{\|f\|=1}|(Tf,f)|.
> $$

> [!question] 10.3
> 对 Dirichlet 问题
> $$
> -y''=\lambda y,\qquad y(0)=y(\pi)=0,
> $$
> 把 $f(x)=x$ 展开为正弦级数，并用 Parseval 恒等式证明
> $\sum_{n=1}^\infty 1/n^2=\pi^2/6$；再取 $x=\pi/2$ 推出
> $\sum_{k=0}^\infty (-1)^k/(2k+1)=\pi/4$。

> [!question] 10.4
> 设 $T=(A-\lambda_0I)^{-1}$ 是正则 SL 问题的预解算子。
> 证明：$T$ 的特征向量与 $A$ 的特征函数相同，特征值互为倒数平移关系。

> [!question] 10.5
> 证明紧自伴算子的每个非零特征值重数有限，且非零特征值只能以 $0$ 为聚点。

> [!question] 10.6
> 对阶梯函数
> $$
> f(x)=\begin{cases}1,&0<x<\pi,\\0,&x=0\text{ 或 }x=\pi,\end{cases}
> $$
> 计算其正弦级数，并证明该级数在 $[0,\pi]$ 上不一致收敛。
> 解释 Gibbs 现象与端点跳跃的关系。

> [!question] 10.7
> 设 $f\in C^2[0,\pi]$ 且 $f(0)=f(\pi)=0$。证明其正弦系数满足
> $|b_n|\le C/n^2$，从而正弦级数在 $[0,\pi]$ 上绝对且一致收敛。

> [!success]- 解答
> **10.1** 由 §4.1：若 Parseval 成立且 $f\perp e_n$ 对一切 $n$，
> 则 $\|f\|^2=0$，故 $f=0$，完备性成立。
> 反之若 $\{e_n\}$ 完备，则 §4.1 已证明 Parseval 成立。
>
> **10.2** 记
> $$
> M=\sup_{\|f\|=1}|(Tf,f)|.
> $$
> 由 Cauchy–Schwarz，$M\le\|T\|$。反过来，对 $\|f\|=\|g\|=1$，
> 用极化恒等式
> $$
> 4\operatorname{Re}(Tf,g)
> =(T(f+g),f+g)-(T(f-g),f-g),
> $$
> 得
> $$
> 4|(Tf,g)|
> \le M(\|f+g\|^2+\|f-g\|^2)
> =2M(\|f\|^2+\|g\|^2)=4M.
> $$
> 取 $g=Tf/\|Tf\|$（若 $Tf\neq0$）得 $\|Tf\|\le M$，
> 故 $\|T\|\le M$。结合两者得 $\|T\|=M$。
>
> **10.3** 正弦系数为
> $$
> b_n=\frac2\pi\int_0^\pi t\sin(nt)\,dt=\frac{2(-1)^{n+1}}n.
> $$
> Parseval：
> $$
> \frac{\pi^3}3=\frac{\pi}{2}\sum_{n=1}^\infty\frac4{n^2}
> =2\pi\sum_{n=1}^\infty\frac1{n^2},
> $$
> 故 $\sum1/n^2=\pi^2/6$。在 $x=\pi/2$ 取级数：
> $$
> \frac\pi2=2\sum_{n=1}^\infty\frac{(-1)^{n+1}}n\sin\frac{n\pi}2
> =2\sum_{k=0}^\infty\frac{(-1)^k}{2k+1},
> $$
> 故 $\sum(-1)^k/(2k+1)=\pi/4$。
>
> **10.4** 若 $Te_n=\mu_ne_n$，$\mu_n\neq0$，则
> $$
> e_n=\mu_n(A-\lambda_0I)e_n
> \quad\Longrightarrow\quad
> Ae_n=\left(\lambda_0+\frac1{\mu_n}\right)e_n.
> $$
> 反过来，若 $Ae=\lambda e$，则
> $$
> (A-\lambda_0I)e=(\lambda-\lambda_0)e,
> \qquad
> Te=(\lambda-\lambda_0)^{-1}e.
> $$
> 因此特征向量相同，特征值满足
> $$
> \mu_n=\frac1{\lambda_n-\lambda_0}.
> $$
>
> **10.5** 设 $E_\mu$ 是紧自伴算子 $T$ 对应于 $\mu\neq0$ 的特征子空间。
> 对 $e\in E_\mu$，$\|e\|=1$，有 $Te=\mu e$。
> 因 $T$ 紧，$T(E_\mu\cap\{ \|e\|=1\})$ 完全有界；
> 而它就是 $E_\mu$ 中半径为 $|\mu|$ 的球面，故 $E_\mu$ 有限维。
> 若存在无穷多个特征值 $\mu_n$ 满足 $|\mu_n|\ge\varepsilon>0$，
> 取对应单位正交特征向量 $e_n$，则
> $$
> \|Te_n-Te_m\|^2=|\mu_n|^2+|\mu_m|^2\ge2\varepsilon^2
> \qquad(n\neq m),
> $$
> 与 $T$ 紧（单位球的像完全有界）矛盾。故非零特征值只能以 $0$ 为聚点。
>
> **10.6** 正弦系数
> $$
> b_n=\frac2\pi\int_0^\pi\sin(nt)\,dt
> =\frac{2(1-\cos n\pi)}{n\pi}
> =\begin{cases}\dfrac4{n\pi},&n\text{ 为奇数},\\[2mm]0,&n\text{ 为偶数}.\end{cases}
> $$
> 故级数为
> $$
> \frac4\pi\sum_{k=0}^\infty\frac{\sin((2k+1)x)}{2k+1}.
> $$
> 由 Dirichlet–Jordan 定理，它在 $0<x<\pi$ 逐点收敛到 $1$，
> 在 $x=0,\pi$ 收敛到 $0$。
> 若它在 $[0,\pi]$ 上一致收敛，则极限函数连续（一致极限保持连续性），
> 但极限函数在端点跳跃，矛盾。因此不一致收敛。
> 端点附近的过冲约 $8.95\%$，即 Gibbs 现象；它来自跳跃不连续
> 与正弦级数的振荡核。
>
> **10.7** 由 $f(0)=f(\pi)=0$，分部积分一次：
> $$
> \int_0^\pi f(t)\sin(nt)\,dt
> =-\frac{f(t)\cos(nt)}n\Big|_0^\pi
> +\frac1n\int_0^\pi f'(t)\cos(nt)\,dt
> =\frac1n\int_0^\pi f'(t)\cos(nt)\,dt.
> $$
> 再分部积分一次，并用 $f'(0),f'(\pi)$ 有界：
> $$
> \int_0^\pi f'(t)\cos(nt)\,dt
> =\frac{f'(t)\sin(nt)}n\Big|_0^\pi
> -\frac1n\int_0^\pi f''(t)\sin(nt)\,dt
> =O\!\left(\frac1n\right).
> $$
> 因此
> $$
> |b_n|=\frac2\pi\left|\int_0^\pi f(t)\sin(nt)\,dt\right|
> \le\frac{C}{n^2}.
> $$
> 于是 $\sum|b_n|<+\infty$，由 Weierstrass 判别法，
> 正弦级数在 $[0,\pi]$ 上绝对且一致收敛。
