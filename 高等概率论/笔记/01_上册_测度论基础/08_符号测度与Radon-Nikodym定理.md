---
title: "第 8 章 不定积分和符号测度"
date: 2026-09-27
tags:
  - higher-probability
  - measure-theory
  - probability
  - signed-measure
  - theory-note
  - chapter-08
  - source/upper-volume
aliases:
  - "Hahn-Jordan 分解"
  - "Radon-Nikodym 定理"
  - "Lebesgue 分解定理"
note_type: "chapter"
source_volume: "上册"
source_chapter: "第 8 章"
source_pages: "PDF 195–225"
source: "《测度论基础与高等概率论》"
status: "draft"
source_check: "已按原书扫描页核对符号测度、Hahn-Jordan、Radon-Nikodym、Lebesgue 分解及分布函数分类；OCR 文本存在噪声，个别公式仍需逐页图像复核"
exercise_range: "上册习题集第 8 章（8.1–8.5 节）"
content_boundary: "原书框架 + 教材式解释"
---

# 第 8 章 不定积分和符号测度

> [!abstract] 核心问题
> 非负测度可以通过对密度积分构造；本章反过来研究带符号的可列可加集函数，并回答三个问题：如何把它拆成正负部分，何时它能写成相对于给定测度的密度积分，以及任意有限测度如何分解为离散、奇异连续和绝对连续部分。

## 8.1 符号测度与 Hahn-Jordan 分解

### 8.1.1 不定积分产生符号测度

设 $f$ 是关于测度 $\mu$ 可积的实值可测函数，定义

$$
\nu(A)=\int_A f\,d\mu,\qquad A\in\mathcal F.
$$

则 $\nu$ 是有限符号测度。若 $f\ge0$，它就是正测度。更一般地，若 $g$ 关于由 $f\,d\mu$ 产生的正测度 $\nu$ 可积，则积分换元公式为

$$
\int_A g\,d\nu=\int_A gf\,d\mu.
$$

这说明“测度由密度生成”后，关于新测度的积分可转回原测度计算。

### 8.1.2 Hahn 分解与 Jordan 分解

符号测度是取值于 $[-\infty,\infty]$、不同时取 $+\infty$ 和 $-\infty$、并满足可列可加性的集函数。Hahn 分解定理断言：存在不交可测集 $P,N$，$P\cup N=\Omega$，使得

$$
A\subset P\Longrightarrow\nu(A)\ge0,
\qquad
A\subset N\Longrightarrow\nu(A)\le0.
$$

这样的 $(P,N)$ 称 Hahn 分解。集合 $P,N$ 本身未必唯一，但由它们定义的正测度

$$
\nu^+(A)=\nu(A\cap P),\qquad
\nu^-(A)=-\nu(A\cap N)
$$

唯一，并满足 $\nu=\nu^+-\nu^-$。这称 Jordan 分解。正测度 $\nu^+$ 与 $\nu^-$ 相互奇异。

定义全变差测度 $|\nu|=\nu^++\nu^-$。对任意可测集 $A$，有

$$
|\nu(A)|\le |\nu|(A),\qquad
\nu^+=\frac{|\nu|+\nu}{2},\quad
\nu^- =\frac{|\nu|-\nu}{2}.
$$

因此 $|\nu|$ 衡量符号抵消前的总质量；有限符号测度的变差范数为 $\|\nu\|_{\mathrm{var}}=|\nu|(\Omega)$。

## 8.2 绝对连续与 Radon–Nikodym 定理

### 8.2.1 绝对连续与相互奇异

对正测度或符号测度 $\nu,\mu$，若每个 $\mu$-零集也是 $\nu$-零集，即

$$
\mu(A)=0\Longrightarrow\nu(A)=0,
$$

则称 $\nu$ 关于 $\mu$ 绝对连续，记 $\nu\ll\mu$。若存在 $N\in\mathcal F$ 使 $|\nu|(N^c)=0$ 且 $|\mu|(N)=0$，则称二者相互奇异，记 $\nu\perp\mu$。绝对连续且相互奇异只能推出零测度：若 $\nu\ll\mu$ 且 $\nu\perp\mu$，则 $\nu=0$。

### 8.2.2 Radon–Nikodym 定理

设 $\mu$、$\nu$ 都是 $\sigma$-有限正测度，且 $\nu\ll\mu$。则存在非负可测函数 $f$，使得对所有 $A\in\mathcal F$，

$$
\nu(A)=\int_A f\,d\mu.
$$

函数 $f$ 在 $\mu$-几乎处处意义下唯一，记作 $f=d\nu/d\mu$。有限符号测度版本中，$f$ 可取实值且可积；此时

$$
\nu(A)=\int_A\frac{d\nu}{d\mu}\,d\mu.
$$

若 $\nu=f\,\mu$，则 $d\nu/d\mu=f$ a.e.；密度相加和数乘与测度的线性运算相容。若 $\nu$ 与 $\mu$ 等价，则密度满足 $0<f<\infty$ a.e.（在相应的 $\sigma$-有限条件下）。

**证明结构。** 正测度情形先研究被 $\mu$ 控制的有限测度，并用简单函数逼近刻画可由积分表示的集合函数；$\sigma$-有限情形再将空间分割成有限测度块并拼接密度。符号测度由 Jordan 正负部分分别应用正测度定理得到。此处的 $\sigma$-有限假设不能在一般测度空间上随意省略。

## 8.3 相互奇异与 Lebesgue 分解定理

设 $\mu$ 是 $\sigma$-有限正测度，$\nu$ 是 $\sigma$-有限符号测度。Lebesgue 分解定理断言存在唯一的符号测度 $\nu_{\mathrm{ac}}$ 和 $\nu_{\mathrm{s}}$，使得

$$
\nu=\nu_{\mathrm{ac}}+\nu_{\mathrm{s}},\qquad
\nu_{\mathrm{ac}}\ll\mu,\qquad
\nu_{\mathrm{s}}\perp\mu.
$$

再对绝对连续部分使用 Radon–Nikodym 定理，得到

$$
\nu(A)=\int_A f\,d\mu+\nu_{\mathrm{s}}(A).
$$

第一项是相对于 $\mu$ 的密度部分，第二项集中在一个 $\mu$-零集上。唯一性依赖“绝对连续且奇异的测度只能为零”。

### 欧氏空间上有限 Borel 测度的三分解

有限 Borel 测度 $\rho$ 在 $\mathbb R^d$ 上有唯一分解

$$
\rho=\rho_{\mathrm d}+\rho_{\mathrm{sc}}+\rho_{\mathrm{ac}},
$$

其中 $\rho_{\mathrm d}$ 集中在至多可数个点上，$\rho_{\mathrm{sc}}$ 无原子且与 $d$ 维 Lebesgue 测度相互奇异，$\rho_{\mathrm{ac}}\ll\lambda_d$。若 $\rho$ 是概率测度且三个部分质量都非零，可以把各部分归一化，解释为离散、奇异连续和绝对连续三种成分的混合。

在一维分布函数中，这三部分分别对应跳跃部分、无跳跃但奇异的部分，以及具有密度的部分。Cantor 分布是奇异连续分布的典型例子；它连续，却没有 Lebesgue 密度。

## 8.4 分布函数的类型及分解

分布函数 $F(x)=\mathbb P(X\le x)$ 单调不减、右连续，并满足 $F(-\infty)=0$、$F(+\infty)=1$。它诱导唯一的概率测度 $\mathbb P_X$，且

$$
\mathbb P_X((a,b])=F(b)-F(a).
$$

因此分布函数的跳跃大小就是点质量：$\mathbb P(X=x)=F(x)-F(x-)$。若 $F$ 绝对连续，则存在密度 $f\ge0$ 使 $F(x)=\int_{-\infty}^x f(t)\,dt$；反之，连续性本身并不推出绝对连续性。

若有限 Borel 测度按上节分解，则其分布函数也相应分解为离散、奇异连续和绝对连续分布函数的加权和。分解的对象是诱导测度，不能只看曲线是否连续来判别类型。

## 8.5 左连续逆和均匀分布的构造

### 8.5.1 广义逆

对分布函数 $F$ 和 $p\in(0,1)$，定义左连续广义逆

$$
F^{-}(p)=\inf\{x\in\mathbb R:F(x)\ge p\}.
$$

$F^{-}$ 单调不减且左连续。对于每个 $x\in\mathbb R$，

$$
F^{-}(p)\le x\quad\Longleftrightarrow\quad p\le F(x),
$$

其中等价性使用 $F$ 的单调性和右连续性。若 $U$ 在 $(0,1)$ 上服从均匀分布，则

$$
\mathbb P\{F^{-}(U)\le x\}
=\mathbb P\{U\le F(x)\}=F(x),
$$

所以 $F^{-}(U)$ 的分布函数是 $F$。这给出在标准均匀随机数上构造任意一维分布的分位数方法。

该构造不要求 $F$ 严格递增或连续；若 $F$ 有平台，广义逆会出现跳跃；若 $F$ 有跳跃，广义逆在相应概率区间取常值。端点 $p=0,1$ 需另作约定，通常概率零的端点不影响分布结论。

## 本章小结

- Hahn 定理把空间拆成正、负部分；Jordan 分解与全变差测度则是唯一的。
- $\nu\ll\mu$ 是“$\nu$ 不在 $\mu$-零集上放质量”；Radon–Nikodym 定理在 $\sigma$-有限假设下把这种关系写成密度。
- Lebesgue 分解把一般测度拆成绝对连续和奇异部分；欧氏有限测度还可进一步拆成离散、奇异连续、绝对连续三类。
- 一维广义逆将均匀随机变量变换成任意给定分布，是概率模型构造的基本工具。

## 习题导航

- [[高等概率论/01_测度论基础与高等概率论上册习题集#8.1 符号测度与 Hahn-Jordan 分解|8.1 符号测度与 Hahn-Jordan 分解]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#8.2 绝对连续与 Radon-Nikodym 定理|8.2 绝对连续与 Radon-Nikodym 定理]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#8.3 相互奇异与 Lebesgue 分解定理|8.3 相互奇异与 Lebesgue 分解定理]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#8.4 分布函数的类型及分解|8.4 分布函数的类型及分解]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#8.5 左连续逆和均匀分布的构造|8.5 左连续逆和均匀分布的构造]]

## 相关链接

- [[07_Lebesgue积分与数学期望|第 7 章 Lebesgue 积分与数学期望]]
- [[09_Lebesgue空间与一致可积性|第 9 章 Lebesgue 空间与一致可积性]]
- [[12_弱收敛|第 12 章 弱收敛]]
- [[00_上册总览|高等概率论上册总览]]

## 跨主题参照

- [[泛函分析/08_Riesz表示与变分问题/03_Radon-Nikodym定理的Hilbert空间证明#1. 先处理两测度都有限|Radon-Nikodym定理的Hilbert空间证明]]。沿 Hilbert 空间表示构造密度，再对照有限分块推广的条件。
