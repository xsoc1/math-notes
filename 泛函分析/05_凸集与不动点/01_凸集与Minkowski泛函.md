---
title: "凸集与 Minkowski 泛函"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-convex-fixed-point
  - theory-note
note_type: theory
source_section: "F/5 的凸集与 Minkowski 泛函部分"
exercise_range: "1.5 节"
status: "已补证"
---

# 凸集与 Minkowski 泛函

## 1. 凸性、平衡性与吸收性

在线性空间 $X$ 中，凸性刻画了“连接集合内任意两点的线段仍完全落在该集合内”的几何特征；结合标量数乘运算，还可以定义平衡性与吸收性。

> [!note] 定义 1.1 凸集、平衡集与吸收集
> 设 $X$ 是数域 $\mathbb K$ 上的线性空间，$C\subseteq X$。
> - **凸集（Convex Set）：** 对任意 $x,y\in C$ 及 $0\leq t\leq1$，恒有 $(1-t)x+ty\in C$。
> - **平衡集（Balanced Set）：** 对任意满足 $|\lambda|\leq1$ 的标量 $\lambda\in\mathbb K$，恒有 $\lambda C\subseteq C$。
> - **吸收集（Absorbing Set）：** 对空间中的每一个向量 $x\in X$，都存在正数 $r>0$，使得 $x\in rC$（等价地，$r^{-1}x\in C$）。

**凸集的基本保持性质：**
1. **有限凸组合与凸包：** 对两点凸性作数学归纳法可知，凸集 $C$ 对任意有限凸组合封闭，即当 $x_1,\ldots,x_m\in C$ 且 $\lambda_j\geq 0,\ \sum_{j=1}^m\lambda_j=1$ 时，必有 $\sum_{j=1}^m\lambda_j x_j\in C$。一般子集 $A\subseteq X$ 的**凸包** $\operatorname{conv}(A)$（包含 $A$ 的最小凸集）恰由 $A$ 中元素的全体有限凸组合构成（注：在无限维赋范空间中，紧集甚至有界闭集的凸包未必是闭集，故常需进一步取闭包得到闭凸包 $\overline{\operatorname{conv}}(A)$）。
2. **运算保持性：** 任意一族凸集的交集仍是凸集；凸集在线性映射下的像与原像仍是凸集；在赋范空间中，凸集的闭包 $\overline C$ 與内部 $\operatorname{Int}C$ 依然是凸集（因为若 $x_n\to x,\ y_n\to y$，则由线性运算连续性有 $(1-t)x_n+ty_n\to(1-t)x+ty$）。特别地，赋范空间中的开球与闭球都是凸集（且关于球心平移后是平衡吸收凸集），但球面一般不是凸集。

## 2. Minkowski 泛函（凸集的尺度函数）

如何用一个解析函数来定量描述一个包含原点的凸集 $C$ 的边界轮廓？Minkowski 提出了极富几何直观的“射线膨胀尺度”思想：对于任意向量 $x\in X$，考察需要把凸集 $C$ 放大多少倍（$tC$）才能刚刚把 $x$ 包容进去。

> [!note] 定义 2.2 Minkowski 泛函
> 设 $C$ 是线性空间 $X$ 中包含原点 $0$ 的**凸吸收集**。定义 $C$ 的 **Minkowski 泛函**（又称规范函数 / Gauge Functional）$p_C:X\to[0,\infty)$ 为：
> $$
> p_C(x)=\inf\{t>0:x\in tC\}.
> $$

这里**吸收性**保证了集合 $\{t>0:x\in tC\}$ 非空，从而下确界 $p_C(x)<\infty$ 对一切 $x\in X$ 都是有限非负实数；而 **$0\in C$ 与凸性**则保证了放缩单调性：当 $0<s<t$ 时，由于 $sC=\frac{s}{t}(tC)+(1-\frac{s}{t})\{0\}\subseteq tC$，半轴 $\{t>0:x\in tC\}$ 是一个包含 $(p_C(x),\infty)$ 的无穷区间。

> [!note] 定理 2.1 Minkowski 泛函的次线性性质
> 设 $C\subseteq X$ 是含原点的凸吸收集，则其 Minkowski 泛函 $p_C$ 是**非负次线性泛函**，即满足正齐次性与次可加性：
> $$
> p_C(\lambda x)=\lambda p_C(x)\quad(\forall\lambda\geq0),\qquad
> p_C(x+y)\leq p_C(x)+p_C(y)\quad(\forall x,y\in X).
> $$
> 进一步，若 $C$ 还是**平衡集**，则 $p_C(\lambda x)=|\lambda|p_C(x)$（$\forall\lambda\in\mathbb K$），此时 $p_C$ 是 $X$ 上的一个**半范数**。

**证明：**
1. **正齐次性：** 当 $\lambda=0$ 时，由 $0\in tC$（$\forall t>0$）知 $p_C(0)=0$。当 $\lambda>0$ 时，作变量代换 $t=\lambda\tau$，有
   $$
   p_C(\lambda x)=\inf\{t>0:\lambda x\in tC\}=\inf\{\lambda\tau>0:x\in\tau C\}=\lambda\inf\{\tau>0:x\in\tau C\}=\lambda p_C(x).
   $$
2. **次可加性（凸性的解析体现）：** 任取 $x,y\in X$。对任意满足 $s>p_C(x)$ 及 $t>p_C(y)$ 的正数 $s,t$，由下确界定义及集合放缩单调性可知 $x\in sC$ 且 $y\in tC$，即
   $$
   \frac{x}{s}\in C,\qquad \frac{y}{t}\in C.
   $$
   利用集合 $C$ 的**凸性**，取权重 $\frac{s}{s+t}>0$ 与 $\frac{t}{s+t}>0$（两者之和为 $1$），其凸组合必仍属于 $C$：
   $$
   \frac{x+y}{s+t}
   =\frac{s}{s+t}\left(\frac{x}{s}\right)+\frac{t}{s+t}\left(\frac{y}{t}\right)\in C,
   $$
   即 $x+y\in(s+t)C$，从而 $p_C(x+y)\leq s+t$。令 $s\downarrow p_C(x)$ 且 $t\downarrow p_C(y)$，即得 $p_C(x+y)\leq p_C(x)+p_C(y)$。
3. **平衡性与绝对齐次性：** 若 $C$ 平衡，则对任意 $\lambda\neq 0$，由于 $\frac{|\lambda|}{\lambda}$ 的模长为 $1$，有 $x\in tC\iff \frac{\lambda}{|\lambda|}x\in tC\iff \lambda x\in(|\lambda|t)C$，故 $p_C(\lambda x)=|\lambda|p_C(x)$，成为半范数。$\square$

## 3. 几何条件与 Minkowski 泛函分析性质的对应

在赋范线性空间 $(X,\|\cdot\|)$ 中，凸集 $C$ 的拓扑性质（开性、有界性）与 $p_C$ 的分析性质（连续性、正定性）之间存在着一一对应的精准关系：

1. **水平集包夹关系：** 对任何含原点的凸吸收集 $C$，恒有
   $$
   \{x\in X:p_C(x)<1\}\subseteq C\subseteq\{x\in X:p_C(x)\leq1\}.
   $$
   事实上，若 $p_C(x)<1$，则存在 $0<t<1$ 使 $x\in tC\subseteq C$；反之若 $x\in C=1\cdot C$，则直接由下确界定义得 $p_C(x)\leq 1$。
2. **开凸集对应连续性与严格水平集：** 若 $C$ 是包含原点 $0$ 的**开凸集**，则存在半径 $r>0$ 使得开球 $B(0,r)\subseteq C$。
   - **连续性：** 对任意 $x\in X$ 及 $\varepsilon>0$，向量 $\frac{r}{\|x\|+\varepsilon}x\in B(0,r)\subseteq C$，故 $p_C(x)\leq\frac{\|x\|+\varepsilon}{r}$；令 $\varepsilon\downarrow 0$ 得上界估计
     $$
     p_C(x)\leq\frac{1}{r}\|x\|.
     $$
     结合次可加性 $|p_C(x)-p_C(y)|\leq\max\{p_C(x-y),p_C(y-x)\}\leq\frac{1}{r}\|x-y\|$，可知 **$p_C$ 在 $X$ 上是 Lipschitz 连续的**。
   - **开集刻画：** 对任意 $x\in C$，由于 $C$ 是开集，存在充分小的 $\varepsilon>0$ 使得沿着射线再向外延伸一点的 $(1+\varepsilon)x$ 仍然属于 $C$，从而 $p_C(x)\leq\frac{1}{1+\varepsilon}<1$。因此，**当 $C$ 是含原点的开凸集时，精确成立 $C=\{x\in X:p_C(x)<1\}$**（同理，当 $C$ 是含原点为内点的闭凸集时，$C=\{x\in X:p_C(x)\leq 1\}$）。
3. **有界平衡开凸集对应等价范数：** 若 $C$ 是有界、平衡的开凸集（即 $B(0,r)\subseteq C\subseteq\overline B(0,R)$），则 $p_C$ 是满足
   $$
   \frac{1}{R}\|x\|\leq p_C(x)\leq\frac{1}{r}\|x\|
   $$
   的**等价范数**（反之，若 $C=X$ 无界，则 $p_C\equiv 0$ 退化为零泛函）。

## 4. 有限维非空紧凸集与欧氏闭球的同胚

在下一节证明 Brouwer 不动点定理时，我们需要说明：**有限维赋范空间中的任意非空紧凸集 $C$，都与某个维数 $k$ 的欧氏单位闭球 $\overline B_{\mathbb R^k}(0,1)$ 拓扑同胚。** 这一几何定理正是借助 Minkowski 泛函的径向投影构造出来的。

**证明构造：**
1. **降维至仿射包（消除扁平退化）：** 设 $C$ 是有限维空间中的非空紧凸集。需要注意，$C$ 在外围空间中未必有内点（例如三维空间中的一段平面圆盘或一条线段）。为此，我们先取 $C$ 生成的**仿射包** $E=\operatorname{aff}(C)$（即包含 $C$ 的最小仿射子空间）。若 $\dim E=0$，则 $C$ 为单点集，与 $0$ 维球同胚。若 $\dim E=k\geq 1$，可在 $C$ 中取出 $k+1$ 个仿射无关的点 $v_0,v_1,\ldots,v_k\in C$；由凸性，它们构成的 $k$ 维单纯形完全包含于 $C$ 内，而该单纯形的重心 $c=\frac{1}{k+1}\sum_{j=0}^k v_j$ 就是 $C$ 在仿射子空间 $E$ 中的一个**相对内点**。
2. **平移并利用 Minkowski 泛函构造径向双射：** 将原点平移至相对内点 $c$，令 $D=C-c\subseteq E-c\cong\mathbb R^k$。此时 $D$ 是 $k$ 维欧氏空间 $\mathbb R^k$ 中包含原点 $0$ 为内点的有界闭凸集（即存在 $0<r\leq R<\infty$ 使得 $B_{\mathbb R^k}(0,r)\subseteq D\subseteq\overline B_{\mathbb R^k}(0,R)$）。
   考察 $D$ 在 $\mathbb R^k$ 上的 Minkowski 泛函 $p=p_D$。由第 3 节结论，$p$ 在 $\mathbb R^k$ 上连续，满足 $\frac{1}{R}\|x\|\leq p(x)\leq\frac{1}{r}\|x\|$，且
   $$
   D=\{x\in\mathbb R^k:p(x)\leq 1\}.
   $$
   对 $\mathbb R^k$ 单位球面上的任意方向向量 $u$（$\|u\|=1$），从原点出发的射线 $\{tu:t\geq 0\}$ 与 $D$ 的边界恰好相交于唯一点 $\rho(u)u$，其中径向半径函数 $\rho(u)=\frac{1}{p(u)}\in[r,R]$ 关于 $u$ 连续。
3. **验证径向映射为拓扑同胚：** 定义从欧氏单位闭球 $\overline B_{\mathbb R^k}(0,1)$ 到 $C=c+D$ 的径向拉伸映射 $\Phi:\overline B_{\mathbb R^k}(0,1)\to C$：
   $$
   \Phi(x)=\begin{cases}
   c+\dfrac{\|x\|}{p(x)}\,x=c+\rho\left(\dfrac{x}{\|x\|}\right)x, & x\neq 0,\\[8pt]
   c, & x=0.
   \end{cases}
   $$
   当 $x\neq 0$ 时，由 $p$ 的连续性及 $p(x)\geq\|x\|/R>0$ 知 $\Phi$ 连续；当 $x\to 0$ 时，由 $\|\Phi(x)-c\|\leq R\|x\|\to 0$ 知 $\Phi$ 在原点处亦连续。同时，$\Phi$ 显然是双射（其逆映射为 $\Phi^{-1}(y)=\frac{p(y-c)}{\|y-c\|}(y-c)$，$y\neq c$）。由于定义域 $\overline B_{\mathbb R^k}(0,1)$ 是紧空间，目标空间 $C$ 是 Hausdorff 度量空间，**从紧空间到 Hausdorff 空间的连续双射必将闭集（从而紧集）映为紧集（从而闭集），故其逆映射自动连续**。因此 $\Phi$ 是拓扑同胚。$\square$

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_Brouwer与Schauder不动点定理|凸组合在不动点证明中的作用]]
- [[泛函分析/10_Hahn-Banach与凸分离/02_凸集分离与支撑泛函|Minkowski 泛函与分离]]
- [[泛函分析讲义上册习题册#1.5 凸集与不动点|原书 1.5 节]]
