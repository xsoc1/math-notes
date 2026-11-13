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

## 3.1 Cauchy 序列（基本列）

在求解微分方程、积分方程或极值问题时，我们通常只能通过迭代或逼近构造出一个近似解序列 $\{x_n\}$，而待求的真解 $x$ 恰恰是未知的。因此，我们无法直接使用 $\rho(x_n,x)\to 0$ 来验证序列是否收敛，而必须寻找一种**不依赖于极限点 $x$、仅通过序列自身内部项与项之间的距离**来判断收敛趋势的内在准则。这便是 Cauchy 序列的核心动机。

> [!note] 定义 3.1 Cauchy 序列
> 设 $(\mathcal X,\rho)$ 是度量空间，$\{x_n\}\subseteq\mathcal X$。若对任意给定的 $\varepsilon>0$，存在 $N\in\mathbb N$，使得当 $m,n\geq N$ 时恒有
> $$
> \rho(x_m,x_n)<\varepsilon,
> $$
> 则称 $\{x_n\}$ 是 $\mathcal X$ 中的 **Cauchy 序列**（在原书语境中也称为**基本序列**或**基本列**）。
^definition-3-1

Cauchy 序列刻画了序列后项彼此之间无限靠近的“内部稳定性”。下面的命题表明，收敛序列必定具有这种内部稳定性：

> [!note] 命题 3.1 收敛序列必为 Cauchy 序列
> 在任意度量空间 $(\mathcal X,\rho)$ 中，若序列 $x_n\to x$，则 $\{x_n\}$ 必是 Cauchy 序列。
^proposition-3-1

**证明：** 对任意给定的 $\varepsilon>0$，由于 $x_n\to x$，存在 $N\in\mathbb N$ 使得当 $n\geq N$ 时
$$
\rho(x_n,x)<\frac{\varepsilon}{2}.
$$
于是，当 $m,n\geq N$ 时，由三角不等式可得
$$
\rho(x_m,x_n)
\leq\rho(x_m,x)+\rho(x,x_n)
<\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon.
$$
因此 $\{x_n\}$ 是 Cauchy 序列。$\square$

需要注意的是，命题 3.1 的逆命题在一般度量空间中未必成立。例如，在赋予通常绝对值距离的有理数空间 $\mathbb Q$ 中，取逼近无理数 $\sqrt2$ 的有理数序列 $\{x_n\}$，它在距离意义下满足 Cauchy 条件，但由于 $\sqrt2\notin\mathbb Q$，该序列在 $\mathbb Q$ 中没有极限。这种现象反映了空间内部存在“孔洞”。

## 3.2 完备度量空间与子列判别法

为了排除上述“序列内部已趋于稳定、但在空间中找不到极限点”的缺陷，我们引入完备性的概念：

> [!note] 定义 3.2 完备度量空间
> 若度量空间 $(\mathcal X,\rho)$ 中的每一个 Cauchy 序列都在该空间中收敛（即极限点仍属于 $\mathcal X$），则称 $(\mathcal X,\rho)$ 是**完备度量空间**。
^definition-3-2

完备性保证了“内部凝聚”与“外部收敛”的等价性，使我们无需事先知道极限的具体表达式，即可通过验证 Cauchy 条件来确立极限的存在性。

在判断一个 Cauchy 序列是否收敛时，一个极其实用的工具是：只要它有一个子列找到了极限，整个序列就会被 Cauchy 条件“拉向”同一个极限点。

> [!note] 定理 3.1 Cauchy 序列的收敛子列判别（习题 1.2.2）
> 设 $\{x_n\}$ 是度量空间 $(\mathcal X,\rho)$ 中的 Cauchy 序列，则下列两条陈述等价：
>
> 1. 序列 $\{x_n\}$ 在 $\mathcal X$ 中收敛；
> 2. 序列 $\{x_n\}$ 含有在 $\mathcal X$ 中收敛的子列 $\{x_{n_j}\}$。
^theorem-3-1

**证明：** 若 $\{x_n\}$ 收敛，则它的任意子列均收敛于同一极限，故 $1\Longrightarrow 2$ 显然成立。

反之，设 $\{x_n\}$ 是 Cauchy 序列，且存在子列 $x_{n_j}\to x\in\mathcal X$。对任意给定的 $\varepsilon>0$，由 $\{x_n\}$ 的 Cauchy 性，存在 $N_1\in\mathbb N$，使得
$$
m,n\geq N_1
\Longrightarrow
\rho(x_m,x_n)<\frac{\varepsilon}{2}.
$$
又由 $x_{n_j}\to x$，可选取充分大的指标 $j$，使得 $n_j\geq N_1$ 且同时满足
$$
\rho(x_{n_j},x)<\frac{\varepsilon}{2}.
$$
于是，对任意 $n\geq N_1$，由三角不等式即得
$$
\rho(x_n,x)
\leq\rho(x_n,x_{n_j})+\rho(x_{n_j},x)
<\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon.
$$
这证明了整个序列 $x_n\to x$。$\square$

这一判别法在泛函分析中应用极广：在证明诸如 $L^p$ 空间或商空间的完备性时，面对一般的 Cauchy 序列往往难以直接取极限，此时只需从中抽取一个“收敛速度足够快”（如相邻项距离不超过 $2^{-k}$）的子列构造出极限，便可借助定理 3.1 立即推出原 Cauchy 序列整体收敛。

## 3.3 由近似 Cauchy 序列逼近推出收敛

在对空间作稠密逼近或完备化证明时，常会遇到这样一种情形：目标序列 $\{x_n\}$ 本身可以通过任意精度下的 Cauchy 序列来一致逼近。下面的命题说明，这种可被 Cauchy 序列任意逼近的性质同样足以保证序列自身是 Cauchy 序列。

> [!note] 命题 3.2 近似基本序列判别法（习题 1.2.5）
> 设 $(\mathcal X,\rho)$ 是完备度量空间，$\{x_n\}\subseteq\mathcal X$。若对每一个 $\varepsilon>0$，都存在一个 Cauchy 序列 $\{y_n\}\subseteq\mathcal X$，使得
> $$
> \rho(x_n,y_n)<\varepsilon
> \qquad(\forall n\in\mathbb N),
> $$
> 则序列 $\{x_n\}$ 在 $\mathcal X$ 中收敛。
^proposition-3-2

**证明：** 根据 $\mathcal X$ 的完备性，只需证明 $\{x_n\}$ 是 Cauchy 序列。对任意给定的 $\delta>0$，令 $\varepsilon=\delta/4$，按假设选取对应的 Cauchy 序列 $\{y_n\}\subseteq\mathcal X$，使得
$$
\rho(x_n,y_n)<\frac{\delta}{4}
\qquad(\forall n\in\mathbb N).
$$
由于 $\{y_n\}$ 是 Cauchy 序列，存在 $N\in\mathbb N$，使得当 $m,n\geq N$ 时
$$
\rho(y_m,y_n)<\frac{\delta}{2}.
$$
于是，当 $m,n\geq N$ 时，连续应用三角不等式（“三折估计”）可得
$$
\rho(x_m,x_n)
\leq\rho(x_m,y_m)+\rho(y_m,y_n)+\rho(y_n,x_n)
<\frac{\delta}{4}+\frac{\delta}{2}+\frac{\delta}{4}
=\delta.
$$
这表明 $\{x_n\}$ 是 $\mathcal X$ 中的 Cauchy 序列。由完备性即知 $\{x_n\}$ 在 $\mathcal X$ 中收敛。$\square$

## 3.4 等价度量与完备性的保持及反例

完备性究竟取决于空间的拓扑结构，还是取决于具体的度量公式？我们在 [[01_度量空间基本概念#1.4 等价度量|第 01 篇 1.4 节]] 中已经看到，若同一集合 $X$ 上的两个度量 $d_1,d_2$ 满足**双向度量控制（Lipschitz 等价 / 强等价）**：存在常数 $c,C>0$ 使得
$$
c\,d_1(x,y)\leq d_2(x,y)\leq C\,d_1(x,y)\qquad(\forall x,y\in X),
$$
（或者更一般地，若 $d_1$ 与 $d_2$ **一致等价**，即恒等映射 $\operatorname{id}:(X,d_1)\leftrightarrow(X,d_2)$ 双向一致连续，参见 [HKUST 度量空间讲义 p. 10](https://www.math.hkust.edu.hk/~makyli/4061/4061_141204.pdf#page=10)），则对任意序列 $\{x_n\}\subseteq X$，当 $m,n\to\infty$ 时必有 $d_1(x_m,x_n)\to 0\iff d_2(x_m,x_n)\to 0$ 且 $d_1(x_n,x)\to 0\iff d_2(x_n,x)\to 0$。因此，**Lipschitz 等价（双向度量控制）与一致等价均完全保持 Cauchy 序列与空间的完备性**。

然而，若两个度量仅仅是**拓扑等价**（即诱导相同的开集与收敛序列，等价于恒等映射 $\operatorname{id}:(X,d_1)\to(X,d_2)$ 是拓扑同胚），而缺乏全局一致的双向常数控制，则 Cauchy 序列与完备性**未必保持**！

> [!example] 反例：同底集上拓扑等价但不完备的压缩度量
> 在实数集 $X=\mathbb R$ 上，记通常绝对值度量为 $d_0(x,y)=|x-y|$，并利用同胚映射 $\phi:\mathbb R\to(-1,1),\ \phi(x)=\frac{x}{1+|x|}$ 引入新度量：
> $$
> d(x,y)=\left|\frac{x}{1+|x|}-\frac{y}{1+|y|}\right|.
> $$
> 则 $d$ 与通常度量 $d_0$ 在 $\mathbb R$ 上**拓扑等价**（诱导完全相同的收敛序列与开集），$(\mathbb R,d_0)$ 完备，但 $(\mathbb R,d)$ **不完备**！

**证明与分析：**
1. **拓扑等价性：** 由于 $\phi(x)=\frac{x}{1+|x|}$ 是从 $(\mathbb R,d_0)$ 到开区间 $(-1,1)$ 的严格递增连续双射，且其逆映射 $\phi^{-1}(u)=\frac{u}{1-|u|}$ 在 $(-1,1)$ 上亦连续，故对任意实数列 $\{x_n\}\subseteq\mathbb R$ 与 $x\in\mathbb R$，有
   $$
   d(x_n,x)=|\phi(x_n)-\phi(x)|\to 0\Longleftrightarrow \phi(x_n)\to\phi(x)\Longleftrightarrow x_n\to x\quad(\text{按 }d_0).
   $$
   这说明 $d$ 与 $d_0$ 诱导相同的序列收敛与拓扑开集。
2. **完备性失效：** 在 $\mathbb R$ 中考察正整数序列 $x_n=n$（$n\in\mathbb N$）。计算它在度量 $d$ 下两项之间的距离：当 $m,n\to\infty$ 时，由于 $\frac{n}{1+n}=1-\frac{1}{n+1}\to 1$，有
   $$
   d(x_m,x_n)=\left|\frac{m}{1+m}-\frac{n}{1+n}\right|=\left|\frac{1}{n+1}-\frac{1}{m+1}\right|\longrightarrow 0\quad(m,n\to\infty).
   $$
   因此，$\{x_n=n\}$ 是度量空间 $(\mathbb R,d)$ 中的 **Cauchy 序列**！
   然而，该序列在 $(\mathbb R,d)$ 中**不收敛**：倘若存在某个实数 $x^*\in\mathbb R$ 使得 $d(x_n,x^*)\to 0$，则由第 1 步已证的拓扑等价性，必有在通常距离下 $|n-x^*|\to 0$（或直接令 $n\to\infty$ 得 $1=\lim_{n\to\infty}\frac{n}{1+n}=\frac{x^*}{1+|x^*|}<1$），矛盾！

这一典型算例深刻地说明：**完备性是纯粹的度量性质，而非拓扑不变性质**；压缩映射 $\phi(x)=\frac{x}{1+|x|}$ 将无穷远处的无界发散序列 $x_n=n$ 压缩成了奔向边界“缺失点 $1\notin(-1,1)$”的 Cauchy 序列（参见汪林《泛函分析中的反例》1.13 与 1.31）。
