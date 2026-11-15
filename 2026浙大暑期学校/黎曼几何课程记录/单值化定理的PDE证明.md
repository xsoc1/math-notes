---
title: 单值化定理的PDE证明
date: 2026-07-06
tags:
  - 数学
  - 微分几何
  - 偏微分方程
  - 变分法
  - 复分析
aliases:
  - Uniformization Theorem Proof
  - 单值化定理的证明框架
---

# 单值化定理的 PDE 证明框架

> [!note] 返回 [[单值化定理|单值化定理（总览）]]

> [!abstract] 本章目标
> 给出紧致定向二维黎曼曲面单值化定理的完整 PDE 与复分析证明框架。核心思想是：利用等温坐标与共形变换下的曲率公式，将“在给定共形类中寻找常高斯曲率度量”的几何问题，精确转化为求解紧致曲面上一个半线性椭圆型偏微分方程（Liouville 型方程）$-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}$ 的分析问题。根据亏格 $g$ 所决定的 $\Lambda$ 符号，分三种情形展开证明框架——平坦情形（$g=1$：线性 Poisson 方程与 Hodge/Fredholm 可解性理论）、负曲率情形（$g \ge 2$：直接变分法与严格凸强制能量泛函）、正曲率情形（$g=0$：Green 函数与全纯/亚纯函数构造双全纯同构 $\Sigma \xrightarrow{\cong} \mathbb{CP}^1$）。

## 1. 从几何问题到偏微分方程 (PDE)

### 1.1 基本设定

设 $(\Sigma, g_0)$ 是一个紧致连通可定向无边二维黎曼流形（配备初始背景黎曼度量 $g_0$）。由 [[二维曲面的拓扑与复结构#2. 等温坐标系 (Isothermal Coordinates)|等温坐标系与保角结构]] 的讨论，我们希望在背景度量 $g_0$ 所在的共形等价类 $[g_0]$ 中寻找一个共形变形后的新度量：

$$g = e^{2u} g_0,$$

其中待求共形因子 $u \in C^\infty(\Sigma)$ 是 $\Sigma$ 上的全局光滑实值函数，使得新度量 $g$ 在整个曲面上具有**常数高斯曲率** $K_g \equiv \Lambda$。

### 1.2 导出核心共形曲率方程

在局部等温坐标系下（见 [[二维曲面的拓扑与复结构#2.1 高斯曲率在等温坐标下的表达式]]），度量共形变换 $g = e^{2u} g_0$ 下高斯曲率的变化规律由如下全局内蕴公式给出：

$$K_g = e^{-2u}\left(K_{g_0} - \Delta_{g_0} u\right),$$

其中 $K_g$ 是新度量 $g$ 的高斯曲率，$K_{g_0}$ 是背景度量 $g_0$ 的已知高斯曲率，而 $\Delta_{g_0}$ 是背景度量 $g_0$ 下的 Laplace-Beltrami 算子（此处采用分析学家的标准符号约定：$\Delta_{g_0} = \operatorname{div}_{g_0} \nabla_{g_0} = \frac{1}{\sqrt{\det g_0}}\partial_i(\sqrt{\det g_0}\, g_0^{ij}\partial_j)$ 为非正定算子，从而 $-\Delta_{g_0}$ 为非负定算子；部分几何文献记 $-\Delta$ 为正定 Laplace 算子，阅读时注意符号对照）。

令目标高斯曲率恒为常数 $K_g \equiv \Lambda$，将上式两边同乘以 $e^{2u}$，立即得到关于待求函数 $u$ 的偏微分方程：

$$-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}.$$

> [!important] 单值化定理的核心 PDE（Liouville 型曲率方程）
> $$-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}.$$
>
> 这是单值化定理 PDE 证明的核心方程。它是一个定义在紧致无边曲面 $\Sigma$ 上的二阶半线性椭圆型偏微分方程，其中线性主部为椭圆算子 $-\Delta_{g_0}$，非线性项为指数项 $\Lambda e^{2u}$，而常数 $\Lambda$ 的符号则由 [[高斯-博内定理]] 给出的整体拓扑约束唯一锁定。

### 1.3 曲率常数 $\Lambda$ 的符号确定

在方程 $-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}$ 两端关于背景面积元 $dA_{g_0}$ 在整个紧致无边曲面 $\Sigma$ 上积分。由散度定理（Green 公式）可知 $\int_\Sigma \Delta_{g_0} u \, dA_{g_0} = 0$，结合 $dA_g = e^{2u} dA_{g_0}$ 与高斯-博内定理可得：
$$\int_\Sigma \Lambda e^{2u} \, dA_{g_0} = \int_\Sigma \Lambda \, dA_g = \int_\Sigma K_{g_0} \, dA_{g_0} = 2\pi \chi(\Sigma) = 4\pi(1 - g).$$

由于 $\int_\Sigma e^{2u} \, dA_{g_0} > 0$，常数 $\Lambda$ 的正负号必然与欧拉示性数 $\chi(\Sigma) = 2 - 2g$ 严格一致（通过给函数 $u$ 加上适当常数做全局尺度缩放，可将非零 $\Lambda$ 归一化为 $\pm 1$）：

| 亏格 $g$ | 归一化曲率常数 $\Lambda$ | 对应的半线性椭圆 PDE |
|-------|--------------|------|
| $g = 0$（球面拓扑） | $\Lambda > 0$（归一化取 $\Lambda = 1$） | $-\Delta_{g_0} u + K_{g_0} = e^{2u}$ |
| $g = 1$（环面拓扑） | $\Lambda = 0$ | $-\Delta_{g_0} u + K_{g_0} = 0$ |
| $g \ge 2$（高亏格拓扑） | $\Lambda < 0$（归一化取 $\Lambda = -1$） | $-\Delta_{g_0} u + K_{g_0} = -e^{2u}$ |

## 2. 平坦情形 ($g = 1, \Lambda = 0$)

### 2.1 方程退化为线性 Poisson 方程

当亏格 $g = 1$ 时，$\chi(\Sigma) = 0$，故 $\Lambda = 0$。此时右端指数非线性项彻底消失，核心 PDE 退化为一个纯粹的**线性椭圆型方程**：

$$-\Delta_{g_0} u + K_{g_0} = 0,$$

即紧致曲面上的 **Poisson 方程**：
$$\Delta_{g_0} u = K_{g_0}.$$

### 2.2 Fredholm 可解性条件与高斯-博内定理的完美契合

根据紧致流形上自伴椭圆算子 $\Delta_{g_0}$ 的标准 Hodge 理论（或泛函分析中的 Fredholm 择一性定理），线性方程 $\Delta_{g_0} u = f$ 存在光滑解 $u \in C^\infty(\Sigma)$ 的充分必要条件是右端源项 $f$ 与伴随算子核空间 $\ker(\Delta_{g_0}^*) = \ker(\Delta_{g_0})$ 在 $L^2(\Sigma, g_0)$ 中正交。

在紧致连通无边流形 $\Sigma$ 上，由分部积分 $\int_\Sigma |\nabla_{g_0} v|^2 dA_{g_0} = -\int_\Sigma v \Delta_{g_0} v \, dA_{g_0}$ 可知，调和函数（$\Delta_{g_0} v = 0$）必为常数函数，即 $\ker(\Delta_{g_0}) = \mathbb{R} \cdot 1$。因此，Poisson 方程 $\Delta_{g_0} u = f$ 可解的充要相容性条件为：

$$\int_\Sigma f \, dA_{g_0} = 0.$$

将我们的右端项 $f = K_{g_0}$ 代入检验，由亏格 $g = 1$ 的高斯-博内定理立即得到：

$$\int_\Sigma K_{g_0} \, dA_{g_0} = 2\pi \chi(\Sigma) = 2\pi \cdot (2 - 2\times 1) = 0.$$

可解性条件精确满足！因此，由线性椭圆型偏微分方程的存在性与正则性理论（例如在平均值为零的子空间 $H^1_0 = \{u \in H^1(\Sigma) \mid \int_\Sigma u \, dA_{g_0} = 0\}$ 上应用 Lax-Milgram 定理或 Riesz 表示定理结合 Poincaré 不等式得到唯一弱解，再由椭圆正则性提升为光滑解），必存在光滑函数 $u \in C^\infty(\Sigma)$ 满足 $\Delta_{g_0} u = K_{g_0}$；且任意两个解之差为调和函数，故解 $u$ 在相差一个加法常数的意义下唯一（若附加固定总面积条件 $\operatorname{Area}_g(\Sigma) = \int_\Sigma e^{2u} dA_{g_0} = 1$，则解 $u$ 严格唯一）。

### 2.3 几何实现

所得光滑解 $u$ 给出了与 $g_0$ 共形等价的平坦黎曼度量 $g = e^{2u} g_0$（其高斯曲率 $K_g \equiv 0$）。这就严格证明了：任何亏格为 $1$ 的紧致黎曼曲面上都存在唯一的单位面积共形平坦度量。

> [!note] 与复分析及代数几何的经典对应
> 由完备平坦流形的 Killing-Hopf 分类定理，完备紧致定向二维平坦流形 $(\Sigma, g)$ 的万有覆盖等距同构于欧氏平面 $\mathbb{R}^2 \cong \mathbb{C}$，其基本群 $\pi_1(\Sigma) \cong \mathbb{Z}^2$ 作为等距平移群作用在 $\mathbb{C}$ 上生成秩为 $2$ 的离散格 $\Lambda = \mathbb{Z}\omega_1 \oplus \mathbb{Z}\omega_2$。因此在复几何与代数几何中，亏格 $1$ 的紧致黎曼曲面双全纯同构于复环面 $\mathbb{C}/\Lambda$，并通过 Weierstrass $\wp$-函数嵌入 $\mathbb{CP}^2$ 成为光滑三次**椭圆曲线**。

## 3. 负曲率情形 ($g \ge 2, \Lambda = -1$)

当亏格 $g \ge 2$ 时，$\chi(\Sigma) = 2 - 2g < 0$，归一化后取 $\Lambda = -1$，待解方程为：
$$-\Delta_{g_0} u + K_{g_0} = -e^{2u} \iff -\Delta_{g_0} u + K_{g_0} + e^{2u} = 0.$$
这一情形虽然含有指数非线性项 $e^{2u}$，但非线性项前面的符号（移到左端为 $+e^{2u}$）与椭圆算子 $-\Delta_{g_0}$ 的正定符号同向，赋予了方程极其优良的分析性质（既满足比较原理/极大值原理，又具有严格凸的变分结构）。以下我们采用**直接变分法**（Direct Method in the Calculus of Variations）：将 PDE 解释为某个严格凸能量泛函的 Euler-Lagrange 方程（详见 [[2026浙大暑期学校/黎曼几何课程记录/作业/作业2|黎曼几何作业 2 Q1]] 的详细变分计算）。

### 3.1 Liouville 能量泛函与 Euler-Lagrange 方程

在 Sobolev 空间 $H^1(\Sigma) = W^{1,2}(\Sigma, g_0)$ 上定义 **Liouville 能量泛函**（注：按 $\Lambda = -1$ 的方程 $-\Delta_{g_0} u + K_{g_0} + e^{2u} = 0$，指数势能项在泛函中取 $+\frac{1}{2}\int_\Sigma e^{2u} dA_{g_0}$；若原讲义记作 $-\int e^{2u}dA$ 则对应 $\Lambda=+1$ 的符号，此处按一阶、二阶变分与 $\Lambda=-1$ 自洽的形式完整写出）：

$$\mathcal{E}(u) = \frac{1}{2} \int_\Sigma |\nabla_{g_0} u|^2 \, dA_{g_0} + \int_\Sigma K_{g_0} u \, dA_{g_0} + \frac{1}{2} \int_\Sigma e^{2u} \, dA_{g_0}.$$

> [!note] 一阶变分与 Euler-Lagrange 方程
> 对任意测试函数 $\varphi \in C^\infty(\Sigma)$，计算泛函 $\mathcal{E}$ 在 $u$ 处沿方向 $\varphi$ 的一阶变分（方向导数）：
> $$\frac{d}{dt}\bigg|_{t=0} \mathcal{E}(u + t\varphi) = \int_\Sigma \left( \langle \nabla_{g_0} u, \nabla_{g_0} \varphi \rangle_{g_0} + K_{g_0}\varphi + e^{2u}\varphi \right) dA_{g_0} = \int_\Sigma \left( -\Delta_{g_0} u + K_{g_0} + e^{2u} \right) \varphi \, dA_{g_0}.$$
>
> 因此，泛函 $\mathcal{E}$ 的临界点（满足对一切 $\varphi$ 一阶变分为零的 $u$）恰好满足方程 $-\Delta_{g_0} u + K_{g_0} = -e^{2u}$，即 $\Lambda = -1$ 时的核心 Liouville 方程！

### 3.2 泛函的凸性、强制性与下界性分析

> [!note] 定理：当 $g \ge 2$（$\int_\Sigma K_{g_0} dA_{g_0} < 0$）且 $\Lambda = -1$ 时，泛函 $\mathcal{E}$ 在 $H^1(\Sigma)$ 上是严格凸、弱下半连续且强制（coercive）的。
>
> 1. **严格凸性（Strict Convexity）**：对任意非零测试函数 $\varphi \not\equiv 0$，继续对 $t$ 求导计算二阶变分：
>    $$\frac{d^2}{dt^2}\bigg|_{t=0} \mathcal{E}(u + t\varphi) = \int_\Sigma \left( |\nabla_{g_0} \varphi|^2 + 2 e^{2u} \varphi^2 \right) dA_{g_0} > 0 \quad (\forall \varphi \not\equiv 0).$$
>    由于二阶变分对任意非零 $\varphi$（包括非零常数函数，因为 $2e^{2u}\varphi^2 > 0$）均严格为正，泛函 $\mathcal{E}$ 在整个空间 $H^1(\Sigma)$ 上是**严格凸**的。这立即保证了临界点若存在则必**全局唯一**。
> 2. **强制性（Coercivity）与下界性**：将任意 $u \in H^1(\Sigma)$ 分解为平均值 $\bar{u} = \frac{1}{\operatorname{Area}(\Sigma)}\int_\Sigma u \, dA_{g_0}$ 与零均值振荡部 $w = u - \bar{u}$（满足 $\int_\Sigma w \, dA_{g_0} = 0$）。在常数方向 $\bar{u}$ 上，由于 $g \ge 2$ 时总曲率 $\int_\Sigma K_{g_0} dA_{g_0} = 2\pi\chi(\Sigma) = -4\pi(g-1) < 0$：
>    - 当 $\bar{u} \to -\infty$ 时，线性项 $\bar{u}\int_\Sigma K_{g_0} dA_{g_0} = 4\pi(g-1)|\bar{u}| \to +\infty$；
>    - 当 $\bar{u} \to +\infty$ 时，指数项 $\frac{1}{2}\int_\Sigma e^{2u} dA_{g_0} \ge \frac{1}{2}\operatorname{Area}(\Sigma) e^{2\bar{u}} \to +\infty$（由 Jensen 不等式）；
>    - 在零均值子空间 $w \in H^1_0$ 上，由 Poincaré 不等式知 $\int_\Sigma |\nabla_{g_0} w|^2 dA_{g_0}$ 控制 $\|w\|_{H^1}^2$，且二维紧流形上的 **Moser-Trudinger 不等式**（二维临界 Sobolev 嵌入定理：对任意 $u \in H^1(\Sigma)$ 有 $e^{2u} \in L^p(\Sigma), \, \forall p < \infty$）保证了泛函在 $H^1(\Sigma)$ 上处处有限且满足强制性估计：存在常数 $C_1, C_2 > 0$，使得
>      $$\mathcal{E}(u) \ge C_1 \|\nabla_{g_0} w\|_{L^2}^2 + C_1 |\bar{u}| - C_2 \to +\infty \quad (\text{当 } \|u\|_{H^1(\Sigma)} \to \infty).$$
>    这保证了泛函 $\mathcal{E}$ 在 $H^1(\Sigma)$ 上有有限下界，且任何极小化序列都不会逃逸到无穷远。

### 3.3 极小值点的存在性、正则性与唯一性

结合上述凸性、强制性与下界性，直接变分法（Direct Method）的标准步骤给出完整证明：

1. **取极小化序列**：由于 $\inf_{H^1(\Sigma)} \mathcal{E} > -\infty$，存在极小化序列 $\{u_n\} \subset H^1(\Sigma)$ 使得 $\mathcal{E}(u_n) \to \inf_{H^1(\Sigma)} \mathcal{E}$；
2. **先验有界与弱收敛子列**：由强制性可知 $\{u_n\}$ 在自反 Hilbert 空间 $H^1(\Sigma)$ 中一致有界，故由 Alaoglu 弱紧性定理存在子列（仍记为 $u_n$）在 $H^1(\Sigma)$ 中弱收敛于某函数 $u_* \in H^1(\Sigma)$，且由 Rellich-Kondrachov 紧嵌入定理在 $L^2(\Sigma)$ 中强收敛；
3. **弱下半连续性与达到极小值**：由于 $\mathcal{E}$ 是连续凸泛函（且由 Moser-Trudinger 不等式指数项弱下半连续），有 $\mathcal{E}(u_*) \le \liminf_{n\to\infty} \mathcal{E}(u_n) = \inf \mathcal{E}$，故 $u_* \in H^1(\Sigma)$ 是 $\mathcal{E}$ 的全局极小值点，从而是方程 $-\Delta_{g_0} u_* + K_{g_0} = -e^{2u_*}$ 的弱解；
4. **椭圆正则性提升（Bootstrap）**：由于二维下 $u_* \in H^1(\Sigma) \implies e^{2u_*} \in L^p(\Sigma)$（$\forall 1 \le p < \infty$），由椭圆方程的 Calderón-Zygmund $L^p$ 估计知 $u_* \in W^{2,p}(\Sigma)$，再由 Sobolev 嵌入得 $u_* \in C^{1,\alpha}(\Sigma)$，进而右端项光滑，通过 Schauder 估计反复自举（bootstrap）即得 $u_* \in C^\infty(\Sigma)$ 是经典光滑解；
5. **唯一性**：由泛函的严格凸性（或直接对两个解之差 $w = u_1 - u_2$ 满足的方程 $-\Delta_{g_0} w + (e^{2u_1} - e^{2u_2}) = 0$ 在最大值与最小值点应用极值原理），光滑解 $u_*$ 全局唯一。

> [!important] 负曲率情形结论
> 对于任意亏格 $g \ge 2$ 的紧致定向黎曼曲面 $(\Sigma, g_0)$，在其共形类中存在**唯一**的光滑函数 $u \in C^\infty(\Sigma)$，使得 $g = e^{2u} g_0$ 是具有常负高斯曲率 $K_g \equiv -1$ 的完备双曲度量。

### 3.4 几何解释：万有覆盖与双曲商空间

常数高斯曲率 $K_g \equiv -1$ 的完备黎曼度量赋予了紧致曲面 $\Sigma$ 一个典则的**双曲几何结构**。根据完备常曲率流形的 Killing-Hopf 定理，$(\Sigma, g)$ 的单连通万有覆盖流形 $(\widetilde{\Sigma}, \tilde{g})$ 必等距同构于标准双曲平面 $\mathbb{H}^2$（即配备双曲度量的 Poincaré 上半平面或单位圆盘），而原曲面 $\Sigma$ 则等距（且双全纯）同构于双曲平面模去无挠离散余紧等距Fuchs群 $\Gamma \cong \pi_1(\Sigma) \subset \operatorname{PSL}(2, \mathbb{R})$ 的商空间 $\mathbb{H}^2 / \Gamma$。

## 4. 正曲率情形 ($g = 0, \Lambda = 1$)

当亏格 $g = 0$（球面拓扑，$\chi(\Sigma) = 2 > 0$）时，归一化后取 $\Lambda = +1$，此时共形曲率方程为：

$$-\Delta_{g_0} u + K_{g_0} = e^{2u}.$$

这是三种情形中分析性质最微妙、最困难的情形（也是球面预定高斯曲率 Nirenberg 问题的背景原型）。此时前面针对负曲率使用的直接变分法**不再直接适用**：
- 当 $\Lambda = +1$ 时，泛函中指数项变号为 $-\frac{1}{2}\int_\Sigma e^{2u} dA_{g_0}$，当 $\bar{u} \to +\infty$ 时指数项趋于 $-\infty$，导致能量泛函在 $H^1(\Sigma)$ 上**下方无界**且**失去凸性**；
- 在幾何上，由于黎曼球面 $\mathbb{CP}^1 \cong S^2$ 具有非紧的共形自同构群（Möbius 变换群 $\operatorname{PSL}(2, \mathbb{C})$），常曲率 $+1$ 的共形度量在共形类内不是唯一的（相差球面 Möbius 共形变换拉回），极小化序列可能发生能量集中与“冒泡爆破”（bubbling blow-up）。

因此在经典单值化证明中，处理 $g = 0$ 最简洁优雅的途径是结合椭圆算子（Green 函数）与**复分析/黎曼曲面理论**。

### 4.1 总体证明策略

核心思路：不直接在非凸泛函上硬求临界点，而是利用椭圆 PDE（Hodge 理论 / Green 函数）在亏格 $0$ 黎曼曲面上直接构造一个单极点的全局亚纯函数，从而证明任何亏格为 $0$ 的紧致黎曼曲面 $\Sigma$ 必双全纯同构于标准黎曼球面 $\mathbb{CP}^1 \cong S^2$。

**证明路线图**：

1. 在紧致定向曲面 $(\Sigma, g_0)$（亏格 $g = 0$）上，由 $g_0$ 诱导相容的复结构 $J$（参见 [[二维曲面的拓扑与复结构#3.2 复结构|复结构]]），将 $\Sigma$ 视为紧致黎曼曲面；
2. 利用 Laplace 算子的 Green 函数在 $\Sigma$ 上构造一个仅在单点 $p \in \Sigma$ 处具有一阶（简单）极点的全局亚纯函数 $f: \Sigma \to \mathbb{CP}^1 = \mathbb{C} \cup \{\infty\}$，并证明 $f$ 是双全纯同构；
3. 将标准单位球面 $S^2 \cong \mathbb{CP}^1$ 上的常正曲率 $K \equiv 1$ 度量（圆球度量 / 归一化 Fubini-Study 度量）通过双全纯同构 $f$ 拉回至 $\Sigma$，即得与 $g_0$ 共形等价的常曲率 $+1$ 度量。

### 4.2 用 Green 函数与调和微分构造双全纯同构 $f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$

**步骤 1：选取一点 $p \in \Sigma$ 并构造带偶极奇性的调和函数（或 Green 函数导数）**

任取一点 $p \in \Sigma$，并在 $p$ 附近取一个局部全纯（等温）坐标卡 $(U, z)$，使得 $z(p) = 0$。为了在 $\Sigma \setminus \{p\}$ 上构造一个在 $p$ 处具有简单极点主部 $\frac{1}{z}$ 的全纯函数，我们在分布（或通过截断函数光滑化右端源项后求解椭圆 Poisson 方程）意义下考虑围绕点 $p$ 的偶极奇性调和函数（即 Green 函数 $G_p$ 沿实轴方向的导数，满足在 $\Sigma \setminus \{p\}$ 上 $\Delta_{g_0} u_1 = 0$，且在 $z \to 0$ 附近具有奇性主部 $\operatorname{Re}\left(\frac{1}{z}\right) = \frac{x}{x^2+y^2}$）。

更具体地，取紧支在 $U$ 内、在 $z=0$ 邻域恒为 $1$ 的光滑截断函数 $\chi$，令 $\psi = \chi \cdot \operatorname{Re}(1/z)$。在 $\Sigma \setminus \{p\}$ 上，$\Delta_{g_0} \psi$ 在 $p$ 附近恒为零（因为 $\operatorname{Re}(1/z)$ 在等温坐标下是调和函数），故 $\varphi := \Delta_{g_0} \psi$ 可光滑延拓为整个 $\Sigma$ 上的光滑函数，且由散度定理满足积分相容性条件 $\int_\Sigma \varphi \, dA_{g_0} = 0$。由第 2 节緊流形上线性 Poisson 方程的可解性，存在光滑函数 $v \in C^\infty(\Sigma)$ 满足 $\Delta_{g_0} v = \varphi$。于是函数
$$u_1 := \psi - v \in C^\infty(\Sigma \setminus \{p\})$$
在 $\Sigma \setminus \{p\}$ 上处处调和（$\Delta_{g_0} u_1 = 0$），且在点 $p$ 附近具有精确的奇性展开：
$$u_1(z) = \operatorname{Re}\left(\frac{1}{z}\right) + \text{光滑项}.$$

**步骤 2：构造闭的共轭调和 1-形式**

在去点曲面 $\Sigma \setminus \{p\}$ 上，考察调和函数 $u_1$ 的外微分 $du_1$ 及其 Hodge 星算子对偶 1-形式 $*du_1$（在局部等温坐标下 $*\,dx = dy, \; *\,dy = -dx$）。由于 $u_1$ 在 $\Sigma \setminus \{p\}$ 上是调和的，有：
$$d(*du_1) = (\Delta_{g_0} u_1) \, dA_{g_0} = 0,$$
这表明 1-形式 $*du_1$ 在 $\Sigma \setminus \{p\}$ 上是一个**闭 1-形式**（closed 1-form）。

**步骤 3：利用亏格 $g = 0$ 的单连通性消除单值性（周期）障碍**

一般而言，要将闭 1-形式 $*du_1$ 积分成全局单值的共轭调和函数 $u_2$（满足 $du_2 = *du_1$），必须验证 $*du_1$ 沿着 $\Sigma \setminus \{p\}$ 上一切闭回路的周期积分为零。
- 对于围绕点 $p$ 的小圆周 $\gamma_\varepsilon = \{|z| = \varepsilon\}$，由于主部 $\operatorname{Re}(1/z)$ 本身就是全局单值全纯函数 $1/z$ 的实部，其共轭形式 $*d\operatorname{Re}(1/z) = d\operatorname{Im}(1/z)$ 沿 $\gamma_\varepsilon$ 的积分为零；
- 对于 $\Sigma \setminus \{p\}$ 上的其他非平凡闭回路：因为 $\Sigma$ 的亏格 $g = 0$，由曲面拓扑分类知 $\Sigma$ 同胚于二维球面 $S^2$，挖去单点 $p$ 后的空间 $\Sigma \setminus \{p\} \cong \mathbb{R}^2$ 是**单连通**的（$H_1(\Sigma \setminus \{p\}; \mathbb{Z}) = 0$）！

因此，闭 1-形式 $*du_1$ 在单连通空间 $\Sigma \setminus \{p\}$ 上必为**恰当 1-形式**，即存在全局单值的光滑调和共轭函数 $u_2 \in C^\infty(\Sigma \setminus \{p\})$ 使得 $du_2 = *du_1$。

**步骤 4：获得双全纯同构 $f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$**

由 $du_2 = *du_1$（即 Cauchy-Riemann 方程），复值函数
$$f := u_1 + i u_2: \Sigma \setminus \{p\} \to \mathbb{C}$$
是 $\Sigma \setminus \{p\}$ 上的全局单值全纯函数，且在点 $p$（$z=0$）附近具有 Laurent 主部展开 $f(z) = \frac{1}{z} + \text{全纯项}$，即在 $p$ 处恰好有一个一阶简单极点（令 $f(p) = \infty$）。

这就给出了一个非常数的全局全纯映射（即一阶亚纯函数）：
$$f: \Sigma \to \mathbb{CP}^1 = \mathbb{C} \cup \{\infty\}.$$
由于紧致黎曼曲面之间的非常数全纯映射必为满射，且它在无穷远点 $\infty \in \mathbb{CP}^1$ 的原像仅有单点 $p$（重数为 $1$），故映射 $f$ 的拓扑映射度 $\deg(f) = 1$。在紧致黎曼曲面之间，映射度为 $1$ 的全纯映射必是双射且处处导数非零（由局部开映射定理与逆映射定理），因此
$$f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$$
是一个**双全纯同构**（从而也是保角微分同胚）！（**方法辨析**：为什么本证法在步骤 1 中构造的是偶极奇性主部 $\operatorname{Re}(1/z)$，而不是直接使用对数型归一化 Green 函数 $G_p$？因为在紧致无边曲面 $\Sigma$ 上，对数型 Green 函数满足 $\Delta_{g_0} G_p = \delta_p - \frac{1}{\operatorname{Area}(\Sigma)}$，在去点曲面 $\Sigma \setminus \{p\}$ 上有 $\Delta_{g_0} G_p = -\frac{1}{\operatorname{Area}(\Sigma)} \neq 0$，并非调和函数，故其共轭 1-形式 $*dG_p$ 在 $\Sigma \setminus \{p\}$ 上**不是闭形式**，无法积分出调和共轭函数 $H$ 来构造全局亚纯函数；反之，一阶偶极主部 $\operatorname{Re}(1/z)$ 绕点 $p$ 的通量为零，能够在 $\Sigma \setminus \{p\}$ 上解出严格调和的 $u_1$ 并使 $*du_1$ 成为闭 1-形式。）

### 4.3 拉回标准圆球度量

在标准黎曼球面 $\mathbb{CP}^1 \cong S^2$ 上，配备常高斯曲率 $K \equiv 1$ 的标准圆球度量（即归一化的 Fubini-Study 度量，在球极投影复坐标 $w \in \mathbb{C}$ 下表示为 $g_{\mathbb{CP}^1} = \frac{4 |dw|^2}{(1 + |w|^2)^2}$）。通过双全纯同构 $f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$ 将该标准度量拉回至 $\Sigma$：

$$g := f^* g_{\mathbb{CP}^1}.$$

因为 $f$ 关于背景度量 $g_0$ 诱导的复结构是双全纯（即保角）的，拉回度量 $g$ 必然与 $g_0$ 共形等价（存在 $u \in C^\infty(\Sigma)$ 使得 $g = e^{2u} g_0$）；同时因为等距映射保持高斯曲率不变，$( \Sigma, g )$ 与 $(\mathbb{CP}^1, g_{\mathbb{CP}^1})$ 等距同构，故恒有 $K_g \equiv 1$，从而所对应的共形因子 $u$ 自动给出了正曲率 Liouville 方程 $-\Delta_{g_0} u + K_{g_0} = e^{2u}$ 的光滑解！

### 4.4 解的几何结构（在 Möbius 共形变换群下的唯一性）

对于正曲率情形（$g = 0$），由于黎曼球面的全纯自同构群是复三维的 Möbius 变换群 $\operatorname{Aut}(\mathbb{CP}^1) = \operatorname{PSL}(2, \mathbb{C})$（它包含不仅限于旋转 $\operatorname{SO}(3)$ 的共形拉伸变换），若 $g = f^* g_{\mathbb{CP}^1}$ 是共形类内 $K \equiv 1$ 的度量，则对任意 Möbius 变换 $\phi \in \operatorname{PSL}(2, \mathbb{C})$，复合拉回度量 $(\phi \circ f)^* g_{\mathbb{CP}^1}$ 依然属于同一个共形类且同样满足 $K \equiv 1$。反之，若 $g_1, g_2$ 均为同一共形类内满足 $K \equiv 1$ 的完备度量，则恒等映射 $\operatorname{id}: (\Sigma, g_1) \to (\Sigma, g_2)$ 诱导了标准球面 $S^2$ 到自身的保定向共形微分同胚，故两个常曲率 $+1$ 共形度量仅相差一个球面 Möbius 共形自同构 $\phi \in \operatorname{PSL}(2, \mathbb{C})$ 的拉回。

## 5. 证明框架总结

| 亏格 $g$ | 归一化曲率 $\Lambda$ | 核心求解方法 | 关键数学工具 |
|------|-----------|------|----------|
| **$g = 0$** | $+1$ | 复分析 + 椭圆算子 | 偶极奇性调和函数/Green 函数、Hodge 星算子、单连通消周期、双全纯同构 $f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$ |
| **$g = 1$** | $0$ | 线性椭圆 PDE | 线性 Poisson 方程 $\Delta_{g_0} u = K_{g_0}$、Fredholm 择一性可解条件（由高斯-博内 $\int K_{g_0}dA_{g_0}=0$ 保证） |
| **$g \ge 2$** | $-1$ | 非线性变分直接法 | Liouville 能量泛函 $\mathcal{E}(u)$、二阶变分正定性（严格凸性）+ 强制性 + Moser-Trudinger 下界估计 |

> [!tip] 几何与分析的深刻统一性
> 三种亏格情形虽然采用了看似迥异的证明手段，但它们在底层完全共享同一个几何分析方程 $-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}$。不同数学工具的登场，完全是由拓扑欧拉示性数 $\chi(\Sigma) = 2 - 2g$ 决定的常数 $\Lambda$ 符号对非线性椭圆算子分析特性的改变所驱动的：
> - **$\Lambda = 0$（临界平衡）**：非线性项消失，退化为线性 Fredholm 算子理论；
> - **$\Lambda < 0$（散焦/稳定非线性）**：非线性项与椭圆主部同号，赋予泛函严格凸性与先验界，变分直接法一举奏效；
> - **$\Lambda > 0$（聚焦/临界非紧非线性）**：泛函下方无界且伴随非紧共形群 $\operatorname{PSL}(2,\mathbb{C})$ 作用，借助复分析全纯结构实现突围。

## 6. 与卡拉比猜想及 Nirenberg 问题的联系

> [!note] 历史与前沿延伸注记
> 1. **与卡拉比猜想（Calabi Conjecture）及 Kähler-Einstein 问题的联系**：单值化定理是高维复几何中寻求典则 **Kähler-Einstein 度量**在一维复流形（即实二维曲面）上的原型，并与 **Calabi 预定里奇形式定理**密切相关但有明确区别。在紧致 Kähler 流形 $(M, \omega_0)$ 上，Calabi 预定里奇形式猜想（由丘成桐 S.-T. Yau 于 1976 年证明，见 [PNAS 74 (1977), 1798–1799](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/bourbaki_190316/PNAS-1977-Yau-1798-9.pdf)）固定一个给定的闭实 $(1,1)$-形式 $\rho \in 2\pi c_1(M)$，证明在固定 Kähler 上同调类中存在唯一的 Kähler 形式 $\omega$ 使 $\operatorname{Ric}(\omega) = \rho$；而在二维曲面的单值化问题中，里奇形式为 $\rho_g = K_g \, dA_g$，要求高斯曲率 $K_g \equiv \Lambda$ 为常数时，右端形式 $\Lambda \, dA_g = \Lambda e^{2u} dA_{g_0}$ 本身依赖于待求的未知度量（而非预先固定给定的 2-形式 $\rho$），这在一维复流形上恰对应于 **Kähler-Einstein 方程** $\operatorname{Ric}(\omega) = \Lambda \omega$：仅在 $g=1$（$c_1=0$，取 $\Lambda=0,\rho=0$）时两者直接重合；在 $g \ge 2$（$c_1 < 0$）时对应负第一陈类的 Aubin-Yau Kähler-Einstein 存在唯一性定理；而在 $g=0$（$c_1 > 0$，球面 $S^2$）时，常曲率 $K \equiv 1$ 度量在固定面积与共形类下仅模去非紧 Möbius 自同构群 $\operatorname{PSL}(2,\mathbb{C})$ 唯一，而非作为单个度量张量严格唯一。
> 2. **与球面预定高斯曲率 Nirenberg 问题及高阶椭圆方程爆破分析的联系**：在二维球面 $(S^2, g_0)$ 上，若将单值化方程中的常数 $\Lambda$ 替换为球面上的给定非常数光滑函数 $K(x)$，询问何时存在共形度量 $g = e^{2u} g_0$ 以 $K(x)$ 为其高斯曲率，即求解非线性椭圆方程
>    $$-\Delta_{g_0} u + 1 = K(x) e^{2u} \quad (\text{在 } S^2 \text{ 上}),$$
>    这就是几何分析中著名的**球面 Nirenberg 问题**；其在四维共形几何中的高阶对应则是主部为双拉普拉斯算子 $\Delta^2$ 的四阶 **Paneitz $Q$-曲率方程**（按 [S.-Y. A. Chang, *Conformal Invariants and Partial Differential Equations*, AMS, pp. 10–11](https://web.math.princeton.edu/~chang/05.pdf) 的标准约定写作 $P_{g_0} u + 2Q_{g_0} = 2Q_g e^{4u}$，其中四阶共形协变算子——Paneitz 算子在本篇 $\Delta_g = \operatorname{div}_g\nabla_g$ 约定下写作 $P_g \psi = \Delta_g^2 \psi - \operatorname{div}_g\Bigl[\bigl(\frac{2}{3}S_g g - 2\operatorname{Ric}_g\bigr)\nabla_g \psi\Bigr]$（若沿用 Chang 原文的上散度记号 $\delta = -\operatorname{div}_g$ 则写作 $\Delta_g^2 \psi + \delta\bigl((\frac{2}{3}S_g g - 2\operatorname{Ric}_g)d\psi\bigr)$，见 [Chang–Ge–Qing 2020, p. 3](https://web.math.princeton.edu/~chang/19cgq-20200714R1.pdf)），除主部 $\Delta_g^2$ 外还含有二阶曲率修正项；例如在单位圆球 $S^4$（$S_{g_0}=12, \, \operatorname{Ric}_{g_0}=3g_0$，括号项为 $2g_0$）上记 $L = -\Delta_{g_0}$，则 $P_{g_0}\psi = \Delta_{g_0}^2\psi - 2\Delta_{g_0}\psi = L(L+2)\psi$ 而非单纯的 $L^2\psi$）。由于球面共形变换群 $\operatorname{PSL}(2,\mathbb{C})$ 非紧，除了高斯-博内必要条件 $\max_{S^2} K > 0$ 外，解还必须满足非平凡的 **Kazdan-Warner 积分阻塞恒等式** $\int_{S^2} \langle \nabla K, \nabla x_i \rangle e^{2u} dA_{g_0} = 0$（从而排除了如 $K(x) = 1 + \varepsilon x_3$ 这类单调函数），其存在性证明框架高度依赖于椭圆方程解序列的**爆破分析**（blow-up analysis）、集中紧性原理（concentration-compactness）以及无穷远处的拓扑度/Morse 理论计算。
