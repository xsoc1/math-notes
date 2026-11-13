---
title: "Ascoli 定理与紧性判别"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-compactness
  - theory-note
note_type: theory
source_section: "F/2 的 Ascoli 与积分算子部分"
exercise_range: "1.3 节函数族题"
status: "已补证"
---

# Ascoli 定理与紧性判别

在连续函数空间 $C(K,\mathbb K)$（赋予上确界范数 $\|f\|_\infty=\sup_{t\in K}|f(t)|$）中，怎样的函数族 $\mathcal F$ 才是相对紧的？由于上确界范数要求在整个定义域 $K$ 上实现一致逼近，仅仅要求函数族在每一点处有界（甚至一致有界），都无法阻止函数列在越来越狭窄的区间内发生剧烈振荡或陡峭跃变（如 $t^n$ 或 $\sin(nt)$）。**等度连续性（Equicontinuity）**正是为了抑制这种高频振荡、确保所有函数共享同一连续模而引入的核心条件。

## 1. 逐点有界与等度连续的量词结构

设 $(K,d)$ 为紧度量空间，$\mathcal F\subseteq C(K,\mathbb K)$ 为一族标量值连续函数。

> [!note] 定义 1.1 逐点有界、一致有界与等度连续
> - **逐点有界（Pointwise Bounded）：** 对每一个固定的自变量 $t\in K$，数值集合 $\{f(t):f\in\mathcal F\}$ 有界，即
>   $$
>   \sup_{f\in\mathcal F}|f(t)|<\infty\qquad(\forall t\in K).
>   $$
> - **一致有界（Uniformly Bounded）：** 存在与 $t$ 和 $f$ 均无关的常数 $M<\infty$，使得 $\sup_{f\in\mathcal F}\|f\|_\infty\leq M$。
> - **等度连续（Equicontinuous）：** 对每一点 $t\in K$ 及任意 $\varepsilon>0$，存在 $\delta=\delta(t,\varepsilon)>0$，使得对**族中所有的函数 $f\in\mathcal F$** 以及任意 $s\in K$，都有
>   $$
>   d(s,t)<\delta\Longrightarrow |f(s)-f(t)|<\varepsilon.
>   $$
>   这里控制半径 $\delta$ **不能依赖于具体的函数 $f\in\mathcal F$**。若 $\delta=\delta(\varepsilon)>0$ 进一步与点 $t\in K$ 也无关，则称 $\mathcal F$ 在 $K$ 上**一致等度连续**。

**紧定义域上点态等度连续向一致等度连续的自动提升：**
当定义域 $K$ 是紧度量空间时，定义 1.1 中的点态等度连续自动等价于一致等度连续。事实上，给定 $\varepsilon>0$，由点态等度连续性，对每个点 $t\in K$ 存在半径 $r_t>0$，使得当 $d(s,t)<r_t$ 时对一切 $f\in\mathcal F$ 有 $|f(s)-f(t)|<\varepsilon/2$。以半半径开球族 $\{B(t,r_t/2)\}_{t\in K}$ 覆盖紧集 $K$，可从中抽出有限子覆盖 $B(t_1,r_{t_1}/2),\ldots,B(t_m,r_{t_m}/2)$。取统一常数
$$
\delta=\min_{1\leq i\leq m}\frac{r_{t_i}}{2}>0.
$$
现对 $K$ 中任意满足 $d(s,u)<\delta$ 的两点 $s,u$，先取某个 $i$ 使得 $s\in B(t_i,r_{t_i}/2)$，则由三角不等式知 $d(u,t_i)\leq d(u,s)+d(s,t_i)<\delta+r_{t_i}/2\leq r_{t_i}$。于是 $s$ 和 $u$ 同时落在开球 $B(t_i,r_{t_i})$ 内，从而对所有 $f\in\mathcal F$ 恒有
$$
|f(s)-f(u)|\leq |f(s)-f(t_i)|+|f(t_i)-f(u)|<\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon.
$$

## 2. Ascoli-Arzelà 定理

> [!note] 定理 2.1 Ascoli-Arzelà 定理（标量值函数空间版本）
> 设 $(K,d)$ 为紧度量空间。函数族 $\mathcal F\subseteq C(K,\mathbb K)$ 在上确界范数 $\|\cdot\|_\infty$ 下**相对紧**，当且仅当 $\mathcal F$ **逐点有界**且**等度连续**（此时 $\mathcal F$ 也必然一致有界）。

**证明：** 由于紧集 $K$ 上的连续函数空间 $(C(K,\mathbb K),\|\cdot\|_\infty)$ 是完备的 Banach 空间，根据 [[01_列紧与完全有界#4. 相对紧性的判别准则|相对紧与完全有界等价定理（定理 4.1）]]，$\mathcal F$ 相对紧当且仅当 $\mathcal F$ 在上确界范数下**完全有界**。

- **必要性（相对紧 $\implies$ 逐点有界且等度连续）：**
  设 $\mathcal F$ 相对紧，从而完全有界。
  1. **逐点有界（乃至一致有界）：** 对 $\varepsilon=1$，取 $\mathcal F$ 的有限 $1$-网 $g_1,\ldots,g_N\in\mathcal F$，则对任意 $f\in\mathcal F$，存在某个 $g_i$ 使 $\|f-g_i\|_\infty<1$，故 $\|f\|_\infty\leq 1+\max_{1\leq i\leq N}\|g_i\|_\infty<\infty$，即 $\mathcal F$ 一致有界，自然逐点有界。
  2. **等度连续：** 对任意给定的 $\varepsilon>0$，取 $\mathcal F$ 的有限 $(\varepsilon/3)$-网 $g_1,\ldots,g_N\in C(K,\mathbb K)$。由于单个连续函数在紧集 $K$ 上必一致连续，对每个 $i\in\{1,\ldots,N\}$，存在 $\delta_i>0$，使得当 $d(s,t)<\delta_i$ 时 $|g_i(s)-g_i(t)|<\varepsilon/3$。令
     $$
     \delta=\min\{\delta_1,\ldots,\delta_N\}>0.
     $$
     现对任意 $f\in\mathcal F$，先选取网心 $g_i$ 使得 $\|f-g_i\|_\infty<\varepsilon/3$；于是当 $d(s,t)<\delta$ 时，由三折估计可得
     $$
     |f(s)-f(t)|
     \leq |f(s)-g_i(s)|+|g_i(s)-g_i(t)|+|g_i(t)-f(t)|
     <\frac{\varepsilon}{3}+\frac{\varepsilon}{3}+\frac{\varepsilon}{3}=\varepsilon.
     $$
     这证明了 $\mathcal F$ 一致等度连续。

- **充分性（逐点有界且等度连续 $\implies$ 完全有界）：**
  设 $\mathcal F$ 逐点有界且等度连续。对任意给定的 $\varepsilon>0$，我们要用有限个采样点上的取值归类来构造 $\mathcal F$ 的有限 $\varepsilon$-网：
  1. **在定义域 $K$ 上选取有限采样网：** 由第 1 节的结论，$\mathcal F$ 在紧集 $K$ 上一致等度连续，故存在统一的 $\delta>0$，使得当 $d(s,t)<\delta$ 时，对一切 $f\in\mathcal F$ 都有 $|f(s)-f(t)|<\varepsilon/3$。由于 $K$ 是紧集（从而完全有界），可取出 $K$ 的一个有限 $\delta$-网 $t_1,\ldots,t_N\in K$。
  2. **在有限维采样值空间中分箱归类：** 对每个采样点 $t_i$（$i=1,\ldots,N$），由逐点有界假设可知标量集合 $\{f(t_i):f\in\mathcal F\}\subseteq\mathbb K$ 是有界集。于是，在有限维空间 $\mathbb K^N$ 中，点集
     $$
     E=\bigl\{\bigl(f(t_1),\ldots,f(t_N)\bigr):f\in\mathcal F\bigr\}\subseteq\mathbb K^N
     $$
     是有界集，由有限维 Heine-Borel 定理知 $E$ 完全有界。因此，可以用有限多个关于上确界距离直径小于 $\varepsilon/3$ 的小盒 $B_1,\ldots,B_M$ 覆盖 $E$。
  3. **从非空分箱中选取代表函数构成有限 $\varepsilon$-网：** 对于每一个满足 $\{f\in\mathcal F:(f(t_1),\ldots,f(t_N))\in B_k\}\neq\varnothing$ 的小盒 $B_k$，从中各任选一个代表函数 $g_k\in\mathcal F$。现对任意 $f\in\mathcal F$，它的采样向量 $(f(t_1),\ldots,f(t_N))$ 必落入某个小盒 $B_k$ 中，从而与该盒的代表函数 $g_k$ 在所有采样点上满足
     $$
     |f(t_i)-g_k(t_i)|<\frac{\varepsilon}{3}\qquad(\forall i=1,\ldots,N).
     $$
     最后，对定义域中的任意点 $t\in K$，选取距离它小于 $\delta$ 的采样点 $t_i$（即 $d(t,t_i)<\delta$），利用等度连续性传递估计：
     $$
     |f(t)-g_k(t)|\leq |f(t)-f(t_i)|+|f(t_i)-g_k(t_i)|+|g_k(t_i)-g_k(t)|<\frac{\varepsilon}{3}+\frac{\varepsilon}{3}+\frac{\varepsilon}{3}=\varepsilon.
     $$
     对 $t\in K$ 取上确界，即得 $\|f-g_k\|_\infty<\varepsilon$。因此这有限个代表函数 $\{g_k\}$ 构成了 $\mathcal F$ 的有限 $\varepsilon$-网，$\mathcal F$ 完全有界，从而相对紧。$\square$

*注：从充分性的证明还可以直接看出，在紧集 $K$ 上，“逐点有界 + 等度连续”自动蕴含“一致有界”：取 $\varepsilon=1$ 对应的有限 $\delta$-网 $t_1,\ldots,t_N$，则任意 $f(t)$ 与某个采样值 $f(t_i)$ 相差不超过 $1$，从而 $\|f\|_\infty\leq 1+\max_{1\leq i\leq N}\sup_{h\in\mathcal F}|h(t_i)|<\infty$。*

> [!important] 向量值函数空间 $C(K,Y)$ 的推广边界
> 若目标空间换成一般的完备赋范空间（Banach 空间）$Y$，则充分性证明第 2 步中“有界标量集必完全有界”在无限维空间 $Y$ 中不再成立！此时，必须将条件中的“逐点有界”加强为**“逐点相对紧”**（即对每个 $t\in K$，取值集 $\{f(t):f\in\mathcal F\}$ 在 $Y$ 中相对紧）。例如，取 $Y=\ell^2$，常值函数序列 $f_n(t)\equiv e_n$ 在 $[0,1]$ 上显然等度连续且一致有界（$\|f_n\|_\infty=1$），但由于 $\|f_n-f_m\|_\infty=\sqrt2$（$n\neq m$），该序列在 $C([0,1],\ell^2)$ 中并不相对紧。

## 3. 典型应用：连续核 Fredholm 积分算子的紧性

设积分核 $k\in C([a,b]\times[c,d])$，考察从 $C[c,d]$ 到 $C[a,b]$ 的线性 Fredholm 积分算子：
$$
(Tf)(t)=\int_c^d k(t,s)f(s)\,ds,
\qquad T:C[c,d]\to C[a,b].
$$
我们来证明：**$T$ 将 $C[c,d]$ 中的任意有界集（特别是单位闭球 $\overline B(0,1)$）映为 $C[a,b]$ 中的相对紧集。**

**证明：** 考察单位闭球的像集 $\mathcal F=\{Tf:\|f\|_\infty\leq 1\}\subseteq C[a,b]$。
1. **一致有界性：** 对任意满足 $\|f\|_\infty\leq 1$ 的 $f\in C[c,d]$ 及 $t\in[a,b]$，有
   $$
   |(Tf)(t)|\leq \int_c^d |k(t,s)|\cdot|f(s)|\,ds\leq (d-c)\|k\|_\infty.
   $$
2. **等度连续性：** 对任意 $t,u\in[a,b]$ 及 $\|f\|_\infty\leq 1$，有
   $$
   |(Tf)(t)-(Tf)(u)|=\left|\int_c^d\bigl(k(t,s)-k(u,s)\bigr)f(s)\,ds\right|
   \leq(d-c)\sup_{s\in[c,d]}|k(t,s)-k(u,s)|.
   $$
   由于二元连续函数 $k(t,s)$ 在紧矩形 $[a,b]\times[c,d]$ 上必**一致连续**，当 $|t-u|\to 0$ 时，上式右端与 $f$ 无关地一致趋于零。这证明了像集 $\mathcal F$ 在 $[a,b]$ 上等度连续。

由 Ascoli-Arzelà 定理，像集 $\mathcal F=T(\overline B(0,1))$ 在 $C[a,b]$ 中相对紧。在泛函分析中，这类“将有界集映射为相对紧集”的有界线性算子称为**紧算子（Compact Operator）**。上述证明表明，积分运算具有内在的“光滑化与紧化效应”，这也是利用 Schauder 不动点定理求解非线性积分方程与微分方程的关键所在。

## 4. 条件缺失时的两类典型反例

1. **一致有界但缺乏等度连续性：**
   考察闭区间 $[0,1]$ 上的幂函数序列 $f_n(t)=t^n$（$n\geq 1$）。显然 $\|f_n\|_\infty=1$，故该序列一致有界；但在右端点 $t=1$ 附近，导数 $f_n'(1)=n\to\infty$，曲线越来越陡峭，破坏了等度连续性。事实上，对任意子列 $\{f_{n_k}\}$，$f_{n_k}(t)$ 都逐点收敛于不连续的极限函数
   $$
   f(t)=\begin{cases}0,&0\leq t<1,\\ 1,&t=1.\end{cases}
   $$
   倘若 $\{f_n\}$ 在 $C[0,1]$ 中有按上确界范数收敛（即一致收敛）的子列，其极限必定是连续函数且等于逐点极限 $f(t)$，矛盾！因此 $\{t^n\}$ 在 $C[0,1]$ 中不相对紧。
2. **等度连续但缺乏逐点有界性：**
   考察常值函数序列 $f_n(t)\equiv n$（$n\geq 1$）。由于每个函数的振幅恒为零（$|f_n(s)-f_n(t)|=0$），该序列显然等度连续；但它在每一点处均无界，任意两项之间距离满足 $\|f_n-f_m\|_\infty=|n-m|\geq 1$，故不含收敛子列，不相对紧。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_列紧与完全有界|有限网与相对紧]]
- [[03_紧性反例与习题方法|反例与习题方法]]
- [[泛函分析/05_凸集与不动点/02_Brouwer与Schauder不动点定理|紧性如何用于存在性]]
- [[泛函分析讲义上册习题册#1.3 紧性|原书 1.3 节]]

## 跨主题参照

- [[拓扑学 Munkres/Chapter 07 - Complete Metric Spaces and Function Spaces/46_Ascolis_Theorem#46.1 等度连续性|Ascolis Theorem]]：对照一般拓扑学中紧开拓扑下的 Ascoli 定理表述，留意定义域与目标空间拓扑假设的异同。
- [[SL谱理论/讲义/09_Green函数预解式与紧性#从核的对称性到紧性|Green函数预解式与紧性]]：将连续核积分算子的紧性判据与正则 Sturm-Liouville 边值问题的 Green 函数预解算子相对照。
