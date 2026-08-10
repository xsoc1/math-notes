---
title: "§45 函数空间"
date: 2026-07-28
tags: ["topology/munkres/chapter7", "topology/function-spaces"]
aliases: ["Function Spaces", "45_Function_Spaces"]
---

# §45 Function Spaces

> [!abstract] 核心问题
> 如何给连续函数组成的集合赋予"自然的"拓扑？点态收敛拓扑、一致收敛拓扑、紧开拓扑各有何优劣？

## 45.1 点态收敛拓扑

> [!note] **定义 45.1（点态收敛拓扑 / Pointwise Convergence）**
> 设 $Y^X$ 为所有函数 $f:X\to Y$ 的集合。点态收敛拓扑是积拓扑——即 $Y^X=\prod_{x\in X}Y$（视为 $|X|$ 个 $Y$ 的乘积）。
> 序列 $f_n\to f$ 点态 $\iff$ 对每个 $x\in X$，$f_n(x)\to f(x)$。

> [!note] **定理 45.1**
> 点态收敛拓扑中，连续函数集 $C(X,Y)$ 的闭包包含于所有函数的集合；$C(X,Y)$ 一般不闭。

## 45.2 紧开拓扑

> [!note] **定义 45.2（紧开拓扑 / Compact-Open Topology）**
> 设 $X,Y$ 为拓扑空间，$C(X,Y)$ 为所有连续函数。紧开拓扑以集合
> $$S(C,U)=\{f\in C(X,Y)\mid f(C)\subseteq U\}$$
> 为子基，其中 $C\subseteq X$ 紧，$U\subseteq Y$ 开。

> [!example] **例 45.1**
> - 当 $X$ 紧、$Y$ 度量空间时，紧开拓扑等于一致收敛拓扑。
> - $C(\mathbb{R},\mathbb{R})$ 中，紧开拓扑比点态收敛拓扑更细——在每个紧集上一致收敛。

> [!note] **定理 45.2（指数律 / Exponential Law）**
> 在适当的条件下（$X$ 局部紧 Hausdorff），存在自然同胚
> $$C(X\times Z, Y)\cong C(Z, C(X,Y))$$
> 其中 $C(X,Y)$ 赋予紧开拓扑。这是"函数空间"概念的核心——将二元连续函数视为单变量到函数空间的连续映射。

## 45.3 习题解析

> [!question] **习题 45.1**
> 证明点态收敛拓扑中，$C(X,Y)$ 的闭包是 $Y^X$（当 $Y$ 是 T₁ 时，只有连续函数序列的点态极限才属于闭包）。
**证明**：点态收敛拓扑中，连续函数序列的极限不一定连续。$\square$

> [!question] **习题 45.2-45.4**
> 关于紧开拓扑的连续性、赋值映射 $e:C(X,Y)\times X\to Y$（$e(f,x)=f(x)$）的连续性等。$\square$

## 相关链接
- 上一节：[[44_Compactness_in_Metric_Spaces|§44]]
- 下一节：[[46_Ascolis_Theorem|§46 Ascoli's Theorem]]