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
---

# 02 正则 Sturm–Liouville 问题

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

> [!tip] 下一步
> 一般变系数 SL 问题可以通过 [[03_Liouville标准形|Liouville 标准形]]
> 化为 $y''+[\lambda+q(x)]y=0$。
