---
title: 特征函数正交性与广义 Fourier 级数
date: 2026-08-23
tags:
  - SL
  - spectral-theory
  - orthogonality
  - fourier-series
  - eigenfunctions
aliases:
  - SL 特征函数正交性
  - 广义 Fourier 级数
stage_type: lecture
latex_source: 'F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\04_fourier.tex'
latex_master: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex'
latex_pdf: 'F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf'
status: self-reviewed
prerequisites:
  - "[[05_Sturm比较定理与零点交错]]"
---

# 06 特征函数正交性与广义 Fourier 级数

> [!info] 本讲位置
> 模块 C：正交展开与自伴框架。前置：[[05_Sturm比较定理与零点交错]]；下一讲：[[07_自伴边界条件与Hilbert空间框架]]。


> [!abstract] 本讲目标
> 证明特征函数正交性，建立 Bessel、Parseval 与广义 Fourier 展开。

> [!question] 基本问题
> 特征函数系在什么意义下可以表示任意函数？


## 同一特征值对应线性相关

> [!lemma]
> 设 $\lambda$ 是正则 SL 问题的特征值，$\varphi,\psi$ 是同一 $\lambda$
> 的两个特征函数，则 $\varphi,\psi$ 线性相关。

由边界条件

$$
\varphi(a)\cos\alpha-\varphi'(a)\sin\alpha=0,
\qquad
\psi(a)\cos\alpha-\psi'(a)\sin\alpha=0,
$$

可得

$$
\varphi(a)\psi'(a)-\varphi'(a)\psi(a)=0,
$$

即 $W(a)=0$。对二阶线性齐次方程，Wronskian 恒为零当且仅当两解线性相关。
因此正则 SL 问题的每个特征值都是单重的。

## 不同特征值正交

> [!theorem] 正交性
> 设 $\lambda_n\neq\lambda_m$，$\varphi_n,\varphi_m$ 分别是对应特征函数，则
> $$
> \int_a^b r(x)\,\varphi_n(x)\varphi_m(x)\,dx=0.
> $$

证明：两个方程分别为

$$
-\bigl(p\varphi_n'\bigr)'+q\varphi_n=\lambda_n r\varphi_n,
$$

$$
-\bigl(p\varphi_m'\bigr)'+q\varphi_m=\lambda_m r\varphi_m.
$$

第一式乘 $\varphi_m$，第二式乘 $\varphi_n$，相减得

$$
(\lambda_n-\lambda_m)r\varphi_n\varphi_m
=\frac{d}{dx}\Bigl[p\bigl(\varphi_n\varphi_m'-\varphi_n'\varphi_m\bigr)\Bigr].
$$

积分并利用分离型自伴边界条件，右端为零。因 $\lambda_n\neq\lambda_m$，
故正交。

记

$$
S_n=\int_a^b r(x)\varphi_n^2(x)\,dx>0.
$$

归一化特征函数

$$
e_n(x)=\frac{\varphi_n(x)}{\sqrt{S_n}}
$$

构成带权 $L^2_r[a,b]$ 中的正交规范系。

## 广义 Fourier 级数

### 正交规范系与广义 Fourier 系数

设 $\{\varphi_n\}_{n=0}^\infty$ 是正则 SL 问题的特征函数系，
特征值按大小排列

$$
\lambda_0<\lambda_1<\lambda_2<\cdots .
$$

记

$$
S_n=\int_a^b r(x)\varphi_n(x)^2\,dx>0,
\qquad
e_n(x)=\frac{\varphi_n(x)}{\sqrt{S_n}}.
$$

则 $\{e_n\}_{n=0}^\infty$ 是 $L^2_r(a,b)$ 中的正交规范系：

$$
(e_m,e_n)_r=\int_a^b r(x)e_m(x)e_n(x)\,dx=\delta_{mn}.
$$

对 $f\in L^2_r(a,b)$，定义 **广义 Fourier 系数**

$$
c_n=(f,e_n)_r=\int_a^b r(x)f(x)e_n(x)\,dx,
$$

并记部分和

$$
(P_Nf)(x)=\sum_{n=0}^N c_n e_n(x).
$$

形式上写成

$$
f(x)\sim\sum_{n=0}^{\infty}c_n e_n(x).
$$

> [!note] 复值情形
> 若函数取复值，内积改为 $(f,g)_r=\int_a^b r f\bar g$，
> 系数改为 $c_n=(f,e_n)_r$，下文结论完全相同。

### Bessel 不等式与最佳逼近

> [!theorem] Bessel 不等式
> 对任意 $f\in L^2_r(a,b)$，
> $$
> \sum_{n=0}^{\infty}|c_n|^2\le \|f\|_r^2,
> $$
> 其中 $\|f\|_r^2=(f,f)_r=\int_a^b r|f|^2$。

**证明** 由正交规范性，

$$
\left\|f-\sum_{n=0}^N c_ne_n\right\|_r^2
=\|f\|_r^2-2\sum_{n=0}^N|c_n|^2+\sum_{n=0}^N|c_n|^2
=\|f\|_r^2-\sum_{n=0}^N|c_n|^2\ge0.
$$

因此 $\sum_{n=0}^N|c_n|^2\le\|f\|_r^2$。令 $N\to\infty$ 即得结论。 $\square$

> [!corollary] Riemann--Lebesgue 引理
> $c_n\to0$（$n\to\infty$）。

**证明** 由 Bessel 不等式，$\sum_{n=0}^\infty|c_n|^2$ 收敛，
故其通项 $|c_n|^2\to0$。 $\square$

> [!theorem] 最佳逼近
> 对任意 $d_0,\dots,d_N\in\mathbb{R}$，
> $$
> \left\|f-\sum_{n=0}^N c_ne_n\right\|_r
> \le
> \left\|f-\sum_{n=0}^N d_ne_n\right\|_r,
> $$
> 等号成立当且仅当 $d_n=c_n$（$n=0,\dots,N$）。

![[fig_projection.svg|460]]

*图 6：$E_N$ 上的正交投影与最佳逼近。*

**证明** 展开右边：

$$
\left\|f-\sum_{n=0}^N d_ne_n\right\|_r^2
=\|f\|_r^2-2\sum_{n=0}^N d_nc_n+\sum_{n=0}^N d_n^2
=\|f\|_r^2-\sum_{n=0}^N c_n^2+\sum_{n=0}^N(d_n-c_n)^2.
$$

因此最小值在 $d_n=c_n$ 时取得，且此时取到最小值
$\|f\|_r^2-\sum_{n=0}^N c_n^2$。 $\square$

### 完备性与 Parseval 恒等式

> [!definition] 完备正交系
> 正交规范系 $\{e_n\}$ 称为**完备的**，如果
> $$
> (f,e_n)_r=0\quad(\forall n)
> \quad\Longrightarrow\quad
> f=0\quad\text{于 }L^2_r(a,b).
> $$
> 等价的说法是：$\{e_n\}$ 是 $L^2_r(a,b)$ 的极大正交规范系。

> [!theorem] 完备性的等价刻画
> 对 $L^2_r(a,b)$ 中的正交规范系 $\{e_n\}$，下列命题等价：
> 1. $\{e_n\}$ 完备；
> 2. **Parseval 恒等式**：对一切 $f\in L^2_r$，
>    $$
>    \|f\|_r^2=\sum_{n=0}^{\infty}|c_n|^2;
>    $$
> 3. 对一切 $f\in L^2_r$，
>    $$
>    f=\sum_{n=0}^{\infty}c_ne_n
>    \quad\text{（在 }L^2_r\text{ 范数意义下）}.
>    $$

**证明** 记部分和 $P_Nf=\sum_{n=0}^N c_ne_n$。

**(i) $\Rightarrow$ (iii)**：由正交性，
$$
(f-P_Nf,e_m)_r=(f,e_m)_r-\sum_{n=0}^N c_n(e_n,e_m)_r
=c_m-c_m=0
$$
对 $m\le N$ 成立；对 $m>N$，同样有 $(f-P_Nf,e_m)_r=c_m$。
固定 $m$，令 $N\to\infty$，由内积的连续性得
$$
(f-P_Nf,e_m)_r\to (f-\sum_{n=0}^\infty c_ne_n,e_m)_r=0.
$$
因此 $g:=f-\sum_{n=0}^\infty c_ne_n$ 与所有 $e_m$ 正交。
由完备性 $g=0$，即 $f=\sum c_ne_n$ 在 $L^2_r$ 中成立。

**(i) $\Leftrightarrow$ (ii)**：由 Bessel 不等式的证明，
$$
\|f-P_Nf\|_r^2=\|f\|_r^2-\sum_{n=0}^N|c_n|^2.
$$
左边趋于 $0$ 当且仅当 $\sum_{n=0}^\infty|c_n|^2=\|f\|_r^2$。
而左边趋于 $0$ 正是 (iii)，因此 (ii) 与 (iii) 等价。
再由 (i) $\Rightarrow$ (iii) 与 (iii) $\Rightarrow$ (ii) 即得 (i) $\Rightarrow$ (ii)。

**(ii) $\Rightarrow$ (i)**：若 $f\perp e_n$ 对一切 $n$，则 $c_n=0$，
Parseval 给出 $\|f\|_r=0$，故 $f=0$。 $\square$

### 正则 SL 问题的完备性

> [!theorem] 正则 SL 完备性定理
> 设 $L y=-(p y')'+q y$，$p>0$，$q,r$ 连续，$r>0$，
> 配以分离型自伴边界条件。则特征函数系 $\{\varphi_n\}$ 在 $L^2_r(a,b)$ 中完备。
> 等价地，$\{e_n\}$ 是 $L^2_r(a,b)$ 的完备正交规范系。

**证明路线** 由 [[09_Green函数预解式与紧性]]，
预解算子 $R_\lambda=(A-\lambda I)^{-1}$ 是紧自伴算子。
紧自伴算子的谱定理给出 $L^2_r$ 的一组完备正交特征向量。
取 $\lambda$ 不是特征值，则 $R_\lambda$ 的特征向量与 $A$ 的特征函数相同，
特征值为 $(\lambda_n-\lambda)^{-1}$。
因此 $A$ 的特征函数系完备。完整的谱定理证明将在后续章节给出。 $\square$

### 逐点收敛与一致收敛

$L^2$ 收敛并不自动给出逐点收敛。下面陈述经典的正则 SL 展开收敛定理。

> [!theorem] 逐段光滑收敛定理
> 在上述正则 SL 设定下，若 $f$ 在 $[a,b]$ 上逐段 $C^1$，则广义 Fourier
> 级数在 $(a,b)$ 内每点收敛，且
> $$
> \sum_{n=0}^{\infty}c_ne_n(x)
> =\frac{f(x+)+f(x-)}2,\qquad x\in(a,b).
> $$
> 若 $f\in C^1[a,b]$ 且满足该 SL 问题的边界条件，则级数在 $[a,b]$ 上
> 绝对且一致收敛到 $f$。

> [!warning] 边界点
> 在端点处，级数通常收敛到边界值的某种平均或延拓值，具体取决于边界条件。
> 例如 Fourier 正弦级数在 $x=0,\pi$ 处收敛到 $0$。

**证明思路** 用 Green 函数把部分和写成积分算子，并估计其核与 Dirichlet 核的差；
再对逐段 $C^1$ 函数使用有界变差函数的 Fourier 收敛定理。完整证明可参见
Titchmarsh, *Eigenfunction Expansions Associated with Second-Order Differential Equations*，
或 Zettl, *Sturm--Liouville Theory*。

### 算子作用与逐项微分的 $L^2$ 版本

> [!theorem] $L^2$ 展开与算子作用
> 设 $f\in D(A)$，即 $f$ 满足边界条件且 $Lf\in L^2_r$。则
> $$
> Af=\sum_{n=0}^{\infty}\lambda_n c_ne_n
> \quad\text{（在 }L^2_r\text{ 中收敛）},
> $$
> 并且
> $$
> \|Af\|_r^2=\sum_{n=0}^{\infty}\lambda_n^2|c_n|^2<\infty .
> $$

**证明** 因为 $A$ 自伴且 $Ae_n=\lambda_ne_n$，
$$
(Af,e_n)_r=(f,Ae_n)_r=\lambda_n(f,e_n)_r=\lambda_n c_n.
$$
由 $\{e_n\}$ 完备，$Af$ 的广义 Fourier 级数就是
$\sum \lambda_nc_ne_n$，且在 $L^2_r$ 中收敛到 $Af$。
Parseval 恒等式给出 $\|Af\|_r^2=\sum\lambda_n^2|c_n|^2$。 $\square$

> [!remark] 逐项积分
> 由内积连续性，对任意 $g\in L^2_r$，
> $$
> (f,g)_r=\sum_{n=0}^{\infty}c_n(e_n,g)_r.
> $$
> 若级数一致收敛，还可以逐项积分到逐点等式。

### 例子：区间 $[0,\pi]$ 上的正弦级数

取 $p=1$，$q=0$，$r=1$，$[a,b]=[0,\pi]$，边界条件
$y(0)=y(\pi)=0$。特征函数为
$$
\varphi_n(x)=\sin(nx),\qquad n=1,2,3,\dots,
$$
且 $S_n=\pi/2$，故
$$
e_n(x)=\sqrt{\frac{2}{\pi}}\sin(nx).
$$

对 $f(x)=1$，广义 Fourier 系数为
$$
c_n=\sqrt{\frac{2}{\pi}}\int_0^\pi \sin(nx)\,dx
=\sqrt{\frac{2}{\pi}}\frac{1-\cos n\pi}{n}.
$$
因此 $c_n=2\sqrt{2/\pi}/n$ 当 $n$ 为奇数，$c_n=0$ 当 $n$ 为偶数。
级数在 $(0,\pi)$ 内收敛到 $1$，在端点 $0,\pi$ 处收敛到 $0$。

由 Parseval 恒等式，
$$
\int_0^\pi 1^2\,dx=\pi
=\sum_{n\text{ 奇}}\left(\frac{2\sqrt{2/\pi}}{n}\right)^2
=\frac{8}{\pi}\sum_{n\text{ 奇}}\frac1{n^2},
$$
故
$$
\sum_{n=1}^{\infty}\frac{1}{(2n-1)^2}=\frac{\pi^2}{8}.
$$

> [!tip] 与研究的联系
> 相关前沿问题包括：SL 特征函数系/多项式系在左定空间 $H^s$ 中的完备性，
> 以及特征值间距 $\lambda_{n+1}-\lambda_n$ 与比值 $\lambda_{n+1}/\lambda_n$ 的最优界。
> 本节的完备性与 Parseval 是后续完备性章节和左定理论讨论的基础。

## 参考

> [!info] 标准参考（Zettl）
> - A. Zettl, *Sturm–Liouville Theory*, Ch 3 §3.2–§3.3：特征值的超越方程刻画与 Fourier 方程。
> - A. Zettl, Ch 4 §4.11–§4.12：Green 核算子与有限实谱，完备性讨论的算子入口。
> - A. Zettl, Ch 16：展开定理与逐点收敛的文献路线。
> - 完整章节映射见 [[Zettl参考映射]]。

## 本讲小结

分离自伴边界条件使特征函数正交；完备性等价于 Parseval 与 $L^2$ 展开。

## 习题

> [!question] 6.1
> 对 Neumann 问题 $-y''=\lambda y$，$y'(0)=y'(\pi)=0$，
> 写出特征值与特征函数，并验证正交性。

> [!question] 6.2
> 设 $f(x)=1$ 在 $[0,\pi]$ 上展开为
> $$
> f(x)\sim\sum_{n=1}^{\infty}a_n\sin(nx).
> $$
> 求 $a_n$。

> [!question] 6.3
> 证明 Bessel 不等式：
> $$
> \sum_{n=0}^{\infty}|c_n|^2\le \|f\|_r^2.
> $$

> [!question] 6.4
> 证明最佳逼近定理：在 $N$ 次部分和空间中，广义 Fourier 部分和
> $P_Nf$ 是 $f$ 的最佳逼近。

> [!question] 6.5
> 对 $f\in L^2_r$，证明 $c_n\to0$。

> [!question] 6.6
> 设 $f\in D(A)$。证明
> $$
> Af=\sum_{n=0}^{\infty}\lambda_nc_ne_n
> \quad\text{在 }L^2_r\text{ 中}.
> $$

> [!question] 6.7
> 对 $f(x)=1$ 于 $[0,\pi]$ 的正弦级数，求级数在 $x=0$、$x=\pi/2$
> 与 $x=\pi$ 处的收敛值，并用 Parseval 恒等式推出
> $$
> \sum_{n=1}^{\infty}\frac{1}{(2n-1)^2}=\frac{\pi^2}{8}.
> $$

> [!question] 6.8
> 将 $f(x)=x(\pi-x)$ 在 $[0,\pi]$ 上展开为 Dirichlet 正弦级数
> $$
> f(x)=\sum_{n=1}^\infty b_n\sin(nx),
> $$
> 并用 Parseval 恒等式求
> $$
> \sum_{n=1}^\infty\frac1{n^6}.
> $$

> [!success]- 解答
> **6.1** 特征值为 $\lambda_n=n^2$，$n=0,1,2,\dots$，
> 特征函数为 $\cos(nx)$。对 $m\neq n$，
> $$
> \int_0^\pi \cos(mx)\cos(nx)\,dx=0.
> $$
>
> **6.2** 
> $$
> a_n=\frac{2}{\pi}\int_0^\pi \sin(nx)\,dx
> =\frac{2}{n\pi}(1-\cos n\pi).
> $$
> 因此 $a_n=4/(n\pi)$ 当 $n$ 为奇数，$a_n=0$ 当 $n$ 为偶数。
>
> **6.3** 由正交规范性，
> $$
> 0\le\left\|f-\sum_{n=0}^N c_ne_n\right\|_r^2
> =\|f\|_r^2-\sum_{n=0}^N|c_n|^2.
> $$
> 令 $N\to\infty$ 即得。
>
> **6.4** 展开
> $$
> \left\|f-\sum_{n=0}^N d_ne_n\right\|_r^2
> =\|f\|_r^2-\sum_{n=0}^N|c_n|^2
> +\sum_{n=0}^N|d_n-c_n|^2,
> $$
> 故最小值在 $d_n=c_n$ 时取得。
>
> **6.5** 由 Bessel 不等式，$\sum|c_n|^2$ 收敛，故 $|c_n|^2\to0$，
> 从而 $c_n\to0$。
>
> **6.6** 对每个 $n$，
> $$
> (Af,e_n)_r=(f,Ae_n)_r=\lambda_nc_n.
> $$
> 由 $\{e_n\}$ 完备，$Af$ 的广义 Fourier 展开为
> $\sum\lambda_nc_ne_n$ 且在 $L^2_r$ 中收敛。
>
> **6.7** 在 $x=0,\pi$ 处级数收敛到 $0$；在 $x=\pi/2$ 处收敛到
> $1$。Parseval 恒等式给出
> $$
> \pi=\sum_{n\text{ 奇}}\left(\frac{4}{n\pi}\right)^2
> =\frac{16}{\pi^2}\sum_{n\text{ 奇}}\frac1{n^2},
> $$
> 故 $\sum_{n\text{ 奇}}1/n^2=\pi^2/8$。

>
> **6.8** 系数为
> $$
> b_n=\frac2\pi\int_0^\pi(\pi x-x^2)\sin(nx)\,dx.
> $$
> 分部积分得
> $$
> \int_0^\pi x\sin(nx)\,dx=-\frac{\pi(-1)^n}{n},
> $$
> $$
> \int_0^\pi x^2\sin(nx)\,dx
> =-\frac{\pi^2(-1)^n}{n}+\frac{2}{n^3}\bigl((-1)^n-1\bigr).
> $$
> 因此
> $$
> b_n=\frac{4}{\pi n^3}\bigl(1-(-1)^n\bigr)
> =\begin{cases}
> \dfrac{8}{\pi n^3}, & n\text{ 为奇数},\\[2mm]
> 0, & n\text{ 为偶数}.
> \end{cases}
> $$
> Parseval 恒等式给出
> $$
> \int_0^\pi\bigl(x(\pi-x)\bigr)^2dx
> =\sum_{n\text{ 奇}}\left(\frac{8}{\pi n^3}\right)^2\frac{\pi}{2}.
> $$
> 左端
> $$
> \int_0^\pi(\pi^2x^2-2\pi x^3+x^4)\,dx
> =\frac{\pi^5}{30},
> $$
> 右端
> $$
> \frac{32}{\pi}\sum_{n\text{ 奇}}\frac1{n^6}.
> $$
> 故 $\sum_{n\text{ 奇}}1/n^6=\pi^6/960$。又
> $$
> \sum_{n=1}^\infty\frac1{n^6}
> =\sum_{n\text{ 奇}}\frac1{n^6}
> +\frac1{64}\sum_{n=1}^\infty\frac1{n^6},
> $$
> 从而
> $$
> \sum_{n=1}^\infty\frac1{n^6}
> =\frac{64}{63}\cdot\frac{\pi^6}{960}
> =\frac{\pi^6}{945}.
> $$
