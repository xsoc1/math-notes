---
title: Green 函数,紧预解式与自伴性
date: '2026-10-08'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- Green 函数
- 预解式
- 紧预解式
stage_type: lecture
prerequisites:
- '[[07_自伴边界条件与Hilbert空间框架]]'
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\06_green.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
lecture_chapter: 6
---

# 第 6 章 Green 函数,紧预解式与自伴性
> [!info] 阅读位置
> 本页对应新版第 6 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
用 ODE 构造逆算子, 证明它紧且对称, 再闭合无界算子的自伴性证明.

> [!question] 基本问题
如何从一个点源的响应得到整个谱理论的入口?

沿用第 5 章的正则系数 (5.4), 主线采用分离边界条件 (5.5). 记 $H=L^2_r$, $Lu=-(pu')'+qu$, $A=r^{-1}L$, $D(A)$ 为 (5.6). 本章从带右端的边值问题构造逆算子. Green 核给出解的表达式与估计, 从而建立预解点,自伴性和紧性; 第 7 章再利用这些结果证明谱完备性.

## 低于下界的参数与左右解

第 5 章已给出 $Q[u]\ge-C_0\|u\|_r^2$. 固定实数 $\zeta<-C_0$. 若 $(A-\zeta I)u=0$, 则

$$
0=((A-\zeta I)u,u)_r=Q[u]-\zeta\|u\|_r^2
        \ge(-C_0-\zeta)\|u\|_r^2,
$$

 所以 $u=0$. 这个单射性只用下界, 尚未用完备特征函数系.

令 $\varphi$ 为满足左端条件的非零实解, $\psi$ 为满足右端条件的非零实解, 都解

$$
-(py')'+(q-\zeta r)y=0.
$$

 可用初始数据 $(y,py')=(0,1)$ 处理 Dirichlet, 用 $(1,h_a)$ 处理左 Robin, 用 $(1,-h_b)$ 处理右 Robin.

> [!note] 引理. 加权 Wronskian

$W=\varphi\psi'-\varphi'\psi$ 满足 $D=pW$ 为非零常数.

**证明.**

将方程写成 $(py')'=(q-\zeta r)y$. 因而

$$
(pW)'=\varphi(p\psi')'-(p\varphi')'\psi
        =\varphi(q-\zeta r)\psi-(q-\zeta r)\varphi\psi=0.
$$

 若 $D=0$, 两解的初始向量相关, 由 ODE 唯一性它们处处相关, 从而有非零解同时满足两端条件, 与上面的单射性矛盾. $\square$

## Green 核及其测度约定

> [!note] 定义. Green 核

对 $a\le x,t\le b$, 定义

$$
G_\zeta(x,t)=-\frac1D
        \begin{cases}
            \varphi(x)\psi(t),&x\le t,\\
            \varphi(t)\psi(x),&t\le x.
        \end{cases}
$$

 它对应的积分算子为

$$
(Tf)(x)=\int_a^bG_\zeta(x,t)f(t)r(t)\,dt.
$$

 这里核相对于测度 $d\mu(t)=r(t)\,dt$ 定义, 所以核就是 $G_\zeta$, 不是 $G_\zeta r$.

> [!note] 定理. 点源响应的三个条件

$G_\zeta$ 在闭正方形上连续,实对称, 对 $t\in(a,b)$ 满足两端边界条件, 且

$$
G_x(t+,t)-G_x(t-,t)=-\frac1{p(t)}.
$$

 因此 $(-(p\partial_x)'+q-\zeta r)G_\zeta(x,t)=\delta_t$ 在分布意义下成立.

**证明.**

对角线上两个表达式均为 $-\varphi(t)\psi(t)/D$, 故连续. 常数分母和两个分支交换给出 $G(x,t)=G(t,x)$. 在 $x<t$ 和 $x>t$ 上分别是齐次方程的解. 跳量为

$$
-\frac{\varphi(t)\psi'(t)-\varphi'(t)\psi(t)}D=-\frac1{p(t)}.
$$

 对光滑紧支撑测试函数分段积分, 连续性消去函数值跳量, 通量跳量贡献 $-p(t)[G_x]_{t-}^{t+}=1$, 得到 $\delta_t$. 左端由 $\varphi$,右端由 $\psi$ 保证边界条件. $\square$

> [!note] 定理. 逆算子的存在性与正则性

$T$ 是 $A-\zeta I:D(A)\to H$ 的双侧逆, 并且 $T:H\to H^2(a,b)$ 有界.

**证明.**

对 $f\in H$, 令 $F=rf\in L^2(a,b)$, 写成

$$
y(x)=-\frac1D\left[\psi(x)\int_a^x\varphi(t)F(t)\,dt
        +\varphi(x)\int_x^b\psi(t)F(t)\,dt\right].
$$

 两个积分绝对连续. 求导时含 $F(x)$ 的两项相消, 所以

$$
y'(x)=-\frac1D\left[\psi'(x)\int_a^x\varphi F
        +\varphi'(x)\int_x^b\psi F\right].
$$

 由 Cauchy--Schwarz, $y,y'$ 连续且一致范数由 $C\|f\|_r$ 控制. 再对 $py'$ 求弱导数, 用 $pW=D$, 得

$$
(py')'=(q-\zeta r)y-F.
$$

 因此 $y''=p^{-1}((q-\zeta r)y-F-p'y')\in L^2$, 且 $\|y\|_{H^2}\le C\|f\|_r$. 在两端代入 $y,y'$ 的公式验证边界条件, 得 $y\in D(A)$ 和 $(A-\zeta I)y=f$. 反向对 $u\in D(A)$, $u-T(A-\zeta I)u$ 满足齐次问题, 由单射性为零. $\square$

> [!note] 定义. 预解集与谱

对闭稠定算子 $A$, 若 $A-zI:D(A)\to H$ 双射且逆作为 $H\to H$ 的算子有界, 称 $z$ 属于预解集 $\rho(A)$. 谱为 $\sigma(A)=\mathbb C\setminus\rho(A)$, 预解算子记 $R_z=(A-zI)^{-1}$. 本章已经直接证明 $\zeta\in\rho(A)$.

## 从核的对称性到紧性

> [!note] 定理. 实预解算子的对称性,正性与紧性

$T=R_\zeta$ 是 $H$ 上有界自伴,单射,正的紧算子. 其中正性指 $(Tf,f)_r>0$ 对 $f\ne0$ 成立, 但不主张存在统一的正下界乘以 $\|f\|_r^2$.

**证明.**

因 $G$ 连续且 $\mu([a,b])<\infty$, Cauchy--Schwarz 保证下列双重积分绝对可积. Fubini 与 $G(x,t)=G(t,x)\in\mathbb R$ 给出

$$
(Tf,g)_r=\int_a^b\!\int_a^bG(x,t)f(t)\overline{g(x)}\,d\mu(t)d\mu(x)
        =(f,Tg)_r.
$$

 一个定义在整个 $H$ 上的有界对称算子, 由伴随定义即是自伴算子. 若 $u=Tf$, 则

$$
(Tf,f)_r=(u,(A-\zeta I)u)_r
        =Q[u]-\zeta\|u\|_r^2>0
$$

 当 $f\ne0$ 时 $u\ne0$. 紧性可由 $T:H\to H^2\hookrightarrow H^1$ 有界与第 5 章 $H^1\hookrightarrow H$ 紧立即得到. 另一个直接看核的证明也很有用: 以正方形细网格上的阶梯核 $G_m$ 一致逼近 $G$. 相应积分算子的值域包含在有限个区间指示函数张成的空间中, 因而为有限秩. 且

$$
\|T-T_m\|\le\mu([a,b])\|G-G_m\|_\infty\longrightarrow0.
$$

 有限秩算子将有界列映入有限维有界集, 可取收敛子列. 对 $m=1,2,\ldots$ 逐次取子列并作对角线选择, 算子范数逼近使 $Tf_{n_k}$ 为 Cauchy 列, 证明紧性. $\square$

> [!note] 注. 同一积分算子的两种核表示

若改用普通 Lebesgue 积分写 $Tf(x)=\int K(x,t)f(t)\,dt$, 则 $K(x,t)=G(x,t)r(t)$, 一般 $K(x,t)\ne K(t,x)$. $L^2_r$ 中正确的关系是 $r(x)K(x,t)=r(t)\overline{K(t,x)}$. 在等距变换 $Uf=\sqrt r f$ 下, 普通 $L^2$ 中的核为 $\sqrt{r(x)r(t)}G(x,t)$, 才是实对称核. 带权 Hilbert--Schmidt 积分相应为 $\int\!\int |G(x,t)|^2r(x)r(t)\,dxdt<\infty$.

## 一个实满射点足以证明自伴

> [!note] 定理. 实满射点判据

设 $A$ 稠定且对称. 若对某实数 $\zeta$, $\operatorname{ran}(A-\zeta I)=H$, 则 $A=A^*$.

**证明.**

对称性给出 $A\subset A^*$. 任取 $g\in D(A^*)$, 满射性使我们能选 $u\in D(A)$ 满足 $(A-\zeta I)u=(A^*-\zeta I)g$. 令 $w=g-u$, 则 $w\in D(A^*)$ 且 $(A^*-\zeta I)w=0$. 对任意 $v\in D(A)$,

$$
((A-\zeta I)v,w)_r=(v,(A^*-\zeta I)w)_r=0.
$$

 满射性说明 $w$ 与 $H$ 中每个向量正交, 故 $w=0$. 于是 $g=u\in D(A)$, 得 $D(A^*)\subset D(A)$ 和作用一致. $\square$

> [!note] 推论. 正则分离问题自伴

第 5 章定义的正则 SL 算子 $A$ 自伴, 且有紧预解算子 $R_\zeta$. 此结论尚未用到紧自伴谱定理.

**证明.**

$A$ 稠定,对称已在第 5 章证明, 本章 Green 公式证明了 $A-\zeta I$ 满射. 应用实满射点判据即可. $\square$

> [!note] 命题. 周期与反周期的同一路径

第 5 章的周期/反周期 $H^2$ 算子同样自伴并具有紧预解式.

**证明.**

取 $\zeta$ 低于相应积分型下界. 对非齐次方程令 $Y=(y,py')^T$, 则

$$
Y'=\begin{pmatrix}0&1/p\\q-\zeta r&0\end{pmatrix}Y+\binom0{-rf}.
$$

 设基本解矩阵 $\Phi(a)=I$. 变常数公式给出 $Y(x)=\Phi(x)\{c+\int_a^x\Phi(t)^{-1}(0,-rf(t))^T\,dt\}$. 边界条件 $Y(b)=\sigma Y(a)$ 化为关于 $c\in\mathbb C^2$ 的线性方程, 系数矩阵是 $\Phi(b)-\sigma I$. 若此矩阵有非零核, 就得到非零齐次解, 与能量下界矛盾. 因而矩阵可逆, 对任意 $f$ 有唯一解. 公式与 $L^2$ 估计给出 $H^2$ 有界性. 紧嵌入和实满射点判据分别给出紧性,自伴性. $\square$

## 两个可直接验算的核

> [!example] 例. Dirichlet 核与均匀点源

对 $-y''=f$ 在 $[0,1]$, $y(0)=y(1)=0$, 取 $\zeta=0$, $\varphi=x$, $\psi=1-x$, $D=-1$. 齐次问题只有零解, 因而同样的 Green 构造适用, 得

$$
G_0(x,t)=\begin{cases}x(1-t),&x\le t,\\t(1-x),&t\le x.\end{cases}
$$

 $f=1$ 时 $y(x)=\int_0^1G_0(x,t)\,dt=x(1-x)/2$, 与两次积分所得完全一致. 此处实预解点不必是负数; 只要齐次问题无非零解即可.

> [!example] 例. Neumann 问题必须处理零模态

对 $-y''$ 在 $[0,1]$ 的 Neumann 问题, 常数在核中, 因而 $A^{-1}$ 不存在. 对 $A+\kappa^2I$, $\kappa>0$, 取

$$
\varphi(x)=\cosh(\kappa x),\quad \psi(x)=\cosh(\kappa(1-x)),\quad D=-\kappa\sinh\kappa.
$$

 因此

$$
G_{-\kappa^2}(x,t)=\frac{\cosh(\kappa\min\{x,t\})\cosh(\kappa(1-\max\{x,t\}))}{\kappa\sinh\kappa}.
$$

 对常数输入 $f=1$, 解为 $1/\kappa^2$, 所以 $\int_0^1G_{-\kappa^2}(x,t)\,dt=1/\kappa^2$.

## 习题

##### 习题 6.1

**[主线]** 由 (6.1) 逐项验证连续性,通量跳量和两端边界条件.

##### 习题 6.2

**[基础]** 对 $-y''=f$, $y(0)=0$, $y'(1)+y(1)=0$, 构造零参数的 Green 核, 并求 $f=1$ 的解.

##### 习题 6.3

**[主线]** 取上面的 Dirichlet 核和 $r(t)=1+t$. 验证 $K(x,t)=G_0(x,t)(1+t)$ 一般不对称, 但相应算子在 $L^2_r$ 中自伴.

##### 习题 6.4

**[基础]** 推导 Neumann 平移核, 并证明它对 $t$ 的积分为 $1/\kappa^2$.

##### 习题 6.5

**[主线]** 若 $z,w\in\rho(A)$, 证明 $R_z-R_w=(z-w)R_zR_w$, 并由此证明只要一个预解算子紧, 所有预解算子都紧.

本节习题解答见本页末的习题解答.

## 本章小结

能量下界先给出齐次问题唯一性, Green 公式再给出 $L^2$ 右端的 $H^2$ 解. 因而存在实预解点, 无界算子的自伴性得以闭合. 连续核或 Sobolev 紧嵌入给出紧预解式; 特征函数的完备性仍需第 7 章的谱定理.

## 标准参考与延伸阅读

本章给出正则情形的完整证明. 延伸阅读: G. Teschl, *Mathematical Methods in Quantum Mechanics*, 作者在线的 2009 版, §2.4 (预解式), §6.3 (Hilbert--Schmidt 算子), §9.1 (Sturm--Liouville 算子).

## 习题解答

#### 习题 6.1 的解答

**[主线]** 在 $x=t$ 两支的值均为 $-\varphi(t)\psi(t)/D$. 两侧导数之差为 $-(\varphi(t)\psi'(t)-\varphi'(t)\psi(t))/D=-1/p(t)$, 故通量跳量为 $-1$. 在左端, $G$ 及其导数关于 $x$ 的边界数据均为 $\varphi$ 数据的同一倍数, 满足左条件; 右端用 $\psi$ 同理. 对角点 $t=a,b$ 不影响积分算子, 点源跳量陈述用于内部 $t$.

#### 习题 6.2 的解答

**[基础]** 取 $\varphi(x)=x$, $\psi(x)=2-x$, 则 $\psi'(1)+\psi(1)=0$, $D=W=-2$. 故

$$
G_0(x,t)=\frac12\begin{cases}x(2-t),&x\le t,\\t(2-x),&t\le x.\end{cases}
$$

 对 $f=1$, $y=-x^2/2+Cx$, 右条件给出 $(-1+C)+(-1/2+C)=0$, 所以 $C=3/4$ 且 $y=3x/4-x^2/2$. 由核积分,

$$
y(x)=\frac{2-x}{2}\int_0^xt\,dt+\frac x2\int_x^1(2-t)\,dt
        =\frac{3x}{4}-\frac{x^2}{2},
$$

 两种计算一致.

#### 习题 6.3 的解答

**[主线]** 例如 $x=1/4,t=3/4$, $G_0(x,t)=1/16$, 但 $K(x,t)=7/64$, $K(t,x)=5/64$, 不相等. 正确关系为 $r(x)K(x,t)=r(x)r(t)G_0(x,t)=r(t)K(t,x)$. 对任意 $f,g\in L^2_r$, 双重积分绝对可积, 交换次序后得到 $(Tf,g)_r=(f,Tg)_r$. $T$ 全域有界, 所以自伴.

#### 习题 6.4 的解答

**[基础]** 取 $\varphi=\cosh(\kappa x)$, $\psi=\cosh(\kappa(1-x))$, 则 $W=-\kappa\sinh\kappa$. 代入 Green 公式即得正文核. 它对常数右端的积分解方程 $-y''+\kappa^2y=1$, 两端 Neumann. 常数 $y=1/\kappa^2$ 是解, 且齐次解的能量等式 $\int(|y'|^2+\kappa^2|y|^2)=0$ 给出唯一性, 所以核积分确为 $1/\kappa^2$.

#### 习题 6.5 的解答

**[主线]** 对 $f\in H$, 令 $u=R_wf\in D(A)$. 则 $(A-z)u=f+(w-z)u$. 作用 $R_z$ 得 $R_wf=R_zf+(w-z)R_zR_wf$, 即所需恒等式. 若 $R_w$ 紧, 则 $R_zR_w$ 紧, 因为有界算子保持收敛. 于是 $R_z=R_w+(z-w)R_zR_w$ 是两个紧算子之和, 仍紧. 和的紧性用连续选取两个收敛子列证明.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[07_自伴边界条件与Hilbert空间框架|上一章]]
- [[10_完备性与Fourier收敛|下一章]]

## 跨主题参照

- [[泛函分析/03_紧性与函数族/02_Ascoli定理与紧性判别#3. 连续核积分算子的紧性|Ascoli定理与紧性判别]]。比较连续核如何产生等度连续族，以及紧性的函数空间判据。
- [[数学物理方程/04_格林函数#4.1 格林函数及其表示公式|格林函数]]。对照高维 Poisson 边值问题中 Green 函数的边界与体积分表示。
