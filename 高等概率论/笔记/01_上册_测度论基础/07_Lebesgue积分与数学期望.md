---
title: "第 7 章 Lebesgue 积分与数学期望"
date: 2026-09-27
tags:
  - higher-probability
  - measure-theory
  - probability
  - integration
  - theory-note
  - chapter-07
  - source/upper-volume
aliases:
  - "Lebesgue 积分"
  - "数学期望与方差"
note_type: "chapter"
source_volume: "上册"
source_chapter: "第 7 章"
source_pages: "PDF 162–194"
source: "《测度论基础与高等概率论》"
status: "draft"
source_check: "已按原书扫描页核对积分构造、三大收敛定理和 Stieltjes 积分框架；OCR 文本存在噪声，个别公式仍需逐页图像复核"
exercise_range: "上册习题集第 7 章（7.1–7.4 节）"
content_boundary: "原书框架 + 教材式解释"
---

# 第 7 章 Lebesgue 积分与数学期望

> [!abstract] 核心问题
> 如何从简单函数出发，把积分定义到一般可测函数，并在什么条件下交换积分与极限？在概率空间上，这套积分理论就是期望、矩与方差的理论；单调收敛、Fatou 引理和控制收敛定理是贯穿后续概率极限理论的三件基本工具。

## 7.1 Lebesgue 积分的定义

### 7.1.1 非负简单函数

若 $s=\sum_{j=1}^{m}a_j\mathbf 1_{A_j}$，其中 $a_j\ge0$，$A_j\in\mathcal F$ 两两不交，则定义

$$
\int s\,d\mu=\sum_{j=1}^{m}a_j\mu(A_j).
$$

该定义与简单函数的表示方式无关：把不同表示共同细化成有限可測划分后，两边得到相同的和。若某个 $\mu(A_j)=\infty$ 且 $a_j>0$，相应积分取 $+\infty$。

### 7.1.2 非负可测函数

对可测 $f:\Omega\to[0,\infty]$，定义

$$
\int f\,d\mu=
\sup\left\{\int s\,d\mu:0\le s\le f,\ s\text{ 为非负简单可测函数}\right\}.
$$

存在简单函数列 $s_n\uparrow f$。单调收敛定理保证 $\int s_n\,d\mu\uparrow\int f\,d\mu$，因此定义确实可由简单函数逼近计算。非负函数的积分允许取 $+\infty$。

### 7.1.3 实值与复值函数

令 $f^+=\max(f,0)$、$f^- =\max(-f,0)$，则 $f=f^+-f^-$ 且 $|f|=f^++f^-$。只有当 $\int f^+d\mu$ 和 $\int f^-d\mu$ 不同时为 $+\infty$ 时，$\int f\,d\mu$ 才有定义；称 $f$ 可积，若

$$
\int |f|\,d\mu<\infty.
$$

对可积实值函数，$\int f=\int f^+-\int f^-$。对复值可测函数，定义 $\int f=\int\operatorname{Re}f+i\int\operatorname{Im}f$；其可积等价于 $\int|f|<\infty$。

## 7.2 Lebesgue 积分的性质

若 $f,g$ 可积且 $a,b\in\mathbb R$（复值情形允许 $a,b\in\mathbb C$），则

$$
\int(af+bg)\,d\mu=a\int f\,d\mu+b\int g\,d\mu.
$$

若 $f\le g$ a.e. 且两者可积，则 $\int f\le\int g$；此外 $|\int f|\le\int|f|$。若 $f=g$ a.e.，则二者同时可积或同时不可积，且在可积时积分相同。

积分还具有对集合的局部化性质：对 $A\in\mathcal F$，$\int_A f\,d\mu=\int f\mathbf 1_A\,d\mu$。特别是若 $\mu(A)=0$，则 $\int_A f=0$。反过来，非负可测函数若在每个可测集上的积分都为零，则它几乎处处为零。

### 数学期望和方差

在概率空间 $(\Omega,\mathcal F,\mathbb P)$ 上，若随机变量 $X$ 可积，定义

$$
\mathbb E X=\int X\,d\mathbb P,
\qquad \mathbb E|X|<\infty.
$$

若 $p>0$ 且 $\mathbb E|X|^p<\infty$，称 $X$ 有有限 $p$ 阶绝对矩。若 $\mathbb E X^2<\infty$，定义

$$
\operatorname{Var}(X)=\mathbb E[(X-\mathbb EX)^2]
=\mathbb E[X^2]-(\mathbb EX)^2.
$$

期望是分布的积分：若 $\mathbb P_X$ 是 $X$ 的分布，则 $\mathbb E g(X)=\int g\,d\mathbb P_X$，只要任一侧有定义。这意味着期望只由分布决定，而不依赖随机变量具体定义在哪个概率空间上。

若 $Y\ge0$ 且 $a>0$，由 $Y\ge a\mathbf1_{\{Y\ge a\}}$ 得 Markov 不等式

$$
\mathbb P(Y\ge a)\le \frac{\mathbb EY}{a}.
$$

对 $Y=(X-\mathbb EX)^2$ 应用 Markov 不等式得到 Chebyshev 不等式：若 $X$ 有有限方差，

$$
\mathbb P(|X-\mathbb EX|\ge a)\le\frac{\operatorname{Var}(X)}{a^2}.
$$

## 7.3 三大积分收敛定理

### 7.3.1 单调收敛定理

若 $0\le f_n\uparrow f$ a.e.，则

$$
\int f_n\,d\mu\uparrow\int f\,d\mu,
$$

两端允许为 $+\infty$。这是非负 Lebesgue 积分的核心收敛定理：单调增加的近似可以把极限移入积分号内。常用于把有限步骤结论推广到可数并、无穷级数及随机变量非负部分。

另有受可积函数控制的反向版本：若 $f_n\downarrow f$ a.e. 且 $f_1$ 可积，则 $\int f_n\downarrow\int f$。此处的可积控制排除了 $\infty-\infty$ 的不定式。

### 7.3.2 Fatou 引理

若 $f_n\ge0$ 可測，則

$$
\int\liminf_{n\to\infty}f_n\,d\mu
\le\liminf_{n\to\infty}\int f_n\,d\mu.
$$

证明取 $g_m=\inf_{n\ge m}f_n$。则 $g_m\uparrow\liminf f_n$，单调收敛定理给出 $\int\liminf f_n=\lim_m\int g_m\le\liminf_n\int f_n$。Fatou 引理只给出单侧不等式；没有额外控制时不能把它写成积分收敛。

### 7.3.3 控制收敛定理

若 $f_n\to f$ a.e.，并存在可积 $g\ge0$ 使 $|f_n|\le g$ a.e. 对所有 $n$ 成立，则 $f$ 可积，且

$$
\int f_n\,d\mu\longrightarrow\int f\,d\mu,
\qquad
\int|f_n-f|\,d\mu\longrightarrow0.
$$

证明要点是对非负函数 $g+f_n$ 与 $g-f_n$ 分别使用 Fatou 引理，得到积分的下极限和上极限都被 $\int f$ 夹住。再对 $2g-|f_n-f|\ge0$ 使用 Fatou 引理，得到 $\int|f_n-f|\to0$。控制函数必须可积，逐点有界或一致有界本身不足以交换极限与积分。

**常见误用。** a.e. 收敛不能单独推出期望收敛；例如在 $[0,1]$ 上取 $f_n=n\mathbf1_{(0,1/n)}$，则 $f_n\to0$ a.e.，但 $\int f_n=1$。缺少的正是统一可积控制。

## 7.4 Stieltjes 积分

### 7.4.1 Lebesgue–Stieltjes 积分

若 $F$ 是 $\mathbb R^d$ 上的 Lebesgue–Stieltjes 函数，记 $\mu_F$ 为其诱导的 Lebesgue–Stieltjes 测度，则对 Borel 可测 $g$，定义

$$
\int g(x)\,dF(x):=\int g\,d\mu_F,
$$

只要右侧存在。此处的 $dF$ 是测度积分记号，不是普通微分。对一维分布函数 $F$，这一积分就是关于相应概率分布的期望；例如 $\mathbb E g(X)=\int g(x)\,dF_X(x)$。

### 7.4.2 Riemann–Stieltjes 积分

在闭区间上，若 $F$ 单调且 $g$ 连续，则 Riemann–Stieltjes 积分 $\int g\,dF$ 存在；它由分割上的和

$$
\sum_i g(\xi_i)\bigl(F(x_i)-F(x_{i-1})\bigr)
$$

取网格趋于零的极限得到。若 $F$ 绝对连续且 $F'=h$ a.e.，则在适当端点约定下 $\int g\,dF=\int gh\,d\lambda$。Riemann–Stieltjes 积分与以 $\mu_F$ 定义的 Lebesgue–Stieltjes 积分相关，但两者的定义路径和可积条件不同，不应只因记号相同而混为一谈。

原书本节还讨论广义 Riemann–Stieltjes 积分、分部积分及其与概率分布函数的联系。具体端点若为跳跃点，须特别检查端点取值和连续点条件。

## 本章小结

- 从简单函数定义非负积分，再用正负部分定义一般实值积分；可积的准确条件是 $\int|f|<\infty$。
- 期望、矩和方差分别是随机变量的积分、绝对矩积分和中心二阶矩。
- 单调收敛定理处理单调非负逼近，Fatou 引理给出下半连续型估计，控制收敛定理提供交换极限与积分的常用充分条件。
- $dF$ 可表示由 $F$ 诱导的 Lebesgue–Stieltjes 测度；概率论中的期望常自然写成 Stieltjes 积分。

## 习题导航

- [[高等概率论/01_测度论基础与高等概率论上册习题集#7.1 Lebesgue 积分的定义|7.1 Lebesgue 积分的定义]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#7.2 Lebesgue 积分的性质|7.2 Lebesgue 积分的性质]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#7.3 三大积分收敛定理|7.3 三大积分收敛定理]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#7.4 Stieltjes 积分|7.4 Stieltjes 积分]]

## 相关链接

- [[06_几乎处处收敛与依测度收敛|第 6 章 几乎处处收敛与依测度收敛]]
- [[08_符号测度与Radon-Nikodym定理|第 8 章 符号测度与 Radon–Nikodym 定理]]
- [[09_Lebesgue空间与一致可积性|第 9 章 Lebesgue 空间与一致可积性]]
- [[00_上册总览|高等概率论上册总览]]
