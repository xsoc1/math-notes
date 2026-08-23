---
title: Sturm 比较定理与零点交错
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - sturm-comparison
  - zeros
  - oscillation
aliases:
  - Sturm 比较定理
  - Sturm comparison theorem
  - 零点交错
---

# 05 Sturm 比较定理与零点交错

## 零点的简单性

> [!lemma] 非零解的零点是简单的
> 设 $y''+p(x)y'+q(x)y=0$ 的系数连续，$y$ 是非零解。
> 若 $y(x_0)=0$，则 $y'(x_0)\neq 0$。

证明：若 $y(x_0)=y'(x_0)=0$，则初值问题在 $x_0$ 处只有平凡解 $y\equiv0$，
与“非零解”矛盾。

> [!corollary] 零点孤立
> 非零解的零点是孤立的，在有限区间内只有有限多个零点。

## Sturm 比较定理

考虑两个二阶方程

$$
y''+p(x)y'+q_1(x)y=0,
$$

$$
y''+p(x)y'+q_2(x)y=0,
$$

其中 $q_2(x)\ge q_1(x)$。

> [!theorem] Sturm 比较定理
> 设 $\varphi$ 是第一个方程的非零解，$x_1<x_2$ 是它的两个相邻零点。
> 则第二个方程的任意非零解 $\psi$ 在 $[x_1,x_2]$ 内至少有一个零点。

证明思路：用反证法，设 $\psi>0$ 于 $(x_1,x_2)$。定义 Wronskian

$$
W(x)=\varphi'(x)\psi(x)-\varphi(x)\psi'(x).
$$

由两个方程相减得

$$
W'+pW=(q_1-q_2)\varphi\psi\le 0.
$$

因此

$$
\left(e^{\int p\,dx}W\right)'\le 0.
$$

而在相邻零点处 $W(x_1)$ 与 $W(x_2)$ 的符号应相反，矛盾。

## 零点交错

> [!theorem] 零点交错
> 设 $\varphi_1,\varphi_2$ 是同一个二阶线性方程的线性无关非零解。
> 则它们的零点互相交错：在 $\varphi_1$ 的任意两个相邻零点之间，
> $\varphi_2$ 至少有一个零点；反之亦然。

若两解有公共零点 $x_0$，则

$$
W(x_0)=\varphi_1(x_0)\varphi_2'(x_0)-\varphi_1'(x_0)\varphi_2(x_0)=0,
$$

于是线性相关，矛盾。结合 Sturm 比较定理即得交错性。

## 正势函数的判别法

> [!theorem]
> 考虑 $y''+q(x)y=0$。若存在 $m>0$ 使得 $q(x)\ge m$，则任意非零解有无穷多个零点，
> 且相邻零点间距
> $$
> \Delta x\le\frac{\pi}{\sqrt{m}}.
> $$

这来自与常系数方程 $y''+my=0$ 的比较：后者的相邻零点间距恰为
$\pi/\sqrt{m}$。

> [!tip] 与 Prüfer 的关系
> Prüfer 相位方程 $\theta'=\cos^2\theta+[\lambda+q]\sin^2\theta$ 是
> Sturm 比较定理的现代证明工具；两者共同构成 SL 振荡理论的核心。
