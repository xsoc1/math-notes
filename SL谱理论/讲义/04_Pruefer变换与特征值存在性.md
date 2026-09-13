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

> [!theorem] 特征值存在性
> 对每个整数 $k$，方程
> $$
> w(\lambda)=\beta+k\pi
> $$
> 恰好有一个解。于是 SL 问题有离散特征值
> $$
> \lambda_0<\lambda_1<\lambda_2<\cdots,\qquad \lim_{n\to\infty}\lambda_n=+\infty.
> $$

> [!tip] 下一步
> 特征值的零点计数与交错性质由 [[05_Sturm比较定理与零点交错|Sturm 比较定理]] 给出。

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
