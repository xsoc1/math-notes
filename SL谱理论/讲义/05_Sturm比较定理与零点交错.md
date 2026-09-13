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
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\03_oscillation.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[04_Pruefer变换与特征值存在性]]"
---

# 05 Sturm 比较定理与零点交错

> [!info] 本讲位置
> 模块 B：化简与振荡。前置：[[04_Pruefer变换与特征值存在性]]；下一讲：[[06_特征函数正交性与广义Fourier级数]]。


> [!abstract] 本讲目标
> 证明零点简单性、Sturm 比较定理与零点交错，并掌握正势函数判别法。

> [!question] 基本问题
> 两个方程的系数大小如何控制解的零点数量与位置？


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

![[fig_sturm.svg|560]]

*图 5：Sturm 比较定理中的零点交错。*

**证明** 用反证法。不妨设 $\varphi>0$ 于 $(x_1,x_2)$，并设 $\psi$ 在
$(x_1,x_2)$ 内没有零点，从而 $\psi>0$。定义 Wronskian

$$
W(x)=\varphi'(x)\psi(x)-\varphi(x)\psi'(x).
$$

由两个方程相减得

$$
W'+pW=(q_2-q_1)\varphi\psi\ge 0.
$$

因此

$$
\left(e^{\int p\,dx}W\right)'\ge 0.
$$

于是

$$
W(x_2)\ge W(x_1)e^{-\int_{x_1}^{x_2}p\,dx}.
$$

在相邻零点处，若 $\varphi>0$，则 $\varphi'(x_1)>0$，$\varphi'(x_2)<0$，因此

$$
W(x_1)=\varphi'(x_1)\psi(x_1)>0,\qquad
W(x_2)=\varphi'(x_2)\psi(x_2)<0.
$$

这与 $W(x_2)>0$ 矛盾。故 $\psi$ 在 $(x_1,x_2)$ 内必有零点。 $\square$

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

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 2 §2.6, Theorem 2.6.2–2.6.3：Sturm 分离定理与比较定理的完整陈述与证明。
> - A. Zettl, Ch 4 §4.3、§4.6：结点计数与分离边界条件下的振荡刻画。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

Wronskian 与比较定理给出零点单调控制；零点交错说明不同解的振荡次序。

## 习题

> [!question] 5.1
> 用 Sturm 比较定理说明 $y''+2y=0$ 的解在任意长度为 $\pi/\sqrt{2}$ 的区间内
> 必有零点。

> [!question] 5.2
> 证明：若 $y$ 是非零解且 $y(x_0)=0$，则 $y'(x_0)\neq0$。

> [!question] 5.3
> 对 $y''+q(x)y=0$，$q(x)\ge m>0$，证明任意非零解有无穷多个零点，
> 并说明相邻零点间距不超过 $\pi/\sqrt{m}$。

> [!success]- 解答
> **5.1** 比较方程 $y''+2y=0$ 与 $y''+m y=0$，取 $m=2$。
> 常系数解的相邻零点间距为 $\pi/\sqrt{2}$。由 Sturm 比较定理，
> 任意非零解的相邻零点间距不超过该值。
>
> **5.2** 若 $y(x_0)=y'(x_0)=0$，则初值问题的唯一解是 $y\equiv0$，
> 与 $y$ 非零矛盾。
>
> **5.3** 将 $y''+q(x)y=0$ 与 $y''+m y=0$ 比较即可。
> 因为正势函数使解不断振荡，零点可以无限延续到右侧；
> 相邻零点间距不超过常系数方程的 $\pi/\sqrt{m}$。
