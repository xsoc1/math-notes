---
title: 正则 Sturm–Liouville 问题
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - sturm-liouville
  - boundary-value-problem
aliases:
  - 正则 SL 问题
  - SL 边值问题
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\01_physics_to_sl.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[01_杆的弯曲问题与Euler-Bernoulli梁]]"
---

# 02 正则 Sturm–Liouville 问题

> [!info] 本讲位置
> 模块 A：物理动机与经典框架。前置：[[01_杆的弯曲问题与Euler-Bernoulli梁]]；下一讲：[[03_Liouville标准形]]。

> [!abstract] 本讲目标
> 准确表述正则 SL 问题及其分离型边界条件，并看懂 Dirichlet 例子。

> [!question] 基本问题
> 正则 SL 问题由哪些数据组成，边界条件起什么作用？

## 方程

给定 $p\in C^1[a,b]$，$p>0$，$q,r\in C[a,b]$，$r>0$，以及实数 $K,L,M,N$。
正则 Sturm–Liouville (SL) 问题是求 $\lambda\in\mathbb{C}$ 与非零函数
$y\in C^2[a,b]$，使得

$$
-\bigl(p(x)y'(x)\bigr)'+q(x)y(x)=\lambda r(x)y(x),
\qquad x\in(a,b),
$$

并满足分离型边界条件

$$
K y(a)-L y'(a)=0,\qquad M y(b)+N y'(b)=0,
$$

其中

$$
K^2+L^2>0,\qquad M^2+N^2>0.
$$

满足上述条件的 $\lambda$ 称为特征值，对应的非零解 $y$ 称为特征函数。

> [!note] 角度形式
> 令
> $$
> \cos\alpha=\frac{K}{\sqrt{K^2+L^2}},\qquad
> \sin\alpha=\frac{L}{\sqrt{K^2+L^2}},
> $$
> $$
> \cos\beta=\frac{M}{\sqrt{M^2+N^2}},\qquad
> \sin\beta=\frac{N}{\sqrt{M^2+N^2}},
> $$
> 则边界条件等价于
> $$
> y(a)\cos\alpha-y'(a)\sin\alpha=0,
> \qquad
> y(b)\cos\beta-y'(b)\sin\beta=0.
> $$

## 例子：Dirichlet 问题

取 $[a,b]=[0,l]$，$p=1$，$q=0$，$r=1$，边界条件 $y(0)=0$，$y(l)=0$。问题为

$$
-y''=\lambda y,\qquad y(0)=y(l)=0.
$$

特征值为

$$
\lambda_n=\left(\frac{n\pi}{l}\right)^2,\qquad n=1,2,\dots,
$$

特征函数为

$$
y_n(x)=\sin\frac{n\pi x}{l}.
$$

这些函数在 $[0,l]$ 上关于权 $1$ 正交。

> [!note] 物理来源：边界条件的含义
> 分离边界条件 $Ky(a)-L(py')(a)=0$ 描述端点与环境的相互作用：
> $y=0$ 是固定端（Dirichlet），$y'=0$ 是自由端（Neumann），
> $y'=hy$ 是弹性支撑（Robin），$p y'$ 是端点处的剪力或张力。
> 周期条件 $y(a)=y(b)$、$y'(a)=y'(b)$ 描述闭合环。
> 自伴边界条件对应“边界不耗散能量、满足互易性”，因此频率为实数、模态正交；
> 判断一个 SL 问题是否有物理意义，第一步就是看它的边界条件是否自伴。

> [!tip] 下一步
> 一般变系数 SL 问题可以通过 [[03_Liouville标准形|Liouville 标准形]]
> 化为 $y''+[\lambda+q(x)]y=0$。

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 3 §3.1、§3.4：正则两点边值问题的定义与问题空间。
> - A. Zettl, Ch 4 §4.1–§4.2：正则 SL 问题与边界条件的标准框架（自伴性在第 07 讲引入）。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

正则 SL 问题由系数 $p,q,r$、区间与分离边界条件确定；Dirichlet 例子给出最简谱结构。

## 习题

> [!question] 2.1
> 验证 Dirichlet 问题 $-y''=\lambda y$，$y(0)=y(l)=0$ 的特征函数
> $y_n(x)=\sin(n\pi x/l)$ 在 $[0,l]$ 上两两正交。

> [!question] 2.2
> 将边界条件 $y(a)\cos\alpha-y'(a)\sin\alpha=0$ 化为
> $K y(a)-L y'(a)=0$ 的形式，并给出 $K,L$ 的一组取值。

> [!question] 2.3
> 写出 Robin 边界条件 $y'(0)=h y(0)$，$y(l)=0$ 对应的 $K,L,M,N$。

> [!question] 2.4
> 求 Neumann 问题
> $$
> -y''=\lambda y,\qquad y'(0)=y'(\pi)=0
> $$
> 的特征值与特征函数，并验证不同特征函数正交。

> [!question] 2.5
> 设 $u,v$ 满足以 $py'$ 写出的分离边界条件
> $$
> K y(a)-L(py')(a)=0,
> \qquad
> M y(b)+N(py')(b)=0.
> $$
> 证明 $[u,v](b)-[u,v](a)=0$，其中
> $$
> [u,v](x)=u(x)(pv')(x)-(pu')(x)v(x).
> $$

> [!success]- 解答
> **2.1** 对 $m\neq n$，
> $$
> \int_0^l \sin\frac{m\pi x}{l}\sin\frac{n\pi x}{l}\,dx
> =\frac{l}{2}\delta_{mn}.
> $$
> 因此当 $m\neq n$ 时积分为零。
>
> **2.2** 取
> $$
> K=\cos\alpha,\qquad L=\sin\alpha,
> $$
> 则 $K y(a)-L y'(a)=0$ 与角度形式一致。
>
> **2.3** 在 $x=0$ 处 $y'(0)-h y(0)=0$，可取 $K=-h,\ L=-1$；
> 在 $x=l$ 处 $y(l)=0$，可取 $M=1,\ N=0$。

>
> **2.4** $\lambda=0$ 时 $y=Ax+B$，$y'\equiv A$，Neumann 条件要求
> $A=0$，故 $\lambda_0=0$，$y_0=1$。
> 对 $\lambda=\mu^2>0$，$y=A\cos\mu x+B\sin\mu x$，
> $y'(0)=B\mu=0$ 得 $B=0$，$y'(\pi)=-A\mu\sin\mu\pi=0$
> 得 $\mu=n$，$n=1,2,\dots$。因此
> $$
> \lambda_n=n^2,\qquad y_n(x)=\cos(nx),\qquad n=0,1,2,\dots.
> $$
> 对 $m\neq n$，
> $$
> \int_0^\pi\cos(mx)\cos(nx)\,dx=0,
> $$
> 故特征函数两两正交。
>
> **2.5** 在 $x=a$ 处，向量 $(u(a),(pu')(a))$ 与
> $(v(a),(pv')(a))$ 都满足同一个非平凡线性方程
> $K y-L(py')=0$，其解空间是一维的，因此两向量成比例，
> 从而
> $$
> u(a)(pv')(a)-(pu')(a)v(a)=0.
> $$
> 同理在 $x=b$ 处
> $u(b)(pv')(b)-(pu')(b)v(b)=0$。于是
> $$
> [u,v](b)-[u,v](a)=0.
> $$
> 这说明分离型边界条件使边界项消失。对称性与自伴性的完整讨论见 [[07_自伴边界条件与Hilbert空间框架]]。
