---
title: 特征函数正交性与广义 Fourier 级数
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - orthogonality
  - fourier-series
  - eigenfunctions
aliases:
  - SL 特征函数正交性
  - 广义 Fourier 级数
---

# 06 特征函数正交性与广义 Fourier 级数

## 同一特征值对应线性相关

> [!lemma]
> 设 $\lambda$ 是正则 SL 问题的特征值，$\varphi,\psi$ 是同一 $\lambda$
> 的两个特征函数，则 $\varphi,\psi$ 线性相关。

由边界条件

$$
\varphi(a)\cos\alpha-\varphi'(a)\sin\alpha=0,
\qquad
\psi(a)\cos\alpha-\psi'(a)\sin\alpha=0,
$$

可得

$$
\varphi(a)\psi'(a)-\varphi'(a)\psi(a)=0,
$$

即 $W(a)=0$。对二阶线性齐次方程，Wronskian 恒为零当且仅当两解线性相关。
因此正则 SL 问题的每个特征值都是单重的。

## 不同特征值正交

> [!theorem] 正交性
> 设 $\lambda_n\neq\lambda_m$，$\varphi_n,\varphi_m$ 分别是对应特征函数，则
> $$
> \int_a^b r(x)\,\varphi_n(x)\varphi_m(x)\,dx=0.
> $$

证明：两个方程分别为

$$
-\bigl(p\varphi_n'\bigr)'+q\varphi_n=\lambda_n r\varphi_n,
$$

$$
-\bigl(p\varphi_m'\bigr)'+q\varphi_m=\lambda_m r\varphi_m.
$$

第一式乘 $\varphi_m$，第二式乘 $\varphi_n$，相减得

$$
(\lambda_n-\lambda_m)r\varphi_n\varphi_m
=\frac{d}{dx}\Bigl[p\bigl(\varphi_n\varphi_m'-\varphi_n'\varphi_m\bigr)\Bigr].
$$

积分并利用分离型自伴边界条件，右端为零。因 $\lambda_n\neq\lambda_m$，
故正交。

记

$$
S_n=\int_a^b r(x)\varphi_n^2(x)\,dx>0.
$$

归一化特征函数

$$
e_n(x)=\frac{\varphi_n(x)}{\sqrt{S_n}}
$$

构成带权 $L^2_r[a,b]$ 中的正交规范系。

## 广义 Fourier 级数

设 $\{\varphi_n\}_{n=0}^\infty$ 是 SL 问题的特征函数系。对函数 $f$，形式上

$$
f(x)\sim\sum_{n=0}^{\infty}a_n\varphi_n(x),
$$

其中广义 Fourier 系数为

$$
a_n=\frac{1}{S_n}\int_a^b f(x)\varphi_n(x)r(x)\,dx.
$$

若区间归一化为 $[0,1]$ 且权 $r=1$，则

$$
a_n=\frac{1}{S_n}\int_0^1 f(x)\varphi_n(x)\,dx.
$$

> [!note] 完备性
> “特征函数系是否完备”并非显然。正规 SL 问题在带权 $L^2$ 空间中的完备性
> 可由 Hilbert–Schmidt 理论或变分方法证明；而关于“解能在多大的 Hilbert 空间中
> 等价于该空间内所有正交函数系”的问题，属于左定理论 (left-definite theory) 的研究范围。

> [!tip] 与研究的联系
> 相关前沿问题包括：SL 特征函数系/多项式系在左定空间 $H^s$ 中的完备性，
> 以及特征值间距 $\lambda_{n+1}-\lambda_n$ 与比值 $\lambda_{n+1}/\lambda_n$ 的最优界。
