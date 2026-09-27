---
title: "第 11 章 局部紧 Hausdorff 空间上的测度"
date: 2026-09-27
tags:
  - higher-probability
  - measure-theory
  - topology
  - radon-measure
  - theory-note
  - chapter-11
  - source/upper-volume
aliases:
  - "Radon 测度"
  - "Riesz 表现定理"
  - "Lusin 定理"
note_type: "chapter"
source_volume: "上册"
source_chapter: "第 11 章"
source_pages: "PDF 272–295"
source: "《测度论基础与高等概率论》"
status: "draft"
source_check: "已按原书扫描页核对局部紧性、Radon 测度、Riesz 表现、连续逼近与乘积测度；OCR 文本存在噪声，个别公式仍需逐页图像复核"
exercise_range: "上册习题集第 11 章（11.1–11.4 节）"
content_boundary: "原书框架 + 教材式解释"
---

# 第 11 章 局部紧 Hausdorff 空间上的测度

> [!abstract] 核心问题
> 在一般拓扑空间上，怎样用紧集、开集和连续函数逼近可测对象？Radon 测度提供空间上的正则测度框架，Riesz 表现定理则把测度与连续函数上的正线性泛函对应起来；连续函数逼近和 Radon 乘积测度为弱收敛理论作准备。

## 11.1 局部紧 Hausdorff 空间上的连续函数

### 11.1.1 局部紧性与紧支撑函数

拓扑空间 $X$ 称局部紧，若每个点都有紧邻域；在 Hausdorff 情形，这等价于每点都有开邻域且其闭包紧。紧 Hausdorff 空间、离散空间和欧氏空间都是局部紧 Hausdorff 空间，有限个局部紧 Hausdorff 空间的乘积仍属此类。

记 $C_c(X)$ 为连续且具有紧支集的实值函数空间，$\operatorname{supp}f=\overline{\{x:f(x)\ne0\}}$。局部紧 Hausdorff 空间具有连续截断函数性质：若 $K\subset U$，其中 $K$ 紧、$U$ 开，则存在 $f\in C_c(X)$ 满足

$$
0\le f\le1,\qquad f|_K=1,\qquad \operatorname{supp}f\subset U.
$$

这类函数把集合的几何包含关系转化为连续函数的支集控制，是逼近定理和 Riesz 表现定理的基本工具。非紧空间上使用 $C_c(X)$ 而不是所有有界连续函数，是为了让积分有限并保留紧支撑定位。

## 11.2 局部紧 Hausdorff 空间上的测度与 Riesz 表现定理

### 11.2.1 正则测度与 Radon 测度

Hausdorff 空间上的 Borel 测度 $\mu$ 称为 Radon 测度，若它在每个紧集上有限且正则。对有限测度，正则性具体表现为外正则和内正则：Borel 集可由开集从外逼近，也可由紧集从内逼近。局部紧、第二可数 Hausdorff 空间上的 Radon 测度是 $\sigma$-有限的。

正则性使测度可以由空间的拓扑结构控制。若 $A$ 是有限测度 Borel 集，则

$$
\mu(A)=\sup\{\mu(K):K\subset A,\ K\text{ 紧}\}.
$$

配合外正则性，这让指标函数 $\mathbf1_A$ 可以用紧支集连续函数在 $L^p$ 意义下逼近。

### 11.2.2 Riesz 表现定理

若 $X$ 是局部紧 Hausdorff 空间，则 $C_c(X)$ 上每个正线性泛函 $L$ 都可由唯一 Radon 测度 $\mu$ 表示：

$$
L(f)=\int_X f\,d\mu,\qquad f\in C_c(X).
$$

正性是指 $f\ge0$ 蕴含 $L(f)\ge0$。反过来，每个 Radon 测度通过积分定义 $C_c(X)$ 上的正线性泛函。于是 Radon 测度与 $C_c(X)$ 上正线性泛函一一对应。

**结构说明。** 对开集 $U$，测度可由满足 $0\le f\le1$ 且 $\operatorname{supp}f\subset U$ 的连续函数积分上确界刻画；对一般 Borel 集再利用内外正则性确定测度。唯一性由连续截断函数能区分紧集和开集得到。

## 11.3 用连续函数逼近可测函数

### 11.3.1 $C_c$ 在 $L^p$ 中稠密

设 $\mu$ 是局部紧 Hausdorff 空间 $X$ 上的 Radon 测度，$1\le p<\infty$。则 $C_c(X)$ 在 $L^p(X,\mu)$ 中稠密。

证明先用可积简单函数逼近任意 $L^p$ 函数，因此只需处理有限测度 Borel 集 $A$ 的指标函数。由内正则性选紧集 $K\subset A$，由外正则性选开集 $U\supset A$，使 $\mu(U\setminus K)$ 任意小；再取连续截断函数 $f\in C_c(X)$，满足 $\mathbf1_K\le f\le\mathbf1_U$，便有

$$
\|f-\mathbf1_A\|_p^p\le\mu(U\setminus K).
$$

### 11.3.2 Lusin 定理

可测函数在“大部分空间上近似连续”。在原书的 Radon 测度框架下，设 $f$ 几乎处处有限，且其非零集合 $E=\{x:f(x)\ne0\}$ 有限测度。则对任意 $\varepsilon>0$，存在 $g\in C_c(X)$，使

$$
\mu\{x:|f(x)-g(x)|\ge\varepsilon\}<\varepsilon.
$$

该结论结合 $L^p$ 稠密性和 Egorov 定理得到：先以连续紧支撑函数在 $L^1$ 中逼近，再抽取几乎处处收敛子列，在大测度集合上用 Egorov 定理取得一致控制，最后用连续截断延拓。Lusin 型结论不表示原函数本身连续，也不提供全空间的统一误差控制。

## 11.4 Radon 乘积测度

### 11.4.1 乘积仍为 Radon 测度

若 $X,Y$ 都是局部紧、第二可数 Hausdorff 空间，$\mu,\nu$ 分别是 $X,Y$ 上的 Radon 测度，则在 $X\times Y$ 上的乘积测度 $\mu\otimes\nu$ 仍是 Radon 测度。第二可数和局部紧假设既保证乘积拓扑与相应 Borel 结构相容，也使 Radon 测度具有适当的 $\sigma$-有限性。

### 11.4.2 Radon 乘积上的 Fubini 定理

在上述乘积空间中，对非负 Borel 函数可用 Tonelli 定理交换积分次序；对关于 $\mu\otimes\nu$ 绝对可积的函数可用 Fubini 定理：

$$
\int_{X\times Y}f(x,y)\,d(\mu\otimes\nu)
=\int_X\!\left(\int_Y f(x,y)\,d\nu(y)\right)d\mu(x)
=\int_Y\!\left(\int_X f(x,y)\,d\mu(x)\right)d\nu(y).
$$

本节把第 10 章的抽象乘积积分定理放进局部紧空间和 Radon 测度框架；后续弱收敛的测试函数方法正是利用连续函数对测度的刻画能力。

## 本章小结

- 局部紧 Hausdorff 空间允许用紧支集连续函数局部化；正则性允许用紧集和开集逼近 Borel 集。
- Riesz 表现定理将 Radon 测度与 $C_c(X)$ 上的正线性泛函一一对应。
- 对 $1\le p<\infty$，$C_c(X)$ 在 $L^p(X,\mu)$ 中稠密；Lusin 定理给出依测度意义下的连续逼近。
- 在局部紧、第二可数 Hausdorff 条件下，Radon 乘积仍为 Radon 测度，并可使用 Fubini 定理。

## 习题导航

- [[高等概率论/01_测度论基础与高等概率论上册习题集#11.1 局部紧 Hausdorff 空间上的连续函数|11.1 局部紧 Hausdorff 空间上的连续函数]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#11.2 局部紧 Hausdorff 空间上的测度与 Riesz 表现定理|11.2 测度与 Riesz 表现定理]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#11.3 用连续函数逼近可测函数|11.3 用连续函数逼近可测函数]]
- [[高等概率论/01_测度论基础与高等概率论上册习题集#11.4 Radon 乘积测度|11.4 Radon 乘积测度]]

## 相关链接

- [[02_点集拓扑学初步|第 2 章 点集拓扑学初步]]
- [[10_乘积空间上的测度与积分|第 10 章 乘积空间上的测度与积分]]
- [[12_弱收敛|第 12 章 弱收敛]]
- [[00_上册总览|高等概率论上册总览]]
