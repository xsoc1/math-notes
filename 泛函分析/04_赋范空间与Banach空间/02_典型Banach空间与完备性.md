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

在证明一个具体序列空间或函数空间是完备的 Banach 空间时，不能止步于“逐点或逐坐标存在极限”，而必须严格完成三个步骤：**第一，利用范数控制单点或单坐标，构造出候选极限元素 $x$；第二，证明向量列 $\{x^{(m)}\}$ 在所给定的整体范数下收敛于 $x$；第三，证明候选极限 $x$ 确实属于所讨论的空间。**

## 1. 有界序列空间 $\ell^\infty$ 与零极限序列空间 $c_0$

设 $\ell^\infty$ 为全体有界标量序列 $x=(x_j)_{j=1}^\infty$ 构成的空间，$c_0\subseteq\ell^\infty$ 为收敛于零的序列构成的子空间，二者均赋予上确界范数 $\|x\|_\infty=\sup_{j\geq 1}|x_j|$。

**完备性证明：** 设 $\{x^{(m)}\}_{m=1}^\infty$ 是 $\ell^\infty$ 中的 Cauchy 序列。
1. **逐坐标取极限：** 对每个固定的坐标指标 $j\in\mathbb N$，由
   $$
   |x_j^{(m)}-x_j^{(n)}|\leq\|x^{(m)}-x^{(n)}\|_\infty
   $$
   可知标量列 $\{x_j^{(m)}\}_{m=1}^\infty$ 是完备标量域 $\mathbb K$ 中的 Cauchy 序列。记其极限为 $x_j=\lim_{m\to\infty}x_j^{(m)}$，从而构造出候选序列 $x=(x_j)_{j=1}^\infty$。
2. **验证范数收敛与有界性：** 对任意给定的 $\varepsilon>0$，由 $\{x^{(m)}\}$ 的 Cauchy 性，存在 $M\in\mathbb N$，使得当 $m,n\geq M$ 时对一切 $j\in\mathbb N$ 都有 $|x_j^{(m)}-x_j^{(n)}|\leq\|x^{(m)}-x^{(n)}\|_\infty<\varepsilon/2$。固定 $m\geq M$ 与坐标 $j$，令 $n\to\infty$，得
   $$
   |x_j^{(m)}-x_j|\leq\frac{\varepsilon}{2}\qquad(\forall m\geq M,\ \forall j\in\mathbb N).
   $$
   这说明 $x-x^{(m)}\in\ell^\infty$，进而 $x=x^{(m)}+(x-x^{(m)})\in\ell^\infty$，且当 $m\geq M$ 时 $\|x^{(m)}-x\|_\infty\leq\varepsilon/2<\varepsilon$。故 $\ell^\infty$ 是 Banach 空间。
3. **$c_0$ 的完备性：** 若 $\{x^{(m)}\}\subseteq c_0$，则固定上述 $m=M$ 后，由 $x^{(M)}\in c_0$ 知存在指标 $J\in\mathbb N$，使得当 $j\geq J$ 时 $|x_j^{(M)}|<\varepsilon/2$。于是当 $j\geq J$ 时有
   $$
   |x_j|\leq |x_j-x_j^{(M)}|+|x_j^{(M)}|<\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon,
   $$
   即 $\lim_{j\to\infty}x_j=0$，故 $x\in c_0$（这同时表明 $c_0$ 是 $\ell^\infty$ 的闭子空间）。因此 $c_0$ 也是 Banach 空间。$\square$

## 2. $p$-次可和序列空间 $\ell^p\ (1\leq p<\infty)$

设 $1\leq p<\infty$，空间 $\ell^p=\bigl\{x=(x_j)_{j=1}^\infty:\sum_{j=1}^\infty|x_j|^p<\infty\bigr\}$ 赋予范数 $\|x\|_p=\bigl(\sum_{j=1}^\infty|x_j|^p\bigr)^{1/p}$。

**完备性证明（有限截断取极限法）：** 设 $\{x^{(m)}\}_{m=1}^\infty$ 是 $\ell^p$ 中的 Cauchy 序列。
1. 同上节一样，由 $|x_j^{(m)}-x_j^{(n)}|\leq\|x^{(m)}-x^{(n)}\|_p$ 知每个坐标列 $\{x_j^{(m)}\}_m$ 均收敛，记 $x_j=\lim_{m\to\infty}x_j^{(m)}$，令 $x=(x_j)_{j=1}^\infty$。
2. 对任意给定的 $\varepsilon>0$，选取 $M\in\mathbb N$ 使得当 $m,n\geq M$ 时 $\|x^{(m)}-x^{(n)}\|_p<\varepsilon$。为避免在未证明一致收敛时直接交换无穷级数 $\sum_{j=1}^\infty$ 与极限 $\lim_{n\to\infty}$，我们先对**任意有限项和**（固定 $N\in\mathbb N$）进行估计：当 $m,n\geq M$ 时，有
   $$
   \sum_{j=1}^N|x_j^{(m)}-x_j^{(n)}|^p\leq\|x^{(m)}-x^{(n)}\|_p^p<\varepsilon^p.
   $$
   在上面这个**仅有有限个加项**的不等式中固定 $m\geq M$ 与 $N$，令 $n\to\infty$，由有限和与极限的可交换性得
   $$
   \sum_{j=1}^N|x_j^{(m)}-x_j|^p\leq\varepsilon^p\qquad(\forall N\in\mathbb N).
   $$
3. 现在再令截断阶数 $N\to\infty$，由非负项级数的单调有界性即得无穷级数收敛：
   $$
   \|x^{(m)}-x\|_p^p=\sum_{j=1}^\infty|x_j^{(m)}-x_j|^p\leq\varepsilon^p\qquad(\forall m\geq M).
   $$
   这同时证明了两件事：第一，差向量 $x-x^{(M)}\in\ell^p$，从而由 Minkowski 不等式知 $x=x^{(M)}+(x-x^{(M)})\in\ell^p$；第二，当 $m\geq M$ 时 $\|x^{(m)}-x\|_p\leq\varepsilon$，即 $x^{(m)}\to x$ 于 $\ell^p$。故 $\ell^p$ 是 Banach 空间。$\square$

## 3. 绝对可和级数判别法与 $L^p$ 空间的完备性（Riesz-Fischer 定理）

在 Lebesgue 可积函数空间 $L^p(\Omega,\mu)$（$1\leq p<\infty$）中，由于 $L^p$ 收敛并不直接蕴含逐点收敛，我们无法像在序列空间中那样“逐点取极限”。此时，最優雅的途径是先将赋范空间的完备性转化为**绝对可和向量级数的收敛性**，再从 $L^p$ 基本列中抽取一个快速收敛子列转化为级数处理。

> [!note] 定理 3.1 完备性的绝对可和级数判别准则（习题 1.4.7）
> 赋范线性空间 $(X,\|\cdot\|)$ 是完备的 Banach 空间，当且仅当 $X$ 中每一个**绝对可和级数**均在 $X$ 中按范数收敛，即：
> $$
> \sum_{k=1}^\infty\|u_k\|<\infty\quad\Longrightarrow\quad \text{部分和序列 }s_N=\sum_{k=1}^N u_k\text{ 在 }X\text{ 中收敛}.
> $$

**证明：**
- **必要性：** 设 $X$ 是 Banach 空间，且 $\sum_{k=1}^\infty\|u_k\|<\infty$。对部分和 $s_N=\sum_{k=1}^N u_k$，当 $M>N$ 时由三角不等式有
  $$
  \|s_M-s_N\|=\left\|\sum_{k=N+1}^M u_k\right\|\leq\sum_{k=N+1}^M\|u_k\|\longrightarrow 0\quad(M,N\to\infty).
  $$
  故 $\{s_N\}$ 是 $X$ 中的 Cauchy 序列，由完备性知其在 $X$ 中收敛。
- **充分性：** 设 $X$ 中每个绝对可和级数均收敛。任取 $X$ 中的 Cauchy 序列 $\{x_n\}$。根据 Cauchy 定义，对每个 $k\in\mathbb N$，可归纳选取严格递增的下标子列 $n_1<n_2<\cdots<n_k<\cdots$，使得
  $$
  \|x_{n_{k+1}}-x_{n_k}\|\leq 2^{-k}\qquad(\forall k\geq 1).
  $$
  令差向量 $u_k=x_{n_{k+1}}-x_{n_k}$，则 $\sum_{k=1}^\infty\|u_k\|\leq\sum_{k=1}^\infty 2^{-k}=1<\infty$，即级数 $\sum_{k=1}^\infty u_k$ 绝对可和。按假设，存在 $x\in X$ 使得级数收敛，从而 телескопическая（裂项）部分和
  $$
  x_{n_{K}}=x_{n_1}+\sum_{k=1}^{K-1}(x_{n_{k+1}}-x_{n_k})\longrightarrow x\quad(K\to\infty).
  $$
  这说明 Cauchy 序列 $\{x_n\}$ 拥有收敛于 $x\in X$ 的子列 $\{x_{n_K}\}$；由 [[泛函分析/01_度量空间及其完备化/03_Cauchy序列与完备性#3.2 完备度量空间与子列判别法|Cauchy 序列的收敛子列判别法]]，原序列 $\{x_n\}$ 必整体收敛于 $x$。故 $X$ 是 Banach 空间。$\square$

借助这一级数视角，我们立即给出 $L^p$ 空间完备性的经典证明：

> [!note] 定理 3.2 Riesz-Fischer 定理
> 对任意测度空间 $(\Omega,\Sigma,\mu)$ 及 $1\leq p\leq\infty$，按几乎处处相等取等价类后的空间 $L^p(\Omega,\mu)$ 是 Banach 空间。

**证明：**
1. **当 $1\leq p<\infty$ 时：** 设 $\{f_n\}$ 是 $L^p$ 中的 Cauchy 序列，选出快速子列 $\{f_{n_k}\}$ 满足 $\|f_{n_{k+1}}-f_{n_k}\|_p\leq 2^{-k}$，并记 $h_k=f_{n_{k+1}}-f_{n_k}$。定义非负可测函数部分和与无穷级数：
   $$
   g_N(t)=\sum_{k=1}^N|h_k(t)|,\qquad g(t)=\sum_{k=1}^\infty|h_k(t)|.
   $$
   由 Minkowski 不等式知 $\|g_N\|_p\leq\sum_{k=1}^N\|h_k\|_p\leq\sum_{k=1}^\infty 2^{-k}=1$。再由 Lebesgue 单调收敛定理（Beppo Levi 定理），有
   $$
   \int_\Omega g(t)^p\,d\mu=\lim_{N\to\infty}\int_\Omega g_N(t)^p\,d\mu\leq 1<\infty.
   $$
   因此 $g\in L^p$，从而 $g(t)<\infty$ 在 $\Omega$ 上 $\mu$-几乎处处成立！这意味着数值级数 $f_{n_1}(t)+\sum_{k=1}^\infty h_k(t)$ 几乎处处绝对收敛。我们在该满测集上定义极限函数
   $$
   f(t)=f_{n_1}(t)+\sum_{k=1}^\infty\bigl(f_{n_{k+1}}(t)-f_{n_k}(t)\bigr)=\lim_{K\to\infty}f_{n_K}(t),
   $$
   在零测例外集上令 $f(t)=0$。由于 $|f(t)|\leq|f_{n_1}(t)|+g(t)$，故 $f\in L^p$。进一步，对每个固定的 $K\geq 1$，由 Fatou 引理可得
   $$
   \|f-f_{n_K}\|_p=\left\|\sum_{k=K}^\infty h_k\right\|_p\leq\sum_{k=K}^\infty\|h_k\|_p\leq\sum_{k=K}^\infty 2^{-k}=2^{1-K}\longrightarrow 0\quad(K\to\infty).
   $$
   故子列 $f_{n_K}\to f$ 于 $L^p$，进而整个 Cauchy 序列 $f_n\to f$ 于 $L^p$。
2. **当 $p=\infty$ 时：** 对 $L^\infty$ 中的 Cauchy 序列 $\{f_n\}$，把使得 $|f_n(t)|>\|f_n\|_\infty$ 以及 $|f_m(t)-f_n(t)|>\|f_m-f_n\|_\infty$（$m,n\in\mathbb N$）的可数多个零测集并起来记为零测集 $E$。在余集 $\Omega\setminus E$ 上，$\{f_n(t)\}$ 一致收敛于有界可测函数 $f(t)$，即得 $\|f_n-f\|_\infty\to 0$。$\square$

## 4. 连续函数空间 $C(K)$ 与高阶可微函数空间 $C^k[a,b]$

1. **紧集上的连续函数空间 $C(K,\mathbb K)$：** 在上确界范数 $\|f\|_\infty=\sup_{t\in K}|f(t)|$ 下，$C(K,\mathbb K)$ 的基本列首先在每一点处收敛于函数 $f(t)$，再由基本列条件知 $f_n\to f$ 一致收敛；最后由经典的“三项 $\varepsilon/3$ 分解”
   $$
   |f(t)-f(s)|\leq|f(t)-f_n(t)|+|f_n(t)-f_n(s)|+|f_n(s)-f(s)|
   $$
   证明一致极限 $f$ 仍连续，故 $C(K,\mathbb K)$ 是 Banach 空间。
2. **高阶连续可微函数空间 $C^k[a,b]$：** 在 $C^k[a,b]$ 上赋予包含各阶导数上确界的范数
   $$
   \|f\|_{C^k}=\sum_{j=0}^k\left\|f^{(j)}\right\|_\infty.
   $$
   设 $\{f_n\}$ 是 $\|\cdot\|_{C^k}$ 下的 Cauchy 序列，则对每个阶数 $0\leq j\leq k$，导函数列 $\{f_n^{(j)}\}$ 都是 $(C[a,b],\|\cdot\|_\infty)$ 中的 Cauchy 序列，从而各自一致收敛于某个连续函数 $g_j\in C[a,b]$。要证明 $g_0\in C^k[a,b]$ 且 $g_0^{(j)}=g_j$，需借助微积分基本定理建立各阶极限之间的联系：对任意 $0\leq j\leq k-1$ 及 $t\in[a,b]$，在积分恒等式
   $$
   f_n^{(j)}(t)-f_n^{(j)}(a)=\int_a^t f_n^{(j+1)}(s)\,ds
   $$
   两端令 $n\to\infty$，由于一致收敛允许极限与定积分交换，立即得到
   $$
   g_j(t)-g_j(a)=\int_a^t g_{j+1}(s)\,ds.
   $$
   由于 $g_{j+1}$ 连续，上式表明 $g_j$ 可微且 $g_j'=g_{j+1}$。归纳即得 $g_0\in C^k[a,b]$ 且 $g_0^{(j)}=g_j$，从而 $\|f_n-g_0\|_{C^k}\to 0$，故 $(C^k[a,b],\|\cdot\|_{C^k})$ 是 Banach 空间。

## 5. Sobolev 空间 $W^{1,p}(\Omega)$ 的完备性与稠密逼近边界

在现代偏微分方程理论中，为了让微分算子作用在一个完备的 $L^p$ 型空间上，我们在开集 $\Omega\subseteq\mathbb R^d$ 上引入由具有 $L^p$ 弱导数（分布导数）的函数构成的 **Sobolev 空间**：
$$
W^{1,p}(\Omega)=\bigl\{u\in L^p(\Omega):\partial_j u\in L^p(\Omega)\text{（在分布意义下）},\ j=1,\ldots,d\bigr\},
$$
并赋予范数 $\|u\|_{W^{1,p}}=\|u\|_p+\sum_{j=1}^d\|\partial_j u\|_p$。

**完备性验证：** 若 $\{u_n\}$ 是 $W^{1,p}(\Omega)$ 中的 Cauchy 序列，则由 $L^p(\Omega)$ 的完备性可知，存在 $u\in L^p(\Omega)$ 及 $v_1,\ldots,v_d\in L^p(\Omega)$，使得在 $L^p(\Omega)$ 中 $u_n\to u$ 且 $\partial_j u_n\to v_j$。对任意紧支撑光滑测试函数 $\varphi\in C_c^\infty(\Omega)$，在弱导数定义式
$$
\int_\Omega u_n\partial_j\varphi\,dx=-\int_\Omega(\partial_j u_n)\varphi\,dx
$$
两端令 $n\to\infty$，由 Hölder 不等式知两端极限均可直接进入积分号，从而得到 $\int_\Omega u\partial_j\varphi\,dx=-\int_\Omega v_j\varphi\,dx$。这证明了 $u$ 的弱导数恰好就是 $\partial_j u=v_j\in L^p(\Omega)$，故 $u\in W^{1,p}(\Omega)$ 且 $\|u_n-u\|_{W^{1,p}}\to 0$。

*关于光滑函数稠密性与完备化的注意（仅限 $1\leq p<\infty$）：* 当 $1\leq p<\infty$ 时，$W^{1,p}(\Omega)$ 可通过光滑函数关于 $\|\cdot\|_{W^{1,p}}$ 范数取完备化来理解（由 Meyers–Serrin 定理，$C^\infty(\Omega)\cap W^{1,p}(\Omega)$ 在 $W^{1,p}(\Omega)$ 中稠密），但涉及直到边界的光滑逼近时必须区分边界条件：紧支撑光滑函数空间 $C_c^\infty(\Omega)$ 在 $W^{1,p}(\Omega)$（$1\leq p<\infty$）中的闭包记为 $W_0^{1,p}(\Omega)$，它隐含了零迹（零边界）条件，在有界开集上严格小于整个 $W^{1,p}(\Omega)$；而若要用直到边界光滑的函数空间 $C^\infty(\overline\Omega)$（或 $C^1(\overline\Omega)$）按 $W^{1,p}(\Omega)$ 范数逼近全部 $W^{1,p}(\Omega)$，则除了要求 $1\leq p<\infty$ 外，还需要对区域 $\Omega$ 的边界提出一定的正则性条件（如 Lipschitz 边界）。特别注意上述光滑稠密性**不适用于端点 $p=\infty$**：由于 $C^1(\overline\Omega)$ 关于 $\|\cdot\|_{W^{1,\infty}}$ 的闭包仅能得到连续可微函数，像 $u(t)=|t|\in W^{1,\infty}(-1,1)$ 这样具有跳跃弱导数的 Lipschitz 函数无法在 $W^{1,\infty}$ 范数下被光滑函数逼近。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_线性结构与范数|范数公理]]
- [[04_商空间与最佳逼近|商空间完备性]]
- [[泛函分析讲义上册习题册#1.4 赋范空间与 Banach 空间|原书 1.4 节]]
- [[高等概率论/笔记/01_上册_测度论基础/09_Lebesgue空间与一致可积性#9.2 三类 Lebesgue 空间|Lebesgue空间与一致可积性]]
