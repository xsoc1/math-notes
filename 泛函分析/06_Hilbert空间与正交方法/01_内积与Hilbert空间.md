---
title: "内积与 Hilbert 空间"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-hilbert-spaces
  - theory-note
note_type: theory
source_section: "F/6；F/1 第 32 页的修正；汪林 12.4–12.5"
exercise_range: "1.6 节"
status: "已补证"
---

# 内积与 Hilbert 空间

## 1. 内积公理与 Cauchy-Schwarz 不等式

> [!note] 定义 1.1 内积空间与 Hilbert 空间
> 设 $X$ 是数域 $\mathbb K$（$\mathbb R$ 或 $\mathbb C$）上的线性空间。映射 $(\cdot,\cdot):X\times X\to\mathbb K$ 称为 $X$ 上的**内积（Inner Product）**，若对任意 $x,y,z\in X$ 及 $\lambda,\mu\in\mathbb K$ 满足：
> 1. **对第一变量线性：** $(\lambda x+\mu y,z)=\lambda(x,z)+\mu(y,z)$；
> 2. **共轭对称性（Hermite 对称性）：** $(x,y)=\overline{(y,x)}$（从而对第二变量共轭线性：$(x,\lambda y+\mu z)=\overline\lambda(x,y)+\overline\mu(x,z)$）；
> 3. **正定性：** $(x,x)\geq0$，且 $(x,x)=0\Longleftrightarrow x=0$。
>
> 配备了内积的线性空间 $(X,(\cdot,\cdot))$ 称为**内积空间**（或前 Hilbert 空间）。由内积诱导的范数定义为
> $$
> \|x\|=\sqrt{(x,x)}.
> $$
> 若内积空间 $(X,(\cdot,\cdot))$ 关于诱导范数 $\|\cdot\|$ 是完备的，则称其为 **Hilbert 空间**。

为了验证 $\|x\|=\sqrt{(x,x)}$ 确实满足范数的三角不等式，首先需要建立内积空间中最基本的不等式——**Cauchy-Schwarz 不等式**：

> [!note] 定理 1.1 Cauchy-Schwarz 不等式
> 在任意内积空间中，对任意 $x,y\in X$，恒有
> $$
> |(x,y)|\leq\|x\|\cdot\|y\|,
> $$
> 其中等号成立当且仅当 $x$ 与 $y$ 线性相关。

**证明（正交分解法）：**
若 $y=0$，两端均为 $0$，不等式及等号条件显然成立。下设 $y\neq 0$，则 $\|y\|^2=(y,y)>0$。我们将向量 $x$ 沿着 $y$ 的方向与垂直于 $y$ 的方向作正交分解：令
$$
z=x-\frac{(x,y)}{\|y\|^2}y.
$$
直接计算 $z$ 与 $y$ 的内积：
$$
(z,y)=(x,y)-\frac{(x,y)}{\|y\|^2}(y,y)=0,
$$
即 $z\perp y$。于是由 $x=\frac{(x,y)}{\|y\|^2}y+z$ 展开 $\|x\|^2=(x,x)$，利用 $(z,y)=(y,z)=0$ 可得勾股恒等式：
$$
\|x\|^2=\left\|\frac{(x,y)}{\|y\|^2}y\right\|^2+\|z\|^2=\frac{|(x,y)|^2}{\|y\|^2}+\|z\|^2.
$$
由于 $\|z\|^2\geq 0$，移项即得
$$
0\leq\|z\|^2=\|x\|^2-\frac{|(x,y)|^2}{\|y\|^2}\quad\Longrightarrow\quad |(x,y)|\leq\|x\|\cdot\|y\|.
$$
同时由上式可见，等号成立当且仅当 $\|z\|=0\iff z=0\iff x=\frac{(x,y)}{\|y\|^2}y$，即 $x$ 与 $y$ 线性相关。$\square$

由此立即导出诱导范数的**三角不等式**：对任意 $x,y\in X$，有
$$
\|x+y\|^2=(x+y,x+y)=\|x\|^2+2\operatorname{Re}(x,y)+\|y\|^2
\leq\|x\|^2+2|(x,y)|+\|y\|^2
\leq\bigl(\|x\|+\|y\|\bigr)^2,
$$
两端开方即得 $\|x+y\|\leq\|x\|+\|y\|$。

## 2. 平行四边形法则（中线公式）与极化恒等式

什么样的赋范线性空间，其范数可以由某个内积诱导出来？答案完全浓缩在初等几何中熟知的“平行四边形四边平方和等于两条对角线平方和”这一恒等式之中。

1. **平行四边形法则（中线公式）：** 在任意内积空间中，将 $\|x\pm y\|^2=\|x\|^2\pm 2\operatorname{Re}(x,y)+\|y\|^2$ 相加，交叉项恰好抵消，得到
   $$
   \|x+y\|^2+\|x-y\|^2=2\|x\|^2+2\|y\|^2\qquad(\forall x,y\in X).
   $$
2. **极化恒等式（Polarization Identity）：** 将 $\|x+y\|^2$ 与 $\|x-y\|^2$ 相减，即可完全用范数还原出内积的实部；在复空间中再结合 $iy$ 的对应项还原虚部：
   - **实内积空间：**
     $$
     (x,y)=\frac{1}{4}\bigl(\|x+y\|^2-\|x-y\|^2\bigr).
     $$
   - **复内积空间（按第一变量线性约定）：**
     $$
     (x,y)=\frac{1}{4}\Bigl(\|x+y\|^2-\|x-y\|^2+i\|x+iy\|^2-i\|x-iy\|^2\Bigr).
     $$
   极化恒等式表明：若范数由内积诱导，则该内积必由范数唯一决定。更深刻的是，著名的 **Jordan–von Neumann 定理**指出中线公式也是范数能由内积诱导的**充分条件**：

> [!note] 定理 2.1 Jordan–von Neumann 定理（中线公式的逆命题）
> 设 $(X,\|\cdot\|)$ 是实或复赋范线性空间（无需预先假设完备）。范数 $\|\cdot\|$ 由 $X$ 上的某个内积诱导，当且仅当它满足平行四边形法则：
> $$
> \|x+y\|^2+\|x-y\|^2=2\|x\|^2+2\|y\|^2\qquad(\forall x,y\in X).
> $$

**证明：** 必要性已证，下证充分性。
1. **实赋范空间情形：** 记 $Q(x)=\|x\|^2$，并按实极化公式定义二元映射
   $$
   B(x,y)=\frac{1}{4}\bigl(Q(x+y)-Q(x-y)\bigr).
   $$
   显然 $B(x,x)=\frac{1}{4}Q(2x)=Q(x)=\|x\|^2\geq 0$（正定性成立），且由 $Q(-u)=Q(u)$ 知 $B(x,y)=B(y,x)$（对称性）及 $B(-x,y)=-B(x,y)$，$B(0,y)=0$。
   核心在于证明**可加性** $B(x+z,y)=B(x,y)+B(z,y)$。为此，在 $Q$ 的定义下分别对点对 $(x+y,z)$ 与 $(x-y,z)$ 应用中线公式：
   $$
   \begin{aligned}
   Q(x+z+y)+Q(x-z+y)&=2Q(x+y)+2Q(z),\\
   Q(x+z-y)+Q(x-z-y)&=2Q(x-y)+2Q(z).
   \end{aligned}
   $$
   将上面两式相减并除以 $4$，注意到右端 $2Q(z)$ 恰好消去，整理即得关于 $B$ 的中点关系：
   $$
   B(x+z,y)+B(x-z,y)=2B(x,y).
   $$
   首先在此式中令 $z=x$，利用 $B(0,y)=0$ 得 **$B(2x,y)=2B(x,y)$**。接着在 $B(x+z,y)+B(x-z,y)=2B(x,y)$ 中将 $x$ 与 $z$ 互换，得 $B(z+x,y)+B(z-x,y)=2B(z,y)$；将这两式相加，并利用奇性 $B(x-z,y)+B(z-x,y)=0$，得
   $$
   2B(x+z,y)=2B(x,y)+2B(z,y)\quad\Longrightarrow\quad B(x+z,y)=B(x,y)+B(z,y).
   $$
   由可加性通过归纳与移项立得对一切整数 $m\in\mathbb Z$ 和正整数 $n\in\mathbb N$ 有 $B(\frac{m}{n}x,y)=\frac{m}{n}B(x,y)$，即**有理数齐次性**成立。最后，由于范数函数连续，映射 $\lambda\mapsto B(\lambda x,y)=\frac{1}{4}(\|\lambda x+y\|^2-\|\lambda x-y\|^2)$ 是关于实数 $\lambda\in\mathbb R$ 的连续函数，用有理数逼近实数取极限即得对一切 $\lambda\in\mathbb R$ 有 $B(\lambda x,y)=\lambda B(x,y)$。故 $B$ 是实内积。
2. **复赋范空间情形：** 先将复空间 $X$ 视为实赋范空间，由第 1 步得到实双线性对称正定形式 $B(x,y)=\frac{1}{4}(\|x+y\|^2-\|x-y\|^2)$。由于复范数满足 $\|ix\|=|i|\cdot\|x\|=\|x\|$，即 $Q(ix)=Q(x)$，直接代入 $B$ 的定义可见：
   $$
   B(ix,iy)=B(x,y),\qquad B(ix,y)=\frac{1}{4}\bigl(\|ix+y\|^2-\|ix-y\|^2\bigr)=\frac{1}{4}\bigl(\|x-iy\|^2-\|x+iy\|^2\bigr)=-B(x,iy).
   $$
   现在按第一变量线性的复极化恒等式定义
   $$
   (x,y)=B(x,y)+iB(x,iy)=B(x,y)-iB(ix,y).
   $$
   则 $(x,y)$ 关于第一变量显然是实线性的，且满足
   $$
   (ix,y)=B(ix,y)-iB(-x,y)=B(ix,y)+iB(x,y)=i\bigl(B(x,y)-iB(ix,y)\bigr)=i(x,y),
   $$
   故对第一变量是**复线性**的；同时利用 $B(y,x)=B(x,y)$ 与 $B(iy,x)=-B(y,ix)=-B(ix,y)$，有
   $$
   \overline{(y,x)}=B(y,x)+iB(iy,x)=B(x,y)-iB(ix,y)=(x,y),
   $$
   满足共轭对称性；最后对 $y=x$，由 $B(ix,x)=-B(x,ix)=-B(ix,x)$ 知 $B(ix,x)=0$，故 $(x,x)=B(x,x)=\|x\|^2$。因此 $(\cdot,\cdot)$ 是诱导该范数的复内积。$\square$

> [!example] 汪林 12.4：当 $p\neq 2$ 时，$\ell^p$（及 $L^p$）不是内积空间
> 在序列空间 $\ell^p$（$1\leq p\leq\infty$）中，取两个前两项非零的向量
> $$
> x=e_1+e_2=(1,1,0,\ldots),\qquad y=e_1-e_2=(1,-1,0,\ldots).
> $$
> 则 $x+y=2e_1,\ x-y=2e_2$。计算平行四边形法则的左右两端：
> - 当 $1\leq p<\infty$ 时，左端为 $\|x+y\|_p^2+\|x-y\|_p^2=2^2+2^2=8$；右端为 $2\|x\|_p^2+2\|y\|_p^2=2(2^{2/p}+2^{2/p})=4\cdot 2^{2/p}$。显然**仅当 $p=2$ 时左右两端相等**！
> - 当 $p=\infty$ 时，左端为 $8$，而右端为 $2(1^2+1^2)=4\neq 8$。
> 因此，当 $p\neq 2$ 时，$\ell^p$ 范数不满足中线公式，绝不能由任何内积诱导出来（参见汪林《泛函分析中的反例》12.4，印刷版第 238 页 / PDF 第 263 页）。

## 3. 复内积空间中的勾股定理辨析

在实内积空间中，$\|x+y\|^2=\|x\|^2+\|y\|^2$ 与 $(x,y)=0$ 完全等价。但在**复内积空间**中，由于展开式为
$$
\|x+y\|^2=\|x\|^2+2\operatorname{Re}(x,y)+\|y\|^2,
$$
单个等式 $\|x+y\|^2=\|x\|^2+\|y\|^2$ **只能推出实部为零 $\operatorname{Re}(x,y)=0$，而不能推出复内积 $(x,y)=0$**！例如在复平面 $\mathbb C$ 中取 $x=1,\ y=i$，虽然 $|1+i|^2=2=|1|^2+|i|^2$，但它们的复内积 $(1,i)=1\cdot\overline i=-i\neq 0$。在复内积空间中，要使 $(x,y)=0$（正交），当且仅当对**任意标量 $\lambda\in\mathbb C$**（或同时对 $y$ 与 $iy$）都有 $\|x+\lambda y\|^2=\|x\|^2+|\lambda|^2\|y\|^2$。

## 4. 内积的连续性与有界集上的一致连续性

由 Cauchy-Schwarz 不等式与三角不等式，对任意 $x,x',y,y'\in X$，有
$$
|(x,y)-(x',y')|=\bigl|(x-x',y)+(x',y-y')\bigr|
\leq\|x-x'\|\cdot\|y\|+\|x'\|\cdot\|y-y'\|.
$$
这一估计清晰地表明：
1. **在全空间 $X\times X$ 上点态连续：** 当 $x_n\to x$ 且 $y_n\to y$ 时，$\|x_n\|$ 有界，故 $(x_n,y_n)\to(x,y)$。
2. **在任意有界乘积集 $\overline B(0,R)\times\overline B(0,R)$ 上一致（Lipschitz）连续：** 当 $\|y\|\leq R,\ \|x'\|\leq R$ 时，$|(x,y)-(x',y')|\leq R(\|x-x'\|+\|y-y'\|)$。
3. **但在无界全空间 $X\times X$ 上并非一致连续：** 例如在 $\mathbb R$ 上取点对序列 $(x_n,y_n)=(n,0)$ 与 $(x'_n,y'_n)=(n,1/n)$，虽然两点对的距离 $|x_n-x'_n|+|y_n-y'_n|=1/n\to 0$，但它们的内积之差却恒为 $|n\cdot(1/n)-n\cdot 0|=1$。

## 5. 内积空间的完备化必为 Hilbert 空间

设 $(X,(\cdot,\cdot))$ 是不完备的内积空间。由 [[泛函分析/04_赋范空间与Banach空间/01_线性结构与范数#4. 赋范空间的完备化自动成为 Banach 空间|04 专题第 1 节]] 可知，其度量完备化 $\widehat X$ 已经是完备的 Banach 空间。为了将内积延拓到 $\widehat X$ 上，任取 $\widehat X$ 中的两个元素 $u=[x_n],\ v=[y_n]$，其中 $\{x_n\}$ 与 $\{y_n\}$ 是 $X$ 中的 Cauchy 序列。

由于**每一个 Cauchy 序列都是有界序列**（存在 $R>0$ 使得对一切 $n$ 有 $\|x_n\|\leq R,\ \|y_n\|\leq R$），将第 4 节的有界集 Lipschitz 估计应用于代表序列，可得
$$
|(x_n,y_n)-(x_m,y_m)|\leq R\bigl(\|x_n-x_m\|+\|y_n-y_m\|\bigr)\longrightarrow 0\quad(m,n\to\infty).
$$
因此标量序列 $\{(x_n,y_n)\}_{n=1}^\infty$ 在 $\mathbb K$ 中必收敛！我们定义完备化空间上的内积为
$$
([x_n],[y_n])_{\widehat X}=\lim_{n\to\infty}(x_n,y_n).
$$
同一有界性估计保证了该极限不依赖于等价类代表元的选取，且内积的三条公理及诱导范数关系 $\|[x_n]\|_{\widehat X}=\sqrt{([x_n],[x_n])_{\widehat X}}=\lim_{n\to\infty}\|x_n\|$ 均由逐项取极限直接保持（也可直接验证 $\widehat X$ 的范数继承了中线公式，再由定理 2.1 得到内积）。因此，**任何内积空间的完备化都是 Hilbert 空间**。

*典型例子与反例（汪林 12.5）：* 有限支撑序列空间 $c_{00}$ 赋予 $\ell^2$ 内积 $(x,y)=\sum_{k=1}^\infty x_k\overline{y_k}$ 时是不完备的内积空间，其完备化恰为 Hilbert 空间 $\ell^2$。更进一步，由于当 $1\leq p<2$ 时 $\ell^p\subsetneq\ell^2$ 且包含 $c_{00}$，若在集合 $\ell^p$（$1\leq p<2$）上改赋 $\ell^2$ 内积，则它虽然作为集合承载过完备的 $\|\cdot\|_p$ 范数，但在新赋予的 $\ell^2$ 内积范数下却是 $\ell^2$ 的真稠密子空间，因而是**不完备的内积空间**（参见汪林 12.5，印刷版第 238 页 / PDF 第 263 页）。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_正交展开与可分性|正交级数]]
- [[03_投影定理与最小二乘|正交投影定理]]
- [[泛函分析讲义上册习题册#1.6 Hilbert 空间|原书 1.6 节]]
