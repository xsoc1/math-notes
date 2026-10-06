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

## 1. 定理及复数约定

> [!note] Hilbert 空间 Riesz 表示定理
> 对任意 $f\in H^*$，存在唯一 $y_f\in H$，使
> $$
> f(x)=(x,y_f)\qquad(x\in H),\qquad \|f\|=\|y_f\|.
> $$
> 内积对第一变量线性。在复空间中，$y\mapsto(\,\cdot\,,y)$ 是共轭线性等距双射，不是线性双射。

**先构造表示元。** $f=0$ 时取 $y_f=0$。否则 $M=\ker f$ 闭，取 $z\notin M$，由投影定理写 $z=m+u$，其中 $m\in M$、$0\ne u\in M^\perp$。有 $f(u)\ne0$。

对任意 $x$，$x-f(x)u/f(u)\in M$，故
$$
(x,u)=\frac{f(x)}{f(u)}\|u\|^2.
$$
所以取
$$
y_f=\frac{\overline{f(u)}}{\|u\|^2}u
$$
便得 $(x,y_f)=f(x)$。

**再证唯一。** 若两个表示元有效，则对所有 $x$ 有 $(x,y_1-y_2)=0$，取 $x=y_1-y_2$，得到两者相同。

**最后证范数。** Cauchy–Schwarz 给 $\|f\|\leq\|y_f\|$；非零时取 $x=y_f/\|y_f\|$ 得等号。$\square$

因此非零 Hilbert 连续泛函在单位球上取到范数。不要把这句话推广到任意 Banach 空间泛函或任意 Hilbert 值算子。

## 2. 有界形式对应有界算子

设 $a(x,y)$ 对第一变量线性、第二变量共轭线性，并满足
$$
|a(x,y)|\leq M\|x\|\|y\|.
$$
固定 $y$，对泛函 $x\mapsto a(x,y)$ 使用表示定理，得唯一 $Ay$ 使
$$
a(x,y)=(x,Ay).
$$
再检查 $y$ 变量：$a(x,\lambda y+\mu z)=\overline\lambda a(x,y)+\overline\mu a(x,z)$，恰好与 $(x,\lambda Ay+\mu Az)$ 相同。表示元唯一性给 $A$ 线性。并且
$$
\|Ay\|=\sup_{\|x\|\leq1}|a(x,y)|\leq M\|y\|.
$$
这就得到 $A\in\mathcal L(H,H)$。

因此求解
$$
a(x,y)=f(x)\quad(\forall x)
$$
等价于 $Ay=y_f$。形式有界只保证算子有界，不能保证它可逆；后者需要 [[泛函分析/09_Baire纲与基本定理/04_Lax-Milgram与稳定性|Lax–Milgram 的下界条件]]等额外结构。

## 3. 不完备时表示元可能只在完备化里

在 $U=c_{00}$ 带 $\ell^2$ 内积时，取 $g=(1,1/2,1/3,\ldots)\in\ell^2\setminus U$，定义
$$
f(x)=\sum_nx_n\overline{g_n}.
$$
该和对 $x\in U$ 有限，Cauchy–Schwarz 给出连续性。若有 $y\in U$ 表示它，逐个测试 $e_n$，得到 $y_n=g_n$，不可能有限支撑。

它在完备化 $\ell^2$ 中有表示元 $g$；原空间缺少这个向量。这是汪林 12.15（印刷第 242 页，PDF 第 267 页）所示失败现象的同机制补充。

## 4. “表示”不只是换符号

泛函 $f$ 最初只规定对每个测试向量输出一个数；表示定理同时给出表示元的存在、唯一与范数估计。三者缺一，不能说已经解出变分方程。尤其若选错空间，使 $f$ 不连续，表示定理根本不能启动。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_弱解与变分不等式|弱解与能量]]
- [[03_Radon-Nikodym定理的Hilbert空间证明|测度密度的表示构造]]
- [[泛函分析/06_Hilbert空间与正交方法/03_投影定理与最小二乘|表示定理所用的投影]]
- [[泛函分析/07_有界算子与对偶空间/02_对偶空间与算子反例|范数是否取到]]
- [[泛函分析讲义上册习题册#2.2 Hilbert 空间中的投影与核|原书 2.2 节]]
