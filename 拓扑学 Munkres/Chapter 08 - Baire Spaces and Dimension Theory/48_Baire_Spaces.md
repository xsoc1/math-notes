---
title: "§48 Baire 空间"
date: 2026-07-28
tags: ["topology/munkres/chapter8", "topology/baire"]
aliases: ["Baire Spaces", "48_Baire_Spaces"]
---

# §48 Baire Spaces

> [!abstract] 核心问题
> 完备度量空间中，"小"集（无处稠密集的可数并）的补集必然稠密——这就是 Baire 纲定理，泛函分析四大基石之一（Hahn-Banach、Banach-Steinhaus、开映射、闭图像）。


>[!important] **Baire 纲定理——"大"集的拓扑刻画**
> Baire 纲定理的基本直觉是：在完备度量空间（或局部紧 Hausdorff 空间）中，"小"集（第一纲集）不能覆盖整个空间。更精确地说：可数个无处稠密集的并的内部是空的。
>
> **形象的类比**：将无处稠密集想象为"稀疏"的集合（如 $\mathbb{R}$ 中的有限集、Cantor 集的补集）。第一纲集是不可数个"稀疏"集的并——它可能很"大"（在基数意义上），但拓扑上仍然是"瘦"的。第二纲集是"胖"到不能被可数个稀疏集覆盖的集合。
>
> **Baire 定理的"魔术"**：它将**可数**条件（可数个稠密开集）转化为**存在性**结论（交集非空且稠密）。这种"可数→存在"的模式在泛函分析的三大基本定理（一致有界原理、开映射定理、闭图像定理）中反复出现。
>
> **经典应用**：
> - 无处可微的连续函数"很多"（在 $C[0,1]$ 中第二纲）。
> - $\mathbb{Q}$ 不是 $G_\delta$ 集。
> - Banach-Steinhaus 定理：点态有界蕴含一致有界。

## 48.1 纲的概念

> [!note] **定义 48.1（无处稠密 / Nowhere Dense）**
> $A\subseteq X$ 无处稠密，若 $\operatorname{Int}(\overline{A})=\varnothing$。

> [!note] **定义 48.2（第一纲 / 第二纲）**
> $A$ 是第一纲的（meager），若 $A$ 可表为可数个无处稠密集的并。否则称为第二纲的（nonmeager）。

> [!note] **定义 48.3（Baire 空间）**
> 拓扑空间 $X$ 称为 Baire 空间，若可数个稠密开集的交仍是稠密的。

## 48.2 Baire 纲定理

> [!note] **定理 48.1（Baire 纲定理）** ^theorem-48-1
> 每个完备度量空间是 Baire 空间。更一般地，每个局部紧 Hausdorff 空间是 Baire 空间。

**证明**（完备度量空间情形）：设 $\{U_n\}$ 为可数个稠密开集。任取非空开集 $W_0$，需证 $W_0\cap\bigcap U_n\neq\varnothing$。
由 $U_1$ 稠密，$W_0\cap U_1\neq\varnothing$。取 $x_1\in W_0\cap U_1$ 和 $\varepsilon_1<1$ 使 $\overline{B}(x_1,\varepsilon_1)\subseteq W_0\cap U_1$。由 $U_2$ 稠密，$B(x_1,\varepsilon_1)\cap U_2\neq\varnothing$。取 $x_2,\varepsilon_2<1/2$ 使 $\overline{B}(x_2,\varepsilon_2)\subseteq B(x_1,\varepsilon_1)\cap U_2$。归纳得递降闭球套 $\overline{B}(x_n,\varepsilon_n)$，$\varepsilon_n<1/n$。由完备性，$\bigcap\overline{B}(x_n,\varepsilon_n)=\{x\}$ 非空，且 $x\in W_0\cap\bigcap U_n$。$\square$

> [!note] **定理 48.2（局部紧 Hausdorff 的 Baire 性）**
> 每个局部紧 Hausdorff 空间是 Baire 空间。

**证明**：类似完备度量空间的证法，将"闭球套"替换为"具有紧闭包的开集套"。$\square$

## 48.3 应用

> [!example] **例 48.1（一致有界原理 / Banach-Steinhaus）**
> 设 $\{T_n\}$ 是 Banach 空间上一族连续线性算子。若对每个 $x$，$\sup_n\|T_nx\|<\infty$（点态有界），则 $\sup_n\|T_n\|<\infty$（一致有界）。证明：令 $A_k=\{x\mid\sup_n\|T_nx\|\leqslant k\}$（闭集），由 Baire 纲定理，某个 $A_k$ 内部非空，从而导出算子范数有界。

> [!example] **例 48.2（开映射定理）**
> Banach 空间之间的连续线性满射是开映射。证明依赖 Baire 纲定理——满射蕴含某球的原像有界，从而导出开性。

> [!example] **例 48.3（$\mathbb{Q}$ 不是 $G_\delta$ 集）**
> $\mathbb{Q}$ 在 $\mathbb{R}$ 中不是 $G_\delta$ 集（可数个开集的交）。证明：若 $\mathbb{Q}=\bigcap U_n$（$U_n$ 开），则每个 $U_n$ 稠密（含 $\mathbb{Q}$）。$\mathbb{R}\setminus\mathbb{Q}=\bigcup(\mathbb{R}\setminus U_n)$ 是第一纲的（$\mathbb{R}\setminus U_n$ 无处稠密），但 $\mathbb{R}\setminus\mathbb{Q}$ 由 Baire 定理非第一纲——矛盾。

## 48.4 习题解析

> [!question] **习题 48.1**
> 证明 $\mathbb{Q}$（作为 $\mathbb{R}$ 的子空间）不是 Baire 空间。
**证明**：$\mathbb{Q}=\bigcup_{q\in\mathbb{Q}}\{q\}$，每个 $\{q\}$ 无处稠密（因 $\mathbb{Q}$ 无孤立点），故 $\mathbb{Q}$ 本身是第一纲的。Baire 空间中非空开集不能是第一纲的。$\square$

> [!question] **习题 48.2**
> 证明完备度量空间中，可数个稠密开集的交不仅非空而且稠密——等价于标准 Baire 定理论述。
**证明**：定理 48.1 的证明已证任意开集与 $\bigcap U_n$ 相交，故 $\bigcap U_n$ 稠密。$\square$

> [!question] **习题 48.3**
> 证明：若完备度量空间可表为可数个闭集的并，则至少一个闭集内部非空。
**证明**：这是 Baire 定理的对偶形式——取补集得稠密开集交为空，矛盾。$\square$

> [!question] **习题 48.4-48.6**
> 关于 Baire 纲定理在分析中的应用（无处可微连续函数的存在性、一致有界原理的拓扑证明等）。$\square$

## 相关链接
- 上一章：[[46_Ascolis_Theorem|§46 Ascoli's Theorem]]
- 返回总览：[[00_Chapter_08_Overview|Chapter 8 Overview]]

## 跨主题参照

- [[泛函分析/09_Baire纲与基本定理/01_Baire纲定理#3. Baire 纲定理的完整证明|Baire纲定理]]。沿套球证明进入泛函分析中的基本定理。
