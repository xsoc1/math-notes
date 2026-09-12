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
status: self-reviewed
prerequisites:
  - "[[02_正则Sturm-Liouville问题]]"
---

# 03 Liouville 标准形

一般 SL 方程可以通过自变量与因变量的变换，化为更简单的“标准形”

$$
y''+\bigl[\lambda+q(x)\bigr]y=0.
$$

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

其中 $Q(s)$ 是由原系数 $p,q,r$ 决定的新势函数。

> [!note] 结论
> 只需研究
> $$
> y''+\bigl[\lambda+q(x)\bigr]y=0.
> $$
> 这解释了为何很多 SL 谱理论直接以这种形式展开。

> [!tip] 与 Prüfer 变换的连接
> 标准形 $y''+[\lambda+q(x)]y=0$ 是 [[04_Pruefer变换与特征值存在性|Prüfer 变换]] 的出发点。

## 习题

> [!question] 3.1
> 当 $p=r=1$，$q=0$，$a=0$，$b=1$ 时，计算 $s(x)$ 与 $c$。

> [!question] 3.2
> 验证在 $p=r=1$ 时，Liouville 标准形就是原方程本身。

> [!question] 3.3
> 设 $p(x)=1$，$r(x)=x^2$，求自变量变换 $s=s(x)$。

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
