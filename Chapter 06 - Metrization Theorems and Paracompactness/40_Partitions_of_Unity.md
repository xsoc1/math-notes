---
title: "§40 单位分解"
date: 2026-07-28
tags: ["topology/munkres/chapter6", "topology/partition-of-unity"]
aliases: ["Partitions of Unity", "40_Partitions_of_Unity"]
---

# §40 Partitions of Unity

> [!abstract] 核心问题
> 单位分解是从局部数据构造整体对象的系统方法，广泛应用于微分几何（Riemann 度量、联络）、层论和 PDE 理论。

## 40.1 定义

> [!note] **定义 40.1（单位分解）** ^theorem-40-1
> 设 $\{U_\alpha\}_{\alpha\in J}$ 是 $X$ 的开覆盖。从属于它的单位分解是一族连续函数 $\phi_\alpha:X\to[0,1]$ 满足：
> 1. $\operatorname{supp}(\phi_\alpha)\subseteq U_\alpha$；
> 2. $\{\operatorname{supp}(\phi_\alpha)\}$ 局部有限；
> 3. $\sum_\alpha\phi_\alpha(x)=1$ 对所有 $x$。

## 40.2 存在性定理

> [!note] **定理 40.2** ^theorem-40-2
> 仿紧 Hausdorff 空间的每个开覆盖都有从属于它的单位分解。

**证明**（概况）：1. 取局部有限开加细。2. 由仿紧 Hausdorff ⇒ 正规，用 Urysohn 引理构造"截断"函数。3. 归一化（除以局部有限和）得单位分解。$\square$

## 40.3 应用

> [!example] **例 40.1（流形上的 Riemann 度量）**
> 利用单位分解从局部 Euclid 度量拼出整体 Riemann 度量。

> [!example] **例 40.2（Whitney 嵌入定理）**
> 利用单位分解将 §36 的紧流形嵌入推广到任意 $m$-流形嵌入 $\mathbb{R}^{2m}$。

> [!example] **例 40.3（截断函数）**
> 在 PDE 中，利用单位分解将整体问题局部化——在坐标卡上求解后拼回整体解。

## 40.4 习题解析

> [!question] **习题 40.1**
> 证明若 $\{\phi_\alpha\}$ 是从属于 $\{U_\alpha\}$ 的单位分解，则 $\{\operatorname{Int}(\operatorname{supp}(\phi_\alpha))\}$ 覆盖 $X$。

**证明**：对 $x\in X$，因 $\sum\phi_\alpha(x)=1>0$，存在 $\alpha$ 使 $\phi_\alpha(x)>0$。故 $x\in\operatorname{supp}(\phi_\alpha)$。由连续性，$x$ 的某邻域上 $\phi_\alpha>0$，故 $x$ 在 $\operatorname{supp}(\phi_\alpha)$ 的内部。$\square$

> [!question] **习题 40.2-40.3**
> 关于单位分解的构造、$C^\infty$ 单位分解的存在性（流形情形）等。详见 Munkres 原书。$\square$

## 相关链接
- 上一节：[[39_Paracompactness|§39 Paracompactness]]
- 下一章：[[../Chapter 07 - Complete Metric Spaces and Function Spaces/00_Chapter_07_Overview|Chapter 7]]
- 返回总览：[[00_Chapter_06_Overview|Chapter 6 Overview]]