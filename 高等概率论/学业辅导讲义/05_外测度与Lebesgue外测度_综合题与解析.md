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

> [!info] 专题导读与训练建议
> 本套递进式综合题旨在引导读者深入辨析“抽象外测度公理”与“实直线 Lebesgue 外测度具体覆盖构造”在分析性质上的异同。全题共分三个部分、8 道主问，建议独立完成用时为 90–120 分钟。前半部分完整呈现题面与解题提示，后半部分按题号给出严谨的证明与方法评注。

**基本定义与前提约定。** 设 $X$ 是非空集合。称定义在幂集 $\mathcal P(X)$ 上的函数 $\mu^*\colon\mathcal P(X)\to[0,\infty]$ 为**外测度**，如果它满足空集取零（$\mu^*(\varnothing)=0$）、单调性（$A\subseteq B\Rightarrow\mu^*(A)\le\mu^*(B)$）和可列次可加性（$\mu^*\bigl(\bigcup_n A_n\bigr)\le\sum_n\mu^*(A_n)$）。称子集 $A\subseteq X$ 为 **$\mu^*$-可测集**（Carathéodory 可测集），如果对一切测试集 $T\subseteq X$，均有切分等式
$$
\mu^*(T)=\mu^*(T\cap A)+\mu^*(T\setminus A).
$$
其中 $\mathcal P(X)$ 表示 $X$ 的幂集，$A\triangle B=(A\setminus B)\cup(B\setminus A)$ 表示集合的对称差。

在解答以下各问时，可直接引用 Carathéodory 定理，以及实直线上关于 Lebesgue 测度 $m$ 的如下已知基本结论：全体 Borel 集均为 Lebesgue 可测集；Lebesgue 测度 $m$ 是 Lebesgue 外测度 $m^*$ 在可测集类上的限制，且在可测集列上满足测度的单调连续性；任意有界区间的测度等于其长度。其中第 7、8 两问为进阶探究部分。

## 第一部分　外测度公理能保证什么？

### 1. 零外测度集合

证明对于任意抽象外测度 $\mu^*$，下列基本结论恒成立：

(a) 若 $N\subseteq X$ 满足 $\mu^*(N)=0$，则 $N$ 的每一个子集 $E\subseteq N$ 均为 $\mu^*$-可测集，且满足 $\mu^*(E)=0$。

(b) 可列个零外测度集合的并集仍具有零外测度。

(c) 若两个集合 $A,B\subseteq X$ 满足 $\mu^*(A\triangle B)=0$，则必有 $\mu^*(A)=\mu^*(B)$。

### 2. 一个有限值的反例

在正整数集 $X=\mathbb N=\{1,2,\ldots\}$ 的幂集上定义函数 $\nu^*\colon\mathcal P(\mathbb N)\to[0,\infty]$ 如下：
$$
\nu^*(A)=
\begin{cases}
0,&A=\varnothing,\\
1,&A\text{ 非空且有限},\\
2,&A\text{ 无限}.
\end{cases}
$$

(a) 证明 $\nu^*$ 是 $X=\mathbb N$ 上的一个外测度。

(b) 求出全体 $\nu^*$-可测集。

(c) 分别考察如下两个单调集合列：
$$
A_n=\{1,\ldots,n\},\qquad B_n=\{n,n+1,\ldots\}\quad(n\ge1).
$$
回答并论证：一般的外测度是否必然对任意递增集合列具有下连续性？在递减集合列首项外测度有限的前提下，一般的外测度是否必然具有上连续性？

## 第二部分　Lebesgue 外测度增加了什么结构？

对于实直线上的任意子集 $E\subseteq\mathbb R$，其 **Lebesgue 外测度**定义为可列有界开区间覆盖总长度的下确界：
$$
m^*(E)=\inf\left\{
\sum_k |I_k|:
E\subseteq\bigcup_k I_k,\ \{I_k\}\text{ 为至多可列个有界开区间}
\right\}.
$$
其中 $|I_k|$ 表示开区间 $I_k$ 的长度，并允许用空覆盖族（总长度记为 $0$）覆盖空集 $\varnothing$。

### 3. 覆盖定义带来的性质

(a) 证明 $m^*$ 是 $\mathbb R$ 上的一个外测度。

(b) 证明 $\mathbb R$ 中任意至多可列集的 Lebesgue 外测度均为零。

(c) 证明对任意子集 $E\subseteq\mathbb R$、非零实数 $a\ne0$ 以及平移量 $b\in\mathbb R$，均有仿射变换公式：
$$
m^*(aE+b)=|a|\,m^*(E),
\qquad\text{其中 }aE+b=\{ax+b:x\in E\}.
$$

### 4. 从外部寻找可测包络

证明：对任意子集 $E\subseteq\mathbb R$，其 Lebesgue 外测度可由包含它的开集测度从外部逼近（外正则性）：
$$
m^*(E)=\inf\{m(U):E\subseteq U,\ U\text{ 为 }\mathbb R\text{ 中的开集}\}.
$$

进一步证明：对任意 $E\subseteq\mathbb R$，必存在一个包含 $E$ 的 $G_\delta$ 集 $G\supseteq E$，使得
$$
m(G)=m^*(E).
$$
（注：$G_\delta$ 集是指可列个开集的交集，满足 $G\supseteq E$ 且 $m(G)=m^*(E)$ 的可测集 $G$ 称为 $E$ 的**可测包络**或等测包。）

### 5. 任意递增集合列的下连续性

设 $\{E_n\}_{n\ge1}$ 为 $\mathbb R$ 中的单调递增集合列：$E_n\uparrow E$（**注意：此处不假设各 $E_n$ 是可测集**）。证明 Lebesgue 外测度对任意递增集合列仍具有下连续性：
$$
m^*(E_n)\uparrow m^*(E).
$$

> [!tip] 提示
> 利用第 4 问的结论对每个 $E_n$ 选取 $G_\delta$ 可测包络 $G_n\supseteq E_n$，并考察尾交序列 $H_n=\bigcap_{k\ge n}G_k$。在证明中请说明：为什么这里不能跳过包络构造而直接对原始集合列 $\{E_n\}$ 引用测度的下连续性定理？

### 6. 距离为正时的可加性

设 $A,B\subseteq\mathbb R$ 为两个非空子集（不必可测），且它们之间的欧氏距离严格为正：
$$
\operatorname{dist}(A,B)
=\inf\{|x-y|:x\in A,\ y\in B\}>0.
$$
证明 Lebesgue 外测度对正距离集合满足可加性（Carathéodory 度量外测度条件）：
$$
m^*(A\cup B)=m^*(A)+m^*(B).
$$

> [!tip] 提示
> 利用 $d=\operatorname{dist}(A,B)>0$ 构造一个包含 $A$ 且与 $B$ 互不相交的开集 $U$，再结合开集 $U$ 的 Lebesgue 可测性切分测试集 $T=A\cup B$。

进一步，结合第一部分第 2 问中的反例说明：在一般的度量空间上，“距离为正的两个集合外测度可加”并不能仅从抽象外测度的三条公理推导出来。

## 第三部分　Lebesgue 外测度仍然缺少什么？

### 7. 重新使用开篇的 Vitali 集

在单位闭区间 $[0,1]$ 上定义有理平移等价关系：
$$
x\sim y\quad\Longleftrightarrow\quad x-y\in\mathbb Q.
$$
利用选择公理，从每一个等价类中各选出一个代表元，组成代表集 $V\subseteq[0,1]$。将 $[-1,1]$ 中的全体有理数无重复地枚举为可列序列
$$
\mathbb Q\cap[-1,1]=\{q_1,q_2,\ldots\},
$$
并记平移集合列为 $V_k=V+q_k$（$k\ge1$）。

(a) 证明序列 $\{V_k\}_{k\ge1}$ 两两不交。

(b) 证明如下双向包含关系：
$$
[0,1]\subseteq\bigcup_{k\ge1}V_k\subseteq[-1,2].
$$

(c) 记 $c=m^*(V)$。直接利用 Lebesgue 外测度 $m^*$ 的性质（此时不假设 $V$ 可测），证明 $0<c\le1$，且对一切 $k\ge1$ 均有 $m^*(V_k)=c$。

### 8. 两种失败

(a) 利用第 7 问构造的序列 $\{V_k\}$，证明在 $\mathbb R$ 中存在两个有界且互不相交的子集 $A,B\subseteq\mathbb R$（$A\cap B=\varnothing$），使得 Lebesgue 外测度严格次可加：
$$
m^*(A\cup B)<m^*(A)+m^*(B).
$$

> [!tip] 提示
> 考察有限部分并序列 $F_n=\bigcup_{k=1}^n V_k$ 的外测度上界与递推关系。

(b) 考察由 $\{V_k\}$ 构成的尾并递减序列：
$$
D_n=\bigcup_{k\ge n}V_k\quad(n\ge1).
$$
证明 $D_n\downarrow\varnothing$（$n\to\infty$），且首项满足有限性条件 $m^*(D_1)<\infty$，但极限却满足：
$$
\lim_{n\to\infty}m^*(D_n)>0=m^*(\varnothing).
$$
并据此说明：若要对递减集合列应用测度的上连续性结论，除了首项外测度有限之外，还必须补充什么关键条件？为什么第 5 问中用于证明递增下连续性的可测包络方法不能平行地搬到递减情形？

## 参考答案与解析

### 题1. 零外测度集合

**(a) 零外测度集的子集仍为零外测度且可测。** 设 $E\subseteq N$ 且 $\mu^*(N)=0$。首先由外测度的非负性与单调性可得
$$
0\le\mu^*(E)\le\mu^*(N)=0,
$$
因此 $\mu^*(E)=0$。接下来进一步验证 $E$ 满足 Carathéodory 可测性条件：任取测试集 $T\subseteq X$，由于 $T\cap E\subseteq E$，再次应用单调性可知 $0\le\mu^*(T\cap E)\le\mu^*(E)=0$，即 $\mu^*(T\cap E)=0$；同时由 $T\setminus E\subseteq T$ 有 $\mu^*(T\setminus E)\le\mu^*(T)$。结合外测度的次可加性，我们得到如下不等式链：
$$
\begin{aligned}
\mu^*(T)
&\le\mu^*(T\cap E)+\mu^*(T\setminus E)\\
&=0+\mu^*(T\setminus E)=\mu^*(T\setminus E)\le\mu^*(T).
\end{aligned}
$$
由于首尾两端均为 $\mu^*(T)$，中间的不等号必须全部取等号，即对任意测试集 $T\subseteq X$ 均有 $\mu^*(T)=\mu^*(T\cap E)+\mu^*(T\setminus E)$。故 $E$ 是 $\mu^*$-可测集。

**(b) 可列个零外测度集的并仍具有零外测度。** 设对每个 $j\ge1$ 均有 $\mu^*(N_j)=0$，由非负性与可列次可加性立即可得：
$$
0\le\mu^*\left(\bigcup_{j\ge1}N_j\right)
\le\sum_{j\ge1}\mu^*(N_j)=\sum_{j\ge1}0=0,
$$
故 $\mu^*\bigl(\bigcup_{j\ge1}N_j\bigr)=0$。

**(c) 对称差为零外测度时两集合外测度相等。** 注意到对任意两个集合 $A,B\subseteq X$，恒有包含关系 $A\subseteq B\cup(A\setminus B)\subseteq B\cup(A\triangle B)$。应用外测度的单调性与次可加性，并代入 $\mu^*(A\triangle B)=0$，可得：
$$
\mu^*(A)\le\mu^*(B)+\mu^*(A\triangle B)=\mu^*(B)+0=\mu^*(B).
$$
将上述推导中 $A$ 与 $B$ 的角色互换（因 $B\triangle A=A\triangle B$），同理可得反向不等式 $\mu^*(B)\le\mu^*(A)$。因此 $\mu^*(A)=\mu^*(B)$。值得注意的是，这一不等式双向夹逼证法完全不涉及减法，故即使在 $\mu^*(A)$ 与 $\mu^*(B)$ 取无穷大时也依然有效。$\square$

**方法评注。** 第 1 题表明，仅凭外测度的三条基本公理，就足以保证诱导出的可测集 $\sigma$-代数自动具备**完备性**（零外测度集的一切子集均可测），并且保证外测度对零外测度集的增删具有不变性。但需要注意，抽象外测度公理本身并不保证单点集的外测度为零。

### 题2. 一个有限值的反例

**(a) 验证 $\nu^*$ 是外测度。**
1. **空集取零**：由定义直接有 $\nu^*(\varnothing)=0$；
2. **单调性**：设 $A\subseteq B\subseteq\mathbb N$。若 $A=\varnothing$，则 $\nu^*(A)=0\le\nu^*(B)$；若 $A$ 非空且有限，则 $B$ 必非空（或为有限集，或为无限集），故 $\nu^*(B)\in\{1,2\}$，均有 $\nu^*(A)=1\le\nu^*(B)$；若 $A$ 为无限集，则包含它的 $B$ 必为无限集，故 $\nu^*(A)=2=\nu^*(B)$。因此单调性成立。
3. **可列次可加性**：设 $A=\bigcup_{j\ge1} A_j$，分三种情形核验不等式 $\nu^*(A)\le\sum_{j\ge1}\nu^*(A_j)$：
   - 若 $A=\varnothing$，则每个 $A_j=\varnothing$，两边均为 $0$；
   - 若 $A$ 非空且有限，则至少存在一个下标 $j_0$ 使得 $A_{j_0}\ne\varnothing$，故 $\nu^*(A_{j_0})\ge1$，从而右端级数和 $\ge1=\nu^*(A)$；
   - 若 $A$ 为无限集，则或者存在某个下标 $j_0$ 使得 $A_{j_0}$ 本身就是无限集（此时 $\nu^*(A_{j_0})=2$，右端级数和 $\ge2=\nu^*(A)$），或者每一个 $A_j$ 都是有限集——但在后一种情况下，由于有限个有限集的并仍是有限集，要想拼出无限集 $A$，序列 $\{A_j\}$ 中必须有**无穷多个**非空有限集（每个贡献 $\nu^*(A_j)=1$），此时右端级数和为 $\sum_{j\ge1}\nu^*(A_j)=\infty\ge2=\nu^*(A)$。
综上所述，对一切集合列均有 $\nu^*\bigl(\bigcup_j A_j\bigr)\le\sum_j\nu^*(A_j)$，故 $\nu^*$ 是外测度。

**(b) 求全体 $\nu^*$-可测集。**
空集 $\varnothing$ 与全集 $\mathbb N$ 显然是 $\nu^*$-可测集。现设 $A\subseteq\mathbb N$ 为任意一个非空真子集（即 $\varnothing\ne A\ne\mathbb N$），取测试集为全集 $T=\mathbb N$。此时 $T\cap A=A$ 与 $T\setminus A=A^c$ 均非空；又因为全集 $\mathbb N=A\sqcup A^c$ 是无限集，$A$ 与 $A^c$ 中不可能两个都是有限集，必至少有一个是无限集（外测度为 $2$），另一个至少非空（外测度 $\ge1$）。于是将两者相加可得：
$$
\nu^*(T\cap A)+\nu^*(T\setminus A)=\nu^*(A)+\nu^*(A^c)\ge 1+2=3>2=\nu^*(\mathbb N)=\nu^*(T).
$$
这说明对任何非空真子集 $A$，Carathéodory 切分等式在 $T=\mathbb N$ 处均严格失效！因此，全体 $\nu^*$-可测集仅由平凡集类 $\{\varnothing,\mathbb N\}$ 构成。

**(c) 单调连续性的失效分析。**
- 考察递增列 $A_n=\{1,\ldots,n\}$：显然 $A_n\uparrow\mathbb N$。由于每个 $A_n$ 都是非空有限集，恒有 $\nu^*(A_n)=1$；然而极限集 $\mathbb N$ 是无限集，故
$$
\lim_{n\to\infty}\nu^*(A_n)=1\ne2=\nu^*(\mathbb N),
$$
这说明**一般外测度对递增集合列未必具有下连续性**。
- 考察递减列 $B_n=\{n,n+1,\ldots\}$：显然 $B_n\downarrow\varnothing$。由于每个 $B_n$ 都是无限集，首项外测度满足有限性条件 $\nu^*(B_1)=2<\infty$，且对一切 $n$ 均有 $\nu^*(B_n)=2$；然而极限集为空集，故
$$
\lim_{n\to\infty}\nu^*(B_n)=2\ne0=\nu^*(\varnothing),
$$
这说明**即使首项外测度有限，一般外测度对递减集合列也未必具有上连续性**。$\square$

**方法评注。** 在这一反例中，甚至连全空间的外测度 $\nu^*(\mathbb N)=2$ 都是有限的，因此上下连续性的双双失效与“无穷大”毫无关系，其根本原因在于：抽象外测度仅要求次可加性，而参与极限运算的集合 $A_n,B_n$ 均不是 $\nu^*$-可测集。

### 题3. 覆盖定义带来的性质

**(a) 验证 $m^*$ 是外测度。**
1. **空集取零**：空集 $\varnothing$ 可由空覆盖族覆盖，总长度为 $0$，故 $0\le m^*(\varnothing)\le0$，即 $m^*(\varnothing)=0$；
2. **单调性**：若 $E\subseteq F\subseteq\mathbb R$，则 $F$ 的任意一个可列有界开区间覆盖 $\{I_k\}$ 自动也是 $E$ 的一个可列有界开区间覆盖；在更大范围的覆盖族上取下确界不会使值增大，故 $m^*(E)\le m^*(F)$；
3. **可列次可加性**：设 $E=\bigcup_{j\ge1}E_j$。若 $\sum_{j\ge1} m^*(E_j)=\infty$，不等式自动成立。现设 $\sum_{j\ge1} m^*(E_j)<\infty$，从而每个 $m^*(E_j)<\infty$。任给 $\varepsilon>0$，由下确界的定义，对每个正整数 $j\ge1$，均可选出一列有界开区间覆盖 $\{I_{jk}\}_{k\ge1}$，使得
$$
E_j\subseteq\bigcup_{k\ge1} I_{jk},\qquad
\sum_{k\ge1}|I_{jk}|<m^*(E_j)+\varepsilon 2^{-j}.
$$
将双重可列族 $\{I_{jk}\}_{j,k\ge1}$ 合并重排为一个单重可列有界开区间族，它显然覆盖了并集 $E=\bigcup_{j\ge1}E_j$。由外测度的下确界定义及非负二重级数求和性质，可得：
$$
\begin{aligned}
m^*(E)&\le\sum_{j\ge1}\sum_{k\ge1}|I_{jk}|\\
&\le\sum_{j\ge1}\bigl(m^*(E_j)+\varepsilon 2^{-j}\bigr)=\sum_{j\ge1}m^*(E_j)+\varepsilon.
\end{aligned}
$$
由 $\varepsilon>0$ 的任意性，令 $\varepsilon\downarrow0$ 即证得 $m^*(E)\le\sum_{j\ge1}m^*(E_j)$。

**(b) 至多可列集的外测度为零。** 先考察单点集 $\{x\}$（$x\in\mathbb R$）：对任意 $\varepsilon>0$，单个有界开区间 $(x-\varepsilon/2,x+\varepsilon/2)$ 已覆盖 $\{x\}$，其长度为 $\varepsilon$，故 $0\le m^*(\{x\})\le\varepsilon$；令 $\varepsilon\downarrow0$ 即得 $m^*(\{x\})=0$。若子集 $E\subseteq\mathbb R$ 至多可列，将其写为单点集的至多可列并 $E=\bigcup_{k} \{x_k\}$，结合 (a) 的可列次可加性立即可得 $0\le m^*(E)\le\sum_k m^*(\{x_k\})=0$，即 $m^*(E)=0$。

**(c) 仿射变换下的伸缩与平移性质。** 设 $a\ne0$，$b\in\mathbb R$。考察仿射双射 $f(x)=ax+b$：它将任意一个有界开区间 $I_k=(u_k,v_k)$ 映射为另一个有界开区间 $f(I_k)$（当 $a>0$ 时为 $(au_k+b,av_k+b)$，当 $a<0$ 时为 $(av_k+b,au_k+b)$），且新开区间的长度恰为 $|f(I_k)|=|a|\,|I_k|$。因此，若 $\{I_k\}$ 是覆盖 $E$ 的有界开区间族（$E\subseteq\bigcup_k I_k$），则 $\{f(I_k)\}$ 就是覆盖 $aE+b=f(E)$ 的有界开区间族，且满足 $\sum_k|f(I_k)|=|a|\sum_k|I_k|$。对 $E$ 的一切有界开区间覆盖取下确界，立即可得：
$$
m^*(aE+b)\le|a|\,m^*(E).
$$
反之，将集合 $aE+b$ 在逆仿射变换 $f^{-1}(y)=a^{-1}y-a^{-1}b$ 下变回 $E=a^{-1}(aE+b)-a^{-1}b$，对非零系数 $a^{-1}$ 应用刚证得的不等式，便得到反向估计：
$$
m^*(E)\le|a|^{-1}m^*(aE+b).
$$
两端同乘正数 $|a|>0$，与前一不等式合并即得等式 $m^*(aE+b)=|a|\,m^*(E)$（当 $m^*(E)=\infty$ 时由 $|a|>0$ 知两端同为 $\infty$，等式依然成立）。$\square$

**方法评注。** 第 3 题揭示了 Lebesgue 外测度区别于一般抽象外测度的第一重特殊结构：它的定义直接建立在欧氏直线开区间的几何长度之上，因此天然继承了单点为零、平移不变（取 $a=1$）以及线性伸缩成比例等几何性质。

### 题4. 从外部寻找可测包络

**第一步：证明开集外逼近公式。** 任取子集 $E\subseteq\mathbb R$。一方面，若 $U$ 是包含 $E$ 的任意开集（$E\subseteq U$），由于开集 $U$ 是 Borel 集（从而是 Lebesgue 可测集），有 $m(U)=m^*(U)$，再由外测度的单调性可得 $m^*(E)\le m^*(U)=m(U)$。对一切包含 $E$ 的开集 $U$ 取下确界，即得一个方向的不等式：
$$
m^*(E)\le\inf\{m(U):E\subseteq U,\ U\text{ 开}\}.
$$
另一方面，若 $m^*(E)=\infty$，则上式右端也必为 $\infty$，等号已成立；若 $m^*(E)<\infty$，任给 $\varepsilon>0$，由 $m^*(E)$ 的定义可选取一列覆盖 $E$ 的有界开区间 $\{I_k\}_{k\ge1}$，使得 $\sum_{k\ge1}|I_k|<m^*(E)+\varepsilon$。令
$$
U=\bigcup_{k\ge1}I_k.
$$
由于任意多个开区间的并集仍是开集，故 $U$ 是包含 $E$ 的开集；再由外测度的可列次可加性及 $m^*(I_k)=|I_k|$，可得：
$$
\begin{aligned}
\inf\{m(V):E\subseteq V,\ V\text{ 开}\}
&\le m(U)=m^*(U)\\
&\le\sum_{k\ge1}m^*(I_k)=\sum_{k\ge1}|I_k|<m^*(E)+\varepsilon.
\end{aligned}
$$
令 $\varepsilon\downarrow0$，即证得 $\inf\{m(U):E\subseteq U,\ U\text{ 开}\}=m^*(E)$。

**第二步：构造等测的 $G_\delta$ 可测包络。** 若 $m^*(E)=\infty$，直接取开集 $G=\mathbb R$，它本身就是 $G_\delta$ 集且满足 $m(\mathbb R)=\infty=m^*(E)$。若 $m^*(E)<\infty$，根据第一步已证的开集逼近结论，对每一个正整数 $j\ge1$（取误差 $\varepsilon=2^{-j}$），均可选取一个包含 $E$ 的开集 $U_j\supseteq E$，使得
$$
m(U_j)<m^*(E)+2^{-j}.
$$
定义这列开集的可列交为：
$$
G=\bigcap_{j\ge1}U_j.
$$
根据定义，$G$ 是可列个开集的交集，即 **$G_\delta$ 集**（因而属于 Borel $\sigma$-代数，是 Lebesgue 可测集）。又因为对每个 $j\ge1$ 均有 $E\subseteq U_j$，故对一切 $j\ge1$ 恒有包含关系 $E\subseteq G\subseteq U_j$。由外测度的单调性可得：
$$
m^*(E)\le m^*(G)=m(G)\le m(U_j)<m^*(E)+2^{-j}\quad(\forall j\ge1).
$$
令 $j\to\infty$，由夹逼定理立即可得 $m(G)=m^*(E)$。$\square$

**方法评注。** 第 4 题构造出的 $G_\delta$ 集 $G\supseteq E$ 称为 $E$ 的**可测包络**（measurable cover）：无论原始子集 $E$ 本身是否可测，我们总能从外部用一个结构非常规则的 Borel 可测集 $G$ 将其包住，且不增加任何外测度（$m(G)=m^*(E)$）。需要特别警惕的是：当 $E$ 不可测时，绝不能由 $E\subseteq G$ 及 $m(G)=m^*(E)<\infty$ 推出差集满足 $m^*(G\setminus E)=m(G)-m^*(E)=0$！事实上，若 $m^*(G\setminus E)=0$，由第 1(a) 问将得出 $G\setminus E$ 可测，进而推出 $E=G\setminus(G\setminus E)$ 可测——这说明对于不可测集 $E$，其可测包络的差集 $G\setminus E$ 的外测度必定严格大于零。

### 题5. 任意递增集合列的下连续性

设 $E_n\uparrow E=\bigcup_{n\ge1} E_n$（不假设 $E_n$ 可测）。首先，由 $E_n\subseteq E_{n+1}\subseteq E$ 及外测度的单调性可知，非负扩展实数列 $\{m^*(E_n)\}_{n\ge1}$ 单调递增，因而存在极限 $L=\lim_{n\to\infty}m^*(E_n)\in[0,\infty]$，且对一切 $n$ 有 $m^*(E_n)\le m^*(E)$，故必有：
$$
L=\lim_{n\to\infty}m^*(E_n)\le m^*(E).
$$
若 $L=\infty$，则上式直接迫使 $m^*(E)=\infty=L$，等号已成立。以下不妨设 $L<\infty$，从而对每一个 $n\ge1$ 均有 $m^*(E_n)\le L<\infty$。

为了证明反向不等式 $m^*(E)\le L$，注意此时不能直接对 $\{E_n\}$ 引用测度的下连续性定理，因为各 $E_n$ 未必是可测集（第 2(c) 问的反例已经说明一般外测度对不可测递增列可以失去下连续性）。为此，我们利用第 4 问的可测包络工具进行转化：对每一个正整数 $n\ge1$，分别为 $E_n$ 选取一个 $G_\delta$ 可测包络 $G_n\supseteq E_n$，使得
$$
m(G_n)=m^*(E_n).
$$
由于每个 $G_n$ 是独立选取的，序列 $\{G_n\}$ 本身未必单调递增。为了构造单调递增的可测集列，按提示对 $\{G_k\}$ 取尾交，定义：
$$
H_n=\bigcap_{k\ge n}G_k\quad(n\ge1).
$$
我们来检验 $\{H_n\}$ 的三条关键性质：
1. **可测性与单调递增性**：作为可列个可测集 $G_k$ 的交，每个 $H_n$ 依然是 Lebesgue 可测集；且随着下标 $n$ 的增大，参与求交的集合减少，故 $H_n\subseteq H_{n+1}$，即 $\{H_n\}$ 是单调递增的可测集列；
2. **包络夹逼性**：当 $k\ge n$ 时，由 $\{E_k\}$ 单调递增有 $E_n\subseteq E_k\subseteq G_k$，对一切 $k\ge n$ 求交立即可得 $E_n\subseteq H_n$；同时取 $k=n$ 显然有 $H_n\subseteq G_n$。因此对每个 $n\ge1$ 均有夹逼包含关系
$$
E_n\subseteq H_n\subseteq G_n;
$$
3. **等外测度性**：对上述包含关系应用外测度的单调性，并结合 $m(G_n)=m^*(E_n)$，可得
$$
m^*(E_n)\le m(H_n)\le m(G_n)=m^*(E_n),
$$
故对每一个 $n\ge1$ 均有 $m(H_n)=m^*(E_n)$。

现在令 $H=\bigcup_{n\ge1} H_n$，则 $H$ 是可测集，且有 $H_n\uparrow H$；同时由 $E_n\subseteq H_n$ 两边对 $n$ 取并集可知 $E=\bigcup_{n\ge1} E_n\subseteq H$。于是，先利用外测度的单调性 $m^*(E)\le m^*(H)=m(H)$，再对**可测递增集列** $\{H_n\}$ 合法应用 Lebesgue 测度 $m$ 的下连续性，立即可得：
$$
m^*(E)\le m(H)=\lim_{n\to\infty} m(H_n)=\lim_{n\to\infty} m^*(E_n)=L.
$$
结合开篇已得的 $L\le m^*(E)$，即证得 $\lim_{n\to\infty}m^*(E_n)=m^*(E)$。$\square$

**方法评注。** 第 5 题的证明堪称可测包络工具的典范应用：虽然原始集合列 $\{E_n\}$ 不可测，但通过“逐项取可测包络 $G_n$ $\to$ 再取尾交 $H_n=\bigcap_{k\ge n}G_k$ 恢复单调递增性”，我们将问题转化到了真正的可测集列 $\{H_n\}$ 上，从而成功借用测度的下连续性完成了上界控制。这证明了 Lebesgue 外测度（以及一般的正则外测度）比抽象外测度拥有更强的分析性质——它对**任意**递增子集列都无条件满足下连续性。

### 题6. 距离为正时的可加性

**第一步：证明 Lebesgue 外测度满足正距离可加性。**
设非空子集 $A,B\subseteq\mathbb R$ 满足 $d=\operatorname{dist}(A,B)=\inf\{|x-y|:x\in A,\ y\in B\}>0$。我们围绕集合 $A$ 的每一点作半径为 $d/3$ 的开邻域，构造开集：
$$
U=\bigcup_{x\in A}\left(x-\frac{d}{3},x+\frac{d}{3}\right).
$$
作为任意族开区间的并集，$U$ 是 $\mathbb R$ 中的开集，因而是 Borel 集，更是 **Lebesgue 可测集**。同时，$U$ 具有如下两条分离性质：
- 对每个 $x\in A$，因 $x\in(x-d/3,x+d/3)\subseteq U$，故 $A\subseteq U$；
- 集合 $U$ 与 $B$ 互不相交（$U\cap B=\varnothing$）：事实上，若假设存在某点 $y\in U\cap B$，则由 $y\in U$ 知存在某点 $x\in A$ 使得 $|x-y|<d/3$；但 $x\in A,y\in B$ 蕴含 $|x-y|\ge\operatorname{dist}(A,B)=d>d/3$，矛盾！

既然开集 $U$ 是 Lebesgue 可测集（即 $m^*$-可测集），根据 Carathéodory 可测性的定义，我们可以用 $U$ 去切分测试集 $T=A\cup B$。由 $A\subseteq U$ 与 $U\cap B=\varnothing$ 立即可知：
$$
T\cap U=(A\cup B)\cap U=A,\qquad T\setminus U=(A\cup B)\setminus U=B.
$$
代入 $U$ 的 Carathéodory 切分等式 $m^*(T)=m^*(T\cap U)+m^*(T\setminus U)$，立即得到
$$
m^*(A\cup B)=m^*(A)+m^*(B).
$$
注意这一证明既不需要假设 $A,B$ 可测，也不需要假设它们的外测度有限。

**第二步：说明正距离可加性不是一般外测度公理的推论。**
回到第 2 问的自然数空间 $X=\mathbb N$，为其配备标准欧氏度量 $\rho(x,y)=|x-y|$。取两个单点集 $A=\{1\}$ 与 $B=\{2\}$，则它们之间的距离为
$$
\operatorname{dist}(A,B)=|1-2|=1>0.
$$
然而，对于第 2 问定义的外测度 $\nu^*$，由于 $A,B$ 与 $A\cup B=\{1,2\}$ 均为非空有限集，计算可得：
$$
\nu^*(A\cup B)=1<1+1=2=\nu^*(A)+\nu^*(B).
$$
这说明在度量空间上，“距离严格为正的两个集合外测度可加”（即 Carathéodory 度量外测度性质）是与拓扑/Borel 可测性紧密相连的特殊性质，无法仅从抽象外测度公理推出。$\square$

**方法评注。** 本题揭示了 Carathéodory 定理中“测试集 $T$ 的任意性”的强大威力：尽管 $A$ 与 $B$ 本身可能都是不可测集，但只要能找到一个把它们隔开的**可测集** $U$（当 $\operatorname{dist}(A,B)>0$ 时取 $A$ 的开邻域即可），就能将 $A\cup B$ 作为测试集 $T$ 送入 $U$ 的可测性切分等式中，从而直接获得 $m^*(A\cup B)=m^*(A)+m^*(B)$。注意到 $\operatorname{dist}(A,B)>0$ 是存在不交开集分隔 $A,B$ 的**充分条件**；反之，当 $\operatorname{dist}(A,B)=0$ 时，不再必然保证存在不交开集将二者分离（尽管某些距离为零的不交集合如相邻开区间 $(0,1)$ 与 $(1,2)$ 仍可被不交开集分离且保持可加性，但一旦两个不交集合在全区间上彼此稠密交织而无法用可测开集或可测包络分离，外测度可加性就可能彻底失效——这正是下面第三部分将要展示的现象）。

### 题7. 重新使用开篇的 Vitali 集

**(a) 证明 $\{V_k\}_{k\ge1}$ 两两不交。**
设存在某点 $x\in V_i\cap V_j$，则存在代表元 $v,w\in V$ 使得 $x=v+q_i=w+q_j$。移项得 $v-w=q_j-q_i\in\mathbb Q$，故 $v\sim w$，即 $v$ 与 $w$ 属于同一个等价类。由于代表集 $V$ 在每个等价类中仅选取唯一一个代表元，必有 $v=w$，进而 $q_i=q_j$；再由枚举序列 $\{q_k\}$ 无重复可知 $i=j$。因此 $\{V_k\}_{k\ge1}$ 两两不交。

**(b) 证明双向包含 $[0,1]\subseteq\bigcup_{k\ge1}V_k\subseteq[-1,2]$。**
- 左包含：任取 $x\in[0,1]$，设其所在等价类在 $V$ 中的唯一代表元为 $v\in V\subseteq[0,1]$，则 $x\sim v$，即 $x-v\in\mathbb Q$；又因 $0\le x\le 1$ 且 $0\le v\le 1$，有 $-1\le x-v\le 1$，故 $x-v\in\mathbb Q\cap[-1,1]$。于是必存在某个正整数 $k\ge1$ 使得 $x-v=q_k$，从而 $x=v+q_k\in V_k\subseteq\bigcup_{k\ge1}V_k$。
- 右包含：对任意 $k\ge1$ 及 $x=v+q_k\in V_k$，由 $v\in[0,1]$ 与 $q_k\in[-1,1]$ 立即可知 $-1=0+(-1)\le v+q_k\le 1+1=2$，故 $\bigcup_{k\ge1}V_k\subseteq[-1,2]$。

**(c) 证明 $0<c=m^*(V)\le1$ 且 $m^*(V_k)=c$。**
首先，由 $V\subseteq[0,1]$ 及外测度的非负性与单调性，有
$$
0\le c=m^*(V)\le m^*([0,1])=1.
$$
其次，由第 3(c) 问已证的 Lebesgue 外测度平移不变性（取 $a=1,b=q_k$），对每一个 $k\ge1$ 均有
$$
m^*(V_k)=m^*(V+q_k)=m^*(V)=c.
$$
最后用反证法证明 $c>0$：若假设 $c=0$，则对每个 $k\ge1$ 均有 $m^*(V_k)=0$；对 (b) 中的左包含关系 $[0,1]\subseteq\bigcup_{k\ge1}V_k$ 应用外测度的单调性与**可列次可加性**（注意此处仅使用对一切子集均成立的次可加性，完全无需假设 $V_k$ 可测），可得：
$$
\begin{aligned}
1&=m^*([0,1])\\
&\le m^*\left(\bigcup_{k\ge1}V_k\right)\\
&\le\sum_{k\ge1}m^*(V_k)=\sum_{k\ge1}0=0,
\end{aligned}
$$
导出 $1\le0$ 的矛盾！因此必有 $0<c\le1$。$\square$

**方法评注。** 在正文 §1.2 中，我们是通过假设 $V$ 可测导出矛盾；而在本题第 7(c) 问中，我们直接在幂集上对不可测的 Vitali 集 $V$ 计算 Lebesgue 外测度 $m^*(V)$，仅利用单调性、平移不变性与可列次可加性，就严格证明了 $V$ 具有严格为正的有限外测度 $c\in(0,1]$。

### 题8. 两种失败

**(a) 存在有界且互不相交的子集 $A,B$ 使得 $m^*(A\cup B)<m^*(A)+m^*(B)$。**
考察前 $n$ 项平移集构成的有限部分并序列 $F_n=\bigcup_{j=1}^n V_j$（$n\ge1$）。由第 7(b) 问知每个 $F_n\subseteq[-1,2]$，故 $F_n$ 是有界集，且由外测度单调性有上界估计：
$$
m^*(F_n)\le m^*([-1,2])=3\quad(\forall n\ge1).
$$
另一方面，由第 7(c) 问已知 $c=m^*(V_j)>0$。根据实数的阿基米德性质，可选取一个充分大的正整数 $N\ge2$，使得
$$
Nc>3.
$$
现在考察从 $k=2$ 到 $k=N$ 的递推关系：由于 $F_k=F_{k-1}\cup V_k$，由外测度的次可加性，对每个 $2\le k\le N$ 均有
$$
m^*(F_k)\le m^*(F_{k-1})+m^*(V_k)=m^*(F_{k-1})+c.
$$
如果这 $N-1$ 个不等式（$k=2,3,\ldots,N$）**全部取等号**，则由首项 $m^*(F_1)=m^*(V_1)=c$ 逐次累加递推，必将得出
$$
m^*(F_N)=Nc>3,
$$
这与前面已证的上界 $m^*(F_N)\le3$ 矛盾！因此，在 $2\le k\le N$ 之中，**至少存在某一个下标 $k$**，使得上述不等式严格成立：
$$
m^*(F_k)<m^*(F_{k-1})+m^*(V_k).
$$
针对这一下标 $k$，令
$$
A=F_{k-1}=\bigcup_{j=1}^{k-1}V_j,\qquad B=V_k.
$$
由于 $\{V_j\}_{j\ge1}$ 两两不交，显然 $A\cap B=\varnothing$；同时 $A,B\subseteq[-1,2]$ 均为有界子集，且它们的并集 $A\cup B=F_k$ 满足
$$
m^*(A\cup B)<m^*(A)+m^*(B).
$$
这就具体构造出了使 Lebesgue 外测度严格次可加的一对有界不交子集。

**(b) 存在首项外测度有限但失去上连续性的递减有界集合列。**
考察尾并序列 $D_n=\bigcup_{k\ge n}V_k$（$n\ge1$）。首先证明 $D_n\downarrow\varnothing$：显然 $D_{n+1}\subseteq D_n$，序列单调递减；任取一点 $x\in\mathbb R$，若 $x\notin D_1$，则对一切 $n\ge1$ 均有 $x\notin D_n$；若 $x\in D_1=\bigcup_{k\ge1}V_k$，则由第 7(a) 问中 $\{V_k\}$ 两两不交可知，该点 $x$ 只能属于**唯一**的某一个集合 $V_{k_0}$，从而当 $n>k_0$ 时必有 $x\notin\bigcup_{k\ge n}V_k=D_n$。因此没有任何点能留在全部 $D_n$ 之中，即 $\bigcap_{n\ge1}D_n=\varnothing$，故 $D_n\downarrow\varnothing$。

其次计算 $m^*(D_n)$ 的范围与极限：由于对每个 $n\ge1$ 均有包含关系 $V_n\subseteq D_n\subseteq[-1,2]$，由外测度的单调性及 $m^*(V_n)=c>0$ 可得
$$
0<c\le m^*(D_n)\le m^*([-1,2])=3\quad(\forall n\ge1).
$$
特别地，首项满足有限性条件 $m^*(D_1)\le3<\infty$；同时，单调递减数列 $\{m^*(D_n)\}_{n\ge1}$ 有正的下界 $c>0$，故其极限存在且满足：
$$
\lim_{n\to\infty}m^*(D_n)\ge c>0=m^*(\varnothing).
$$
这证明了：即便集合列全部有界（从而首项外测度有限）且单调递减趋于空集，Lebesgue 外测度 $m^*$ 依然不必具有上连续性！这表明：若要**调用测度的从上连续性定理**来保证对任意首项有限的递减集列恒有 $\lim_n m^*(D_n)=m^*\bigl(\bigcap_n D_n\bigr)$，除了 $m^*(D_1)<\infty$ 之外，**还必须要求集合列中的各项 $D_n$（或自某项起）是 Lebesgue 可测集**（尽管对某些特殊构造的不可测递减序列该等式仍可能偶然成立，但缺乏可测性假设时上连续性定理不再普遍成立）。$\square$

**方法评注：为什么第 5 问的可测包络法不能搬到递减情形？**
对比第 5 问与第 8(b) 问，可以深刻理解递增下连续性与递减上连续性的不对称性：在第 5 问的递增情形 $E_n\uparrow E$ 中，由于 $E_n\subseteq H_n$，取并集后包络的极限集 $H=\bigcup_n H_n$ 自动包含原极限集 $E=\bigcup_n E_n$，从而由 $m^*(E)\le m(H)=\lim_n m^*(E_n)$ 锁死了困难方向的不等式；然而在第 8(b) 问的递减情形 $D_n\downarrow\varnothing$ 中，如果为每个不可测的 $D_n$ 选取可测包络 $G_n\supseteq D_n$（通过取前 $n$ 项交可使 $G_n$ 递减），虽然在可测集列 $G_n$ 上有 $m\bigl(\bigcap_n G_n\bigr)=\lim_n m(G_n)=\lim_n m^*(D_n)\ge c>0$，但由于每个包络 $G_n$ 都比 $D_n$ 严格多出一块不可忽略的点集，即使原始交集 $\bigcap_n D_n=\varnothing$，其包络的交集 $\bigcap_n G_n$ 却依然是一个测度至少为 $c>0$ 的非空集合，無法压向 $m^*(\varnothing)=0$。

## 性质对照总结

下表系统汇总了本专题所证明的各项结论，清晰展示了“抽象外测度公理”、“幂集上的 Lebesgue 外测度 $m^*$”与“限制在可测集类上的 Lebesgue 测度 $m$”三者之间的性质边界（表中“可测”均指相应外测度的 Carathéodory 可测性）：

| 分析与几何性质 | 一般抽象外测度 $\mu^*$（仅靠公理） | 幂集上的 Lebesgue 外测度 $m^*$ | 可测集上的 Lebesgue 测度 $m$ |
|---|---|---|---|
| 空集为零、单调性、可列次可加性 | 成立 | 成立 | 成立 |
| 零外测度集的一切子集均可测（完备性） | 成立 | 成立 | 成立 |
| 任意至多可列集的外测度为零 | 不保证（反例见题2） | 成立（题3b） | 成立 |
| 任意距离为正的两集合可加 | 不保证（反例见题6） | 成立（题6） | 成立 |
| 每个子集存在等外测度的可测包络 | 不保证 | 成立，且可取 $G_\delta$ 包络（题4） | 自身即可测 |
| 任意单调递增集合列下连续 | 不保证（反例见题2c） | 成立（无需可测，题5） | 成立 |
| 首项有限的单调递减集合列上连续 | 不保证（反例见题2c） | 不保证（反例见题8b） | **成立**（可测性消除病态） |
| 任意两两不交集合（及可列不交族）可加 | 不保证（反例见题2b） | 不保证（反例见题8a） | **成立**（可列可加性） |

通过上表可以一目了然地看到：从一般外测度到 Lebesgue 外测度，开区间覆盖的具体几何定义带来了“单点为零、正距离可加、存在 $G_\delta$ 可测包络以及任意递增列下连续”四大优良性质；而从幂集上的 Lebesgue 外测度 $m^*$ 收缩到 Carathéodory 可测集类 $\mathcal L(\mathbb R)$ 上的 Lebesgue 测度 $m$，则最终补齐了“任意不交可列可加”与“有限测度控制下的递减上连续性”这两块关键拼图。

## 来源与说明

本专题综合题结合课程第一篇《集类与测度》的教学重难点设计编写。其中第三部分关于 Vitali 集的性质推导参考了袁德美、王学军《测度论基础与高等概率论》（上册）第四章例 4.50（印刷第 108–109 页），第一部分第 2 问的三值有限外测度模型及全篇三阶段递进设问结构为课程教学自编。

## 相关链接

- [[00_讲义总览|概率论学业辅导讲义总览]]
- [[02_第一篇_集类与测度|第一篇：集类与测度]]
