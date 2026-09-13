---
title: Liouville 标准形
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - liouville-normal-form
  - change-of-variables
aliases:
  - Liouville 标准形
  - Liouville normal form
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\02_standard_prufer.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[02_正则Sturm-Liouville问题]]"
---

# 03 Liouville 标准形

> [!info] 本讲位置
> 模块 B：化简与振荡。前置：[[02_正则Sturm-Liouville问题]]；下一讲：[[04_Pruefer变换与特征值存在性]]。


一般 SL 方程可以通过自变量与因变量的变换，化为更简单的“标准形”

$$
y''+\bigl[\lambda+q(x)\bigr]y=0.
$$

> [!abstract] 本讲目标
> 掌握 Liouville 标准形变换，把一般 SL 方程化为 $y''+[\lambda+q(x)]y=0$。

> [!question] 基本问题
> 如何把变系数 SL 方程化为最简形式？


## 自变量变换

定义新的自变量

$$
s=\frac{1}{c}\int_a^x\sqrt{\frac{r(t)}{p(t)}}\,dt,
\qquad
c=\int_a^b\sqrt{\frac{r(t)}{p(t)}}\,dt,
$$

则 $s\in[0,1]$。这个变换把 $[a,b]$ 映射到 $[0,1]$，并把

$$
-\bigl(p y'\bigr)'+q y=\lambda r y
$$

化为以 $s$ 为自变量的方程。

## 因变量变换

再令

$$
y(x)=\bigl[r(x)p(x)\bigr]^{-1/4}z(s),\qquad s\in[0,1].
$$

经过计算，方程化为

$$
z''+\bigl[\lambda+Q(s)\bigr]z=0,
$$

其显式公式如下。

> [!theorem] Liouville 变换的显式公式
> 设 $f(x)=\bigl(p(x)r(x)\bigr)^{1/4}$，
> $$
> s'(x)=\sqrt{\frac{r(x)}{p(x)}},
> \qquad
> F(s)=f(x(s)),
> $$
> 其中 $x(s)$ 是 $s(x)$ 的反函数。则
> $$
> z(s)=\bigl(p(x(s))r(x(s))\bigr)^{1/4}y(x(s))
> $$
> 把方程
> $$
> -(p y')'+q y=\lambda r y
> $$
> 化为
> $$
> z''+\bigl[\lambda+Q(s)\bigr]z=0,
> \qquad
> Q(s)=-\frac{q(x(s))}{r(x(s))}-\frac{F''(s)}{F(s)}.
> $$

**证明** 记 $f=(pr)^{1/4}$，$\theta=s'=\sqrt{r/p}$，$A=p f'/f^2$。
由
$$
\frac{p}{f^2}=\frac{p}{\sqrt{pr}}=\sqrt{\frac pr}=\frac1\theta
$$
得 $A=f'/\theta$。写 $y=z(s)/f(x)$，计算
$$
p y'=f z_s-A z.
$$
对 $x$ 求导，利用 $A\theta=f'$，得
$$
(p y')'=f\theta\,z_{ss}-A'z.
$$
代入方程并除以 $-f\theta$，再用 $f^2\theta=r$，得到
$$
z_{ss}+\left[\lambda-\frac qr-\frac{A'}{f\theta}\right]z=0.
$$
最后，由 $A=f'/\theta$ 与 $F(s)=f(x(s))$，
$$
F_s=\frac{f'}{\theta}=A,
\qquad
F_{ss}=\frac{A'}{\theta},
$$
故
$$
\frac{F_{ss}}{F}=\frac{A'}{\theta f}=\frac{A'}{f\theta}.
$$
因此 $z''+[\lambda+Q(s)]z=0$，其中 $Q=-q/r-F''/F$。 $\square$

> [!example] 例 2.1：Bessel 型方程
> 取 $p=1$，$r=x^2$，$q=0$，$x\in(0,1)$。则
> $$
> s=\frac{x^2}{2},
> \qquad
> F(s)=(2s)^{1/4},
> \qquad
> Q(s)=\frac{3}{16s^2}.
> $$
> 标准形为
> $$
> z''+\left[\lambda+\frac{3}{16s^2}\right]z=0.
> $$
> 势在 $s=0$ 处奇异，对应原方程的端点 $x=0$。

**物理意义** 原方程
$$
-y''=\lambda x^2y
$$
可以看作一根**变密度弦**的振动方程。设弦的张力为 $1$，单位长度密度为
$\rho(x)=x^2$，横向位移为 $u(x,t)$，则
$$
\rho(x)u_{tt}=\bigl(Tu_x\bigr)_x
\quad\Longrightarrow\quad
x^2u_{tt}=u_{xx}.
$$
令 $u(x,t)=T(t)y(x)$ 分离时间变量，即得
$-y''=\lambda x^2y$。
密度在 $x=0$ 处退化为零，所以端点 $x=0$ 是奇异的：质量分布趋于零，
振动在端点附近的行为需要单独分析。

更一般地，若密度是幂函数 $r(x)=x^{2\alpha}$（$\alpha>-1$），
则
$$
s=\frac{x^{\alpha+1}}{\alpha+1},
\qquad
Q(s)=\frac{\alpha(\alpha+2)}{4(\alpha+1)^2}\frac1{s^2}.
$$
当 $\alpha=1$ 时即为 $Q=3/(16s^2)$。这说明**变密度会产生逆平方势**
（离心势垒），它是高维径向问题中反复出现的结构。

**数学理解** 变换后的方程
$$
z''+\left[\lambda+\frac{3}{16s^2}\right]z=0
$$
在 $s=0$ 处有一个不可积的逆平方势。把它写成
$$
-z''+\frac{c}{s^2}z=\lambda z,
\qquad
c=-\frac{3}{16},
$$
则端点 $s=0$ 的端点分类为（完整定义见后续奇异 SL 理论）：
$c<3/4$ 时是极限圆（limit-circle），
$c\ge3/4$ 时是极限点（limit-point）。这里 $c=-3/16<3/4$，
属于极限圆情形。因此这个例子**不能直接套用第 08 章的正则完备性定理**，
它正是后续奇异 SL 理论（模块 3/4）的入口。

**与 Bessel 函数的联系** 变换后的方程是 Bessel 方程（阶 $\nu=1/4$）
的标准约化形式。事实上，Bessel 方程
$$
u''+\frac1t u'+\left(1-\frac{\nu^2}{t^2}\right)u=0
$$
作变换 $u(t)=t^{-1/2}v(t)$ 后化为
$$
v''+\left[1+\frac{1/4-\nu^2}{t^2}\right]v=0.
$$
取 $\nu=1/4$，再令 $t=\sqrt{\lambda}s$，就得到上面的变换后方程。
因此原方程的解可以写成
$$
y(x)=\sqrt{x}\,J_{1/4}\!\left(\frac{\sqrt{\lambda}}2x^2\right)
$$
与第二类 Bessel 函数的线性组合。若在 $x=1$ 处给定边界条件、
在 $x=0$ 处要求解有界，就得到一个奇异 SL 特征值问题；
特征函数由 $J_{1/4}$ 给出，正交性权重为 $x^2$。

> [!example] 例 2.2：Legendre 方程
> 取 $p=1-x^2$，$q=0$，$r=1$，$x\in(-1,1)$。则
> $$
> s=\arcsin x,
> \qquad
> F(s)=\sqrt{\cos s},
> \qquad
> Q(s)=\frac12+\frac14\tan^2 s.
> $$
> 标准形为
> $$
> z''+\left[\lambda+\frac12+\frac14\tan^2 s\right]z=0,
> \qquad
> s\in\left(-\frac\pi2,\frac\pi2\right).
> $$
> $s=\pm\pi/2$ 处势发散，对应 Legendre 方程在 $x=\pm1$ 的奇异端点。

**物理意义** Legendre 方程
$$
-\bigl((1-x^2)y'\bigr)'=\lambda y
$$
是 Laplace 方程在球坐标下分离变量得到的**角向方程**。
取 $x=\cos\theta$，其中 $\theta$ 是球坐标的极角，则角向本征方程为
$$
\frac1{\sin\theta}\frac{d}{d\theta}
\left(\sin\theta\frac{dY}{d\theta}\right)
+\lambda Y=0,
$$
令 $x=\cos\theta$ 即化为 Legendre 方程。此时
$$
\lambda=n(n+1),\qquad n=0,1,2,\dots,
$$
特征函数是 Legendre 多项式 $P_n(\cos\theta)$。它们对应球面调和函数、
角动量量子数、静电场与引力场的多极展开，以及氢原子角向方程。
一维问题中参数 $n$ 的物理含义是角动量大小，而 $2n+1$ 重简并
来自磁量子数。

**数学理解** 变换后
$$
Q(s)=\frac12+\frac14\tan^2 s.
$$
当 $s\to\pm\pi/2$ 时，令 $u=\pi/2\mp s$，则
$\tan s\sim1/u$，所以
$$
Q(s)\sim\frac1{4u^2}.
$$
方程在端点附近化为
$$
-z''-\frac{1}{4u^2}z=\lambda z,
$$
即 $c=-1/4<3/4$，端点同样属于**极限圆**情形（完整定义见后续奇异 SL 理论）。
Legendre 方程的两个端点 $x=\pm1$ 都是奇异端点，且两个线性无关解
在端点附近都平方可积：一个趋于常数，另一个具有对数发散
（Legendre 函数 $Q_n$）。Legendre 多项式 $P_n$ 正是被
“两端有界”这一要求选出的解。

变换后的特征函数可以写成
$$
z_n(s)=\sqrt{\cos s}\,P_n(\sin s),
\qquad
\lambda_n=n(n+1).
$$
这说明 Legendre 多项式正是变换后奇异 SL 问题的特征函数；
Legendre 展开
$$
f(x)\sim\sum_{n=0}^{\infty}c_nP_n(x)
$$
在 $L^2(-1,1)$ 中完备，但它的完备性**不能由第 08 章的正则理论
直接覆盖**，需要奇异自伴扩张与 Friedrichs 扩张等工具
（模块 3/4）。这也是 Legendre 方程在 SL 理论中的典型地位：
它是最经典的“正则理论之外”的完备正交系。

**与其他特殊函数的联系** 将权函数换成 $(1-x)^\alpha(1+x)^\beta$
就得到 Jacobi 多项式；Legendre 多项式是其特例。更高维球面上的
角向问题则给出 Gegenbauer 多项式。它们与 Bessel 函数一起构成
数学物理中最重要的几族正交多项式。

> [!note] 两个例子的共同结构
> Bessel 型方程与 Legendre 方程都来自物理分离变量：
> 前者是变密度弦/高维径向问题，后者是球面角向问题。
>  Liouville 变换后，两者都在奇异端点产生**逆平方势**（离心势垒）：
> Bessel 型方程在 $x=0$ 属于极限圆（$x=1$ 为正则端点），
> Legendre 方程在 $x=\pm1$ 两端都属于极限圆。
> 特征函数分别由 Bessel 函数 $J_{1/4}$ 与 Legendre 多项式 $P_n$ 给出。
> 它们说明正则理论之外还有一大类由奇异端点产生的完备正交系，
> 这正是模块 3/4 的研究对象。

> [!note] 结论
> 只需研究
> $$
> y''+\bigl[\lambda+q(x)\bigr]y=0.
> $$
> 这解释了为何很多 SL 谱理论直接以这种形式展开。

> [!tip] 与 Prüfer 变换的连接
> 标准形 $y''+[\lambda+q(x)]y=0$ 是 [[04_Pruefer变换与特征值存在性|Prüfer 变换]] 的出发点。

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory* 对一般形式 $-(py')'+qy=\lambda wy$ 直接处理，不先化标准形；记号约定见 Ch 3 §3.1、Ch 4 §4.1。
> - A. Zettl, Ch 6 §6.3：振动判别法，与标准形下的系数比较互为参照。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

自变量与因变量变换消去一阶项与权函数，把问题化为标准形，后续只需研究标准形。

## 习题

> [!question] 3.1
> 当 $p=r=1$，$q=0$，$a=0$，$b=1$ 时，计算 $s(x)$ 与 $c$。

> [!question] 3.2
> 验证在 $p=r=1$ 时，Liouville 标准形就是原方程本身。

> [!question] 3.3
> 设 $p(x)=1$，$r(x)=x^2$，求自变量变换 $s=s(x)$。

> [!question] 3.4
> 利用 $A=f'/\theta$ 证明
> $$
> \frac{A'}{f\theta}=\frac{F''}{F},
> $$
> 其中 $F(s)=f(x(s))$。

> [!question] 3.5
> 对 $p=1$，$r=x^2$，$q=0$，$x\in(0,1)$，
> 计算 $s(x)$、$F(s)$、$Q(s)$，并写出标准形。

> [!question] 3.6
> 对 Legendre 方程
> $$
> -\bigl((1-x^2)y'\bigr)'=\lambda y,
> \qquad x\in(-1,1),
> $$
> 计算 $s(x)$、$F(s)$、$Q(s)$，并说明为什么变换后的势在
> $s=\pm\pi/2$ 发散。

> [!success]- 解答
> **3.1**
> $$
> c=\int_0^1 1\,dt=1,\qquad
> s(x)=\int_0^x 1\,dt=x.
> $$
> 因此 $s\in[0,1]$。
>
> **3.2** 直接代入可得 $z(s)=y(x)$，且 $Q(s)=0$，所以标准形
> $z''+\lambda z=0$ 与原方程一致。
>
> **3.3**
> $$
> s(x)=\frac{1}{c}\int_0^x t\,dt=\frac{x^2}{2c},\qquad
> c=\int_0^1 t\,dt=\frac12,
> $$
> 所以 $s(x)=x^2$。

>
> **3.4** 因为 $F_s=f'/\theta=A$，所以
> $$
> F_{ss}=\frac{dA}{ds}=\frac{A'}{\theta}.
> $$
> 又 $F=f$，故
> $$
> \frac{F_{ss}}{F}=\frac{A'}{\theta f}=\frac{A'}{f\theta}.
> $$
>
> **3.5** 由 $s'(x)=x$ 得 $s=x^2/2$，$x=\sqrt{2s}$，
> $$
> F(s)=\bigl(x^2\bigr)^{1/4}=x^{1/2}=(2s)^{1/4}.
> $$
> 计算
> $$
> F'(s)=\frac14(2s)^{-3/4}\cdot2=\frac12(2s)^{-3/4},
> $$
> $$
> F''(s)=-\frac38(2s)^{-7/4}\cdot2
> =-\frac34(2s)^{-7/4}.
> $$
> 因此
> $$
> \frac{F''}{F}
> =-\frac34(2s)^{-7/4}(2s)^{-1/4}
> =-\frac34(2s)^{-2}
> =-\frac{3}{16s^2},
> $$
> 故 $Q(s)=3/(16s^2)$，标准形为
> $z''+[\lambda+3/(16s^2)]z=0$。
>
> **3.6** 由 $s'(x)=1/\sqrt{1-x^2}$ 得 $s=\arcsin x$，
> 所以 $x=\sin s$，$F(s)=(1-x^2)^{1/4}=(\cos^2s)^{1/4}=\sqrt{\cos s}$。
> 记 $c=\cos s$，则
> $$
> F'=-\frac12\sin s\,c^{-1/2},
> $$
> $$
> F''=-\frac12c^{1/2}-\frac14\sin^2s\,c^{-3/2}.
> $$
> 因此
> $$
> \frac{F''}{F}
> =-\frac12\sec^2s-\frac14\tan^2s
> =-\frac12-\frac14\tan^2s,
> $$
> 故
> $$
> Q(s)=\frac12+\frac14\tan^2s.
> $$
> 当 $s\to\pm\pi/2$ 时 $\tan^2s\to+\infty$，势发散；
> 这正对应原方程在 $x=\pm1$ 处 $p=1-x^2$ 退化的奇异端点。
