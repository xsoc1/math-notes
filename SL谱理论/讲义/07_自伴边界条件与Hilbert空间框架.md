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
> 模块 C：正交展开与谱框架（自伴性在本讲引入）。前置：[[06_特征函数正交性与广义Fourier级数]]；下一讲：[[08_特征值的变分刻画与单调性]]。


> [!abstract] 本节目标
> 把 SL 边值问题写成 Hilbert 空间中的自伴算子问题。本讲的核心结论是：
> 在分离型实边界条件下，SL 算子关于带权内积
> $$
> (u,v)_r=\int_a^b r(x)u(x)v(x)\,dx
> $$
> 是对称的，并给出一般自伴边界条件的标准形。
> 紧预解式、Green 函数与离散谱将在第 09 讲证明。

> [!question] 基本问题
> 为什么自伴性保证实谱、正交特征系与完备性？

> [!note] 物理来源：能量守恒与互易性
> 对无阻尼振动，能量
> $$
> E=\frac12\int_a^b\bigl(p y'^2+q y^2+r y_t^2\bigr)dx
> $$
> 在自伴边界条件下守恒：边界项为零，能量不会从端点漏出。
> 自伴性给出实特征值（实频率）、正交特征函数（独立模态）与完备性
> （任意初始状态可分解）；Robin 边界对应端点的弹性支撑，
> 周期边界对应闭合环。
> 对称性 $(Au,v)_r=(u,Av)_r$ 的物理含义是互易性：
> 激励 $A$ 在 $u$ 上对 $v$ 做的功等于它在 $v$ 上对 $u$ 做的功。


## 伴随算子与自伴算子

本讲涉及 Hilbert 空间中的无界算子，先把“对称”与“自伴”两个词讲清楚。
Hilbert 空间的定义与基本性质属于泛函分析前置，这里只用到内积、正交与闭包。

> [!definition] 伴随算子与自伴算子
> 设 $H$ 是复 Hilbert 空间，$A:D(A)\subset H\to H$ 是稠定线性算子。
> 伴随算子 $A^*$ 的定义域为
> $$
> D(A^*)=\{v\in H:\text{存在 }w\in H,\ (Au,v)=(u,w)\ \forall u\in D(A)\},
> $$
> 并令 $A^*v=w$。
> - 若 $D(A)\subset D(A^*)$ 且 $A^*u=Au$ 对一切 $u\in D(A)$ 成立，
>   则称 $A$ **对称**；
> - 若 $D(A)=D(A^*)$，则称 $A$ **自伴**。

> [!note] 本讲证明什么
> 本讲先证明分离边界条件下的算子是对称的；在正则 SL 情形，
> 适当选取定义域后它实际上自伴。自伴性的完整证明要用算子图范数与
> 边界三元组，这里从略；第 09 讲的紧预解式论证会用到自伴性。

## 为什么需要自伴性

前几节主要用初等方法研究相位和零点。若要对特征值做变分和优化，必须知道：

- 特征值都是实数；
- 不同特征值的特征函数正交；
- 特征函数系是完备的；
- 预解算子紧、谱没有连续部分（这一性质在第 09 讲证明）。

这些性质统一来自“自伴算子”这一结构。本节先证明对称性与自伴边界条件；紧预解式留到第 09 讲。

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

对区间 $[a,b]$ 积分得到 分部积分公式：

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
> - **周期/反周期**：不属于分离型；它们的自伴性将在下一节的标准形中说明。

## 一般自伴边界条件的标准形

分离型只是自伴边界条件的一类。设

$$
Y(x)=\begin{pmatrix}y(x)\\ (py')(x)\end{pmatrix},
\qquad
E=\begin{pmatrix}0&-1\\1&0\end{pmatrix}.
$$

一般两点边界条件写成

$$
A Y(a)+B Y(b)=0,\qquad
A,B\in M_2(\mathbb C),\qquad
\operatorname{rank}(A:B)=2,
$$
其中 $M_2(\mathbb C)$ 是复 $2\times2$ 矩阵全体，$(A:B)$ 表示把 $A,B$
并排成的 $2\times4$ 矩阵。

它在 Lagrange 边界形式下自伴，当且仅当

$$
A E A^*=B E B^*.
$$

> [!theorem] 自伴边界条件的分类（引用 Zettl §4.2）
> 在上述条件下，自伴边界条件恰分为互不重叠的三类：
> 1. **分离型**：两端各给一个实线性条件，可参数化为
>    $$
>    \cos\alpha\,y(a)-\sin\alpha\,(py')(a)=0,
>    \qquad
>    \cos\beta\,y(b)-\sin\beta\,(py')(b)=0;
>    $$
> 2. **实耦合型**：$Y(b)=K Y(a)$，其中 $K\in SL_2(\mathbb R)$（即 $2\times2$ 实矩阵且 $\det K=1$）；
> 3. **复耦合型**：$Y(b)=e^{i\gamma}K Y(a)$，其中
>    $K\in SL_2(\mathbb R)$，$\gamma\in(-\pi,0)\cup(0,\pi)$。

> [!example] 三类边界的典型例子
> - 分离型：Dirichlet、Neumann、Robin；
> - 实耦合型：周期条件 $Y(b)=Y(a)$（$K=I$）、
>   反周期条件 $Y(b)=-Y(a)$（$K=-I$，仍有 $\det K=1$）；
> - 复耦合型：带相位 $\gamma\neq0$ 的耦合条件，边界条件本质上是复值的。

> [!note] 证明路线
> 自伴性等价于边界形式对定义域中所有 $u,v$ 满足
> $[u,v](b)-[u,v](a)=0$。把边界值写成 $Y$，即得矩阵条件
> $A E A^*=B E B^*$；再由 $SL_2(\mathbb R)$ 的代数结构得到三类标准形。
> 正则情形的完整证明见 Zettl §4.2（Lemma 4.2.1）；一般奇异情形的证明走
> GKN 算子理论，见 Zettl §10.4（Theorem 10.4.3）。
> 本讲义目前只证明分离型与实耦合型中的简单情形，分类定理作为引用结果使用。

## 耦合边界条件：转移矩阵判据

设 $\Phi(x,\lambda)$ 是基本解矩阵：它的两列分别是初值
$$
Y_1(a)=\begin{pmatrix}1\\0\end{pmatrix},
\qquad
Y_2(a)=\begin{pmatrix}0\\1\end{pmatrix}
$$
对应的解向量 $Y=(y,py')^T$。由 $\Phi(a,\lambda)=I$ 得
$\det\Phi(a,\lambda)=1$；又系数矩阵的迹为零，直接对行列式求导可得
$$
\frac{d}{dx}\det\Phi(x,\lambda)=0,
$$
故 $\det\Phi(x,\lambda)\equiv1$。

> [!theorem] 实耦合边界的特征值判据
> 设实耦合边界条件为 $Y(b)=KY(a)$，其中 $K\in SL_2(\mathbb R)$。
> 则 $\lambda$ 是特征值，当且仅当
> $$
> \operatorname{tr}\bigl(K^{-1}\Phi(b,\lambda)\bigr)=2.
> $$

**证明** 由 $Y(b)=\Phi(b,\lambda)Y(a)$ 与 $Y(b)=KY(a)$ 得
$$
K^{-1}\Phi(b,\lambda)Y(a)=Y(a).
$$
非零解存在等价于 $1$ 是 $M:=K^{-1}\Phi(b,\lambda)$ 的特征值。又
$$
\det M=\det(K^{-1})\det\Phi=1.
$$
对二阶矩阵 $M$，$1$ 是特征值当且仅当
$$
0=\det(M-I)=\det M-\operatorname{tr}M+1
=2-\operatorname{tr}M,
$$
即 $\operatorname{tr}M=2$。 $\square$

> [!example] 周期与反周期问题
> 取 $p=r=1$，$q=0$，$[0,\pi]$，方程 $-y''=\lambda y$。
> 对 $\lambda=\mu^2>0$，
> $$
> \Phi(x,\lambda)=
> \begin{pmatrix}
> \cos\mu x & \dfrac{\sin\mu x}{\mu}\\[2mm]
> -\mu\sin\mu x & \cos\mu x
> \end{pmatrix},
> \qquad
> \operatorname{tr}\Phi(\pi,\lambda)=2\cos(\mu\pi).
> $$
> 对 $\lambda=0$，$\Phi(x,0)=\begin{pmatrix}1&x\\0&1\end{pmatrix}$。
>
> - **周期条件** $Y(\pi)=Y(0)$，即 $K=I$。判据给出
>   $\operatorname{tr}\Phi=2$，故 $\cos\mu\pi=1$，
>   $\mu=2n$，$\lambda=4n^2$，$n=0,1,2,\dots$。
>   $\lambda_0=0$ 单重；$n\ge1$ 时 $\cos2nx$ 与 $\sin2nx$ 都满足边界条件，
>   特征值为二重。
> - **反周期条件** $Y(\pi)=-Y(0)$，即 $K=-I$。判据给出
>   $\operatorname{tr}(-\Phi)=2$，即 $\operatorname{tr}\Phi=-2$，
>   故 $\cos\mu\pi=-1$，$\mu=2n+1$，$\lambda=(2n+1)^2$，
>   $n=0,1,2,\dots$，全部为二重。
>
> 两组谱合起来恰为 $\{n^2:n=0,1,2,\dots\}$：
> $n$ 为偶数时对应周期条件，$n$ 为奇数时对应反周期条件。

> [!note] 重数对比
> 分离型自伴边界的特征值必为单重；耦合边界条件可能出现二重特征值。
> 周期与反周期例子中，除 $\lambda=0$ 外全部是二重特征值。
> 这与 Zettl \S4.10 的重数定理一致。

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

两式相减，并用 分部积分公式：

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
> 此处从略；对称性加上第 09 讲证明的紧预解式，足以推出离散谱。

## 下一讲预告：紧预解式与离散谱

本讲证明了对称性与自伴边界条件的结构。第 09 讲将构造 Green 函数，并证明
预解算子
$$
R_\lambda=(A-\lambda I)^{-1}
$$
是紧自伴算子，从而由紧自伴算子的谱定理得到离散实特征值与完备正交特征系。
本讲不把这一结论当作已知工具使用；涉及它的证明与习题都放在第 09 讲。

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

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 4 §4.2：自伴边界条件的标准形（分离、实耦合、复耦合）。
> - A. Zettl, Ch 4 §4.10：特征值重数；§4.12 的有限实谱在第 09 讲使用。
> - A. Zettl, Ch 10 §10.2–§10.4：奇异情形的 Lagrange 形式、最小/最大定义域与自伴扩张。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

Lagrange 恒等式与边界形式给出对称性；这为第 09 讲的紧预解式与离散谱作准备。

## 习题

> [!question] 7.1
> 计算 $[u,v](x)=p(uv'-u'v)$ 的导数，并验证 Lagrange 恒等式。

> [!question] 7.2
> 对 Dirichlet 问题，说明 $[u,v](a)=[u,v](b)=0$。

> [!question] 7.3
> 对 Neumann 问题，说明 $[u,v](a)=[u,v](b)=0$。

> [!question] 7.4
> 证明带权内积
> $$
> (u,v)_r=\int_a^b r(x)u(x)\overline{v(x)}\,dx
> $$
> 满足内积公理，并说明为什么必须要求 $r(x)>0$。

> [!question] 7.5
> 证明：分离型自伴边界条件下，正则 SL 问题的特征值是单重的。

> [!question] 7.6
> 对 $p=r=1$，$q=0$，$[0,\pi]$，写出基本解矩阵 $\Phi(x,\lambda)$，
> 并用转移矩阵判据证明周期与反周期边界的特征值分别为
> $4n^2$ 与 $(2n+1)^2$。

> [!question] 7.7
> 证明周期与反周期问题没有负特征值。

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
> **7.4** 对 $u,v,w\in L^2_r$ 与 $\alpha,\beta\in\mathbb C$，由积分的线性性，
> $(u,\alpha v+\beta w)_r=\alpha(u,v)_r+\beta(u,w)_r$，
> 共轭对称性 $(u,v)_r=\overline{(v,u)}_r$ 也直接来自定义。
> 正定性：$(u,u)_r=\int r|u|^2\ge0$；
> 当 $r>0$ 时，$(u,u)_r=0$ 推出 $u=0$ 几乎处处。
> 若 $r$ 在正测度集上为零或为负，则非零函数可能满足
> $(u,u)_r\le0$，内积的正定性失效，因此必须要求 $r>0$。

>
> **7.5** 设 $u,v$ 是同一个特征值 $\lambda$ 的两个特征函数。左端分离条件
> $$
> K y(a)-L(py')(a)=0
> $$
> 的零点集是二维向量空间
> $\{(y(a),(py')(a)):y\in\mathbb R^2\}$ 中的一条过原点的直线。
> 因此 $u$ 与 $v$ 在 $a$ 处的向量成比例，从而
> $$
> W(a)=u(a)(pv')(a)-(pu')(a)v(a)=0.
> $$
> 但两个线性无关解的 Wronskian 处处非零，矛盾。因此特征函数空间是
> 一维的，特征值单重。
>
> **7.6** 对 $-y''=\lambda y$，$\lambda=\mu^2>0$，基本解矩阵为
> $$
> \Phi(x,\lambda)=
> \begin{pmatrix}
> \cos\mu x & \sin\mu x/\mu\\
> -\mu\sin\mu x & \cos\mu x
> \end{pmatrix},
> \qquad \operatorname{tr}\Phi(\pi)=2\cos\mu\pi.
> $$
> 周期：$\operatorname{tr}\Phi=2$ 给出 $\cos\mu\pi=1$，
> 故 $\mu=2n$，$\lambda=4n^2$。反周期：
> $\operatorname{tr}(-\Phi)=2$ 给出 $\operatorname{tr}\Phi=-2$，
> 即 $\cos\mu\pi=-1$，故 $\mu=2n+1$，$\lambda=(2n+1)^2$。
> $\lambda=0$ 时 $\Phi(\pi,0)=\begin{pmatrix}1&\pi\\0&1\end{pmatrix}$，
> 迹为 $2$，对应周期的常数特征函数。
>
> **7.7** 对周期或反周期边界条件及实值 $y$，分部积分给出
> $$
> \int_0^\pi (-y'')y\,dx
> =\int_0^\pi (y')^2\,dx-\bigl[y y'\bigr]_0^\pi
> =\int_0^\pi (y')^2\,dx,
> $$
> 因为周期或反周期条件都使边界项 $[yy']_0^\pi=0$。
> 若 $-y''=\lambda y$，则
> $$
> \lambda\int_0^\pi y^2\,dx=\int_0^\pi (y')^2\,dx\ge0.
> $$
> 非零特征函数给出 $\lambda\ge0$，故没有负特征值。

> [!tip] 下一步
> 有了 Hilbert 空间框架后，就可以用 [[08_特征值的变分刻画与单调性]]
> 的极小极大原理研究特征值对系数和权的依赖。
