---
title: "Radon–Nikodym 定理的 Hilbert 空间证明"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-riesz-variational
  - theory-note
note_type: applications
source_section: "F/9 第 28–31 页"
exercise_range: "2.2 节的方法补充"
status: "已补证"
---

# Radon–Nikodym 定理的 Hilbert 空间证明

测度论中的 **Radon–Nikodym 定理** 指出：若 $\sigma$-有限测度 $\nu$ 关于 $\sigma$-有限测度 $\mu$ 绝对连续（记作 $\nu\ll\mu$，即对任意可测集 $E$，凡 $\mu(E)=0$ 必有 $\nu(E)=0$），则 $\nu$ 可以表示为关于 $\mu$ 的不定积分 $\nu(E)=\int_E g\,d\mu$。1940 年，冯·诺依曼（J. von Neumann）提出了一种极具创造性的泛函分析证法：**通过构造合成测度 $\lambda=\mu+\nu$，在 Hilbert 空间 $L^2(\lambda)$ 上对线性泛函 $u\mapsto\int_\Omega u\,d\mu$ 应用 Riesz 表示定理得到表示元 $v$，再经由有界逼近与代数变换 $g=\frac{1-v}{v}$ 直接还原出密度函数 $g=\frac{d\nu}{d\mu}$。**

> [!note] 定理 1.1 Radon–Nikodym 定理（非负 $\sigma$-有限测度版本）
> 设 $(\Omega,\Sigma)$ 是可测空间，$\mu$ 与 $\nu$ 是 $(\Omega,\Sigma)$ 上的两个 $\sigma$-有限非负测度。若 $\nu\ll\mu$，则存在非负可测函数 $g:\Omega\to[0,\infty)$，使得对每一个可测集 $E\in\Sigma$ 恒有
> $$
> \nu(E)=\int_E g\,d\mu.
> $$
> 此外，密度函数 $g$ 在 $\mu$-几乎处处相等的意义下是唯一的（称为 $\nu$ 关于 $\mu$ 的 **Radon–Nikodym 导数**，记作 $g=\frac{d\nu}{d\mu}$）。

下面分五个步骤完整展示这一证明。

## 1. 有限测度情形：在 $L^2(\mu+\nu)$ 上应用 Riesz 表示定理

首先假设 $\mu(\Omega)<\infty$ 且 $\nu(\Omega)<\infty$。定义合成有限测度
$$
\lambda=\mu+\nu,
$$
并考察实 Hilbert 空间 $H=L^2(\Omega,\lambda)$。在 $H$ 上定义线性泛函：
$$
\ell(u)=\int_\Omega u\,d\mu\qquad\bigl(u\in L^2(\lambda)\bigr).
$$
1. **良定义性与有界性验证：** 由于 $0\leq\mu\leq\lambda$，凡是 $\lambda$-零测集必然是 $\mu$-零测集，故 $\ell(u)$ 在 $L^2(\lambda)$ 的等价类上良定义。对任意 $u\in L^2(\lambda)$，由关于测度 $\mu$ 的 Cauchy-Schwarz 不等式以及 $\mu\leq\lambda$ 的积分单调性，可得
   $$
   |\ell(u)|\leq\int_\Omega |u|\cdot 1\,d\mu\leq\mu(\Omega)^{1/2}\left(\int_\Omega |u|^2\,d\mu\right)^{1/2}\leq\mu(\Omega)^{1/2}\left(\int_\Omega |u|^2\,d\lambda\right)^{1/2}=\mu(\Omega)^{1/2}\|u\|_{L^2(\lambda)}.
   $$
2. **获取表示元 $v$：** 上式表明 $\ell\in\bigl(L^2(\lambda)\bigr)^*$ 是连续线性泛函。由 [[01_Riesz表示定理|Riesz 表示定理（定理 1.1）]]，存在唯一的函数 $v\in L^2(\lambda)$，使得对一切 $u\in L^2(\lambda)$ 恒有 $\ell(u)=(u,v)_{L^2(\lambda)}$，展开即得基本积分方程：
   $$
   \int_\Omega u\,d\mu=\int_\Omega uv\,d\lambda=\int_\Omega uv\,d\mu+\int_\Omega uv\,d\nu\qquad\bigl(\forall u\in L^2(\lambda)\bigr).
   \tag{1}
   $$

## 2. 利用特征函数测试与绝对连续性证明 $0<v\leq 1$（$\lambda$-a.e.）

因为 $\lambda(\Omega)<\infty$，任意可测集 $E\in\Sigma$ 的特征函数 $\mathbf 1_E$ 都属于 $L^2(\lambda)$。将 $u=\mathbf 1_E$ 代入式 (1)，可得
$$
\int_E v\,d\lambda=\mu(E)\qquad(\forall E\in\Sigma).
\tag{2}
$$
1. **证明 $0\leq v\leq 1$（$\lambda$-a.e.）：**
   - 对每个正整数 $n\in\mathbb N$，取可测集 $E_n=\bigl\{\omega\in\Omega:v(\omega)\leq -\frac{1}{n}\bigr\}$。由式 (2) 及 $\mu(E_n)\geq 0$ 可得
     $$
     0\leq\mu(E_n)=\int_{E_n}v\,d\lambda\leq-\frac{1}{n}\lambda(E_n)\leq 0,
     $$
     故 $\lambda(E_n)=0$。对 $n\in\mathbb N$ 取可数并，即知 $\lambda(\{v<0\})=0$，即 $v\geq 0$（$\lambda$-a.e.）。
   - 同理，取 $F_n=\bigl\{\omega\in\Omega:v(\omega)\geq 1+\frac{1}{n}\bigr\}$，由式 (2) 及 $\mu(F_n)\leq\lambda(F_n)<\infty$ 可得
     $$
     \lambda(F_n)\geq\mu(F_n)=\int_{F_n}v\,d\lambda\geq\left(1+\frac{1}{n}\right)\lambda(F_n),
     $$
     移项得 $\frac{1}{n}\lambda(F_n)\leq 0$，故 $\lambda(F_n)=0$。取可数并即得 $\lambda(\{v>1\})=0$。
2. **利用绝对连续性 $\nu\ll\mu$ 证明 $\lambda(\{v=0\})=0$：**
   令零点集为 $Z=\{\omega\in\Omega:v(\omega)=0\}\in\Sigma$。将 $E=Z$ 代入式 (2)，立得
   $$
   \mu(Z)=\int_Z 0\,d\lambda=0.
   $$
   现在关键性地调用假设 **$\nu\ll\mu$**：既然 $\mu(Z)=0$，就必然有 **$\nu(Z)=0$**！从而合成测度亦满足
   $$
   \lambda(Z)=\mu(Z)+\nu(Z)=0+0=0.
   $$
   因此，在修改一个 $\lambda$-零测集上的取值后，可使 $v$ 在全空间上满足 $0<v(\omega)\leq 1$，从而可以良定义非负可测函数：
   $$
   g(\omega)=\frac{1-v(\omega)}{v(\omega)}\geq 0\qquad(\omega\in\Omega\setminus Z),\qquad g(\omega)=0\quad(\omega\in Z).
   $$

## 3. 截断正则化测试与单调收敛定理导出密度公式

对式 (1) 移项整理，可知对一切 $u\in L^2(\lambda)$ 有
$$
\int_\Omega u(1-v)\,d\mu=\int_\Omega uv\,d\nu.
\tag{3}
$$
从形式上看，如果能把 $u=\frac{\mathbf 1_E}{v}$ 代入式 (3)，左端就会变成 $\int_E\frac{1-v}{v}\,d\mu=\int_E g\,d\mu$，右端就会变成 $\int_E 1\,d\nu=\nu(E)$。然而，由于 $v$ 虽然大于零却可以无限接近于 $0$，函数 $\frac{\mathbf 1_E}{v}$ 未必有界、也未必属于 $L^2(\lambda)$，不能直接代入式 (3)！

为了严密实现这一代换，我们对任意可测集 $E\in\Sigma$ 及正整数 $n\in\mathbb N$，构造分母加了正下界 $\frac{1}{n}$ 的有界测试函数：
$$
u_n=\frac{\mathbf 1_E}{v+1/n}.
$$
由于 $0\leq v\leq 1$，显然有 $0\leq u_n\leq n\mathbf 1_E$；在有限测度空间 $(\Omega,\lambda)$ 上，有界可测函数必属于 $L^2(\lambda)$！将合法的 $u_n\in L^2(\lambda)$ 代入式 (3)，得
$$
\int_E\frac{1-v}{v+1/n}\,d\mu=\int_E\frac{v}{v+1/n}\,d\nu\qquad(\forall n\in\mathbb N).
$$
现在考察当 $n\to\infty$ 时左右两端被积函数的极限行为：
- 在左端，由于在 $\Omega\setminus Z$ 上 $0<v\leq 1$，非负被积函数列 $\frac{1-v}{v+1/n}$ 关于 $n$ **单调递增**，且逐点收敛于 $g=\frac{1-v}{v}$；
- 在右端，非负被积函数列 $\frac{v}{v+1/n}$ 关于 $n$ 同样**单调递增**，且在 $\Omega\setminus Z$ 上（即 $\nu$-几乎处处，因为 $\nu(Z)=0$）逐点收敛于常数 $1$。

对上式左右两端同时应用 **Lebesgue 单调收敛定理**，立即得到
$$
\int_E g\,d\mu=\int_E 1\,d\nu=\nu(E)\qquad(\forall E\in\Sigma).
$$
这便完成了有限测度情形下存在性的严格证明。

## 4. 利用共同可数分块推广至 $\sigma$-有限测度情形

现设 $\mu$ 与 $\nu$ 均为 $\sigma$-有限非负测度。按定义，存在可数覆盖 $\Omega=\bigcup_{i=1}^\infty A_i$ 使 $\mu(A_i)<\infty$，以及可数覆盖 $\Omega=\bigcup_{j=1}^\infty B_j$ 使 $\nu(B_j)<\infty$。

取全体两两交集构成的族 $\{A_i\cap B_j\}_{i,j=1}^\infty$，将其按可数序列重新排列为 $\{C_k\}_{k=1}^\infty$，并作不交化处理：令 $E_1=C_1,\ E_k=C_k\setminus\bigcup_{m=1}^{k-1}C_m$（$k\geq 2$）。则 $\{E_k\}_{k=1}^\infty$ 是两两不相交的可测集序列，满足
$$
\Omega=\bigsqcup_{k=1}^\infty E_k,\qquad \text{且对每个 }k\geq 1\text{ 同时有 }\mu(E_k)<\infty,\ \nu(E_k)<\infty!
$$
在每一个子集 $E_k$ 上，限制测度 $\mu|_{E_k}$ 与 $\nu|_{E_k}$ 均为有限测度且保持 $\nu|_{E_k}\ll\mu|_{E_k}$。由第 1–3 节已证的有限测度结论，在每块 $E_k$ 上存在非负可测函数 $g_k:E_k\to[0,\infty)$，使得对一切可测集 $E\in\Sigma$ 有 $\nu(E\cap E_k)=\int_{E\cap E_k}g_k\,d\mu$。将它们拼接为全空间上的非负可测函数 $g=\sum_{k=1}^\infty g_k\mathbf 1_{E_k}$，由非负可测函数积分的可数可加性（单调收敛定理）即得：
$$
\int_E g\,d\mu=\sum_{k=1}^\infty\int_{E\cap E_k}g_k\,d\mu=\sum_{k=1}^\infty\nu(E\cap E_k)=\nu(E)\qquad(\forall E\in\Sigma).
$$

## 5. 密度函数的唯一性与 $\sigma$-有限性假设的边界

1. **唯一性证明：** 设非负可测函数 $g,h$ 均满足对一切 $E\in\Sigma$ 有 $\int_E g\,d\mu=\nu(E)=\int_E h\,d\mu$。在第 4 节构造的每个有限测度分块 $E_k$ 内，对任意 $n\in\mathbb N$ 考察可测集
   $$
   D_{k,n}=\left\{\omega\in E_k:g(\omega)\geq h(\omega)+\frac{1}{n},\ h(\omega)\leq n\right\}.
   $$
   由于在 $D_{k,n}$ 上 $h\leq n$ 且 $\mu(E_k)<\infty$，积分 $\int_{D_{k,n}}h\,d\mu\leq n\mu(E_k)<\infty$ 是有限实数，故可合法移项相减：
   $$
   0=\int_{D_{k,n}}g\,d\mu-\int_{D_{k,n}}h\,d\mu=\int_{D_{k,n}}(g-h)\,d\mu\geq\frac{1}{n}\mu(D_{k,n})\geq 0,
   $$
   从而 $\mu(D_{k,n})=0$。对 $n,k\in\mathbb N$ 取可数并（注意到 $\nu(E_k)<\infty\implies h<\infty\ \mu$-a.e. 于 $E_k$），即得 $\mu(\{g>h\})=0$；将 $g,h$ 互换同理得 $\mu(\{h>g\})=0$，故 $g=h$（$\mu$-a.e.）。$\square$

2. **反例：$\sigma$-有限性假设不可省去：**
   在闭区间 $\Omega=[0,1]$ 的 Borel $\sigma$-代数上，令 $\mu$ 为**计数测度**（即有限集测度为其元素个数，无限集测度为 $+\infty$），令 $\nu$ 为标准的 **Lebesgue 测度**。
   - 由于唯一满足 $\mu(E)=0$ 的集合只有空集 $E=\varnothing$，而 $\nu(\varnothing)=0$，故**绝对连续性 $\nu\ll\mu$ 严格成立**！
   - 然而，**不存在**任何可测函数 $g:[0,1]\to[0,\infty]$ 使得对一切 Borel 集 $E$ 有 $\nu(E)=\int_E g\,d\mu$：倘若存在这样的 $g$，则对每一个单点集 $E=\{x\}$（$x\in[0,1]$）测试，可得
     $$
     g(x)=\int_{\{x\}}g\,d\mu=\nu(\{x\})=0\qquad(\forall x\in[0,1]),
     $$
     即 $g\equiv 0$；但代回全区间 $E=[0,1]$ 却得出 $1=\nu([0,1])=\int_{[0,1]}0\,d\mu=0$，矛盾！此处定理失效的唯一原因正是计数测度 $\mu$ 在不可数集 $[0,1]$ 上**不是 $\sigma$-有限测度**。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_Riesz表示定理|表示定理]]
- [[泛函分析/04_赋范空间与Banach空间/02_典型Banach空间与完备性|$L^2$ 完备性]]
- [[泛函分析/01_资料索引与编写约定|资料与构造路线]]
- [[泛函分析讲义上册习题册#2.2 Hilbert 空间中的投影与核|原书 2.2 节]]

## 跨主题参照

- [[高等概率论/笔记/01_上册_测度论基础/08_符号测度与Radon-Nikodym定理#8.2.2 Radon–Nikodym 定理|符号测度与Radon-Nikodym定理]]：对照概率论与测度论中结合 Hahn-Jordan 分解证明一般符号测度 Radon-Nikodym 定理及条件数学期望的标准路线。
