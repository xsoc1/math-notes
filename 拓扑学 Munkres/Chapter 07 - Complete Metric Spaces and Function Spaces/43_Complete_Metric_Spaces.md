---
title: "§43 完备度量空间"
date: 2026-07-28
tags: ["topology/munkres/chapter7", "topology/complete-metric"]
aliases: ["Complete Metric Spaces"]
---

# §43 Complete Metric Spaces

> [!abstract] 核心问题
> Cauchy 序列的收敛性是度量空间特有的性质。完备性保证"所有 Cauchy 序列收敛"——这是分析学的基础，也蕴含深刻的拓扑结论（Baire 纲定理）。

## 43.1 定义与例子

> [!note] **定义 43.1（Cauchy 序列，完备性）**
> 度量空间 $(X,d)$ 中的序列 $(x_n)$ 称为 Cauchy 序列：$\forall\varepsilon>0,\exists N,\forall m,n\geqslant N: d(x_m,x_n)<\varepsilon$。$X$ 称为完备的：每个 Cauchy 序列收敛。

> [!example] **例 43.1**
> - $\mathbb{R}^n$（Euclid 度量）完备。
> - $\mathbb{Q}$（Euclid 度量）不完备（$\sqrt{2}$ 的逼近序列不收敛于 $\mathbb{Q}$ 中）。
> - $(0,1)$（Euclid 度量）不完备（$1/n\to 0\notin(0,1)$）。
> - 紧度量空间：完备。
> - $\mathbb{R}^\omega$（一致度量 $\bar{\rho}$）完备。

## 43.2 完备化的存在性

> [!note] **定理 43.1（完备化）** ^theorem-43-1
> 每个度量空间 $(X,d)$ 可等距嵌入到一个完备度量空间 $(\hat{X},\hat{d})$ 中，且 $X$ 在 $\hat{X}$ 中稠密。$(\hat{X},\hat{d})$ 在等距意义下唯一，称为 $X$ 的完备化。

**证明**（构造）：将 $X$ 中 Cauchy 序列全体按"等价"关系（$d(x_n,y_n)\to0$）分划得 $\hat{X}$。定义 $\hat{d}([x_n],[y_n])=\lim d(x_n,y_n)$。验证 $\hat{X}$ 完备、$X$（常序列）等距嵌入且稠密。$\square$

## 43.3 习题解析

> [!question] **习题 43.1**
> 证明完备度量空间的闭子空间完备。不完备的例子：$(0,1)$ 是 $\mathbb{R}$ 的非闭子空间。
**证明**：闭子空间中 Cauchy 序列在母空间中收敛，极限点由闭性属于子空间。$\square$

> [!question] **习题 43.2**
> 证明紧度量空间完备。
**证明**：紧度量空间中序列有收敛子列（列紧性），Cauchy 序列若子列收敛则整体收敛。$\square$

> [!question] **习题 43.3-43.5**
> 关于完备性的遗传性（完备空间的 $G_\delta$ 子集完备）、一致连续函数在完备化上的延拓等。$\square$

## 相关链接
- 下一节：[[44_Compactness_in_Metric_Spaces|§44 Compactness in Metric Spaces]]
- 返回总览：[[00_Chapter_07_Overview|Chapter 7 Overview]]

## 跨主题参照

- [[泛函分析/01_度量空间及其完备化/05_完备化的构造#5.2 Cauchy 序列的等价关系|完备化的构造]]。查看 Cauchy 列的等价类构造，补足从完备性定义到完备化的步骤。
