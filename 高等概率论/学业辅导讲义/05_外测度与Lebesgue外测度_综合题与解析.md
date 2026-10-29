---
title: 外测度与Lebesgue外测度综合题与解析
date: 2026-10-29
tags: [probability-tutoring, outer-measure]
note_type: 综合习题
status: 含答案解析
aliases:
  - 外测度法式大题
source: 自编综合题；Vitali构造参考袁德美、王学军上册例4.50
source_tex: "F:/LaTeX/外测度综合题/main.tex"
source_pdf: "F:/LaTeX/外测度与Lebesgue外测度_综合题.pdf"
---

# 外测度与 Lebesgue 外测度：递进式综合题与解析

建议用时：90—120分钟。前面完整保留题面与提示，后面按原题号给出答案解析。

设 $X$ 是非空集合。称 $\mu^*\colon\mathcal P(X)\to[0,\infty]$ 为外测度，如果它满足空集取零、单调性和可列次可加性。称 $A\subseteq X$ 为 $\mu^*$-可测集，如果对所有 $T\subseteq X$，
$$
\mu^*(T)=\mu^*(T\cap A)+\mu^*(T\setminus A).
$$
其中 $\mathcal P(X)$ 为 $X$ 的幂集，$A\triangle B$ 表示对称差。

本题允许使用 Carathéodory 定理，以及以下已学结论：Borel 集是 Lebesgue 可测集；Lebesgue 测度在可测集上满足测度的连续性；区间的测度等于其长度。以下以 $m$ 表示 Lebesgue 测度。第 7、8 问为进阶部分。

## 第一部分  外测度公理能保证什么？

### 1. 零外测度集合

证明下列结论：

(a) 若 $\mu^*(N)=0$，则 $N$ 的每个子集均为 $\mu^*$-可测集，且外测度为零。

(b) 可列个零外测度集合的并仍有零外测度。

(c) 若 $\mu^*(A\triangle B)=0$，则 $\mu^*(A)=\mu^*(B)$。

### 2. 一个有限值的反例

在 $X=\mathbb N=\{1,2,\ldots\}$ 上定义
$$
\nu^*(A)=
\begin{cases}
0,&A=\varnothing,\\
1,&A\text{ 非空且有限},\\
2,&A\text{ 无限}.
\end{cases}
$$

(a) 证明 $\nu^*$ 是外测度。

(b) 求全部 $\nu^*$-可测集。

(c) 分别考察
$$
A_n=\{1,\ldots,n\},\qquad B_n=\{n,n+1,\ldots\}.
$$
一般外测度是否必然具有下连续性？在首项外测度有限时，是否必然具有上连续性？说明理由。

## 第二部分  Lebesgue 外测度增加了什么结构？

对 $E\subseteq\mathbb R$，定义
$$
m^*(E)=\inf\left\{
\sum_k |I_k|:
E\subseteq\bigcup_k I_k,\ \{I_k\}\text{ 为至多可列个有界开区间}
\right\}.
$$
这里 $|I_k|$ 表示区间长度，空覆盖允许用于覆盖空集。

### 3. 覆盖定义带来的性质

(a) 证明 $m^*$ 是外测度。

(b) 证明每个至多可列集的 Lebesgue 外测度为零。

(c) 证明对所有 $E\subseteq\mathbb R$、$a\ne0$ 和 $b\in\mathbb R$，
$$
m^*(aE+b)=|a|\,m^*(E),
\qquad aE+b=\{ax+b:x\in E\}.
$$

### 4. 从外部寻找可测包络

证明对任意 $E\subseteq\mathbb R$，
$$
m^*(E)=\inf\{m(U):E\subseteq U,\ U\text{ 开}\}.
$$
进一步证明，存在一个 $G_\delta$ 集 $G\supseteq E$，使
$$
m(G)=m^*(E).
$$
这里 $G_\delta$ 集指可列个开集的交。

### 5. 任意递增集合列的下连续性

设 $E_n\uparrow E$，不假设 $E_n$ 可测。证明
$$
m^*(E_n)\uparrow m^*(E).
$$

> [!tip] 提示
> 利用第 4 问选取可测包络 $G_n\supseteq E_n$，并考虑 $H_n=\bigcap_{k\ge n}G_k$。说明这里为什么不能直接对原来的 $E_n$ 使用测度连续性。

### 6. 距离为正时的可加性

设 $A,B\subseteq\mathbb R$ 非空，且
$$
\operatorname{dist}(A,B)
=\inf\{|x-y|:x\in A,\ y\in B\}>0.
$$
证明
$$
m^*(A\cup B)=m^*(A)+m^*(B).
$$

> [!tip] 提示
> 构造包含 $A$、与 $B$ 不交的开集，再使用该开集的可测性。

用第 2 问的例子说明：在度量空间上，“正距离可加”也不是一般外测度公理的推论。

## 第三部分  Lebesgue 外测度仍然缺少什么？

### 7. 重新使用开篇的 Vitali 集

在 $[0,1]$ 上定义等价关系
$$
x\sim y\quad\Longleftrightarrow\quad x-y\in\mathbb Q.
$$
从每个等价类中选取一个代表，组成 $V$。把
$$
\mathbb Q\cap[-1,1]=\{q_1,q_2,\ldots\}
$$
无重复地枚举，记 $V_k=V+q_k$。

(a) 证明 $V_k$ 两两不交。

(b) 证明
$$
[0,1]\subseteq\bigcup_{k\ge1}V_k\subseteq[-1,2].
$$

(c) 令 $c=m^*(V)$，证明 $0<c\le1$，且 $m^*(V_k)=c$。

说明：代表集的选取使用选择公理。

### 8. 两种失败

(a) 利用第 7 问，证明存在有界、不交的集合 $A,B\subseteq\mathbb R$，使
$$
m^*(A\cup B)<m^*(A)+m^*(B).
$$

> [!tip] 提示
> 考察 $F_n=\bigcup_{k=1}^n V_k$。

(b) 令
$$
D_n=\bigcup_{k\ge n}V_k.
$$
证明 $D_n\downarrow\varnothing$，但
$$
m^*(D_1)<\infty,\qquad
\lim_{n\to\infty}m^*(D_n)>0.
$$
说明：要把测度的上连续性用于这样的集合列，除了有限性，还缺少什么条件？

## 参考答案与解析

### 题1. 零外测度集合

**(a) 子集的零外测度与可测性。** 设$E\subseteq N$且$\mu^*(N)=0$。先由单调性得到
$$
0\le\mu^*(E)\le\mu^*(N)=0,
$$
所以$\mu^*(E)=0$。还要检验$E$的可测性，不能只算出它的外测度就结束。

对任意测试集$T\subseteq X$，由次可加性与单调性，
$$
\begin{aligned}
\mu^*(T)
&\le\mu^*(T\cap E)+\mu^*(T\setminus E)\\
&=\mu^*(T\setminus E)\le\mu^*(T).
\end{aligned}
$$
中间的等号使用$T\cap E\subseteq E$，故其外测度为零。两端相同，全部不等式均取等号，这正是$E$的Carathéodory可测性条件。

**(b) 可列并。** 若$\mu^*(N_j)=0$，则
$$
0\le\mu^*\left(\bigcup_{j\ge1}N_j\right)
\le\sum_{j\ge1}\mu^*(N_j)=0.
$$

**(c) 相差一个零外测度集合。** 由$A\subseteq B\cup(A\triangle B)$可得
$$
\mu^*(A)\le\mu^*(B)+\mu^*(A\triangle B)=\mu^*(B).
$$
交换$A,B$得到反向不等式，所以二者相等。这个证明即使在两边均为无穷时仍成立，不需要作$\infty-\infty$。$\square$

**解析。** 外测度公理保证零集的子集可测，也保证忽略零外测度的差异不改变数值；它并没有保证所有单点都是零集。

### 题2. 一个有限值的反例

**(a) 验证外测度。** $\nu^*(\varnothing)=0$由定义成立。若$A\subseteq B$，有限或无限这两种情形的数值安排保证$\nu^*(A)\le\nu^*(B)$。

验证可列次可加性。令$A=\bigcup_jA_j$，分三种情况讨论。若$A=\varnothing$，两边均为零。若$A$非空且有限，至少一个$A_j$非空，故$\sum_j\nu^*(A_j)\ge1=\nu^*(A)$。若$A$无限，则或者某个$A_j$无限，使右侧至少为2；或者所有$A_j$有限，此时必有无穷多个非空项，使右侧等于无穷。两种情形均有
$$
\nu^*(A)\le\sum_j\nu^*(A_j).
$$
所以$\nu^*$是外测度。

**(b) 求可测集类。** $\varnothing,\mathbb N$总是可测。若$\varnothing\ne A\ne\mathbb N$，取测试集$T=\mathbb N$。$A,A^c$均非空，并且至少一个无限，于是
$$
\nu^*(A)+\nu^*(A^c)\ge3>2=\nu^*(\mathbb N).
$$
切分条件失败，因此全部可测集恰为$\{\varnothing,\mathbb N\}$。

**(c) 两种连续性均可能失败。** 对$A_n=\{1,\ldots,n\}$，
$$
A_n\uparrow\mathbb N,\qquad
\lim_n\nu^*(A_n)=1\ne2=\nu^*(\mathbb N).
$$
对$B_n=\{n,n+1,\ldots\}$，
$$
B_n\downarrow\varnothing,\qquad
\nu^*(B_1)=2<\infty,\qquad
\lim_n\nu^*(B_n)=2\ne0=\nu^*(\varnothing).
$$
所以一般外测度未必下连续，首项外测度有限也不足以保证上连续。$\square$

**解析。** 这里连全空间的外测度都是有限的，不能把连续性失败归咎于无穷大。根本问题是：外测度只要求次可加，而一般集合未必可测。

### 题3. 覆盖定义带来的性质

**(a) 验证外测度。** 空集可用空覆盖覆盖，总长度为零，故$m^*(\varnothing)=0$。若$E\subseteq F$，每个$F$的区间覆盖也覆盖$E$；对更大的候选覆盖族取下确界，得到$m^*(E)\le m^*(F)$。

现设$E=\bigcup_{j\ge1}E_j$。若$\sum_jm^*(E_j)=\infty$，次可加不等式自动成立。否则每个$m^*(E_j)$有限。给定$\varepsilon>0$，由下确界的定义，对每个$j$选开区间覆盖$\{I_{jk}\}_k$，使
$$
E_j\subseteq\bigcup_k I_{jk},\qquad
\sum_k|I_{jk}|<m^*(E_j)+\varepsilon2^{-j}.
$$
双重指标族仍至多可列，并且覆盖$E$，所以
$$
m^*(E)\le\sum_j\sum_k|I_{jk}|
\le\sum_jm^*(E_j)+\varepsilon.
$$
令$\varepsilon\downarrow0$即得可列次可加性。

**(b) 至多可列集。** 对一个点$x$，用$(x-\varepsilon/2,x+\varepsilon/2)$覆盖，得到$0\le m^*(\{x\})\le\varepsilon$。因$\varepsilon>0$任意，单点外测度为零。若$E$至多可列，把它写成单点的至多可列并，使用次可加性即可得到$m^*(E)=0$。

**(c) 仿射变换。** 设$a\ne0$。函数$f(x)=ax+b$把每个有界开区间$I_k$变成长度为$|a|\,|I_k|$的有界开区间。因此$E$的任意区间覆盖都给出$aE+b$的一个区间覆盖，取下确界可得
$$
m^*(aE+b)\le |a|\,m^*(E).
$$
对逆函数$f^{-1}(y)=(y-b)/a$应用同一结论，得到
$$
m^*(E)\le |a|^{-1}m^*(aE+b).
$$
乘以正数$|a|$，与前一不等式合并，便得到等号。以上推理允许外测度为无穷。$\square$

**解析。** 平移不变和伸缩时乘以长度比例，来自覆盖区间的几何性质。一般外测度公理没有规定这些几何行为。例如$\delta_0^*(A)=1$当且仅当$0\in A$，否则为零，就是不满足平移不变性的外测度。

### 题4. 从外部寻找可测包络

先设$m^*(E)<\infty$。给定$\varepsilon>0$，选取总长度小于$m^*(E)+\varepsilon$的开区间覆盖，令$U$为这些区间的并。$U$开，故为Borel集并且可测，于是
$$
m^*(E)\le m(U)=m^*(U)
\le\sum_k|I_k|<m^*(E)+\varepsilon.
$$
对包含$E$的开集取下确界，再令$\varepsilon\downarrow0$，得到所需等式。若$m^*(E)=\infty$，由单调性，每个包含$E$的开集测度都为无穷，同一公式仍成立。

在有限情形，对每个$j\ge1$选开集$U_j\supseteq E$，使$m(U_j)<m^*(E)+2^{-j}$。定义
$$
G=\bigcap_{j\ge1}U_j.
$$
它是$G_\delta$集，因而是Borel集；并且$E\subseteq G\subseteq U_j$对每个$j$成立。因此
$$
m^*(E)\le m(G)\le m(U_j)<m^*(E)+2^{-j}.
$$
令$j\to\infty$，得$m(G)=m^*(E)$。若$m^*(E)=\infty$，直接取$G=\mathbb R$即可。$\square$

**解析。** 这里的$G$是可测包络：包含原集合，且保留其外测度。构造中不要求$E$本身可测。也不能由$m(G)=m^*(E)$就写出$m^*(G\setminus E)=0$，因为此时并没有可用于$E$的测度差公式。

### 题5. 任意递增集合列的下连续性

由$E_n\uparrow E$与外测度单调性，数列$m^*(E_n)$递增，在扩展实数中有极限，记为$L$，并且
$$
L\le m^*(E).
$$
若$L=\infty$，此式已经给出所需等号。以下设$L<\infty$，则每个$m^*(E_n)$均有限。

由第4问，对每个$n$选可测集$G_n\supseteq E_n$，使$m(G_n)=m^*(E_n)$。这些$G_n$未必递增，不能直接对它们使用递增连续性。按提示定义
$$
H_n=\bigcap_{k\ge n}G_k.
$$
$H_n$可测；随着$n$增加，交集中的限制减少，因此$H_n\subseteq H_{n+1}$。又因为$k\ge n$时$E_n\subseteq E_k\subseteq G_k$，
$$
E_n\subseteq H_n\subseteq G_n.
$$
由两端数值相同得到
$$
m^*(E_n)\le m(H_n)\le m(G_n)=m^*(E_n),
$$
所以$m(H_n)=m^*(E_n)$。令$H=\bigcup_nH_n$。它可测，且包含$E=\bigcup_nE_n$。对可测集列$H_n$使用测度的下连续性，得到
$$
m^*(E)\le m(H)=\lim_nm(H_n)=\lim_nm^*(E_n)=L.
$$
与最初的反向不等式合并，结论成立。$\square$

**解析。** 原来的$E_n$未假设可测，直接引用测度连续性会缺少条件。第4问提供包络，而尾交把包络变成递增列；真正使用测度连续性的是$H_n$。因此这个结论比“可测集列的下连续性”更强。

### 题6. 距离为正时的可加性

记$d=\operatorname{dist}(A,B)>0$，构造开集
$$
U=\bigcup_{x\in A}(x-d/3,x+d/3).
$$
它包含$A$。若$y\in U\cap B$，则某个$x\in A$满足$|x-y|<d/3<d$，与距离下界矛盾，所以$U\cap B=\varnothing$。

开集$U$是Lebesgue可测集，可把它的Carathéodory切分条件用于任意测试集，特别是$T=A\cup B$。由于
$$
T\cap U=A,\qquad T\setminus U=B,
$$
立刻得到$m^*(A\cup B)=m^*(A)+m^*(B)$。这里既没有要求$A,B$可测，也没有要求它们的外测度有限。

对第2问的空间$\mathbb N$采用通常距离，取$A=\{1\}$、$B=\{2\}$，有$\operatorname{dist}(A,B)=1$，但
$$
\nu^*(A\cup B)=1<2=\nu^*(A)+\nu^*(B).
$$
因此正距离可加不是一般外测度公理的推论。$\square$

**解析。** 本题把“能够用可测开集分开”转成可加性。单纯不相交比正距离弱；第8问会给出不相交但严格次可加的实例。

### 题7. 重新使用开篇的 Vitali 集

**(a) 不交性。** 若某点同时属于$V_i$和$V_j$，就有$v+q_i=w+q_j$，其中$v,w\in V$。故$v-w=q_j-q_i\in\mathbb Q$，即$v,w$属于同一等价类。由于$V$每类只取一个代表，$v=w$，再由无重复枚举得$i=j$。因此$V_k$两两不交。

**(b) 两边包含。** 对任意$x\in[0,1]$，其等价类在$V$中的代表为$v$。则$x-v\in\mathbb Q\cap[-1,1]$，故$x=v+q_k$对某个$k$成立，给出左边包含。右边包含来自$V\subseteq[0,1]$和$q_k\in[-1,1]$。

**(c) 正且有限的外测度。** 单调性给出$0\le c=m^*(V)\le1$。由第3问的平移不变性，所有$m^*(V_k)$均等于$c$。若$c=0$，则由覆盖关系和次可加性，
$$
1=m^*([0,1])
\le m^*\left(\bigcup_{k\ge1}V_k\right)
\le\sum_{k\ge1}m^*(V_k)=0,
$$
矛盾。因此$0<c\le1$。$\square$

**解析。** 这一步只用了次可加性，所以不能把最后的“$\le$”擅自改成“$=$”。所有平移集的不交性还不够保证外测度可列可加。

### 题8. 两种失败

**(a) 有界不交集合也可能严格次可加。** 令$F_n=\bigcup_{j=1}^nV_j$。每个$F_n\subseteq[-1,2]$，所以$m^*(F_n)\le3$。第7问给出$c>0$，可选整数$N$使$Nc>3$。

对每个$2\le k\le N$，次可加性给出
$$
m^*(F_k)\le m^*(F_{k-1})+c.
$$
若这些不等式全部取等号，由$m^*(F_1)=c$递推得到$m^*(F_N)=Nc>3$，矛盾。因此至少有一个$k$满足严格不等式。取
$$
A=F_{k-1},\qquad B=V_k,
$$
两者不交且有界，并满足
$$
m^*(A\cup B)<m^*(A)+m^*(B).
$$

**(b) 首项有限仍可能失去上连续性。** 对尾并$D_n=\bigcup_{k\ge n}V_k$，由$D_{n+1}\subseteq D_n$知其递减。对任意$x$，若它不在$D_1$中，则从不在任何$D_n$中；若它在$D_1$中，不交性说明它只属于唯一的$V_j$，于是$n>j$后$x\notin D_n$。因此每个点最终都离开，得到$D_n\downarrow\varnothing$。

另一方面，$V_n\subseteq D_n\subseteq[-1,2]$，所以
$$
0<c\le m^*(D_n)\le3.
$$
数列$m^*(D_n)$递减且下界为$c$，故存在极限$L$，并且
$$
L\ge c>0=m^*(\varnothing),\qquad m^*(D_1)\le3<\infty.
$$
这就证明，即使集合列全部有界、首项外测度有限，Lebesgue外测度仍不必对任意递减集合列上连续。测度的上连续性定理还要求集合列各项可测；本题没有这个条件。$\square$

**解析。** 第5问通过可测包络证明的是递增列结论。包络只保证包含和相同数值，不保证包络相交后仍保留原递减列的交集，所以不能把该证明照搬到递减情形。

## 性质对照

这里“可测”均指相应外测度的Carathéodory可测性。几何性质在指定度量或实直线结构下比较。

| 性质 | 一般外测度，仅有公理 | Lebesgue外测度 |
|---|---|---|
| 单调、可列次可加 | 成立 | 成立 |
| 零外测度集合的所有子集可测 | 成立 | 成立 |
| 每个至多可列集外测度为零 | 不保证 | 成立 |
| 任意不交两集合可加 | 不保证 | 也不保证 |
| 正距离集合可加 | 不保证 | 成立 |
| 每个集合有同外测度的可测包络 | 不保证 | 成立，且可取$G_\delta$包络 |
| 任意递增集合列下连续 | 不保证 | 成立 |
| 任意递减集合列、首项外测度有限时上连续 | 不保证 | 也不保证；可测时成立 |

“Lebesgue外测度具有”不表示其他外测度都不能具有这些性质，而是说它们不能仅从外测度公理推出。限制到可测集类后，外测度成为测度，可列可加和测度的连续性便能在相应条件下使用。


## 来源与版本

本题为自编综合题。Vitali构造参考袁德美、王学军《测度论基础与高等概率论》上册例4.50（印刷第108—109页）。第2问的三值外测度及小问编排为自编。

本笔记由本机LaTeX题目版转为Obsidian Markdown，并按用户要求在题目后追加完整答案解析；同一组解答同步排入PDF。题号、数学条件和原提示保持一致。

## 相关链接

- [[00_讲义总览|概率论学业辅导讲义总览]]
