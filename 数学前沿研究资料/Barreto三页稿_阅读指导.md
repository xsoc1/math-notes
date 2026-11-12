# Barreto 三页稿阅读指导

Kevin Barreto，*An elementary proof of the non-existence of Landau–Siegel zeros*。

依据：[公开原帖的三张论文页图](https://x.com/AcerFur/status/2112239827077026128)，2026-10-20 获取。配套 PDF 是三张原尺寸图片的合订本，内容、页序与原帖一致；尚未取得作者提供的原生 PDF。这里解释的就是这篇三页稿，之前针对 Green 五页稿的《阅读指导.md》另行保留。

## 先看清文章证明什么

设 $\chi$ 是导子为 $q\ge3$ 的本原、非主实 Dirichlet 特征。也就是说，它是周期性的完全乘法函数，取值于 $\{-1,0,1\}$，本原条件排除从更小模数诱导的情形。相应的函数在 $\Re s>1$ 定义为

$$
L(s,\chi)=\sum_{n\ge1}\frac{\chi(n)}{n^s},
$$

然后用解析延拓讨论其他区域的零点。文章关心的是实零点 $\beta\in(0,1)$ 离 $1$ 有多近。

第 2 页的 **Corollary 2** 给出

$$
(1-\beta)\log q
\ge 1-O\!\left(\frac{\log\log(3q)}{\log q}\right).
$$

因此存在与 $q,\chi,\beta$ 无关的绝对常数 $c>0$，使

$$
\beta\le1-\frac{c}{\log q}.
$$

“一致”指同一个 $c$ 适用于所有这些特征和实零点。这个结论没有说所有非平凡零点都在实部 $1/2$ 上，也没有给出所有零点离 $1$ 都有同一个固定正距离。

全文的入口其实是第 1 页的 **Theorem 1**：对 $x\ge2$，

$$
A_\chi(x):=
\sum_{\substack{p\le x\\\chi(p)=-1}}\frac{\log p}{p}
\le\frac12\log x+\frac14\log q+\log\log(3x)+O(1).
$$

它限制取值为 $-1$ 的素数所占的加权总量。先用代数方法证明这个素数和上界，再用复分析把它转成实零点的限制，是全文的两段主线。

## 推荐怎样读这三页

| 页与位置 | 第一遍抓住的目标 | 精读时要补的计算 |
|---|---|---|
| 第 1 页，Theorem 1 及矩阵构造 | 明白为何造一个非零整数行列式 | 共轭点的大小、加权单项式集合、矩阵的行列 |
| 第 1 页末至第 2 页开头 | Wronskian 为什么保证行线性无关 | 次数互异的基、Wronskian 非零、高重零点的次数矛盾 |
| 第 2 页，素数整除与大小比较 | 同一个整数既不能太大，也必须含有许多素因子 | Frobenius 同余、换行保持行列式、对数估计中的误差 |
| 第 2 页末至第 3 页 | 素数和如何进入 $L'/L$，再限制零点 | 分部求和、Euler 乘积的符号、Hadamard 公式、参数 $\eta$ |

先备知识可以分开准备：前半篇主要用线性代数、多项式、二次域共轭和模素数运算；后半篇需要 Dirichlet $L$ 函数、分部求和及整函数乘积。不了解 Hadamard 公式时，可以先将第 3 页的相应不等式作为标准接口读，暂不阻碍理解前两页的核心构造。

## 第一处构造：许多点、较小的共轭

原文调用特征的标准二次表示：可取平方自由的 $d\ne1$、$|d|\le q$，使对奇素数 $p\nmid q$ 有

$$
\chi(p)=\left(\frac d p\right).
$$

这里 $(d/p)$ 是 Legendre 符号。随后在二次域 $\mathbb Q(\sqrt d)$ 中取

$$
\alpha_i=u+v\sqrt d,
\qquad \overline\alpha_i=u-v\sqrt d.
$$

横杠表示这个二次域的非平凡共轭；当 $d>0$ 时，它并非通常的复共轭。

选点的矩形是

$$
0\le u<\frac B2,
\qquad0\le v<\frac{B}{2\sqrt q},
\qquad B=2\sqrt{2x}\,q^{1/4}.
$$

两个边长的乘积为 $B^2/(4\sqrt q)=2x$，所以其中至少有 $2x$ 个整点；同时

$$
|\alpha_i|,|\overline\alpha_i|
\le u+v\sqrt{|d|}\le B.
$$

这个选择同时服务于后面的两项估计：点多，用来迫使一个多项式拥有过多零点；共轭小，用来控制行列式大小。$B$ 中的 $q^{1/4}$ 最终成为 Theorem 1 中的 $\frac14\log q$。

接着给变量 $z,w$ 的权分别定为 $1,k$，并取

$$
\mathcal T=\{(r,s)\in\mathbb Z_{\ge0}^2:r+ks<x\}.
$$

每个 $(r,s)$ 对应矩阵的一行。列来自选点 $i$、求导阶数 $0\le j<2x/k$，以及二次环中的两个整数坐标。具体说，将

$$
\partial_z^j(z^rw^s)(\alpha_i,\overline\alpha_i)
=a_{i,j,r,s}+b_{i,j,r,s}\sqrt d
$$

拆成整数 $a_{i,j,r,s},b_{i,j,r,s}$。这样得到的是一个**整矩阵**。后面从中固定一个使用全部行的非零方形子式 $D\in\mathbb Z$。

## 最值得慢读的地方：Wronskian 排除行关系

假设矩阵的行之间存在有理线性关系，把这些系数组成非零多项式

$$
F(z,w)=\sum_{(r,s)\in\mathcal T}c_{r,s}z^rw^s.
$$

它满足 $\deg_zF<x$、$\deg_wF<x/k$，而且每个单变量多项式

$$
f_i(z)=F(z,\overline\alpha_i)
$$

都在 $z=\alpha_i$ 处至少有 $m=\lceil2x/k\rceil$ 阶零点。

**先数有多少个 $f_i$ 不是零多项式。** 将 $F$ 看成关于 $z$ 的多项式，选一个不恒零的系数多项式 $a(w)$。若 $F(z,w_0)\equiv0$，必有 $a(w_0)=0$。故这样的不同 $w_0$ 至多有 $\deg_wF<x/k$ 个。原来至少有 $2x$ 个互异的 $\overline\alpha_i$，所以非零的 $f_i$ 超过 $x$ 个。

这些 $f_i$ 张成的复向量空间维数记为 $\ell$。将 $F$ 按 $w$ 的幂展开可得

$$
\ell\le\deg_wF+1<x/k+1.
$$

通过消去最高次项，可以选到次数两两不同的首一基 $g_1,\ldots,g_\ell$。它们的 Wronskian 是

$$
W(z)=\det\bigl(g_b^{(a)}(z)\bigr)_{
0\le a<\ell,\ 1\le b\le\ell}.
$$

这一步需要同时抓住三个事实。

1. **$W\ne0$。** 若 $d_b=\deg g_b$，最高次项的系数为
   $$
   \det\bigl(d_b(d_b-1)\cdots(d_b-a+1)\bigr)_{a,b}
   =\prod_{b<c}(d_c-d_b)\ne0.
   $$
   原因是每一行对应一个关于 $d_b$ 的首一多项式，次数依次为 $0,1,\ldots,\ell-1$，可化为 Vandermonde 行列式。
2. **$\deg W<\ell x$。** 每个基多项式的次数都小于 $x$，求导只会降低次数。
3. **每个非零 $f_i$ 都迫使 $W$ 在 $\alpha_i$ 处至少有 $\ell$ 重零点。** 将该 $f_i$ 放进一组新基中。它及其前 $\ell-1$ 阶导数，都含因子 $(z-\alpha_i)^\ell$：因为
   $$
   m\ge2\ell-1,
   \qquad m-(\ell-1)\ge\ell.
   $$
   换基仅使 Wronskian 乘以非零常数，不改变零点重数。

因此，$W$ 在超过 $x$ 个互异点上各有至少 $\ell$ 重零点，次数必须超过 $\ell x$，与第二点冲突。这就排除了行关系，也保证能选到所需的非零整数子式 $D$。

一个小计算有助于识别这种行列式：取 $g_1=1,g_2=z,g_3=z^3$，则

$$
W(z)=
\det\begin{pmatrix}
1&z&z^3\\
0&1&3z^2\\
0&0&6z
\end{pmatrix}=6z.
$$

最高次项系数 $6=(1-0)(3-0)(3-1)$，正好对应上述次数的 Vandermonde 乘积。

## 第二页：把同一个整数从两边夹住

现在固定 $D\ne0$，让 $k\le p\le x$ 且 $\chi(p)=-1$。由于 $p\ge k\ge3$，它是奇素数；Euler 判别法与二项式定理给出

$$
\alpha_i^p\equiv\overline\alpha_i
\pmod{p\mathbb Z[\sqrt d]}.
$$

所以 $z^p-w$ 在所有选点 $(\alpha_i,\overline\alpha_i)$ 上都被 $p$ 整除。它的所有正阶 $z$-导数的系数也都被 $p$ 整除。

对一行 $z^rw^s$，令 $h=\lfloor r/p\rfloor$，换成

$$
z^{r-ph}(z^p-w)^hw^s
=z^rw^s+\sum_{j=1}^h(-1)^j\binom hjz^{r-pj}w^{s+j}.
$$

这里有两项同时成立，缺一项都不能完成证明：

- 乘积求导后，每项仍有 $h$ 个因子各提供一个 $p$，故整行都被 $p^h$ 整除。
- 右边的其他单项式仍在 $\mathcal T$ 中，因为其权为 $r+ks+j(k-p)\le r+ks<x$，且 $z$-次数更小。所以这是整系数幺三角换行，保留所选子式的值。

例如 $p=3,r=7,s=1$，新行对应

$$
z(z^3-w)^2w=z^7w-2z^4w^2+zw^3.
$$

这给出

$$
p^{\sum_{(r,s)\in\mathcal T}\lfloor r/p\rfloor}\mid D.
$$

各素数的整除信息可对同一个 $D$ 累加。令

$$
U=\sum_{(r,s)\in\mathcal T}r.
$$

利用 $\lfloor r/p\rfloor\ge r/p-1$、Chebyshev 估计与补回小素数，得到

$$
A_\chi(x)\le\frac{\log|D|}{U}+\log k+O(1).
$$

另一方面，共轭点小使第 $(r,s)$ 行的系数有上界

$$
x^{2x/k}B^{r+s}\le B^r(x^2B)^{x/k}.
$$

取 $k=\lceil\log(x^2B)\rceil$，最后一个额外因子不超过 $e^x$。行列式展开再给出

$$
\log|D|\le U\log B+O(x|\mathcal T|).
$$

原文通过 $\mathcal T$ 内的一个小矩形证明
$U\gg x^3/k$、$|\mathcal T|\ll x^2/k$，所以 $x|\mathcal T|=O(U)$。因此

$$
A_\chi(x)\le\log B+\log k+O(1)
=\frac12\log x+\frac14\log q+\log\log x+O(1).
$$

小 $x$ 的范围在原文开头已用 Mertens 估计处理。精读时留意参数次序：先处理小范围，在其余范围选 $B$，最后选 $k$；不能一开始就把 $k$ 当作与 $x,q$ 无关的常数。

## 第三页：从素数和走到实零点

这一页适合按三个接口读，而不是逐行背公式。令 $\sigma=1+\eta$，其中 $0<\eta\le1$。

**接口一：分部求和。** 将 Theorem 1 转成收敛的素数级数：

$$
S_-(\eta):=\sum_{\chi(p)=-1}\frac{\log p}{p^{1+\eta}}
=\eta\int_1^\infty\frac{A_\chi(t)}{t^{1+\eta}}\,dt
\le\frac1{2\eta}+\frac14\log q+O(\log(2/\eta)).
$$

主项来自
$\eta\int_1^\infty(\log t)t^{-1-\eta}dt=1/\eta$。处理 $\log\log(3t)$ 时，将 $\eta t^{-1-\eta}dt$ 看成概率测度，用对数函数的凹性得到

$$
\eta\int_1^\infty\frac{\log\log(3t)}{t^{1+\eta}}dt
\le\log(\log3+\eta^{-1}).
$$

**接口二：Euler 乘积的对数导数。** 对 $\sigma>1$，可在绝对收敛区域内求导。注意 $L'/L$ 前的负号：

$$
\frac{L'}L(\sigma,\chi)
=-\sum_p\sum_{m\ge1}\frac{\chi(p)^m\log p}{p^{m\sigma}}.
$$

将 $m=1$ 的项按 $\chi(p)=1,-1,0$ 分开；高次素数幂贡献 $O(1)$，$p\mid q$ 的素数贡献 $O(\log\log(3q))$。结合 $-\zeta'/\zeta(1+\eta)=\eta^{-1}+O(1)$，便有

$$
\frac{L'}L(1+\eta,\chi)
=2S_-(\eta)-\frac1\eta+O(\log\log(3q))
\le\frac12\log q
+O\bigl(\log(2/\eta)+\log\log(3q)\bigr).
$$

值得检查的是 $1/\eta$ 的抵消：$S_-$ 的主项是 $1/(2\eta)$，乘以 $2$ 后恰好抵消。这正是前面系数 $1/2$ 在解析部分发挥作用的地方。

**接口三：Hadamard 乘积。** 原文调用 Montgomery–Vaughan 的 Corollary 10.18，保留实零点 $\beta$ 对对数导数的贡献：

$$
\frac1{1-\beta+\eta}
\le\frac{L'}L(1+\eta,\chi)+\frac12\log q+O(1)
\le\log q+O\bigl(\log(2/\eta)+\log\log(3q)\bigr).
$$

其他非平凡零点的相关实部非负，故可舍去；Gamma 因子的相应项在所用区域一致有界。这一接口需要整函数与 $L$ 函数的标准理论，不能仅由前两页的有限维线性代数推出。

最后取 $\eta=(\log q)^{-2}$。设 $L=\log q$，则右端为 $L+O(\log L)$，取倒数并减去 $\eta$ 后，得到

$$
(1-\beta)L\ge1-O\!\left(\frac{\log L}{L}\right)
\qquad(q\to\infty).
$$

这先给出充分大导子的一致下界。剩余有限多个导子的特征，用零点的孤立性分别取得正间隙，再取有限个常数的最小值，即得到全文的绝对常数 $c>0$。

## 读完后检验自己是否抓住主线

可以合上文章，用下面三个问题自检：

1. 若只能证明矩阵的模 $p$ 秩很小，却没有证明 $D\ne0$，为什么还不能比较素数整除与大小？
2. 换行时为什么必须有 $p\ge k$？请直接计算替换单项式的权，指出条件用在哪里。
3. 若把 Theorem 1 的 $\frac12\log x$ 换成 $\log x$，第 3 页的 $1/\eta$ 项还会抵消吗？

核对要点：第 1 问中零行列式可被任意素数幂整除，不能用它的绝对值限制这些素数幂的乘积；第 2 问用到 $j(k-p)\le0$；第 3 问会留下 $1/\eta$ 项，不能照原文方式得出这条零点间隙。

“三页”压缩的是展开过程。真正需要读通的动作是：造出非零整数，利用 $\chi(p)=-1$ 产生整除性，再把所得素数和估计送入解析接口。这份导读补充这些衔接与局部计算，没有把它当成全篇独立证明审计或 Lean 验证。

## 对照材料

- [三页稿公开原帖](https://x.com/AcerFur/status/2112239827077026128)：本文所解释的版本，包含完整三张页图。
- [Green，On Landau–Siegel zeros，Hexagon 2610.00311v2](https://hexagonmath.org/2610.00311v2)：五页前序版本；可对照行列式构造及结式方法。
- [Montgomery–Vaughan，Multiplicative Number Theory I: Classical Theory](https://doi.org/10.1017/CBO9780511618314)：原稿参考文献 [4]。原稿具体引用 Corollary 2.6、Theorem 2.7(b)、Theorem 9.13 和 Corollary 10.18；本次未逐章独立核读整本教材。
