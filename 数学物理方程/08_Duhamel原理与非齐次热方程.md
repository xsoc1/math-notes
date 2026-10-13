---
title: "§2.3 Duhamel 原理与非齐次热方程"
date: 2026-10-13
tags:
  - mathematical-physics
  - partial-differential-equations
  - lecture-notes
  - heat-equation
  - duhamel
source_chapter: "2.3"
note_type: "单元笔记"
sources:
  - "2.3 Duhamel 原理，27 页课件，正文第 2—26 页"
writing_skill: math-writing
status: "已整理；分开说明级数表示与经典导数核验"
---

# §2.3 Duhamel 原理与非齐次热方程

> [!abstract] 本单元的目标
> 把“初始就有的分布”和“后来不断加入的源项”分别推进到当前时刻。先用 ODE 积分因子算出每个系数，再解释时间积分为何有上限项，最后处理非零边界和周期复 Fourier 形式。

约定 $L>0$、$\kappa>0$，
$X_m(x)=\sin(m\pi x/L)$、
$\mu_m=\kappa(m\pi/L)^2$，$m\ge1$。
空间模态来自 [[07_初边值问题的分离变量法]]。整体阅读见
[[数学推导主线快速入门讲义#19. Duhamel 原理：把不断加入的源项逐时推进|整体讲义第 19 节]]。

## 1. 非齐次 ODE 是最直接的入口

对

$$
y'(t)+\mu y(t)=F(t),\qquad y(0)=y_0,
$$

乘积分因子 $e^{\mu t}$：

$$
\frac{d}{dt}(e^{\mu t}y(t))=e^{\mu t}F(t).
$$

在 $[0,t]$ 上积分，再乘 $e^{-\mu t}$，得到

$$
\boxed{
y(t)=e^{-\mu t}y_0
+\int_0^t e^{-\mu(t-s)}F(s)\,ds.}
$$

第一项推进初值；第二项把每个过去时刻 $s$ 加入的量推进了
$t-s$ 时间。这里 $s$ 是积分变量，$t$ 是仍然保留的观测时刻。

## 2. 零 Dirichlet 边界下逐模态求解

考虑

$$
\begin{cases}
u_t-\kappa u_{xx}=f(x,t),&0<x<L,\ t>0,\\
u(0,t)=u(L,t)=0,\\
u(x,0)=\varphi(x).
\end{cases}
$$

把数据的正弦系数记为

$$
\begin{aligned}
A_m&=\frac2L\int_0^L\varphi(\xi)X_m(\xi)\,d\xi,\\
F_m(t)&=\frac2L\int_0^L f(\xi,t)X_m(\xi)\,d\xi.
\end{aligned}
$$

积分后 $F_m$ 只依赖 $t$，不是仍然依赖 $\xi$ 的函数。

候选形式 $u=\sum_mU_m(t)X_m(x)$ 给出

$$
U_m'+\mu_mU_m=F_m,\qquad U_m(0)=A_m.
$$

利用第 1 节的 ODE 计算，得到

$$
\boxed{
u(x,t)=\sum_{m=1}^\infty
\left[
A_me^{-\mu_mt}
+\int_0^t e^{-\mu_m(t-s)}F_m(s)\,ds
\right]X_m(x).}
$$

这就是课件第 5—12 页的叠加：初值部分加零初值的强迫部分。只有原方程及边界条件线性，才能这样相加；不能照搬到 $u^2$ 等非线性项。

## 3. 从时刻 $s$ 启动的齐次问题

固定 $s$，令 $w(x,t;s)$ 解

$$
\begin{cases}
w_t-\kappa w_{xx}=0,&t>s,\\
w(x,s;s)=f(x,s),\\
w(0,t;s)=w(L,t;s)=0.
\end{cases}
$$

参数 $s$ 固定时它是齐次热方程；其“初始时刻”是 $s$，不是零。因此

$$
w(x,t;s)=\sum_m e^{-\mu_m(t-s)}F_m(s)X_m(x).
$$

用 $S(\tau)$ 表示把一份空间分布按齐次热方程推进 $\tau$ 时间的操作，便可将同一公式缩写为
$w(\cdot,t;s)=S(t-s)f(\cdot,s)$。$S$ 是作用于函数的线性算子，不是数，也不是 $f$ 的普通乘数。

源项造成的解为

$$
u_{\rm src}(x,t)=\int_0^t w(x,t;s)\,ds.
$$

若有允许下列导数和积分换序的控制，则 Leibniz 公式给出

$$
\begin{aligned}
\partial_tu_{\rm src}
&=w(x,t;t)+\int_0^t\partial_tw(x,t;s)\,ds\\
&=f(x,t)+\kappa\int_0^t w_{xx}(x,t;s)\,ds\\
&=f(x,t)+\kappa\partial_{xx}u_{\rm src}.
\end{aligned}
$$

源项正是来自**上限处的新加入项**。每个 $w$ 满足齐次方程，不代表它们的变上限积分也齐次。第 4 节给出一组足够的控制条件，不省略换序责任。

## 4. 原课件的连续数据与经典核验要分层

课件第 3 页取 $\varphi\in C^2$ 且端点、端点二阶导数为零，
$f$ 连续且端点为零。连续源项给出有意义的系数公式，但**单凭连续性不能无条件把两次空间求导移进整个无限和**。

### 4.1 连续有界源项：先核验函数值

在固定 $[0,T]$ 上，若 $|f|\le M$，则 $|F_m(t)|\le2M$。记

$$
V_m(t)=\int_0^t e^{-\mu_m(t-s)}F_m(s)\,ds.
$$

由于 $\mu_m=\kappa(m\pi/L)^2$，

$$
|V_m(t)|\le\frac{2M}{\mu_m}\le\frac{C}{m^2}.
$$

所以源项级数在空间和有限时间区间上绝对且一致收敛，零边界成立。每个 $V_m(t)\to0$，再用可求和上界，得到源项级数一致趋于零，初值也成立。

每个系数严格满足 $V_m'+\mu_mV_m=F_m$。函数值与系数方程已核验；要将它升级为具有连续 $u_t,u_{xx}$ 的经典解，还需控制导数级数。仅看到
$e^{-\mu_m(t-s)}$ 不够，因为积分上限附近 $t-s$ 可以趋于零。

### 4.2 一组易核验的充分条件

补充假设：$f,f_{xx}$ 在 $[0,L]\times[0,T]$ 上连续，
$f(0,t)=f(L,t)=0$。每个固定 $t$ 对空间作两次分部积分，得到

$$
|F_m(t)|\le\frac{C_T}{m^2},
$$

$C_T$ 与 $m,t$ 无关。由此

$$
|V_m|\le\frac{C_T}{m^2\mu_m},
\qquad
\mu_m|V_m|\le\frac{C_T}{m^2},
\qquad
|V_m'|\le\frac{2C_T}{m^2}.
$$

因此时间一阶、空间二阶导数级数都一致收敛。空间一阶导数也有更好的可求和界。初值项的导数在任意 $t\ge\delta>0$ 上由高斯衰减控制。

逐项求导后，

$$
u_t-\kappa u_{xx}
=\sum_mF_m(t)X_m(x)=f(x,t).
$$

最后一步使用 [[07_初边值问题的分离变量法#4. Fourier 系数：函数空间里的坐标|已证明的光滑零端点 Fourier 展开]]。至此经典方程、边界和初值分别核验完成；能量法再给唯一性。$\square$

这是一组**本笔记证明的充分条件**，不是悄悄把原课件的“$f$ 连续”改写成“$f_{xx}$ 连续”。更一般连续数据可用温和解或弱解理论处理；本单元不把函数值级数收敛冒充全部经典正则性。

## 5. 非零边界：提升函数将代价转移到源项

考虑两端温度为 $\mu_0(t)$、$\mu_L(t)$。取线性插值

$$
H(x,t)=\left(1-\frac xL\right)\mu_0(t)
+\frac xL\mu_L(t).
$$

它的作用是先满足边界，不是先解热方程。因为

$$
H(0,t)=\mu_0(t),\quad H(L,t)=\mu_L(t),
\quad H_{xx}=0,
$$

令 $v=u-H$，得到

$$
\begin{cases}
v_t-\kappa v_{xx}=f-H_t,\\
v(0,t)=v(L,t)=0,\\
v(x,0)=\varphi(x)-H(x,0).
\end{cases}
$$

相容性要求 $\varphi(0)=\mu_0(0)$、$\varphi(L)=\mu_L(0)$。若用了其他提升函数，一般应写
$f-H_t+\kappa H_{xx}$；这里最后一项消失是因为 $H$ 对空间线性。

令

$$
\begin{aligned}
D_m&=\frac2L\int_0^L[\varphi(\xi)-H(\xi,0)]X_m(\xi)\,d\xi,\\
G_m(t)&=\frac2L\int_0^L[f(\xi,t)-H_t(\xi,t)]X_m(\xi)\,d\xi.
\end{aligned}
$$

于是正确的总公式为

$$
\boxed{
u(x,t)=H(x,t)+\sum_{m=1}^\infty
\left[D_me^{-\mu_mt}
+\int_0^t e^{-\mu_m(t-s)}G_m(s)\,ds\right]X_m(x).}
$$

特别地，若原方程无源 $f=0$，直接积分线性权重得

$$
G_m(t)=-\frac{2}{m\pi}
\bigl[\mu_0'(t)-(-1)^m\mu_L'(t)\bigr].
$$

若两端是同一个常数温度，$H_t=0$，只需从初值减掉常数；若两端随时间变化，$H_t$ 一般非零，不能丢掉时间卷积。

## 6. 边界提升后的级数怎样核验

提升后的源项 $f-H_t$ 可能在端点不为零，因此不能未经检查套用第 4.2 节的“零端点源项”估计。

先说明仿射源项

$$
r(x,t)=\left(1-\frac xL\right)p_0(t)+\frac xLp_L(t),
\qquad p_0,p_L\in C^1[0,T].
$$

它的系数为

$$
h_m(t)=\frac{2}{m\pi}[p_0(t)-(-1)^mp_L(t)].
$$

令 $q_m(t)=\int_0^t e^{-\mu_m(t-s)}h_m(s)\,ds$。一次时间分部积分给出

$$
\mu_mq_m
=h_m(t)-e^{-\mu_mt}h_m(0)
-\int_0^t e^{-\mu_m(t-s)}h_m'(s)\,ds,
$$

从而

$$
q_m'
=e^{-\mu_mt}h_m(0)
+\int_0^t e^{-\mu_m(t-s)}h_m'(s)\,ds.
$$

在 $\delta\le t\le T$ 上，

$$
|q_m|\le C_Tm^{-3},\qquad
|q_m'|\le C_T\left(m^{-1}e^{-\mu_m\delta}+m^{-3}\right).
$$

所以函数值、空间一阶和时间一阶导数级数一致收敛。空间二阶导数使用

$$
-\left(\frac{m\pi}{L}\right)^2q_m
=-\frac1\kappa[h_m(t)-q_m'(t)].
$$

$q_m'$ 已可绝对求和；$h_m$ 的正弦级数在任意内部闭区间一致收敛。原因是正弦部分和有统一界，系数是 $1/m$ 或 $(-1)^m/m$；分部求和给出尾项趋于零。用 [[07_初边值问题的分离变量法#4.2 为什么全部系数相同就没有遗漏|Fourier 核逼近]]识别其和为仿射函数 $r$；这里允许奇延拓在端点跳跃，但内部闭区间离跳点有正距离，核逼近的近处—远处估计仍成立。

函数值和一阶导数级数已一致收敛；二阶导数级数在内部紧集上一致收敛后，对坐标线使用一元微积分基本定理，确认极限就是函数的经典二阶导数。因此可以在内部紧集上逐项求二阶导数，严格得到
$v_t-\kappa v_{xx}=r$。这些空间二阶导数的收敛并不要求一直延伸到端点，正与非零端点源项相符。

对一般提升后源项 $F=f-H_t$，把 $F$ 拆成“零端点部分”加“端点值的线性插值”。在一组方便的补充条件下：$f$ 的空间二阶导数及时间一阶导数连续、$\mu_0,\mu_L\in C^2$，前一部分用第 4.2 节，后一部分用上述计算，即完成正时间的经典核验。仅有 $C^1$ 边界温度时，函数值公式仍可由
$q_m=O(m^{-3})$ 核验，但本笔记不借未经证明的导数交换声称同样强的结论。

这给出 [[07_初边值问题的分离变量法#7.1 按原题面修正：先提升边界|同温非齐次边界公式]] 的适用说明。$\square$

## 7. 一般区间的平移与伸缩

对 $x\in(\alpha,\beta)$，$L=\beta-\alpha$，令

$$
y=\frac{\pi(x-\alpha)}{L},
\qquad U(y,t)=u\left(\alpha+\frac L\pi y,t\right).
$$

链式法则给出

$$
u_t=U_t,\qquad
u_{xx}=\left(\frac\pi L\right)^2U_{yy}.
$$

所以新方程为

$$
U_t-\kappa\left(\frac\pi L\right)^2U_{yy}
=f\left(\alpha+\frac L\pi y,t\right).
$$

伸缩会改变扩散系数；不能只把区间换成 $(0,\pi)$ 而保留所有系数不动。回到原坐标，振型为 $\sin[m\pi(x-\alpha)/L]$，衰减率为 $\kappa(m\pi/L)^2$。

## 8. 真正周期问题的复 Fourier 形式

圆周坐标是 $x$ 模 $2\pi$，正确的圆周对应为 $x\mapsto e^{ix}$。经典周期解满足函数与空间导数两端相接；零 Dirichlet 端点则是不同的问题。

> [!warning] 课件第 18—19 页与第 20—24 页
> 第 18 页写的是零 Dirichlet 端点，第 20 页以后改为圆周；复指数 $e^{imx}$ 对应后者，不自动满足前者。第 19 页源项积分中的指数符号也需与第 21—24 页的共轭内积一致。

设 $i^2=-1$，$\overline z$ 是复共轭。采用第一变量线性的内积

$$
\langle f,g\rangle=\int_{-\pi}^{\pi}f(x)\overline{g(x)}\,dx.
$$

标准化基为

$$
e_m(x)=\frac1{\sqrt{2\pi}}e^{imx},\qquad m\in\mathbb Z.
$$

直接计算

$$
\langle e_m,e_j\rangle
=\frac1{2\pi}\int_{-\pi}^{\pi}e^{i(m-j)x}\,dx
=\begin{cases}1,&m=j,\\0,&m\ne j.\end{cases}
$$

这里共轭将 $+ijx$ 变为 $-ijx$。没有共轭就会把 $m-j$ 错换成 $m+j$。

若用未经标准化的复指数写解，定义

$$
\widehat\varphi_m=\frac1{2\pi}\int_{-\pi}^{\pi}
\varphi(\xi)e^{-im\xi}\,d\xi,\qquad
\widehat f_m(t)=\frac1{2\pi}\int_{-\pi}^{\pi}
f(\xi,t)e^{-im\xi}\,d\xi.
$$

每个系数仍满足 ODE，于是

$$
\boxed{
u(x,t)=\sum_{m\in\mathbb Z}
\left[e^{-\kappa m^2t}\widehat\varphi_m
+\int_0^t e^{-\kappa m^2(t-s)}\widehat f_m(s)\,ds\right]e^{imx}.}
$$

$m=0$ 时指数为 $1$，系数为
$\widehat\varphi_0+\int_0^t\widehat f_0(s)\,ds$；不能除以 $m^2$。周期 Laplace 算子有零特征值，因此是非负而不是严格正的算子。

取空间 $C^2$ 的周期数据、源项及其空间导数连续时，非零模态系数有统一 $O(m^{-2})$ 界，可像第 4 节核验经典方程。课件进一步使用 $L^2$ 的标准 Fourier 基和 Parseval 等式：在该空间中展开默认是**范数收敛**，不代表每个点的普通级数都收敛。完整 $L^2$ 基定理是这里引用的分析先修；对光滑数据，均匀展开与有限正交计算已经给出本节所需核验。

对实数据，$\widehat f_{-m}=\overline{\widehat f_m}$，正负模态组合为实函数；这与实正余弦写法相同。

## 9. 两个只需一元积分的完整例子

**固定正弦源项。** 若 $\varphi=0$、$f(x,t)=X_1(x)$，

$$
u(x,t)=\left(\int_0^t e^{-\mu_1(t-s)}\,ds\right)X_1(x)
=\boxed{\frac{1-e^{-\mu_1t}}{\mu_1}X_1(x)}.
$$

初值、端点均为零；时间系数满足 $U_1'+\mu_1U_1=1$，所以原方程成立。长期极限 $X_1/\mu_1$ 满足 $-\kappa u_{xx}=X_1$，把热问题与稳态 Poisson 问题连起来。

**线性增长的源项。** 若 $f(x,t)=tX_2(x)$、$\varphi=0$，则

$$
\int_0^t e^{-\mu_2(t-s)}s\,ds
=\frac t{\mu_2}-\frac{1-e^{-\mu_2t}}{\mu_2^2}.
$$

所以

$$
\boxed{
u(x,t)=
\left[\frac t{\mu_2}-\frac{1-e^{-\mu_2t}}{\mu_2^2}\right]X_2(x).}
$$

对方括号求导再加 $\mu_2$ 倍自身，恰好得到 $t$；这是不用记忆 Duhamel 公式也能逐项核验的方法。

## 来源与相关链接

课件第 2—12 页为 Duhamel 主线，第 13—17 页为边界齐次化与区间变换，第 18—26 页为复 Fourier 和圆周形式。级数正则性分层、提升后的仿射源项核验、共轭与零模态辨析是本次补桥；不把原课件的混合题面静默改名。

- [[06_热传导方程及其定解问题]]
- [[07_初边值问题的分离变量法]]
- [[数学推导主线快速入门讲义]]
- [[00_课程笔记总览]]
- [[偏微分方程习题集#3.4 习题|教材热方程习题]]
