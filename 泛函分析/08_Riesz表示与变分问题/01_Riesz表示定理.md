---
title: "Riesz 表示定理"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-riesz-variational
  - theory-note
note_type: theory
source_section: "F/9 第 12–14 页；汪林 12.15 的同机制补充"
exercise_range: "2.2 节"
status: "已补证"
---

# Riesz 表示定理

## 1. Hilbert 空间 Riesz 表示定理及其复共轭线性特征

在 Hilbert 空间 $H$ 中，对任意固定的向量 $y\in H$，由于内积 $(x,y)$ 对第一变量 $x$ 线性，且由 Cauchy-Schwarz 不等式有 $|(x,y)|\leq\|y\|\cdot\|x\|$，映射 $x\mapsto(x,y)$ 显然定义了 $H^*$ 中的一个连续线性泛函，其范数等于 $\|y\|$。**Riesz 表示定理**指出：当 $H$ 完备时，这一构造穷尽了 $H^*$ 中的**所有**连续线性泛函！

> [!note] 定理 1.1 Hilbert 空间 Riesz 表示定理（Fréchet-Riesz 定理）
> 设 $H$ 是实或复 **Hilbert 空间**。则对任意连续线性泛函 $f\in H^*$，在 $H$ 中**存在唯一**的表示向量 $y_f\in H$，使得对一切 $x\in H$ 恒有
> $$
> f(x)=(x,y_f)\qquad(\forall x\in H),
> $$
> 并且泛函范数等于表示向量的范数：
> $$
> \|f\|_{H^*}=\|y_f\|_H.
> $$
> （注：按内积对第一变量线性、对第二变量共轭线性的约定，在复 Hilbert 空间中，对应关系 $J:H\to H^*,\ y\mapsto(\cdot,y)$ 是满射等距**共轭线性**同构，即 $J(\alpha y+\beta z)=\overline\alpha Jy+\overline\beta Jz$。）

**证明：**
1. **存在性（借助核的正交补构造表示元）：**
   - 若 $f=0$ 为零泛函，直接取 $y_f=0$ 即可。
   - 若 $f\neq 0$，考察其核空间 $M=\ker f=\{x\in H:f(x)=0\}$。由于 $f$ 是连续线性泛函，$M$ 是 $H$ 的**闭真子空间**（$M\neq H$）。
     根据 [[泛函分析/06_Hilbert空间与正交方法/03_投影定理与最小二乘#3. 闭线性子空间与正交直和分解定理|06 专题定理 3.1（正交直和分解定理）]]，$H=M\oplus M^\perp$，故正交补 $M^\perp\neq\{0\}$。任取一个非零向量 $u\in M^\perp\setminus\{0\}$，由于 $u\notin M=\ker f$，必有 $f(u)\neq 0$。
     现对空间中的任意向量 $x\in H$，由于
     $$
     f\left(x-\frac{f(x)}{f(u)}u\right)=f(x)-\frac{f(x)}{f(u)}f(u)=0,
     $$
     可知向量 $m=x-\frac{f(x)}{f(u)}u\in M$。利用 $u\in M^\perp$（即 $(m,u)=0$），将 $x=m+\frac{f(x)}{f(u)}u$ 与 $u$ 作内积，得
     $$
     (x,u)=\left(m+\frac{f(x)}{f(u)}u,\ u\right)=0+\frac{f(x)}{f(u)}\|u\|^2.
     $$
     将系数移入内积的第二个变量（注意复共轭！），定义向量
     $$
     y_f=\frac{\overline{f(u)}}{\|u\|^2}u\in M^\perp,
     $$
     则对一切 $x\in H$ 立即满足
     $$
     (x,y_f)=\left(x,\ \frac{\overline{f(u)}}{\|u\|^2}u\right)=\frac{f(u)}{\|u\|^2}(x,u)=f(x).
     $$

2. **唯一性：**
   若 $y_1,y_2\in H$ 均满足对一切 $x\in H$ 有 $(x,y_1)=f(x)=(x,y_2)$，则对一切 $x\in H$ 有 $(x,y_1-y_2)=0$。特别地，取 $x=y_1-y_2$，得 $\|y_1-y_2\|^2=(y_1-y_2,y_1-y_2)=0$，故 $y_1=y_2$。

3. **等距性：**
   一方面，由 Cauchy-Schwarz 不等式 $|f(x)|=|(x,y_f)|\leq\|x\|\cdot\|y_f\|$ 可知 $\|f\|_{H^*}\leq\|y_f\|_H$；另一方面，当 $y_f\neq 0$ 时，在单位向量 $x_0=y_f/\|y_f\|_H$ 上测试得
   $$
   \|f\|_{H^*}\geq|f(x_0)|=\frac{|(y_f,y_f)|}{\|y_f\|_H}=\|y_f\|_H.
   $$
   故 $\|f\|_{H^*}=\|y_f\|_H$（这也同时表明 Hilbert 空间上的每一个非零连续线性泛函都在唯一的方向 $y_f/\|y_f\|$ 上取到其范数）。$\square$

## 2. 有界半双线性形式与有界线性算子的一一对应

在偏微分方程与算子谱理论中，算子往往不是直接给出的，而是通过积分形式的**双线性形式**（复空间中为**半双线性形式 / Sesquilinear Form**）$a(x,y)$ 隐式定义的。借助 Riesz 表示定理，任何有界半双线性形式都可以唯一地表示为一个有界线性算子：

> [!note] 定理 2.1 有界半双线性形式的算子表示定理
> 设 $H$ 是 Hilbert 空间，$a:H\times H\to\mathbb K$ 是半双线性形式（即对第一变量 $x$ 线性，对第二变量 $y$ 共轭线性），且满足**有界性条件**：存在常数 $M\geq 0$，使得
> $$
> |a(x,y)|\leq M\|x\|\cdot\|y\|\qquad(\forall x,y\in H).
> $$
> 则存在**唯一**的有界线性算子 $A\in\mathcal L(H,H)$，使得对一切 $x,y\in H$ 恒有
> $$
> a(x,y)=(x,Ay),
> $$
> 且算子范数满足 $\|A\|=\sup_{\|x\|\leq 1,\|y\|\leq 1}|a(x,y)|\leq M$。

**证明：**
1. **逐点固定 $y$ 应用 Riesz 表示定理：** 对每个固定的向量 $y\in H$，考察关于 $x$ 的映射 $\ell_y:x\mapsto a(x,y)$。由于 $a$ 对第一变量线性，且 $|\ell_y(x)|=|a(x,y)|\leq(M\|y\|)\|x\|$，故 $\ell_y\in H^*$ 是连续线性泛函，且 $\|\ell_y\|_{H^*}\leq M\|y\|$。由定理 1.1（Riesz 表示定理），存在唯一的表示向量（我们将它记为 $Ay\in H$），使得对一切 $x\in H$ 有
   $$
   a(x,y)=\ell_y(x)=(x,Ay),\qquad\text{且}\quad \|Ay\|_H=\|\ell_y\|_{H^*}\leq M\|y\|_H.
   $$
2. **验证映射 $y\mapsto Ay$ 的线性性：** 对任意 $y,z\in H$ 及标量 $\lambda,\mu\in\mathbb K$，利用 $a(x,\cdot)$ 对第二变量的共轭线性性与内积对第二变量的共轭线性性，对一切 $x\in H$ 有
   $$
   \begin{aligned}
   \bigl(x,A(\lambda y+\mu z)\bigr)&=a(x,\lambda y+\mu z)=\overline\lambda a(x,y)+\overline\mu a(x,z)\\
   &=\overline\lambda(x,Ay)+\overline\mu(x,Az)=\bigl(x,\lambda Ay+\mu Az\bigr).
   \end{aligned}
   $$
   由内积表示元的唯一性（对全体 $x$ 内积相等则向量相等），立即得出
   $$
   A(\lambda y+\mu z)=\lambda Ay+\mu Az!
   $$
   这说明（由于两个位置的共轭符号刚好相互抵消）$A:H\to H$ 是真正的**线性算子**，且由 $\|Ay\|\leq M\|y\|$ 知 $A\in\mathcal L(H,H)$、$\|A\|\leq M$。$\square$

*应用启示：* 有了定理 2.1，求解抽象变分方程
$$
\text{求 }y\in H,\quad\text{使得 }\forall x\in H,\quad a(x,y)=f(x)
$$
就完全等价于在 $H$ 中求解线性算子方程
$$
Ay=y_f\qquad(\text{因为 }\forall x\in H,\ (x,Ay)=(x,y_f)\iff Ay=y_f).
$$
需要注意，半双线性形式 $a(x,y)$ 的**有界性**仅保证对应算子 $A$ 是有界线性算子，并不保证 $A$ 可逆；要使算子方程 $Ay=y_f$ 对任意 $f\in H^*$ 都有唯一解，还需要进一步对 $a(x,y)$ 施加下界条件（即 [[泛函分析/09_Baire纲与基本定理/04_Lax-Milgram与稳定性|09 专题第 4 节的 Lax-Milgram 强制性条件]]）。

## 3. 反例：不完备内积空间上 Riesz 表示定理失效（汪林 12.15 机制）

定理 1.1 的存在性证明高度依赖于 Hilbert 空间的**完备性**（通过正交分解定理保证 $M^\perp\neq\{0\}$）。若内积空间 $U$ 不完备，其上的连续线性泛函 $f\in U^*$ 的表示向量很可能落在完备化空间 $\widehat U\setminus U$ 中，而在原空间 $U$ 内部根本不存在表示元：

> [!example] 不完备内积空间 $(c_{00},\|\cdot\|_2)$ 上无表示元的连续线性泛函
> 在赋予 $\ell^2$ 内积 $(x,y)=\sum_{n=1}^\infty x_n\overline{y_n}$ 的有限支撑序列空间 $U=c_{00}$ 上，取向量 $g=\bigl(1,\frac{1}{2},\frac{1}{3},\ldots\bigr)\in\ell^2\setminus c_{00}$，并定义线性泛函：
> $$
> f(x)=\sum_{n=1}^\infty\frac{x_n}{n}\qquad(x=(x_n)\in c_{00}).
> $$
> 则 $f\in U^*$ 是 $U$ 上的连续线性泛函，但在 $U=c_{00}$ 中**不存在任何向量 $y\in c_{00}$ 使得 $f(x)=(x,y)$ 对一切 $x\in c_{00}$ 成立**。

**验证：** 对任意 $x\in c_{00}$，上式仅为有限项求和，且由 Cauchy-Schwarz 不等式有
$$
|f(x)|\leq\left(\sum_{n=1}^\infty\frac{1}{n^2}\right)^{1/2}\|x\|_2=\frac{\pi}{\sqrt 6}\|x\|_2,
$$
故 $f$ 是 $U=c_{00}$ 上的有界线性泛函。然而，倘若存在某个向量 $y=(y_n)\in c_{00}$ 使得对一切 $x\in c_{00}$ 有 $f(x)=(x,y)$，则依次取标准基向量 $x=e_n\in c_{00}$（$n\geq 1$）代入测试，可得
$$
\overline{y_n}=(e_n,y)=f(e_n)=\frac{1}{n}\quad\Longrightarrow\quad y_n=\frac{1}{n}\neq 0\qquad(\forall n\geq 1).
$$
这意味着 $y$ 拥有无穷多个非零坐标，与 $y\in c_{00}$（仅有有限项非零）矛盾！事实上，该泛函的唯一内积表示元正是落在完备化空间 $\ell^2\setminus c_{00}$ 中的向量 $g=\bigl(1,\frac{1}{2},\frac{1}{3},\ldots\bigr)$（参见汪林《泛函分析中的反例》12.15，印刷版第 242 页 / PDF 第 267 页）。

## 4. Riesz 表示定理在变分法中的方法论意义

初学者有时会觉得 Riesz 表示定理“只是把符号 $f(x)$ 改写成了内积 $(x,y_f)$”。事实上，在偏微分方程与变分问题中，给定的外力项或边界积分最初只规定了一个算式 $f(v)$（对每个测试函数 $v$ 输出一个标量），此时我们并不知道方程的解是否存在；而一旦验证了 $f$ 是关于能量内积范数的连续线性泛函，**Riesz 表示定理就一步同时确立了真解 $y_f$ 在完备能量空间中的存在性、唯一性以及先验能量估计 $\|y_f\|_H=\|f\|_{H^*}$**。反之，倘若空间或内积选取不当导致 $f$ 在该范数下不连续（例如在高维区域 $d\geq 2$ 的 $H_0^1(\Omega)$ 上考察单点 Dirac 泛函 $\delta_0(v)=v(0)$），则表示定理的前提不满足，方程在 $H_0^1(\Omega)$ 中确实不存在弱解。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_弱解与变分不等式|弱解与能量]]
- [[03_Radon-Nikodym定理的Hilbert空间证明|测度密度的表示构造]]
- [[泛函分析/06_Hilbert空间与正交方法/03_投影定理与最小二乘|表示定理所用的投影]]
- [[泛函分析/07_有界算子与对偶空间/02_对偶空间与算子反例|范数是否取到]]
- [[泛函分析讲义上册习题册#2.2 Hilbert 空间中的投影与核|原书 2.2 节]]

## 跨主题参照

- [[高等概率论/笔记/01_上册_测度论基础/11_局部紧空间上的测度与Riesz表示#11.2.2 Riesz 表现定理|局部紧空间上的测度与Riesz表示]]：对照局部紧 Hausdorff 空间上紧支撑连续函数空间 $C_c(X)$ 的正线性泛函由 Radon 测度表示的定理版本。
