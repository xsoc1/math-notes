---
title: Krein 边界条件与移位模型
date: '2026-09-22'
tags:
- SL
- spectral-theory
- sl-lecture
stage_type: lecture
status: audited
lecture_chapter: 12
latex_source: F:\LaTeX\SL_Spectral_Theory_Lecture\chapters\12_krein.tex
latex_master: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.tex
latex_pdf: F:\LaTeX\SL_Spectral_Theory_Lecture\SL_Spectral_Theory_Lecture_Notes.pdf
prerequisites:
- '[[21_右定算子与左定空间]]'
---

# 第 12 章 Krein 边界条件与移位模型
> [!info] 阅读位置
> 本页对应新版第 12 章. 文件名前缀保留历史讲次; 以 [[00_SL谱理论讲义总览]] 中的新章序阅读.


> [!abstract] 本章目标
把左定尺度应用于一个带耦合边界条件的具体模型, 直接证明正性,自伴性与第一左定空间的 Sobolev 描述.

> [!question] 基本问题
为什么能量中会出现负的边界项, 而整个内积仍然正定?

## 先看两个仿射模态

> [!example] 例. 常数与直线同时满足边界条件

在 $[-1,1]$ 上, $f(x)=a+bx$ 满足

$$
f'(-1)=f'(1)=b=\frac{f(1)-f(-1)}2.
$$

 所以 $-f''=0$ 的零空间将含有两个独立方向 $1,x$. 这与 Dirichlet 边界条件排除所有非零仿射函数的情形不同.

> [!note] 定义. 移位 Krein 算子

固定 $c>0$, 记 $\Delta f=f(1)-f(-1)$, 在 $L^2(-1,1)$ 中定义

$$
A_cf=-f''+cf,\qquad
        D(A_c)=\{f\in H^2(-1,1):f'(-1)=f'(1)=\Delta f/2\}.
$$

 $H^2$ 在此是普通 Sobolev 空间. 未移位模型记为 $A_0$, 它采用同一个定义域. 条件把左右端点联系起来, 称为耦合边界条件.

## 正性与自伴性来自哪里

> [!note] 引理. 正确的能量恒等式

若 $f\in D(A_c)$, 则

$$
(A_cf,f)_{L^2}=\int_{-1}^1|f'|^2\,dx
        -\frac{|\Delta f|^2}{2}+c\int_{-1}^1|f|^2\,dx
        \ge c\|f\|_{L^2}^2.
$$

 $A_0$ 的核恰为 $\operatorname{span}\{1,x\}$.

**证明.**

分部积分的边界项为 $-[f'\overline f]_{-1}^1=-\Delta f\overline{\Delta f}/2$. 又 $\Delta f=\int_{-1}^1f'$, Cauchy--Schwarz 给出 $|\Delta f|^2\le2\int|f'|^2$, 所以能量非负. 若 $A_0f=0$, 则弱意义下 $f''=0$, 于是 $f=a+bx$; 这样的函数全部满足边界条件. $\square$

> [!note] 定理. 自伴性,可逆性与离散谱

$A_c$ 是稠密定义的自伴算子, $A_c\ge cI$. 它的逆在 $L^2$ 上处处定义, 有界且紧, 因而有完备的离散本征函数系.

**证明.**

$C_c^\infty(-1,1)\subset D(A_c)$ 保证定义域稠密. 对 $f,g\in D(A_c)$, Green 边界形式为

$$
[-f'\overline g+f\overline{g'}]_{-1}^1
        =-\tfrac12\Delta f\overline{\Delta g}
        +\tfrac12\Delta f\overline{\Delta g}=0,
$$

 所以 $A_c$ 对称.

给定 $h\in L^2$, 方程 $-f''+cf=h$ 的所有解, 由常系数 ODE 的 变参数公式, 是一个 $H^2$ 特解加上 $a\cosh(\sqrt c\,x)+b\sinh(\sqrt c\,x)$. 两个边界残差 $f'(1)-\Delta f/2$ 与 $f'(-1)-\Delta f/2$ 对 $(a,b)$ 给出一个二阶线性方程组. 若其齐次矩阵有非零核, 就有非零 $f\in D(A_c)$ 满足 $A_cf=0$, 与 (12.2) 矛盾. 所以矩阵可逆, 解存在唯一. 同一能量式给出 $\|f\|_{L^2}\le c^{-1}\|h\|_{L^2}$. 故 $B=A_c^{-1}$ 是处处定义的有界算子. 用 $f=Bh$, $g=Bk$ 代入对称性, 得 $(Bh,k)=(h,Bk)$, 即 $B$ 自伴.

为避免把 "对称" 当成 "自伴", 再核对伴随域. 若 $v\in D(A_c^*)$ 且 $A_c^*v=w$, 对任意 $h\in L^2$ 测试 $f=Bh$ 得 $(h,v)=(Bh,w)=(h,Bw)$. 于是 $v=Bw\in D(A_c)$, 证明 $A_c^*=A_c$.

此外 $f''=cf-h$ 给出 $\|f''\|_{L^2}\le2\|h\|_{L^2}$. 一维估计 $\|f'\|_{L^2}\le C(\|f\|_{L^2}+\|f''\|_{L^2})$ 可这样得到: 写 $f=a+bx+R$, 其中 $R(0)=R'(0)=0$, $R''=f''$; 两次积分控制 $\|R\|_{H^2}$, 而仿射空间上的 $L^2$ 范数控制 $a,b$. 故 $B:L^2\to H^2$ 有界. 第 5--6 章的一维紧嵌入 $H^1\hookrightarrow L^2$ 说明 $B$ 紧. 最后对紧自伴,单射的 $B$ 应用第 7 章的谱定理. $\square$

## 显式谱与奇偶分解

> [!note] 命题. 完整本征函数表

$A_c$ 的本征函数可以取为

$$
\{1,x\}\ \cup\ \{\cos(n\pi x):n\ge1\}
        \ \cup\ \{\sin(\mu_nx):n\ge1\},
$$

 对应本征值分别为 $c$ (重数二), $c+n^2\pi^2$, $c+\mu_n^2$. 这里 $\mu_n$ 是区间 $(n\pi,n\pi+\pi/2)$ 内 $\tan\mu=\mu$ 的唯一根.

**证明.**

由正性, 本征值写成 $c+k^2$, $k\ge0$. $k=0$ 给出仿射函数. 若 $k>0$, 方程的偶解为 $\cos kx$, 其边界条件等价于 $\sin k=0$, 故 $k=n\pi$. 奇解为 $\sin kx$, 边界条件等价于 $k\cos k=\sin k$. $\cos k=0$ 时不成立, 故等价于 $\tan k=k$. 在 $(n\pi,n\pi+\pi/2)$ 上, $\tan k-k$ 从负值增加到正无穷, 导数 $\tan^2k>0$ 于内部, 所以根唯一. 在 $(0,\pi/2)$ 上只有被排除的端点根 $0$, 其余正半周期中 $\tan k<0<k$. 一般解是奇偶解之和, 而边界条件分别保持奇偶部分, 因此列表没有遗漏本征函数. 前一定理保证它们完备. $\square$

> [!example] 例. 重数二不是两个不同的特征值

$1/\sqrt2$ 与 $\sqrt{3/2}\,x$ 是本征值 $c$ 的两个正交规范向量. 按重数计数时, 序列最初两项都等于 $c$. 分离边界条件下的单重性不能直接搬到本章的耦合边界问题.

## 第一左定空间为什么没有导数边界条件

> [!note] 定义. Krein 能量型

在整个 $H^1(-1,1)$ 上定义

$$
q_c(f,g)=\int_{-1}^1(f'\overline{g'}+cf\overline g)\,dx
        -\frac{\Delta f\overline{\Delta g}}2.
$$

 第 5 章的迹保证这个式子有意义. 记谱尺度 $\mathcal H_c^s=D(A_c^{s/2})$, 范数记为 $\|\cdot\|_{s,c}$.

> [!note] 定理. 第一左定空间与普通 $H^1$

$q_c$ 是 $H^1(-1,1)$ 上的内积, 其范数与普通 $H^1$ 范数等价, 且

$$
\mathcal H_c^1=H^1(-1,1),\qquad
        (f,g)_{1,c}=q_c(f,g).
$$

 这个空间不要求 $f'(-1)$ 或 $f'(1)$ 存在.

**证明.**

正性与 $q_c(f,f)\ge c\|f\|_{L^2}^2$ 由前面的积分估计对所有 $H^1$ 函数成立. 上界 $q_c(f,f)\le\|f'\|_{L^2}^2+c\|f\|_{L^2}^2$ 直接可见. 为证明反向范数控制, 设 $\ell=a+bx$ 是连接 $f$ 两端点的直线, $h=f-\ell\in H_0^1(-1,1)$. 因 $b=\Delta f/2$ 和 $\int h'=0$,

$$
q_c(f,f)=\|h'\|_{L^2}^2+c\|f\|_{L^2}^2.
$$

 两端零值给出 $\|h\|_{L^2}\le2\|h'\|_{L^2}$. 又 $\int_{-1}^1x\ell(x)\,dx=2b/3$, 所以

$$
|b|\le\sqrt{3/2}(\|f\|_{L^2}+\|h\|_{L^2}),\qquad
        \|f'\|_{L^2}^2=2|b|^2+\|h'\|_{L^2}^2.
$$

 这些式子证明 $\|f\|_{H^1}^2\le C_cq_c(f,f)$. 因此 $H^1$ 在 $q_c$ 下完备.

现取 $A_c$ 的 $L^2$ 正交规范本征系 $e_j$, 本征值为 $\lambda_j$. 对 $f\in H^1$ 和 $e_j\in D(A_c)$, 把导数从 $f$ 移到 $e_j$, 其边界条件恰好消去 (12.4) 中的边界项, 得 $q_c(f,e_j)=\lambda_j(f,e_j)_{L^2}$. 故 $e_j/\sqrt{\lambda_j}$ 在 $q_c$ 下正交规范. 若 $f$ 与它们全都 $q_c$ 正交, 则 $f$ 与所有 $e_j$ 都 $L^2$ 正交, 于是 $f=0$. 第 4 章的正交补判据证明它们在 $H^1$ 中完备. Parseval 因而给出

$$
q_c(f,f)=\sum_j\lambda_j|(f,e_j)_{L^2}|^2.
$$

 反之, 若右边有限, 有限本征和在 $q_c$ 范数中收敛到某个 $H^1$ 函数; 连续嵌入 $H^1\hookrightarrow L^2$ 说明它就是原来的 $L^2$ 函数. 这证明了空间等式; 内积等式由极化得到. $\square$

> [!note] 注. 型域与算子域

$\mathcal H_c^1=H^1$ 的边界值自由, 而 $\mathcal H_c^2=D(A_c)$ 满足两个导数边界条件. $A_c$ 的能量型在第一空间上定义, 算子本身在第二空间上定义. 当 $c=0$ 时, $q_0(a+bx,a+bx)=0$ 对所有仿射函数成立, 所以 $q_0$ 只有半范数. 正移位在这里承担实质作用.

## 习题

本节习题解答见本页末的习题解答.

1.  直接验证 $x^2\in\mathcal H_c^1$ 但 $x^2\notin\mathcal H_c^2$.

2.  求 $q_c(1,1)$,$q_c(x,x)$,$q_c(1,x)$, 并求 $1,x$ 在第一左定空间中的规范化.

3.  证明 $\|\sin(\mu_nx)\|_{L^2(-1,1)}^2=\mu_n^2/(1+\mu_n^2)$.

4.  对 $f,g\in D(A_c)$ 展开 $(A_cf,A_cg)_{L^2}$, 写出第二左定内积的导数与边界表达式.

## 本章小结

Krein 边界条件保留两个仿射模态. 它带来的负边界能量由导数积分控制; 移位 $c>0$ 保证严格正性. 第一左定空间是整个 $H^1$, 第二左定空间才要求导数边界条件. 这为下一章比较不同多项式族提供了明确的环境.

## 标准参考与延伸阅读

模型与文献记号对应于 Jones--Littlejohn--Quintero Roba, *Krein--Sobolev Orthogonal Polynomials II*, Axioms 14 (2025), 115, 第 1--3 节, 特别是式 (2)--(4),(7)--(10). 本章的自伴性,紧性与型域辨认采用正文给出的直接证明.

## 习题解答

1.  $x^2$ 是光滑函数, 故属于 $H^1=\mathcal H_c^1$. 它的两端导数为 $-2,2$, 端点跳跃为零, 不满足 Krein 边界条件, 故不在 $\mathcal H_c^2=D(A_c)$ 中.

2.  $q_c(1,1)=2c$, $q_c(x,x)=2c/3$, $q_c(1,x)=0$. 规范化分别为 $(2c)^{-1/2}$ 与 $\sqrt{3/(2c)}x$. 对 $x$ 的计算中, 导数积分 $2$ 与边界项 $-2$ 必须相消.

3.  直接积分得

$$
\int_{-1}^1\sin^2(\mu_nx)\,dx
            =1-\frac{\sin(2\mu_n)}{2\mu_n}.
$$

 由 $\tan\mu_n=\mu_n$ 得 $\sin(2\mu_n)/(2\mu_n)=\cos^2\mu_n=1/(1+\mu_n^2)$, 代入即得结果.

4.  展开乘积, 对两个交叉项分别分部积分, 得

$$
(f,g)_{2,c}=\int_{-1}^1
            (f''\overline{g''}+2cf'\overline{g'}+c^2f\overline g)\,dx
            -c\Delta f\overline{\Delta g}.
$$

 每个交叉项的边界贡献都是 $-c\Delta f\overline{\Delta g}/2$. 此公式的定义域是 $f,g\in D(A_c)$, 不能任意删去边界条件后声称仍等于谱内积.

## 相关链接

- [[00_SL谱理论讲义总览]]
- [[21_右定算子与左定空间|上一章]]
- [[23_正交多项式与Krein-Sobolev系|下一章]]
