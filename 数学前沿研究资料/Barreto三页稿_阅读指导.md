# Barreto 三页稿导读讲义：Landau–Siegel 零点不存在性的初等代数与解析机制

> **原始文件对照**：[数学前沿研究资料/Barreto三页稿_阅读指导.md](https://github.com/xsoc1/math-notes/blob/ff59314946c2e873f2d4405796dbc609f059eb44/%E6%95%B0%E5%AD%A6%E5%89%8D%E6%B2%BF%E7%A0%94%E7%A9%B6%E8%B5%84%E6%96%99/Barreto%E4%B8%89%E9%A1%B5%E7%A8%BF_%E9%98%85%E8%AF%BB%E6%8C%87%E5%AF%BC.md)
> **文献来源**：Kevin Barreto, *An elementary proof of the non-existence of Landau–Siegel zeros*（依据 [公开原帖的三张论文页图](https://x.com/AcerFur/status/2112239827077026128) 整理，本导读与此前针对 Green 五页稿的阅读指导相互独立）。

本讲义旨在为读者提供一份循序渐进的精读指南，拆解这篇三页短文中如何利用二次域上的辅助多项式、Wronskian 行列式与模素数 Frobenius 同余，给出一类加权素数和的上界，并进一步通过 Dirichlet $L$ 函数的对数导数与 Hadamard 乘积公式限制实零点的位置。

## 一、 核心命题与全文论证主线

设 $\chi$ 是导子（conductor）为 $q \ge 3$ 的本原（primitive）、非主实 Dirichlet 特征。用数论语言来说，$\chi$ 是以 $q$ 为周期的完全积性函数，取值于 $\{-1, 0, 1\}$，且“本原性”排除了它由更小模数的特征诱导而来的退化情形。与之对应的 Dirichlet $L$ 函数在半平面 $\Re s > 1$ 上由绝对收敛级数定义为

$$
L(s,\chi) = \sum_{n\ge 1} \frac{\chi(n)}{n^s},
$$

并通过解析延拓推广至整个复平面，从而可以讨论临界带内的零点分布。解析数论中著名的 Landau–Siegel 零点问题，关心的正是可能极其靠近 $s=1$ 的异常实零点 $\beta \in (0,1)$ 究竟能离 $1$ 有多近。

论文第 2 页的 **Corollary 2** 给出了如下显式渐近下界：

$$
(1-\beta)\log q \ge 1 - O\!\left(\frac{\log\log(3q)}{\log q}\right).
$$

由此立即可推知：存在一个与导子 $q$、特征 $\chi$ 以及实零点 $\beta$ 均无关的绝对正常数 $c > 0$，使得

$$
\beta \le 1 - \frac{c}{\log q}.
$$

这里“一致（effective/uniform）”的含义是同一个常数 $c>0$ 对所有本原实特征及其可能存在的实零点同时生效。需要注意定理结论的准确边界：它排除的是极靠近 $1$ 的异常实零点（Siegel 零点），并未声称所有非平凡零点都位于临界线 $\Re s = 1/2$ 上（即广义 Riemann 猜想），也并非断言零点与 $1$ 之间有不依赖于 $\log q$ 的固定常数距离。

支撑上述推论的核心桥梁，是论文第 1 页的 **Theorem 1**：对任意 $x \ge 2$，使 $\chi(p)=-1$ 的素数加权和满足上界估计

$$
A_\chi(x) := \sum_{\substack{p\le x\\\chi(p)=-1}} \frac{\log p}{p} \le \frac{1}{2}\log x + \frac{1}{4}\log q + \log\log(3x) + O(1).
$$

直观地看，若 $L(s,\chi)$ 在 $s=1$ 附近存在实零点 $\beta$，则为了压低 $s=1$ 处的 Euler 乘积值，在相当长的一段区间内必须有大量素数满足 $\chi(p) = -1$（即所谓 Deuring–Heilbronn 现象的直观背景，此时 $A_\chi(x)$ 的主项系数会趋向于 $\log x$ 而非 $\frac{1}{2}\log x$）。全文的论证因此清晰地分为前后两段：
1. **代数与丢番图逼近段（第 1–2 页）**：利用二次域整点上的高阶导数插值矩阵，构造一个非零有理整数行列式 $D \in \mathbb{Z}\setminus\{0\}$，通过对比其素数幂整除下界与阿基米德绝对值上界，强行将 $A_\chi(x)$ 的主项系数压制在 $\frac{1}{2}\log x + \frac{1}{4}\log q$；
2. **复分析与解析数论段（第 2 页末–第 3 页）**：通过分部求和将 $A_\chi(x)$ 的上界转化为 $-L'/L(1+\eta,\chi)$ 中 $1/\eta$ 极点主项的精确抵消，再结合 Hadamard 乘积导出的正性不等式推得 $(1-\beta)\log q$ 的下界。

## 二、 三页论文的分段精读路线图

在开始逐行推导前，建议先按以下四个阶段把握每页的战略目标与所需补足的演算细节：

| 原文位置 | 第一遍通读应把握的核心目标 | 第二遍精读需亲手核验的计算细节 |
| :--- | :--- | :--- |
| **第 1 页：Theorem 1 与插值矩阵构造** | 理解为何要将多项式在二次域代数整数点上的高阶偏导数拆分为整数矩阵 | 二次域共轭点的模长控制、加权单项式指标集 $\mathcal{T}$ 的基数、矩阵行列维数匹配 |
| **第 1 页末至第 2 页初：Wronskian 判别** | 理解如何排除矩阵行向量之间的有理线性相关，从而保证存在非零最大阶子式 $D \ne 0$ | 阶梯化选取次数互异的首一多项式基、Vandermonde 型前导系数计算、高重零点引发的次数矛盾 |
| **第 2 页：素数整除与行列式上界对比** | 理解同一个非零整数 $D$ 如何同时受到“大量素数幂整除”与“绝对值不能过大”的双向夹逼 | 模素数 $p$ 的 Frobenius 同余、保持行列式不变的幺模三角行变换、取对数后的主项与余项平衡 |
| **第 2 页末至第 3 页：从素数和到零点排斥** | 理解 $\frac{1}{2}\log x$ 中的系数 $1/2$ 如何在 $L'/L$ 中恰好抵消极点项 $1/\eta$ | 分部求和积分、Euler 乘积对数导数的符号拆分、Hadamard 乘积公式及最优参数 $\eta=(\log q)^{-2}$ 的选取 |

在预备知识上，前两页仅涉及高等代数（矩阵秩与行列式、多元多项式）、二次代数数域 $\mathbb{Q}(\sqrt{d})$ 的基本算术与模素数同余；第三页则使用了解析数论中的标准工具（Riemann $\zeta$ 函数与 Dirichlet $L$ 函数的对数导数、分部求和与整函数 Hadamard 乘积）。分清这一知识分界，有助于在阅读时平滑过渡。

## 三、 第一处核心构造：密集的代数整数点与受控的共轭模长

根据本原实 Dirichlet 特征与二次域 Kronecker/Legendre 符号的标准对应，可取无平方因子整数 $d \ne 1$ 且满足 $|d| \le q$，使得对一切不整除 $q$ 的奇素数 $p \nmid q$ 均有

$$
\chi(p) = \left(\frac{d}{p}\right),
$$

其中 $\left(\frac{d}{p}\right)$ 为 Legendre 符号。随后在二次域 $\mathbb{Q}(\sqrt{d})$ 的代数整数环中构造一族采样点：

$$
\alpha_i = u + v\sqrt{d}, \qquad \overline{\alpha}_i = u - v\sqrt{d}.
$$

注意这里的上划线 $\overline{\alpha}_i$ 表示二次域 $\mathbb{Q}(\sqrt{d})/\mathbb{Q}$ 的非平凡 Galois 共轭（即将 $\sqrt{d}$ 映为 $-\sqrt{d}$）；当 $d > 0$ 时，$\alpha_i$ 为实二次整数，该代数共轭并非复共轭。

整数坐标 $(u,v)$ 取自如下非对称矩形区域：

$$
0 \le u < \frac{B}{2}, \qquad 0 \le v < \frac{B}{2\sqrt{q}}, \qquad \text{其中 } B = 2\sqrt{2x}\,q^{1/4}.
$$

这一采样区域的设计十分精巧，同时兼顾了**采样点数量下界**与**阿基米德模长上界**两项需求：
1. **整点数量充足**：矩形两条边长的乘积为 $\frac{B}{2} \cdot \frac{B}{2\sqrt{q}} = \frac{B^2}{4\sqrt{q}} = 2x$，因此在区域内至少可以选出 $2x$ 个互不相同的整点对 $(u,v)$（对应至少 $2x$ 个互异的 $\alpha_i$）。充足的采样点数量将在后续 Wronskian 论证中迫使非零多项式产生超出其次数上限的零点重数。
2. **点及其共轭的模长受控**：由于 $|d| \le q$，对每个采样点都有一致上界

$$
|\alpha_i|,\, |\overline{\alpha}_i| \le u + v\sqrt{|d|} < \frac{B}{2} + \frac{B}{2\sqrt{q}}\sqrt{q} = B.
$$

正是为了把 $v\sqrt{|d|}$ 压制到与 $u$ 同阶的 $O(B)$，才在 $v$ 的取值范围中除以 $\sqrt{q}$，进而导致 $B$ 中出现了因子 $q^{1/4}$——这便是 Theorem 1 右端 $\frac{1}{4}\log q$ 项的直接来源。

接下来构造求值插值矩阵。赋予二元变量 $z, w$ 的权重分别为 $1$ 和 $k$（其中参数 $k \ge 3$ 待定），定义加权次数小于 $x$ 的单项式指标集：

$$
\mathcal{T} = \bigl\{(r,s) \in \mathbb{Z}_{\ge 0}^2 : r + ks < x\bigr\}.
$$

矩阵的**行**由全体 $(r,s) \in \mathcal{T}$ 索引，对应单项式 $z^r w^s$；矩阵的**列**则由采样点序号 $i$、关于变量 $z$ 的偏导数阶数 $0 \le j < 2x/k$ 以及 $\mathbb{Z}[\sqrt{d}]$ 基 $\{1, \sqrt{d}\}$ 的两个坐标分量共同索引。具体而言，将偏导数在采样点对 $(\alpha_i, \overline{\alpha}_i)$ 处的取值按整基展开：

$$
\left.\partial_z^j (z^r w^s)\right|_{(z,w)=(\alpha_i,\overline{\alpha}_i)} = a_{i,j,r,s} + b_{i,j,r,s}\sqrt{d}, \qquad a_{i,j,r,s},\, b_{i,j,r,s} \in \mathbb{Z},
$$

并将整数对 $(a_{i,j,r,s}, b_{i,j,r,s})$ 作为第 $(r,s)$ 行在对应列上的两个有理整数元素。由此便得到一个**元素全为有理整数的矩阵**。下一步的目标是证明该矩阵的行向量在 $\mathbb{Q}$ 上线性无关，从而可以从中选取一个包含全部 $|\mathcal{T}|$ 行的非零最大阶方阵行列式 $D \in \mathbb{Z}\setminus\{0\}$。

## 四、 第一处核心难点：利用 Wronskian 行列式排除行线性相关

用反证法。假设上述整数矩阵的各行之间存在非平凡的有理线性组合为零，即存在不全为零的有理数（可通过通分取为整数）$c_{r,s}$，使得对应的二元非零多项式

$$
F(z,w) = \sum_{(r,s)\in\mathcal{T}} c_{r,s} z^r w^s
$$

在每个采样点处满足：对一切 $i$ 及一切 $0 \le j < m := \lceil 2x/k \rceil$，均有 $\partial_z^j F(\alpha_i, \overline{\alpha}_i) = 0$。根据指标集 $\mathcal{T}$ 的定义，$F$ 关于两个变量的次数分别受限于 $\deg_z F < x$ 与 $\deg_w F < x/k$；同时，将第二个变量固定为 $\overline{\alpha}_i$ 后得到的每个一元多项式

$$
f_i(z) := F(z, \overline{\alpha}_i)
$$

都在 $z = \alpha_i$ 处具有重数至少为 $m = \lceil 2x/k \rceil$ 的零点。

### 第一步：统计不全为零的一元多项式 $f_i(z)$ 的个数

将 $F(z,w)$ 按 $z$ 的幂次整理，因为 $F \not\equiv 0$，其中至少有一个关于 $w$ 的系数多项式 $a(w) \not\equiv 0$。若对某个采样点有 $f_i(z) = F(z, \overline{\alpha}_i) \equiv 0$（作为 $z$ 的多项式恒等于零），则必有 $a(\overline{\alpha}_i) = 0$。由于单变量非零多项式 $a(w)$ 的次数不超过 $\deg_w F < x/k$，它至多只能有 $\deg_w F < x/k$ 个互异的根。而在采样矩形中我们原本选出了至少 $2x$ 个互异的共轭点 $\overline{\alpha}_i$，除去至多 $x/k$ 个使 $f_i \equiv 0$ 的点后，**使得 $f_i(z)$ 为非零多项式的采样点下标 $i$ 至少仍有 $2x - x/k > x$ 个**。

### 第二步：构造子空间的首一阶梯基与 Wronskian 行列式

考察由所有这些一元多项式 $\{f_i(z)\}$ 在复数域（或 $\mathbb{Q}(\sqrt{d})$）上张成的有限维线性子空间 $V = \operatorname{span}\{f_i(z)\}$，记其维数为 $\ell = \dim V \ge 1$。由于每个 $f_i(z)$ 都是 $\bigl\{1, \overline{\alpha}_i, \ldots, \overline{\alpha}_i^{\lfloor x/k\rfloor}\bigr\}$ 对 $z$ 的多项式系数的线性组合，子空间维数满足

$$
\ell \le \deg_w F + 1 < \frac{x}{k} + 1.
$$

通过对基多项式进行高斯消元（逐次消去最高次项），可以在 $V$ 中选取一组**次数严格递增的首一多项式基** $g_1(z), g_2(z), \ldots, g_\ell(z)$，记它们的次数为 $0 \le d_1 < d_2 < \cdots < d_\ell < x$。定义这组基的 Wronskian 行列式为

$$
W(z) = \det\!\bigl(g_b^{(a)}(z)\bigr)_{0 \le a < \ell,\; 1 \le b \le \ell}.
$$

这一构造精妙地集成了以下三条性质，从而导出矛盾：

1. **$W(z)$ 是非零多项式（$W \not\equiv 0$）**：由于每个 $g_b(z) = z^{d_b} + \text{低次项}$，对其求 $a$ 阶导数后的最高次项为 $d_b(d_b-1)\cdots(d_b-a+1) z^{d_b-a}$。因此行列式 $W(z)$ 展开后的最高次项幂次为 $\sum_{b=1}^\ell d_b - \frac{\ell(\ell-1)}{2}$，其最高次项系数恰为
   $$
   \det\!\bigl(d_b(d_b-1)\cdots(d_b-a+1)\bigr)_{0 \le a < \ell,\; 1 \le b \le \ell} = \prod_{1 \le b < c \le \ell} (d_c - d_b) \ne 0.
   $$
   这是因为第 $a$ 行是关于变量 $d_b$ 的首一 $a$ 次多项式，经初等行变换即可化为标准的 Vandermonde 行列式；既然 $d_1 < d_2 < \cdots < d_\ell$ 两两互异，该系数必不为零。
2. **$W(z)$ 的总次数上界**：由于每个基多项式 $g_b(z)$ 的次数均小于 $x$，且求导只会降低次数，故行列式展开式中每一项的次数都严格小于 $\ell x$，即
   $$
   \deg W < \ell x.
   $$
3. **每个满足 $f_i \not\equiv 0$ 的点 $\alpha_i$ 都是 $W(z)$ 的至少 $\ell$ 重零点**：固定任一使 $f_i(z) \not\equiv 0$ 的下标 $i$。因为 $f_i \in V\setminus\{0\}$，可将 $f_i$ 扩充为子空间 $V$ 的另一组基 $\{\tilde{g}_1, \tilde{g}_2, \ldots, \tilde{g}_\ell\}$（其中 $\tilde{g}_1 = f_i$）。基变换只会使 Wronskian 行列式乘以一个非零常数（基变换矩阵的行列式），不改变 $W(z)$ 在任何点处的零点重数。对行列式按积的莱布尼茨法则求前 $r$ 阶导数（$0 \le r < \ell$）时，第一列出现的是 $f_i^{(a+r)}(\alpha_i)$，其最大求导阶数为 $(\ell-1) + (\ell-1) = 2\ell - 2$。由于 $\ell < x/k + 1$ 且 $m = \lceil 2x/k \rceil$，恒有
   $$
   m \ge 2\ell - 1 \iff m - (\ell - 1) \ge \ell.
   $$
   这说明在 $z=\alpha_i$ 处，第一列直到计入外层求导后仍然全为零，故 $W(z)$ 在每个这样的 $\alpha_i$ 处至少有 $\ell$ 重零点。

**导出矛盾**：既然有超过 $x$ 个互异的采样点 $\alpha_i$ 使得 $f_i \not\equiv 0$，非零多项式 $W(z)$ 的零点总重数（计重数）必然严格大于 $\ell x$，但这与性质 2 中的次数上界 $\deg W < \ell x$ 直接矛盾！由此便严格证明了原整数矩阵的所有行向量线性无关，从而必然存在一个包含全部 $|\mathcal{T}|$ 行的非零整数方阵行列式 $D \in \mathbb{Z}\setminus\{0\}$。

> **直观算例**：取 $\ell=3$ 及次数互异的首一基 $g_1(z)=1,\; g_2(z)=z,\; g_3(z)=z^3$（对应次数 $d_1=0, d_2=1, d_3=3$），其 Wronskian 行列式为
> $$
> W(z) = \det\begin{pmatrix} 1 & z & z^3 \\ 0 & 1 & 3z^2 \\ 0 & 0 & 6z \end{pmatrix} = 6z.
> $$
> 其最高次项系数 $6 = (1-0)(3-0)(3-1)$，恰好等于次数差之积的 Vandermonde 公式。

## 五、 第二页核心推导：对非零整数 $D$ 的素数幂整除与模长夹逼

选定上述非零整数行列式 $D \ne 0$ 后，考察所有满足 $k \le p \le x$ 且 $\chi(p) = -1$ 的素数 $p$。由于 $p \ge k \ge 3$ 且 $\chi(p) = \left(\frac{d}{p}\right) = -1$，由二次剩余的 Euler 判别法可知 $d^{(p-1)/2} \equiv -1 \pmod p$。因此在代数整数环 $\mathbb{Z}[\sqrt{d}]$ 中利用二项式定理展开，可得模 $p\mathbb{Z}[\sqrt{d}]$ 的 Frobenius 同余关系：

$$
\alpha_i^p = (u + v\sqrt{d})^p \equiv u^p + v^p d^{(p-1)/2}\sqrt{d} \equiv u - v\sqrt{d} = \overline{\alpha}_i \pmod{p\mathbb{Z}[\sqrt{d}]}.
$$

这一同余式表明：二元多项式 $z^p - w$ 在每一个采样点对 $(\alpha_i, \overline{\alpha}_i)$ 处的值均为 $p\mathbb{Z}[\sqrt{d}]$ 中的元素（即实部与 $\sqrt{d}$ 系数均被 $p$ 整除）；同时，对 $z$ 求任意正整数阶偏导数 $\partial_z^j(z^p - w) = \partial_z^j(z^p)$ 时，只要 $j \ge 1$，其系数 $p(p-1)\cdots(p-j+1)$ 本身就含有因子 $p$，因此**$z^p - w$ 的任意阶 $z$-偏导数在所有采样点处均被 $p$ 整除**。

现在对矩阵中对应于单项式 $z^r w^s$（$(r,s) \in \mathcal{T}$）的那一行实施行变换。记 $h = \lfloor r/p \rfloor$，将该行对应的生成多项式替换为

$$
z^{r-ph}(z^p - w)^h w^s = z^r w^s + \sum_{j=1}^h (-1)^j \binom{h}{j} z^{r-pj} w^{s+j}.
$$

这一代换之所以能够成立并给出高次幂整除，依赖于两条缺一不可的性质：
1. **整行元素被 $p^h$ 整除**：对左端乘积 $z^{r-ph}(z^p-w)^h w^s$ 按莱布尼茨法则求任意阶 $z$-偏导数并代入 $(z,w)=(\alpha_i,\overline{\alpha}_i)$ 时，展开式的每一项都至少包含 $h$ 个形如 $\partial_z^{j_m}(z^p-w)$（$j_m \ge 0$）的因子；如前所述，每个这样的因子在采样点处都提供一个素因子 $p$，因此变换后的整行所有整数元素均可被 $p^h = p^{\lfloor r/p \rfloor}$ 整除。
2. **行变换是保持行列式 $D$ 不变的幺模整行变换**：观察右端展开式中 $j \ge 1$ 的附加单项式 $z^{r-pj} w^{s+j}$。由于所考察的素数满足 $p \ge k$，这些附加单项式的加权次数满足
   $$
   (r - pj) + k(s + j) = r + ks + j(k - p) \le r + ks < x,
   $$
   这意味着所有附加单项式的指标 $(r-pj, s+j)$ **依然落入原指标集 $\mathcal{T}$ 之内**，且它们关于 $z$ 的次数 $r-pj < r$ 严格降低！因此，若将矩阵各行按 $r$ 从小到大排列，上述代换无非是在第 $(r,s)$ 行上加上了若干排在它前面的行的整数倍（即乘以一个主对角线全为 $1$ 的下三角整数矩阵），故**行列式 $D$ 的值完全保持不变**。

> **具体算例**：取 $p=3, r=7, s=1$，则 $h = \lfloor 7/3 \rfloor = 2$，代换多项式为
> $$
> z(z^3 - w)^2 w = z^7 w - 2z^4 w^2 + z w^3,
> $$
> 即用当前行减去 $2$ 倍的 $(4,2)$ 行再加上 $1$ 倍的 $(1,3)$ 行，行列式不变而新行可被 $3^2$ 整除。

对全部 $(r,s) \in \mathcal{T}$ 同步实施上述幺模行变换后，立即可知非零整数 $D$ 满足整除关系：

$$
p^{\sum_{(r,s)\in\mathcal{T}} \lfloor r/p \rfloor} \;\Big|\; D.
$$

由于不同素数幂两两互素，上述整除关系对所有满足 $k \le p \le x$ 且 $\chi(p)=-1$ 的素数可同时累乘。记总次数和为

$$
U = \sum_{(r,s)\in\mathcal{T}} r.
$$

利用下取整估计 $\lfloor r/p \rfloor \ge r/p - 1$，取自然对数并结合素数 Chebyshev 估计补回 $p < k$ 的小素数贡献，即可由整除关系得到下界转换式：

$$
A_\chi(x) \le \frac{\log|D|}{U} + \log k + O(1).
$$

另一方面，从阿基米德绝对值估算 $|D|$ 的上界。在第 $(r,s)$ 行中，微分算子 $\partial_z^j$（$j < 2x/k$）产生的组合系数不超过 $x^{2x/k}$，采样点坐标模长不超过 $B^{r+s}$，故该行元素的绝对值受控于

$$
x^{2x/k} B^{r+s} \le B^r (x^2 B)^{O(x/k)}.
$$

此时需要严格按照原稿的分段逻辑处理 $x$ 与导体 $q$ 的相对大小：
1. **小参数与大导体情形（$x < e^{e^3}$ 或 $x < \sqrt{q}$）：** 此时无需启用行列式构造，直接对素数和 $A_\chi(x)$ 取绝对值并应用经典的 Mertens 第一定理（$\sum_{p \le x} \frac{\log p}{p} = \log x + O(1)$，素数高次幂项收敛于绝对常数 $O(1)$；注意切勿误写为 $\sum_{n\le x}\frac{\Lambda(n)}{n}\log\frac{x}{n} = \frac{1}{2}(\log x)^2 + O(\log x)$），即有逐点平凡上界：
   $$
   A_\chi(x) \le \sum_{p \le x} \frac{\log p}{p} + O(1) = \log x + O(1).
   $$
   据此分别检验两类退化范围：
   - **当 $x < e^{e^3}$ 时：** 由于 $x$ 受绝对常数 $e^{e^3}$ 上界控制，$A_\chi(x) \le \log(e^{e^3}) + O(1) = O(1)$，直接并入定理右端的 $O(1)$ 常数余项；
   - **当 $x \ge e^{e^3}$ 但 $x < \sqrt{q}$ 时：** 此时 $\frac{1}{2}\log x < \frac{1}{4}\log q$ 且 $\log\log(3x) > 3 > 0$，故由 Mertens 估计立得
     $$
     A_\chi(x) \le \log x + O(1) = \frac{1}{2}\log x + \frac{1}{2}\log x + O(1) < \frac{1}{2}\log x + \frac{1}{4}\log q + \log\log(3x) + O(1).
     $$
   因此定理结论在这两种退化情形下均无需行列式消去即平凡成立。
2. **主区间情形（$x \ge \max(e^{e^3}, \sqrt{q})$）：** 在此主区间内有 $\log q \le 2\log x$。选取参数 $k = \lceil \log(x^2 B) \rceil$，由 $B = 2\sqrt{2x}\,q^{1/4} \le 2\sqrt{2}\,x$ 可知
   $$
   k = \lceil \log(x^2 B) \rceil \asymp \log x \quad(\text{特别地有 } k \le x,\text{ 保证指标集 }\mathcal{T}\text{ 非空}),
   \qquad
   \log k = \log\log(3x) + O(1).
   $$
   此时额外因子满足 $(x^2 B)^{O(x/k)} = e^{O(x)}$。对 $|\mathcal{T}|$ 阶行列式 $D$ 应用 Hadamard 不等式（或按定义展开），取对数后得到

$$
\log|D| \le U \log B + O\bigl(x|\mathcal{T}|\bigr).
$$

通过计算三角形指标集 $\mathcal{T}$ 内部子矩形的格点和（在 $k \le x$ 的保证下），易知 $U \gg x^3/k$ 且 $|\mathcal{T}| \le x^2/k$，从而余项满足 $x|\mathcal{T}| = O(U)$。将其代回前式两边同除以 $U$，并代入主区间内的 $\log k = \log\log(3x) + O(1)$，便得到 Theorem 1 的主不等式：

$$
A_\chi(x) \le \log B + \log k + O(1) = \frac{1}{2}\log x + \frac{1}{4}\log q + \log\log(3x) + O(1).
$$

（注：在精读时需特别注意先利用 Mertens 估计排除 $x < \sqrt{q}$，再在主区间 $x \ge \max(e^{e^3},\sqrt{q})$ 中依次确定采样上界 $B = 2\sqrt{2x}\,q^{1/4}$ 与权重 $k = \lceil \log(x^2 B) \rceil$，唯有在 $x \ge \sqrt{q}$ 前提下才有 $k \asymp \log x$ 与 $\log k = \log\log(3x)+O(1)$。）

## 六、 第三页核心推导：从加权素数和上界到实零点排斥区

第三页的解析过渡由三个环环相扣的分析接口组成。令实变量 $\sigma = 1 + \eta$，其中参数 $0 < \eta \le 1$ 待定。

### 接口一：利用分部求和将有限截断和转化为无穷级数

定义 $\chi(p)=-1$ 处的素数 Dirichlet 级数，并应用 Abel 分部求和（Stieltjes 积分分部积分）代入 Theorem 1 的上界：

$$
S_-(\eta) := \sum_{\chi(p)=-1} \frac{\log p}{p^{1+\eta}} = \eta \int_1^\infty \frac{A_\chi(t)}{t^{1+\eta}}\,dt \le \frac{1}{2\eta} + \frac{1}{4}\log q + O\bigl(\log(2/\eta)\bigr).
$$

这里主项 $\frac{1}{2\eta}$ 来自基础积分 $\eta \int_1^\infty (\log t) t^{-1-\eta}\,dt = \frac{1}{\eta}$ 与系数 $\frac{1}{2}$ 的乘积；而对数余项 $\int_1^\infty \log\log(3t)\,\eta t^{-1-\eta}\,dt$ 则可将 $\eta t^{-1-\eta}\,dt$ 视为区间 $[1,\infty)$ 上的概率测度，利用对数函数的凹性（Jensen 不等式）直接控制在 $O(\log(2/\eta))$ 内。

### 接口二：Euler 乘积的对数导数与 $1/\eta$ 极点项的精确抵消

在绝对收敛半平面 $\sigma > 1$ 内，对 $L(\sigma,\chi)$ 的 Euler 乘积取对数并求导（注意前端负号）：

$$
-\frac{L'}{L}(\sigma,\chi) = \sum_p \sum_{m\ge 1} \frac{\chi(p)^m \log p}{p^{\sigma m}}, \qquad \text{即} \qquad \frac{L'}{L}(\sigma,\chi) = -\sum_p \sum_{m\ge 1} \frac{\chi(p)^m \log p}{p^{\sigma m}}.
$$

将素数一次幂（$m=1$）按 $\chi(p) = 1, -1, 0$ 拆分为三部分，并利用恒等式 $\mathbf{1}_{\chi(p)=1} - \mathbf{1}_{\chi(p)=-1} = 1 - 2\,\mathbf{1}_{\chi(p)=-1} - \mathbf{1}_{p\mid q}$：
- 素数高次幂（$m \ge 2$）的级数在 $\sigma \ge 1$ 上一致收敛，贡献为 $O(1)$；
- 整除导子 $q$ 的素数（$\chi(p)=0$，即 $p \mid q$）满足 $\sum_{p\mid q} \frac{\log p}{p^\sigma} = O(\log\log(3q))$；
- 全体素数之和对应 Riemann $\zeta$ 函数的对数导数 $-\frac{\zeta'}{\zeta}(1+\eta) = \frac{1}{\eta} + O(1)$。

将上述三项合并并代入接口一的估计，可得

$$
\frac{L'}{L}(1+\eta,\chi) = 2S_-(\eta) - \frac{1}{\eta} + O(\log\log(3q)) \le \frac{1}{2}\log q + O\bigl(\log(2/\eta) + \log\log(3q)\bigr).
$$

**全篇最关键的解析机制正在于此**：$S_-(\eta)$ 上界中的主项是 $\frac{1}{2\eta}$，乘以系数 $2$ 后恰好变成 $\frac{1}{\eta}$，与来自 Riemann $\zeta$ 函数在 $s=1$ 处简单极点的 $-\frac{1}{\eta}$ **完全相消**！倘若前面 Theorem 1 中的系数大于 $1/2$，此处就会残留一个当 $\eta \to 0^+$ 时趋于 $+\infty$ 的正极点项，后续零点排斥便无从谈起。

### 接口三：整函数 Hadamard 乘积公式与参数 $\eta$ 的选取

调用解析数论中整函数 Hadamard 乘积分解的对数导数展开式（见 Montgomery–Vaughan 教材 Corollary 10.18），在 $\sigma = 1+\eta$ 处保留实零点 $\beta \in (0,1)$ 的正贡献，并利用其余非平凡零点 $\rho = \beta_\rho + i\gamma_\rho$ 满足 $\Re\frac{1}{1+\eta-\rho} > 0$ 将其放缩舍去（同时 Gamma 因子的对数导数贡献为 $\frac{1}{2}\log q + O(1)$），可得不等式：

$$
\frac{1}{1-\beta+\eta} \le \frac{L'}{L}(1+\eta,\chi) + \frac{1}{2}\log q + O(1) \le \log q + O\bigl(\log(2/\eta) + \log\log(3q)\bigr).
$$

（注：这一步依赖于整函数亏格与完备化 $L$ 函数函数方程的标准解析理论，是连接初等代数估计与复零点位置的桥梁。）

最后选取最优小参数 $\eta = (\log q)^{-2}$。记 $L = \log q$，则上式右端化为 $L + O(\log L)$。对不等式两端取倒数并移项减去 $\eta = L^{-2}$，即证得当 $q \to \infty$ 时有

$$
(1-\beta)\log q \ge \frac{1}{1 + O(\log L / L)} - \frac{1}{L} = 1 - O\!\left(\frac{\log\log(3q)}{\log q}\right).
$$

这首先给出了当导子 $q$ 充分大时的一致下界；对于剩余有限多个小导子 $q$，由于解析函数的零点具有孤立性，每个特征在 $(0,1)$ 内的实零点离 $1$ 均有正距离，取这有限个正距离与大 $q$ 情形常数的最小值，即得到对一切 $q \ge 3$ 一致成立的绝对正常数 $c > 0$。

## 七、 课后自检与核心思考题

合上原稿后，可通过回答以下三个问题检验是否真正掌握了证明的骨架：

1. **为什么不能仅在有限域 $\mathbb{F}_p$ 上讨论矩阵的秩，而必须先在特征零的整数环 $\mathbb{Z}$ 上证明 $D \ne 0$？**
   - *解析要点*：若整数行列式 $D = 0$，则 $0$ 可以被任意素数的任意高次幂整除，此时整除关系 $p^M \mid D$ 完全无法提供关于素数乘积的大小限制；唯有当 $D$ 是非零有理整数时，基本不等式 $\prod_p p^{v_p(D)} \le |D|$ 才能将模 $p$ 的局部整除信息转化为全局的绝对值下界。
2. **在第二页做幺模三角行变换时，为什么必须要求素数满足 $p \ge k$？这一条件具体用在了哪一步？**
   - *解析要点*：在将 $z^r w^s$ 替换为 $z^{r-ph}(z^p-w)^h w^s$ 时，展开式中的低次修正项为 $z^{r-pj}w^{s+j}$（$1 \le j \le h$）。其加权次数为 $r + ks + j(k-p)$。唯有当 $p \ge k$ 时才有 $j(k-p) \le 0$，从而保证修正项的加权次数仍然严格小于 $x$（即对应行本来就已经存在于矩阵的行指标集 $\mathcal{T}$ 中），行变换才不会引入矩阵之外的新行。
3. **假定 Theorem 1 中只能证得较弱的素数和上界 $A_\chi(x) \le \frac{3}{4}\log x + \frac{1}{4}\log q + O(\log\log x)$，第三页的推导会在何处失效？**
   - *解析要点*：此时 $S_-(\eta)$ 的主项将变为 $\frac{3}{4\eta}$，代入 $\frac{L'}{L}(1+\eta,\chi) = 2S_-(\eta) - \frac{1}{\eta} + \cdots$ 后，右端会出现发散主项 $\frac{1}{2\eta} \to +\infty$（当 $\eta \to 0^+$ 时），无法再用 $\log q$ 控制 $\frac{1}{1-\beta+\eta}$，从而无法导出无零点区域。
