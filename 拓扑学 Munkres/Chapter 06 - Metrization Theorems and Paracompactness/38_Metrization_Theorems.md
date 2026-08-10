---
title: "§38 度量化定理（续）"
date: 2026-07-28
tags:
  - topology/munkres/chapter6
  - topology/metrization
aliases:
  - "Metrization Theorems Continued"
---

# §38 Metrization Theorems (Continued)

> [!abstract] 核心问题
> 将 Urysohn 度量化定理推广——去除第二可数条件，用局部有限族刻画可度量化性。

## 38.1 局部有限族

> [!note] **定义 38.1（局部有限 / Locally Finite）**
> 空间 $X$ 的子集族 $\mathcal{A}$ 称为局部有限的，若每点 $x \in X$ 有邻域仅与 $\mathcal{A}$ 中有限个成员相交。

> [!note] **定义 38.2（$\sigma$-局部有限）**
> 族 $\mathcal{A}$ 可写为可数个局部有限族的并时，称为 $\sigma$-局部有限的。

## 38.2 Nagata-Smirnov 度量化定理

> [!note] **定理 38.1（Nagata-Smirnov 度量化定理）** ^theorem-38-1
> 空间 $X$ 可度量化 $\iff$ $X$ 是正则的且有一个 $\sigma$-局部有限基。

**证明**（概要）：充分性：利用 $\sigma$-局部有限基构造嵌入到可度量化空间。必要性：度量空间中，取每 $n$ 的 $1/n$-球覆盖，由 Stone 定理（度量空间仿紧），该覆盖有局部有限开加细，全体构成 $\sigma$-局部有限基。$\square$

> [!note] **定理 38.2（Bing 度量化定理）**
> 空间 $X$ 可度量化 $\iff$ $X$ 是正则的且有一个 $\sigma$-离散基。

## 38.3 与 Urysohn 定理的关系

第二可数空间有可数基，可数 = $\sigma$-有限，有限族自动局部有限，故第二可数 = 有 $\sigma$-局部有限基。因此 Urysohn 度量化定理是 Nagata-Smirnov 定理的特例。

## 38.4 习题解析

> [!question] **习题 38.1**
> 证明局部有限族的闭包的并等于各闭包之并。

**证明**：设 $\mathcal{A}=\{A_\alpha\}$ 局部有限。$\bigcup\overline{A}_\alpha\subseteq\overline{\bigcup A_\alpha}$ 总成立。反之，若 $x\in\overline{\bigcup A_\alpha}$，取邻域 $U$ 仅与 $A_{\alpha_1},\ldots,A_{\alpha_n}$ 相交。则 $x\in\overline{A_{\alpha_1}\cup\cdots\cup A_{\alpha_n}}=\bigcup_{i=1}^n\overline{A}_{\alpha_i}$。$\square$

> [!question] **习题 38.2**
> 证明 $\sigma$-局部有限基的每个成员可选取为"小"的。

**证明**：若 $\mathcal{B}$ 是 $\sigma$-局部有限基，则对任意 $\varepsilon>0$，$\{B\in\mathcal{B}\mid\operatorname{diam}(B)<\varepsilon\}$ 仍是基（在度量空间中）。$\square$

> [!question] **习题 38.3-38.5**
> 关于 Nagata-Smirnov 和 Bing 定理的各种推论及应用。详见 Munkres 原书 §38 习题。$\square$

## 相关链接
- 上一章：[[../Chapter 05 - The Tychonoff Theorem/37_The_Tychonoff_Theorem|§37]]
- 下一节：[[39_Paracompactness|§39 Paracompactness]]
- 返回总览：[[00_Chapter_06_Overview|Chapter 6 Overview]]