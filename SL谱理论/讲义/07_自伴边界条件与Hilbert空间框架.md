---
title: 一维 Sobolev 空间,算子域与边界形式
date: '2026-09-22'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- 自伴边界条件
- SL 算子
- Sturm-Liouville 算子
stage_type: lecture
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\05_self_adjoint.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
prerequisites:
- '[[06_特征函数正交性与广义Fourier级数]]'
lecture_chapter: 5
---

# 第 5 章 一维 Sobolev 空间,算子域与边界形式
> [!info] 阅读位置
> 本页对应新版第 5 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
补齐弱导数,迹与图范数, 精确区分算子域和能量型域.

> [!question] 基本问题
边界条件究竟应施加在哪一种函数空间上?

## 绝对连续函数与弱导数

> [!note] 定义. 绝对连续与弱导数

函数 $u:[a,b]\to\mathbb C$ 绝对连续, 指对任意 $\varepsilon>0$, 存在 $\delta>0$, 使任意有限个互不相交的区间 $(a_j,b_j)$ 若满足 $\sum_j(b_j-a_j)<\delta$, 则 $\sum_j|u(b_j)-u(a_j)|<\varepsilon$. 记为 $u\in AC[a,b]$. 对 $u,v\in L^1(a,b)$, 若

$$
\int_a^bu\phi'\,dx=-\int_a^bv\phi\,dx\quad(\phi\in C_c^\infty(a,b)),
$$

 称 $v$ 为 $u$ 的弱导数, 记 $u'=v$. 定义

$$
H^1(a,b)=\{u\in L^2:u'\in L^2\},\qquad
        H^2(a,b)=\{u\in H^1:u'\in H^1\},
$$

 并取范数 $\|u\|_{H^k}^2=\sum_{j=0}^k\|u^{(j)}\|_2^2$.

实变函数课程中的绝对连续基本定理说: $u\in AC$ 当且仅当 $u(x)=u(a)+\int_a^xg(t)\,dt$ 对某个 $g\in L^1$ 成立; 此时经典导数几乎处处存在且等于 $g$. 我们把这个积分基本定理作为实变先修结论, 不把 Sobolev 理论列为先修.

> [!note] 引理. 一维弱导数的积分表示

$u\in H^1$ 当且仅当其等价类有唯一的连续代表

$$
u(x)=c+\int_a^xv(t)\,dt,\qquad v\in L^2.
$$

 此时代表绝对连续, $v=u'$ 几乎处处, 且

$$
|u(x)-u(y)|\le\|u'\|_2|x-y|^{1/2}.
$$



**证明.**

若 $u$ 有弱导数 $v$, 令 $U(x)=\int_a^xv$. Fubini 定理直接给出 $U'=v$ 的弱导数恒等式, 所以 $w=u-U$ 的弱导数为零. 若 $\eta\in C_c^\infty$ 且 $\int\eta=0$, 则 $\phi(x)=\int_a^x\eta$ 属于 $C_c^\infty$, 故 $\int w\eta=0$. 固定 $\rho\in C_c^\infty$ 满足 $\int\rho=1$, 任意测试函数 $\eta$ 减去 $(\int\eta)\rho$ 后积分为零, 因而

$$
\int w\eta=c\int\eta,\qquad c=\int w\rho.
$$

 于是 $w=c$ 几乎处处. 为说明这一步, 若 $h\in L^1_{\rm loc}$ 与所有光滑紧支撑函数积分为零, 对任意内部闭区间 $[\alpha,\beta]$ 取 $0\le\eta_j\le1$ 的光滑截断, 支持在一个固定内部紧区间, 并使 $\eta_j\to\mathbf1_{[\alpha,\beta]}$ 几乎处处. 这样的截断可把一个固定的光滑台阶函数分别平移缩放到两端后相乘得到. 控制收敛给 $\int_\alpha^\beta h=0$. 因此 $h$ 的局部积分原函数为常数, 绝对连续积分基本定理给 $h=0$ 几乎处处. 应用于 $h=w-c$ 即得所需结论. 反向由积分表示和 Fubini 得到. 连续代表的唯一性来自连续函数几乎处处为零则处处为零. 最后用 Cauchy--Schwarz 估计积分 $\int_y^xu'$. $\square$

> [!note] 定理. Sobolev 完备性,迹和分部积分

$H^1,H^2$ 都是 Hilbert 空间. 取上述连续代表后, $u(a),u(b)$ 是 $H^1$ 上的有界线性泛函; 对 $H^2$ 函数, $u'(a),u'(b)$ 也有意义并连续. 对 $u,v\in H^1$,

$$
\int_a^b u'\bar v\,dx+\int_a^bu\bar v'\,dx
        =u(b)\bar v(b)-u(a)\bar v(a).
$$



**证明.**

若 $u_n$ 在 $H^1$ 中是 Cauchy 列, 则 $u_n\to u$, $u_n'\to v$ 于 $L^2$. 在弱导数恒等式中取极限, 得 $u'=v$, 故在 $H^1$ 中收敛. 对 $H^2$ 再对导数应用同样论证. 内积取各阶导数内积之和. 令 $\ell=b-a$. 对任意 $0<\delta\le\ell$ 和 $x\in[a,a+\delta]$, 积分表示给出 $|u(a)|^2\le2|u(x)|^2+2\delta\|u'\|_2^2$. 对 $x$ 平均, 并在右端同样处理, 得

$$
|u(a)|^2+|u(b)|^2
        \le\frac4\delta\|u\|_2^2+4\delta\|u'\|_2^2.
$$

 这给出迹的连续性. 对 $H^2$ 中的 $u'$ 重复即可. $u\bar v$ 绝对连续, 导数为 $u'\bar v+u\bar v'\in L^1$, 积分基本定理即给出 (5.2). $\square$

> [!example] 例. 有尖点仍可属于能量空间

在 $[-1,1]$ 上, $u(x)=|x|$ 的弱导数是 $\operatorname{sgn}x$, 所以 $u\in H^1$. 它不在 $H^2$: 若在, 则其一阶弱导数应有连续代表, 但 $\operatorname{sgn}x$ 的左右极限不同. 相反, 阶跃函数本身不在 $H^1$, 因为它没有连续代表.

## 紧嵌入与闭的边界约束

> [!note] 定义. 紧算子与紧嵌入

有界线性映射 $T:X\to Y$ 若把每个有界序列映为具有收敛子列的序列, 称为紧算子. 若包含映射 $X\hookrightarrow Y$ 具有此性质, 称为紧嵌入.

> [!note] 定理. 一维能量空间的紧性

包含映射 $H^1(a,b)\hookrightarrow C[a,b]\hookrightarrow L^2_r(a,b)$ 的第一步是连续且紧的, 第二步连续. 因而 $H^1\hookrightarrow L^2_r$ 紧.

**证明.**

取一点 $y$ 使 $|u(y)|\le\ell^{-1/2}\|u\|_2$, 再用 (5.1), 得 $\|u\|_\infty\le\ell^{-1/2}\|u\|_2+\ell^{1/2}\|u'\|_2$. $H^1$ 有界列因此一致有界且具有共同的 $1/2$ 阶连续模. 在区间的一个可数稠密子集上逐点选子列, 用对角线法得到在该稠密集上收敛的子列. 给定 $\varepsilon$, 先用共同连续模选有限细网格, 再用网格点上的收敛, 得此子列在全区间上一致 Cauchy. 一致极限连续. 最后 $\|u\|_r\le(\int_a^br)^{1/2}\|u\|_\infty$. $\square$

本书用 $H_0^1(a,b)=\{u\in H^1:u(a)=u(b)=0\}$ 表示两端零迹空间. 它是 $H^1$ 的闭子空间. 此定义在区间上与 $C_c^\infty$ 的 $H^1$ 闭包相同: 零延拓后卷积, 再用稍向区间内部压缩的光滑逼近即可; 后文只需要上述零迹刻画.

## 精确的正则算子与边界形式

以下固定实系数

$$
p\in C^1[a,b],\quad p>0,\qquad q,r\in C[a,b],\quad r>0.
$$

 每个端点选择 Dirichlet 条件, 或选择一个实数 Robin 参数. 统一约定为

$$
u(a)=0\ \text{或}\ p(a)u'(a)=h_au(a),\qquad
        u(b)=0\ \text{或}\ p(b)u'(b)=-h_bu(b).
$$

 Neumann 对应 $h=0$. 若选 Dirichlet, 下文所有含该端点的 $h$ 项均省去.

> [!note] 定义. 算子域与型域

在 $H=L^2_r(a,b)$ 上定义

$$
Au=r^{-1}\bigl(-(pu')'+qu\bigr),\qquad
        D(A)=\{u\in H^2(a,b):u\text{ 满足 }(5.5)\}.
$$

 型域 $V$ 是 $H^1$ 中仅满足所选 Dirichlet 零迹条件的子空间. Robin 端点不在 $V$ 上限制导数. 定义 Hermite 型

$$
\mathfrak a(u,v)=\int_a^b(pu'\bar v'+qu\bar v)\,dx
        +h_au(a)\bar v(a)+h_bu(b)\bar v(b),\qquad Q[u]=\mathfrak a(u,u).
$$



$H^1$ 元素的端点导数一般没有定义, 因此不能在型域上直接施加 Robin 导数条件. $C_c^\infty(a,b)\subset D(A)$ 在 $L^2_r$ 中稠密, 所以 $A$ 稠定. 这里的稠密性可由简单函数逼近,将区间指示函数在端点小区间上平滑化得到, 再用带权范数等价.

> [!note] 定理. 边界形式与能量恒等式

对 $u,v\in H^2$,

$$
(Au,v)_r-(u,Av)_r
        =\bigl[p(u\bar v'-u'\bar v)\bigr]_a^b.
$$

 在 $D(A)$ 上右边为零; 更强地, 对 $u\in D(A),v\in V$ 有

$$
(Au,v)_r=\mathfrak a(u,v).
$$



**证明.**

因 $p\in C^1$, $u\in H^2$, 故 $pu'\in H^1$. 应用 (5.2) 两次得 (5.8). 应用一次则

$$
(Au,v)_r=\int_a^b(pu'\bar v'+qu\bar v)\,dx-[pu'\bar v]_a^b.
$$

 Dirichlet 端点的 $v$ 为零; Robin 端点代入 (5.5), 恰得到两个正号的 $h$ 项. 这也证明了对称性. $\square$

> [!example] 例. 弹性端点的能量

取 $p=r=1,q=0$, 区间 $[0,1]$, 两端 Robin. 则

$$
Q[u]=\int_0^1|u'|^2\,dx+h_a|u(0)|^2+h_b|u(1)|^2.
$$

 当 $h_a,h_b\ge0$ 时型非负, 端点项是弹性势能. 若 $h_a+h_b<0$, 常数的能量为负. 波动方程的守恒能量须包含端点项; 自伴性本身并不保证正性.

## 下界,图范数与闭算子

> [!note] 引理. 带边界能量的下界

存在 $c_0>0,C_0\ge0$, 对所有 $u\in V$ 有

$$
Q[u]\ge c_0\|u'\|_2^2-C_0\|u\|_r^2.
$$

 若 $\zeta<-C_0$, 则 $\mathfrak a_\zeta(u,v)=\mathfrak a(u,v)-\zeta(u,v)_r$ 是 $V$ 上的内积, 其范数与 $H^1$ 范数等价. 因而 $(V,\mathfrak a_\zeta)$ 是 Hilbert 空间.

**证明.**

$p_-=\min p>0$. 只需控制 $q$ 的负部和负 Robin 项. 用 (5.3) 并选充分小的 $\delta$, 使所有负边界项中 $\|u'\|_2^2$ 的系数之和至多 $p_-/2$. 剩余项由 $\|u\|_2^2\le r_-^{-1}\|u\|_r^2$ 控制, 即得 $c_0=p_-/2$ 和某个 $C_0$. 减去 $\zeta\|u\|_r^2$ 给出正下界; 上界由系数有界和迹连续性给出. $V$ 是 $H^1$ 的闭子空间, 故完备. $\square$

> [!note] 定义. 闭算子与图范数

算子 $A$ 闭, 指 $u_n\in D(A)$, $u_n\to u$, $Au_n\to f$ 于 $H$ 时, 必有 $u\in D(A)$ 且 $Au=f$. 图范数为 $\|u\|_A=(\|u\|_r^2+\|Au\|_r^2)^{1/2}$. 闭性等价于 $D(A)$ 在图范数下完备.

> [!note] 定理. 正则算子域上的椭圆估计与闭性

存在仅依赖固定系数,区间和边界条件的 $C$, 使

$$
C^{-1}\|u\|_{H^2}\le\|u\|_A\le C\|u\|_{H^2}\quad(u\in D(A)).
$$

 特别地, (5.6) 定义的是闭对称算子.

**证明.**

由 (5.9),(5.10) 及 Cauchy--Schwarz,

$$
c_0\|u'\|_2^2\le\|Au\|_r\|u\|_r+C_0\|u\|_r^2.
$$

 又 $pu''=qu-rAu-p'u'$, 故 $\|u''\|_2\le C(\|u\|_r+\|Au\|_r)$, 得左侧估计. 右侧由 $A$ 的表达式直接得到. 若 $u_n\to u$, $Au_n\to f$, 左侧估计使 $u_n$ 在 $H^2$ 中 Cauchy. 其 $H^2$ 极限与 $u$ 相同, 迹连续性保留边界条件, 微分表达式连续性给出 $Au=f$. $\square$

## 伴随与自伴: 需要再证明什么

> [!note] 定义. 伴随算子

对稠定算子 $A$, 令

$$
D(A^*)=\{v\in H:\exists w\in H,\ (Au,v)_r=(u,w)_r\ \forall u\in D(A)\},\qquad A^*v=w.
$$

 稠密性保证 $w$ 唯一. 若 $A\subset A^*$ 称对称; 若 $D(A)=D(A^*)$ 且作用相同, 称自伴.

本章已证明对称性和闭性. 第 6 章将构造一个实数 $\zeta$ 上的满射 $A-\zeta I$, 并以此证明定义域恰好等于伴随域. 这个证明不需要边界三元组.

> [!example] 例. 周期与反周期是耦合条件

也可取 $u(b)=\sigma u(a)$, $p(b)u'(b)=\sigma p(a)u'(a)$, $\sigma=1$ 或 $-1$. 型域为 $V_\sigma=\{u\in H^1:u(b)=\sigma u(a)\}$, 型为不含端点项的积分型. 两端的边界项相消, 前述下界与闭性证明仍成立. 对 $-u''$ 在 $[0,\pi]$, 周期谱为 $0,4,4,16,16,\ldots$; 反周期谱为 $1,1,9,9,\ldots$. 正谱中的二重性来自正弦,余弦两个方向, 因而不能把分离条件的单重性套用到耦合条件.

## 习题

1.  求 $|x|$ 在 $[-1,1]$ 上的弱导数, 并从定义验证它属于 $H^1$ 而不属于 $H^2$.

2.  证明 (5.3), 并说明对每个 $\varepsilon>0$, 可将右侧写成 $\varepsilon\|u'\|_2^2+C_\varepsilon\|u\|_2^2$.

3.  对 $u(0)=0$, $u'(1)+hu(1)=0$, 写出 $D(A)$,$V$ 和 $Q[u]$, 并证明 $(Au,u)=Q[u]$.

4.  若 $u\in V$ 且存在 $f\in L^2_r$ 使 $\mathfrak a(u,v)=(f,v)_r$ 对所有 $v\in V$ 成立, 证明 $u\in D(A)$ 且 $Au=f$.

5.  对上一例周期/反周期问题, 证明没有负特征值并确定零特征值的重数.

本节习题解答见本页末的习题解答.

## 本章小结

一维 $H^1$ 元素有绝对连续代表和端点迹, $H^2$ 才允许端点导数. 算子域施加完整边界条件, 型域只施加 Dirichlet 或耦合的值约束. Robin 条件通过边界能量进入型, 迹估计保证下界, 图范数估计保证闭性.

## 标准参考与延伸阅读

本章使用实变课程中的绝对连续积分基本定理, Fubini 定理及基本 $L^p$ 逼近; 测试函数基本引理已在正文补证. 延伸阅读: G. Teschl, *Mathematical Methods in Quantum Mechanics*, 作者在线的 2009 版, §2.2--§2.3 (伴随,闭算子和二次型), §2.7 (绝对连续函数).

## 习题解答

1.  对 $\phi\in C_c^\infty(-1,1)$ 在 $(-1,0)$ 和 $(0,1)$ 分段积分,

$$
\int_{-1}^1|x|\phi'(x)\,dx
            =\int_{-1}^0\phi(x)\,dx-\int_0^1\phi(x)\,dx
            =-\int_{-1}^1\operatorname{sgn}(x)\phi(x)\,dx.
$$

 $|x|$ 和 $\operatorname{sgn}x$ 都平方可积, 故属于 $H^1$. 若 $|x|\in H^2$, 则 $\operatorname{sgn}x\in H^1$ 应有连续代表, 但这样的代表在 $(-1,0)$ 必恒为 $-1$, 在 $(0,1)$ 必恒为 $1$, 不可能在零点连续.

2.  对 $x\in[a,a+\delta]$, $u(a)=u(x)-\int_a^xu'$, 所以 $|u(a)|^2\le2|u(x)|^2+2\delta\|u'\|_2^2$. 积分并除以 $\delta$, 得 $|u(a)|^2\le(2/\delta)\|u\|_2^2+2\delta\|u'\|_2^2$. 右端同理, 相加即为正文公式. 给定 $\varepsilon>0$, 取 $\delta=\min\{b-a,\varepsilon/4\}$, 得所需估计, $C_\varepsilon=4/\delta$.

3.  取 $A=-d^2/dx^2$,

$$
D(A)=\{u\in H^2(0,1):u(0)=0,\ u'(1)+hu(1)=0\},\quad
            V=\{u\in H^1(0,1):u(0)=0\},
$$



$$
Q[u]=\int_0^1|u'|^2\,dx+h|u(1)|^2.
$$

 分部积分给出 $(Au,u)=\int|u'|^2-u'(1)\bar u(1)+u'(0)\bar u(0)=Q[u]$. 对一般 $v\in V$, 同样得到 $(Au,v)=\mathfrak a(u,v)$.

4.  先取 $v\in C_c^\infty$, 得 $(pu')'=qu-rf\in L^2$ 的分布恒等式. 因 $pu'\in L^2$, 它属于 $H^1$; 乘以 $1/p\in C^1$ 得 $u'\in H^1$, 所以 $u\in H^2$. 现在可合法分部积分, 将 $\mathfrak a(u,v)-(f,v)_r$ 化为两端的 Robin 残差乘以端点值. 型域中未规定的端点值可以独立选取 (取相应仿射函数即可), 故各 Robin 残差为零. Dirichlet 条件原已满足. 因此 $u\in D(A)$, $Au=f$.

5.  设 $-u''=\lambda u$ 且 $u(\pi)=\sigma u(0)$, $u'(\pi)=\sigma u'(0)$, $\sigma=\pm1$. 分部积分的端点项相消, 得 $\lambda\|u\|_2^2=\|u'\|_2^2\ge0$, 无负特征值. 若 $\lambda=0$, 则 $u'=0$ 几乎处处, 所以 $u$ 常数. 周期条件允许任意常数, 零特征空间一维; 反周期要求常数等于其相反数, 只有零函数, 故零不是特征值.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[06_特征函数正交性与广义Fourier级数|上一章]]
- [[09_Green函数预解式与紧性|下一章]]
