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
---

# 04 Prüfer 变换与特征值存在性

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
右端相位随之增大。由

$$
\frac{\partial\theta}{\partial\lambda}(a,\lambda)=0
$$

和相位方程对 $\lambda$ 求导，可得到

$$
\frac{\partial\theta}{\partial\lambda}(x,\lambda)>0,\qquad x>b.
$$

进一步，当 $\lambda\to-\infty$ 时 $w(\lambda)$ 趋于有限值；
当 $\lambda\to+\infty$ 时 $w(\lambda)\to+\infty$。

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
