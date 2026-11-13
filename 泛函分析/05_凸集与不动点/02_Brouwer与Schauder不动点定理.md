---
title: "Brouwer 与 Schauder 不动点定理"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-convex-fixed-point
  - theory-note
note_type: theory
source_section: "F/5 第 26–32 页；Brouwer 标号证明为补充；汪林 11.7、11.9"
exercise_range: "1.5 节"
status: "已补证"
---

# Brouwer 与 Schauder 不动点定理

在一维闭区间 $[a,b]$ 上，连续自映射 $T:[a,b]\to[a,b]$ 必有不动点——因为辅助函数 $g(x)=x-T(x)$ 在左端点满足 $g(a)\leq 0$，在右端点满足 $g(b)\geq 0$，介值定理保证必有零点。**Brouwer 不动点定理**将这一拓扑阻碍性质推广到了任意有限维紧凸集上；而 **Schauder 不动点定理**则进一步通过有限 $\varepsilon$-网的凸组合近似，将其延伸到了无限维赋范空间中的紧凸集（或紧映射）之上。

## 1. 组合拓扑基础：重心剖分与 Sperner 引理

为了给高维空间中的“介值现象”提供一个初等且严谨的组合证明，我们先在 $d$ 维标准单纯形（下文亦写作 $n$ 维单纯形 $\Delta^n=\operatorname{conv}\{v_0,v_1,\ldots,v_n\}$）上明确**重心剖分（barycentric subdivision）**的几何性质，并建立著名的 **Sperner 引理**。

### 1.1 重心剖分、公共面相容性与直径收缩率 $\frac{d}{d+1}$

设 $\sigma=\operatorname{conv}\{u_0,u_1,\ldots,u_d\}$ 是欧氏空间中的一个 $d$ 维单纯形（其顶点 $u_0,\ldots,u_d$ 仿射无关），其直径为 $\operatorname{diam}(\sigma)=\max_{0\leq i,j\leq d}\|u_i-u_j\|$（由凸性易知单纯形的直径必在某两个顶点之间达到）。

1. **重心与一阶重心剖分的构造：**
   对 $\sigma$ 的任意 $k$ 维面 $\tau=\operatorname{conv}\{u_{i_0},\ldots,u_{i_k}\}$（$0\leq k\leq d$），定义其**重心（barycenter）**为各顶点的算术平均：
   $$
   b(\tau)=\frac{1}{k+1}\sum_{r=0}^k u_{i_r}.
   $$
   取遍 $\sigma$ 中所有严格递增的面包含链 $\tau_0\subsetneq\tau_1\subsetneq\cdots\subsetneq\tau_d=\sigma$（这与顶点下标 $\{0,1,\ldots,d\}$ 的全体 $(d+1)!$ 个排列 $\pi$ 一一对应：令 $\tau_k=\operatorname{conv}\{u_{\pi(0)},\ldots,u_{\pi(k)}\}$），由链上各面的重心所张成的 $d$ 维小单纯形
   $$
   \sigma_\pi=\operatorname{conv}\bigl\{b(\tau_0),\ b(\tau_1),\ \ldots,\ b(\tau_d)\bigr\}
   $$
   共有 $(d+1)!$ 个，它们共同构成了 $\sigma$ 的**一阶重心剖分**。
2. **公共面相容性：**
   在任意给定的一阶重心剖分中，每一个面 $\tau\subseteq\sigma$ 的重心 $b(\tau)$ 仅由 $\tau$ 自身的顶点决定，而与包含 $\tau$ 的更高维单形无关。因此，当两个单纯形共享一个公共边界面 $\tau$ 时，各自的重心剖分在公共面 $\tau$ 上诱导出的子剖分**完全一致**（即相邻小单纯形之交必为空集或它们共同的一个完整低维面），严格满足单纯剖分的相容性条件。
3. **每次重心剖分直径按比例因子 $\frac{d}{d+1}$ 收缩的证明：**
   在同一个剖分小单纯形 $\sigma_\pi=\operatorname{conv}\{b(\tau_0),\ldots,b(\tau_d)\}$ 中，任取两个不同顶点 $b(\tau_j)$ 与 $b(\tau_k)$（不妨设 $0\leq j<k\leq d$，从而 $\tau_j\subsetneq\tau_k$）。记 $\tau_k=\operatorname{conv}\{w_0,w_1,\ldots,w_k\}$，由于 $b(\tau_j)$ 是 $\tau_j\subset\tau_k$ 中 $j+1$ 个顶点的重心，它是 $\tau_k$ 中的点。于是，点 $b(\tau_j)$ 到重心 $b(\tau_k)=\frac{1}{k+1}\sum_{r=0}^k w_r$ 的距离可由凸组合估计如下：对于 $\tau_k$ 的任意一个顶点 $w_s$，有
   $$
   \begin{aligned}
   \bigl\|w_s-b(\tau_k)\bigr\|
   &=\left\|w_s-\frac{1}{k+1}\sum_{r=0}^k w_r\right\|
   =\frac{1}{k+1}\left\|\sum_{r\neq s}(w_s-w_r)\right\|\\
   &\leq\frac{k}{k+1}\max_{0\leq r\leq k}\|w_s-w_r\|
   \leq\frac{k}{k+1}\operatorname{diam}(\sigma).
   \end{aligned}
   $$
   由于距离函数 $x\mapsto\|x-b(\tau_k)\|$ 是凸函数，$b(\tau_j)\in\tau_k=\operatorname{conv}\{w_0,\ldots,w_k\}$ 到 $b(\tau_k)$ 的距离不超过 $\tau_k$ 各顶点 $w_s$ 到 $b(\tau_k)$ 距离的最大值；再注意到 $k\leq d$ 且函数 $k\mapsto\frac{k}{k+1}$ 单调递增，立即得出：
   $$
   \bigl\|b(\tau_j)-b(\tau_k)\bigr\|
   \leq\max_{0\leq s\leq k}\bigl\|w_s-b(\tau_k)\bigr\|
   \leq\frac{k}{k+1}\operatorname{diam}(\sigma)
   \leq\frac{d}{d+1}\operatorname{diam}(\sigma).
   $$
   因此，一阶重心剖分中每个小单纯形的直径均不超过 $\frac{d}{d+1}\operatorname{diam}(\sigma)$！将重心剖分迭代进行 $r$ 次，所得第 $r$ 阶重心剖分的网格直径（mesh size）便满足几何级数收缩估计：
   $$
   \max_{\sigma'\in\mathcal T^{(r)}}\operatorname{diam}(\sigma')
   \leq\left(\frac{d}{d+1}\right)^r\operatorname{diam}(\sigma)\longrightarrow 0\quad(r\to\infty).
   $$
   这就从构造上严格保证了：对任意给定的精度 $1/m>0$，只需取充分大的重心剖分阶数 $r_m$，即可得到网格直径小于 $1/m$ 的相容单纯剖分 $\mathcal T_m$。

### 1.2 Sperner 引理及其归纳证明

> [!note] 引理 1.1 Sperner 引理
> 设 $\mathcal T$ 是 $n$ 维单纯形 $\Delta^n=\operatorname{conv}\{v_0,\ldots,v_n\}$ 的一个单纯剖分。对剖分 $\mathcal T$ 中的每一个顶点 $v$ 赋予一个整数标号 $L(v)\in\{0,1,\ldots,n\}$。若该标号满足 **Sperner 边界条件**：
> - 对每个主顶点有 $L(v_i)=i$；更一般地，凡位于由主顶点子集 $\{v_{i_0},\ldots,v_{i_k}\}$ 张成的 $k$ 维面上的剖分顶点 $v$，其标号必取自该面顶点的下标集合：
>   $$
>   v\in\operatorname{conv}\{v_{i_0},\ldots,v_{i_k}\}\quad\Longrightarrow\quad L(v)\in\{i_0,\ldots,i_k\},
>   $$
> 则剖分 $\mathcal T$ 中必存在**奇数个**（从而至少存在一个）**全标号 $n$ 维小单纯形**（即其 $n+1$ 个顶点的标号恰好遍取 $0,1,\ldots,n$）。

**证明（对维数 $n$ 作数学归纳法与对偶图奇偶握手定理）：**
- **归纳奠基（$n=0$）：** $0$ 维单纯形为单点 $\{v_0\}$，唯一标号为 $0$，全标号单纯形恰有 $1$ 个（奇数），结论成立。
- **归纳递推：** 假设引理对 $n-1$ 维单纯形成立。现考察 $n$ 维单纯形 $\Delta^n$ 的剖分 $\mathcal T$，我们将顶点的标号集合恰好为 $\{0,1,\ldots,n-1\}$ 的 $(n-1)$ 维小单纯形简称为**“特征面”**。
  构造一个无向对偶图 $G$：将剖分 $\mathcal T$ 中的每一个 $n$ 维小单纯形各视为一个内部结点，并将单纯形 $\Delta^n$ 外部空间视为一个“外部结点” $v_{\text{out}}$；每当两个 $n$ 维小单纯形共享一个“特征面”，或者某个 $n$ 维小单纯形的某个位于大单纯形边界 $\partial\Delta^n$ 上的侧面是“特征面”时，就在对应的两个结点之间连接一条边。考察图 $G$ 中各结点的度数：
  1. **全标号 $n$ 维小单纯形（标号集为 $\{0,1,\ldots,n\}$）：** 它的 $n+1$ 个 $(n-1)$ 维侧面中，只有去掉顶点 $n$ 所得的那个侧面标号集为 $\{0,1,\ldots,n-1\}$，故在图 $G$ 中的**度数为 $1$（奇度结点）**。
  2. **含全部标号 $0,1,\ldots,n-1$ 但不含标号 $n$ 的 $n$ 维小单纯形：** 由于它有 $n+1$ 个顶点，且标号取自 $\{0,1,\ldots,n-1\}$，必有某一个标号 $j\in\{0,\ldots,n-1\}$ 恰好重复了两次，其余标号各出现一次。分别去掉这两个标号为 $j$ 的顶点，恰好得到两个“特征面”，故此类结点在图 $G$ 中的**度数为 $2$（偶度结点）**。
  3. **其他 $n$ 维小单纯形（缺失 $\{0,1,\ldots,n-1\}$ 中至少一个标号）：** 不包含任何“特征面”，在图 $G$ 中的**度数为 $0$（偶度结点）**。
  4. **外部结点 $v_{\text{out}}$ 的度数：** 外部结点连出的边，对应于大单纯形边界 $\partial\Delta^n$ 上的“特征面”。由 Sperner 边界条件，在大单纯形的 $n+1$ 个 $(n-1)$ 维边界面中，凡包含主顶点 $v_n$ 的边界面都缺失至少一个标号 $i\in\{0,\ldots,n-1\}$，故不可能含有标号为 $\{0,1,\ldots,n-1\}$ 的“特征面”；因此，边界上的“特征面”全部落在对面 $\operatorname{conv}\{v_0,v_1,\ldots,v_{n-1}\}$ 上！而在该 $(n-1)$ 维单纯形 $\operatorname{conv}\{v_0,\ldots,v_{n-1}\}$ 上，限制的剖分与标号完全满足 $n-1$ 维的 Sperner 条件。由**归纳假设**，该边界面上含有的“特征面”个数必为**奇数**，即外部结点 $v_{\text{out}}$ 的度数为**奇数**！

  根据图论的基本握手定理（所有结点度数之和等于边数的两倍，故奇度结点的总个数必为偶数），既然外部结点 $v_{\text{out}}$ 的度数为奇数，那么内部结点中度数为奇数的结点（即度数为 $1$ 的**全标号 $n$ 维小单纯形**）的个数就必然也是**奇数**！$\square$

## 2. 有限维 Brouwer 不动点定理

> [!note] 定理 2.1 Brouwer 不动点定理
> 设 $C$ 是有限维赋范空间中的非空**紧凸集**，$T:C\to C$ 是连续自映射。则 $T$ 在 $C$ 中至少存在一个不动点 $x^*\in C$，满足 $Tx^*=x^*$。

**证明：**
1. **先证标准 $n$ 维单纯形 $\Delta^n=\bigl\{x=(x_0,\ldots,x_n)\in\mathbb R^{n+1}:x_i\geq 0,\ \sum_{i=0}^n x_i=1\bigr\}$ 的情形：**
   根据第 1.1 节的重心剖分直径收缩估计 $\bigl(\frac{n}{n+1}\bigr)^r\operatorname{diam}(\Delta^n)\to 0$，对每个正整数 $m\in\mathbb N$，通过取高阶重心剖分可构造 $\Delta^n$ 的一个网格直径（即所有小单纯形直径的最大值）小于 $1/m$ 的单纯剖分 $\mathcal T_m$。
   若剖分 $\mathcal T_m$ 的某个顶点 $v$ 已经满足 $T(v)=v$，则不动点已找到。否则，对每个剖分顶点 $x=(x_0,\ldots,x_n)$，记其像为 $T(x)=(T_0(x),\ldots,T_n(x))\in\Delta^n$。由于
   $$
   \sum_{i=0}^n x_i=1=\sum_{i=0}^n T_i(x),
   $$
   且向量 $x\neq T(x)$，两者之差不全为零，故必存在至少一个坐标下标 $i\in\{0,1,\ldots,n\}$，使得严格不等式
   $$
   x_i>T_i(x)
   $$
   成立。我们为顶点 $x$ 指定一个满足 $x_i>T_i(x)$ 的下标 $i$ 作为其标号 $L(x)=i$。
   **验证 Sperner 边界条件：** 若顶点 $x$ 位于由主顶点 $\{v_{i_0},\ldots,v_{i_k}\}$ 张成的边界面上，则对一切不属于 $\{i_0,\ldots,i_k\}$ 的下标 $j$，都有重心坐标 $x_j=0$；由于 $T_j(x)\geq 0$，不等式 $x_j>T_j(x)$ 在 $j\notin\{i_0,\ldots,i_k\}$ 时绝不可能成立！因此标号 $L(x)$ 必然属于 $\{i_0,\ldots,i_k\}$，满足 Sperner 条件。

   由 Sperner 引理（引理 1.1），在第 $m$ 轮剖分 $\mathcal T_m$ 中必存在一个全标号小单纯形，记其标号为 $0,1,\ldots,n$ 的 $n+1$ 个顶点分别为
   $$
   v^{(m,0)},\ v^{(m,1)},\ \ldots,\ v^{(m,n)}\in\Delta^n,
   $$
   它们各自满足第 $i$ 个坐标严格递减关系：
   $$
   \bigl(v^{(m,i)}\bigr)_i>T_i\bigl(v^{(m,i)}\bigr)\qquad(i=0,1,\ldots,n).
   $$
   由于 $\Delta^n$ 是紧集，点列 $\{v^{(m,0)}\}_{m=1}^\infty$ 存在收敛子列 $v^{(m_k,0)}\to x^*\in\Delta^n$（$k\to\infty$）。又因第 $m_k$ 轮小单纯形的直径小于 $1/m_k\to 0$，同一小单纯形其余顶点与 $v^{(m_k,0)}$ 的距离满足 $\|v^{(m_k,i)}-v^{(m_k,0)}\|<1/m_k\to 0$，故对每一个 $i\in\{0,1,\ldots,n\}$，同下标子列均收敛于同一个极限点：
   $$
   \lim_{k\to\infty}v^{(m_k,i)}=x^*\qquad(\forall i=0,1,\ldots,n).
   $$
   在不等式 $\bigl(v^{(m_k,i)}\bigr)_i>T_i\bigl(v^{(m_k,i)}\bigr)$ 两端令 $k\to\infty$，由坐标投影与映射 $T$ 的连续性可得
   $$
   x_i^*\geq T_i(x^*)\qquad(\forall i=0,1,\ldots,n).
   $$
   将这 $n+1$ 个非负差值 $x_i^*-T_i(x^*)\geq 0$ 相加，注意到 $\sum_{i=0}^n\bigl(x_i^*-T_i(x^*)\bigr)=1-1=0$，故每一项都必须等于零，即 $x_i^*=T_i(x^*)$（$\forall i$），从而 $Tx^*=x^*$！

2. **一般有限维非空紧凸集 $C$ 的情形：**
   由 [[01_凸集与Minkowski泛函#4. 有限维非空紧凸集与欧氏闭球的同胚|第 01 篇讲义第 4 节]] 可知，任意有限维非空紧凸集 $C$（设其仿射包维数为 $k$）与 $k$ 维欧氏闭球同胚，从而与 $k$ 维标准单纯形 $\Delta^k$ 存在拓扑同胚 $\Phi:\Delta^k\to C$。此时复合映射 $\widetilde T=\Phi^{-1}\circ T\circ\Phi:\Delta^k\to\Delta^k$ 是 $\Delta^k$ 上的连续自映射，由第 1 步存在 $u^*\in\Delta^k$ 使得 $\widetilde T(u^*)=u^*$；令 $x^*=\Phi(u^*)\in C$，即得 $Tx^*=x^*$。$\square$

## 3. 无限维 Schauder 不动点定理（有限网近似法）

在无限维赋范空间中，单位闭球不再紧致（第 4 节将展示单位闭球上的无不动点连续自映射）。为了将 Brouwer 定理推广到无限维，Schauder 洞察到：**只要映射的像集 $T(C)$ 是相对紧的（因而完全有界；在完备的 Banach 空间中相对紧与完全有界等价），就可以用有限 $\varepsilon$-网张成的有限维凸多面体逼近 $T(C)$，在有限维多面体上应用 Brouwer 定理找到近似不动点，再由相对紧性抽取收敛子列得到真不动点。**

> [!note] 定理 3.1 Schauder 不动点定理
> 设 $X$ 是赋范线性空间，$C\subseteq X$ 是非空**闭凸集**，$T:C\to C$ 是连续映射。若像集 $T(C)$ 在 $X$ 中是**相对紧集**（即 $\overline{T(C)}$ 在 $X$ 中紧致），则 $T$ 在 $C$ 中至少存在一个不动点 $x^*\in C$，满足 $Tx^*=x^*$。

*注：在上述定理表述中，由于已经直接假设了像集 $T(C)$ 在 $X$ 中相对紧，这本身已保证了 $T(C)$ 中任意序列拥有收敛于 $X$ 内某点的子列，故甚至无需显式假设整个环境空间 $X$ 完备；而在常见的验证场景中，我们通常是先在完备的 Banach 空间 $X$ 中证明 $T(C)$ 完全有界，再由环境空间完备性推出 $T(C)$ 相对紧（若环境空间 $X$ 不完备，仅 $T(C)$ 完全有界并不足以保证不动点留在 $X$ 内）。*

**证明：**
1. **构造有限维 Schauder 近似映射 $P_n$：**
   对每个正整数 $n\in\mathbb N$，令精度 $\varepsilon_n=1/n$。由于 $T(C)$ 相对紧，它必是完全有界集，故存在有限个网心点 $y_1,y_2,\ldots,y_{m_n}\in T(C)\subseteq C$，使得开球族 $\bigcup_{i=1}^{m_n}B(y_i,\varepsilon_n)$ 覆盖 $T(C)$。
   为了将 $T(C)$ 连续地映射进由这有限个网心张成的有限维紧凸多面体
   $$
   C_n=\operatorname{conv}\{y_1,y_2,\ldots,y_{m_n}\}\subseteq C
   $$
   （注意：因为 $y_i\in C$ 且 $C$ 是凸集，有限凸包 $C_n$ 完全包含在 $C$ 内部！），我们在 $T(C)$ 上引入距离截断权函数：
   $$
   w_i(y)=\max\bigl\{0,\ \varepsilon_n-\|y-y_i\|\bigr\}\quad(i=1,\ldots,m_n).
   $$
   对任意 $y\in T(C)$，由于至少有一个网心 $y_i$ 满足 $\|y-y_i\|<\varepsilon_n$，故对应权重 $w_i(y)>0$，从而分母 $\sum_{j=1}^{m_n}w_j(y)>0$ 恒严格为正。定义归一化重心权重与 **Schauder 近似映射** $P_n:T(C)\to C_n$ 为：
   $$
   \lambda_i(y)=\frac{w_i(y)}{\sum_{j=1}^{m_n}w_j(y)},\qquad
   P_n(y)=\sum_{i=1}^{m_n}\lambda_i(y)y_i.
   $$
   由于每个 $w_i(y)$ 连续且 $\lambda_i(y)\geq 0,\ \sum_{i=1}^{m_n}\lambda_i(y)=1$，$P_n$ 是从 $T(C)$ 到有限维紧凸集 $C_n$ 的连续映射。同时，注意到只要权重 $\lambda_i(y)>0$，就必有 $w_i(y)>0$，即 $\|y-y_i\|<\varepsilon_n$！因此，对一切 $y\in T(C)$，近似误差满足一致估计：
   $$
   \|P_n(y)-y\|=\left\|\sum_{i=1}^{m_n}\lambda_i(y)(y_i-y)\right\|
   \leq\sum_{i=1}^{m_n}\lambda_i(y)\|y_i-y\|
   <\sum_{i=1}^{m_n}\lambda_i(y)\varepsilon_n=\varepsilon_n=\frac{1}{n}.
   $$
   （注：$P_n$ 是一个非线性的连续重心插值映射，有时虽俗称为“Schauder 投影”，但它既非线性算子也非幂等映射，切勿与 Hilbert 空间中的线性正交投影混同。）

2. **在有限维凸集 $C_n$ 上应用 Brouwer 定理寻找近似不动点：**
   考察限制在有限维非空紧凸集 $C_n\subseteq C$ 上的复合映射
   $$
   T_n=P_n\circ T\big|_{C_n}:C_n\to C_n.
   $$
   由于 $T$ 与 $P_n$ 均连续，$T_n$ 是有限维非空紧凸集 $C_n$ 上的连续自映射。由 **Brouwer 不动点定理（定理 2.1）**，存在点 $x_n\in C_n\subseteq C$ 使得 $T_n(x_n)=x_n$，即 $x_n=P_n(Tx_n)$。代入第 1 步的近似误差估计，即得
   $$
   \|x_n-Tx_n\|=\|P_n(Tx_n)-Tx_n\|<\frac{1}{n}\qquad(\forall n\in\mathbb N).
   $$

3. **利用相对紧性抽取收敛子列：**
   由于像点序列 $\{Tx_n\}_{n=1}^\infty\subseteq T(C)$，而 $T(C)$ 在 $X$ 中相对紧，故存在子列 $\{Tx_{n_k}\}$ 在 $X$ 中收敛于某点 $x^*\in X$：
   $$
   \lim_{k\to\infty}Tx_{n_k}=x^*.
   $$
   结合 $\|x_{n_k}-Tx_{n_k}\|<1/n_k\to 0$ 及三角不等式，可知同下标子列 $\{x_{n_k}\}$ 也收敛于同一个极限点 $x^*$：
   $$
   \lim_{k\to\infty}x_{n_k}=x^*.
   $$
   因为 $\{x_{n_k}\}\subseteq C$ 且 $C$ 是**闭集**，故极限点 $x^*\in C$。最后由映射 $T:C\to C$ 在点 $x^*$ 处的**连续性**，得
   $$
   Tx^*=T\left(\lim_{k\to\infty}x_{n_k}\right)=\lim_{k\to\infty}Tx_{n_k}=x^*.
   $$
   故 $x^*\in C$ 即为 $T$ 的不动点。$\square$

> [!note] 推论 3.1 Schauder 定理的紧凸集版本
> 设 $K$ 是赋范线性空间 $X$ 中的非空**紧凸集**，$T:K\to K$ 是连续自映射，则 $T$ 在 $K$ 中必有不动点。

## 4. 反例：无限维空间中“有界闭凸集”不能替代“紧凸集”

在有限维空间中，有界闭凸集就是紧凸集；但在无限维 Banach 空间中，若仅假设 $C$ 是有界闭凸集（如单位闭球），且 $T:C\to C$ 仅连续（甚至等距非扩张），当缺少像集的相对紧性时，不动点完全可能不存在：

1. **$c_0$ 单位闭球上的无不动点等距映射（汪林 11.9，印刷版第 220 页 / PDF 第 245 页）：**
   在 $(c_0,\|\cdot\|_\infty)$ 的单位闭球 $C=\overline B_{c_0}(0,1)$ 上定义右移加一映射：
   $$
   T(x_1,x_2,x_3,\ldots)=(1,x_1,x_2,\ldots).
   $$
   由于当 $x\in c_0$ 且 $\|x\|_\infty\leq 1$ 时，$Tx$ 的各项坐标仍收敛于零且 $\|Tx\|_\infty=1$，故 $T(C)\subseteq C$；同时 $\|Tx-Ty\|_\infty=\|x-y\|_\infty$，即 $T$ 是 $1$-Lipschitz 连续映射。然而，倘若存在不动点 $x=Tx$，则逐坐标比较可得 $1=x_1=x_2=x_3=\cdots$，即 $x=(1,1,1,\ldots)$，这与 $x\in c_0$（坐标必须趋于零）矛盾！此处 Banach 定理失效是因为压缩常数不能小于 $1$，而 Schauder 定理失效则是因为像集 $T(C)$ 在 $c_0$ 中不相对紧。

2. **Hilbert 空间 $\ell^2$ 单位闭球上的无不动点连续自映射（Kakutani 型反例，同汪林 11.7 机制）：**
   在 $\ell^2$ 的单位闭球 $C=\overline B_{\ell^2}(0,1)$ 上定义非线性连续映射：
   $$
   T(x)=\left(\sqrt{1-\|x\|_2^2},\ x_1,\ x_2,\ \ldots\right).
   $$
   对任意 $x\in C$，计算像的范数平方得 $\|Tx\|_2^2=(1-\|x\|_2^2)+\|x\|_2^2=1$，故 $T$ 将整个单位闭球 $C$ 连续地映射到单位球面 $\partial B_{\ell^2}(0,1)\subseteq C$ 上。倘若存在不动点 $x=Tx\in C$，则从第二项起逐坐标比较可得 $x_1=x_2=x_3=\cdots$；为了使 $\sum_{k=1}^\infty|x_k|^2<\infty$，唯一的可能是所有坐标全为零（即 $x=0$），但此时第一坐标却要求 $0=x_1=\sqrt{1-\|0\|_2^2}=1$，矛盾！

## 5. 应用：常微分方程的 Peano 存在定理

回到 [[泛函分析/02_压缩映象原理/04_微分方程与参数不动点#1. 常微分方程初值问题的局部 Picard–Lindelöf 定理|02 专题第 4 节]] 讨论的有限维常微分方程初值问题
$$
u'(t)=f(t,u(t)),\qquad u(t_0)=u_0\in\mathbb R^m.
$$
若去掉 $f(t,u)$ 关于第二个变量 $u$ 的 Lipschitz 条件，**仅假设 $f$ 在紧矩形区域 $R=[t_0-a,t_0+a]\times\overline B_{\mathbb R^m}(u_0,b)$ 上连续**，此时积分算子 $T$ 不再是压缩映射，Picard 迭代未必收敛。但借助 **Schauder 不动点定理** 与 **Ascoli-Arzelà 定理**，我们依然可以证明局部经典解的存在性：

> [!note] 定理 5.1 Peano 局部存在定理
> 设 $f:R=[t_0-a,t_0+a]\times\overline B_{\mathbb R^m}(u_0,b)\to\mathbb R^m$ 连续，记 $M=\max_{(t,u)\in R}|f(t,u)|$，并取时间步长 $h>0$ 满足 $h\leq a$ 且 $Mh\leq b$。则初值问题 $u'(t)=f(t,u(t)),\ u(t_0)=u_0$ 在区间 $I=[t_0-h,t_0+h]$ 上**至少存在一个**连续可微解 $u\in C^1(I,\mathbb R^m)$。

**证明：**
1. **闭凸工作集与自映射：** 在 Banach 空间 $(C(I,\mathbb R^m),\|\cdot\|_\infty)$ 中取闭球
   $$
   \mathcal M=\bigl\{u\in C(I,\mathbb R^m):\|u-u_0\|_\infty\leq b\bigr\}.
   $$
   $\mathcal M$ 是非空有界闭凸集。在其上定义积分算子 $(Tu)(t)=u_0+\int_{t_0}^t f(s,u(s))\,ds$。由 $Mh\leq b$ 知对一切 $u\in\mathcal M$ 有 $\|Tu-u_0\|_\infty\leq Mh\leq b$，故 $T(\mathcal M)\subseteq\mathcal M$。
2. **映射 $T$ 的连续性：** 由于 $f$ 在紧集 $R$ 上连续，由 Cantor 定理知 $f$ 在 $R$ 上**一致连续**。因此，若 $\mathcal M$ 中序列 $\|u_n-u\|_\infty\to 0$，则复合函数列 $f(s,u_n(s))$ 在 $s\in I$ 上一致收敛于 $f(s,u(s))$，从而积分后 $\|Tu_n-Tu\|_\infty\leq h\sup_{s\in I}|f(s,u_n(s))-f(s,u(s))|\to 0$，即 $T$ 在 $\mathcal M$ 上连续。
3. **像集 $T(\mathcal M)$ 的相对紧性（Ascoli-Arzelà 定理）：** 对任意 $u\in\mathcal M$ 及 $t,s\in I$，有一致有界性 $\|(Tu)\|_\infty\leq |u_0|+b$，以及等度连续性（统一 Lipschitz 估计）：
   $$
   |(Tu)(t)-(Tu)(s)|=\left|\int_s^t f(\tau,u(\tau))\,d\tau\right|\leq M|t-s|.
   $$
   因为值域 $\mathbb R^m$ 是**有限维空间**，由 Ascoli-Arzelà 定理知像集 $T(\mathcal M)$ 在 $C(I,\mathbb R^m)$ 中相对紧！
4. **应用 Schauder 定理：** 由定理 3.1，存在 $u\in\mathcal M$ 使得 $Tu=u$，再由微积分基本定理即得 $u\in C^1(I,\mathbb R^m)$ 为初值问题的解。$\square$

**关于 Peano 定理的两个重要边界：**
1. **解未必唯一：** Peano 定理只保证存在性，不保证唯一性。例如标量方程 $u'(t)=\sqrt{|u(t)|},\ u(0)=0$，右端函数在原点处连续但非 Lipschitz，除了零解 $u(t)\equiv 0$ 外，对任意 $a\geq 0$，分段函数（在 $[0,a]$ 上为 $0$，在 $t>a$ 上为 $\frac{1}{4}(t-a)^2$）都是其 $C^1$ 解。
2. **有限维假设不可省略（Dieudonné 反例）：** 在上述证明第 3 步应用向量值 Ascoli-Arzelà 定理时，核心依赖了**有限维空间 $\mathbb R^m$ 中的有界球 $\overline B_{\mathbb R^m}(u_0,b)$ 是紧集**。在一般无限维 Banach 空间（如 $c_0$ 或 $\ell^2$）中，有界集不再相对紧，著名的 Dieudonné 反例（如在 $c_0$ 上取 $f_n(x)=\sqrt{|x_n|}+1/n$）表明：在无限维 Banach 空间中，右端仅连续的常微分方程初值问题甚至可以**完全无解**。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_凸集与Minkowski泛函|有限维凸体与凸组合]]
- [[泛函分析/03_紧性与函数族/02_Ascoli定理与紧性判别|Ascoli 与紧积分算子]]
- [[泛函分析/02_压缩映象原理/04_微分方程与参数不动点|压缩法与唯一性]]
- [[泛函分析讲义上册习题册#1.5 凸集与不动点|原书 1.5 节]]
