---
title: "第 9 章 Lebesgue 空间与一致可积性"
date: 2026-09-27
tags:
  - higher-probability
  - measure-theory
  - probability
  - lp-space
  - uniform-integrability
  - theory-note
  - chapter-09
  - source/upper-volume
aliases:
  - "Lebesgue 空间"
  - "一致可积"
  - "Vitali 收敛定理"
note_type: "chapter"
source_volume: "上册"
source_chapter: "第 9 章"
source_pages: "PDF 226–246"
source: "《测度论基础与高等概率论》"
status: "draft"
source_check: "已按原书扫描页核对 Jensen、Kimball、Hölder、Minkowski、不变性及一致可积准则；OCR 文本存在噪声，个别公式仍需逐页图像复核"
exercise_range: "上册习题集第 9 章（9.1–9.3 节）"
content_boundary: "原书框架 + 教材式解释"
---

# 第 9 章 Lebesgue 空间与一致可积性

> [!abstract] 核心问题
> 单个随机变量的可积性不足以控制一个函数列的极限。本章先建立 $L^p$ 范数与积分不等式，再以一致可积性刻画“质量不会逃向越来越高的尖峰”，最终给出依概率收敛何时升级为 $L^p$ 收敛的准则。

## 9.1 几个重要的积分不等式

### 9.1.1 Lebesgue 空间与本性上确界

对 $0<p<\infty$，定义

$$
L^p(\Omega,\mathcal F,\mu)=\left\{f:\int|f|^p\,d\mu<\infty\right\}/\text{a.e. 等价},
\qquad
\|f\|_p=\left(\int|f|^p\,d\mu\right)^{1/p}.
$$

对 $p=\infty$，定义 $L^\infty$ 为本性有界函数的 a.e. 等价类，并令

$$
\|f\|_\infty=\inf\{c\ge0:\mu(|f|>c)=0\}.
$$

$L^p$ 的元素是等价类，而非某个在零测集上也固定取值的函数。$p\ge1$ 时 $\|\cdot\|_p$ 是范数，且 $L^p$ 为 Banach 空间；$0<p<1$ 时三角不等式通常不成立，故此时它是准范数空间而不是上述意义下的 Banach 空间。$L^\infty$ 在本性上确界范数下也是 Banach 空间。

### 9.1.2 Jensen 与 Kimball 不等式

若 $\psi:\mathbb R\to\mathbb R$ 凸、$X$ 可积且 $\psi(X)$ 可积，则 Jensen 不等式为

$$
\psi(\mathbb EX)\le\mathbb E\psi(X).
$$

它把“先平均再代入凸函数”与“先代入再平均”比较。取 $\psi(x)=x^2$ 得 $(\mathbb EX)^2\le\mathbb EX^2$；取 $\psi(x)=|x|^p$（$p\ge1$）可比较不同阶矩。

若 $u,v:\mathbb R\to\mathbb R$ 同向单调，即同时不减或同时不增，并且有关期望存在，则 Kimball 不等式为

$$
\mathbb E[u(X)]\,\mathbb E[v(X)]
\le \mathbb E[u(X)v(X)],
\qquad
\operatorname{Cov}(u(X),v(X))\ge0.
$$

证明取独立同分布的 $X_1,X_2$。同向单调性给出

$$
[u(X_1)-u(X_2)][v(X_1)-v(X_2)]\ge0.
$$

取期望并展开，交叉项由独立性分解，便得到结论。该结论针对同一个实随机变量的两个同向单调函数，不应不加条件地推广到任意相关随机变量。

### 9.1.3 Hölder 与 Minkowski 不等式

若 $1<p,q<\infty$ 且 $1/p+1/q=1$，则 Young 不等式 $ab\le a^p/p+b^q/q$ 推出 Hölder 不等式

$$
\int|fg|\,d\mu\le\|f\|_p\|g\|_q.
$$

端点形式为 $\|fg\|_1\le\|f\|_1\|g\|_\infty$。$p=q=2$ 时是 Cauchy–Schwarz 不等式。

对 $1\le p\le\infty$，Minkowski 不等式为

$$
\|f+g\|_p\le\|f\|_p+\|g\|_p.
$$

它给出 $L^p$ 的三角不等式。与有限和版本的 $c_r$ 不等式相比，Minkowski 直接控制和的 $L^p$ 范数，适用于积分和随机变量列。

## 9.2 三类 Lebesgue 空间

### 9.2.1 $L^p$ 空间

对 $1\le p<\infty$，$(L^p,\|\cdot\|_p)$ 是 Banach 空间。有限测度空间上，可积简单函数在 $L^p$ 中稠密；在局部紧 Hausdorff 空间上的 Radon 测度情形，$C_c$ 的稠密性将在第 11 章说明。

若 $\mu(\Omega)<\infty$ 且 $1\le p<q<\infty$，由 Hölder 不等式

$$
\|f\|_p\le \mu(\Omega)^{1/p-1/q}\|f\|_q.
$$

概率空间上尤其有 $\|X\|_p\le\|X\|_q$。有限测度假设不可略去：在无限测度空间上，高阶可积未必推出低阶可积。

### 9.2.2 $L^\infty$ 空间

$\|f\|_\infty$ 是本性上确界：允许在零测集上超过该界，但不能在正测度集合上超过它。若 $f\in L^\infty$ 且 $\mu(\Omega)<\infty$，则 $f\in L^p$ 对每个有限 $p$ 成立，且

$$
\lim_{p\to\infty}\|f\|_p=\|f\|_\infty.
$$

若 $\mu(\Omega)=\infty$，即使 $f$ 本性有界，$f$ 也未必属于任一有限阶 $L^p$。

### 9.2.3 有限符号测度空间

记 $M(\Omega,\mathcal F)$ 为有限符号测度全体，赋予变差范数

$$
\|\nu\|_{\mathrm{var}}=|\nu|(\Omega).
$$

这是 Banach 空间。若 $\nu=f\,\mu$，则 $\|\nu\|_{\mathrm{var}}=\int|f|\,d\mu=\|f\|_{L^1(\mu)}$。因此 $L^1$ 函数与绝对连续有限符号测度之间有自然的等距对应；第 12 章的弱收敛则研究测度序列在积分测试下的收敛。

## 9.3 一致可积族

### 9.3.1 定义与尾部刻画

有限测度空间上，函数族 $\mathcal U\subset L^1$ 称一致可积，若

$$
\lim_{a\to\infty}\sup_{f\in\mathcal U}
\int_{\{|f|>a\}}|f|\,d\mu=0.
$$

在概率空间上，对随机变量族 $(X_t)$，即

$$
\lim_{a\to\infty}\sup_t
\mathbb E\bigl[|X_t|\mathbf1_{\{|X_t|>a\}}\bigr]=0.
$$

这表示所有变量的大幅值尾部对期望的贡献可以被同一个阈值统一压小。单独有 $\sup_t\mathbb E|X_t|<\infty$ 只控制总积分，不排除越来越窄、越来越高的尖峰。

### 9.3.2 Vitali 一致可积判别准则

若 $\mu(\Omega)<\infty$，则 $\mathcal U\subset L^1$ 一致可积，当且仅当：

1. 积分一致有界：$\sup_{f\in\mathcal U}\int|f|\,d\mu<\infty$；
2. 积分一致绝对连续：对每个 $\varepsilon>0$，存在 $\delta>0$，使 $\mu(A)<\delta$ 蕴含 $\sup_{f\in\mathcal U}\int_A|f|\,d\mu<\varepsilon$。

另一常用充分条件是存在凸、单调递增函数 $\psi$，满足 $\psi(x)/x\to\infty$，且 $\sup_{f\in\mathcal U}\int\psi(|f|)\,d\mu<\infty$。特别地，在概率空间上，若对某个 $\delta>0$ 有 $\sup_n\mathbb E|X_n|^{1+\delta}<\infty$，則 $(X_n)$ 一致可積。

### 9.3.3 $L^p$ 收敛准则

设 $p>0$，且每个 $X_n\in L^p$。下列条件等价：

1. $X_n\xrightarrow{P}X$，且 $(|X_n|^p)$ 一致可积；
2. $\mathbb E|X_n-X|^p\to0$；
3. $X_n\xrightarrow{P}X$，且 $\mathbb E|X_n|^p\to\mathbb E|X|^p<\infty$。

这是概率空间上的 Vitali 型收敛准则。对 $p=1$，它说明“依概率收敛 + 一致可积”推出 $L^1$ 收敛；对一般 $p$，需要对 $p$ 次幂族控制尾部。

**证明主线。** $L^p$ 收敛先推出依概率收敛；再用三角不等式和尾部估计得到 $|X_n|^p$ 一致可积。反向则先将误差截断在小值区间，利用依概率收敛控制有界部分，再用一致可积性统一控制尾部。条件 3 与条件 1 等价的关键是依概率收敛配合 $p$ 阶矩收敛可推出 $p$ 次幂族的一致可积性。

需要区分：依概率收敛本身不推出期望或 $L^p$ 收敛；即使 $X_n\xrightarrow{P}0$，少量概率上的大峰值仍可能保留非零期望。

## 本章小结

- $L^p$ 中的对象是 a.e. 等价类；$p\ge1$ 时是 Banach 空间，$0<p<1$ 时范数结构失效。
- Jensen、Kimball、Hölder 和 Minkowski 分别处理凸函数平均、同向单调函数相关性、乘积积分和和的范数。
- 一致可积同时控制总积分和大值尾部；在有限测度空间上可用 Vitali 双条件刻画。
- 概率收敛升级为 $L^p$ 收敛需要额外的统一尾部控制，不能仅依赖逐点或依概率收敛。

## 习题导航

- [[高等概率论/01_测度论基础与高等概率论上册习题集#9.1 几个重要的积分不等式|9.1 几个重要的积分不等式]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#9.2 三类 Lebesgue 空间|9.2 三类 Lebesgue 空间]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#9.3 一致可积族|9.3 一致可积族]]

## 相关链接

- [[07_Lebesgue积分与数学期望|第 7 章 Lebesgue 积分与数学期望]]
- [[08_符号测度与Radon-Nikodym定理|第 8 章 符号测度与 Radon–Nikodym 定理]]
- [[10_乘积空间上的测度与积分|第 10 章 乘积空间上的测度与积分]]
- [[12_弱收敛|第 12 章 弱收敛]]
- [[00_上册总览|高等概率论上册总览]]

## 跨主题参照

- [[泛函分析/04_赋范空间与Banach空间/02_典型Banach空间与完备性|典型Banach空间与完备性]]。补读典型 Banach 空间中 $L^p$ 完备性的证明。
