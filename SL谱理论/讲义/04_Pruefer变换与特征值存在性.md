---
title: Prüfer 变换与特征值存在性
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - prufer
  - oscillation
aliases:
  - Prüfer 变换
  - Prüfer transformation
  - 相位方程
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\02_standard_prufer.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[03_Liouville标准形]]"
---

# 04 Prüfer 变换与特征值存在性

> [!info] 本讲位置
> 模块 B：化简与振荡。前置：[[03_Liouville标准形]]；下一讲：[[05_Sturm比较定理与零点交错]]。


> [!abstract] 本讲目标
> 推导 Prüfer 相位方程，并用相位单调性说明特征值的存在与计数。

> [!question] 基本问题
> 如何把二阶方程变成一阶相位方程，并用相位描述振荡？

> [!note] 物理来源：无限深势阱与弦的谐波
> 宽度为 $L$ 的无限深势阱满足 $-\psi''=E\psi$，$\psi(0)=\psi(L)=0$。
> 它的解 $\psi_n=\sin(n\pi x/L)$、能级 $E_n=(n\pi/L)^2$：束缚越紧，基态能量越高；
> 第 $n$ 个态的零点数为 $n-1$，正对应 Prüfer 相位穿过 $n-1$ 个零点。
> 同样地，两端固定弦的振动模态为 $\sin(n\pi x/L)$，频率 $f_n=n c/(2L)$；
> 管乐器、弦乐器的谐波列都是这一结点计数的物理表现。
> 数学上，本讲的特征值存在性与单调性定理保证这些模态按
> “零点数 = 模态序号”的顺序排列。


## 极坐标表示

考虑标准形

$$
y''+\bigl[\lambda+q(x)\bigr]y=0.
$$

设 $\varphi(x,\lambda)$ 是一个非零解。引入极坐标

$$
\begin{cases}
\varphi(x,\lambda)=\rho(x,\lambda)\sin\theta(x,\lambda),\\[2mm]
\varphi'(x,\lambda)=\rho(x,\lambda)\cos\theta(x,\lambda),
\end{cases}
$$

其中 $\rho>0$，$\theta$ 为相位角。等价地，

$$
\theta(x,\lambda)=\arctan\frac{\varphi(x,\lambda)}{\varphi'(x,\lambda)}.
$$

![[fig_prufer.svg|420]]

*图 4：Prüfer 变换：$ (\varphi',\varphi) $ 的相位角 $\theta$ 与振幅 $\rho$。*

## 相位的微分方程

由 $\theta=\arctan(\varphi/\varphi')$，

$$
\theta'=\frac{\varphi'^2-\varphi\varphi''}{\varphi'^2+\varphi^2}.
$$

因为 $\varphi''=-[\lambda+q]\varphi$，且 $\varphi'^2+\varphi^2=\rho^2$，所以

$$
\theta'=\cos^2\theta+\bigl[\lambda+q(x)\bigr]\sin^2\theta.
$$

> [!note] 关键作用
> 二阶 ODE 被化为一个一阶相位方程。零点、振荡、特征值计数都可以通过相位 $\theta$ 研究。

## 边界条件变为角度方程

若左端边界条件为

$$
\varphi(a)\cos\alpha-\varphi'(a)\sin\alpha=0,
$$

代入 $\varphi=\rho\sin\theta$、$\varphi'=\rho\cos\theta$ 得

$$
\sin(\theta-\alpha)=0,
$$

故

$$
\theta(a,\lambda)=\alpha+k\pi,\qquad k\in\mathbb{Z}.
$$

同理，右端给出

$$
\theta(b,\lambda)=\beta+k\pi,\qquad k\in\mathbb{Z}.
$$

因此特征值问题等价于：从 $\theta(a)=\alpha$ 出发，寻找 $\lambda$ 使得
$\theta(b,\lambda)$ 落在 $\beta+k\pi$ 上。

## 特征值的单调性

定义

$$
w(\lambda):=\theta(b,\lambda).
$$

则 $w$ 关于 $\lambda$ 严格递增。直观上，$\lambda$ 越大振荡越快，
右端相位随之增大。严格证明如下。

记

$$
\psi(x,\lambda):=\frac{\partial\theta}{\partial\lambda}(x,\lambda).
$$

由初值条件 $\theta(a,\lambda)=\alpha$ 得

$$
\psi(a,\lambda)=0.
$$

对相位方程

$$
\theta'=\cos^2\theta+[\lambda+q(x)]\sin^2\theta
$$

关于 $\lambda$ 求导，得到线性方程

$$
\psi'=2[\lambda+q(x)-1]\sin\theta\cos\theta\,\psi+\sin^2\theta.
$$

这是关于 $\psi$ 的一阶线性 ODE。其解可写成

$$
\psi(x,\lambda)
=\int_a^x \sin^2\theta(t,\lambda)\,
\exp\!\left(\int_t^x 2[\lambda+q(s)-1]\sin\theta(s,\lambda)\cos\theta(s,\lambda)\,ds\right)dt.
$$

被积函数中的指数因子严格为正，且 $\sin^2\theta(t,\lambda)$ 非负。
只要 $\sin\theta$ 不在整个区间上恒为零，就有

$$
\psi(x,\lambda)>0,\qquad x>a.
$$

若 $\sin\theta$ 恒为零，则 $\theta$ 为常数，相位方程会给出矛盾
（除非边界条件退化）。因此在非退化情形下，$w(\lambda)=\theta(b,\lambda)$
关于 $\lambda$ 严格递增。

> [!lemma] 相位在 $\lambda\to+\infty$ 时的增长
> 设 $q\in L^1(a,b)$，$\theta(a,\lambda)=\alpha$。则存在只依赖于
> $\alpha,a,b$ 的常数 $C$，使得对 $\lambda>0$，
> $$
> \theta(b,\lambda)
> \ge \sqrt{\lambda}(b-a)-C
> -\frac{1}{\sqrt{\lambda}}\int_a^b|q(x)|\,dx.
> $$
> 特别地，
> $$
> \lim_{\lambda\to+\infty}\theta(b,\lambda)=+\infty.
> $$

**证明** 令 $\phi(x,\lambda)$ 由
$$
\tan\phi=\sqrt{\lambda}\tan\theta
$$
定义，并取连续分支使得 $|\phi-\theta|<\pi/2$。两边对 $x$ 求导：
$$
\sec^2\phi\,\phi'
=\sqrt{\lambda}\sec^2\theta\,\theta'.
$$
由 $\sec^2\phi=1+\lambda\tan^2\theta$ 及相位方程
$\theta'=\cos^2\theta+(\lambda+q)\sin^2\theta$，得
$$
\phi'
=\sqrt{\lambda}\,\frac{1+(\lambda+q)\tan^2\theta}{1+\lambda\tan^2\theta}
=\sqrt{\lambda}+\frac{q}{\sqrt{\lambda}}\sin^2\phi.
$$
积分并用 $\sin^2\phi\le1$：
$$
\phi(b,\lambda)
\ge\phi(a,\lambda)+\sqrt{\lambda}(b-a)
-\frac{1}{\sqrt{\lambda}}\int_a^b|q|.
$$
由于 $|\phi(a,\lambda)-\theta(a,\lambda)|<\pi/2$，
$\phi(a,\lambda)$ 有界；又 $|\phi-\theta|<\pi/2$，故
$\theta(b,\lambda)\ge\phi(b,\lambda)-\pi/2$。令
$C=\sup_{\lambda>0}|\phi(a,\lambda)|+\pi/2$，即得所述下界，
从而 $\theta(b,\lambda)\to+\infty$。 $\square$

> [!theorem] 特征值存在性
> $w(\lambda)=\theta(b,\lambda)$ 连续且严格递增，并且
> $$
> \lim_{\lambda\to+\infty}w(\lambda)=+\infty.
> $$
> 因此对每个充分大的整数 $k$，方程
> $$
> w(\lambda)=\beta+k\pi
> $$
> 恰有一个解。这些解组成趋于 $+\infty$ 的离散特征值序列
> （按实际出现的指标编号：允许 $k=0$ 的边界条件从 $\lambda_0$ 开始，
> Dirichlet 问题从 $\lambda_1$ 开始）。

> [!corollary] 结点计数
> 若 $\lambda+q(x)\ge0$ 于 $[a,b]$，则 $\theta(x,\lambda)$ 关于 $x$ 严格递增。
> 设 $\theta(a,\lambda)=0$ 且 $\theta(b,\lambda)=k\pi$，$k\in\mathbb N$，
> 则相应特征函数在 $(a,b)$ 内恰有 $k-1$ 个零点。

**证明** 当 $\lambda+q\ge0$ 时，
$$
\theta'=\cos^2\theta+(\lambda+q)\sin^2\theta\ge0,
$$
且等号只能在 $\cos\theta=0$ 且 $\lambda+q=0$ 时出现；后者不可能在区间上
恒成立，故 $\theta$ 严格递增。特征函数的零点对应 $\theta\equiv0\pmod\pi$。
从 $\theta(a,\lambda)=0$ 到 $\theta(b,\lambda)=k\pi$，严格递增的相位恰好
穿过 $\pi,2\pi,\dots,(k-1)\pi$ 各一次，因此零点的个数为 $k-1$。 $\square$

> [!tip] 下一步
> 特征值的零点计数与交错性质由 [[05_Sturm比较定理与零点交错|Sturm 比较定理]] 给出。

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 4 §4.5, Theorem 4.5.1–4.5.3：Prüfer 变换的存在唯一性与相位方程。
> - A. Zettl, Ch 4 §4.6：分离边界条件下的特征值存在性与结点计数。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

Prüfer 变换把 $(\varphi,\varphi')$ 写成极坐标，相位方程给出振荡与特征值计数。

## 习题

> [!question] 4.1
> 由 $\varphi=\rho\sin\theta$，$\varphi'=\rho\cos\theta$ 推导
> $$
> \theta'=\cos^2\theta+[\lambda+q(x)]\sin^2\theta.
> $$

> [!question] 4.2
> 证明边界条件
> $$
> y(b)\cos\beta-y'(b)\sin\beta=0
> $$
> 等价于 $\theta(b)=\beta+k\pi$。

> [!question] 4.3
> 对 $q\equiv0$，$\lambda>0$，$[a,b]=[0,\pi]$，直接解出 $\theta(x,\lambda)$，
> 并求出第一个特征值 $\lambda_1$。

> [!question] 4.4
> 验证变换 $\tan\phi=\sqrt{\lambda}\tan\theta$ 把相位方程变为
> $$
> \phi'=\sqrt{\lambda}+\frac{q}{\sqrt{\lambda}}\sin^2\phi.
> $$

> [!question] 4.5
> 用 4.4 的公式证明 $\theta(b,\lambda)\to+\infty$（$\lambda\to+\infty$），
> 并说明为什么这保证了无穷多个特征值。

> [!question] 4.6
> 对 $q\equiv0$，$[a,b]=[0,\pi]$，$\theta(0,\lambda)=0$，
> 直接解出 $\theta(x,\lambda)$，并验证 $\theta(\pi,\lambda)=k\pi$
> 等价于 $\lambda=k^2$。当 $k=1,2$ 时，相应特征函数在 $(0,\pi)$ 内
> 各有多少个零点？

> [!success]- 解答
> **4.1** 由 $\theta=\arctan(\varphi/\varphi')$，
> $$
> \theta'=\frac{\varphi'^2-\varphi\varphi''}{\varphi'^2+\varphi^2}.
> $$
> 代入 $\varphi''=-[\lambda+q]\varphi$ 以及
> $\varphi'^2+\varphi^2=\rho^2$，即得结论。
>
> **4.2** 代入 $y=\rho\sin\theta$，$y'=\rho\cos\theta$ 得
> $$
> \sin\theta\cos\beta-\cos\theta\sin\beta
> =\sin(\theta-\beta)=0,
> $$
> 因此 $\theta(b)=\beta+k\pi$，$k\in\mathbb{Z}$。
>
> **4.3** 当 $q=0$ 时方程 $y''+\lambda y=0$，解为
> $$
> y=\sin(\sqrt{\lambda}x),\qquad \theta=\arctan\!\left(\frac{\sin(\sqrt{\lambda}x)}{\sqrt{\lambda}\cos(\sqrt{\lambda}x)}\right).
> $$
> Dirichlet 条件 $y(\pi)=0$ 要求 $\sqrt{\lambda}\pi=k\pi$，
> 故最小特征值为 $\lambda_1=1$。

>
> **4.4** 由 $\tan\phi=\sqrt{\lambda}\tan\theta$ 得
> $$
> \sec^2\phi\,\phi'=\sqrt{\lambda}\sec^2\theta\,\theta'.
> $$
> 又 $\sec^2\phi=1+\lambda\tan^2\theta$，且
> $$
> \theta'=\cos^2\theta+(\lambda+q)\sin^2\theta
> =\frac{1+(\lambda+q)\tan^2\theta}{\sec^2\theta},
> $$
> 所以
> $$
> \phi'
> =\sqrt{\lambda}\frac{1+(\lambda+q)\tan^2\theta}
> {1+\lambda\tan^2\theta}
> =\sqrt{\lambda}+\frac{q}{\sqrt{\lambda}}\sin^2\phi.
> $$
>
> **4.5** 把 4.4 的方程在 $[a,b]$ 上积分：
> $$
> \phi(b,\lambda)
> \ge\phi(a,\lambda)+\sqrt{\lambda}(b-a)
> -\frac{1}{\sqrt{\lambda}}\int_a^b|q|.
> $$
> 由于 $\phi(a,\lambda)$ 有界，右端当 $\lambda\to+\infty$ 时趋于
> $+\infty$。又 $|\phi-\theta|<\pi/2$，故
> $\theta(b,\lambda)\to+\infty$。于是对每个充分大的整数 $k$，
> 连续严格递增函数 $w(\lambda)=\theta(b,\lambda)$ 必与水平线
> $\beta+k\pi$ 相交一次，给出一个特征值；$k$ 任意大，
> 故特征值有无穷多个且趋于 $+\infty$。
>
> **4.6** 当 $q=0$ 时，取解 $\varphi(x)=\sin(\sqrt{\lambda}x)$，
> 则
> $$
> \theta(x,\lambda)
> =\arctan\!\left(\frac{\tan(\sqrt{\lambda}x)}{\sqrt{\lambda}}\right),
> $$
> 其中分支取 $\theta(0,\lambda)=0$ 且连续。$\theta(\pi,\lambda)=k\pi$
> 当且仅当 $\sqrt{\lambda}\pi=k\pi$，即 $\lambda=k^2$。
> 由结点计数推论，$\lambda=k^2$ 对应的特征函数
> $\sin(kx)$ 在 $(0,\pi)$ 内恰有 $k-1$ 个零点；
> 所以 $k=1$ 时 0 个零点，$k=2$ 时 1 个零点（位于 $x=\pi/2$）。
