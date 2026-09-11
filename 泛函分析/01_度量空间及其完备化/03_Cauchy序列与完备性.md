---
title: "Cauchy 序列与完备性"
date: 2026-09-11
tags:
  - functional-analysis
  - metric-space-completion
  - theory-note
aliases:
  - "基本序列"
  - "完备度量空间"
note_type: "theory"
source_section: "原书第一章 1.2"
status: "complete"
exercise_range: "1.2.2, 1.2.5"
---

# 3 Cauchy 序列与完备性

## 3.1 Cauchy 序列

> [!note] 定义 3.1 Cauchy 序列
> 设 $(\mathcal X,\rho)$ 是度量空间。若序列 $\{x_n\}$ 满足对任意 $\varepsilon>0$, 存在 $N\in\mathbb N$, 使得当 $m,n\geq N$ 时
> $$
> \rho(x_m,x_n)<\varepsilon,
> $$
> 则称 $\{x_n\}$ 是 Cauchy 序列。
^definition-3-1

原书中将 Cauchy 序列称为基本序列。这个概念只比较序列的后项彼此是否接近, 不需要先知道它将收敛到哪个点。

> [!note] 命题 3.1 收敛序列必为 Cauchy 序列
> 在任意度量空间中, 若 $x_n\to x$, 则 $\{x_n\}$ 是 Cauchy 序列。
^proposition-3-1

证明. 给定 $\varepsilon>0$. 由 $x_n\to x$, 存在 $N$ 使 $n\geq N$ 时
$$
\rho(x_n,x)<\frac{\varepsilon}{2}.
$$
若 $m,n\geq N$, 三角不等式给出
$$
\rho(x_m,x_n)
\leq\rho(x_m,x)+\rho(x,x_n)
<\varepsilon.
$$
因此 $\{x_n\}$ 是 Cauchy 序列. $\square$

逆命题不总成立。例如 $\mathbb Q$ 取通常距离时, 有理数序列可以逼近无理数 $\sqrt2$, 因而是 Cauchy 序列, 但它在 $\mathbb Q$ 中没有极限。

## 3.2 完备度量空间

> [!note] 定义 3.2 完备度量空间
> 若度量空间中的每一个 Cauchy 序列都在该空间中收敛, 则称该度量空间是完备的。
^definition-3-2

完备性不是说每个序列都收敛, 而是说每个已经表现出内部稳定性的序列都有极限。一般序列可能既不收敛也不是 Cauchy。

> [!note] 定理 3.1 Cauchy 序列的收敛子列判别
> 对任意度量空间中的 Cauchy 序列 $\{x_n\}$, 下列两件事等价:
>
> 1. $\{x_n\}$ 收敛.
> 2. $\{x_n\}$ 含有一个收敛子列.
^theorem-3-1

证明. 若 $\{x_n\}$ 收敛, 它的任意子列都收敛于同一个极限, 因而条件 2 成立。

反过来, 设 $\{x_n\}$ 是 Cauchy 序列, 且存在子列 $x_{n_j}\to x$. 给定 $\varepsilon>0$. 由 Cauchy 性, 存在 $N_1$ 使
$$
m,n\geq N_1
\Longrightarrow
\rho(x_m,x_n)<\frac{\varepsilon}{2}.
$$
又因为 $x_{n_j}\to x$, 可取 $j$ 足够大, 同时使 $n_j\geq N_1$ 且
$$
\rho(x_{n_j},x)<\frac{\varepsilon}{2}.
$$
对任意 $n\geq N_1$, 有
$$
\rho(x_n,x)
\leq\rho(x_n,x_{n_j})+\rho(x_{n_j},x)
<\varepsilon.
$$
所以 $x_n\to x$. $\square$

这个判别说明, Cauchy 序列一旦有一个可识别的极限子列, 其余项就被 Cauchy 性强制到同一个极限附近。

## 3.3 近似基本序列推出收敛

> [!note] 命题 3.2
> 设 $(\mathcal X,\rho)$ 是完备度量空间。若序列 $\{x_n\}$ 满足: 对每个 $\varepsilon>0$, 存在 Cauchy 序列 $\{y_n\}$, 使
> $$
> \rho(x_n,y_n)<\varepsilon
> \qquad(n=1,2,\ldots),
> $$
> 则 $\{x_n\}$ 收敛。
^proposition-3-2

证明. 先证明 $\{x_n\}$ 是 Cauchy 序列。给定 $\delta>0$, 取一个 Cauchy 序列 $\{y_n\}$, 使
$$
\rho(x_n,y_n)<\frac{\delta}{4}
\qquad\text{对所有 }n.
$$
由 $\{y_n\}$ 的 Cauchy 性, 存在 $N$ 使 $m,n\geq N$ 时
$$
\rho(y_m,y_n)<\frac{\delta}{2}.
$$
因此
$$
\rho(x_m,x_n)
\leq\rho(x_m,y_m)+\rho(y_m,y_n)+\rho(y_n,x_n)
<\frac{\delta}{4}+\frac{\delta}{2}+\frac{\delta}{4}
=\delta.
$$
故 $\{x_n\}$ 是 Cauchy 序列。因为 $\mathcal X$ 完备, 存在 $x\in\mathcal X$ 使 $x_n\to x$. $\square$

注意, 这里的 $\{y_n\}$ 可以随 $\varepsilon$ 改变。证明的关键是: 先选一个足够精确的近似 Cauchy 序列, 再用它控制 $\{x_n\}$ 的尾部。

## 3.4 完备性和距离的关系

若两个度量 $\rho$ 和 $d$ 满足
$$
c\rho\leq d\leq C\rho
$$
其中 $c,C>0$, 则它们具有相同的 Cauchy 序列, 因而一个空间关于 $\rho$ 完备当且仅当关于 $d$ 完备。

但仅仅具有相同的拓扑并不自动保证完备性相同。例如在 $\mathbb R$ 上, 通常距离 $\rho(x,y)=|x-y|$ 与
$$
d(x,y)=\left|\frac{x}{1+|x|}-\frac{y}{1+|y|}\right|
$$
产生同样的拓扑, 但后者把 $\mathbb R$ 等距对应到有界开区间, 因而不完备。这说明完备性是度量性质, 不是单纯的拓扑性质。

## 3.5 习题连接

- [[泛函分析讲义上册习题册#1.2.2|习题 1.2.2]] 的完整证明见本节定理 3.1.
- [[泛函分析讲义上册习题册#1.2.5|习题 1.2.5]] 的完整证明见本节命题 3.2.

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_序列收敛与连续性|序列收敛与连续性]]
- [[04_闭子空间与完备性判别|闭子空间与完备性判别]]
- [[05_完备化的构造|完备化的构造]]
