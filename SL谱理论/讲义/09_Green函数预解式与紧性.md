---
title: Green 函数、预解式与紧性
date: 2026-09-12
tags:
  - SL
  - spectral-theory
  - green-function
  - resolvent
  - compactness
aliases:
  - Green 函数
  - 预解式
  - 紧预解式
stage_type: lecture
prerequisites:
  - "[[07_自伴边界条件与Hilbert空间框架]]"
  - "[[02_正则Sturm-Liouville问题]]"
enduring_understanding: "预解算子的紧性是正则 SL 问题离散谱与完备特征展开的分析根源。"
essential_question: "为什么正则 SL 问题的逆算子可以用具有连续核的积分算子表示，从而必然是紧算子？"
performance_evidence: "能独立构造分离边界条件下的 Green 函数，证明其对称性，并说明预解算子为 Hilbert–Schmidt 算子。"
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\07_green.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: drafting
---

# 09 Green 函数、预解式与紧性

> [!info] 本讲位置
> 模块 D：预解式与谱结构。前置：[[07_自伴边界条件与Hilbert空间框架]]；下一讲：10 完备性与 Fourier 收敛（待写）。


> [!abstract] 本节目标
> 在 [[07_自伴边界条件与Hilbert空间框架]] 的 Hilbert 空间框架下，构造正则 SL 问题的
> Green 函数，证明其对称性与连续性，并说明预解算子 $R_\lambda=(A-\lambda I)^{-1}$
> 是 Hilbert–Schmidt 算子，从而是紧算子。

> [!question] 基本问题
> 为什么 $A=r^{-1}L$ 的谱是离散的？为什么逆算子可以用积分表示？
> 这一节把“解微分方程”转化为“研究一个具有连续核的积分算子”。

> [!note] 物理来源：点源、波导与腔体
> 静电场中 $-\Delta G(x,\xi)=\delta_\xi(x)$ 的解就是点电荷势；
> 一维 SL 的 Green 函数 $G(x,\xi)$ 是“单位点源”的响应，
> 对称性 $G(x,\xi)=G(\xi,x)$ 对应物理互易性（交换点源与测点，响应不变），
> 跳量 $G_x(\xi+)-G_x(\xi-)=-1/p(\xi)$ 表示点源处的集中作用。
> 波导与谐振腔中，横向模式满足 $-\Delta u=\lambda u$，
> $\sqrt{\lambda}$ 对应截止频率（低于它波不能传播）或共振频率（腔体固有频率）；
> 模式计数由 Weyl 定律给出（第 11 讲），这是谱渐近的物理来源。

> [!warning] 证据分层
> 本节全部结论均为 `严格证明` / `STRICT`。后续引用项目文档时，会把
> `EVIDENCE` 与 `OPEN` 单独标注。

## 0. 从抽象算子回到积分方程

回顾 [[07_自伴边界条件与Hilbert空间框架]] 中的设定：

- 区间 $[a,b]$，$p\in C^1[a,b]$，$p>0$，$q,r\in C[a,b]$，$r>0$；
- 分离型实边界条件
  $$
  K y(a)-L p(a)y'(a)=0,\qquad M y(b)+N p(b)y'(b)=0,
  $$
  其中 $K^2+L^2>0$，$M^2+N^2>0$；
- 算子
  $$
  L y=-(p y')'+q y,\qquad A=\frac{1}{r}L,
  $$
  作用在带权空间 $L^2_r(a,b)$ 上。

我们希望求解

$$
(A-\lambda I)y=f,
$$

也就是

$$
L y-\lambda r y=r f.
$$

本节的目标是找到积分核 $G(x,\xi;\lambda)$，使得

$$
y(x)=\int_a^b G(x,\xi;\lambda)f(\xi)r(\xi)\,d\xi.
$$

这样的 $G$ 叫做 **Green 函数**。

## 1. 两个基本解与 Wronskian

记

$$
L_\lambda y:=L y-\lambda r y=-(p y')'+(q-\lambda r)y.
$$

设 $\varphi(x,\lambda)$ 是 $L_\lambda\varphi=0$ 的非零解，满足左端边界条件；
设 $\psi(x,\lambda)$ 是 $L_\lambda\psi=0$ 的非零解，满足右端边界条件。

定义 Wronskian

$$
W(x)=\varphi(x)\psi'(x)-\varphi'(x)\psi(x).
$$

> [!lemma] Liouville 公式
> 对上述 $\varphi,\psi$，
> $$
> p(x)W(x)\equiv \text{常数}.
> $$

**证明** 由两个方程

$$
(p\varphi')'+(q-\lambda r)\varphi=0,
\qquad
(p\psi')'+(q-\lambda r)\psi=0
$$

展开：

$$
p'\varphi'+p\varphi''+(q-\lambda r)\varphi=0,
$$

$$
p'\psi'+p\psi''+(q-\lambda r)\psi=0.
$$

于是

$$
p\varphi''=-p'\varphi'-(q-\lambda r)\varphi,
\qquad
p\psi''=-p'\psi'-(q-\lambda r)\psi.
$$

计算

$$
\begin{aligned}
(pW)'
&=p'(\varphi\psi'-\varphi'\psi)+p(\varphi\psi''-\varphi''\psi)\\
&=p'(\varphi\psi'-\varphi'\psi)
+\varphi\bigl(-p'\psi'-(q-\lambda r)\psi\bigr)
-\psi\bigl(-p'\varphi'-(q-\lambda r)\varphi\bigr)\\
&=p'(\varphi\psi'-\varphi'\psi)-p'(\varphi\psi'-\varphi'\psi)=0.
\end{aligned}
$$

因此 $pW$ 为常数。 $\square$

> [!important] 非特征值的判别
> 若 $\lambda$ 不是特征值，则 $\varphi,\psi$ 线性无关，从而
> $$
> p(\xi)W(\xi)\neq0\qquad\forall \xi\in[a,b].
> $$
> 反之，若 $pW=0$，则 $\varphi,\psi$ 线性相关，$\lambda$ 为特征值，
> 逆算子不存在。

## 2. Green 函数的构造

> [!theorem] Green 函数的存在性与公式
> 设 $\lambda$ 不是特征值。定义
> $$
> G(x,\xi)=
> \begin{cases}
> -\dfrac{\varphi(x)\psi(\xi)}{p(\xi)W(\xi)}, & a\le x\le \xi,\\[3mm]
> -\dfrac{\varphi(\xi)\psi(x)}{p(\xi)W(\xi)}, & \xi\le x\le b.
> \end{cases}
> $$
> 则 $G$ 是对称的，满足齐次边界条件，并且
> $$
> L_\lambda^{(x)}G(x,\xi)=\delta_\xi(x)
> \qquad\text{（分布意义）}.
> $$

![[fig_green.svg|520]]

*图 9：Green 函数的典型分段形状。*

**证明** 分四步。

**(1) 远离对角线的方程。**
当 $x<\xi$ 时 $G(x,\xi)=-\varphi(x)\psi(\xi)/(p(\xi)W(\xi))$，
关于 $x$ 只含因子 $\varphi(x)$，故 $L_\lambda^{(x)}G=0$。
当 $x>\xi$ 时同理，$G$ 关于 $x$ 只含因子 $\psi(x)$，故 $L_\lambda^{(x)}G=0$。

**(2) 连续性。**
在 $x=\xi$ 处，两个分支都等于
$$
-\frac{\varphi(\xi)\psi(\xi)}{p(\xi)W(\xi)},
$$
所以 $G$ 在 $x=\xi$ 连续。

**(3) 跳量。**
记 $G_x$ 为对 $x$ 的偏导数。由公式

$$
G_x(\xi+,\xi)-G_x(\xi-,\xi)
=-\frac{\varphi(\xi)\psi'(\xi)-\varphi'(\xi)\psi(\xi)}{p(\xi)W(\xi)}
=-\frac{W(\xi)}{p(\xi)W(\xi)}
=-\frac{1}{p(\xi)}.
$$

对任意 $\varepsilon>0$，在 $[\xi-\varepsilon,\xi+\varepsilon]$ 上积分 $L_\lambda^{(x)}G$：

$$
\int_{\xi-\varepsilon}^{\xi+\varepsilon} L_\lambda^{(x)}G\,dx
=-\bigl[pG_x\bigr]_{\xi-\varepsilon}^{\xi+\varepsilon}
+\int_{\xi-\varepsilon}^{\xi+\varepsilon}(q-\lambda r)G\,dx.
$$

由连续性，第二项当 $\varepsilon\to0$ 时趋于 $0$；第一项趋于

$$
-p(\xi)\bigl(G_x(\xi+,\xi)-G_x(\xi-,\xi)\bigr)=1.
$$

因此在分布意义下 $L_\lambda^{(x)}G=\delta_\xi$。

**(4) 边界条件。**
当 $x=a$ 时必有 $x\le\xi$，于是
$$
G(a,\xi)=-\frac{\varphi(a)\psi(\xi)}{p(\xi)W(\xi)},
$$
它作为 $x$ 的函数在 $x=a$ 处满足左端边界条件，因为 $\varphi$ 满足。
同理 $G(b,\xi)$ 由 $\psi$ 给出，满足右端边界条件。 $\square$

> [!note] 对称性
> 由公式立即得到
> $$
> G(x,\xi)=G(\xi,x),\qquad x,\xi\in[a,b].
> $$
> 也可以由 Green 恒等式与边界条件证明。

## 3. 预解算子

> [!definition] 预解算子
> 对 $\lambda$ 不在谱中，定义
> $$
> (R_\lambda f)(x)=\int_a^b G(x,\xi;\lambda)f(\xi)r(\xi)\,d\xi,
> \qquad f\in L^2_r(a,b).
> $$

> [!theorem] 预解恒等式
> 对 $f\in L^2_r(a,b)$，
> $$
> (L-\lambda r)R_\lambda f=rf
> \quad\Longleftrightarrow\quad
> (A-\lambda I)R_\lambda f=f.
> $$
> 对 $y\in D(A)$，
> $$
> R_\lambda(A-\lambda I)y=y.
> $$

**证明** 第一式由 Green 函数的 $\delta$ 性质直接得到：
固定 $x$，
$$
(L-\lambda r)_x\int_a^b G(x,\xi)f(\xi)r(\xi)\,d\xi
=\int_a^b L_\lambda^{(x)}G(x,\xi)f(\xi)r(\xi)\,d\xi
=f(x)r(x).
$$
两边除以 $r(x)$ 即得 $(A-\lambda I)R_\lambda f=f$。

第二式可由对称性与分部积分证明，或直接由 $R_\lambda$ 是 $A-\lambda I$
的双侧逆得到。 $\square$

## 4. 紧性

> [!theorem] 预解算子的紧性
> 设 $\lambda$ 不是特征值。则 $R_\lambda:L^2_r(a,b)\to L^2_r(a,b)$
> 是 Hilbert–Schmidt 算子，从而是紧算子。若 $\lambda\in\mathbb{R}$，
> 则 $R_\lambda$ 还是自伴算子。

**证明** 在 $L^2_r$ 上，$R_\lambda$ 的积分核为

$$
K(x,\xi)=G(x,\xi;\lambda)r(\xi).
$$

由 $G$ 在 $[a,b]^2$ 上连续、$r$ 在 $[a,b]$ 上连续，$K$ 也在
$[a,b]^2$ 上连续。因此

$$
\int_a^b\int_a^b |K(x,\xi)|^2\,dx\,d\xi<\infty,
$$

所以 $R_\lambda$ 是 Hilbert–Schmidt 算子。Hilbert–Schmidt 算子是紧算子。

若 $\lambda\in\mathbb{R}$，由 $G(x,\xi)=G(\xi,x)$ 以及 $r$ 为实值函数，
核 $K$ 满足

$$
K(x,\xi)=r(x)G(x,\xi)r(\xi)=K(\xi,x),
$$

故 $R_\lambda$ 在 $L^2_r$ 中自伴。 $\square$

> [!corollary] 离散谱
> 正则 SL 问题中，$A$ 的预解算子是紧自伴算子。由紧自伴算子的谱定理，
> $A$ 的特征值是离散实数，按大小排列
> $$
> \lambda_1<\lambda_2<\lambda_3<\cdots,\qquad \lambda_n\to+\infty,
> $$
> 对应特征函数在 $L^2_r(a,b)$ 中构成完备正交系。

> [!theorem] 正则自伴 SL 的有限实谱（Zettl \S4.12）
> 设 $p>0$，$r>0$，$q\in L^1(a,b)$，边界条件自伴。则算子 $A$ 的谱恰由
> 其特征值组成，并且：
> 1. 全部特征值为实数；
> 2. 特征值下方有界且没有有限聚点，可排列为
>    $$
>    \lambda_1<\lambda_2<\lambda_3<\cdots,
>    \qquad \lambda_n\to+\infty;
>    $$
> 3. 每个特征值的重数有限；
> 4. 对应特征函数在 $L^2_r(a,b)$ 中构成完备正交系。
> 证明路线：Green 函数连续给出预解算子 $R_\lambda$ 的紧性与自伴性，
> 再对紧自伴算子使用谱定理。奇异情形的谱性质总表见 Zettl \S10.12。

> [!proposition] 预解算子与谱的对应
> 设 $0\notin\sigma(A)$，$T=R_0=A^{-1}$。则
> $$
> Au=\lambda u
> \qquad\Longleftrightarrow\qquad
> Tu=\lambda^{-1}u.
> $$
> 因此 $A$ 的特征值恰为 $T$ 的非零特征值的倒数。由于紧自伴算子 $T$ 的
> 非零特征值 $\mu_n$ 满足 $\mu_n\to0$，故 $A$ 的特征值满足
> $|\lambda_n|\to+\infty$，从而没有有限聚点。

**证明** 若 $Au=\lambda u$ 且 $u\neq0$，则 $\lambda\neq0$，且
$$
u=R_0Au=\lambda R_0u,
$$
故 $R_0u=\lambda^{-1}u$。反过来，若 $R_0u=\mu u$ 且 $\mu\neq0$，
则 $u\in D(A)$ 且 $Au=R_0^{-1}u=\mu^{-1}u$。
最后一段是紧自伴算子谱定理的标准结论：紧自伴算子的非零特征值
只能以 $0$ 为聚点。 $\square$

> [!remark] 伴随 Green 函数
> 若把方程换成伴随方程并相应改变边界条件，伴随 Green 函数满足
> $$
> G^*(x,\xi)=\overline{G(\xi,x)}.
> $$
> 在自伴情形 $G^*=G$，即 $G(x,\xi)=G(\xi,x)$。
> 一般构造与证明见 Zettl \S3.8（Theorem 3.8.3--3.8.4）。

![[fig_spectrum.svg|500]]

*图 9.2：离散谱的示意。*

下一节 10 完备性与 Fourier 收敛 将用这个紧性证明特征展开的完备性。

## 5. 例子：Dirichlet 问题

取 $p=1$，$q=0$，$r=1$，$[a,b]=[0,1]$，边界条件
$y(0)=y(1)=0$，并取 $\lambda=0$。

则 $L_0y=-y''$，基本解可取

$$
\varphi(x)=x,\qquad \psi(x)=1-x.
$$

它们的 Wronskian 为

$$
W=\varphi\psi'-\varphi'\psi=x(-1)-1\cdot(1-x)=-1,
$$

于是 $pW=-1$。代入公式：

$$
G(x,\xi)=
\begin{cases}
-\dfrac{x(1-\xi)}{-1}=x(1-\xi), & x\le\xi,\\[2mm]
-\dfrac{\xi(1-x)}{-1}=\xi(1-x), & x\ge\xi.
\end{cases}
$$

这与经典 Dirichlet 问题的 Green 函数一致。

> [!example] 解一个简单方程
> 对
> $$
> -y''=f,\qquad y(0)=y(1)=0,
> $$
> 解为
> $$
> y(x)=\int_0^1 G(x,\xi)f(\xi)\,d\xi
> =\int_0^x \xi(1-x)f(\xi)\,d\xi
> +\int_x^1 x(1-\xi)f(\xi)\,d\xi.
> $$

> [!warning] Neumann 边界条件的陷阱
> 对 $-y''=f$，$y'(0)=y'(1)=0$，常数函数是 $\lambda=0$ 的特征函数，
> 因此 $\lambda=0$ 不是预解点，Green 函数不存在。
> 必须先平移算子（例如考虑 $-y''+\kappa^2y=f$，$\kappa>0$）才有可逆性。

## 6. 与项目文档的联系

Green 函数与紧预解式是后续几条线的公共入口：

- 10 完备性与 Fourier 收敛：用紧自伴算子的谱定理证明完备性；
- 11 特征值渐近与 Weyl 公式：用预解核的迹估计引出特征值计数；
- 13 二次型、Rayleigh 商与特征值不等式：用紧性说明极小极大原理适用；
- 项目文档 `SL_h2_completeness_proof.pdf`、`SL_hs_orthogonal_systems_proof.pdf`
  都默认正则 SL 问题的紧预解式。

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 3 §3.8, Theorem 3.8.1–3.8.2：正则 Green 函数。
> - A. Zettl, Ch 4 §4.11, Theorem 4.11.1：Green 核算子；Ch 4 §4.12：有限实谱。
> - A. Zettl, Ch 10 §10.10, Theorem 10.10.1：奇异 Green 函数；§10.9：用正则问题逼近奇异问题。
> - G. Teschl, *Ordinary Differential Equations and Dynamical Systems*, AMS.
> - M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*.
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

Green 函数给出预解算子的显式积分核；连续核使预解算子成为 Hilbert--Schmidt 算子，从而紧。

## 习题

> [!question] 9.1
> 验证本节构造的 $G(x,\xi)$ 在 $x=\xi$ 处连续，并逐项验证跳量条件
> $$
> G_x(\xi+,\xi)-G_x(\xi-,\xi)=-\frac{1}{p(\xi)}.
> $$

> [!question] 9.2
> 对 Dirichlet 问题 $-y''=f$，$y(0)=y(1)=0$，用显式 Green 函数
> 求解 $f(x)=1$，并与直接积分两次的结果对照。

> [!question] 9.3
> 对 Neumann 问题 $-y''+\kappa^2y=f$，$y'(0)=y'(1)=0$，$\kappa>0$，
> 写出两个基本解并构造 Green 函数。

> [!question] 9.4
> 证明：若 $G(x,\xi)=G(\xi,x)$，则预解算子 $R_\lambda$ 在 $L^2_r$ 中自伴。

> [!question] 9.5
> 解释为什么 $\lambda$ 是特征值时 Green 函数不存在。

> [!question] 9.6
> 取 $[a,b]=[0,1]$，$p=r=1$，$q=0$，边界条件
> $$
> y(0)=0,\qquad y(1)+y'(1)=0.
> $$
> 验证 $\lambda=0$ 不是特征值，并构造 Green 函数。

> [!question] 9.7
> 设 $T=R_0$ 是 $\lambda=0$ 不在谱时的预解算子。证明
> $$
> Au=\lambda u
> \quad\Longleftrightarrow\quad
> Tu=\lambda^{-1}u,
> $$
> 并说明紧自伴预解算子如何给出离散谱 $\lambda_n\to\infty$。

> [!question] 9.8
> 对 $p\equiv1$，$q\equiv0$，$r\equiv1$，$[a,b]=[0,\pi]$，
> 写出 Dirichlet 问题的 Green 函数，并说明它是 Hilbert–Schmidt 核。

> [!success]- 解答
> **9.1** 当 $x\to\xi$ 时两个分支都趋于
> $-\varphi(\xi)\psi(\xi)/(pW)$，故连续。跳量计算已在本节定理证明中给出：
> $$
> G_x(\xi+)-G_x(\xi-)
> =-\frac{\varphi\psi'-\varphi'\psi}{pW}
> =-\frac{W}{pW}=-\frac1p.
> $$
>
> **9.2** 由
> $$
> G(x,\xi)=
> \begin{cases}
> x(1-\xi), & x\le\xi,\\
> \xi(1-x), & x\ge\xi,
> \end{cases}
> $$
> 得
> $$
> y(x)=\int_0^x \xi(1-x)\,d\xi+\int_x^1 x(1-\xi)\,d\xi
> =\frac{x(1-x)}2.
> $$
> 直接解 $-y''=1$，$y(0)=y(1)=0$ 得 $y=x(1-x)/2$，一致。
>
> **9.3** 方程 $-y''+\kappa^2y=0$ 的基本解可取
> $$
> \varphi(x)=\cosh(\kappa x),\qquad
> \psi(x)=\cosh(\kappa(1-x)).
> $$
> 它们分别满足 $y'(0)=0$ 与 $y'(1)=0$。
> 计算 $W=\varphi\psi'-\varphi'\psi$：
> $$
> W=-\kappa\sinh\kappa,
> $$
> 故
> $$
> G(x,\xi)=
> \begin{cases}
> -\dfrac{\cosh(\kappa x)\cosh(\kappa(1-\xi))}{-\kappa\sinh\kappa}, & x\le\xi,\\[3mm]
> -\dfrac{\cosh(\kappa\xi)\cosh(\kappa(1-x))}{-\kappa\sinh\kappa}, & x\ge\xi.
> \end{cases}
> $$
> 即
> $$
> G(x,\xi)=\frac{1}{\kappa\sinh\kappa}
> \begin{cases}
> \cosh(\kappa x)\cosh(\kappa(1-\xi)), & x\le\xi,\\
> \cosh(\kappa\xi)\cosh(\kappa(1-x)), & x\ge\xi.
> \end{cases}
> $$
>
> **9.4** 对 $f,g\in L^2_r$，
> $$
> (R_\lambda f,g)_r
> =\int_a^b r(x)\left(\int_a^b G(x,\xi)f(\xi)r(\xi)d\xi\right)g(x)\,dx.
> $$
> 交换积分次序并用 $G(x,\xi)=G(\xi,x)$：
> $$
> (R_\lambda f,g)_r
> =\int_a^b\int_a^b r(x)r(\xi)G(\xi,x)f(\xi)g(x)\,d\xi\,dx
> =(f,R_\lambda g)_r.
> $$
> 因此 $R_\lambda$ 自伴。
>
> **9.5** 若 $\lambda$ 是特征值，则存在非零解 $\varphi$ 同时满足两端边界条件。
> 这时左端基本解与右端基本解线性相关，$W=0$，Green 函数公式中的分母为零，
> 无法构造预解核；从算子角度看，$A-\lambda I$ 不是单射，逆算子不存在。

>
> **9.6** 先看 $\lambda=0$。方程 $y''=0$ 的通解为 $y=Ax+B$。
> 由 $y(0)=0$ 得 $B=0$；由
> $$
> y(1)+y'(1)=A+A=2A=0
> $$
> 得 $A=0$，所以 $\lambda=0$ 不是特征值，Green 函数存在。
>
> 左端基本解取 $\varphi(x)=x$；右端基本解取满足
> $y(1)+y'(1)=0$ 的解。由通解 $y=Ax+B$ 及
> $A+B+A=2A+B=0$，取 $A=1$、$B=-2$，得
> $$
> \psi(x)=x-2.
> $$
> Wronskian
> $$
> W=\varphi\psi'-\varphi'\psi
> =x\cdot1-1\cdot(x-2)=2.
> $$
> 于是
> $$
> G(x,\xi)=
> \begin{cases}
> -\dfrac{\varphi(x)\psi(\xi)}{pW}
> =\dfrac{x(2-\xi)}2, & x\le\xi,\\[2mm]
> -\dfrac{\varphi(\xi)\psi(x)}{pW}
> =\dfrac{\xi(2-x)}2, & x\ge\xi.
> \end{cases}
> $$
> 它关于 $x=\xi$ 连续、对称，并满足两端边界条件。
>
> **9.7** 若 $Au=\lambda u$，$u\neq0$，则 $\lambda\neq0$，且
> $$
> u=R_0Au=\lambda R_0u,
> $$
> 故 $R_0u=\lambda^{-1}u$。反过来，若 $R_0u=\mu u$，$\mu\neq0$，
> 则 $u\in D(A)$ 且 $Au=\mu^{-1}u$。
> 由于 $R_0$ 紧自伴，其非零特征值 $\mu_n$ 满足 $\mu_n\to0$；
> 对应 $\lambda_n=\mu_n^{-1}$ 满足 $|\lambda_n|\to\infty$。
> 正则自伴 SL 算子还是下方有界的，因此 $\lambda_n\to+\infty$，
> 并且每个特征值只有有限重数。


> **9.8** 对 $-y''=f$，$y(0)=y(\pi)=0$，Green 函数为
> $$
> G(x,t)=
> \begin{cases}
> \dfrac{x(\pi-t)}{\pi}, & 0\le x\le t\le\pi,\\[2mm]
> \dfrac{t(\pi-x)}{\pi}, & 0\le t\le x\le\pi.
> \end{cases}
> $$
> 它在 $[0,\pi]^2$ 上连续，因此积分算子
> $f\mapsto\int_0^\pi G(x,t)f(t)\,dt$ 是 Hilbert–Schmidt 算子。

> [!tip] 下一讲
> 10 完备性与 Fourier 收敛 将使用本节的紧自伴预解算子，
> 证明特征函数系在 $L^2_r$ 中的完备性。
