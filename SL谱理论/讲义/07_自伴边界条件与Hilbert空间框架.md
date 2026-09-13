---
title: 自伴边界条件与 Hilbert 空间框架
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - self-adjoint
  - boundary-conditions
  - hilbert-space
aliases:
  - 自伴边界条件
  - SL 算子
  - Sturm-Liouville 算子
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\05_self_adjoint.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[06_特征函数正交性与广义Fourier级数]]"
---

# 07 自伴边界条件与 Hilbert 空间框架

> [!info] 本讲位置
> 模块 C：正交展开与自伴框架。前置：[[06_特征函数正交性与广义Fourier级数]]；下一讲：[[08_特征值的变分刻画与单调性]]。


> [!abstract] 本节目标
> 把 SL 边值问题写成 Hilbert 空间中的自伴算子问题。核心结论是：
> 在分离型实边界条件下，SL 算子关于带权内积
> $$
> (u,v)_r=\int_a^b r(x)u(x)v(x)\,dx
> $$
> 是对称的；进一步，正则 SL 问题的预解式是紧的，因此谱是离散实特征值，
> 特征函数系构成完备正交系。

## 为什么需要自伴性

前几节主要用初等方法研究相位和零点。若要对特征值做变分和优化，必须知道：

- 特征值都是实数；
- 不同特征值的特征函数正交；
- 特征函数系是完备的；
- 预解算子是紧的，谱没有连续部分。

这些性质统一来自“自伴算子”这一结构。本节先证明对称性，再说明紧预解式。

## Lagrange 恒等式

定义 SL 算子

$$
L u=-(p(x)u')'+q(x)u.
$$

设 $u,v$ 是复值 $C^2$ 函数。由乘积求导公式，

$$
\overline{v}Lu-u\overline{Lv}
=-\overline{v}(pu')'+u(p\overline{v'}')'
=\frac{d}{dx}\Bigl[p\bigl(u\overline{v'}-u'\overline{v}\bigr)\Bigr].
$$

这就是 Lagrange 恒等式。定义边界双线性形式

$$
[u,v](x):=p(x)\bigl(u(x)\overline{v'(x)}-u'(x)\overline{v(x)}\bigr).
$$

对区间 $[a,b]$ 积分得到 Green 公式：

$$
\int_a^b\Bigl(\overline{v}Lu-u\overline{Lv}\Bigr)dx
=[u,v](b)-[u,v](a).
$$

> [!note] 准导数记号
> 在一般 $p$ 下，常把
> $$
> y^{[1]}:=p y'
> $$
> 称为 $y$ 的准导数。边界形式 $[u,v]$ 与准导数直接相关。

## 分离型边界条件

最简单的边界条件是两端各给一个实线性条件：

$$
K y(a)-L y'(a)=0,\qquad M y(b)+N y'(b)=0,
$$

其中

$$
K^2+L^2>0,\qquad M^2+N^2>0.
$$

为了与准导数匹配，也可写成

$$
K y(a)-L p(a)y'(a)=0,\qquad
M y(b)+N p(b)y'(b)=0.
$$

实际上，只要 $p(a),p(b)>0$，把常数重新命名，两种写法可以互相转化。
本节后文统一使用准导数形式。

> [!example] 常见边界条件
> - **Dirichlet**：$y(a)=y(b)=0$，即 $L=N=0$。
> - **Neumann**：$y'(a)=y'(b)=0$，即 $K=M=0$。
> - **Robin**：$y'(a)=h_a y(a)$，$y'(b)=-h_b y(b)$；
>   写成准导数形式时把 $p$ 吸收进 $h_a,h_b$ 即可。
> - **周期/反周期**：不属于分离型，但也是自伴边界条件。

## 对称性定理

在带权 Hilbert 空间

$$
L^2_r(a,b)=\left\{u:\int_a^b r|u|^2<\infty\right\},
\qquad
(u,v)_r=\int_a^b r u\overline{v}\,dx
$$

上定义算子

$$
A y=\frac{1}{r}L y,
$$

其定义域为满足上述边界条件、且 $L y\in L^2_r$ 的函数全体。

> [!theorem] 对称性
> 对任意 $u,v\in D(A)$，
> $$
> (Au,v)_r=(u,Av)_r.
> $$

**证明** 由定义

$$
(Au,v)_r=\int_a^b (Lu)\overline{v}\,dx,
\qquad
(u,Av)_r=\int_a^b u\overline{Lv}\,dx.
$$

两式相减，并用 Green 公式：

$$
(Au,v)_r-(u,Av)_r
=\int_a^b\Bigl((Lu)\overline{v}-u\overline{Lv}\Bigr)dx
=[u,v](b)-[u,v](a).
$$

在左端点，$u,v$ 都满足

$$
K u(a)-L p(a)u'(a)=0,\qquad
K v(a)-L p(a)v'(a)=0.
$$

若 $K\neq0$ 且 $L\neq0$，则 $u(a),v(a)$ 分别与
$p(a)u'(a),p(a)v'(a)$ 成比例，故
$u(a)\overline{p(a)v'(a)}-p(a)u'(a)\overline{v(a)}=0$。
若 $K\neq0$ 且 $L=0$，则 $u(a)=v(a)=0$，直接得 $[u,v](a)=0$。
若 $K=0$，则 $L\neq0$，条件化为 $p(a)u'(a)=p(a)v'(a)=0$，
同样有 $[u,v](a)=0$。右端点同理，因此

$$
[u,v](b)-[u,v](a)=0.
$$

所以 $(Au,v)_r=(u,Av)_r$。 $\square$

> [!important] 对称与自伴
> 上面的论证给出的是**对称性**。在正则 SL 情形，定义域选得足够大，
> 对称算子实际上是自伴的。自伴性的完整证明需要算子图范数闭包与边界三元组，
> 此处从略；对讲义使用来说，对称性加上紧预解式已经足够推出离散谱。

## 紧预解式与谱结构

设 $\lambda_0$ 不在 $A$ 的谱中。由于 $A$ 有下界、$q$ 连续且有界，
$L+\lambda_0 r$ 的逆算子

$$
R_{\lambda_0}:L^2_r(a,b)\to L^2_r(a,b)
$$

可以用 Green 函数表示：

$$
(R_{\lambda_0}f)(x)=\int_a^b G(x,t;\lambda_0)f(t)r(t)\,dt.
$$

对正则问题，Green 函数 $G$ 在 $[a,b]^2$ 上连续。因此 $R_{\lambda_0}$
是积分算子，核连续，属于 Hilbert–Schmidt 类，从而是紧算子。

> [!theorem] 正则 SL 问题的谱结构
> 在正则 SL 问题中，算子 $A$ 有可数无穷多个实特征值
> $$
> \lambda_1<\lambda_2<\lambda_3<\cdots,\qquad \lambda_n\to+\infty,
> $$
> 对应特征函数 $\varphi_n$ 在 $L^2_r(a,b)$ 中构成完备正交系。
> 每个特征值单重；特别地，Dirichlet 问题的第 $n$ 个特征函数在 $(a,b)$ 内
> 恰有 $n-1$ 个零点。

**证明思路** 紧自伴算子的谱定理给出离散实谱与完备正交特征系。
单重性由 [[06_特征函数正交性与广义Fourier级数]] 中的 Wronskian 引理得到；
零点计数由 [[04_Pruefer变换与特征值存在性]] 与 [[05_Sturm比较定理与零点交错]] 得到。
完整的紧自伴算子谱定理参见泛函分析教材。 $\square$

## 二次型与算子

若只关心特征值，可以用二次型

$$
Q(y)=\int_a^b\bigl(p y'^2+q y^2\bigr)dx,
\qquad
M(y)=\int_a^b r y^2\,dx.
$$

在适当定义域上，特征值问题等价于

$$
Q(y)=\lambda M(y),\qquad y\neq0.
$$

这就是下一节 [[08_特征值的变分刻画与单调性]] 的起点。

## 习题

> [!question] 7.1
> 计算 $[u,v](x)=p(uv'-u'v)$ 的导数，并验证 Lagrange 恒等式。

> [!question] 7.2
> 对 Dirichlet 问题，说明 $[u,v](a)=[u,v](b)=0$。

> [!question] 7.3
> 对 Neumann 问题，说明 $[u,v](a)=[u,v](b)=0$。

> [!question] 7.4
> 若 $p\equiv1$，$q\equiv0$，$r\equiv1$，$[a,b]=[0,\pi]$，
> 直接写出 Dirichlet 问题的 Green 函数，并说明它是 Hilbert–Schmidt 核。

> [!success]- 解答
> **7.1** 直接求导：
> $$
> \frac{d}{dx}[u,v]
> =p'(uv'-u'v)+p(u'v'+uv''-u''v-u'v')
> =p'(uv'-u'v)+p(uv''-u''v).
> $$
> 另一方面
> $$
> vLu-uLv
> =v(-p'u'-pu'')+u(p'v'+pv'')
> =p'(uv'-u'v)+p(uv''-u''v),
> $$
> 两者相等。
>
> **7.2** Dirichlet 边界条件为 $u(a)=v(a)=0$ 与 $u(b)=v(b)=0$，
> 代入 $[u,v]=p(uv'-u'v)$ 得零。
>
> **7.3** Neumann 边界条件为 $u'(a)=v'(a)=0$ 与 $u'(b)=v'(b)=0$，
> 同样代入得零。
>
> **7.4** 对 $-y''=f$，$y(0)=y(\pi)=0$，Green 函数为
> $$
> G(x,t)=
> \begin{cases}
> \dfrac{x(\pi-t)}{\pi}, & 0\le x\le t\le\pi,\\[2mm]
> \dfrac{t(\pi-x)}{\pi}, & 0\le t\le x\le\pi.
> \end{cases}
> $$
> 它在 $[0,\pi]^2$ 上连续，因此积分算子
> $f\mapsto\int_0^\pi G(x,t)f(t)\,dt$ 是 Hilbert–Schmidt 算子。

> [!tip] 下一步
> 有了 Hilbert 空间框架后，就可以用 [[08_特征值的变分刻画与单调性]]
> 的极小极大原理研究特征值对系数和权的依赖。
