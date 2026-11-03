---
title: "当代数学园地1 Kac-Moody 代数导引习题集"
date: 2026-09-09
tags:
  - exercise-book
  - mathematics
  - lie-algebra
  - kac-moody
aliases:
  - "当代数学园地1 Kac-Moody 代数导引习题集"
note_type: "参考书习题集"
source_volume: "万哲先《当代数学园地1 Kac-Moody 代数导引》"
source_chapter: "第1, 2, 7章"
status: "in-progress"
source_check: "6处明确练习已整理; 答案区域保持空白"
exercise_range: "KM-1--KM-6"
---

# 当代数学园地1 Kac-Moody 代数导引习题集

> [!abstract] 编排说明
>
> 本习题集整理自《当代数学园地1 Kac-Moody 代数导引（万哲先著）》中明确留给读者的 6 处练习。原书未设置独立的、连续编号的“习题”栏，因此本集按出现顺序补充编号 KM-1 至 KM-6；数学符号已统一为 LaTeX/MathJax，答案区域留空，不附解答。
>
> 书中其他“证明留作习题”的交叉引用没有在未出现题面时扩展为新题。

> [!note] 配套课程笔记
> 课程记录见 [[00_李代数课程总览|李代数课程总览]]、[[01_李代数基础课程记录|第一讲]]、[[02_李代数第二讲课程记录|第二讲]]、[[03_李代数第三讲课程记录|第三讲]]、[[04_李代数第四讲课程记录|第四讲]]、[[05_李代数第五讲课程记录|第五讲]]、[[06_李代数第六讲课程记录|第六讲]]、[[07_李代数第七讲课程记录|第七讲]]、[[08_李代数第八讲课程记录|第八讲]]及[[李代数入门整合讲义|整合讲义]]。课程作业 1--8 另存于“作业”文件夹，与本参考书习题集分开维护。

## 课程导航

- [[00_李代数课程总览|李代数课程总览]]
- [[01_李代数基础课程记录|李代数基础课程记录]]
- [[02_李代数第二讲课程记录|李代数第二讲课程记录]]
- [[03_李代数第三讲课程记录|李代数第三讲课程记录]]
- [[04_李代数第四讲课程记录|李代数第四讲课程记录]]
- [[05_李代数第五讲课程记录|李代数第五讲课程记录]]
- [[06_李代数第六讲课程记录|李代数第六讲课程记录]]
- [[李代数入门整合讲义|李代数入门整合讲义]]
- [[作业/作业1|李代数基础作业 1]]
- [[作业/作业2|李代数基础作业 2]]
- [[作业/作业3|李代数基础作业 3]]
- [[作业/作业4|李代数基础作业 4]]
- [[作业/作业5|李代数基础作业 5]]
- [[作业/作业6|李代数基础作业 6]]

## 目录

- [[#第 1 章 Lie 代数 g(A)|第 1 章 Lie 代数 g(A)]]
  - [[#1.4|1.4]]
- [[#第 2 章 广义 Cartan 矩阵的分类|第 2 章 广义 Cartan 矩阵的分类]]
  - [[#2.3|2.3]]
- [[#第 7 章 仿射 Lie 代数的实现|第 7 章 仿射 Lie 代数的实现]]
  - [[#7.1|7.1]]

# 第 1 章 Lie 代数 g(A)

## 1.4

### KM-1

证明：具有 Cartan 矩阵 $A$ 的有限维单 Lie 代数同构于 $g(A)$。

> 原书第 22 页；原文说明“我们把这留作练习”。

#### 答案

<!-- 留空，供作答 -->

# 第 2 章 广义 Cartan 矩阵的分类

## 2.3

### KM-2

证明：矩阵 $A=(a_{ij})$ 是可对称化的，当且仅当 $a_{ij}=0$ 蕴含着 $a_{ji}=0$，并且对于任意的 $i_1,\ldots,i_k$，有

$$
a_{i_1i_2}a_{i_2i_3}\cdots a_{i_{k-1}i_k}a_{i_ki_1}
=a_{i_1i_k}a_{i_ki_{k-1}}\cdots a_{i_3i_2}a_{i_2i_1}.
$$

> 原书第 40 页；原文说明“证明留作练习”。

#### 答案

<!-- 留空，供作答 -->

# 第 7 章 仿射 Lie 代数的实现

## 7.1

### KM-3

证明引理 7.1C：定义

$$
\Phi:L(\mathfrak g)\times L(\mathfrak g)\longrightarrow\mathbb C,
\qquad \Phi(a,b)=(da,b).
$$

证明 $\Phi$ 是 $L(\mathfrak g)$ 上的 $2$-余循环。

> 原书第 138 页；原文说明“证明留作练习”。

#### 答案

<!-- 留空，供作答 -->

### KM-4

证明引理 7.1D：令

$$
\widetilde{L}(\mathfrak g)=L(\mathfrak g)\oplus\mathbb Cc,
$$

并定义

$$
[a+\lambda c,b+\mu c]=[a,b]_0+\Phi(a,b)c.
$$

证明一维中心扩张 $\widetilde{L}(\mathfrak g)$ 是一个 Lie 代数。

> 原书第 139 页；原文说明“证明留作练习给读者”。

#### 答案

<!-- 留空，供作答 -->

### KM-5

证明原书第 141 页（v）中的关系式。设

$$
\alpha_0=\delta-\theta,
\qquad
\alpha_0^\vee=\frac{2}{(\theta,\theta)}c-\theta^\vee.
$$

证明

$$
[e_i,f_j]=\delta_{ij}\alpha_i^\vee,
\qquad i,j=0,1,\ldots,l,
$$

$$
[h,e_i]=\langle h,\alpha_i\rangle e_i,
\qquad h\in\mathfrak h,\quad i=0,1,\ldots,l,
$$

$$
[h,f_i]=-\langle h,\alpha_i\rangle f_i,
\qquad h\in\mathfrak h,\quad i=0,1,\ldots,l.
$$

> 原书第 141 页；原文说明“我们将（v）作为练习留给读者”。

#### 答案

<!-- 留空，供作答 -->

### KM-6

证明原书第 141 页（vi）：令

$$
\Delta=\{\alpha+n\delta\mid \alpha\in\dot{\Delta},\ n\in\mathbb Z\}
\cup\{n\delta\mid n\in\mathbb Z\setminus\{0\}\}.
$$

证明 $\Delta$ 是 $\widetilde{L}(\mathfrak g)$ 的根系，并证明根空间分解

$$
\widetilde{L}(\mathfrak g)=\mathfrak h\oplus
\bigoplus_{\alpha\in\Delta}\widetilde{L}(\mathfrak g)_\alpha.
$$

> 原书第 141 页；原文说明“将（vi）的证明也留作练习”。

#### 答案

<!-- 留空，供作答 -->
