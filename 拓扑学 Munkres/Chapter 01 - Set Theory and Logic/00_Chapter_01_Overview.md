---
title: "Chapter 1 - Set Theory and Logic"
date: 2026-07-08
tags:
  - topology/munkres/chapter1
  - math/set-theory
  - math/logic
---

# Chapter 1: Set Theory and Logic

本章是全书的基础预备，涵盖集合论基本概念、函数、关系、基数理论和选择公理。

## §1 Fundamental Concepts

**集合**：未定义的基本概念。$x \in A$ 表示 $x$ 是 $A$ 的元素。**空集** $\varnothing$ 不含任何元素。

**子集**：$A \subseteq B \iff \forall x(x \in A \implies x \in B)$。**真子集**：$A \subsetneq B$ 即 $A \subseteq B$ 且 $A \neq B$。

**运算**：并 $A \cup B$、交 $A \cap B$、差 $A \setminus B$。De Morgan 律：
$$X \setminus (A \cup B) = (X \setminus A) \cap (X \setminus B)$$
$$X \setminus (A \cap B) = (X \setminus A) \cup (X \setminus B)$$

**幂集**：$\mathcal{P}(A) = \{B \mid B \subseteq A\}$。

## §2 Functions

> [!note] **定义**
> 映射 $f: A \to B$ 是满足 $\forall a \in A, \exists! b \in B$ 的对应关系。

- **单射 (injective)**：$f(a_1) = f(a_2) \implies a_1 = a_2$
- **满射 (surjective)**：$\forall b \in B, \exists a \in A$ 使得 $f(a) = b$
- **双射 (bijective)**：既单且满

**原像**：$f^{-1}(B_0) = \{a \in A \mid f(a) \in B_0\}$。注意 $f^{-1}$ 作为集合函数总是有定义的。

**复合**：$(g \circ f)(a) = g(f(a))$。

## §3 Relations

> [!note] **定义**
> $A$ 上的关系 $R$ 是 $A \times A$ 的子集。

- **等价关系**：自反 + 对称 + 传递。记 $x \sim y$。
- **等价类**：$[x] = \{y \in A \mid y \sim x\}$。
- **划分**：$A$ 的等价类构成 $A$ 的一个划分。

**序关系**：
- **偏序 (partial order)**：自反 + 反对称 + 传递
- **全序 (total/linear order)**：偏序 + 任意两元素可比
- **严格序**：非自反 + 传递（如 $<$）

**上界/极大元**：
- $b$ 是 $A_0 \subseteq A$ 的上界：$\forall a \in A_0, a \preceq b$
- $m$ 是极大元：不存在 $a \in A$ 使 $m \prec a$
- 二者不同！极大元可能不是上界。

## §4 The Integers and the Real Numbers

**归纳原理**：若 $A \subseteq \mathbb{Z}_+$ 满足 $1 \in A$ 且 $n \in A \implies n+1 \in A$，则 $A = \mathbb{Z}_+$。

**$\mathbb{R}$ 的性质**：
- 代数性质（域公理）
- 序性质（全序，与代数相容）
- **最小上界性质 (least upper bound property)**：$\mathbb{R}$ 的每个非空有上界子集有最小上界（确界）

## §5 Cartesian Products

> [!note] **定义**
> 设 $\{A_\alpha\}_{\alpha \in J}$ 为集族。笛卡尔积：
> $$\prod_{\alpha \in J} A_\alpha = \{f: J \to \bigcup A_\alpha \mid \forall \alpha, f(\alpha) \in A_\alpha\}$$
> 即：积的元素是**选择函数**。

当 $J = \{1, \ldots, n\}$ 时，回到熟悉的 $n$-元组：$A_1 \times \cdots \times A_n$。

## §6 Finite Sets

> [!note] **定义**
> $A$ 是**有限集**：$A = \varnothing$ 或存在双射 $f: \{1, \ldots, n\} \to A$。
> 称 $A$ 的基数为 $n$。

**引理 6.1**：有限集的子集是有限集。

**推论 6.7（鸽巢原理）**：不存在有限集到其真子集的双射。

## §7 Countable and Uncountable Sets

> [!note] **定义**
> - **可数无限 (countably infinite)**：存在双射 $f: \mathbb{Z}_+ \to A$
> - **可数 (countable)**：有限或可数无限
> - **不可数 (uncountable)**：不可数

>[!important] **定理 7.1**
> $\mathbb{Z}_+ \times \mathbb{Z}_+$ 可数无限。

>[!important] **定理 7.5**
> 可数个可数集的并可数。

>[!important] **定理 7.7**
> $\mathbb{R}$ 不可数（Cantor 对角线论证）。

另外：$\{0,1\}^\omega$ 不可数，$2^{\mathbb{Z}_+}$ 不可数。

## §8 The Principle of Recursive Definition

> [!note] **递归定义原理**
> 设 $A$ 是集合，$a_0 \in A$，$\rho: \mathbb{Z}_+ \times A \to A$ 是函数。则存在唯一函数 $h: \mathbb{Z}_+ \to A$ 使得
> $$h(1) = a_0,\quad h(n+1) = \rho(n, h(n))$$

此原理保证了递推定义的合法性（如阶乘、Fibonacci 数列等）。

## §9 Infinite Sets and the Axiom of Choice

> [!note] **选择公理 (Axiom of Choice)**
> 设 $\mathcal{A}$ 是一族互不相交的非空集合。则存在集合 $C$（称为**选择集**），恰好包含每个 $A \in \mathcal{A}$ 中**一个**元素。

**等价表述**：
- 非空集的笛卡尔积非空；
- 每个满射有右逆（截面）；
- Zorn 引理；
- 良序定理。

>[!important] **定理 9.1**
> "无限集"的两种定义等价：
> 1. $A$ 不是有限集；
> 2. $A$ 有一个可数无限子集。
>
> （(1) $\Rightarrow$ (2) 需要依赖选择公理的一个较弱形式）

## §10 Well-Ordered Sets

> [!note] **定义**
> 全序集 $A$ 称为**良序集**，若 $A$ 的每个非空子集都有最小元。

**例**：$\mathbb{Z}_+$ 是良序集，$\mathbb{R}$ 不是（如 $(0,1)$ 无最小元）。

>[!important] **良序定理 (Well-Ordering Theorem)**
> 每个集合上都存在一个良序。
>
> （等价于选择公理）

**超限归纳法**：设 $J$ 是良序集。若对每个 $\alpha \in J$，由"对所有 $\beta < \alpha$，命题 $P(\beta)$ 成立"可推出 $P(\alpha)$ 成立，则 $P(\alpha)$ 对所有 $\alpha \in J$ 成立。

## §11 The Maximum Principle

> [!note] **Zorn 引理**
> 设 $A$ 是具偏序 $\prec$ 的集合。若 $A$ 中每个全序子集（链）都有上界，则 $A$ 中存在极大元。

Zorn 引理 $\iff$ 选择公理 $\iff$ 良序定理。

>[!tip] Zorn 引理是拓扑学中最常用的选择公理等价形式，用于证明"存在极大/极大理想/基"等问题——构造一个偏序集，验证每个链有上界，直接得到极大元。

## 相关链接

- 下一章：[[../Chapter 02 - Topological Spaces and Continuous Functions/00_Chapter_02_Overview|Chapter 2: Topological Spaces and Continuous Functions]]
