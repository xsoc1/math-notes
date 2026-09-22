---
title: 从物理问题到正则 SL 问题
date: '2026-09-22'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- 正则 SL 问题
- SL 边值问题
stage_type: lecture
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\01_physics_to_sl.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
prerequisites: []
lecture_chapter: 1
---

# 第 1 章 从物理问题到正则 SL 问题
> [!info] 阅读位置
> 本页对应新版第 1 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.

![[fig_beam.svg|520]]


> [!abstract] 本章目标
从杆的弯曲问题建立 Euler--Bernoulli 梁方程,并自然引出正则 SL 问题与分离型边界条件.

> [!question] 基本问题
为什么一个力学平衡问题会变成特征值问题?

## 引言

Sturm--Liouville 理论是常微分方程与谱理论交叉的核心内容.它起源于对 二阶线性微分方程

$$
-\frac{d}{dx}\left(p(x)\frac{dy}{dx}\right)+q(x)y=\lambda r(x)y
$$

 在区间 $[a,b]$ 上配以适当边界条件的研究.这类问题在弦振动,杆的弯曲, 热传导,量子力学以及正交多项式理论中反复出现.

本讲义的路线是:

1.  从力学问题中\"看出\"特征值问题;

2.  把变系数 SL 问题化为最简形式 $y''+[\lambda+q(x)]y=0$;

3.  用 Prüfer 变换研究特征值的存在性与振荡性质;

4.  用 Sturm 比较定理说明零点的交错;

5.  证明特征函数的正交性并写出广义 Fourier 展开.

## 从杆的弯曲问题出发

### 问题描述

考虑一根弹性杆,取 $x$ 轴沿杆的轴线.设杆在 $x=0$ 处以轴承固定, 在 $x=l$ 处以铰链固定,轴向受压力 $P$ 作用.记杆的横向位移为 $y=y(x)$, 研究其弯曲状态.这是我们最熟悉的\"压杆失稳\"模型,也是 SL 谱理论最早的 物理来源之一.

### 小挠度近似与曲率

若挠曲线为 $y=y(x)$,其曲率半径为 $\rho$,精确的曲率公式为

$$
\kappa=\frac{1}{\rho}=\frac{|y''|}{\bigl(1+(y')^2\bigr)^{3/2}}.
$$

 在小挠度近似下,曲率可写成

$$
|y''|\approx \frac{1}{\rho}=\frac{|y''|}{\bigl(1+(y')^2\bigr)^{3/2}},
$$

 其含义是:在小挠度,小斜率情形下,$|y'|\ll 1$,因此 $(1+(y')^2)^{3/2}\approx 1$,从而 $\kappa\approx |y''|$.

### Euler--Bernoulli 梁的应变,应力与弯矩

取梁的一小段,设中性层的曲率半径为 $\rho$,离中性层距离为 $y$ 的纤维 原长为 $L=\rho\,\Delta\theta$,变形后长度为 $L'=(\rho+y)\Delta\theta$. 于是该纤维的应变为

$$
\varepsilon=\frac{L'-L}{L}
    =\frac{(\rho+y)\Delta\theta-\rho\Delta\theta}{\rho\Delta\theta}
    =\frac{y}{\rho}.
$$

 由胡克定律,应力为

$$
\sigma=E\varepsilon=E\frac{y}{\rho},
$$

 其中 $E$ 是杨氏模量.

横截面上微元 $dA$ 上的力为 $dF=\sigma\,dA$,它对中性轴的弯矩为

$$
dM=y\,dF=y\sigma\,dA.
$$

 积分得到总弯矩

$$
M=\int_A y\,\sigma\,dA=\frac{E}{\rho}\int_A y^2\,dA
    =\frac{EI}{\rho},
$$

 其中

$$
I=\int_A y^2\,dA
$$

 是截面的惯性矩.这给出了材料力学中经典的

$$
M=\frac{EI}{\rho}.
$$



在小挠度近似下,$\dfrac{1}{\rho}\approx -y''$ (符号取决于曲率与弯矩的符号约定), 因此

$$
-EI\,y''=M.
$$



### 受压杆的平衡方程

对轴向受压杆,若弯矩与横向位移的关系为 $M=Py$,则平衡方程化为

$$
-EI\,y''=Py.
$$

 令

$$
k^2=\frac{P}{EI},
$$

 便得到常系数二阶方程

$$
y''+k^2 y=0.
$$

 两端固定条件为

$$
y(0)=0,\qquad y(l)=0.
$$

 这是一个经典的特征值问题:只有特定的 $P$ (或 $k$) 才能使非零解同时满足 两个边界条件.离散的特征值

$$
\lambda_n=\left(\frac{n\pi}{l}\right)^2,\qquad n=1,2,3,\dots
$$

 对应杆的失稳模态.

### 从常系数到变系数:SL 问题

实际工程中密度,张力或刚度可能随位置变化. 为统一符号, 本书始终从

$$
-(py')'+qy=\lambda ry
$$

 出发. 它也可写成 $(py')'+(\lambda r-q)y=0$. 特别地, $p=r=1$ 时为 $y''+(\lambda-q)y=0$. 第 2--3 章的标准形 $y''+(\lambda+Q)y=0$ 中, $Q$ 是变换后的势, 不能与此处的 $q$ 混用.

> [!note] 注. 物理动机:屈曲与临界载荷

压杆在压力达到某个临界值时突然侧向弯曲,称为屈曲. 简支压杆的平衡方程是 $EIy''''+Py''=0$.由简支条件 $y(0)=y(L)=0$,$y''(0)=y''(L)=0$,积分两次得 $-EIy''=Py$, 即一个以压力 $P$ 为特征值的 SL 问题. 特征值 $P_n=n^2\pi^2EI/L^2$ 就是各阶临界压力:$P<P_1$ 时只有直杆平衡; 达到 $P_1$ 时出现第一个弯曲平衡态,$P_1$ 是最小临界载荷, 对应特征函数就是失稳模态.

## 正则 Sturm--Liouville 问题

### 方程与边界条件

> [!note] 定义. 正则 SL 问题

给定 $p\in C^1[a,b]$,$p>0$,$q,r\in C[a,b]$,$r>0$,以及实数 $K,L,M,N$.正则 Sturm--Liouville 问题是求 $\lambda\in\mathbb{C}$ 与非零函数 $y\in C^2[a,b]$,使得

$$
-\bigl(p(x)y'(x)\bigr)'+q(x)y(x)=\lambda r(x)y(x),
        \qquad x\in(a,b),
$$

 且满足分离型边界条件

$$
K y(a)-L y'(a)=0,\qquad M y(b)+N y'(b)=0,
$$

 其中

$$
K^2+L^2>0,\qquad M^2+N^2>0.
$$

 满足上述条件的 $\lambda$ 称为特征值,对应的非零解 $y$ 称为特征函数.

> [!note] 注.

边界条件也可写成角度形式.令

$$
\cos\alpha=\frac{K}{\sqrt{K^2+L^2}},\qquad
        \sin\alpha=\frac{L}{\sqrt{K^2+L^2}},
$$

 以及

$$
\cos\beta=\frac{M}{\sqrt{M^2+N^2}},\qquad
        \sin\beta=-\frac{N}{\sqrt{M^2+N^2}},
$$

 则边界条件等价于

$$
y(a)\cos\alpha-y'(a)\sin\alpha=0,
        \qquad
        y(b)\cos\beta-y'(b)\sin\beta=0.
$$



> [!note] 注. 物理动机:边界条件的含义

分离边界条件 $Ky(a)-L(py')(a)=0$ 描述端点与环境的相互作用: $y=0$ 是固定端(Dirichlet),$y'=0$ 是自由端(Neumann), $y'=hy$ 是弹性支撑(Robin),$py'$ 是端点处的剪力或张力; 周期条件 $y(a)=y(b)$,$(py')(a)=(py')(b)$ 描述闭合环. 只有在 $p(a)=p(b)$ 时, 后一条件才等价于普通导数的周期条件. 自伴边界条件对应\"边界不耗散能量,满足互易性\":在 $A$ 点加力,$B$ 点测位移, 与在 $B$ 点加同样力,$A$ 点测位移,结果相同(只对无损耗线性系统成立); 因此特征值为实数,不同特征值的模态正交; 非负性另外保证实振动频率.

### 例子

> [!example] 例. Dirichlet 问题

取 $[a,b]=[0,l]$,$p=1$,$q=0$,$r=1$,边界条件 $y(0)=0$,$y(l)=0$.问题为

$$
-y''=\lambda y,\qquad y(0)=y(l)=0.
$$

 特征值为

$$
\lambda_n=\left(\frac{n\pi}{l}\right)^2,\qquad n=1,2,\dots,
$$

 特征函数为

$$
y_n(x)=\sin\frac{n\pi x}{l}.
$$

 这些函数在 $[0,l]$ 上关于权 $1$ 正交.

> [!example] 例. 自由端的零模态

在 $[0,\pi]$ 上, $-y''=\lambda y$, $y'(0)=y'(\pi)=0$. 分部积分给出 $\lambda\int|y|^2=\int|y'|^2\ge0$. $\lambda=0$ 的解是常数; $\lambda>0$ 时写成三角函数并代入边界, 得到 $\lambda=n^2$, $y=\cos(nx)$, $n\ge1$. 边界条件改变了最低模态, 并不改变微分表达式.

> [!note] 定理. 实分离条件下的经典特征值为实数

在本章的正则假设与实分离边界条件下, 每个特征值 $\lambda$ 都是实数.

**证明.**

对非零经典解 $y$, 乘 $\overline y$ 积分, 得

$$
\lambda\int_a^b r|y|^2=\int_a^b(p|y'|^2+q|y|^2)-[py'\overline y]_a^b.
$$

 每个端点或者 $y=0$, 或者 $y'=hy$ 且 $h$ 为实数. 所以边界项和右边积分都是实数. 左边的质量积分严格正, 故 $\lambda$ 为实数. 这一步没有声称 $\lambda\ge0$; 势和边界能量还可能给出负特征值. $\square$

## 习题

##### 习题 1.1

**[基础]** 证明简支压杆问题的非零解存在当且仅当 $k=n\pi/l$,并写出对应的挠曲线形状.

##### 习题 1.2

**[基础]** 用截面惯性矩的量纲说明 $EIy''$ 与弯矩同量纲.

##### 习题 1.3

**[基础]** 写出精确曲率公式,并说明小挠度近似何时失效.

##### 习题 1.4

**[主线]** 一维弹性体的自由振动满足 $r(x)u_{tt}=(p(x)u_x)_x-q(x)u$. 令 $u(x,t)=T(t)y(x)$,分离变量并推出 SL 特征值问题 $-(py')'+qy=\lambda ry$.

##### 习题 1.5

**[主线]** 设 $y$ 在 $[0,L]$ 上满足 $-y''=\lambda y$.作尺度变换 $x=Lt$,$Y(t)=y(Lt)$,证明 $-Y''=\lambda L^2Y$, 并说明 Dirichlet 特征值如何随区间长度缩放.

##### 习题 1.6

**[主线]** 求 Neumann 问题 $-y''=\lambda y$,$y'(0)=y'(\pi)=0$ 的特征值与特征函数,并验证正交性.

##### 习题 1.7

**[主线]** 设 $u,v$ 满足以 $py'$ 写出的分离边界条件 $Ky(a)-L(py')(a)=0$, $My(b)+N(py')(b)=0$.证明 $[u,v](b)-[u,v](a)=0$,其中 $[u,v]=u(pv')-(pu')v$.

##### 习题 1.8

**[基础]** 求混合边界问题 $-y''=\lambda y$,$y(0)=0$,$y'(\pi)=0$ 的 特征值与特征函数.

本节习题解答见本页末的习题解答.

##### 习题提示.

\(4\) 两边除以 $r yT$,左端只依赖 $t$,右端只依赖 $x$, 令公共常数为 $-\lambda$. (5) 先算 $Y''(t)=L^2y''(Lt)$,再代回方程; Dirichlet 特征值为 $\lambda_n=n^2\pi^2/L^2$. (6) $\lambda_0=0$,$y_0=1$;对 $n\ge1$, $\lambda_n=n^2$,$y_n=\cos(nx)$. (7) 在 $x=a$ 处两个向量 $(u,(pu'))$,$(v,(pv'))$ 都满足同一个 非平凡线性方程,故成比例;对 $x=b$ 同理. (8) 通解为 $y=\sin(\mu x)$,$y'(\pi)=\mu\cos(\mu\pi)=0$ 给出 $\mu=n+\frac12$,故 $\lambda_n=(n+\frac12)^2$, 特征函数为 $\sin((n+\frac12)x)$. $\square$

## 本章小结

杆的弯曲给出 $y''+k^2y=0$,更一般的变系数问题化为 SL 方程;正则 SL 问题与分离边界条件是后续谱理论的标准框架.

## 标准参考与延伸阅读

- A. Zettl, *Sturm--Liouville Theory*, AMS, 2005, Ch. 1 §1.2--§1.5, Ch. 2 §2.2--§2.5: 一阶系统与标量方程解的存在唯一性,端点延拓,对数据的连续与可微依赖.

- A. Zettl, Ch. 3 §3.1, Ch. 4 §4.1:正则 SL 问题与边界条件的标准框架(边界形式见第5章, 自伴性证明见第6章).

- 完整的章节对照见本书\"与 Zettl 的章节对照\".

## 习题解答

#### 习题 1.1 的解答.

**[基础]** 方程 $y''+k^2y=0$ 的通解为



$$
y=A\sin kx+B\cos kx.
$$



由 $y(0)=0$ 得 $B=0$;由 $y(l)=0$ 得 $A\sin kl=0$.非零解要求 $A\neq0$,故 $\sin kl=0$,即 $k=n\pi/l$.对应挠曲线为 $y_n(x)=A\sin(n\pi x/l)$.

#### 习题 1.2 的解答.

**[基础]** $E$ 的量纲是 $[\text{力}]/[\text{长度}]^2$,$I$ 的量纲是 $[\text{长度}]^4$,$y''$ 的量纲是 $[\text{长度}]^{-1}$,因此 $EIy''$ 的量纲是 $[\text{力}]\cdot[\text{长度}]$,与弯矩相同.

#### 习题 1.3 的解答.

**[基础]** 精确曲率为



$$
\kappa=\frac{|y''|}{(1+y'^2)^{3/2}}.
$$



当 $|y'|$ 不小时,$(1+y'^2)^{3/2}$ 明显大于 $1$,不能略去. 只有当 $|y'|\ll1$ 时才有 $\kappa\approx|y''|$.

#### 习题 1.4 的解答.

**[主线]** 代入 $u=T y$:



$$
r y T''=\bigl[(p y')'-q y\bigr]T.
$$



两边除以 $r y T$:



$$
\frac{T''}{T}
=\frac{(p y')'-q y}{r y}.
$$



左端只依赖 $t$,右端只依赖 $x$,故等于常数,记为 $-\lambda$. 于是



$$
T''+\lambda T=0,
\qquad
-(p y')'+q y=\lambda r y.
$$



边界条件由 $u$ 的边界条件在 $T\not\equiv0$ 时化为 $y$ 的边界条件.

#### 习题 1.5 的解答.

**[主线]** 由链式法则 $Y'(t)=L y'(Lt)$,$Y''(t)=L^2y''(Lt)$, 故



$$
-Y''(t)=-L^2y''(Lt)=\lambda L^2y(Lt)=\lambda L^2Y(t).
$$



因此原问题在 $[0,L]$ 上的特征值等于单位区间 $[0,1]$ 上特征值的 $L^{-2}$ 倍.对 Dirichlet 问题,



$$
\lambda_n([0,L])=\frac{n^2\pi^2}{L^2},
$$



即区间越长,特征值越小.

#### 习题 1.6 的解答.

**[主线]** $\lambda=0$ 时 $y=Ax+B$,$y'\equiv A$,Neumann 条件要求 $A=0$,故 $\lambda_0=0$,$y_0=1$. 对 $\lambda=\mu^2>0$,$y=A\cos\mu x+B\sin\mu x$, $y'(0)=B\mu=0$ 得 $B=0$,$y'(\pi)=-A\mu\sin\mu\pi=0$ 得 $\mu=n$,$n=1,2,\dots$.因此



$$
\lambda_n=n^2,\qquad y_n(x)=\cos(nx),\qquad n=0,1,2,\dots.
$$



对 $m\neq n$,



$$
\int_0^\pi\cos(mx)\cos(nx)\,dx=0,
$$



故特征函数两两正交.

#### 习题 1.7 的解答.

**[主线]** 在 $x=a$ 处,向量 $(u(a),(pu')(a))$ 与 $(v(a),(pv')(a))$ 都满足同一个非平凡线性方程 $K y-L(py')=0$,其解空间是一维的,因此两向量成比例, 从而



$$
u(a)(pv')(a)-(pu')(a)v(a)=0.
$$



同理在 $x=b$ 处 $u(b)(pv')(b)-(pu')(b)v(b)=0$.于是



$$
[u,v](b)-[u,v](a)=0.
$$



这说明分离型边界条件使边界项消失.第5章"一维 Sobolev 空间,算子域与边界形式"说明边界形式与对称性; 第6章通过 Green 算子的实点满射进一步证明自伴性.

#### 习题 1.8 的解答.

**[基础]** 方程通解为 $y=A\sin(\mu x)+B\cos(\mu x)$,$\lambda=\mu^2$. 由 $y(0)=0$ 得 $B=0$;由 $y'(\pi)=\mu A\cos(\mu\pi)=0$ 得 $\cos(\mu\pi)=0$,故 $\mu=k+\frac12$,$k=0,1,2,\dots$. 因此

$$
\lambda_k=\left(k+\frac12\right)^2,\qquad
y_k(x)=\sin\bigl((k+\frac12)x\bigr).
$$

 $\lambda=0$ 与 $\lambda<0$ 都不给出非零解.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[03_Liouville标准形|下一章]]
