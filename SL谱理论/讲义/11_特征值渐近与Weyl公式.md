---
title: 特征值渐近与 Weyl 公式
date: '2026-09-22'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- Weyl 公式
- 特征值渐近
- 特征值计数
stage_type: lecture
status: audited
prerequisites:
- '[[08_特征值的变分刻画与单调性]]'
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\09_asymptotics.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
lecture_chapter: 9
---

# 第 9 章 特征值渐近与 Weyl 公式
> [!info] 阅读位置
> 本页对应新版第 9 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
证明正则 SL 问题的 Weyl 渐近公式,给出计数函数 $N(\lambda)$ 与第 $n$ 个特征值 $\lambda_n$ 的主项,并推出相邻特征值比值趋于 $1$.

> [!question] 基本问题
第 $n$ 个特征值大约是多少?低于给定频率 $\sqrt{\lambda}$ 的模态有多少个?

> [!note] 注. 物理动机:圆膜振动与听音辨鼓

圆膜(鼓面)的自由振动由 Helmholtz 方程 $-\Delta u=\lambda u$ 描述, $\lambda$ 是振动频率的平方;一维的对应模型是加权弦方程 $-(py')'+qy=\lambda ry$. 圆膜的径向方程化为 Bessel 方程,其本征值由 Bessel 函数的零点给出; 本讲处理的一般正则 SL 问题中,计数函数 $N(\lambda)$ 数的是 \"低于频率 $\sqrt{\lambda}$ 的模式个数\". Weyl 公式说明这个数目由几何量 $\int_a^b\sqrt{r/p}\,dx$ 主导, 与势 $q$ 及边界条件的具体类型无关:鼓越大,弦越重,低频模式越多. Kac 的\"听音辨鼓\"问题则问频率谱能否唯一决定鼓的形状.

## 设定与 Liouville 标准形

### 正则性假设

> [!note] 定义. 正则渐近假设 (A)

设 $-\infty<a<b<+\infty$,$p\in C^2[a,b]$,$q\in C[a,b]$, $r\in C^2[a,b]$,且

$$
p(x)>0,\qquad r(x)>0,\qquad x\in[a,b].
$$

 边界条件取分离型自伴形式

$$
y(a)\cos\alpha-(py')(a)\sin\alpha=0,\qquad
        y(b)\cos\beta-(py')(b)\sin\beta=0,
$$

 其中 $\alpha,\beta\in[0,\pi)$.

由第 7 章,在假设 (A) 下问题的特征值都是实数,单重,构成严格递增序列 $\lambda_0<\lambda_1<\cdots$ 且 $\lambda_n\to+\infty$,相应的特征函数系在 $L^2_r(a,b)$ 中完备.本讲要回答的是这些特征值的分布:$\lambda_n$ 按什么速度 增长?低于给定水平的特征值有多少个?

### Liouville 标准形与 Liouville 长度

沿用第 2 章的 Liouville 变换,令

$$
s=s(x)=\int_a^x\sqrt{\frac{r(t)}{p(t)}}\,dt,\qquad
    c=s(b)=\int_a^b\sqrt{\frac{r(t)}{p(t)}}\,dx,
    \qquad
    z(s)=F(s)\,y(x(s)),
$$

 其中

$$
F(s)=\bigl(p(x(s))\,r(x(s))\bigr)^{1/4}.
$$

 由第 2 章\"Liouville 变换的显式公式\",

$$
z''(s)+\bigl[\lambda+Q(s)\bigr]z(s)=0,
    \qquad
    Q(s)=-\frac{q(x(s))}{r(x(s))}-\frac{F''(s)}{F(s)}.
$$

 在假设 (A) 下 $p,r\in C^2[a,b]$ 且由 (9.1) 为正, 故 $s=s(x)$ 是 $[a,b]\to[0,c]$ 的足够光滑的微分同胚,$x=x(s)$ 光滑, $F\in C^2[0,c]$ 且 $F>0$.于是 $Q\in C[0,c]$,从而存在有限常数

$$
m=\min_{[0,c]}Q,\qquad M=\max_{[0,c]}Q,
    \qquad m\le Q(s)\le M,\quad s\in[0,c].
$$



> [!note] 注. 归一化变量

全书采用 $s\in[0,c]$. 若另令 $t=s/c\in[0,1]$, $w(t)=z(ct)$, 则方程变为 $w''+[c^2\lambda+c^2Q(ct)]w=0$. 谱参数和势必须同时缩放.

> [!note] 引理. 边界条件的变换

Liouville 变换把假设 (A) 中的分离型自伴边界条件 (9.2) 化为

$$
z(0)\cos\alpha'-z'(0)\sin\alpha'=0,\qquad
        z(c)\cos\beta'-z'(c)\sin\beta'=0,
$$

 其中 $\alpha',\beta'\in[0,\pi)$ 只依赖于 $\alpha,\beta$ 与 $p,r$ 在端点的值及一阶导数, 与 $\lambda$ 无关.

**证明.**

由第 2 章的变换公式 $py'=Fz'-F'z$.在 $x=a$(即 $s=0$)处,

$$
y(a)=\frac{z(0)}{F(0)},\qquad
        (py')(a)=F(0)z'(0)-F'(0)z(0),
$$

 即

$$
\begin{pmatrix}y(a)\\[1mm](py')(a)\end{pmatrix}
        =
        \begin{pmatrix}1/F(0)&0\\[1mm]-F'(0)&F(0)\end{pmatrix}
        \begin{pmatrix}z(0)\\[1mm]z'(0)\end{pmatrix}.
$$

 右端矩阵是实非奇异矩阵(行列式为 $1$). 边界关系 $y(a)\cos\alpha-(py')(a)\sin\alpha=0$ 是 $(y(a),(py')(a))$ 上的非平凡实线性形式;代入上述矩阵后, 得到 $(z(0),z'(0))$ 上的非平凡实线性形式 $Az(0)+Bz'(0)=0$, $(A,B)\neq(0,0)$.

写 $z(0)=\rho\sin\theta(0)$,$z'(0)=\rho\cos\theta(0)$,$\rho>0$. 条件变成 $A\sin\theta(0)+B\cos\theta(0)=0$.令 $R=\sqrt{A^2+B^2}>0$,必要时同时把 $A,B$ 变号, 再取 $\alpha'\in[0,\pi)$ 使得 $\cos\alpha'=A/R$,$\sin\alpha'=-B/R$,则条件等价于 $\sin(\theta(0)-\alpha')=0$,即

$$
\theta(0)=\alpha'+k\pi,\qquad k\in\mathbb Z .
$$

 取连续分支 $\theta(0,\lambda)=\alpha'$ 即得 (9.7) 的第一式.右端点 $x=b$($s=c$)同理,得到 $\beta'$. 由于上述线性形式只由原边界角及端点的 $F,F'$ 决定, $\alpha',\beta'$ 与 $\lambda$ 无关. $\square$

## Prüfer 相位与相位比较

### 相位方程与左端初值

设 $z$ 是 (9.5) 的非零实解,按第 2 章的 Prüfer 变换写

$$
z(s)=\rho(s)\sin\theta(s),\qquad z'(s)=\rho(s)\cos\theta(s),\qquad \rho(s)>0 .
$$

 由第 2 章\"Prüfer 变换\"命题,

$$
\theta'(s)=\cos^2\theta(s)+\bigl[\lambda+Q(s)\bigr]\sin^2\theta(s),
$$

 并由引理\"边界条件的变换\",左端边界条件等价于固定初值

$$
\theta(0,\lambda)=\alpha' .
$$

 因此 (9.12) 与 (9.13) 唯一确定相位 $\theta(\cdot,\lambda)$,而特征值问题被翻译为:求 $\lambda$,使 $\theta(c,\lambda)\equiv\beta'\pmod\pi$.

### 常势相位的显式解

> [!note] 引理. 常势相位的显式解

设 $Q\equiv q_0$ 为常数,$\lambda+q_0>0$,记 $\kappa=\sqrt{\lambda+q_0}$.取 $\varphi(\cdot,\lambda)$ 为关系 $\tan\varphi=\kappa\tan\theta$ 的连续分支,使 $|\varphi(0,\lambda)-\alpha'|<\pi/2$.则

$$
\varphi'(s)=\kappa,\qquad
        \varphi(s,\lambda)=\varphi(0,\lambda)+\kappa s,
        \qquad s\in[0,c],
$$

 并且对一切 $s\in[0,c]$,

$$
\bigl|\theta(s,\lambda)-\kappa s\bigr|\le C_0:=|\alpha'|+\pi .
$$



**证明.**

对 $\tan\varphi=\kappa\tan\theta$ 关于 $s$ 求导:

$$
\sec^2\varphi\,\varphi'=\kappa\,\sec^2\theta\,\theta' .
$$

 由 $\sec^2\varphi=1+\tan^2\varphi=1+\kappa^2\tan^2\theta$,并用 (9.12)(此时 $Q\equiv q_0=\kappa^2-\lambda$),

$$
\theta'=\cos^2\theta+\kappa^2\sin^2\theta
        =\frac{1+\kappa^2\tan^2\theta}{\sec^2\theta},
$$

 代入得

$$
\varphi'=\kappa\,\frac{\sec^2\theta}{1+\kappa^2\tan^2\theta}\cdot
        \frac{1+\kappa^2\tan^2\theta}{\sec^2\theta}=\kappa .
$$

 积分即得 (9.14) 的第二式.

再估计相位与 $\kappa s$ 之差.设 $G$ 是 $\tan G(t)=\kappa\tan t$ 在 $G(0)=0$ 处的连续分支.由 $\tan$ 的 $\pi$-周期性, $G(t+\pi)=G(t)+\pi$; 又 $G$ 把 $[0,\pi/2]$ 与 $[\pi/2,\pi]$ 分别单调映到自身, 故 $|G(t)-t|\le\pi/2$ 对一切实数 $t$ 成立.于是

$$
\bigl|\varphi(s)-\theta(s)\bigr|
        =\bigl|G(\theta(s))-\theta(s)\bigr|\le\frac\pi2 .
$$

 另一方面 (9.14) 给出 $\varphi(s)-\kappa s=\varphi(0,\lambda)$,而 $|\varphi(0,\lambda)-\alpha'|<\pi/2$ 蕴含 $|\varphi(0,\lambda)|\le|\alpha'|+\pi/2$.因此

$$
\bigl|\theta(s)-\kappa s\bigr|
        \le\bigl|\theta(s)-\varphi(s)\bigr|+\bigl|\varphi(0,\lambda)\bigr|
        \le\frac\pi2+\Bigl(|\alpha'|+\frac\pi2\Bigr)=|\alpha'|+\pi,
$$

 即 (9.15). $\square$

### 相位比较

> [!note] 引理. 相位比较

设 $Q_1,Q_2\in C[0,c]$,$Q_1\le Q_2$.设 $\theta_j$ 是

$$
\theta_j'=\cos^2\theta_j+(\lambda+Q_j)\sin^2\theta_j,\qquad
        \theta_j(0)=\alpha',\qquad j=1,2
$$

 在 $[0,c]$ 上的解.则对一切 $s\in[0,c]$,

$$
\theta_1(s)\le\theta_2(s).
$$



**证明.**

对 $\tau\in[0,1]$ 令 $Q_\tau=Q_1+\tau(Q_2-Q_1)$,$\theta(s,\tau)$ 为 把 (9.21) 中的 $Q_j$ 换成 $Q_\tau$ 后相应初值问题的解. 右端关于 $(\theta,\tau)$ 连续可微,故由解对参数的光滑依赖定理 (证法是对差商用 Gronwall 不等式),$w=\partial_\tau\theta$ 存在且满足 线性方程

$$
w'=a(s)w+b(s),\qquad w(0)=0,
$$

 其中

$$
a(s)=\bigl[\lambda+Q_\tau(s)-1\bigr]\sin\bigl(2\theta(s,\tau)\bigr),
        \qquad
        b(s)=(Q_2-Q_1)(s)\,\sin^2\theta(s,\tau)\ge0 .
$$

 这里用到 $\partial_\theta\bigl[\cos^2\theta+(\lambda+Q)\sin^2\theta\bigr]
    =(\lambda+Q-1)\sin(2\theta)$.解 (9.23) 得

$$
w(s)=\int_0^s\exp\Bigl(\int_t^s a(u)\,du\Bigr)b(t)\,dt\ge0,
        \qquad s\in[0,c],
$$

 因为被积函数非负.于是 $\theta(s,\tau)$ 关于 $\tau$ 单调不减, 特别地 $\theta(s,1)=\theta_2(s)\ge\theta(s,0)=\theta_1(s)$, 即 (9.22). $\square$

> [!note] 注. 与 Zettl 的比较

引理\"相位比较\"即 Zettl, *Sturm--Liouville Theory*, Ch. 4 §4.5 的相位比较定理.本讲给出的证明把两个势用参数 $\tau$ 连接, 对 $\tau$ 求导得到带非负源项的线性方程,是该定理的标准证明.

### 相位的一致估计

对常数势 $Q\equiv m$,一般势 $Q$ 与常数势 $Q\equiv M$,分别记相位为 $\theta_m,\theta,\theta_M$.由 (9.6) 与引理\"相位比较\",

$$
\theta_m(s,\lambda)\le\theta(s,\lambda)\le\theta_M(s,\lambda),
    \qquad s\in[0,c].
$$

 取 $s=c$,再用 (9.15) 得:只要 $\lambda+m>0$,

$$
\sqrt{\lambda+m}\,c-C_0\le\theta(c,\lambda)\le\sqrt{\lambda+M}\,c+C_0 .
$$

 取 $\lambda_*=\max\{1,1-m,1-M\}$,则 $\lambda\ge\lambda_*$ 时 $\lambda+m\ge1$,$\lambda+M\ge1$,于是对任意 $q_0\in\{m,M\}$,

$$
\bigl|\sqrt{\lambda+q_0}-\sqrt\lambda\bigr|
    =\frac{|q_0|}{\sqrt{\lambda+q_0}+\sqrt\lambda}\le|q_0| .
$$

 因此存在只依赖于 $m,M,c$ 与 $\alpha'$ 的常数

$$
C_1:=C_0+c\,\max\{|m|,|M|\},
    \qquad
    \bigl|\theta(c,\lambda)-c\sqrt\lambda\bigr|\le C_1,
    \qquad \lambda\ge\lambda_* .
$$

 (9.29) 是本讲的核心估计:相位的主要项恰好是 $c\sqrt\lambda$,误差关于 $\lambda$ 一致有界.

## 计数函数与相位的对应

> [!note] 定义. 计数函数

对正则 SL 问题定义计数函数

$$
N(\lambda)=\#\{n:\ \lambda_n\le\lambda\},\qquad \lambda\in\mathbb R .
$$

 本讲按 $\lambda_0<\lambda_1<\cdots$ 编号 (本章局部约定); 若改按 $\lambda_1<\lambda_2<\cdots$ 编号,则 $O(1)$ 中的常数相应改变, 渐近主项不变.

> [!note] 命题. 计数函数与右端相位的对应

在假设 (A) 下,存在常数 $C_2$,使得对一切充分大的 $\lambda$,

$$
\Bigl|\,N(\lambda)-\frac{\theta(c,\lambda)-\beta'}{\pi}\,\Bigr|\le C_2 .
$$



**证明.**

由引理\"边界条件的变换\",右端边界条件等价于 $\sin(\theta(c,\lambda)-\beta')=0$,即

$$
\theta(c,\lambda)=\beta'+k\pi,\qquad k\in\mathbb Z .
$$

 由第 2 章\"相位单调性\"定理,对固定的 $s\in(0,c]$, $\theta(s,\lambda)$ 关于 $\lambda$ 连续且严格递增;特别地 $\lambda\mapsto\theta(c,\lambda)$ 连续且严格递增. 又由 (9.27) 的左半式,$\theta(c,\lambda)\to+\infty$ ($\lambda\to+\infty$).

故存在整数 $k_0$,使得对每个整数 $k\ge k_0$,方程 (9.32) 恰有一个解 $\lambda^{(k)}$,并且 $k\mapsto\lambda^{(k)}$ 严格递增 (因为 $\theta(c,\cdot)$ 严格递增).由 (9.32), 所有不小于 $\lambda^{(k_0)}$ 的特征值正是这些 $\lambda^{(k)}$; 低于 $\lambda^{(k_0)}$ 的特征值只有有限多个,记为 $m_0$ 个. 于是对 $\lambda\ge\lambda^{(k_0)}$,

$$
N(\lambda)
        =m_0+\#\{k\ge k_0:\ \beta'+k\pi\le\theta(c,\lambda)\}
        =\frac{\theta(c,\lambda)-\beta'}{\pi}+O(1),
$$

 其中 $O(1)$ 只依赖于 $k_0,m_0,\beta'$,不依赖于 $\lambda$. 取 $C_2$ 为该 $O(1)$ 的一个上界即得 (9.31). $\square$

## Weyl 渐近公式

### 计数函数形式

> [!note] 定理. Weyl 渐近(计数函数形式)

在假设 (A) 下,

$$
N(\lambda)=\frac{c}{\pi}\sqrt{\lambda}+O(1)
        \qquad(\lambda\to+\infty),
$$

 特别地

$$
N(\lambda)\sim\frac{1}{\pi}\sqrt{\lambda}
        \int_a^b\sqrt{\frac{r(x)}{p(x)}}\,dx .
$$



**证明.**

由 (9.29),$\theta(c,\lambda)=c\sqrt\lambda+O(1)$. 代入 (9.31) 得 $N(\lambda)=\dfrac{c}{\pi}\sqrt\lambda+O(1)$,即 (9.34). 再由 (9.3) 中 $c$ 的定义即得 (9.35). $\square$

> [!note] 注. Liouville 长度

$c=\int_a^b\sqrt{r/p}\,dx$ 称为该 SL 问题的 Liouville 长度 (在弦振动中即\"等效弦长\"). (9.34) 说明计数函数的首项只由 $c$ 决定, 与势 $q$ 及边界条件的具体类型无关.这与第 7 章热方程讨论中 \"模态密度由几何量决定\"的结论一致.

### 特征值形式

> [!note] 定理. Weyl 渐近(特征值形式)

在假设 (A) 下,

$$
\lambda_n=\Bigl(\frac{n\pi}{c}\Bigr)^2\bigl(1+o(1)\bigr)
        =\frac{n^2\pi^2}{\bigl(\int_a^b\sqrt{r/p}\,dx\bigr)^2}\bigl(1+o(1)\bigr),
        \qquad n\to\infty .
$$

 更精确地,若 $N(\lambda)=A\sqrt{\lambda}+O(1)$,则

$$
\lambda_n=\Bigl(\frac{n}{A}\Bigr)^2+O(n),
        \qquad A=\frac{c}{\pi} .
$$



**证明.**

由第 7 章的谱排列结论,特征值单重且严格递增,故计数函数满足

$$
N(\lambda_n)=n+1,\qquad n=0,1,2,\dots
$$

 (若按 $\lambda_1<\lambda_2<\cdots$ 编号,则 $N(\lambda_n)=n$, 下面结论不变).由 (9.34),

$$
n+1=A\sqrt{\lambda_n}+O(1),\qquad A=\frac c\pi,
$$

 故 $\sqrt{\lambda_n}=\dfrac nA+O(1)=\dfrac{n\pi}{c}+O(1)$.平方得

$$
\lambda_n=\Bigl(\frac{n\pi}{c}\Bigr)^2+O(n)
        =\Bigl(\frac nA\Bigr)^2+O(n),
$$

 这同时给出 (9.37) 与 (9.36). $\square$

> [!note] 推论. 两种形式的等价

设 $\lambda_0\le\lambda_1\le\cdots$ 是严格递增且趋于无穷大的正数列, $A>0$. 则

$$
N(\lambda)\sim A\sqrt\lambda\quad(\lambda\to+\infty)
        \qquad\Longleftrightarrow\qquad
        \lambda_n\sim\Bigl(\frac nA\Bigr)^2\quad(n\to\infty).
$$



**证明.**

\"$\Rightarrow$\":与定理\"Weyl 渐近(特征值形式)\"的证明相同, 由 $N(\lambda_n)=n+1$ 得 $n+1\sim A\sqrt{\lambda_n}$,故 $\sqrt{\lambda_n}\sim n/A$.

\"$\Leftarrow$\":设 $\lambda_n\sim(n/A)^2$.对 $\lambda\in[\lambda_n,\lambda_{n+1})$ 有 $N(\lambda)=n+1$,并且 $\sqrt{\lambda_n}\sim n/A$,$\sqrt{\lambda_{n+1}}\sim(n+1)/A$. 于是

$$
\frac{n+1}{\sqrt{\lambda_{n+1}}}
        \le\frac{N(\lambda)}{\sqrt\lambda}
        =\frac{n+1}{\sqrt\lambda}
        \le\frac{n+1}{\sqrt{\lambda_n}},
$$

 两端当 $n\to\infty$ 时都趋于 $A$,故 $N(\lambda)\sim A\sqrt\lambda$, 即 (9.41) 的右到左. $\square$

### 常系数对照

> [!example] 例. 常系数问题

取 $p\equiv p_0>0$,$r\equiv r_0>0$,$q\equiv q_0$,$[a,b]=[0,L]$. 则 Liouville 长度为

$$
c=\int_0^L\sqrt{\frac{r_0}{p_0}}\,dx=L\sqrt{\frac{r_0}{p_0}} .
$$

 方程化为 $-y''=\dfrac{\lambda r_0-q_0}{p_0}y$. Dirichlet 问题 $y(0)=y(L)=0$ 的特征值为

$$
\lambda_n=\frac{q_0}{r_0}+\frac{p_0}{r_0}
        \Bigl(\frac{(n+1)\pi}{L}\Bigr)^2,\qquad n=0,1,2,\dots;
$$

 Neumann 问题 $y'(0)=y'(L)=0$ 的特征值为

$$
\lambda_n=\frac{q_0}{r_0}+\frac{p_0}{r_0}
        \Bigl(\frac{n\pi}{L}\Bigr)^2,\qquad n=0,1,2,\dots .
$$

 两者的主项都是

$$
\frac{p_0}{r_0}\frac{n^2\pi^2}{L^2}=\Bigl(\frac{n\pi}{c}\Bigr)^2,
$$

 与定理一致. Dirichlet 从零编号产生线性项 $2n\pi^2p_0/(r_0L^2)$, 势 $q_0/r_0$ 只贡献常数项.

> [!example] 例. $p=r=1$,$q=0$ 的两种边界条件

取 $[0,L]$,$p=r=1$,$q=0$.则 $c=L$,Weyl 公式给出 $N(\lambda)\sim L\sqrt\lambda/\pi$. Dirichlet 与 Neumann 的特征值分别是 $\bigl((n+1)\pi/L\bigr)^2$ 与 $\bigl(n\pi/L\bigr)^2$($n=0,1,2,\dots$),两者都满足 $\lambda_n\sim(n\pi/L)^2$.差别只在最小的一个:Neumann 有 $\lambda_0=0$(常数函数),Dirichlet 有 $\lambda_0=(\pi/L)^2$. 这一差别只影响 $N(\lambda)$ 的 $O(1)$ 项.

## Dirichlet 与 Neumann 的比较

### 计数级别的比较

> [!note] 推论. Dirichlet 与 Neumann 的计数比较

设 $p,q,r$ 满足假设 (A) 中的正则性条件,$N_D$ 与 $N_N$ 分别是 Dirichlet 问题与 Neumann 问题的计数函数.则

$$
N_D(\lambda)=\frac c\pi\sqrt\lambda+O(1),\qquad
        N_N(\lambda)=\frac c\pi\sqrt\lambda+O(1),
$$

 从而

$$
N_D(\lambda)-N_N(\lambda)=O(1).
$$



**证明.**

Dirichlet 与 Neumann 边界条件都是分离型自伴边界条件,故两个问题都满足 假设 (A).两者的 Liouville 变换相同,因此 Liouville 长度 $c$ 与 势的上下界 $m,M$ 相同,只有左右端点的角度 $\alpha',\beta'$ 不同. 定理\"Weyl 渐近(计数函数形式)\"的证明只用到 (9.29) 与 (9.31),而其中的常数 $C_1,C_2$ 只通过 $\alpha',\beta',m,M,c$ 依赖于具体问题, 对两个问题分别有限.故 (9.47) 对两者分别成立, 相减即得 (9.48). $\square$

> [!note] 注. 由型域余维得到的比较

统一从 $n=0$ 编号. 由第 8 章极小极大原理以及 $H_0^1(a,b)\subset H^1(a,b)$ 的余维为 $2$, 有

$$
\lambda_n^N\le\lambda_n^D\le\lambda_{n+2}^N.
$$

 第二个不等式的证明是: 任意 $(n+3)$ 维 Neumann 试探空间与 $H_0^1$ 的交至少有 $n+1$ 维. 对该交取 Rayleigh 商最大值, 再取下确界. 一般势下不能把 $n+2$ 无条件改成 $n+1$.

### Neumann 的零特征值与一般分离边界

若进一步 $p=r=1$,$q=0$ 并取 Neumann 边界条件,则常数函数是特征函数, 对应 $\lambda_0=0$,于是 $N_N(\lambda)$ 在 $\lambda=0$ 处比 Dirichlet 多计一项.这个差别包含在 (9.48) 的 $O(1)$ 中,不影响主项. 在相位证明中,Neumann 左端对应的初值为 $\theta(0,\lambda)=\pi/2$, 而估计 (9.15) 对任意固定的 $\alpha'\in[0,\pi)$ 都成立, 故结论不变.

更一般地,任意分离型自伴边界条件只改变 (9.27) 中的常数 $C_0$ 与 (9.31) 中的偏移 $\beta'$,不改变 $c\sqrt\lambda$ 这一主项.因此 Weyl 主项与边界条件的类型无关.

## 相邻特征值的比值

> [!note] 定理. 比值极限与下确界

在假设 (A) 下,存在 $n_0$ 使 $\lambda_n>0$ 对一切 $n\ge n_0$ 成立, 并且

$$
\lim_{n\to\infty}\frac{\lambda_{n+1}}{\lambda_n}=1 .
$$

 因此

$$
\inf_{n\ge n_0}\frac{\lambda_{n+1}}{\lambda_n}=1,
$$

 并且该下确界不被取到:对一切 $n\ge n_0$ 有 $\lambda_{n+1}/\lambda_n>1$.

**证明.**

由 (9.36),$\lambda_n>0$ 对充分大的 $n$ 成立. 由 (9.37),$\lambda_n=(n/A)^2+O(n)$,而 $O(n)/(n/A)^2=O(1/n)$,故

$$
\frac{\lambda_{n+1}}{\lambda_n}
        =\Bigl(\frac{n+1}{n}\Bigr)^2
        \frac{1+O(1/n)}{1+O(1/n)}
        \longrightarrow1,
$$

 即 (9.49).

另一方面,由第 7 章的谱排列结论,特征值单重且严格递增, 故 $\lambda_{n+1}>\lambda_n$,从而 $\lambda_{n+1}/\lambda_n>1$ 对一切 $n\ge n_0$ 成立. 于是比值序列恒大于 $1$ 而以 $1$ 为极限,故其下确界等于 $1$ 且不被取到,即 (9.50). $\square$

> [!note] 注. 量词不同的问题

本章固定一个问题后令 $n\to\infty$. 若再对密度 $\rho$ 取极值, 就增加了另一个量词. 例如在固定区间取两端 Dirichlet 条件, 考察 $-y''=\lambda\rho y$ 的正盒约束密度类, 若包含常密度, 则所有比值严格大于 $1$, 而取常密度并令 $n\to\infty$ 已足以证明对 $(n,\rho)$ 同时取下确界为 $1$. 这既不要求对密度的一致 Weyl 余项, 也没有解决固定 $n$ 时的最优密度问题.

## 弱正则与退化情形

### 有限个光滑段

> [!note] 命题. 有限分段的 Weyl 公式

设 $p,r$ 在有限个闭子区间上分别为 $C^2$ 且各自有正下界, $q$ 在各段连续. 在内接口要求 $y,py'$ 连续, 外端取实分离条件. 则 $N(\lambda)=\pi^{-1}\sqrt\lambda\int_a^b\sqrt{r/p}+O(1)$.

**证明.**

先补足分段情形的算子依据, 才能使用变分比较. 设分点为 $a=x_0<x_1<\cdots<x_m=b$, $I_j=(x_{j-1},x_j)$. 令 $W=\bigoplus_{j=1}^mH^1(I_j)$, 并在外端保留原来的 Dirichlet 值约束. 在 $W$ 上取型

$$
\mathfrak q(u,v)=\sum_j\int_{I_j}(pu'\overline{v'}+qu\overline v)\,dx
        +h_a u(a)\overline{v(a)}+h_bu(b)\overline{v(b)},
$$

 其中没有 Robin 条件的外端项省去. 令 $V\subset W$ 要求内部各段的值迹相接, 令 $V_D\subset V$ 进一步要求所有内部值迹为零. 迹连续性说明这三个空间闭合, 且它们在 $L_r^2(a,b)$ 中都稠密. 第 5 章的迹估计逐段相加, 给出共同的足够小实数 $\zeta$, 使 $\mathfrak a_\zeta=\mathfrak q-\zeta(\cdot,\cdot)_r$ 在三个空间上均为与分段 $H^1$ 范数等价的内积.

对其中任一空间 $E$, Riesz 表示给每个 $h\in L_r^2$ 唯一的 $u=B_Eh\in E$, 满足 $\mathfrak a_\zeta(u,v)=(h,v)_r$ 对所有 $v\in E$ 成立. Cauchy--Schwarz 与范数控制给 $B_E:L_r^2\to E$ 有界. 由于 $E$ 稠密, $B_E$ 单射; 互换两次测试得到 $B_E$ 自伴且正. 有限段紧嵌入保证 $B_E:L_r^2\to L_r^2$ 紧. 此外 $(\operatorname{ran}B_E)^\perp=\ker B_E=0$. 所以在稠密域 $\operatorname{ran}B_E$ 上定义 $A_E=B_E^{-1}+\zeta I$, 第 6 章的实满射点判据给出自伴性. 第 7 章紧谱定理给出本征基. 如第 8 章的型展开证明, 将本征函数除以 $\sqrt{\lambda_n-\zeta}$ 得到 $E$ 的 $\mathfrak a_\zeta$ 完备系, 从而极小极大原理在这里也成立. 这一步不预设一般闭型表示定理.

对 $E=V$, 先以每段内部紧支撑函数测试弱方程, 得 $-(pu')'+qu=rA_Vu$ 于该段. 于是 $pu'\in H^1$ 且 $u\in H^2$ 于每个闭段. 再逐段分部积分: 内接口值迹可独立任取, 故 $pu'$ 在接口连续; 外端给出指定 Robin 条件. 值迹连续已经写入 $V$. 反向对满足这些条件的分段 $H^2$ 函数分部积分, 也满足弱方程, 所以 $A_V$ 正是命题指定的传输实现. $E=W$ 则给内端独立 Neumann 条件, $E=V_D$ 给内端 Dirichlet 条件. 外端 Robin 项始终保留.

由 $V_D\subset V\subset W$ 的型域包含及极小极大原理, 有 $N_{V_D}(\lambda)\le N_V(\lambda)\le N_W(\lambda)$. 这些包含的余维有限, 也给出只依赖分点数的计数偏差. 两个解耦问题的计数函数都是各段计数函数之和; 每段满足本章光滑假设, 主项为该段 Liouville 长度乘 $\sqrt\lambda/\pi$, 余项为 $O(1)$. 有限求和并夹逼, 得到所需 Weyl 公式. $\square$

### 一般系数与奇异端点的阅读边界

一般可积系数的 Weyl 定理需要另外的论证. 本章不从逐项系数逼近直接推出 高频渐近, 因为那样必须控制逼近误差与谱指标同时变化. 奇异端点也不能只凭 $p$ 或 $r$ 在某点的取值分类: 应考察可积性条件和 最大算子域. 第 17 章说明如何从这一模型进入一般理论.

> [!note] 注. 下一章的问题

至此已经知道特征值的增长及 $L^2$ 展开. 第 10 章追问: 若要连同导数一起逼近, Fourier 系数需要多快衰减?

## 习题

##### 习题 9.1

**[主线]** 证明常势相位引理:若 $Q\equiv q_0$,$\lambda+q_0>0$,且 $\tan\varphi=\sqrt{\lambda+q_0}\tan\theta$,则 $\varphi'=\sqrt{\lambda+q_0}$,并由此证明 (9.15).

##### 习题 9.2

**[主线]** 证明等价关系:对 $A>0$,$N(\lambda)\sim A\sqrt\lambda$ 当且仅当 $\lambda_n\sim(n/A)^2$.

##### 习题 9.3

**[基础]** 取 $p=1$,$r=(1+x)^2$,$q=0$,$[a,b]=[0,1]$,Dirichlet 边界条件. 计算 Liouville 长度 $c$ 与 $\lambda_n$ 的 Weyl 主项.

##### 习题 9.4

**[主线]** 在假设 (A) 下证明 $\lambda_{n+1}/\lambda_n\to1$, 并说明 Neumann 问题 $\lambda_0=0$ 时下确界应如何定义.

##### 习题 9.5

**[拓展]** 设 $p=1$,$q=0$,$r=\rho$ 为至多有限个跳的逐段常数函数, $0<a\le\rho\le A$. 在 $[0,L]$ 上取两端 Dirichlet 条件, 并令 $\varphi(0)=0$. 对 $\lambda>0$, 用缩放 Prüfer 相角 $y=R\sin\varphi$,$y'=\sqrt{\lambda\rho}\,R\cos\varphi$ 证明 $N(\lambda)=\frac{\sqrt\lambda}{\pi}\int_0^L\sqrt\rho\,dx+O(1)$.

##### 习题 9.6

**[拓展]** 证明 Dirichlet 与 Neumann 计数函数之差有界,即 (9.48);并用型域余维证明 $\lambda_n^N\le\lambda_n^D\le\lambda_{n+2}^N$ (从零编号).

本节习题解答见本页末的习题解答.

##### 习题提示.

\(1\) 对 $\tan\varphi=\kappa\tan\theta$ 求导,用 $\sec^2\varphi=1+\kappa^2\tan^2\theta$ 与相位方程化简; 再用 $|\varphi(0,\lambda)-\alpha'|<\pi/2$ 控制初值. (2) 由 $N(\lambda_n)=n+1$ 双向夹逼,见推论\"两种形式的等价\". (3) $c=\int_0^1(1+x)\,dx=3/2$. (4) 由 $\lambda_n=(n/A)^2+O(n)$ 展开比值;严格递增保证比值 $>1$. (5) 每个常数段内 $\varphi'=\sqrt{\lambda\rho}$,跳点处 $|\Delta\varphi|<\pi$,求和后主项为 $\sqrt\lambda\int\sqrt\rho$. (6) 对两个问题分别用定理\"Weyl 渐近(计数函数形式)\"后相减. $\square$

## 本章小结

Weyl 公式把特征值渐近归结为 Liouville 长度 $c=\int_a^b\sqrt{r/p}\,dx$:$N(\lambda)\sim\frac c\pi\sqrt\lambda$, $\lambda_n\sim(n\pi/c)^2$,因而 $\lambda_{n+1}/\lambda_n\to1$, 从全部特征值已为正的指标 $n_0$ 起取比值, 下确界为 $1$ 且不被取到. 主项与势 $q$ 及边界条件类型无关, 边界条件只改变 $O(1)$ 或 $O(n)$ 的余项;分段光滑系数下结论仍成立, 奇异端点需要后续奇异理论.

## 标准参考与延伸阅读

- A. Zettl, *Sturm--Liouville Theory*, AMS, 2005, Ch. 4 §4.3:一般 $L^1$ 系数下的 $\lambda_n/n^2\to c$ 渐近.

- A. Zettl, Ch. 4 §4.5:相位方程的比较定理与 Prüfer 定理链.

- A. Zettl, Ch. 4 §4.6:分离边界条件下的特征值与结点计数.

- A. Zettl, Ch. 4 §4.8:Dirichlet 与其它自伴边界条件的特征值比较.

- A. Zettl, Ch. 3 §3.7:有限谱的例子(与本讲渐近形成对照).

- A. Zettl, Ch. 7,Ch. 10:奇异端点分类,极限圆/极限点与奇异自伴扩张.

- 项目文档 `SL_inf_ratio_proof.pdf`:相邻特征值比值下确界的项目结果.

## 习题解答

#### 习题 9.1 的解答.

**[主线]** 记 $\kappa=\sqrt{\lambda+q_0}$.由 $\tan\varphi=\kappa\tan\theta$ 求导得

$$
\sec^2\varphi\,\varphi'=\kappa\sec^2\theta\,\theta'.
$$

 又 $\sec^2\varphi=1+\kappa^2\tan^2\theta$,且由相位方程

$$
\theta'=\cos^2\theta+\kappa^2\sin^2\theta
=\frac{1+\kappa^2\tan^2\theta}{\sec^2\theta},
$$

 故

$$
\varphi'=\kappa\,\frac{\sec^2\theta}{1+\kappa^2\tan^2\theta}\cdot
\frac{1+\kappa^2\tan^2\theta}{\sec^2\theta}=\kappa .
$$

 积分得 $\varphi(s)=\varphi(0)+\kappa s$. 由 $|\varphi-\theta|\le\pi/2$ 及 $|\varphi(0)-\alpha'|<\pi/2$ 得 $|\varphi(0)|\le|\alpha'|+\pi/2$,于是

$$
|\theta(s)-\kappa s|
\le|\theta(s)-\varphi(s)|+|\varphi(0)|
\le\frac\pi2+\Bigl(|\alpha'|+\frac\pi2\Bigr)=|\alpha'|+\pi .
$$



#### 习题 9.2 的解答.

**[主线]** 设 $N(\lambda_n)=n+1$. 若 $N(\lambda)\sim A\sqrt\lambda$,则 $n+1\sim A\sqrt{\lambda_n}$,故

$$
\sqrt{\lambda_n}\sim\frac nA,\qquad \lambda_n\sim\Bigl(\frac nA\Bigr)^2 .
$$

 反之设 $\lambda_n\sim(n/A)^2$.对 $\lambda\in[\lambda_n,\lambda_{n+1})$ 有 $N(\lambda)=n+1$,且 $\sqrt{\lambda_n}\sim n/A$, $\sqrt{\lambda_{n+1}}\sim(n+1)/A$,于是

$$
\frac{n+1}{\sqrt{\lambda_{n+1}}}
\le\frac{N(\lambda)}{\sqrt\lambda}
\le\frac{n+1}{\sqrt{\lambda_n}},
$$

 两端都趋于 $A$,故 $N(\lambda)/\sqrt\lambda\to A$.

#### 习题 9.3 的解答.

**[基础]**

$$
c=\int_0^1\sqrt{\frac{(1+x)^2}{1}}\,dx=\int_0^1(1+x)\,dx=\frac32 .
$$

 因此

$$
N(\lambda)\sim\frac{3}{2\pi}\sqrt\lambda,\qquad
\lambda_n\sim\Bigl(\frac{2n\pi}{3}\Bigr)^2 .
$$



#### 习题 9.4 的解答.

**[主线]** 由 $\lambda_n=(n/A)^2+O(n)$,

$$
\frac{\lambda_{n+1}}{\lambda_n}
=\Bigl(\frac{n+1}{n}\Bigr)^2\frac{1+O(1/n)}{1+O(1/n)}\to1 .
$$

 又特征值严格递增,在 $\lambda_n>0$ 的范围内比值恒大于 $1$,下确界为 $1$ 且不被取到. Neumann 问题 $\lambda_0=0$ 时 $\lambda_1/\lambda_0$ 无定义, 下确界应改为对一切满足 $\lambda_n>0$ 的 $n$ 取(例如 $n\ge1$), 这不影响结论.

#### 习题 9.5 的解答.

**[拓展]** 在每个 $\rho$ 为常数的子区间上, 由 9.1 的推导得 $\varphi'=\sqrt{\lambda\rho}$. 在跳点处 $y,y'$ 连续. 缩放只是把向量 $(y',y)$ 的一个分量乘以正数, 取保持所在象限的相位分支, 跳变满足 $|\Delta\varphi|<\pi/2<\pi$. 在坐标轴上按两侧极限选同一象限的端值. 这个统一界与 $\lambda$ 无关. 初相 $\varphi(0)=0$, 若共有 $m$ 个跳点, 则

$$
\varphi(L)=\sqrt\lambda\sum_i\sqrt{\rho_i}\,(x_i-x_{i-1})+O(1)
=\sqrt\lambda\int_0^L\sqrt{\rho}\,dx+O(1),
$$

 其中 $O(1)$ 的一个界是 $m\pi$. 为说明精确计数, 取未缩放的连续相位 $\theta(0,\lambda)=0$. 其方程为 $\theta'=\cos^2\theta+\lambda\rho\sin^2\theta$; 逐段参数微分再连贯积分, 与第 2 章相同的正源变分公式给出 $\partial_\lambda\theta(L,\lambda)>0$. 在 $\lambda=0$ 时解为 $y=x$, 因而 $\theta(L,0)=\arctan L\in(0,\pi/2)$. 两端 Dirichlet 的能量式排除非正特征值, 所以随着 $\lambda>0$ 增加, 所跨过的本征相位恰为 $\pi,2\pi,\ldots$. 正缩放保持象限, 故 $\varphi(L,\lambda)$ 与 $\theta(L,\lambda)$ 位于同一个长度为 $\pi$ 的相位格, 并在其中一个为整数倍 $\pi$ 时同时到达该格端点. 因而

$$
N(\lambda)=\Bigl\lfloor\frac{\varphi(L)}{\pi}\Bigr\rfloor
=\frac{\sqrt\lambda}{\pi}\int_0^L\sqrt\rho\,dx+O(1).
$$



#### 习题 9.6 的解答.

**[拓展]** 对两种边界分别用 Weyl 计数式后相减, 得到 $N_D-N_N=O(1)$. 型域包含给出 $\lambda_n^N\le\lambda_n^D$. 若 $E$ 是前 $n+3$ 个 Neumann 特征函数的张成空间, 则 $\dim(E\cap H_0^1)\ge n+1$, 且其 Rayleigh 商至多为 $\lambda_{n+2}^N$. 对 Dirichlet 问题用极小极大原理即得右侧不等式.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[08_特征值的变分刻画与单调性|上一章]]
- [[12_从L2展开到能量空间|下一章]]
