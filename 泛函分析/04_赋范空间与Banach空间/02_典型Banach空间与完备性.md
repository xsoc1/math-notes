---
title: "典型 Banach 空间与完备性"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-normed-spaces
  - theory-note
note_type: theory
source_section: "F/3 的典型空间与完备化部分"
exercise_range: "1.2.3–1.2.4；1.4 节"
status: "已补证"
---

# 典型 Banach 空间与完备性

证明完备性不能止于“每个坐标都有极限”。必须继续证明：极限属于所定义的空间，且原向量列在指定范数下趋于它。

## 1. $c_0$ 与 $\ell^\infty$

在上确界范数下，设 $\{x^{(m)}\}$ 为基本列。先写出各坐标列 $\{x_j^{(m)}\}_m$；由
$$
|x_j^{(m)}-x_j^{(n)}|\leq\|x^{(m)}-x^{(n)}\|_\infty
$$
说明它们是标量基本列，再定义 $x_j=\lim_mx_j^{(m)}$。

给定 $\varepsilon>0$，先取 $M$ 使 $m,n\geq M$ 时范数差小于 $\varepsilon/2$。固定 $m\geq M$，对每个 $j$ 令 $n\to\infty$，得 $|x_j^{(m)}-x_j|\leq\varepsilon/2$。因此 $x$ 有界且 $\|x^{(m)}-x\|_\infty\leq\varepsilon/2<\varepsilon$。

若原列在 $c_0$ 中，固定上述 $m$，再取 $J$ 使 $j\geq J$ 时 $|x_j^{(m)}|<\varepsilon/2$，则 $|x_j|<\varepsilon$，所以 $x\in c_0$。两空间均完备。

## 2. $\ell^p$，$1\leq p<\infty$

先用相同路线构造坐标极限 $x_j$。给定 $\varepsilon>0$，取 $M$ 使 $m,n\geq M$ 时 $\|x^{(m)}-x^{(n)}\|_p<\varepsilon$。固定 $m\geq M$ 和有限 $N$，令 $n\to\infty$：
$$
\sum_{j=1}^N|x_j^{(m)}-x_j|^p\leq\varepsilon^p.
$$
再令 $N\to\infty$，得到 $x-x^{(m)}\in\ell^p$ 且其范数不超过 $\varepsilon$。由于 $x^{(m)}\in\ell^p$，Minkowski 不等式给出 $x\in\ell^p$。把起初的 $\varepsilon$ 换成任意更小数，便得整体范数收敛。

这里先在有限和中取坐标极限，再用非负级数取上确界；不未经说明交换无限求和与极限。

## 3. $L^p$ 的“可和子列”证明

这里使用实变函数中的 Hölder、Minkowski、单调收敛与 Fatou 引理；这些是本证明的前置结果，不在本专题重复建立 Lebesgue 积分。

> [!note] 定理
> 对任意测度空间，按几乎处处相等取等价类后的 $L^p$，$1\leq p\leq\infty$，是 Banach 空间。

设 $\{f_n\}$ 为 $L^p$ 基本列，$p<\infty$。先取递增指标 $n_k$ 使
$$
\|f_{n_{k+1}}-f_{n_k}\|_p\leq2^{-k}.
$$
记 $h_k=f_{n_{k+1}}-f_{n_k}$，构造 $g_N=\sum_{k=1}^N|h_k|$。Minkowski 给出 $\|g_N\|_p\leq\sum2^{-k}\leq1$。由单调收敛，$g=\sum|h_k|\in L^p$，特别地 $g<\infty$ 几乎处处。因此先在这个满测集上定义
$$
f=f_{n_1}+\sum_{k=1}^\infty h_k,
$$
其余点任取值。由 $|f|\leq|f_{n_1}|+g$ 知 $f\in L^p$。Fatou 与有限尾项估计给出
$$
\|f-f_{n_K}\|_p\leq\sum_{k=K}^\infty2^{-k}\longrightarrow0.
$$
最后由原列的基本性和三角不等式，将这个子列收敛提升为整个列收敛。$\square$

对 $p=\infty$，同样选子列。去掉使 $|h_k|>2^{-k}$ 的所有零测集的可数并，余下集合上级数一致绝对收敛，尾项不超过 $\sum_{k\geq K}2^{-k}$。这构造出本质有界极限，得到本质上确界范数收敛，再回到全列。

## 4. 连续函数及其导数空间

$C(K,\mathbb K)$ 的基本列先逐点构造极限；基本性给出统一的范数估计，因此一致收敛。连续性由三项分解
$$
|f(t)-f(s)|\leq|f(t)-f_n(t)|+|f_n(t)-f_n(s)|+|f_n(s)-f(s)|
$$
得到。所以它在上确界范数下完备。

在 $C^k[a,b]$ 上取 $\|f\|_{C^k}=\sum_{j=0}^k\|f^{(j)}\|_\infty$。基本列的各阶导数一致收敛于连续函数 $g_j$。先由
$$
f_n^{(j)}(t)-f_n^{(j)}(a)=\int_a^tf_n^{(j+1)}(s)\,ds
$$
取极限，得 $g_j(t)-g_j(a)=\int_a^tg_{j+1}(s)\,ds$。于是 $g_j'=g_{j+1}$，极限 $g_0\in C^k$，全范数收敛。这说明“导数也收敛”只有结合积分关系，才真正保证它们是同一个极限函数的导数。

## 5. Sobolev 完备化的边界

一般开集 $\Omega$ 上可定义
$$
W^{1,p}(\Omega)=\{u\in L^p:\partial_ju\in L^p\text{（分布意义）}\}.
$$
它在 $\|u\|_p+\sum_j\|\partial_ju\|_p$ 下完备：基本列先给出 $u_n\to u$、$\partial_ju_n\to v_j$。对每个 $\varphi\in C_c^\infty(\Omega)$，用 Hölder 取极限于
$$
\int u_n\,\partial_j\varphi=-\int(\partial_ju_n)\varphi
$$
得到 $\partial_ju=v_j$。

但“某个光滑函数类的完备化”是否恰为全部 $W^{1,p}(\Omega)$，还要证明该类稠密，并说明区域条件。尤其 $C_c^\infty(\Omega)$ 的闭包定义的是 $W_0^{1,p}$，带有零边界条件，不能与全部 $W^{1,p}$ 混同。本篇不在任意区域上未经证明地认定 $C^k(\overline\Omega)$ 稠密。

## 6. 绝对可和级数判别完备性

> [!note] 判别定理
> 赋范空间 $X$ 是 Banach 空间，当且仅当每个满足 $\sum_n\|u_n\|<\infty$ 的向量级数 $\sum_nu_n$ 都在 $X$ 中收敛。

先设完备。构造部分和 $s_N$，由 $\|s_M-s_N\|\leq\sum_{n=N+1}^M\|u_n\|$ 说明它是基本列，再由完备性收敛。

反过来，设绝对可和级数都收敛。对任意基本列 $\{x_n\}$，先取递增指标 $n_k$，使 $\|x_{n_{k+1}}-x_{n_k}\|\leq2^{-k}$。构造
$$
x_{n_1}+\sum_{k=1}^\infty(x_{n_{k+1}}-x_{n_k}).
$$
它绝对可和，故收敛；有限部分和就是 $x_{n_K}$，所以原基本列有收敛子列，再由基本性得到全列收敛。$\square$

这一判据解释了 $L^p$ 完备性证明为什么主动选择快速子列：把只知基本性的对象转化成有可和误差的构造。对应 [[泛函分析讲义上册习题册#1.4.7|习题 1.4.7]]，但不重写该题已有作答。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_线性结构与范数|零距离等价类与线性完备化]]
- [[04_商空间与最佳逼近|商空间的基本列]]
- [[泛函分析/01_度量空间及其完备化/07_典型完备化例子|原有典型完备化]]
- [[泛函分析/08_Riesz表示与变分问题/02_弱解与变分不等式|零边界 Hilbert 空间]]
- [[泛函分析讲义上册习题册#1.4 赋范空间与 Banach 空间|原书 1.4 节]]

## 跨主题参照

- [[高等概率论/笔记/01_上册_测度论基础/09_Lebesgue空间与一致可积性#9.2 三类 Lebesgue 空间|Lebesgue空间与一致可积性]]。对照积分不等式与一致可积收敛判据，区分空间完备性和给定函数列的收敛条件。
