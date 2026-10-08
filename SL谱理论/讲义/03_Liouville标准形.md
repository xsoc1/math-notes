---
title: Liouville 标准形与 Prüfer 变换
date: '2026-10-08'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- Liouville 标准形
- Liouville normal form
stage_type: lecture
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\02_standard_prufer.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
prerequisites:
- '[[02_正则Sturm-Liouville问题]]'
lecture_chapter: 2
---

# 第 2 章 Liouville 标准形与 Prüfer 变换
> [!info] 阅读位置
> 本页对应新版第 2 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.

![[fig_prufer.svg|520]]


> [!abstract] 本章目标
掌握 Liouville 标准形与 Prüfer 相位变换,把二阶方程化为一阶相位方程.

> [!question] 基本问题
如何把变系数 SL 方程化为最简形式,并用相位描述解的振荡?

## Liouville 标准形

一般 SL 方程可以通过自变量与因变量的变换化为更简单的\"标准形\"

$$
z''+\bigl[\lambda+Q(s)\bigr]z=0.
$$

 本节假设 $p,r\in C^2[a,b]$ 且严格为正, $q\in C[a,b]$. 后面的例子还会在开区间局部使用同一换元. 这时需要另行检查端点处的系数, 再判断闭区间的正则结论是否适用. 原势记作 $q$, 变换后的势记作 $Q$. 标准形中的撇号对新变量 $s$ 求导. 通常采用的变换如下.

### 自变量变换

定义新的自变量

$$
s=\int_a^x\sqrt{\frac{r(t)}{p(t)}}\,dt,
    \qquad
    c=\int_a^b\sqrt{\frac{r(t)}{p(t)}}\,dt,
$$

 则 $s\in[0,c]$. 这个变换把 $[a,b]$ 映射到 $[0,c]$,并把

$$
-\bigl(p y'\bigr)'+q y=\lambda r y
$$

 化为以 $s$ 为自变量的二阶方程.

### 因变量变换

再令

$$
z(s)=\bigl[p(x(s))r(x(s))\bigr]^{1/4}y(x(s)),
$$

 并记

$$
f(x)=\bigl(p(x)r(x)\bigr)^{1/4},\qquad
    \theta(x)=s'(x)=\sqrt{\frac{r(x)}{p(x)}},\qquad
    F(s)=f(x(s)).
$$



> [!note] 定理. Liouville 变换的显式公式

上述变换把方程

$$
-(py')'+qy=\lambda ry
$$

 化为

$$
z''+\bigl[\lambda+Q(s)\bigr]z=0,
        \qquad
        Q(s)=-\frac{q(x(s))}{r(x(s))}-\frac{F''(s)}{F(s)}.
$$



**证明.**

自变量变换用于归一化谱参数的系数, 因变量因子则用于消去一阶导数项. 下面把这两项作用放在同一次计算中核对.

记 $A=pf'/f^2$.由 $p/f^2=\sqrt{p/r}=1/\theta$ 得 $A=f'/\theta$. 写 $y=z(s)/f(x)$,计算

$$
py'=fz_s-Az.
$$

 对 $x$ 求导,利用 $A\theta=f'$,得

$$
(py')'=f\theta\,z_{ss}-A'z.
$$

 代入方程并除以 $-f\theta$,再用 $f^2\theta=r$,得到

$$
z_{ss}+\left[\lambda-\frac qr-\frac{A'}{f\theta}\right]z=0.
$$

 最后由 $A=f'/\theta$ 得 $F_s=A$,$F_{ss}=A'/\theta$,于是

$$
\frac{F_{ss}}{F}=\frac{A'}{\theta f}=\frac{A'}{f\theta}.
$$

 故 $Q=-q/r-F''/F$. $\square$

原变量中的 $y',f',A'$ 对 $x$ 求导, $z',F'$ 对 $s$ 求导. 例如 $p=r=1$ 时, $s=x-a$, $F=1$, 因而 $Q(s)=-q(x(s))$, 正好恢复 $-y''+qy=\lambda y$ 的符号. 边界条件也随换元一起变换. 在任一端点, 若原条件写成 $Ky-L(py')=0$, 则由 $y=z/F$ 与 $py'=Fz'-F'z$ 得

$$
\left(\frac K F+LF'\right)z-LFz'=0.
$$

 这里 $F,F'$ 均在对应端点取值, 系数与 $\lambda$ 无关. 特别地, Dirichlet 条件仍为 $z=0$, Neumann 条件则成为 $Fz'-F'z=0$, 通常不是 $z'=0$. 第9章将再次使用这个端点关系.

> [!example] 例. Bessel 型方程:变密度弦与 Bessel 函数

取 $p=1$,$r=x^2$,$q=0$,$x\in(0,1)$.则

$$
s=\frac{x^2}{2},\qquad
        F(s)=(2s)^{1/4},\qquad
        Q(s)=\frac{3}{16s^2},
$$

 标准形为 $z''+[\lambda+3/(16s^2)]z=0$.势在 $s=0$ 处奇异, 对应原方程端点 $x=0$.

##### 物理意义.

原方程 $-y''=\lambda x^2y$ 可以看作一根**变密度弦**的振动方程: 设张力为 $1$,单位长度密度为 $\rho(x)=x^2$,位移为 $u(x,t)$,则

$$
\rho(x)u_{tt}=(Tu_x)_x
    \quad\Longrightarrow\quad
    x^2u_{tt}=u_{xx}.
$$

 令 $u(x,t)=T(t)y(x)$ 分离时间变量,即得 $-y''=\lambda x^2y$. 密度在 $x=0$ 处为零, 超出了本书要求端点也严格正的简化假设. 但原问题仍满足广义正则条件 $1/p,q,r\in L^1$ 且 $r>0$ 几乎处处; 变换后出现奇异势不意味着原端点按所有 SL 定义都奇异. 更一般地,若 $r(x)=x^{2\alpha}$, $\alpha>-1$ 且只在 $x>0$ 作变换, 则

$$
s=\frac{x^{\alpha+1}}{\alpha+1},
    \qquad
    Q(s)=\frac{\alpha(\alpha+2)}{4(\alpha+1)^2}\frac1{s^2};
$$

 $\alpha=1$ 给出 $Q=3/(16s^2)$.这说明变密度会产生**逆平方势** (离心势垒),它是高维径向问题中反复出现的结构.

##### 这里先观察什么.

变换后的 $Q(s)$ 在端点发散. 这个例子展示了换元如何改变端点附近的系数; 有界势的估计要求重新核对. 第 17 章将说明, 奇异端点问题还需要确定相应的算子定义域.

##### 与 Bessel 函数的联系.

Bessel 方程

$$
u''+\frac1t u'+\left(1-\frac{\nu^2}{t^2}\right)u=0
$$

 在变换 $u=t^{-1/2}v$ 下化为

$$
v''+\left[1+\frac{1/4-\nu^2}{t^2}\right]v=0.
$$

 对 $\lambda>0$, 取 $\nu=1/4$,$t=\sqrt{\lambda}s$,即得本例的变换后方程. 因此原方程的解可写成

$$
y(x)=\sqrt{x}\,J_{1/4}\!\left(\frac{\sqrt{\lambda}}2x^2\right)
$$

 与 $\sqrt{x}J_{-1/4}(\sqrt{\lambda}x^2/2)$ 的线性组合. 两支在 $x=0$ 都有界, 所以仅要求有界不能选出唯一边界条件. 若另加 $y(0)=0$, 才选出 $J_{1/4}$ 这一支; 右端条件随后决定允许的 $\lambda$.

> [!example] 例. Legendre 方程:球面调和与 Legendre 多项式

取 $p=1-x^2$, $q=0$, $r=1$, $x\in(-1,1)$. 在这个局部例子中把积分常数选为 $s(0)=0$, 则

$$
s=\arcsin x,\qquad
        F(s)=\sqrt{\cos s},\qquad
        Q(s)=\frac12+\frac14\tan^2s.
$$

 标准形为 $z''+[\lambda+\frac12+\frac14\tan^2s]z=0$, $s\in(-\pi/2,\pi/2)$;奇异端点 $x=\pm1$ 对应 $s=\pm\pi/2$.

##### 物理意义.

Legendre 方程 $-((1-x^2)y')'=\lambda y$ 是 Laplace 方程在球坐标下 分离变量得到的**角向方程**.取 $x=\cos\theta$($\theta$ 为极角), 角向本征方程为

$$
\frac1{\sin\theta}\frac{d}{d\theta}
    \left(\sin\theta\frac{dY}{d\theta}\right)+\lambda Y=0,
$$

 令 $x=\cos\theta$ 即化为 Legendre 方程.此时 $\lambda=n(n+1)$,$n=0,1,2,\dots$,特征函数是 Legendre 多项式 $P_n(\cos\theta)$. 这里 $n$ 是多项式次数, 不是从1开始的谱排序序号. 这些函数联系着球面调和函数,角动量量子数,静电场与引力场的 多极展开,以及氢原子的角向方程.

##### 这里先观察什么.

$p=1-x^2$ 在端点退化, 且变换后 $Q$ 发散. 因此第 7 章的正则算子证明不能直接套用. 不过 Legendre 多项式的 $L^2(-1,1)$ 完备性可以直接由多项式逼近证明, 不必先解决一般奇异扩张; 第 13 章将给出这条途径. 奇异算子的定义域问题另见第 17 章.

##### 与其他特殊函数的联系.

把权函数换成 $(1-x)^\alpha(1+x)^\beta$ 就得到 Jacobi 多项式, Legendre 多项式是其特例;更高维球面角向问题给出 Gegenbauer 多项式. 这些正交多项式与 Bessel 函数一道构成常见的数学物理特殊函数; Bessel 函数本身一般不是多项式.

> [!note] 注. 两个例子的共同结构

换元可以简化方程, 也可能把端点行为显露为奇异势. 求出微分方程的解,选定算子定义域,证明所选函数族完备, 是三个不同步骤.

> [!note] 注. 物理动机:圆膜,悬挂链与 Bessel 零点

圆膜自由振动 $u_{tt}=c^2\Delta u$ 的径向方程为 $-(rR')'+(m^2/r)R=\lambda rR$,即 Bessel 方程; 特征值由 $J_m$ 的零点决定,节线(振动中始终不动的曲线)是同心圆与直径, 最低音对应第一个零点. 圆柱热传导与圆波导也出现同一方程. 悬挂链的张力 $T(x)=\rho gx$,方程为 $-(xy')'=\lambda y$, 解由 $J_0$ 给出,基频由 $J_0$ 的第一个零点决定.

## Prüfer 变换:把二阶方程变成一阶相位方程

> [!note] 注. 物理动机:无限深势阱与弦的谐波

宽度为 $L$ 的无限深势阱满足 $-\psi''=E\psi$,$\psi(0)=\psi(L)=0$. 解 $\psi_n=\sin(n\pi x/L)$,能级 $E_n=(n\pi/L)^2$; 第 $n$ 个态的零点数为 $n-1$,对应 Prüfer 相位穿过 $n-1$ 个零点. 两端固定弦的模态同为 $\sin(n\pi x/L)$,频率 $f_n=nc/(2L)$; 管乐器与弦乐器的谐波列都是这一结点计数的物理表现.

### 极坐标表示

以下固定标准形的变量 $s\in[0,c]$, 所有撇号均表示 $d/ds$. 端点角 $\alpha,\beta$ 指已经变换后的边界条件, 由上一节的端点关系确定. 考虑标准形

$$
z''+\bigl[\lambda+Q(s)\bigr]z=0.
$$



> [!note] 定义. Prüfer 振幅与连续相位

设 $\varphi(s,\lambda)$ 是一个非零实解. 引入极坐标

$$
\begin{cases}
        \varphi(s,\lambda)=\rho(s,\lambda)\sin\theta(s,\lambda),\\[2mm]
        \varphi'(s,\lambda)=\rho(s,\lambda)\cos\theta(s,\lambda),
    \end{cases}
$$

 其中 $\rho>0$, $\theta$ 为连续提升的相位角. 局部可写

$$
\theta(s,\lambda)=\arctan\frac{\varphi(s,\lambda)}{\varphi'(s,\lambda)}.
$$



> [!note] 命题.

在上述极坐标表示下,$\theta$ 满足一阶方程

$$
\theta'=\cos^2\theta+\bigl[\lambda+Q(s)\bigr]\sin^2\theta.
$$



**证明.**

由 $\theta=\arctan(\varphi/\varphi')$,

$$
\theta'=\frac{\varphi'^2-\varphi\varphi''}{\varphi'^2+\varphi^2}.
$$

 因为 $\varphi''=-[\lambda+Q]\varphi$,且 $\varphi'^2+\varphi^2=\rho^2$,所以

$$
\theta'
        =\frac{\rho^2\cos^2\theta+\bigl[\lambda+Q\bigr]\rho^2\sin^2\theta}{\rho^2}
        =\cos^2\theta+\bigl[\lambda+Q\bigr]\sin^2\theta.
$$

 $\square$

### 边界条件变成角度方程

若左端边界条件为

$$
\varphi(0)\cos\alpha-\varphi'(0)\sin\alpha=0,
$$

 则代入 $\varphi=\rho\sin\theta$,$\varphi'=\rho\cos\theta$ 得

$$
\sin\theta\cos\alpha-\cos\theta\sin\alpha=0
    \quad\Longleftrightarrow\quad
    \sin(\theta-\alpha)=0,
$$

 故

$$
\theta(0,\lambda)=\alpha+k\pi,\qquad k\in\mathbb{Z}.
$$

 同理,右端边界条件给出

$$
\theta(c,\lambda)=\beta+k\pi,\qquad k\in\mathbb{Z}.
$$

 因此特征值问题等价于:寻找 $\lambda$,使得从初始相位 $\theta(0)=\alpha$ 出发 的 $\theta(s,\lambda)$ 在 $s=c$ 处恰好落在 $\beta+k\pi$ 上.

### 特征值的单调性与存在性

> [!note] 定理. 相位单调性

设 $Q$ 连续有界,$\theta(s,\lambda)$ 由初值 $\theta(0,\lambda)=\alpha$ 确定.则对固定的 $s>0$, $\theta(s,\lambda)$ 关于 $\lambda$ 严格递增.

证明的要点如下:将 $\theta'$ 的方程对 $\lambda$ 求导,得到

$$
\left(\partial_\lambda\theta\right)'
    =\bigl[\lambda+Q(s)-1\bigr]\sin(2\theta)\,\partial_\lambda\theta+\sin^2\theta,
$$

 且 $\partial_\lambda\theta(0,\lambda)=0$.由此可推出

$$
\partial_\lambda\theta(s,\lambda)=\int_0^s\sin^2\theta(t,\lambda)\,
    \exp\!\left(\int_t^s \bigl[\lambda+Q(u)-1\bigr]\sin(2\theta(u,\lambda))\,du\right)dt>0.
$$

 因此在右端点定义

$$
w(\lambda):=\theta(c,\lambda),
$$

 则 $w$ 是关于 $\lambda$ 的严格递增函数.

进一步需要知道 $w(\lambda)$ 在 $\lambda\to+\infty$ 时的增长.

> [!note] 引理. 相位增长下界

设 $Q\in L^1(0,c)$,$\theta(0,\lambda)=\alpha$.则存在只依赖 $\alpha,c$ 的常数 $C$,使得对 $\lambda>0$,

$$
\theta(c,\lambda)
        \ge c\sqrt{\lambda}-C
        -\frac{1}{\sqrt{\lambda}}\int_0^c|Q(s)|\,ds.
$$

 特别地,$\theta(c,\lambda)\to+\infty$($\lambda\to+\infty$).

**证明.**

令 $\phi$ 由 $\tan\phi=\sqrt{\lambda}\tan\theta$ 定义,取连续分支使 $|\phi-\theta|<\pi/2$.求导得

$$
\sec^2\phi\,\phi'=\sqrt{\lambda}\sec^2\theta\,\theta'.
$$

 由 $\sec^2\phi=1+\lambda\tan^2\theta$ 及相位方程可得

$$
\phi'=\sqrt{\lambda}+\frac{Q}{\sqrt{\lambda}}\sin^2\phi.
$$

 积分并用 $\sin^2\phi\le1$ 得

$$
\phi(c,\lambda)\ge\phi(0,\lambda)+c\sqrt{\lambda}
        -\frac{1}{\sqrt{\lambda}}\int_0^c|Q|.
$$

 又 $|\phi(0,\lambda)-\alpha|<\pi/2$,故 $\phi(0,\lambda)$ 有界; 由 $\theta\ge\phi-\pi/2$ 即得所述下界. $\square$

> [!note] 定理. 特征值存在性

$w(\lambda)=\theta(c,\lambda)$ 连续且严格递增,并且 $w(\lambda)\to+\infty$($\lambda\to+\infty$). 因此对每个充分大的整数 $k$,方程

$$
w(\lambda)=\beta+k\pi
$$

 恰有一个解, 可记为 $\lambda^{(k)}$. 这些解随相位整数 $k$ 增大而趋于 $+\infty$. 这里 $k$ 标记右端相位水平, 尚不等同于从最低特征值开始的谱排序序号. 第7章先建立从 $n=1$ 开始的全谱排序, 再在正则 Dirichlet 情形证明 第 $n$ 个特征值对应相位 $n\pi$.

> [!note] 推论. 结点计数

若 $\lambda+Q(s)>0$ 于 $[0,c]$, 则 $\theta(s,\lambda)$ 关于 $s$ 严格递增. 设 $\theta(0,\lambda)=0$ 且 $\theta(c,\lambda)=k\pi$,$k\in\mathbb N$, 则相应特征函数在 $(0,c)$ 内恰有 $k-1$ 个零点.

**证明.**

当 $\lambda+Q>0$ 时, $\theta'=\cos^2\theta+(\lambda+Q)\sin^2\theta>0$, 故 $\theta$ 严格递增. 零点对应 $\theta\equiv0\pmod\pi$;从 $0$ 到 $k\pi$ 严格递增的相位 恰好穿过 $\pi,2\pi,\dots,(k-1)\pi$ 各一次,故零点数为 $k-1$. $\square$

## 习题

##### 习题 2.1

**[基础]** 当 $p=r=1$,$q=0$ 时,计算 Liouville 变换中的 $s$ 与 $c$, 并验证标准形就是原方程.

##### 习题 2.2

**[基础]** 设 $p=1$,$r=x^2$,求自变量变换 $s=s(x)$.

##### 习题 2.3

**[主线]** 利用 $A=f'/\theta$ 证明 $A'/(f\theta)=F''/F$, 其中 $F(s)=f(x(s))$.

##### 习题 2.4

**[主线]** 对 $p=1$,$r=x^2$,$q=0$,计算 $F(s)$ 与 $Q(s)$, 并写出标准形.

##### 习题 2.5

**[拓展]** 对 Legendre 方程 $-((1-x^2)y')'=\lambda y$, $x\in(-1,1)$,计算 $s(x)$,$F(s)$,$Q(s)$, 并说明为什么变换后的势在 $s=\pm\pi/2$ 发散.

##### 习题 2.6

**[主线]** 由 $\varphi=\rho\sin\theta$,$\varphi'=\rho\cos\theta$ 推导 $\theta'=\cos^2\theta+[\lambda+Q(s)]\sin^2\theta$.

##### 习题 2.7

**[主线]** 证明边界条件 $z(c)\cos\beta-z'(c)\sin\beta=0$ 等价于 $\theta(c)=\beta+k\pi$.

##### 习题 2.8

**[主线]** 对 $Q\equiv0$,$[0,c]=[0,\pi]$, 取两端 Dirichlet 条件及 $\theta(0,\lambda)=0$. 对 $\lambda>0$ 写出连续相位 $\theta(s,\lambda)$, 求首个特征值, 并说明 $\lambda\le0$ 被排除.

##### 习题 2.9

**[拓展]** 验证变换 $\tan\phi=\sqrt{\lambda}\tan\theta$ 把相位方程变为 $\phi'=\sqrt{\lambda}+(Q/\sqrt{\lambda})\sin^2\phi$, 并用它证明 $\theta(c,\lambda)\to+\infty$.

本节习题解答见本页末的习题解答.

##### 习题提示.

\(3\) 由 $F_s=f'/\theta=A$ 得 $F_{ss}=A'/\theta$. (4) $F=(2s)^{1/4}$,$F''/F=-3/(16s^2)$,故 $Q=3/(16s^2)$. (5) $s=\arcsin x$,$F=\sqrt{\cos s}$, $F''/F=-\frac12-\frac14\tan^2s$,故 $Q=\frac12+\frac14\tan^2s$. (8) 取 $\sqrt\lambda\cos(\sqrt\lambda s)+i\sin(\sqrt\lambda s)$ 的连续辐角, 初值为零. 主值 $\arctan$ 仅在局部给出相位模 $\pi$ 的表达式. $\theta(\pi)=k\pi$ 给出 $\lambda=k^2$, $k\ge1$. (9) 积分 $\phi'$ 的表达式并用 $\sin^2\phi\le1$; $\phi(0,\lambda)$ 有界,故下界随 $\sqrt{\lambda}$ 增长. $\square$

## 本章小结

通过自变量与因变量变换,一般 SL 方程化为标准形;Prüfer 变换把二阶方程变成一阶相位方程,为特征值计数与存在性提供工具.

## 标准参考与延伸阅读

- A. Zettl, *Sturm--Liouville Theory*, Ch. 4 §4.5, Theorem 4.5.1--4.5.3: Prüfer 变换的存在唯一性与相位方程.

- A. Zettl, Ch. 4 §4.6:分离边界条件下的特征值存在性与结点计数.

- A. Zettl, Ch. 3 §3.2:特征值的超越方程刻画.

## 习题解答

#### 习题 2.1 的解答.

**[基础]** 在一般区间 $[a,b]$, $c=b-a$, $s=x-a$, $F=1$, $Q=0$. 因而 $z''+\lambda z=0$.

#### 习题 2.2 的解答.

**[基础]** 取 $s(0)=0$, 则 $s=\int_0^x t\,dt=x^2/2$, $c=1/2$. 不能同时把 $s$ 写成 $x^2$ 而不缩放谱参数.

#### 习题 2.3 的解答.

**[主线]** 因为 $F_s=f'/\theta=A$,所以



$$
F_{ss}=\frac{dA}{ds}=\frac{A'}{\theta}.
$$



又 $F=f$,故



$$
\frac{F_{ss}}{F}=\frac{A'}{\theta f}=\frac{A'}{f\theta}.
$$



#### 习题 2.4 的解答.

**[主线]** 由 $s'(x)=x$ 得 $s=x^2/2$,$x=\sqrt{2s}$,



$$
F(s)=\bigl(x^2\bigr)^{1/4}=x^{1/2}=(2s)^{1/4}.
$$



计算



$$
F'(s)=\frac14(2s)^{-3/4}\cdot2=\frac12(2s)^{-3/4},
$$





$$
F''(s)=-\frac38(2s)^{-7/4}\cdot2
=-\frac34(2s)^{-7/4}.
$$



因此



$$
\frac{F''}{F}
=-\frac34(2s)^{-7/4}(2s)^{-1/4}
=-\frac34(2s)^{-2}
=-\frac{3}{16s^2},
$$



故 $Q(s)=3/(16s^2)$,标准形为 $z''+[\lambda+3/(16s^2)]z=0$.

#### 习题 2.5 的解答.

**[拓展]** 由 $s'(x)=1/\sqrt{1-x^2}$ 得 $s=\arcsin x$, 所以 $x=\sin s$,$F(s)=(1-x^2)^{1/4}=(\cos^2s)^{1/4}=\sqrt{\cos s}$. 记 $c=\cos s$,则



$$
F'=-\frac12\sin s\,c^{-1/2},
$$





$$
F''=-\frac12c^{1/2}-\frac14\sin^2s\,c^{-3/2}.
$$



因此



$$
\frac{F''}{F}
=-\frac12-\frac14\tan^2s,
$$



故



$$
Q(s)=\frac12+\frac14\tan^2s.
$$



当 $s\to\pm\pi/2$ 时 $\tan^2s\to+\infty$,势发散; 这正对应原方程在 $x=\pm1$ 处 $p=1-x^2$ 退化的奇异端点.

#### 习题 2.6 的解答.

**[主线]** 由 $\theta=\arctan(\varphi/\varphi')$,



$$
\theta'=\frac{\varphi'^2-\varphi\varphi''}{\varphi'^2+\varphi^2}.
$$



代入 $\varphi''=-[\lambda+Q]\varphi$ 以及 $\varphi'^2+\varphi^2=\rho^2$,即得结论.

#### 习题 2.7 的解答.

**[主线]** 代入 $z=\rho\sin\theta$,$z'=\rho\cos\theta$ 得



$$
\sin\theta\cos\beta-\cos\theta\sin\beta
=\sin(\theta-\beta)=0,
$$



因此 $\theta(c)=\beta+k\pi$,$k\in\mathbb{Z}$.

#### 习题 2.8 的解答.

**[主线]** 当 $Q=0$ 且 $\lambda>0$ 时, 令 $k=\sqrt\lambda$. 满足左端条件的解及连续相位可写为



$$
z=\sin(ks),\qquad \theta(s)=\operatorname{Arg}_{\mathrm{cont}}(k\cos(ks)+i\sin(ks)),\quad\theta(0)=0.
$$



Dirichlet 条件 $z(\pi)=0$ 要求 $k\pi=j\pi$, $j\in\mathbb N_+$, 即 $\lambda=j^2$, 故正特征值为 $1,4,9,\ldots$. 对任意两端为零的本征函数, 分部积分得 $\int|z'|^2=\lambda\int|z|^2$, 排除 $\lambda<0$; 若 $\lambda=0$, 则 $z$ 为常数, 两端为零迫使它平凡. 因此最小特征值为 $\lambda_1=1$. 连续辐角会越过主值分支, 不能一直用主值 $\arctan$ 代替.

#### 习题 2.9 的解答.

**[拓展]** 由 $\tan\phi=\sqrt{\lambda}\tan\theta$ 得



$$
\sec^2\phi\,\phi'=\sqrt{\lambda}\sec^2\theta\,\theta'.
$$



又 $\sec^2\phi=1+\lambda\tan^2\theta$,且



$$
\theta'=\cos^2\theta+(\lambda+Q)\sin^2\theta
=\frac{1+(\lambda+Q)\tan^2\theta}{\sec^2\theta},
$$



所以



$$
\phi'
=\sqrt{\lambda}\frac{1+(\lambda+Q)\tan^2\theta}
{1+\lambda\tan^2\theta}
=\sqrt{\lambda}+\frac{Q}{\sqrt{\lambda}}\sin^2\phi.
$$



把上式在 $[0,c]$ 上积分:



$$
\phi(c,\lambda)
\ge\phi(0,\lambda)+c\sqrt{\lambda}
-\frac{1}{\sqrt{\lambda}}\int_0^c|Q|.
$$



由于 $\phi(0,\lambda)$ 有界,右端当 $\lambda\to+\infty$ 时趋于 $+\infty$.又 $|\phi-\theta|<\pi/2$,故 $\theta(c,\lambda)\to+\infty$.于是对每个充分大的整数 $k$, 连续严格递增函数 $w(\lambda)=\theta(c,\lambda)$ 必与水平线 $\beta+k\pi$ 相交一次,给出一个特征值;$k$ 任意大, 故特征值有无穷多个且趋于 $+\infty$.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[02_正则Sturm-Liouville问题|上一章]]
- [[05_Sturm比较定理与零点交错|下一章]]
