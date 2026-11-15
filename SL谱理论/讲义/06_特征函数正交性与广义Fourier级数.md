---
title: Hilbert 空间中的正交几何
date: '2026-10-08'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- SL 特征函数正交性
- 广义 Fourier 级数
stage_type: lecture
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\04_fourier.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
prerequisites:
- '[[05_Sturm比较定理与零点交错]]'
lecture_chapter: 4
---

# 第 4 章 Hilbert 空间中的正交几何
> [!info] 阅读位置
> 本页对应新版第 4 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
从完备性,闭子空间与投影出发, 建立 Fourier 系数的几何意义.

> [!question] 基本问题
互相正交的函数何时足以表示所有函数?

有限维正交投影通过点积选择最佳近似; 在函数空间中, 内积改为积分, 而极限是否仍在空间中成为一个新的问题. 本章由此建立展开所需的几何工具, 第 7 章再用它们证明 SL 特征函数的完备性. 全书内积对第一变量线性, 对第二变量共轭线性.

## 从内积到 Hilbert 空间

> [!note] 定义. 完备性与 Hilbert 空间

内积空间 $H$ 的范数为 $\|u\|=(u,u)^{1/2}$. 若每个 Cauchy 列都在 $H$ 中有范数极限, 则称 $H$ 为 Hilbert 空间. 子空间 $M$ 是闭的, 指 $M$ 中的范数收敛列的极限仍属于 $M$. 记

$$
M^\perp=\{v\in H:(v,m)=0\text{ 对所有 }m\in M\}.
$$



Cauchy--Schwarz 不等式 $|(u,v)|\le\|u\|\|v\|$ 可由 $\|u-tv\|^2\ge0$ 取 $t=(u,v)/\|v\|^2$ 得到. 它说明内积对范数极限连续, 因而 $M^\perp$ 总是闭的. 内积还给出平行四边形恒等式

$$
\|u+v\|^2+\|u-v\|^2=2\|u\|^2+2\|v\|^2.
$$



> [!note] 定理. 带权平方可积空间的完备性

设 $r\in C[a,b]$, $r>0$. 将几乎处处相等的可测函数视为同一元素, 则

$$
L^2_r(a,b)=\left\{f:\int_a^b r|f|^2\,dx<\infty\right\},
        \qquad (f,g)_r=\int_a^b rf\bar g\,dx
$$

 是 Hilbert 空间. 若 $r_-=\min r$, $r_+=\max r$, 则

$$
r_-\|f\|_2^2\le\|f\|_r^2\le r_+\|f\|_2^2.
$$



**证明.**

先从基本列中选出相邻差可求和的子列, 用它构造极限函数; 再利用原列的基本性恢复整列收敛.

先证普通 $L^2$ 完备. 从 Cauchy 列 $(f_n)$ 中取子列使 $\|f_{n_{k+1}}-f_{n_k}\|_2\le2^{-k}$. 记 $g_k=f_{n_{k+1}}-f_{n_k}$.

有限和 $S_N=\sum_{k\le N}|g_k|$ 满足 $\|S_N\|_2\le\sum2^{-k}\le1$. 单调收敛给出 $S=\sum|g_k|\in L^2$, 因而级数几乎处处绝对收敛. 令 $f=f_{n_1}+\sum g_k$; 对尾和用 Fatou 引理和三角不等式得

$$
\|f-f_{n_m}\|_2\le\sum_{k\ge m}2^{-k}\longrightarrow0.
$$

 原列为 Cauchy 列, 故原列也收敛到 $f$. 最后映射 $f\mapsto\sqrt r f$ 是 $L^2_r$ 到 $L^2$ 的满射等距映射, 将完备性转移到带权空间. 范数比较由 $r_-\le r\le r_+$ 积分得到. $\square$

> [!example] 例. 缺少完备性会发生什么

有限非零项序列构成的空间 $c_{00}$ 配以 $\ell^2$ 范数并不完备: $(1,1/2,\ldots,1/N,0,\ldots)$ 是 Cauchy 列, 极限 $(1/n)_{n\ge1}$ 不在 $c_{00}$ 中. 无穷级数的极限存在于何处, 是函数展开的第一个问题.

## 投影定理与 Riesz 表示

> [!note] 定理. 到闭子空间的正交投影

设 $M$ 是 Hilbert 空间 $H$ 的闭子空间. 对每个 $f\in H$, 存在唯一 $m\in M$ 使

$$
\|f-m\|=\inf_{v\in M}\|f-v\|.
$$

 它由 $f-m\in M^\perp$ 唯一刻画. 记 $m=P_Mf$, 则 $H=M\oplus M^\perp$, 且 $\|P_Mf\|\le\|f\|$.

**证明.**

记下确界为 $d$, 取 $m_k\in M$ 使 $\|f-m_k\|\to d$. 平行四边形恒等式给出

$$
\|m_j-m_k\|^2
        =2\|f-m_j\|^2+2\|f-m_k\|^2
        -4\left\|f-\frac{m_j+m_k}{2}\right\|^2\longrightarrow0,
$$

 因为最后一个平方至少为 $d^2$. 完备性与闭性给出 $m_k\to m\in M$.

对任意 $v\in M$ 和实数 $t$, $\|f-m-tv\|^2$ 在 $t=0$ 取最小值, 故 $\operatorname{Re}(f-m,v)=0$. 再以 $iv$ 代 $v$, 得 $(f-m,v)=0$. 反过来, 若此正交性成立, 则

$$
\|f-v\|^2=\|f-m\|^2+\|m-v\|^2\quad(v\in M),
$$

 同时给出最小性与唯一性. 取 $v=0$ 又得投影的范数估计; 线性由唯一性得到. $\square$

> [!note] 定义. 有界线性泛函

线性映射 $\ell:H\to\mathbb C$ 若满足 $|\ell(f)|\le C\|f\|$, 称为有界线性泛函. 最小的这样的 $C$ 记作 $\|\ell\|$. 有界等价于在零点连续, 从而等价于处处连续.

> [!note] 定理. Riesz 表示定理

每个有界线性泛函 $\ell$ 唯一写成 $\ell(f)=(f,g)$, 其中 $g\in H$, 且 $\|\ell\|=\|g\|$.

**证明.**

$\ell=0$ 时取 $g=0$. 否则 $M=\ker\ell$ 是闭真子空间. 取 $z$ 使 $\ell(z)\ne0$, 令 $e=(z-P_Mz)/\|z-P_Mz\|$. 则 $e\perp M$, $\ell(e)\ne0$.

因 $f-\ell(f)e/\ell(e)\in M$, 有 $(f,e)=\ell(f)/\ell(e)$. 所以取 $g=\overline{\ell(e)}e$ 即得表示.

两个表示向量之差与一切 $f$ 正交, 故为零. Cauchy--Schwarz 给出 $\|\ell\|\le\|g\|$; 取 $f=g/\|g\|$ 得反向不等式. $\square$

> [!example] 例. 把函数当作向量: 一个完整的投影计算

在 $H=L^2(-1,1)$ 中取 $M=\operatorname{span}\{1,x\}$. 这里 $1$ 和 $x$ 是两个函数向量, 而 $a+bx$ 是它们的线性组合. 因为

$$
(1,x)=0,\qquad \|1\|_2^2=2,\qquad \|x\|_2^2=\frac23,
$$

 $M$ 中的 Cauchy 列对应于两个坐标各自为 Cauchy 列, 因而其极限仍在 $M$ 中. 到 $M$ 的投影应使误差与这两个方向都正交. 解两个方程 $(f-a-bx,1)=(f-a-bx,x)=0$, 得

$$
P_Mf=\ell_0(f)\,1+\ell_1(f)\,x,\qquad
        \ell_0(f)=\frac12\int_{-1}^1 f,\quad
        \ell_1(f)=\frac32\int_{-1}^1xf.
$$

 这正是有限维正交投影的计算, 只是点积换成了积分. 两个坐标 $\ell_j(f)$ 是数; $\ell_j$ 是从函数空间到数域的线性映射; 而它们的 Riesz 表示向量又是函数:

$$
\ell_0(f)=(f,g_0),\quad g_0=\frac12,\qquad
        \ell_1(f)=(f,g_1),\quad g_1=\frac32x.
$$

 Cauchy--Schwarz 给出有界性. 取 $f=g_j/\|g_j\|_2$ 达到等号, 所以 $\|\ell_0\|=1/\sqrt2$, $\|\ell_1\|=\sqrt{3/2}$.

现在固定 $f(x)=x^2$. 由 $\int_{-1}^1x^2=2/3$ 和 $\int_{-1}^1x^3=0$, 得到 $P_Mf=1/3$. 最佳逼近误差为

$$
\left\|x^2-\frac13\right\|_2^2
        =\frac25-\frac49+\frac29=\frac8{45}.
$$

 对任意复数 $a,b$, 正交分解进一步给出

$$
\|x^2-a-bx\|_2^2
        =\frac8{45}+2\left|a-\frac13\right|^2+\frac23|b|^2.
$$

 因此最优系数唯一, 最小误差却仍为正数. 有限最佳逼近解决的是在给定 $M$ 中选哪个向量; 无限维完备性还要问, 当允许的方向不断增加时, 这些最小误差是否趋于零.

## 正交系,基与 Fourier 系数

> [!note] 定义. 正交规范系与完备正交规范基

若 $(e_n,e_m)=\delta_{nm}$, 称 $(e_n)_{n\ge1}$ 为正交规范系. 若其有限线性组合的闭包等于 $H$, 称其为完备正交规范基. 这里的基允许范数收敛的无穷和, 不要求每个向量是有限线性组合.

> [!note] 定理. Bessel 不等式,最佳逼近与完备性判据

令 $c_n=(f,e_n)$, $P_Nf=\sum_{n=1}^Nc_ne_n$. 则

$$
\|f-P_Nf\|^2=\|f\|^2-\sum_{n=1}^N|c_n|^2,
        \qquad \sum_{n=1}^\infty|c_n|^2\le\|f\|^2.
$$

 $P_Nf$ 是到 $\operatorname{span}\{e_1,\ldots,e_N\}$ 的唯一最佳逼近. 以下四件事等价: 系完备; 与全部 $e_n$ 正交的向量只有零; 每个 $f$ 满足 $P_Nf\to f$; 每个 $f$ 满足 Parseval 恒等式 $\|f\|^2=\sum|c_n|^2$.

**证明.**

展开平方得到 (4.2). 对任意复数 $d_n$, 再用正交性得

$$
\left\|f-\sum_{n=1}^Nd_ne_n\right\|^2
        =\|f-P_Nf\|^2+\sum_{n=1}^N|d_n-c_n|^2.
$$

 这证明最佳逼近. 由 Bessel 不等式, $\|P_Mf-P_Nf\|^2=\sum_{n=N+1}^M|c_n|^2\to0$, 所以先由 Hilbert 完备性得到极限 $g$. 对每个 $m$, $(f-g,e_m)=0$. 因而零正交补推出 $g=f$. 零正交补与闭线性包等于 $H$ 的等价性来自投影定理. 最后由 (4.2), 范数收敛与 Parseval 等价. $\square$

> [!note] 注. 系数趋零不等于完备

Bessel 不等式总给出 $c_n\to0$, 即使正交系并不完备. 这只是 Hilbert 空间中的系数结论; 经典 $L^1$ Fourier 的 Riemann--Lebesgue 引理是另一个命题.

> [!example] 例. 删掉一个方向

在 $\ell^2$ 中, 标准单位向量 $e_1,e_2,\ldots$ 构成完备基, 因为截断误差是平方可和级数的尾和. 删去 $e_1$ 后仍是正交规范系, 但其闭线性包是 $\{x:x_1=0\}$; 向量 $e_1$ 的全部剩余系数都是零.

## SL 正交性是几何的入口

设 $p\in C^1[a,b]$, $p>0$, $q,r\in C[a,b]$ 为实函数且 $r>0$, 配以两端各一个实分离边界条件. 对经典解记 $Lu=-(pu')'+qu$.

> [!note] 定理. 特征值实性,单重性与正交性

每个特征值为实数, 特征空间是一维的. 不同特征值的特征函数在 $L^2_r$ 中正交.

**证明.**

Lagrange 恒等式给出

$$
\int_a^b\bigl((Lu)\bar v-u\overline{Lv}\bigr)\,dx
        =\bigl[p(u\bar v'-u'\bar v)\bigr]_a^b.
$$

 同一实分离条件使每端的两对边界数据 $(u,pu')$, $(v,pv')$ 落在同一条复化实直线上, 故边界项为零. 取 $v=u$, $Lu=\lambda ru$, 得 $(\lambda-\bar\lambda)\|u\|_r^2=0$, 因而 $\lambda$ 实. 再对两个不同实特征值应用同一恒等式, 得 $(\lambda_n-\lambda_m)(u_n,u_m)_r=0$. 固定 $\lambda$, 左端边界条件将初始向量限制在一维空间; ODE 初值唯一性说明满足此条件的解空间一维, 故特征空间至多一维, 存在特征函数时恰为一维. $\square$

> [!example] 例. 正弦系数能告诉我们什么

在 $[0,\pi]$ 上, $e_n=\sqrt{2/\pi}\sin(nx)$ 是 Dirichlet 问题的正交规范特征函数. 对 $f=1$,

$$
c_n=\sqrt{2/\pi}\,\frac{1-(-1)^n}{n}.
$$

 本章已经知道部分和是最佳平方逼近且收敛到正弦系闭线性包中的投影. 第 7 章将证明正弦系的闭线性包是整个空间, 从而这个投影就是 $f$, Parseval 等号也随之成立.

> [!note] 注. 热方程的模态解释

对非负的空间算子, 模态 $e_n$ 随时间乘以 $e^{-\lambda_nt}$. 绝对衰减率由最低的非零初始模态对应的 $\lambda_n$ 决定. 只有把第一模态的时间因子提出后, 其余模态的相对衰减率才是 $\lambda_n-\lambda_1$. 完备性使这一解释适用于任意平方可积初值, 其证明仍待第 7 章.

## 习题

##### 习题 4.1

**[主线]** 证明 $M^\perp$ 是闭子空间, 并证明 $(M^\perp)^\perp=\overline M$.

##### 习题 4.2

**[基础]** 在 $L^2_r(a,b)$ 中求 $f$ 到常数子空间的投影, 并写出最佳逼近误差.

##### 习题 4.3

**[主线]** 证明任意正交规范列 $e_n$ 满足 $(f,e_n)\to0$, 但 $e_n$ 自身没有范数收敛子列.

##### 习题 4.4

**[主线]** 对 $\ell(f)=\int_a^bf(x)\,dx$, 在 $L^2_r$ 中求 Riesz 表示向量和泛函范数.

##### 习题 4.5

**[主线]** 对正弦系计算 $f(x)=x(\pi-x)$ 的系数 $b_n=\frac2\pi\int_0^\pi f(x)\sin(nx)\,dx$. 说明仅由本章可断言哪些收敛事实.

本节习题解答见本页末的习题解答.

## 本章小结

Hilbert 完备性保证正交级数有极限, 闭子空间保证最佳逼近存在. 正交系只有在闭线性包为整个空间时才成为基. SL 特征函数的正交性已证明, 其完备性将由紧预解算子与谱定理建立.

## 标准参考与延伸阅读

本章所用结论均已给出证明. 延伸阅读: G. Teschl, *Mathematical Methods in Quantum Mechanics*, 作者在线的 2009 版, §1.2--§1.3 (正交基,投影与 Riesz 表示).

## 习题解答

#### 习题 4.1 的解答

**[主线]** 设 $x_n\in M^\perp$, $x_n\to x$. 对任意 $m\in M$, 内积连续性给出 $(x,m)=\lim(x_n,m)=0$, 故 $M^\perp$ 闭; 线性显然. $M^\perp=(\overline M)^\perp$. 由投影定理写任意 $x=m+z$, $m\in\overline M$, $z\in M^\perp$. 若 $x\in(M^\perp)^\perp$, 则 $0=(x,z)=\|z\|^2$, 故 $x=m\in\overline M$. 反向包含由定义得到.

#### 习题 4.2 的解答

**[基础]** 常数子空间由 $1$ 张成, 所以

$$
P f=\frac{(f,1)_r}{(1,1)_r}\,1
        =\frac{\int_a^b r f\,dx}{\int_a^b r\,dx},\qquad
        \|f-P f\|_r^2=\|f\|_r^2-\frac{|\int_a^b rf\,dx|^2}{\int_a^br\,dx}.
$$

 最佳常数一般是复数; 公式中的绝对值平方不能换成普通平方.

#### 习题 4.3 的解答

**[主线]** Bessel 给出 $\sum|(f,e_n)|^2\le\|f\|^2$, 故通项趋零. 但 $n\ne m$ 时 $\|e_n-e_m\|^2=2$, 任意子列都不是 Cauchy 列, 因而无范数收敛子列.

#### 习题 4.4 的解答

**[主线]** 因 $r>0$ 连续, $1/r\in L^2_r$, 且

$$
\ell(f)=\int_a^b f\,dx=(f,1/r)_r.
$$

 所以表示向量为 $g=1/r$, 泛函范数为 $\|\ell\|=\|1/r\|_r=(\int_a^br^{-1}\,dx)^{1/2}$. Cauchy--Schwarz 也直接证明该泛函有界.

#### 习题 4.5 的解答

**[主线]** $f=x(\pi-x)$ 两端为零, $f''=-2$. 两次分部积分给出

$$
\int_0^\pi f\sin(nx)\,dx
        =-\frac1{n^2}\int_0^\pi f''\sin(nx)\,dx
        =\frac{2(1-(-1)^n)}{n^3},
$$

 故 $b_n=4(1-(-1)^n)/(\pi n^3)$, 奇数项为 $8/(\pi n^3)$, 偶数项为零. 本章的抽象结论保证部分和在 $L^2$ 中收敛到正弦系闭包中的投影. 本例另由 $\sum|b_n|<\infty$ 和 $|\sin(nx)|\le1$ 得到绝对一致收敛到某连续函数, 但仅凭本章尚未证明这个函数必等于 $f$. 第 7 章的正弦系完备性将补上这一步.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[05_Sturm比较定理与零点交错|上一章]]
- [[07_自伴边界条件与Hilbert空间框架|下一章]]

## 跨主题参照

- [[数学物理方程/14_波动方程的分离变量法#1. 空间本征振型的筛选与双初值模态叠加（课件第 2—16 页）|波动方程的分离变量法]]。看同一组空间正交坐标如何分别表示波方程的位移初值和速度初值。
