---
title: 紧自伴谱定理与特征函数完备性
date: '2026-09-22'
tags:
- SL
- spectral-theory
- sl-lecture
aliases:
- SL 完备性
- 特征函数完备性
- Fourier 收敛
stage_type: lecture
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\07_completeness.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
status: audited
prerequisites:
- '[[09_Green函数预解式与紧性]]'
lecture_chapter: 7
---

# 第 7 章 紧自伴谱定理与特征函数完备性
> [!info] 阅读位置
> 本页对应新版第 7 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
证明紧自伴谱定理, 将其用于正则 SL 算子, 并辨明不同展开收敛方式.

> [!question] 基本问题
为什么 Green 逆算子的紧性能够排除遗漏的正交方向?

第 4 章已经证明 Hilbert 空间的 Bessel,Parseval 与完备性判据, 本章直接使用这些几何结果. 第 6 章已经构造 $T=(A-\zeta I)^{-1}$, 它紧,自伴,单射且正. 现在需要证明: 这样的算子必有一组完备正交特征向量.

## 自伴算子范数与极值特征向量

> [!note] 定义. 有界算子的范数

对 $T:H\to H$, 定义 $\|T\|=\sup_{\|u\|=1}\|Tu\|$. 本章的自伴性是 $(Tu,v)=(u,Tv)$ 对所有 $u,v\in H$ 成立, 因为 $T$ 的定义域是整个空间.

> [!note] 引理. 自伴算子的范数由二次型决定

若 $T$ 有界且自伴, 则

$$
\|T\|=\sup_{\|u\|=1}|(Tu,u)|.
$$



**证明.**

记右端为 $M$, Cauchy--Schwarz 给出 $M\le\|T\|$. 对任意单位向量 $u$ 若 $Tu\ne0$, 取单位向量 $v=Tu/\|Tu\|$. 由于 $(Tu,v)=\|Tu\|$ 为实数, 自伴性给出

$$
4\|Tu\|=(T(u+v),u+v)-(T(u-v),u-v).
$$

 用 $|(Tx,x)|\le M\|x\|^2$ 及平行四边形恒等式, 得 $4\|Tu\|\le M(\|u+v\|^2+\|u-v\|^2)=4M$. 对 $Tu=0$ 不等式也成立, 取上确界即得结论. $\square$

> [!note] 引理. 非零紧自伴算子有极值特征向量

若 $T\ne0$ 紧且自伴, 则存在单位向量 $e$ 和实数 $\mu$ 使 $Te=\mu e$, $|\mu|=\|T\|$.

**证明.**

令 $M=\|T\|>0$. 由 (7.1), 取单位向量 $u_k$ 及固定符号 $s\in\{1,-1\}$, 经过选子列使 $(sTu_k,u_k)\to M$. 令 $S=sT$. 有

$$
\|Su_k-Mu_k\|^2
        =\|Su_k\|^2-2M(Su_k,u_k)+M^2
        \le2M^2-2M(Su_k,u_k)\longrightarrow0.
$$

 紧性使 $Su_k$ 有收敛子列, 于是 $u_k=M^{-1}(Su_k-(Su_k-Mu_k))$ 也收敛到某个单位向量 $e$. 由 $S$ 连续, $Se=Me$, 即 $Te=sMe$. $\square$

## 完整的紧自伴谱定理

> [!note] 定理. 紧自伴谱分解

设 $T$ 是 Hilbert 空间 $H$ 上的紧自伴算子. 则存在有限或可数个正交规范特征向量 $e_n$, 对应非零实特征值 $\mu_n$, 满足

$$
H=\ker T\oplus\overline{\operatorname{span}\{e_n\}},\qquad
        Tf=\sum_n\mu_n(f,e_n)e_n.
$$

 无穷情形可按 $|\mu_1|\ge|\mu_2|\ge\cdots>0$ 排列, 且 $\mu_n\to0$. 每个非零特征值的重数有限. 如果 $\ker T=\{0\}$, 则这些 $e_n$ 是 $H$ 的完备正交规范基.

**证明.**

若 $Te=\mu e$, 则 $\mu\|e\|^2=(Te,e)$ 实, 故 $\mu$ 实. 若 $Te=\mu e$, $Tf=\nu f$, 则 $(\mu-\nu)(e,f)=0$, 所以不同特征值的特征向量正交.

从 $H_0=H$ 开始. 如果 $T|_{H_0}=0$, 结论成立且没有非零特征向量. 否则由上一引理选 $e_1$, 满足 $|\mu_1|=\|T\|$. 因 $T$ 自伴, $H_1=e_1^\perp$ 在 $T$ 下不变: $(Tf,e_1)=(f,Te_1)=0$. 在 $H_1$ 上限制仍紧且自伴. 反复进行: 若 $T|_{H_N}=0$ 就停止; 否则在 $H_N=\operatorname{span}\{e_1,\ldots,e_N\}^\perp$ 上选 $e_{N+1}$ 使

$$
|\mu_{N+1}|=\|T|_{H_N}\|\le|\mu_N|.
$$



若过程无限, 则 $\mu_n\to0$. 否则有 $\varepsilon>0$ 和无限多个指标满足 $|\mu_n|\ge\varepsilon$, 而

$$
\|Te_n-Te_m\|^2=|\mu_n|^2+|\mu_m|^2\ge2\varepsilon^2\quad(n\ne m),
$$

 与紧性矛盾. 同样, 某个非零特征空间若无限维, 可用有限步正交化不断选单位正交向量, 其像也不可能有收敛子列, 故重数有限.

令 $M=\overline{\operatorname{span}\{e_n\}}$. 若 $f\in M^\perp$, 则在无限过程中对每个 $N$ 有 $\|Tf\|\le|\mu_{N+1}|\|f\|$, 故 $Tf=0$. 有限过程中, 停止条件也给出 $Tf=0$. 反过来, 若 $Tf=0$, 则 $\mu_n(f,e_n)=(f,Te_n)=(Tf,e_n)=0$, 故 $f\in M^\perp$. 因此 $M^\perp=\ker T$. 投影定理给出 (7.2) 的正交分解. 第 4 章的正交级数结论给出 $f=P_Mf+g=\sum(f,e_n)e_n+g$, $g\in\ker T$. 对部分和应用有界算子 $T$ 并取极限, 即得展开式. 这个构造已穷尽所有非零特征向量方向, 不需要另加极大族的选择步骤. $\square$

> [!example] 例. 紧性与零空间各有作用

在 $\ell^2$, $T(x_1,x_2,\ldots)=(x_1,x_2/2,x_3/3,\ldots)$ 的有限截断以算子范数收敛到 $T$, 所以它紧, 且标准基是特征基. 若把第一坐标输出改成零, 非零特征向量只能张成 $e_1^\perp$, 必须保留分解中的 $\ker T=\operatorname{span}\{e_1\}$. 恒等算子虽自伴, 却因 $\|e_n-e_m\|=\sqrt2$ 不紧.

## SL 完备性,谱与算子域

> [!note] 定理. 正则 SL 谱定理

对第 5--6 章的分离或周期/反周期问题, $A$ 有完备正交规范特征函数系 $(e_n)_{n\ge1}$. 特征值按重数排列为

$$
\lambda_1\le\lambda_2\le\cdots,\qquad\lambda_n\longrightarrow+\infty.
$$

 分离情形各不等号严格. 对每个 $f\in H$,

$$
f=\sum_{n=1}^\infty c_ne_n\quad\text{于 }H,\qquad
        \|f\|_r^2=\sum_{n=1}^\infty|c_n|^2,\qquad c_n=(f,e_n)_r.
$$

 此外,

$$
D(A)=\left\{f\in H:\sum_{n=1}^\infty\lambda_n^2|c_n|^2<\infty\right\},
        \qquad Af=\sum_{n=1}^\infty\lambda_nc_ne_n.
$$



**证明.**

对 $T=(A-\zeta I)^{-1}$ 应用紧自伴谱定理. 它单射, 所以非零特征向量形成 $H$ 的基; 它正, 所以相应 $\mu_n>0$. $H=L^2_r$ 无限维, 单射有限秩算子不可能作用于 $H$, 故有无限多个按重数计的 $\mu_n$, 且 $\mu_n\downarrow0$. 若 $Te_n=\mu_ne_n$, 因 $\operatorname{ran}T\subset D(A)$ 且 $\mu_n\ne0$, 有 $e_n\in D(A)$ 和

$$
Ae_n=(\zeta+\mu_n^{-1})e_n.
$$

 反向也成立, 因而设 $\lambda_n=\zeta+1/\mu_n$ 即得 (7.3). 分离条件下的单重性在第 4 章已由 ODE 唯一性证明. 基与 Parseval 的结论用第 4 章的等价刻画.

若 $f\in D(A)$, 对称性给出 $(Af,e_n)_r=\lambda_n(f,e_n)_r$. 对 $Af$ 用 Parseval, 得到必要条件和作用公式. 反之, 若加权系数平方和有限, 部分和 $f_N=\sum_{n\le N}c_ne_n$ 在 $H$ 中收敛到 $f$, 而 $Af_N$ 在 $H$ 中收敛到 $g=\sum\lambda_nc_ne_n$. 第 5 章的闭性给出 $f\in D(A)$ 且 $Af=g$. $\square$

> [!note] 推论. 没有遗漏的连续谱

$\sigma(A)=\{\lambda_n:n\ge1\}$. 对不等于任何特征值的 $z\in\mathbb C$,

$$
R_zf=\sum_{n=1}^\infty\frac{c_n}{\lambda_n-z}e_n.
$$



**证明.**

由 $\lambda_n\to+\infty$, 固定 $z\notin\{\lambda_n\}$ 时 $\inf_n|\lambda_n-z|>0$ 且 $\sup_n|\lambda_n/(\lambda_n-z)|<\infty$. 因而右边给出有界 $H\to H$ 算子, 由 (7.4) 值域在 $D(A)$ 中. 逐系数计算给出 $A-zI$ 的双侧逆. 特征值处有非零核, 不能属于预解集. $\square$

> [!example] 例. 正弦基与含常数的余弦基

取 $p=r=1,q=0$, 令 $\ell=b-a$. Dirichlet 条件下,

$$
e_n(x)=\sqrt{2/\ell}\sin\frac{n\pi(x-a)}\ell,\qquad
        \lambda_n=(n\pi/\ell)^2,\quad n\ge1.
$$

 Neumann 条件下必须包含常数模态:

$$
e_1(x)=\ell^{-1/2},\quad\lambda_1=0;\qquad
        e_{k+1}(x)=\sqrt{2/\ell}\cos\frac{k\pi(x-a)}\ell,\quad
        \lambda_{k+1}=(k\pi/\ell)^2,\quad k\ge1.
$$

 两组公式由 $-u''=\lambda u$ 的通解及端点条件得到, 直接积分验证归一化. 能量非负排除负特征值; $\lambda=0$ 时解为仿射函数, Dirichlet 排除它, Neumann 只留下常数; $\lambda>0$ 时端点条件恰给上述整数频率. 因而已经列出全部特征函数方向. 本章谱定理说明正弦系是 Dirichlet 的 $L^2$ 完备基, 常数加余弦系是 Neumann 的 $L^2$ 完备基. 删去 Neumann 的常数只得到零均值闭子空间的基.

## 范数收敛,端点与一致收敛

> [!note] 定义. 三种收敛

$S_N\to f$ 于 $L^2_r$ 指 $\int r|S_N-f|^2\to0$; 逐点收敛指固定 $x$ 时 $S_N(x)\to f(x)$; 一致收敛指 $\sup_x|S_N(x)-f(x)|\to0$. $L^2$ 元素是几乎处处等价类, 本身不指定端点值.

> [!note] 定理. 算子域上的一致收敛

若 $f\in D(A)$, 其特征函数部分和 $S_N$ 在 $H^2$ 中收敛到 $f$. 因而 $S_N,S_N'$ 在 $[a,b]$ 上分别一致收敛到连续代表 $f,f'$.

**证明.**

由 (7.4), $\|f-S_N\|_r^2+\|A(f-S_N)\|_r^2$ 等于两个平方可和级数的尾和, 趋于零. 图范数与 $H^2$ 范数等价, 故 $H^2$ 收敛. 对 $f-S_N$ 和它的一阶导数分别用第 5 章 $H^1\to C$ 连续嵌入, 得一致收敛. $\square$

> [!note] 注. 较弱假设下的逐点展开另需证明

上一定理给出一条已经证明的充分条件. 一般逐段光滑函数的 SL 点态展开需要对谱投影核作额外估计; 本书在此不把这种结论从 $L^2$ 完备性直接推出. 第 8 章还会证明型域函数的展开在 $H^1$ 中收敛, 从而函数值一致收敛.

> [!example] 例. 常数的正弦展开与端点

第 4 章计算了 $f=1$ 的正弦系数. 现在完备性给出

$$
1=\frac4\pi\sum_{k=0}^\infty\frac{\sin((2k+1)x)}{2k+1}
        \quad\text{于 }L^2(0,\pi),\qquad
        \sum_{k=0}^\infty\frac1{(2k+1)^2}=\frac{\pi^2}{8}.
$$

 所有部分和在端点为零. 若它们在闭区间上一致收敛, 则极限连续,端点为零; 又 $L^2$ 极限唯一, 该连续极限在内部必须恒等于 $1$, 与连续性矛盾. 因而没有闭区间一致收敛. 这里无需假定每个内点的收敛结果, 就能严谨地区分两种收敛.

> [!example] 例. 线性函数与平方倒数和

$f(x)=x$ 的系数是 $b_n=2(-1)^{n+1}/n$, 因而 Parseval 给出

$$
\frac{\pi^3}3=\frac\pi2\sum_{n=1}^\infty\frac4{n^2},\qquad
        \sum_{n=1}^\infty\frac1{n^2}=\frac{\pi^2}{6}.
$$

 这个证明只用 $L^2$ 展开. 在指定点代入 Fourier 级数需要独立的点态收敛依据, 不能从 Parseval 直接获得.

## 习题

1.  对 $T:\ell^2\to\ell^2$, $(Tx)_n=x_n/n$, 证明紧性并求 $\ker T$ 与全部非零特征值.

2.  若 $T$ 紧且自伴, 证明对任意 $\varepsilon>0$, 模长至少为 $\varepsilon$ 的特征值对应的特征空间总维数有限.

3.  对 Dirichlet 正弦展开 $f=x(\pi-x)$, 用第 4 章所得系数和 Parseval 求 $\sum_{n\ge1}n^{-6}$.

4.  证明 (7.4) 中 $f_N\to f$ 实际在图范数下成立, 并解释为什么仅有 $f\in L^2_r$ 时不能逐项应用 $A$.

5.  若 $f\in C^2[0,\pi]$, $f(0)=f(\pi)=0$, 证明正弦系数满足 $|b_n|\le C/n^2$, 并据此证明正弦级数绝对且一致收敛到 $f$.

本节习题解答见本页末的习题解答.

## 本章小结

紧性保证极值特征向量存在并使剩余限制算子的范数趋零, 因而穷尽非零谱方向. 对单射的正 Green 预解算子, 这给出整个 $L^2_r$ 的特征基. 闭性进一步把算子域精确变成带谱权的平方可和条件; 点态和一致收敛仍须指明额外正则性.

## 标准参考与延伸阅读

本章谱定理已完整证明. 延伸阅读: G. Teschl, *Mathematical Methods in Quantum Mechanics*, 作者在线的 2009 版, §6.2 (紧算子谱理论). 第 4 章的正交几何与第 6 章的预解构造是本章实际依赖.

## 习题解答

1.  令 $T_N$ 只保留前 $N$ 个输出坐标, 则 $T_N$ 有限秩, 且 $\|T-T_N\|=1/(N+1)\to0$, 故 $T$ 紧. $Tx=0$ 逐坐标给出 $x=0$, 所以核为零. 若 $Tx=\mu x$, 某个 $x_k\ne0$, 则 $\mu=1/k$; 不同指标的 $1/k$ 不同, 故该特征空间恰为 $\operatorname{span}\{e_k\}$. 全部非零特征值是 $1,1/2,1/3,\ldots$.

2.  若总维数无限, 从这些特征空间中选无限个单位正交特征向量 $e_j$, 对应 $|\mu_j|\ge\varepsilon$. 同一特征空间用正交化选择, 不同特征空间由自伴性自动正交. 于是 $\|Te_j-Te_k\|^2=|\mu_j|^2+|\mu_k|^2\ge2\varepsilon^2$, 与紧性矛盾.

3.  第 4 章给出奇数项 $b_n=8/(\pi n^3)$,偶数项零. 直接积分得 $\int_0^\pi x^2(\pi-x)^2\,dx=\pi^5/30$. Parseval 因而给出

$$
\frac{\pi^5}{30}=\frac\pi2\frac{64}{\pi^2}\sum_{n\ {
    m odd}}\frac1{n^6},\qquad
            \sum_{n\ {
    m odd}}\frac1{n^6}=\frac{\pi^6}{960}.
$$

 设 $S=\sum_{n\ge1}n^{-6}$, 偶数项之和为 $2^{-6}S$, 所以 $(1-2^{-6})S=\pi^6/960$, 即 $S=\pi^6/945$.

4.  对 $f\in D(A)$,

$$
\|f-f_N\|_A^2=\sum_{n>N}(1+\lambda_n^2)|c_n|^2\longrightarrow0.
$$

 仅有 $f\in H$ 保证 $\sum|c_n|^2<\infty$, 不保证加上 $\lambda_n^2$ 后仍收敛. 例如 $[0,\pi]$ 的 Dirichlet 问题取 $c_n=1/n$, 则 $f=\sum c_ne_n\in L^2$, 但 $\lambda_n=n^2$ 给出 $\sum\lambda_n^2|c_n|^2=\sum n^2=\infty$. 逐项施加 $A$ 的级数甚至不在 $L^2$ 中收敛.

5.  两次分部积分, 利用 $f$ 在两端为零及正弦在两端为零, 得

$$
b_n=-\frac2{\pi n^2}\int_0^\pi f''(x)\sin(nx)\,dx,
            \qquad |b_n|\le\frac{2\|f''\|_{L^1}}{\pi n^2}.
$$

 Weierstrass 一致收敛判别法给出绝对一致收敛到某连续 $g$. 完备性又给出 $L^2$ 收敛到 $f$, 故 $g=f$ 几乎处处. 两者连续, 所以在闭区间上处处相等.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[09_Green函数预解式与紧性|上一章]]
- [[08_特征值的变分刻画与单调性|下一章]]
