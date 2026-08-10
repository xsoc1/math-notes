---
title: "§50 维数论"
date: 2026-07-28
tags: ["topology/munkres/chapter8", "topology/dimension-theory"]
aliases: ["Dimension Theory", "50_Dimension_Theory"]
---

# §50 Dimension Theory

> [!abstract] 核心问题
> 拓扑空间的"维数"如何定义？覆盖维数（Lebesgue 覆盖维数）是拓扑不变的维数概念，对可分度量空间与归纳维数一致。

## 50.1 覆盖维数

> [!note] **定义 50.1（覆盖维数 / Covering Dimension）**
> 正规空间 $X$ 的覆盖维数 $\dim X\leqslant n$：$X$ 的每个有限开覆盖都有一个开加细，使得 $X$ 的每点至多属于该加细的 $n+1$ 个成员。
> 最小的这样的 $n$（若存在）称为 $X$ 的覆盖维数。

> [!example] **例 50.1**
> - $\dim\mathbb{R}^n=n$——这与直觉一致。
> - $\dim[0,1]^n=n$。
> - 零维空间：每个有限开覆盖有不交开加细（如 Cantor 集）。
> - 任意紧度量空间的维数是拓扑不变量。

> [!note] **定理 50.1（覆盖维数的基本性质）**
> - 覆盖维数是拓扑不变的。
> - 子空间维数 $\leqslant$ 母空间维数。
> - $\dim(X\times Y)\leqslant\dim X+\dim Y$（对紧度量空间）。

## 50.2 习题解析

> [!question] **习题 50.1**
> 证明离散空间的覆盖维数为 $0$。
**证明**：单点集构成不交开覆盖，每点至多属于一个开集。$\square$

> [!question] **习题 50.2**
> 证明 $\mathbb{R}$ 的覆盖维数为 $1$。
**证明**：$\mathbb{R}$ 的任意开覆盖有加细使每点至多属于 $2$ 个开集（区间端点重叠），但不可能使每点至多属于 $1$ 个（否则 $\mathbb{R}$ 不连通）。$\square$

> [!question] **习题 50.3-50.5**
> 关于覆盖维数与归纳维数（小归纳维数 ind、大归纳维数 Ind）的关系。对可分度量空间三者等价。$\square$

## 相关链接
- 上一节：[[48_Baire_Spaces|§48 Baire Spaces]]
- 返回总览：[[00_Chapter_08_Overview|Chapter 8 Overview]]