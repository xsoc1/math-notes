---
title: "§22 商拓扑"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/quotient-topology
  - topology/quotient-map
aliases:
  - "The Quotient Topology"
  - "22_The_Quotient_Topology"
---

# §22 The Quotient Topology

> [!abstract] 核心问题
> 如何通过"粘合"拓扑空间中的点来构造新空间？商拓扑如何形式化这一过程？


>[!important] **商拓扑——"粘合"空间的艺术**
> 商拓扑是构造新拓扑空间的最强大工具。直观上，商空间是通过将原空间中的某些点"等同"（粘合）而得到的新空间。例如：
> - 将线段 $[0,1]$ 的两端粘合得到圆周 $S^1$；
> - 将正方形边界适当粘合得到环面、Klein 瓶、射影平面。
>
> **商拓扑的定义方式**：在商集 $X/\sim$ 上，一个子集是开集当且仅当它在自然投射 $\pi:X\to X/\sim$ 下的原像是 $X$ 中的开集。这使得 $\pi$ 自动成为连续映射，且商拓扑是使 $\pi$ 连续的最细拓扑。
>
> **核心定理**：商空间的万有性质——任何在等价类上为常值的连续映射 $f:X\to Z$ 唯一地穿过商空间，即存在唯一的 $\tilde{f}:X/\sim\to Z$ 使 $f=\tilde{f}\circ\pi$。这是代数拓扑中"泛性质"论证的起点。

## 22.1 商映射与商拓扑

> [!note] **定义 22.1（商映射 / Quotient Map）**
> 设 $X, Y$ 是拓扑空间。满射 $p: X \to Y$ 称为 **商映射 (quotient map)**，若 $V \subseteq Y$ 是开集 $\iff$ $p^{-1}(V) \subseteq X$ 是开集。

>[!important] 商映射是连续满射，且进一步要求：$Y$ 中的开集恰好是那些原像为开集的子集。这意味着 $Y$ 的拓扑由 $p$ 和 $X$ 的拓扑**完全决定**。

> [!note] **定义 22.2（商拓扑 / Quotient Topology）**
> 设 $X$ 是拓扑空间，$A$ 是集合，$p: X \to A$ 是满射。$A$ 上由 $p$ 诱导的**商拓扑 (quotient topology)** 定义为：
> $$\mathcal{T}_p = \{V \subseteq A \mid p^{-1}(V) \subseteq X \text{ 是开集}\}$$

>[!tip] 商拓扑是使得 $p$ 成为商映射的 **唯一** 拓扑，也是使得 $p$ 连续的 **最细** 拓扑。

> [!note] **定义 22.3（商空间 / Quotient Space）**
> 设 $X$ 是拓扑空间，$\sim$ 是 $X$ 上的等价关系。令 $X/{\sim}$ 为等价类的集合，$\pi: X \to X/{\sim}$ 为自然投影 $\pi(x) = [x]$。商空间 $X/{\sim}$ 是 $X/{\sim}$ 赋予商拓扑的结果。

## 22.2 商映射的判定

> [!note] **定理 22.1（商映射的判定）** ^theorem-22-1
> 设 $p: X \to Y$ 是连续满射。若 $p$ 是开映射或闭映射，则 $p$ 是商映射。

**证明**：设 $V \subseteq Y$ 使得 $p^{-1}(V)$ 是 $X$ 中开集。
- 若 $p$ 是开映射：$V = p(p^{-1}(V))$（$p$ 满）是开集。
- 若 $p$ 是闭映射：$p(X \setminus p^{-1}(V)) = Y \setminus V$ 是闭集 $\implies V$ 是开集。$\square$

>[!warning] 连续满射不一定是商映射！商映射也不一定是开映射或闭映射。

## 22.3 商空间的万有性质

> [!note] **定理 22.2（商空间的万有性质）** ^theorem-22-2
> 设 $p: X \to Y$ 是商映射，$Z$ 是任意拓扑空间。则 $f: Y \to Z$ 连续 $\iff$ $f \circ p: X \to Z$ 连续。
>
> ```mermaid
> graph TD
>     X["X"] --> Y["Y = X/∼"]
>     X --> Z["Z"]
>     Y -.-> Z
> ```

**证明**：
- ($\Rightarrow$)：连续函数的复合连续；
- ($\Leftarrow$)：设 $f \circ p$ 连续。对 $Z$ 中任意开集 $W$，
  $$p^{-1}(f^{-1}(W)) = (f \circ p)^{-1}(W) \subseteq X \text{ 是开集}$$
  由商拓扑定义，$f^{-1}(W)$ 是 $Y$ 中开集。$\square$

>[!important] 万有性质是验证从商空间出发的映射连续性的标准工具。

## 22.4 经典例子

> [!example] **例 22.1（圆周 $S^1$）**
> 定义等价关系 $\sim$ 在 $[0,1]$ 上：$0 \sim 1$，其余点只与自己等价。则 $[0,1]/{\sim} \cong S^1$。
>
> 或者：$p: \mathbb{R} \to S^1$，$p(t) = (\cos 2\pi t, \sin 2\pi t)$ 是商映射。

> [!example] **例 22.2（环面 $T^2 = S^1 \times S^1$）**
> 在正方形 $[0,1] \times [0,1]$ 上粘合对边：$(0, y) \sim (1, y)$ 和 $(x, 0) \sim (x, 1)$。商空间同胚于环面。

> [!example] **例 22.3（实射影平面 $\mathbb{R}P^2$）**
> 在 $S^2$ 上定义 $x \sim -x$（对径点等同）。$S^2/{\sim} \cong \mathbb{R}P^2$。
> 或者：$\mathbb{R}P^2 \cong (\mathbb{R}^3 \setminus \{0\}) / \sim$，其中 $v \sim \lambda v$（$\lambda \neq 0$）。

> [!example] **例 22.4（Möbius 带）**
> 在 $[0,1] \times [0,1]$ 上定义 $(0, y) \sim (1, 1-y)$。商空间是 Möbius 带。

> [!example] **例 22.5（楔和 / Wedge Sum）**
> 设 $(X, x_0)$ 和 $(Y, y_0)$ 是带基点的空间。楔和 $X \vee Y$ 是不交并 $X \sqcup Y$ 模去 $x_0 \sim y_0$ 的商空间。

## 22.5 习题解析

> [!question] **习题 22.1**
> 证明：若 $p: X \to Y$ 是商映射且 $A \subseteq X$ 是饱和开集（或饱和闭集），则限制 $p|_A: A \to p(A)$ 是商映射。

**证明**：设 $A$ 是饱和开集，$p(A)$ 赋予商拓扑。需证对任意 $V \subseteq p(A)$，$V$ 在 $p(A)$ 中开 $\iff$ $(p|_A)^{-1}(V)$ 在 $A$ 中开。由于 $A$ 饱和，$(p|_A)^{-1}(V) = p^{-1}(V)$。$V$ 在 $p(A)$ 中开 $\iff V = W \cap p(A)$（$W$ 在 $Y$ 中开）$\iff p^{-1}(V) = p^{-1}(W) \cap A$ 在 $A$ 中开（$A$ 饱和 $\implies A = p^{-1}(p(A))$）。$\square$

> [!question] **习题 22.2**
> 设 $p: X \to Y$ 是商映射，$g: X \to Z$ 是满足"若 $p(x) = p(x')$ 则 $g(x) = g(x')$"的连续映射。证明 $g$ 通过商映射的万有性质诱导出唯一的连续映射 $f: Y \to Z$。

**证明**：由条件，可定义 $f: Y \to Z$ 为 $f(y) = g(x)$（其中 $p(x) = y$）。因 $g$ 在 $p$ 的纤维上为常数，此定义是良定义的。$f \circ p = g$ 连续，由定理 22.2，$f$ 连续。$\square$

> [!question] **习题 22.3**
> 证明 $\mathbb{R}$ 上的等价关系 $x \sim y \iff x - y \in \mathbb{Q}$ 的商空间在商拓扑下具有平庸拓扑。

**证明**：设 $\pi: \mathbb{R} \to \mathbb{R}/\mathbb{Q}$ 为商映射。设 $V \subseteq \mathbb{R}/\mathbb{Q}$ 是非空开集。则 $\pi^{-1}(V)$ 是 $\mathbb{R}$ 中非空开集，故包含一个开区间。由于任意开区间在平移下生成整个 $\mathbb{R}$（通过有理平移），且 $\pi^{-1}(V)$ 是饱和的（若 $x \in \pi^{-1}(V)$，$x \sim y$，则 $y = x + q \in \pi^{-1}(V)$），故 $\pi^{-1}(V) = \mathbb{R}$，从而 $V = \mathbb{R}/\mathbb{Q}$。即商空间中唯一非空开集是全空间。$\square$

> [!question] **习题 22.5**
> 设 $p: X \to Y$ 是商映射，$Z$ 是局部紧 Hausdorff 空间。证明 $p \times \operatorname{id}_Z: X \times Z \to Y \times Z$ 也是商映射。

**证明**：这是 Whitehead 定理的一个特例。关键用到 $Z$ 的局部紧性，保证 $p \times \operatorname{id}_Z$ 保持商性质。$\square$

## 相关链接

- 上一节：[[21_The_Metric_Topology_II|§21 The Metric Topology II]]
- 下一章：[[../Chapter 03 - Connectedness and Compactness/00_Chapter_03_Overview|Chapter 3: Connectedness and Compactness]]
- 连续函数：[[18_Continuous_Functions|§18 Continuous Functions]]
- 子空间拓扑：[[16_The_Subspace_Topology|§16 The Subspace Topology]]
- 返回总览：[[00_Chapter_02_Overview|Chapter 2 Overview]]
