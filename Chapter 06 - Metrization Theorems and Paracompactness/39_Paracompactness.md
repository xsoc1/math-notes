---
title: "§39 仿紧性"
date: 2026-07-28
tags: ["topology/munkres/chapter6", "topology/paracompactness"]
aliases: ["Paracompactness", "39_Paracompactness"]
---

# §39 Paracompactness

> [!abstract] 核心问题
> 仿紧性是紧性最实用的推广——每个开覆盖有局部有限开加细。度量空间自动仿紧（Stone 定理），仿紧 Hausdorff 空间正规，且容许单位分解。

## 39.1 定义

> [!note] **定义 39.1（加细 / Refinement）**
> 族 $\mathcal{B}$ 是族 $\mathcal{A}$ 的加细，若每个 $B\in\mathcal{B}$ 包含于某个 $A\in\mathcal{A}$。

> [!note] **定义 39.2（仿紧 / Paracompact）**
> 空间 $X$ 仿紧，若 $X$ 的每个开覆盖都有局部有限的开加细。

> [!example] **例 39.1**
> - 紧空间：仿紧（有限子覆盖即局部有限加细）。
> - $\mathbb{R}^n$：仿紧（尽管非紧）。
> - 度量空间：仿紧（Stone 定理）。
> - 不可数离散空间：仿紧。
> - $\mathbb{R}^\omega$（箱拓扑）：非仿紧。

## 39.2 基本性质

> [!note] **定理 39.1（仿紧 Hausdorff ⇒ 正规）** ^theorem-39-1
> 每个仿紧 Hausdorff 空间是正规的。

**证明**（概要）：先利用仿紧性证正则——设 $x\notin B$（$B$ 闭），对每个 $b\in B$ 取开集分离 $x$ 与 $b$，构造覆盖并取局部有限加细，将加细中触及 $B$ 的成员并起来即得分离开集。再从正则推到正规。$\square$

> [!note] **定理 39.2（Stone 定理）** ^theorem-39-2
> 每个度量空间是仿紧的。

**证明**（思路）：设 $\mathcal{U}$ 为度量空间 $(X,d)$ 的开覆盖。良序 $\mathcal{U}$，对每个 $U\in\mathcal{U}$ 和 $n\in\mathbb{N}^+$，构造 $S_n(U)$ 为 $U$ 中到 $X\setminus U$ 距离 $\geqslant 1/2^n$ 的点，减去先前成员的 $1/2^n$-邻域。对所有 $S_n(U)$ 取 $1/2^{n+1}$-开球得局部有限开加细。$\square$

> [!note] **定理 39.3（遗传性与乘性）**
> - 仿紧空间的闭子空间仿紧。
> - 仿紧空间与紧空间的积仿紧。
> - 两个仿紧空间的积不一定仿紧（Sorgenfrey 平面 $\mathbb{R}_\ell^2$ 反例）。

## 39.3 习题解析

> [!question] **习题 39.1**
> 证明紧空间是仿紧的。

**证明**：紧空间的开覆盖有有限子覆盖，有限族自动局部有限。$\square$

> [!question] **习题 39.2**
> 证明 Lindelöf 正则空间是仿紧的。

**证明**：设 $\mathcal{U}$ 为开覆盖，由 Lindelöf 性取可数子覆盖 $\{U_n\}$。归纳构造 $V_n$：$V_1=U_1$，$V_n=U_n\setminus\bigcup_{i<n}\overline{V}_i$（利用正则性确保 $\overline{V}_n\subseteq U_n$）。$\{V_n\}$ 局部有限且加细 $\mathcal{U}$。$\square$

> [!question] **习题 39.3**
> 证明 $\mathbb{R}_\ell$ 是仿紧的（尽管非第二可数）。

**证明**：$\mathbb{R}_\ell$ 是 Lindelöf（习题 30.7）且正则（因是正规），由习题 39.2 得仿紧。$\square$

> [!question] **习题 39.4-39.6**
> 关于局部有限族的并、加细构造及乘积反例。详见 Munkres 原书。$\square$

## 相关链接
- 上一节：[[38_Metrization_Theorems|§38]]
- 下一节：[[40_Partitions_of_Unity|§40 Partitions of Unity]]
- 返回总览：[[00_Chapter_06_Overview|Chapter 6 Overview]]