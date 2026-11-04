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

本篇保持解读讲义的构造路线：在 $L^2(\mu+\nu)$ 上表示“对 $\mu$ 积分”的泛函，得到 $v$，再由 $g=(1-v)/v$ 构造 $\nu$ 相对于 $\mu$ 的密度。基础工具为 $L^2$ 完备性、Riesz 表示、单调收敛和指标函数测试。

> [!note] 定理（非负、$\sigma$-有限版本）
> 若 $\mu,\nu$ 为同一可测空间上的 $\sigma$-有限非负测度，且 $\nu\ll\mu$，则存在非负可测 $g$，使
> $$
> \nu(E)=\int_Eg\,d\mu
> $$
> 对每个可测集 $E$ 成立。$g$ 在 $\mu$ 几乎处处意义下唯一。

## 1. 先处理两测度都有限

令 $\lambda=\mu+\nu$，取实 Hilbert 空间 $H=L^2(\lambda)$。定义
$$
\ell(u)=\int u\,d\mu.
$$
先核验合法性与有界性：$\mu\leq\lambda$，故同一 $\lambda$ 等价类给同一积分，且
$$
|\ell(u)|\leq\mu(\Omega)^{1/2}
\left(\int |u|^2\,d\mu\right)^{1/2}
\leq\mu(\Omega)^{1/2}\|u\|_{L^2(\lambda)}.
$$
Riesz 给出 $v\in L^2(\lambda)$，满足
$$
\int u\,d\mu=\int uv\,d\lambda
=\int uv\,d\mu+\int uv\,d\nu\qquad(u\in H).
\tag{1}
$$

## 2. 再说明 $0\leq v\leq1$

取 $u=\mathbf1_E$ 合法，因为 $\lambda$ 有限。若集合 $\{v\leq-1/n\}$ 有正 $\lambda$ 测度，式 (1) 右边为负，左边非负，矛盾。取可数并，得 $v\geq0$ 几乎处处。

又有 $\int_Ev\,d\lambda=\mu(E)\leq\lambda(E)$。对 $E=\{v\geq1+1/n\}$ 测试，得 $v\leq1$ 几乎处处。

令 $Z=\{v=0\}$。式 (1) 给 $\mu(Z)=0$；绝对连续性再给 $\nu(Z)=0$，所以 $\lambda(Z)=0$。这一转移正是 $\nu\ll\mu$ 在证明中的关键使用处。

因此可在 $Z$ 外定义 $g=(1-v)/v\geq0$，在零测集上定义为 0。

## 3. 用合法测试函数得到密度等式

不能直接把 $\mathbf1_E/v$ 填进 $L^2(\lambda)$，因为 $v$ 可能接近零。先取有界函数
$$
u_n=\frac{\mathbf1_E}{v+1/n}\in L^2(\lambda).
$$
代入 (1) 并移项，得到
$$
\int_E\frac{1-v}{v+1/n}\,d\mu
=\int_E\frac{v}{v+1/n}\,d\nu.
$$
左右被积函数都随 $n$ 单调增加。左边趋于 $g$，右边在 $\nu$ 几乎处处趋于 1。单调收敛给出
$$
\int_Eg\,d\mu=\nu(E).
$$
这补全了“表示元产生密度”的逻辑链，并避免不合法的除零或平方可积假设。$\square$

## 4. 两测度共同的有限分块

对 $\sigma$-有限情形，分别取 $\mu$ 有限的可数覆盖 $\{A_i\}$ 和 $\nu$ 有限的可数覆盖 $\{B_j\}$。交集 $A_i\cap B_j$ 构成共同覆盖；枚举后逐项减去之前的集合，得到互不相交可测分块 $E_k$，且
$$
\Omega=\bigcup_kE_k,\qquad \mu(E_k),\nu(E_k)<\infty.
$$
在每块上应用有限版本得 $g_k$，定义 $g=g_k$ 于 $E_k$。由非负积分的可数可加性，
$$
\int_Eg\,d\mu
=\sum_k\int_{E\cap E_k}g_k\,d\mu
=\sum_k\nu(E\cap E_k)=\nu(E).
$$
只对一种测度取有限分块，不保证另一种也有限，不能跳过共同覆盖步骤。

## 5. 唯一性与假设边界

若 $g,h$ 都是密度，在共同有限分块内，对 $\{g\geq h+1/n\}$ 测试，积分等式与 $\mu$ 测度正性矛盾；再交换 $g,h$ 并取可数并，得到 $g=h$ 几乎处处。有限分块确保相关积分可比较，不直接作 $\infty-\infty$。

$\sigma$-有限不是装饰条件。取 $[0,1]$ 上的计数测度 $\mu$ 与 Lebesgue 测度 $\nu$，则 $\nu\ll\mu$，因为唯一的 $\mu$ 零测集是空集。若 $\nu=g\mu$，对每个单点测试都得 $g(x)=0$，于是整个区间的积分为 0，与 $\nu([0,1])=1$ 矛盾。这里计数测度不是 $\sigma$-有限。

本篇不把有符号、复测度版本写成已经证明；那些版本还需 Jordan 分解或变差测度等前置工具。

## 相关链接

- [[00_专题总览|专题总览]]
- [[01_Riesz表示定理|表示定理]]
- [[泛函分析/04_赋范空间与Banach空间/02_典型Banach空间与完备性|$L^2$ 完备性]]
- [[泛函分析/01_资料索引与编写约定|资料与构造路线]]
- [[泛函分析讲义上册习题册#2.2 Hilbert 空间中的投影与核|原书 2.2 节]]

## 跨主题参照

- [[高等概率论/笔记/01_上册_测度论基础/08_符号测度与Radon-Nikodym定理#8.2.2 Radon–Nikodym 定理|符号测度与Radon-Nikodym定理]]。对照概率论中的符号测度、绝对连续性和密度公式。
