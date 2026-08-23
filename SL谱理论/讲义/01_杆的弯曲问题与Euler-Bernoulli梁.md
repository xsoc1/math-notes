---
title: 杆的弯曲问题与 Euler–Bernoulli 梁
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - mechanics
  - euler-bernoulli
aliases:
  - 杆的弯曲
  - Euler-Bernoulli 梁
---

# 01 杆的弯曲问题与 Euler–Bernoulli 梁

## 物理设定

一根杆，$x=0$ 处以轴承固定，$x=l$ 处以铰链固定，轴向受压力 $P$，考虑其弯曲状态。

## 小挠度近似与曲率

若挠曲线为 $y=y(x)$，曲率半径为 $\rho$，精确曲率为

$$
\kappa=\frac{1}{\rho}=\frac{|y''|}{\bigl(1+(y')^2\bigr)^{3/2}}.
$$

在小挠度、小斜率情形下 $|y'|\ll 1$，因此

$$
|y''|\approx\frac{1}{\rho}=\frac{|y''|}{\bigl(1+(y')^2\bigr)^{3/2}}.
$$

> [!note] 近似条件
> 弯曲理论通常只在 $|y'|\ll 1$ 时使用线性近似；若斜率不可忽略，则需要非线性梁理论。

## Euler–Bernoulli 梁的应变、应力与弯矩

取梁的一小段，设中性层曲率半径为 $\rho$，离中性层距离为 $y$ 的纤维
原长为 $L=\rho\,\Delta\theta$，变形后长度为 $L'=(\rho+y)\Delta\theta$。应变为

$$
\varepsilon=\frac{L'-L}{L}
=\frac{(\rho+y)\Delta\theta-\rho\Delta\theta}{\rho\Delta\theta}
=\frac{y}{\rho}.
$$

由胡克定律，应力为

$$
\sigma=E\varepsilon=E\frac{y}{\rho},
$$

其中 $E$ 是杨氏模量。横截面上微元 $dA$ 上的力为 $dF=\sigma\,dA$，对中性轴的弯矩为

$$
dM=y\,dF=y\sigma\,dA.
$$

总弯矩为

$$
M=\int_A y\,\sigma\,dA=\frac{E}{\rho}\int_A y^2\,dA=\frac{EI}{\rho},
$$

其中截面惯性矩

$$
I=\int_A y^2\,dA.
$$

## 平衡方程与特征值问题

在小挠度近似下 $\frac{1}{\rho}\approx -y''$，故

$$
-EI\,y''=M.
$$

对轴向受压杆，$M=Py$，于是

$$
-EI\,y''=Py.
$$

令

$$
k^2=\frac{P}{EI},
$$

得到常系数二阶方程

$$
y''+k^2y=0,
$$

边界条件为

$$
y(0)=0,\qquad y(l)=0.
$$

> [!example] 离散特征值
> 该问题的非零解只存在于
> $$
> \lambda_n=\left(\frac{n\pi}{l}\right)^2,\qquad n=1,2,3,\dots
> $$
> 这些 $\lambda_n$ 对应压杆失稳的模态，是最简单的 SL 特征值问题。

## 从常系数到变系数

实际工程中密度、刚度可能随位置变化，更一般的振动问题给出

$$
-\frac{d}{dx}\left(p(x)\frac{dy}{dx}\right)+\bigl[q(x)+\lambda r(x)\bigr]y=0,
\qquad x\in[a,b].
$$

其中 $p(x)>0$，$r(x)>0$。这就是下一节的正则 SL 问题。

> [!tip] 下一步
> 继续阅读 [[02_正则Sturm-Liouville问题|正则 Sturm–Liouville 问题]]。
