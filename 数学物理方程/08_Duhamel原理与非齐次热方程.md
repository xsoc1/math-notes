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

> [!abstract] 本单元核心目标
> 针对带有内部热源或时变非齐次边界条件的热传导方程，建立将“初始温度分布的自由衰减”与“后续各时刻新增热源的累积响应”分离开来的 **Duhamel 冲量叠加原理**。本节首先从一阶非齐次常微分方程的常数变易法导出模态系数的卷积公式，进而阐明变上限时间积分求导时源项从积分上限自然涌现的机制，最后完整处理非齐次时变边界的提升齐次化与圆周周期问题的复 Fourier 级数形式。

本节沿用上一讲记号：设区间长度为 $L>0$，热扩散率为 $\kappa>0$，零端点正弦特征基函数为 $X_m(x)=\sin(m\pi x/L)$，第 $m$ 阶模态的时间衰减指数记为 $\mu_m=\kappa(m\pi/L)^2$（$m\ge1$）。空间正交模态的背景详见 [[07_初边值问题的分离变量法|§7 初边值问题的分离变量法]]，整体推导脉络可参阅 [[数学推导主线快速入门讲义#19. Duhamel 原理：把不断加入的源项逐时推进|整体讲义第 19 节]]。

## 1. 预备引理：一阶非齐次线性常微分方程的积分因子法

Duhamel 原理在单个空间特征模态上的投影，本质上就是一阶线性非齐次常微分方程的初值问题：

$$
y'(t)+\mu y(t)=F(t)\quad (t>0),\qquad y(0)=y_0.
$$

在方程两端同乘积分因子 $e^{\mu t}$，利用乘积求导法则可将左端合并为完全导数：

$$
\frac{d}{dt}\bigl(e^{\mu t}y(t)\bigr)=e^{\mu t}F(t).
$$

将积分变量记为 $s$，在时间区间 $[0,t]$ 上对 $s$ 积分，再将等式两边同乘 $e^{-\mu t}$，即得显式解公式：

$$
\boxed{
y(t)=e^{-\mu t}y_0
+\int_0^t e^{-\mu(t-s)}F(s)\,ds.}
$$

这一定量公式具有极清晰的物理结构：右端第一项 $e^{-\mu t}y_0$ 表示初始时刻 $t=0$ 的状态经过整段时间 $t$ 后的指数衰减余留量；右端第二项则表示在历史时刻 $s\in[0,t]$ 注入的瞬时源项冲量 $F(s)\,ds$，在剩余时间跨度 $t-s$ 内按齐次规律 $e^{-\mu(t-s)}$ 衰减后，在当前观测时刻 $t$ 形成的累积叠加效应。

## 2. 齐次 Dirichlet 边界下非齐次热方程的逐模态求解

考察区间 $(0,L)$ 上带有内部热源项 $f(x,t)$ 的非齐次热传导初边值问题：

$$
\begin{cases}
u_t-\kappa u_{xx}=f(x,t),&0<x<L,\ t>0,\\
u(0,t)=u(L,t)=0,&t>0,\\
u(x,0)=\varphi(x),&0\le x\le L.
\end{cases}
$$

将初始数据 $\varphi(x)$ 与源项函数 $f(x,t)$ 分别向正交正弦基 $X_m(x)=\sin(m\pi x/L)$ 作内积投影，定义其广义 Fourier 正弦系数：

$$
\begin{aligned}
A_m&=\frac2L\int_0^L\varphi(\xi)X_m(\xi)\,d\xi,\\
F_m(t)&=\frac2L\int_0^L f(\xi,t)X_m(\xi)\,d\xi.
\end{aligned}
$$

注意定积分消去了空间哑变量 $\xi$，因此源项投影系数 $F_m(t)$ 仅是时间变量 $t$ 的一元函数。

设未知解按同一组空间特征函数展开为
$$
u(x,t)=\sum_{m=1}^\infty U_m(t)X_m(x).
$$
代入偏微分方程与初始条件，由正弦基的正交性可得每个模态的时间幅值 $U_m(t)$ 满足独立的一阶非齐次常微分方程初值问题：

$$
U_m'(t)+\mu_m U_m(t)=F_m(t),\qquad U_m(0)=A_m.
$$

直接应用第 1 节的积分因子公式，即可写出非齐次热传导初边值问题的级数解表示：

$$
\boxed{
u(x,t)=\sum_{m=1}^\infty
\left[
A_m e^{-\mu_m t}
+\int_0^t e^{-\mu_m(t-s)}F_m(s)\,ds
\right]X_m(x).}
$$

这一公式完整对应课程讲义第 5–12 页的叠加分解：总响应等于“无源齐次方程配非零初值 $\varphi$”的自由演化部分，加上“有源非齐次方程配零初值”的受迫响应部分。需要强调的是，这种线性叠加分解完全依赖于微分算子 $\partial_t-\kappa\partial_{xx}$ 与边界条件的**线性性**，不能直接照搬到带有 $u^2$ 或 $|\nabla u|^2$ 等非线性项的方程中。

## 3. 算子视角：Duhamel 冲量叠加原理的一般机制

为了从无穷级数的具体坐标中抽离出不依赖于空间维数与区域的普遍规律，我们固定一个历史脉冲时刻 $s\ge 0$，考察从时刻 $t=s$ 启动、把该时刻的源项瞬时强度 $f(x,s)$ 当作“新初值”的**齐次热传导辅助问题**：

$$
\begin{cases}
w_t(x,t;s)-\kappa w_{xx}(x,t;s)=0,&0<x<L,\ t>s,\\
w(0,t;s)=w(L,t;s)=0,&t>s,\\
w(x,s;s)=f(x,s),&0\le x\le L.
\end{cases}
$$

当参数 $s$ 固定时，$w(x,t;s)$ 在 $t>s$ 上满足的是**齐次热方程**，只不过推进的时间跨度为 $\tau=t-s$。利用分离变量法立知其级数表示为：

$$
w(x,t;s)=\sum_{m=1}^\infty e^{-\mu_m(t-s)}F_m(s)X_m(x).
$$

若引入齐次热传导演化半群算子记号 $S(\tau)$（表示将任意空间初值分布按齐次热方程推进时间 $\tau\ge 0$ 的线性解算子），则辅助解可简洁地记作 $w(\cdot,t;s)=S(t-s)f(\cdot,s)$。

将第 2 节级数解中的受迫源项部分交换求和与时间积分次序，即可写成著名的 **Duhamel 积分公式**：

$$
u_{\rm src}(x,t)=\int_0^t w(x,t;s)\,ds=\int_0^t \bigl(S(t-s)f(\cdot,s)\bigr)(x)\,ds.
$$

**为什么由一族满足齐次方程的辅助解 $w(x,t;s)$ 积分后，恰好能够产生非齐次源项 $f(x,t)$？**
假定被积函数具有允许应用含参变量变上限积分求导（Leibniz 法则）及与空间求导换序的光滑性，我们对 $u_{\rm src}(x,t)$ 求时间偏导数 $\partial_t$。注意时间变量 $t$ 同时出现在**积分上限**与**被积函数内部**两处：

$$
\begin{aligned}
\partial_t u_{\rm src}(x,t)
&=w(x,t;t)+\int_0^t\partial_t w(x,t;s)\,ds\\
&=f(x,t)+\kappa\int_0^t w_{xx}(x,t;s)\,ds\\
&=f(x,t)+\kappa\partial_{xx}u_{\rm src}(x,t).
\end{aligned}
$$

由此可见，偏微分方程右端的非齐次源项 $f(x,t)$ **完全来源于变上限积分对上限 $s=t$ 求导时释放出的“对角线初值项” $w(x,t;t)=f(x,t)$**，而积分号内部对 $t$ 的偏导数则与空间二阶导数 $\kappa\partial_{xx}u_{\rm src}$ 严格相消！

## 4. 级数解的收敛性与经典解导数核验的分层讨论

课程讲义第 3 页给出了数据条件：$\varphi\in C^2[0,L]$ 且满足 $\varphi(0)=\varphi(L)=\varphi''(0)=\varphi''(L)=0$，同时源项 $f(x,t)$ 连续且满足 $f(0,t)=f(L,t)=0$。这里需要从分析上予以严谨分层：**源项 $f$ 仅连续有界足以保证函数值级数 $u(x,t)$ 本身一致收敛（从而给出连续温和解/广义解），但仅凭 $f$ 的连续性并不能无条件地将二阶空间导数 $\partial_{xx}$ 直接移入无穷级数内部逐项求导**——因为对于变上限积分 $\int_0^t e^{-\mu_m(t-s)}F_m(s)\,ds$，在积分上限 $s\to t^-$ 附近，时间间隔 $t-s\to 0$，指数因子 $e^{-\mu_m(t-s)}\to 1$ 失去了无穷阶压制能力，积分整体仅能提供 $\mu_m^{-1}\sim m^{-2}$ 的代数衰减。下面分两个层次给出精确估计。

### 4.1 第一层：连续有界源项下的函数值级数一致收敛

在任意有限时间区间 $[0,T]$ 上，设连续源项满足 $|f(x,t)|\le M$，则其正弦系数满足一致有界估计 $|F_m(t)|\le 2M$。记源项模态的时间卷积积分为

$$
V_m(t)=\int_0^t e^{-\mu_m(t-s)}F_m(s)\,ds.
$$

由于衰减率 $\mu_m=\kappa(m\pi/L)^2\propto m^2$，直接放缩积分可得：

$$
|V_m(t)|\le 2M\int_0^t e^{-\mu_m(t-s)}\,ds=\frac{2M(1-e^{-\mu_m t})}{\mu_m}\le\frac{2M}{\mu_m}=\frac{2ML^2}{\kappa\pi^2 m^2}.
$$

由 Weierstrass $M$-判别法，$\sum_{m=1}^\infty V_m(t)X_m(x)$ 在 $[0,L]\times[0,T]$ 上绝对且一致收敛，故和函数连续且满足零边界条件。同时当 $t\to 0^+$ 时，每个 $V_m(t)\to 0$ 且受可求和优级数 $\frac{C}{m^2}$ 控制，故源项级数一致趋于零，初始条件严格成立。

### 4.2 第二层：保证逐项可微成为经典解的充分条件

为了能够对源项级数逐项求二阶空间导数 $\partial_{xx}$ 与一阶时间导数 $\partial_t$，我们补充假设：源项 $f$ 关于空间二阶连续可微（即 $f,f_{xx}\in C([0,L]\times[0,T])$），且满足齐次端点条件 $f(0,t)=f(L,t)=0$。

对每个固定的时刻 $t\in[0,T]$，仿照 [[07_初边值问题的分离变量法#4.1 两次分部积分导出系数 $O(m^{-2})$ 衰减与绝对一致收敛|上一讲第 4.1 节]] 对空间积分做两次分部积分，利用端点条件 $f(0,t)=f(L,t)=0$ 消去边界项，即可获得源项系数的一致二阶衰减估计：

$$
|F_m(t)|\le\frac{C_T}{m^2},
$$

其中常数 $C_T=\frac{2L^2}{\pi^2}\max_{[0,L]\times[0,T]}|f_{xx}|$ 与 $m,t$ 无关。将其代入时间卷积 $V_m(t)$ 及其满足的常微分方程 $V_m'(t)=-\mu_m V_m(t)+F_m(t)$，立即得到：

$$
|V_m(t)|\le\frac{C_T}{m^2\mu_m}=O(m^{-4}),
\qquad
\mu_m|V_m(t)|\le\frac{C_T}{m^2},
\qquad
|V_m'(t)|\le\mu_m|V_m(t)|+|F_m(t)|\le\frac{2C_T}{m^2}.
$$

由于 $\sum_{m=1}^\infty m^{-2}<\infty$，源项级数的时间一阶导数级数 $\sum V_m'(t)X_m(x)$ 与空间二阶导数级数 $-\sum (m\pi/L)^2 V_m(t)X_m(x)$ 在 $[0,L]\times[0,T]$ 上均绝对且一致收敛（空间一阶导数级数通项为 $O(m^{-3})$，收敛更快）；而初值部分的导数级数在任意 $t\ge\delta>0$ 上同样由高斯衰减保证一致收敛。

因此在 $(0,L)\times(0,T]$ 上可以合法地对整个无穷级数逐项求导，得到：

$$
u_t-\kappa u_{xx}
=\sum_{m=1}^\infty\bigl(V_m'(t)+\mu_m V_m(t)\bigr)X_m(x)
=\sum_{m=1}^\infty F_m(t)X_m(x)=f(x,t),
$$

其中最后一步应用了光滑零端点函数的 Fourier 正弦展开定理。至此，经典解的偏微分方程、边界条件与初始条件全部核验完毕。$\square$

## 5. 非齐次时变边界条件：边界提升齐次化方法

现在考察区间两端给定随时间变化的非齐次 Dirichlet 边界温度 $\mu_0(t)$ 与 $\mu_L(t)$ 的一般初边值问题：

$$
\begin{cases}
u_t-\kappa u_{xx}=f(x,t),&0<x<L,\ t>0,\\
u(0,t)=\mu_0(t),\quad u(L,t)=\mu_L(t),&t>0,\\
u(x,0)=\varphi(x),&0\le x\le L.
\end{cases}
$$

由于正弦特征函数系 $X_m(x)=\sin(m\pi x/L)$ 在两端点恒为零，不能直接用正弦级数去逼近非零边界值。标准处理策略是构造一个关于空间坐标 $x$ 线性插值的**边界提升函数**（Boundary Lifting Function）：

$$
H(x,t)=\left(1-\frac xL\right)\mu_0(t)
+\frac xL\mu_L(t).
$$

容易看出，$H(x,t)$ 的设计目的是先行吸收非齐次边界条件，且因其对 $x$ 呈线性关系而天然满足二阶导数为零：

$$
H(0,t)=\mu_0(t),\qquad H(L,t)=\mu_L(t),
\qquad H_{xx}(x,t)=0.
$$

作未知函数代换 $v(x,t)=u(x,t)-H(x,t)$，则辅助函数 $v(x,t)$ 的空间边界条件被彻底齐次化，代价则是将边界随时间的变化率 $-H_t(x,t)$ 转移为内部等效热源项，并将初始分布修正为 $\varphi(x)-H(x,0)$：

$$
\begin{cases}
v_t-\kappa v_{xx}=f(x,t)-H_t(x,t),&0<x<L,\ t>0,\\
v(0,t)=v(L,t)=0,&t>0,\\
v(x,0)=\varphi(x)-H(x,0),&0\le x\le L.
\end{cases}
$$

（注：为保证修正初值在端点为零，需满足零阶角点相容条件 $\varphi(0)=\mu_0(0)$、$\varphi(L)=\mu_L(0)$；若选取非线性的光滑提升函数 $H(x,t)$，则等效源项一般写为 $f-H_t+\kappa H_{xx}$。）

计算修正初值与等效源项的正弦展开系数：

$$
\begin{aligned}
D_m&=\frac2L\int_0^L\bigl[\varphi(\xi)-H(\xi,0)\bigr]X_m(\xi)\,d\xi,\\
G_m(t)&=\frac2L\int_0^L\bigl[f(\xi,t)-H_t(\xi,t)\bigr]X_m(\xi)\,d\xi.
\end{aligned}
$$

对 $v(x,t)$ 直接应用第 2 节的 Duhamel 公式并还原 $u=v+H$，即得非齐次初边值问题的完整解公式：

$$
\boxed{
u(x,t)=H(x,t)+\sum_{m=1}^\infty
\left[D_m e^{-\mu_m t}
+\int_0^t e^{-\mu_m(t-s)}G_m(s)\,ds\right]X_m(x).}
$$

特别地，当原方程内部无热源（$f\equiv 0$）时，利用分部积分直接计算线性权重 $1-x/L$ 与 $x/L$ 的正弦积分，可得边界变化率引起的模态激励系数：

$$
G_m(t)=-\frac2L\int_0^L H_t(\xi,t)\sin\frac{m\pi\xi}{L}\,d\xi
=-\frac{2}{m\pi}\bigl[\mu_0'(t)-(-1)^m\mu_L'(t)\bigr].
$$

若两端保持恒定不变的常数温度，则 $\mu_0'=\mu_L'=0$，从而 $H_t=0$、$G_m(t)=0$，只需从初值中减去稳态线性分布 $H(x)$ 即可；反之，只要边界温度随时间变化，就必须保留关于 $\mu_0'(s),\mu_L'(s)$ 的 Duhamel 时间卷积项。

## 6. 边界提升后级数解的严格收敛性核验

在通过线性提升函数 $H(x,t)$ 化齐次边界后，新产生的等效源项 $-H_t(x,t)=-\bigl(1-\frac{x}{L}\bigr)\mu_0'(t)-\frac{x}{L}\mu_L'(t)$ 在端点 $x=0,L$ 处一般**不等于零**，因此其正弦展开系数仅具有 $O(m^{-1})$ 衰减，不能直接套用第 4.2 节针对零端点源项的估计。下面我们利用时间方向的分部积分与正弦级数的内部收敛性质，严格证明提升后的级数在内部开区域 $(0,L)\times(0,T]$ 上依然是逐项可微的经典解。

考察一般的空间仿射线性源项：

$$
r(x,t)=\left(1-\frac xL\right)p_0(t)+\frac xL p_L(t),\qquad p_0,p_L\in C^1[0,T].
$$

其正弦展开系数为

$$
h_m(t)=\frac2L\int_0^L r(\xi,t)X_m(\xi)\,d\xi=\frac{2}{m\pi}\bigl[p_0(t)-(-1)^m p_L(t)\bigr]=O(m^{-1}).
$$

记其对应的 Duhamel 时间卷积为 $q_m(t)=\int_0^t e^{-\mu_m(t-s)}h_m(s)\,ds$。由于 $h_m\in C^1[0,T]$，我们对关于 $s$ 的积分做一次**时间分部积分**（利用 $\frac{d}{ds}e^{-\mu_m(t-s)}=\mu_m e^{-\mu_m(t-s)}$）：

$$
\mu_m q_m(t)
=h_m(t)-e^{-\mu_m t}h_m(0)
-\int_0^t e^{-\mu_m(t-s)}h_m'(s)\,ds.
$$

将其代入常微分方程关系式 $q_m'(t)=h_m(t)-\mu_m q_m(t)$，消去慢衰减项 $h_m(t)$，奇迹般地得到了时间导数 $q_m'(t)$ 的高阶衰减表达式：

$$
q_m'(t)
=e^{-\mu_m t}h_m(0)
+\int_0^t e^{-\mu_m(t-s)}h_m'(s)\,ds.
$$

在任意正时间闭层 $\delta\le t\le T$（$\delta>0$）上，由于 $|h_m'(s)|=O(m^{-1})$，積分后额外获得因子 $\mu_m^{-1}=O(m^{-2})$，故有：

$$
|q_m(t)|\le \frac{C_T}{m\mu_m}=O(m^{-3}),\qquad
|q_m'(t)|\le C_T\left(m^{-1}e^{-\mu_m\delta}+m^{-3}\right).
$$

因为级数 $\sum m^{-3}$ 与 $\sum m^{-1}e^{-\mu_m\delta}$ 均收敛，所以函数值级数 $\sum q_m(t)X_m(x)$、空间一阶导数级数（通项 $O(m^{-2})$）以及时间一阶导数级数 $\sum q_m'(t)X_m(x)$ 在 $[0,L]\times[\delta,T]$ 上全部绝对且一致收敛！

最后考察空间二阶导数级数的通项：利用恒等式 $\mu_m=\kappa(m\pi/L)^2$，有

$$
-\left(\frac{m\pi}{L}\right)^2 q_m(t)
=-\frac{\mu_m}{\kappa}q_m(t)
=-\frac1\kappa\bigl[h_m(t)-q_m'(t)\bigr].
$$

其中 $\sum q_m'(t)X_m(x)$ 已证一致收敛；而 $\sum_{m=1}^\infty h_m(t)\sin(m\pi x/L)$ 作为分片光滑仿射函数 $r(x,t)$ 的正弦级数，虽然在端点 $x=0,L$ 处存在奇延拓跳跃（Gibbs 现象），但在远离端点的**任意内部紧子区间 $[a,b]\subset(0,L)$** 上，由 Dirichlet 判别法（$\sin(m\pi x/L)$ 部分和一致有界，系数 $1/m$ 单调趋于零）及局部 Fejér 核逼近可知，该级数在 $[a,b]\times[\delta,T]$ 上一致收敛于 $r(x,t)$。因此在区域内部 $(0,L)\times(0,T]$ 上可以合法地逐项求二阶空间导数，并严格满足偏微分方程 $v_t-\kappa v_{xx}=r(x,t)$。

（注：若边界温度仅满足 $\mu_0,\mu_L\in C^1[0,T]$，则对 $q_m(t)=\int_0^t e^{-\mu_m(t-s)}h_m(s)\,ds$ 仍可利用 $h_m(s)=O(m^{-1})$ 直接得到 $|q_m(t)|\le\frac{C}{m\mu_m}=O(m^{-3})$，故函数值级数本身在 $[0,L]\times[0,T]$ 上依然绝对且一致收敛。）

进一步，对于一般的内部源项 $f(x,t)$（设 $f,f_{xx},f_t\in C([0,L]\times[0,T])$，但**不要求** $f(0,t)=f(L,t)=0$），边界提升后的总等效源项为 $F(x,t):=f(x,t)-H_t(x,t)$。我们可以将 $F(x,t)$ 拆分为端点线性插值项与零端点余项之和：
$$
F(x,t)=F_0(x,t)+\ell_F(x,t),\qquad
\ell_F(x,t):=\left(1-\frac{x}{L}\right)F(0,t)+\frac{x}{L}F(L,t),\qquad
F_0(x,t):=F(x,t)-\ell_F(x,t).
$$
如此分解后：
1. **零端点余项 $F_0(x,t)$**：因为 $\ell_F$ 关于 $x$ 是仿射线性函数，有 $\partial_{xx}F_0=f_{xx}\in C([0,L]\times[0,T])$，且在两端点处恒有 $F_0(0,t)=F_0(L,t)=0$！因此 $F_0$ 完全满足第 4.2 节的零端点光滑源项条件，通过两次空间分部积分立得其 Duhamel 模态系数以 $O(m^{-4})$ 衰减，其二阶空间导数与一阶时间导数级数在 $[0,L]\times[0,T]$ 上绝对一致收敛；
2. **仿射线性项 $\ell_F(x,t)$**：当 $\mu_0,\mu_L\in C^2[0,T]$ 且 $f(0,\cdot),f(L,\cdot)\in C^1[0,T]$ 时，$\ell_F(x,t)$ 的两个端点时间系数 $p_0(t):=F(0,t)=f(0,t)-\mu_0'(t)$ 与 $p_L(t):=F(L,t)=f(L,t)-\mu_L'(t)$ 均属于 $C^1[0,T]$，故可直接套用本节上面针对仿射源项 $r(x,t)$ 的时间分部积分论证！

综上所述，当边界数据满足 $\mu_0,\mu_L\in C^2[0,T]$ 且一般内部源项满足 $f,f_{xx},f_t\in C([0,L]\times[0,T])$（无需限制 $f$ 在端点为零）时，边界提升后的级数解在 $(0,L)\times(0,T]$ 内严格为经典解。这为 [[07_初边值问题的分离变量法#7.1 严格按照题面求解：两端同温的非齐次 Dirichlet 问题|上一讲 7.1 节的同温时变边界公式]] 提供了完整的理论支撑。$\square$

## 7. 一般区间 $(\alpha,\beta)$ 上的平移与尺度变换

若空间自变量给定在一般有限区间 $x\in(\alpha,\beta)$ 上，记区间长度为 $L=\beta-\alpha>0$，可通过仿射线性变换将其标准化为课程讲义常采用的参考区间 $(0,\pi)$：

$$
y=\frac{\pi(x-\alpha)}{L}\in(0,\pi),
\qquad U(y,t)=u\left(\alpha+\frac{L}{\pi}y,t\right).
$$

由复合函数链式求导法则：

$$
u_t=U_t,\qquad
u_x=\frac{\pi}{L}U_y,\qquad
u_{xx}=\left(\frac{\pi}{L}\right)^2 U_{yy}.
$$

代入原热传导方程 $u_t-\kappa u_{xx}=f(x,t)$，在新坐标 $(y,t)$ 下方程化为：

$$
U_t-\kappa\left(\frac{\pi}{L}\right)^2 U_{yy}
=f\left(\alpha+\frac{L}{\pi}y,t\right).
$$

需要特别注意：**空间尺度的伸缩会将等效热扩散率从 $\kappa$ 改变为 $\tilde\kappa=\kappa(\pi/L)^2$**，切不可仅将区间替换为 $(0,\pi)$ 而遗漏二阶导数前的尺度因子 $(\pi/L)^2$。求解完毕并代回原坐标 $x\in(\alpha,\beta)$ 后，基本正弦振型即为 $\sin\frac{m\pi(x-\alpha)}{L}$，模态衰减指数仍为 $\mu_m=\kappa(m\pi/L)^2$。

## 8. 圆周周期边值问题的复数形式 Fourier 级数解

当空间区域为闭合圆周 $\mathbb R/2\pi\mathbb Z$（取坐标代表元 $x\in[-\pi,\pi]$，满足周期衔接条件 $u(-\pi,t)=u(\pi,t)$ 及 $u_x(-\pi,t)=u_x(\pi,t)$）时，采用复指数正交基 $\{e^{imx}\}_{m\in\mathbb Z}$ 书写分离变量与 Duhamel 公式最为紧凑。

> [!warning] 课程讲义第 18–24 页的边界条件与复内积符号核对
> 讲义第 18 页题面写作零 Dirichlet 边界，而第 20–24 页则切换为复指数基 $e^{imx}$ 展开——复指数基对应的是**周期边界条件**而非零 Dirichlet 边界条件（因为 $e^{im(\pm\pi)}=(-1)^m\ne 0$）。此外，第 19 页源项系数积分中的指数符号应统一取为负指数 $e^{-im\xi}$，以与第 21–24 页的复共轭内积约定保持一致。

设虚数单位满足 $i^2=-1$，$\overline{z}$ 表示复数 $z$ 的复共轭。在复值函数空间 $L^2(-\pi,\pi)$ 上，定义关于第一变量线性、第二变量共轭线性的标准 Hermite 内积：

$$
\langle f,g\rangle=\int_{-\pi}^\pi f(x)\overline{g(x)}\,dx.
$$

引入规范正交复指数基函数族：

$$
e_m(x)=\frac{1}{\sqrt{2\pi}}e^{imx},\qquad m\in\mathbb{Z}.
$$

利用 $\overline{e^{ijx}}=e^{-ijx}$ 直接积分，可验证其规范正交性：

$$
\langle e_m,e_j\rangle
=\frac{1}{2\pi}\int_{-\pi}^\pi e^{i(m-j)x}\,dx
=\begin{cases}1,&m=j,\\0,&m\ne j.\end{cases}
$$

（注意：内积定义中的复共轭将 $+ijx$ 转化为 $-ijx$，从而保证被积函数为 $e^{i(m-j)x}$；若遗漏复共轭，则会误写为 $m+j$。）

若按习惯采用未带 $\frac{1}{\sqrt{2\pi}}$ 的复指数 $e^{imx}$ 作为展开基，则初值 $\varphi(x)$ 与源项 $f(x,t)$ 的复 Fourier 系数定义为：

$$
\widehat{\varphi}_m=\frac{1}{2\pi}\int_{-\pi}^\pi\varphi(\xi)e^{-im\xi}\,d\xi,\qquad
\widehat{f}_m(t)=\frac{1}{2\pi}\int_{-\pi}^\pi f(\xi,t)e^{-im\xi}\,d\xi\qquad (m\in\mathbb Z).
$$

由于算子 $-\partial_{xx}$ 作用于 $e^{imx}$ 的特征值为 $\lambda_m=m^2$，每个复模态系数满足一阶常微分方程 $\widehat u_m'(t)+\kappa m^2\widehat u_m(t)=\widehat f_m(t)$。应用 Duhamel 积分公式，即得圆周周期问题的复 Fourier 级数解：

$$
\boxed{
u(x,t)=\sum_{m\in\mathbb{Z}}
\left[e^{-\kappa m^2 t}\widehat{\varphi}_m
+\int_0^t e^{-\kappa m^2(t-s)}\widehat{f}_m(s)\,ds\right]e^{imx}.}
$$

**关于零频模态（$m=0$）与实值函数对称性的两点说明**：
1. 当 $m=0$ 时，特征值 $m^2=0$，指数因子 $e^{-\kappa\cdot 0\cdot t}\equiv 1$，此时零频项（空间平均值）直接由积分给出：
   $$
   \widehat u_0(t)=\widehat{\varphi}_0+\int_0^t\widehat{f}_0(s)\,ds.
   $$
   切忌在对时间积分后盲目除以 $m^2$ 而导致 $m=0$ 处出现除以零的错误。从算子谱理论看，周期边界下的 $-\partial_{xx}$ 具有零特征值（核空间为常函数），故为半正定（非负）自伴算子而非严格正定算子。
2. 当初值 $\varphi$ 与源项 $f$ 均为实值函数时，复系数满足共轭对称性 $\widehat{\varphi}_{-m}=\overline{\widehat{\varphi}_m}$、$\widehat{f}_{-m}(t)=\overline{\widehat{f}_m(t)}$。将级数中 $\pm m$ 两项配对相加，其虚部自动抵消，结果严格还原为上一讲 7.2 节的实正余弦三角级数。

## 9. 两个单模态非齐次热传导计算算例

### 9.1 空间正弦分布的恒定热源

考察区间 $(0,L)$ 上零初值（$\varphi\equiv 0$）、零 Dirichlet 边界下，受恒定正弦热源 $f(x,t)=X_1(x)=\sin(\pi x/L)$ 驱动的热传导问题。由于源项仅含第 $1$ 阶空间模态（即 $F_1(t)\equiv 1$，当 $m\ge 2$ 时 $F_m(t)\equiv 0$），无穷级数坍缩为单一模态，直接计算一元积分可得：

$$
u(x,t)=\left(\int_0^t e^{-\mu_1(t-s)}\,ds\right)X_1(x)
=\boxed{\frac{1-e^{-\mu_1 t}}{\mu_1}\sin\frac{\pi x}{L},}\qquad \mu_1=\kappa\left(\frac{\pi}{L}\right)^2.
$$

容易核验：在 $t=0$ 时 $u(x,0)=0$；对任意 $t>0$ 满足方程 $u_t-\kappa u_{xx}=\sin(\pi x/L)$；且当时间 $t\to+\infty$ 时，瞬态指数项 $e^{-\mu_1 t}\to 0$，温度场单调收敛于稳态 Poisson 方程 $-\kappa U''(x)=\sin(\pi x/L)$ 的平衡解 $U(x)=\frac{1}{\mu_1}\sin\frac{\pi x}{L}$。

### 9.2 随时间线性增长的正弦热源

若在零初值与零 Dirichlet 边界下，热源强度随时间线性增长：$f(x,t)=t X_2(x)=t\sin\frac{2\pi x}{L}$。此时仅有第 $2$ 阶模态被激发（$F_2(t)=t$）。利用分部积分计算时间卷积：

$$
\int_0^t e^{-\mu_2(t-s)}s\,ds
=\left[\frac{s e^{-\mu_2(t-s)}}{\mu_2}\right]_{s=0}^{s=t}-\frac{1}{\mu_2}\int_0^t e^{-\mu_2(t-s)}\,ds
=\frac{t}{\mu_2}-\frac{1-e^{-\mu_2 t}}{\mu_2^2}.
$$

因此精确解为：

$$
\boxed{
u(x,t)=
\left[\frac{t}{\mu_2}-\frac{1-e^{-\mu_2 t}}{\mu_2^2}\right]\sin\frac{2\pi x}{L},}\qquad \mu_2=4\kappa\left(\frac{\pi}{L}\right)^2.
$$

将方括号内的时间函数记为 $U_2(t)$，直接求导验证可得 $U_2'(t)+\mu_2 U_2(t)=\left(\frac{1}{\mu_2}-\frac{e^{-\mu_2 t}}{\mu_2}\right)+\left(t-\frac{1-e^{-\mu_2 t}}{\mu_2}\right)=t$，与原方程完全吻合。

## 来源说明与相关链接

本单元笔记对应课程讲义 2.3 节（第 2–12 页为 Duhamel 原理与非齐次级数解，第 13–17 页为非齐次边界提升齐次化与区间伸缩变换，第 18–26 页为复数形式 Fourier 级数展开）。笔记中补充了变上限积分求导产生源项的算子解释、经典解逐项可微性的两层严格估计以及边界提升后仿射源项的分部积分收敛性证明。

- [[07_初边值问题的分离变量法|§7 初边值问题的分离变量法]]
- [[09_热方程的柯西问题|§9 热方程的柯西问题]]
- [[数学推导主线快速入门讲义#19. Duhamel 原理：把不断加入的源项逐时推进|快速讲义第 19 节：Duhamel 原理]]
- [[00_课程笔记总览|课程笔记总览]]
