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
