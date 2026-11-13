---
title: "Hahn–Banach 延拓定理"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-hahn-banach
  - theory-note
note_type: theory
source_section: "F/11 的受控与保范延拓部分；汪林 3.5"
exercise_range: "2.4 节"
status: "已补证"
---

# Hahn–Banach 延拓定理

## 1. 实线性空间上的次线性控制延拓定理（代数/解析版本）

Hahn–Banach 定理最一般的形式建立在没有任何拓扑结构的实线性空间上，其控制上界仅需满足次可加性与正齐次性。

> [!note] 定理 1.1 实空间 Hahn–Banach 延拓定理（次线性控制版本）
> 设 $X$ 是实线性空间，$p:X\to\mathbb R$ 是 $X$ 上的**次线性泛函**（即满足次可加性 $p(x+y)\leq p(x)+p(y)$ 与正齐次性 $p(\lambda x)=\lambda p(x),\ \forall\lambda\geq 0$）。设 $M\subseteq X$ 是 $X$ 的线性子空间，$f:M\to\mathbb R$ 是定义在 $M$ 上的实线性泛函，且在 $M$ 上受 $p$ 控制：
> $$
> f(m)\leq p(m)\qquad(\forall m\in M).
> $$
> 则存在定义在全空间 $X$ 上的实线性泛函 $F:X\to\mathbb R$，使得 $F$ 是 $f$ 的延拓（$F|_M=f$），且在全空间 $X$ 上依然受 $p$ 控制：
> $$
> F(x)\leq p(x)\qquad(\forall x\in X).
> $$

*注：定理中的次线性泛函 $p$ 无需假设非负，也无需满足对称性 $p(-x)=p(x)$（从而能够涵盖非平衡凸集的 Minkowski 泛函）。证明分为“一维扩张”与“Zorn 引理超限归纳”两个经典部分。*

### 1.1 第一步：向子空间外扩张一个新维数

若 $M\neq X$，任取一个不在 $M$ 中的新方向向量 $z\in X\setminus M$，考察由 $M$ 与 $z$ 直和张成的扩充子空间
$$
M_1=M\oplus\mathbb R z=\bigl\{m+tz:m\in M,\ t\in\mathbb R\bigr\}.
$$
为了将 $f$ 线性地延拓到 $M_1$ 上，任何线性延拓 $F_1:M_1\to\mathbb R$ 必然形如
$$
F_1(m+tz)=f(m)+tc,
$$
其中常数 $c=F_1(z)\in\mathbb R$ 是唯一待确定的实数！我们需要选取实数 $c$，使得对一切 $m\in M$ 和一切 $t\in\mathbb R$ 恒满足控制不等式：
$$
f(m)+tc\leq p(m+tz).
$$
- 当 $t=0$ 时，上式即为已知条件 $f(m)\leq p(m)$；
- 当 $t>0$ 时，将上式两边同除以 $t>0$，并利用 $f$ 的线性性与 $p$ 的正齐次性，不等式等价于 $f(\frac{m}{t})+c\leq p(\frac{m}{t}+z)$；由于当 $m$ 遍历子空间 $M$ 时，$n=\frac{m}{t}$ 同样遍历 $M$，这等价于要求
  $$
  c\leq p(n+z)-f(n)\qquad(\forall n\in M);
  $$
- 当 $t=-s<0$（其中 $s>0$）时，将不等式 $f(m)-sc\leq p(m-sz)$ 两边同除以 $s>0$，并记 $m'=m/s\in M$，这等价于要求 $f(m')-c\leq p(m'-z)$，即
  $$
  f(m')-p(m'-z)\leq c\qquad(\forall m'\in M).
  $$

综合正负两个方向的要求，常数 $c\in\mathbb R$ 的选取充要条件是满足双侧包夹不等式：
$$
\sup_{m'\in M}\bigl[f(m')-p(m'-z)\bigr]
\leq c\leq
\inf_{n\in M}\bigl[p(n+z)-f(n)\bigr].
\tag{1}
$$
**为什么满足式 (1) 的实数 $c$ 一定存在？** 只需验证对 $M$ 中的任意两个独立元素 $m',n\in M$，左端的任意一个下界候选值都不超过右端的任意一个上界候选值！事实上，利用 $f$ 在 $M$ 上的线性性、已知受控条件 $f\leq p$ 以及 $p$ 的次可加性，直接计算可得：
$$
f(m')+f(n)=f(m'+n)\leq p(m'+n)=p\bigl((m'-z)+(n+z)\bigr)\leq p(m'-z)+p(n+z).
$$
移项即得对一切 $m',n\in M$ 恒有
$$
f(m')-p(m'-z)\leq p(n+z)-f(n)!
$$
先固定 $n\in M$ 对 $m'\in M$ 取上确界，再对 $n\in M$ 取下确界（且取 $m'=0$ 或 $n=0$ 可知上下确界均为有限实数），即证得式 (1) 左端的上确界小于等于右端的下确界，区间非空。任取该闭区间中的一个实数 $c$，即完成了一维受控延拓。

### 1.2 第二步：应用 Zorn 引理覆盖整个空间

记 $\mathcal E$ 为 $f$ 的全体受控线性延拓对 $(Y,g)$ 构成的集合（其中 $M\subseteq Y\subseteq X$ 为线性子空间，$g:Y\to\mathbb R$ 线性，$g|_M=f$ 且在 $Y$ 上 $g\leq p$）。在非空集合 $\mathcal E$（至少含 $(M,f)\in\mathcal E$）上定义偏序关系 $\preceq$：
$$
(Y_1,g_1)\preceq(Y_2,g_2)\quad\Longleftrightarrow\quad Y_1\subseteq Y_2\ \text{且}\ g_2|_{Y_1}=g_1.
$$
任取 $\mathcal E$ 中的一条非空全序链 $\mathcal C=\{(Y_\alpha,g_\alpha)\}_{\alpha\in\Lambda}$。令
$$
\widetilde Y=\bigcup_{\alpha\in\Lambda}Y_\alpha,
$$
并在 $\widetilde Y$ 上定义 $\widetilde g(x)=g_\alpha(x)$（若 $x\in Y_\alpha$）。由于 $\mathcal C$ 是全序链，对任意两个元素 $x,y\in\widetilde Y$，存在同一个较大的子空间 $Y_\gamma$ 同时包含 $x$ 与 $y$，且不同下标对应的函数在交集上完全一致。因此 $\widetilde Y$ 是线性子空间，$\widetilde g$ 良定义、保持线性且满足 $\widetilde g\leq p$，从而 $(\widetilde Y,\widetilde g)\in\mathcal E$ 是链 $\mathcal C$ 的上界。

由 **Zorn 引理**，$\mathcal E$ 中存在极大元 $(Y_{\max},F)$。倘若 $Y_{\max}\neq X$，则可任取 $z\in X\setminus Y_{\max}$，由 1.1 节的一维延拓步骤构造出严格更大的受控延拓 $(Y_{\max}\oplus\mathbb R z,F_1)\in\mathcal E$，这与 $(Y_{\max},F)$ 的极大性矛盾！因此必有 $Y_{\max}=X$，定理 1.1 得证。$\square$

## 2. 实与复赋范空间上的保范延拓定理

将定理 1.1 应用于赋范线性空间（取次线性函数为 $p(x)=\|f\|_{M^*}\|x\|$），并通过 Bohnenblust-Sobczyk 实化技巧推广到复空间，便得到对偶空间理论中最常用的保范延拓版本：

> [!note] 定理 2.1 赋范空间 Hahn–Banach 保范延拓定理
> 设 $X$ 是实或复赋范线性空间（无需假设 $X$ 完备），$M\subseteq X$ 是任意线性子空间（无需假设 $M$ 闭），$f\in M^*$ 是定义在 $M$ 上的连续线性泛函。则存在全空间上的连续线性泛函 $F\in X^*$，使得
> $$
> F|_M=f,\qquad\text{且}\qquad \|F\|_{X^*}=\|f\|_{M^*}.
> $$

**证明：**
1. **实赋范空间情形：** 在全空间 $X$ 上定义次线性泛函 $p(x)=\|f\|_{M^*}\|x\|$。在子空间 $M$ 上显然有 $f(m)\leq|f(m)|\leq\|f\|_{M^*}\|m\|=p(m)$。由定理 1.1，存在实线性延拓 $F:X\to\mathbb R$ 使得 $F|_M=f$ 且对一切 $x\in X$ 有 $F(x)\leq\|f\|_{M^*}\|x\|$。将 $-x$ 代入该不等式，得 $-F(x)=F(-x)\leq\|f\|_{M^*}\|-x\|=\|f\|_{M^*}\|x\|$，合并即得
   $$
   |F(x)|\leq\|f\|_{M^*}\|x\|\qquad(\forall x\in X).
   $$
   故 $\|F\|_{X^*}\leq\|f\|_{M^*}$；另一方面，因 $F$ 在 $M$ 上与 $f$ 重合，必有 $\|F\|_{X^*}\geq\|F|_M\|_{M^*}=\|f\|_{M^*}$，故 $\|F\|_{X^*}=\|f\|_{M^*}$。
2. **复赋范空间情形（实部延拓与复线性重构法）：**
   在复空间中，由于复数不能比较大小，不能直接写 $f(x)\leq p(x)$。为此，先将复线性空间 $X$ 和 $M$ 视作实线性空间，考察复线性泛函 $f:M\to\mathbb C$ 的**实部**
   $$
   h(m)=\operatorname{Re}f(m)\qquad(m\in M).
   $$
   显然 $h:M\to\mathbb R$ 是实线性泛函，且 $|h(m)|\leq|f(m)|\leq\|f\|_{M^*}\|m\|$。同时，在子空间 $M$ 上，由于 $f(im)=if(m)=-\operatorname{Im}f(m)+i\operatorname{Re}f(m)$，取实部可知虚部满足 $\operatorname{Im}f(m)=-\operatorname{Re}f(im)=-h(im)$，故复泛函 $f$ 完全由其实部 $h$ 唯一重构为 $f(m)=h(m)-ih(im)$！
   现在，对实线性泛函 $h:M\to\mathbb R$ 应用第 1 步的**实空间保范延拓定理**，得到全空间 $X$ 上的实线性泛函 $H:X\to\mathbb R$，满足 $H|_M=h$ 且对一切 $x\in X$ 有 $|H(x)|\leq\|f\|_{M^*}\|x\|$。我们据此在全空间 $X$ 上定义复值泛函：
   $$
   F(x)=H(x)-iH(ix)\qquad(x\in X).
   $$
   - **验证复线性性与延拓关系：** $F$ 显然是实线性的；且对任意 $x\in X$，有
     $$
     F(ix)=H(ix)-iH(i^2x)=H(ix)+iH(x)=i\bigl(H(x)-iH(ix)\bigr)=iF(x),
     $$
     故 $F$ 是**复线性泛函**，且在 $M$ 上 $F(m)=h(m)-ih(im)=f(m)$。
   - **利用相位旋转验证保范性 $|F(x)|\leq\|f\|_{M^*}\|x\|$：** 对任意固定的 $x\in X$，将复数 $F(x)\in\mathbb C$ 写为极坐标形式，选取模长为 $1$ 的复数 $\eta\in\mathbb C$（$|\eta|=1$），使得旋转后的复数恰好等于其模长（非负实数）：
     $$
     |F(x)|=\eta F(x)=F(\eta x).
     $$
     由于上式左端 $|F(x)|$ 是实数，右端复数 $F(\eta x)$ 的虚部必为零，故它恰好等于自身的实部 $H(\eta x)$！于是结合 $|\eta|=1$ 立得：
     $$
     |F(x)|=\operatorname{Re}F(\eta x)=H(\eta x)\leq\|f\|_{M^*}\|\eta x\|=\|f\|_{M^*}|\eta|\cdot\|x\|=\|f\|_{M^*}\|x\|.
     $$
     这证明了 $\|F\|_{X^*}=\|f\|_{M^*}$。$\square$

## 3. 核心推论：支撑泛函、范数的对偶公式与点到闭子空间的距离检测

借助定理 2.1，在任意赋范线性空间 $X$ 中，我们都可以构造出检测单个向量范数或点到闭子空间距离的连续线性泛函：

> [!note] 推论 3.1 范数支撑泛函与闭子空间距离分离泛函
> 1. **单个向量的范数支撑泛函：** 对任意非零向量 $x_0\in X\setminus\{0\}$，存在范数为 $1$ 的连续线性泛函 $F\in X^*$，使得
>    $$
>    \|F\|_{X^*}=1,\qquad F(x_0)=\|x_0\|.
>    $$
>    因此，空间中的任意向量 $x\in X$ 的范数均可由对偶单位球精确还原（与算子范数公式对偶）：
>    $$
>    \|x\|=\max_{\|F\|_{X^*}\leq 1}|F(x)|\qquad(\forall x\in X).
>    $$
>    特别地，若对一切 $F\in X^*$ 都有 $F(x)=0$，则必有 $x=0$（即 $X^*$ 能够分离 $X$ 中的点）。
> 2. **点到闭子空间的距离检测泛函：** 设 $M$ 是赋范空间 $X$ 的闭线性子空间，$x_0\in X\setminus M$，记距离 $d=d(x_0,M)=\inf_{m\in M}\|x_0-m\|>0$。则存在连续线性泛函 $F\in X^*$，使得
>    $$
>    F|_M=0,\qquad F(x_0)=d(x_0,M),\qquad \|F\|_{X^*}=1.
>    $$

**证明：**
1. 在一维子空间 $M=\operatorname{span}\{x_0\}=\{tx_0:t\in\mathbb K\}$ 上定义线性泛函 $f(tx_0)=t\|x_0\|$。显然 $f(x_0)=\|x_0\|$ 且 $|f(tx_0)|=|t|\cdot\|x_0\|=\|tx_0\|$，故 $\|f\|_{M^*}=1$。对 $f$ 应用定理 2.1 保范延拓至全空间，即得所需的 $F\in X^*$。
2. 在扩充子空间 $M_1=M\oplus\mathbb K x_0=\{m+tx_0:m\in M,\ t\in\mathbb K\}$ 上定义线性泛函
   $$
   f(m+tx_0)=td.
   $$
   显然 $f|_M=0$ 且 $f(x_0)=d$。来计算 $f$ 在 $M_1$ 上的范数：
   - 一方面，对任意 $m\in M$ 和 $t\neq 0$，由于 $-t^{-1}m\in M$，有
     $$
     |f(m+tx_0)|=|t|d=|t|\inf_{m'\in M}\|x_0-m'\|\leq|t|\cdot\bigl\|x_0-(-t^{-1}m)\bigr\|=\|m+tx_0\|,
     $$
     故 $\|f\|_{M_1^*}\leq 1$；
   - 另一方面，由下确界 $d=\inf_{m\in M}\|x_0-m\|$ 的定义，可取序列 $\{m_k\}\subseteq M$ 使得 $\|x_0-m_k\|\to d$，于是在向量 $x_0-m_k\in M_1$ 上有 $\frac{|f(x_0-m_k)|}{\|x_0-m_k\|}=\frac{d}{\|x_0-m_k\|}\to 1$，故 $\|f\|_{M_1^*}\geq 1$。
   因此 $\|f\|_{M_1^*}=1$。由定理 2.1 将 $f$ 保范延拓至全空间 $X$，即得满足全部要求的 $F\in X^*$。$\square$

*重要对比：* 推论 3.1 第 1 条表明，对每一个固定的原空间向量 $x_0\in X$，在对偶空间 $X^*$ 的单位球面上**总能取到最大值**（存在 $F\in X^*,\ \|F\|=1$ 使 $F(x_0)=\|x_0\|$）；然而反过来，如 [[泛函分析/07_有界算子与对偶空间/02_对偶空间与算子反例#3. 反例：算子范数的上确界未必能作为最大值取到（汪林 2.42 机制）|07 专题第 2 节]] 所示，对一个固定的泛函 $F\in X^*$，在原空间 $X$ 的单位球面上却**未必存在向量 $x$ 能取到 $\|F\|$**！这两者的不对称性正是判断空间 $X$ 是否**自反（Reflexive，$X^{**}\cong X$）**的试金石。

## 4. 反例：Hahn–Banach 保范延拓未必唯一（汪林 3.5）

在 [[泛函分析/07_有界算子与对偶空间/01_连续线性算子与算子范数#4. 稠密子空间上有界线性算子的唯一保范延拓|07 专题第 4 节]] 中我们看到，稠密子空间上的连续延拓是唯一的；但当子空间 $M$ 在 $X$ 中不稠密时，定理 1.1 第 1.1 步中的延拓常数 $c$ 取自一个可能具有正长度的闭区间，因此 **Hahn–Banach 保范延拓一般并不唯一**（当且仅当对偶空间 $X^*$ 严格凸时，保范延拓才处处唯一）：

> [!example] 汪林 3.5：$\ell^1$ 型平面 $(\mathbb K^2,\|\cdot\|_1)$ 上保范延拓不唯一的反例
> 在赋予 $1$-范数 $\|(x,y)\|_1=|x|+|y|$ 的二维空间 $X=(\mathbb K^2,\|\cdot\|_1)$ 中，取一维子空间 $M=\{(x,0):x\in\mathbb K\}$，并在 $M$ 上定义线性泛函
> $$
> f(x,0)=x\qquad\bigl(\|f\|_{M^*}=1\bigr).
> $$
> 则对闭单位圆盘内的**任意标量参数** $\alpha\in\mathbb K$（$|\alpha|\leq 1$），全空间上的线性泛函
> $$
> F_\alpha(x,y)=x+\alpha y
> $$
> 都是 $f$ 的保范延拓（即 $F_\alpha|_M=f$ 且 $\|F_\alpha\|_{X^*}=1$）！

**验证：** 显然 $F_\alpha(x,0)=x=f(x,0)$。对任意 $(x,y)\in\mathbb K^2$，由于 $|\alpha|\leq 1$，有
$$
|F_\alpha(x,y)|=|x+\alpha y|\leq|x|+|\alpha|\cdot|y|\leq|x|+|y|=\|(x,y)\|_1,
$$
且在单位向量 $(1,0)$ 处 $F_\alpha(1,0)=1$，故对一切 $|\alpha|\leq 1$ 都有 $\|F_\alpha\|_{X^*}=1$，保范延拓有无穷多个（参见汪林《泛函分析中的反例》3.5，印刷版第 47 页 / PDF 第 72 页）。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_凸集分离与支撑泛函|从受控延拓到几何分离]]
- [[03_中值不等式与凸优化|范数支撑泛函的应用]]
- [[泛函分析/07_有界算子与对偶空间/02_对偶空间与算子反例|向量值保范延拓的失败]]
- [[泛函分析讲义上册习题册#2.4 Hahn-Banach 定理及其应用|原书 2.4 节]]
