---
title: "Banach 不动点定理"
date: 2026-09-18
tags:
  - functional-analysis
  - fixed-point
  - contraction-mapping
  - theory-note
aliases:
  - "Banach 不动点定理"
  - "Banach 压缩映象原理"
  - "压缩映射原理"
note_type: "theory"
source_section: "原书第一章 1.1"
status: "complete"
exercise_range: "1.1.3--1.1.5"
---

# Banach 不动点定理

> [!abstract] 核心问题
> 如果一个映象把任意两点之间的距离统一缩小一个固定比例, 那么反复迭代是否一定会收敛到某个不动点? 完备性保证“应该存在的极限”仍在空间中, 而统一的压缩常数保证迭代序列确实是基本列。

## 1. 基本定义

> [!note] 定义 1.1 压缩映象
> 设 $(X,d)$ 是度量空间, $T:X\to X$. 若存在常数 $q\in[0,1)$, 使得对任意 $x,y\in X$,
> $$
> d(Tx,Ty)\leq qd(x,y),
> $$
> 则称 $T$ 是压缩映象, $q$ 称为一个压缩常数。
^definition-contraction

这里的关键是同一个 $q<1$ 对所有点都成立。仅有
$$
d(Tx,Ty)<d(x,y)\qquad(x\neq y)
$$
还不等于存在统一的 $q<1$；前面的逐点严格距离递减条件更弱。

> [!note] 定义 1.2 完备度量空间
> 度量空间 $(X,d)$ 中的序列 $\{x_n\}$ 称为基本列或 Cauchy 列, 如果对任意 $\varepsilon>0$, 存在 $N$, 使得当 $m,n\geq N$ 时,
> $$
> d(x_m,x_n)<\varepsilon.
> $$
> 若 $X$ 中每个基本列都收敛于 $X$ 中的某个点, 则称 $(X,d)$ 完备。
^definition-complete

> [!note] 定义 1.3 不变闭集
> 设 $M\subseteq X$. 如果 $T(M)\subseteq M$, 则称 $M$ 是 $T$ 的不变集。若 $M$ 在 $X$ 中闭且 $(X,d)$ 完备, 则 $M$ 以限制度量也是完备的。
^definition-invariant

最后一句来自 [[泛函分析/01_度量空间及其完备化/04_闭子空间与完备性判别|闭子空间的完备性判别]]，它使得 Banach 定理可以直接应用于完备空间中的闭球。

## 2. 压缩映象的连续性

> [!note] 命题 2.1 压缩映象连续
> 若 $T:(X,d)\to(X,d)$ 满足
> $$
> d(Tx,Ty)\leq qd(x,y),\qquad 0\leq q<1,
> $$
> 则 $T$ 一致连续, 因而连续。
^proposition-contraction-continuous

证明. 给定 $\varepsilon>0$, 取 $\delta=\varepsilon$。当 $d(x,y)<\delta$ 时,
$$
d(Tx,Ty)\leq qd(x,y)\leq d(x,y)<\varepsilon.
$$
所以 $T$ 一致连续。更直接地, 若 $x_n\to x$, 则
$$
d(Tx_n,Tx)\leq qd(x_n,x)\longrightarrow0,
$$
从而 $Tx_n\to Tx$. $\square$

这一步在不动点定理的最后用于把迭代极限送入映象：如果 $x_n\to x^*$, 那么 $Tx_n\to Tx^*$；另一方面 $Tx_n=x_{n+1}$ 也收敛到同一个 $x^*$。

## 3. Banach 不动点定理

> [!note] 定理 3.1 Banach 不动点定理
> 设 $(X,d)$ 是非空完备度量空间, $T:X\to X$ 是压缩映象，即存在 $q\in[0,1)$ 使
> $$
> d(Tx,Ty)\leq qd(x,y)
> \qquad(x,y\in X).
> $$
> 则:
>
> 1. $T$ 在 $X$ 中存在唯一不动点 $x^*$；
> 2. 对任意初值 $x_0\in X$, 由
>    $$
>    x_{n+1}=Tx_n,\qquad n=0,1,2,\ldots
>    $$
>    构造的 Picard 迭代都是基本列, 且收敛于 $x^*$。
^theorem-banach-fixed-point

证明采用“先构造迭代，再说明它是基本列，随后利用完备性取极限，最后验证不动点”的顺序。

先处理 $q=0$：$T$ 是常值映象，记其值为 $a\in X$，则 $T(a)=a$，且任意迭代从第一步起恒等于 $a$。唯一性也立即成立。下面证明 $0<q<1$ 的情形，避免在第零步使用未约定的 $0^0$。

### 第一步：先构造迭代序列

任取 $x_0\in X$, 定义
$$
x_{n+1}=Tx_n,\qquad n=0,1,2,\ldots.
$$
这是一个已经构造出的 $X$ 中点列。下面估计相邻两项的距离。

### 第二步：说明相邻距离按几何级数衰减

当 $n\geq1$ 时, 由压缩性,
$$
d(x_{n+1},x_n)
=d(Tx_n,Tx_{n-1})
\leq qd(x_n,x_{n-1}).
$$
而 $n=0$ 时有
$$
d(x_1,x_0)=q^0d(x_1,x_0).
$$
从 $n=1$ 开始反复使用压缩性, 得到
$$
d(x_{n+1},x_n)\leq q^n d(x_1,x_0),
\qquad n=0,1,2,\ldots.
$$
更具体地, 若对某个 $n\geq0$ 成立, 则
$$
d(x_{n+2},x_{n+1})
\leq qd(x_{n+1},x_n)
\leq q^{n+1}d(x_1,x_0),
$$
所以归纳成立。

### 第三步：说明该点列是基本列

取 $m>n$. 由三角不等式,
$$
\begin{aligned}
d(x_m,x_n)
&\leq\sum_{k=n}^{m-1}d(x_{k+1},x_k)\\
&\leq\sum_{k=n}^{m-1}q^k d(x_1,x_0)\\
&\leq\frac{q^n}{1-q}d(x_1,x_0).
\end{aligned}
$$
给定 $\varepsilon>0$, 因为 $q^n\to0$, 可取 $N$ 使
$$
\frac{q^N}{1-q}d(x_1,x_0)<\varepsilon.
$$
当 $m>n\geq N$ 时,
$$
d(x_m,x_n)\leq\frac{q^n}{1-q}d(x_1,x_0)
\leq\frac{q^N}{1-q}d(x_1,x_0)<\varepsilon.
$$
交换 $m,n$ 的次序即可覆盖所有 $m,n\geq N$ 的情形。因此 $\{x_n\}$ 是 $X$ 中的基本列。

### 第四步：利用完备性构造极限

因为 $X$ 完备, 存在 $x^*\in X$ 使
$$
x_n\longrightarrow x^*.
$$
注意这里正是完备性发挥作用的地方：基本列的极限仍然属于 $X$。

### 第五步：证明极限是不动点

由命题 2.1, $T$ 连续。因此
$$
Tx^*=\lim_{n\to\infty}Tx_n
=\lim_{n\to\infty}x_{n+1}
=x^*.
$$
所以 $x^*$ 是 $T$ 的不动点。

也可以完全用距离估计完成最后一步:
$$
d(Tx^*,x^*)
\leq d(Tx^*,Tx_n)+d(x_{n+1},x^*)
\leq qd(x^*,x_n)+d(x_{n+1},x^*)
\longrightarrow0.
$$
因此 $Tx^*=x^*$。

### 第六步：证明不动点唯一

若 $u,v$ 都是不动点, 则
$$
d(u,v)=d(Tu,Tv)\leq qd(u,v).
$$
于是
$$
(1-q)d(u,v)\leq0.
$$
因为 $1-q>0$, 只能有 $d(u,v)=0$, 从而 $u=v$。因此不动点唯一。$\square$

## 4. 误差估计

Banach 定理不仅说明迭代收敛, 还给出可以直接使用的定量估计。

以下级数推导先按 $0<q<1$ 进行。若 $q=0$，则 $x_n=x^*=x_1$（$n\geq1$），所有后验估计可直接验证；先验估计在第零步写成 $d(x_0,x^*)=d(x_0,x_1)$，不使用 $0^0$。

> [!note] 命题 4.1 先验误差估计
> 在定理 3.1 的条件下, 对 Picard 迭代 $x_{n+1}=Tx_n$, 有
> $$
> d(x_n,x^*)\leq\frac{q^n}{1-q}d(x_1,x_0).
> $$
> 其中 $q>0$ 时允许 $n=0$；$q=0$ 时这条公式用于 $n\geq1$，第零步如上单独说明。
^proposition-apriori-error

证明. 令 $m\to\infty$ 于第三步的估计
$$
d(x_m,x_n)\leq\frac{q^n}{1-q}d(x_1,x_0)
$$
中。由于 $x_m\to x^*$, 且距离函数连续, 得
$$
d(x_n,x^*)\leq\frac{q^n}{1-q}d(x_1,x_0).
$$
$\square$

> [!note] 命题 4.2 后验误差估计
> 对 $n\geq0$, 有
> $$
> d(x_n,x^*)\leq\frac{1}{1-q}d(x_{n+1},x_n).
> $$
> 对 $n\geq1$, 还可写成
> $$
> d(x_n,x^*)\leq\frac{q}{1-q}d(x_n,x_{n-1}).
> $$
^proposition-aposteriori-error

证明. 由三角不等式和相邻项估计,
$$
\begin{aligned}
d(x_n,x^*)
&\leq\sum_{k=n}^{\infty}d(x_{k+1},x_k)\\
&\leq\sum_{k=n}^{\infty}q^{k-n}d(x_{n+1},x_n)\\
&=\frac{1}{1-q}d(x_{n+1},x_n).
\end{aligned}
$$
再使用
$$
d(x_{n+1},x_n)\leq qd(x_n,x_{n-1})
$$
即可得到第二个估计。$\square$

第一种估计只需要初始步长 $d(x_1,x_0)$ 和压缩常数, 第二种估计只需要当前已经计算出的相邻两次迭代距离，因此在数值计算中常使用后验误差估计作为停止准则。

## 5. 完备闭子集上的版本

> [!note] 推论 5.1 闭不变集上的 Banach 定理
> 设 $(X,d)$ 完备, $M\subseteq X$ 非空且闭, $T:M\to M$ 满足
> $$
> d(Tx,Ty)\leq qd(x,y),\qquad 0\leq q<1.
> $$
> 则 $T$ 在 $M$ 中有唯一不动点, 且任意 $x_0\in M$ 生成的迭代收敛于该不动点。
^corollary-closed-invariant

证明. $M$ 以限制度量是完备空间, 直接对 $(M,d|_{M\times M})$ 应用定理 3.1。$\square$

特别地, 若能找到闭球 $\overline B(x_0,r)$ 满足
$$
T\bigl(\overline B(x_0,r)\bigr)\subseteq\overline B(x_0,r),
$$
就可以在这个闭球上使用 Banach 定理。隐函数定理的证明正是先构造这样的局部不变闭球, 再对参数固定后的映象应用本定理，详见 [[02_压缩映射证明隐函数定理|压缩映射证明隐函数定理]]。

## 6. 迭代映象

> [!note] 命题 6.1 压缩映象的幂
> 若 $T$ 的压缩常数为 $q$, 则对任意 $n\in\mathbb N$,
> $$
> d(T^nx,T^ny)\leq q^n d(x,y).
> $$
> 因而 $T^n$ 也是压缩映象, 压缩常数可以取为 $q^n$。
^proposition-iterates

证明. 对 $n$ 作归纳。$n=1$ 时是定义。若结论对 $n$ 成立, 则
$$
\begin{aligned}
d(T^{n+1}x,T^{n+1}y)
&=d\bigl(T(T^nx),T(T^ny)\bigr)\\
&\leq qd(T^nx,T^ny)\\
&\leq q^{n+1}d(x,y).
\end{aligned}
$$
所以结论成立。$\square$

逆命题不一定成立。取三点离散度量空间
$$
X=\{0,1,2\},\qquad
d(i,j)=
\begin{cases}
0,&i=j,\\
1,&i\neq j,
\end{cases}
$$
并定义
$$
T(0)=0,\qquad T(1)=0,\qquad T(2)=1.
$$
则 $T^2$ 为常值映象, 所以 $T^2$ 是压缩映象；但 $T(1)=0\neq1=T(2)$, 因而
$$
d(T1,T2)=1=d(1,2),
$$
不存在 $q<1$ 使 $d(Tx,Ty)\leq qd(x,y)$ 对所有 $x,y$ 成立。因此 $T$ 本身不是压缩映象。

## 7. 与习题的连接

- [[泛函分析讲义上册习题册#1.1.3|习题 1.1.3]] 只使用严格距离递减证明不动点唯一性；存在性并不是该题的结论。
- [[泛函分析讲义上册习题册#1.1.4|习题 1.1.4]] 是命题 2.1 的直接形式。
- [[泛函分析讲义上册习题册#1.1.5|习题 1.1.5]] 对应命题 6.1 及其逆命题反例。

## 相关链接

- [[00_专题总览|压缩映象原理专题总览]]
- [[02_压缩映射证明隐函数定理|压缩映射证明隐函数定理]]
- [[03_压缩映射的应用与反例|压缩映射的应用与反例]]
- [[04_微分方程与参数不动点|微分方程与参数不动点]]
- [[泛函分析/01_度量空间及其完备化/03_Cauchy序列与完备性|Cauchy 序列与完备性]]
- [[泛函分析讲义上册习题册|《泛函分析（上册）》习题册]]
