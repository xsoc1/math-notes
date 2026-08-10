---
title: "§44 度量空间中的紧性"
date: 2026-07-28
tags: ["topology/munkres/chapter7", "topology/compactness-metric"]
aliases: ["Compactness in Metric Spaces"]
---

# §44 Compactness in Metric Spaces

> [!abstract] 核心问题
> 度量空间中的紧性等价于"全有界+完备"。这一等价性将紧性从覆盖性质转化为 Cauchy 序列语言，在泛函分析中极为有用。

## 44.1 全有界

> [!note] **定义 44.1（全有界 / Totally Bounded）**
> 度量空间 $(X,d)$ 全有界：对任意 $\varepsilon>0$，$X$ 可被有限个 $\varepsilon$-球覆盖。

> [!note] **定理 44.1（度量空间紧的充要条件）** ^theorem-44-1
> 度量空间 $(X,d)$ 紧 $\iff$ $X$ 完备且全有界。

**证明**：（⇒）紧 ⇒ 完备（Cauchy 序列有子列收敛，故序列收敛）。紧 ⇒ 全有界（$\varepsilon$-球覆盖有有限子覆盖）。
（⇐）设 $X$ 完备且全有界。需证 $X$ 列紧（度量空间中，紧 $\iff$ 列紧）。任取序列 $(x_n)$：由全有界性，可反复二等分取子列得 Cauchy 子列，由完备性收敛。$\square$

> [!note] **定理 44.2（紧度量空间的 Lebesgue 数引理）** ^theorem-44-2
> 紧度量空间 $(X,d)$ 的每个开覆盖 $\mathcal{U}$ 有 Lebesgue 数 $\delta>0$：任意直径 $<\delta$ 的子集包含于 $\mathcal{U}$ 的某个成员。

**证明**：若否，对每个 $n$ 存在直径 $<1/n$ 的集合 $C_n$ 不含于任何 $U\in\mathcal{U}$。取 $x_n\in C_n$，有收敛子列 $x_{n_k}\to x$。$x$ 属于某 $U\in\mathcal{U}$，取 $\varepsilon$-球含于 $U$。对足够大的 $k$，$1/n_k<\varepsilon/2$ 且 $d(x_{n_k},x)<\varepsilon/2$，则 $C_{n_k}\subseteq B_d(x,\varepsilon)\subseteq U$，矛盾。$\square$

## 44.2 习题解析

> [!question] **习题 44.1**
> 证明全有界空间的子空间全有界。证明完备度量空间的闭子空间完备。
**证明**：直接由定义验证。$\square$

> [!question] **习题 44.2**
> 证明 $\mathbb{R}^n$ 中，有界闭集紧 $\iff$ 它是全有界且完备（Heine-Borel 的另一证法）。
**证明**：$\mathbb{R}^n$ 完备，有界 $\Rightarrow$ 全有界，闭 $\Rightarrow$ 完备子空间。$\square$

> [!question] **习题 44.3-44.4**
> 关于 Lebesgue 数的应用（一致连续性的证明等）。$\square$

## 相关链接
- 上一节：[[43_Complete_Metric_Spaces|§43]]
- 下一节：[[45_Function_Spaces|§45 Function Spaces]]
- 返回总览：[[00_Chapter_07_Overview|Chapter 7 Overview]]