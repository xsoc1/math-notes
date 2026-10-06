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

函数空间的上确界距离要求同时控制所有自变量。只在每一个点上分别有界，无法阻止函数在越来越短的区间内急剧变化。等度连续正是阻止这种现象的统一条件。

## 1. 条件的量词

设 $K$ 为紧度量空间，$\mathcal F\subset C(K,\mathbb K)$。

> [!note] 定义
> $\mathcal F$ **逐点有界**：对每个 $t\in K$，$\sup_{f\in\mathcal F}|f(t)|<\infty$。
>
> $\mathcal F$ **等度连续**：对每个 $t\in K$、$\varepsilon>0$，存在 $\delta>0$，使对所有 $f\in\mathcal F$ 和 $s\in K$，
> $$
> d(s,t)<\delta\Longrightarrow |f(s)-f(t)|<\varepsilon.
> $$
> 这里 $\delta$ 可依赖于 $t,\varepsilon$，但不能依赖于 $f$。

在紧集上，上述等度连续可升级为统一的 $\delta(\varepsilon)$。对每个中心取半径 $r_t$，使该中心附近所有函数振幅小于 $\varepsilon/2$；取有限个 $B(t,r_t/2)$ 覆盖 $K$，令 $\delta$ 小于这些半径的一半。当 $d(s,u)<\delta$，先把 $s$ 放进某个小球，再把 $u$ 放进对应大球，经过中心比较即可。

## 2. Ascoli–Arzelà 定理

> [!note] 定理（标量值版本）
> $\mathcal F\subset C(K,\mathbb K)$ 在上确界范数下相对紧，当且仅当它逐点有界且等度连续。

**先证必要性。** 相对紧性给出任意精度下的有限函数网 $g_1,\ldots,g_N$。这些网心函数各自连续，在紧集上统一连续。若 $\|f-g_i\|_\infty<\varepsilon/3$，则
$$
|f(s)-f(t)|
\leq |f(s)-g_i(s)|+|g_i(s)-g_i(t)|+|g_i(t)-f(t)|
<\varepsilon
$$
对共同的充分小 $d(s,t)$ 成立，故等度连续。紧闭包经连续评价映象 $f\mapsto f(t)$ 的像紧，故每点有界。

**再证充分性。** 给定 $\varepsilon>0$，先取统一 $\delta$，使 $d(s,t)<\delta$ 时所有函数的差小于 $\varepsilon/3$。取有限 $\delta$ 网 $t_1,\ldots,t_N$。每个集合 $\{f(t_i):f\in\mathcal F\}$ 有界，在有限维标量域中完全有界。将每个坐标的值分入有限个直径小于 $\varepsilon/3$ 的小集合。

按这 $N$ 个坐标的归类，函数族只分成有限个非空组。每组先选一个代表 $g$；同组 $f,g$ 在所有 $t_i$ 上的差小于 $\varepsilon/3$。对任意 $t$ 选 $d(t,t_i)<\delta$，则
$$
|f(t)-g(t)|<\varepsilon/3+\varepsilon/3+\varepsilon/3=\varepsilon.
$$
这些代表构成有限 $\varepsilon$ 网，所以 $\mathcal F$ 完全有界。$C(K,\mathbb K)$ 完备，于是相对紧。$\square$

同一有限网论证还给出一致有界：取精度 1 的自变量网，任意 $f(t)$ 与某个 $f(t_i)$ 差小于 1，再取有限个逐点界的最大值即可。

> [!important] 向量值版本的边界
> 若值域是一般无限维 Banach 空间，须把“逐点有界”换成“每点的取值集相对紧”。常值函数族 $f_n(t)=e_n\in\ell^2$ 等度连续且一致有界，却不相对紧。

## 3. 连续核积分算子的紧性

设 $k\in C([a,b]\times[c,d])$，定义
$$
(Tf)(t)=\int_c^dk(t,s)f(s)\,ds,
\qquad T:C[c,d]\to C[a,b].
$$
核连续，故 $Tf$ 连续；线性直接来自积分。对 $\|f\|_\infty\leq1$，
$$
|Tf(t)|\leq(d-c)\|k\|_\infty,
$$
并且
$$
|Tf(t)-Tf(u)|
\leq(d-c)\sup_s|k(t,s)-k(u,s)|.
$$
$k$ 在紧矩形上一致连续，右端对所有单位球内的 $f$ 统一趋于零。因此单位球的像一致有界且等度连续，由 Ascoli 相对紧。

这样的有界线性算子称为**紧算子**：它把有界集送到相对紧集。这里先给出可直接验证的例子，不把紧算子的谱理论提前当作已证明结果。

## 4. 两类常见失败

$f_n(t)=t^n$ 在 $[0,1]$ 上一致有界，但在 1 附近不等度连续。若有一致收敛子列，其极限连续；然而任何指标趋于无穷的子列都逐点趋向“$t<1$ 时为 0、$t=1$ 时为 1”的不连续函数，矛盾。

另一方向，常值函数 $f_n(t)=n$ 等度连续，却在每一点都无界，也不可能相对紧。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_列紧与完全有界|有限网与相对紧]]
- [[03_紧性反例与习题方法|反例与习题方法]]
- [[泛函分析/05_凸集与不动点/02_Brouwer与Schauder不动点定理|紧性如何用于存在性]]
- [[泛函分析讲义上册习题册#1.3 紧性|原书 1.3 节]]
