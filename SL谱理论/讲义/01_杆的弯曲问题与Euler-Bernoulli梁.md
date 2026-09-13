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
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\01_physics_to_sl.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
---

# 01 杆的弯曲问题与 Euler–Bernoulli 梁

> [!info] 本讲位置
> 模块 A：物理动机与经典框架。前置：[[00_SL谱理论讲义总览]]；下一讲：[[02_正则Sturm-Liouville问题]]。


> [!abstract] 本讲目标
> 从杆的弯曲问题建立 Euler--Bernoulli 梁方程，并引出正则 SL 问题。

> [!question] 基本问题
> 为什么一个力学平衡问题会变成特征值问题？


## 物理设定

一根杆，$x=0$ 处以轴承固定，$x=l$ 处以铰链固定，轴向受压力 $P$，考虑其弯曲状态。

![[fig_beam.svg|520]]

*图 1：轴向受压杆的弯曲模型。*

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

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 3 §3.1、Ch 4 §4.1：正则 SL 问题与自伴问题的标准框架。
> - A. Zettl, Ch 1 §1.2–§1.5：一阶系统与标量方程解的存在唯一性、端点延拓，可作为建模后数学处理的基础。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

杆的弯曲给出 $y''+k^2y=0$；变系数问题进一步化为 SL 方程与分离型边界条件。

## 习题

> [!question] 1.1
> 设杆两端简支，$y(0)=y(l)=0$。证明非零解存在的充要条件是
> $$
> k=\frac{n\pi}{l},\qquad n=1,2,3,\dots
> $$
> 并写出对应的挠曲线形状。

> [!question] 1.2
> 用截面惯性矩的量纲说明 $EIy''$ 与弯矩同量纲。

> [!question] 1.3
> 若斜率不再很小，为什么 $\kappa\approx y''$ 会失效？写出精确曲率公式并说明何时两者接近。

> [!success]- 解答
> **1.1** 方程 $y''+k^2y=0$ 的通解为
> $$
> y=A\sin kx+B\cos kx.
> $$
> 由 $y(0)=0$ 得 $B=0$；由 $y(l)=0$ 得 $A\sin kl=0$。非零解要求
> $A\neq0$，故 $\sin kl=0$，即 $k=n\pi/l$。对应挠曲线为
> $y_n(x)=A\sin(n\pi x/l)$。
>
> **1.2** $E$ 的量纲是 $[\text{力}]/[\text{长度}]^2$，$I$ 的量纲是
> $[\text{长度}]^4$，$y''$ 的量纲是 $[\text{长度}]^{-1}$，因此
> $EIy''$ 的量纲是 $[\text{力}]\cdot[\text{长度}]$，与弯矩相同。
>
> **1.3** 精确曲率为
> $$
> \kappa=\frac{|y''|}{(1+y'^2)^{3/2}}.
> $$
> 当 $|y'|$ 不小时，$(1+y'^2)^{3/2}$ 明显大于 $1$，不能略去。
> 只有当 $|y'|\ll1$ 时才有 $\kappa\approx|y''|$。
