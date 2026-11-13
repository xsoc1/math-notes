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
> 给出单值化定理的完整证明框架。核心方法是：在等温坐标下，将寻找常曲率度量的问题转化为求解一个半线性椭圆型偏微分方程（Liouville 方程）。按亏格分为三种情形分别处理——平坦情形（线性 Poisson 方程）、负曲率情形（变分法 + 凸泛函）、正曲率情形（复分析 + 全纯函数构造）。

## 1. 从几何到 PDE

### 1.1 基本设定

设 $(\Sigma, g_0)$ 是一个紧致定向二维黎曼曲面。在 [[二维曲面的拓扑与复结构#2. 等温坐标系 (Isothermal Coordinates)|等温坐标系]] 下，任意度量 $g$ 可以写作：

$$g = e^{2u} g_0$$

其中 $u \in C^\infty(\Sigma)$。我们寻找 $u$，使得 $g$ 具有**常数高斯曲率** $\Lambda$。

### 1.2 导出核心方程

在等温坐标下，高斯曲率的变化由 Liouville 方程给出（见 [[二维曲面的拓扑与复结构#2.1 高斯曲率在等温坐标下的表达式]]）：

$$K_g = e^{-2u}(K_{g_0} - \Delta_{g_0} u)$$

其中 $K_g$ 是新度量 $g$ 的高斯曲率，$K_{g_0}$ 是背景度量 $g_0$ 的高斯曲率，$\Delta_{g_0}$ 是 $g_0$ 下的 Laplace-Beltrami 算子。

我们希望 $K_g \equiv \Lambda$（常数），因此得到：

$$-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}$$

> [!important] 核心 PDE
> $$-\Delta_{g_0} u + K_{g_0} = \Lambda e^{2u}$$
>
> 这是单值化定理证明的**核心方程**。它是一个半线性椭圆型偏微分方程，其中 $\Lambda$ 的符号由 [[高斯-博内定理]] 给出的拓扑约束决定。

### 1.3 $\Lambda$ 的确定

由高斯-博内定理：
$$\int_\Sigma \Lambda e^{2u} \, dA_{g_0} = \int_\Sigma \Lambda \, dA_g = \int_\Sigma K_g \, dA_g = 2\pi \chi(\Sigma)$$

因此 $\Lambda$ 的符号与 $\chi(\Sigma)$ 一致：

| 亏格 | $\Lambda$ | 方程 |
|------|-----------|------|
| $g = 0$ | $\Lambda > 0$（可取 $\Lambda = 1$） | $-\Delta u + K_0 = e^{2u}$ |
| $g = 1$ | $\Lambda = 0$ | $-\Delta u + K_0 = 0$ |
| $g \ge 2$ | $\Lambda < 0$（可取 $\Lambda = -1$） | $-\Delta u + K_0 = -e^{2u}$ |

## 2. 平坦情形 ($g = 1, \Lambda = 0$)

### 2.1 方程转化为 Poisson 方程

当 $\Lambda = 0$，方程退化为线性方程：

$$-\Delta_{g_0} u + K_{g_0} = 0$$

即：
$$\Delta_{g_0} u = K_{g_0}$$

这是一个 **Poisson 方程**。

### 2.2 可解性条件

对于椭圆算子 $\Delta_{g_0}$ 在紧致流形上的 Poisson 方程 $\Delta u = f$，可解的充要条件是 $f$ 与 $\Delta$ 的零空间正交。$\Delta_{g_0}$ 的核正好是常值函数（由极大值原理和紧致性）。因此可解性条件为：

$$\int_\Sigma f \, dA_{g_0} = 0$$

对于我们的方程 $f = K_{g_0}$：

$$\int_\Sigma K_{g_0} \, dA_{g_0} = 2\pi \chi(\Sigma) = 2\pi \cdot 0 = 0$$

条件满足！由椭圆型方程的标准理论，存在解 $u$，且在模掉常值的意义下唯一。

### 2.3 几何实现

解 $u$ 给出平坦度量 $g = e^{2u} g_0$。这验证了亏格为 $1$ 的曲面上的常曲率零度量。

> [!note] 经典对应
> 亏格 $1$ 的黎曼曲面即椭圆曲线。平坦度量对应 $\mathbb{C}/\Lambda$（复平面模掉一个格），其中 $\Lambda$ 是秩为 $2$ 的离散子群。

## 3. 负曲率情形 ($g \ge 2, \Lambda = -1$)

对于负曲率，我们利用**变分法**：将方程解释为某个泛函的 Euler-Lagrange 方程。

### 3.1 爱因斯坦-希尔伯特泛函

定义（归一化的）**爱因斯坦-希尔伯特泛函**（参见 [[黎曼流形与曲率#6. 爱因斯坦度量|爱因斯坦度量]]，也称为 **Liouville 能量泛函**）：

$$\mathcal{E}(u) = \frac{1}{2} \int_\Sigma \left( |\nabla_{g_0} u|^2 + 2K_{g_0} u \right) dA_{g_0} - \int_\Sigma e^{2u} dA_{g_0}$$

> [!note] Euler-Lagrange 方程
> 计算 $\mathcal{E}$ 的一阶变分：
> $$\frac{d}{dt}\bigg|_{t=0} \mathcal{E}(u + t\varphi) = \int_\Sigma \left( -\Delta_{g_0} u + K_{g_0} + e^{2u} \right) \varphi \, dA_{g_0}$$
>
> 因此 $\mathcal{E}$ 的临界点恰好满足 $-\Delta_{g_0} u + K_{g_0} = -e^{2u}$（即我们的核心 PDE，$\Lambda = -1$）。

### 3.2 泛函性质分析

> [!note] 定理：$\mathcal{E}$ 在 $\Lambda = -1$ 情形下是严格凸的且强制 (coercive)
>
> **凸性**：第二变分：
> $$\frac{d^2}{dt^2}\bigg|_{t=0} \mathcal{E}(u + t\varphi) = \int_\Sigma \left( |\nabla \varphi|^2 + 2 e^{2u} \varphi^2 \right) dA_{g_0} > 0, \quad \forall \varphi \neq 0$$
>
> 因此 $\mathcal{E}$ 是**严格凸**的，临界点若存在必唯一。
>
> **强制性**：存在常数 $C_1, C_2 > 0$，使得：
> $$\mathcal{E}(u) \ge C_1 \|u\|_{H^1}^2 - C_2$$
>
> 这保证了极小化序列不会发散到无穷。
>
> **下界性**：由 Trudinger-Moser 不等式（二维下的 Sobolev 嵌入的临界情形），$\mathcal{E}$ 在 $H^1(\Sigma)$ 上有下界。

### 3.3 极小值点的存在性

由以上三条性质（凸性、强制性、下界性），直接变分法的标准论证确保：

1. 存在极小化序列 $\{u_n\} \subset H^1(\Sigma)$ 使得 $\mathcal{E}(u_n) \to \inf \mathcal{E}$
2. 强制性保证 $\{u_n\}$ 在 $H^1(\Sigma)$ 中有界
3. $H^1$ 中有界列有弱收敛子列
4. 由 $\mathcal{E}$ 的弱下半连续性（$\mathcal{E}$ 关于 $u \mapsto e^{2u}$ 的项在二维下是弱连续的），极小值点存在
5. 椭圆正则性理论：极小值点是弱解，由 bootstrap 论证得到 $u \in C^\infty(\Sigma)$
6. 严格凸性保证唯一性

> [!important] 结论
> 对于 $g \ge 2$，存在**唯一**的光滑函数 $u$，使得 $g = e^{2u} g_0$ 是 $K_g \equiv -1$ 的度量。负曲率情形得证。

### 3.4 几何解释

负常曲率 $-1$ 的完备度量给出了曲面上的双曲结构。根据 Killing-Hopf 定理，这样的曲面等距同构于双曲平面的商空间 $\mathbb{H}^2 / \Gamma$，其中 $\Gamma \subset \text{PSL}(2, \mathbb{R})$ 是与曲面基本群同构的离散子群。亏格为 $g$ 时，$\Gamma$ 有 $2g$ 个生成元。关于这类双曲结构的分类和退化，参见 [[模空间与度量退化]]。

## 4. 正曲率情形 ($g = 0, \Lambda = 1$)

正曲率情形是最微妙的。此时：

$$-\Delta_{g_0} u + K_{g_0} = e^{2u}$$

但之前用的爱因斯坦-希尔伯特泛函 **不再适用**：
- 当 $\Lambda = 1$ 时，泛函的符号反转，不再下界
- 泛函失去凸性
- 存在性不能通过直接变分法得到

因此需要借助**复分析**的工具。

### 4.1 总体策略

核心思路：不直接在 PDE 上斗争，而是利用 $S^2$（$\mathbb{CP}^1$）是唯一亏格为 $0$ 的黎曼曲面这一事实。

**证明路线图**：

1. 在 $(\Sigma, g_0)$（亏格 $0$）上建立与 $g_0$ 相容的复结构 $J$（参见 [[二维曲面的拓扑与复结构#3.2 复结构]]）
2. 构造一个全局的亚纯函数 $f: \Sigma \to \mathbb{CP}^1$，证明它是双全纯同构
3. 将 $\mathbb{CP}^1$ 上的标准 Fubini-Study 度量拉回 $\Sigma$，即得所需的常正曲率度量

### 4.2 构造亚纯函数

**步骤 1：选取一点 $p \in \Sigma$ 并构造 Green 函数**

取 $p \in \Sigma$。由 Hodge 理论，存在唯一的函数 $G_p \in C^\infty(\Sigma \setminus \{p\})$ 满足：

$$\Delta_{g_0} G_p = \delta_p - \frac{1}{\text{Vol}(\Sigma)}$$

且在 $p$ 附近有奇性：$G_p(q) \sim \frac{1}{2\pi} \log d(p, q)$。

**步骤 2：构造亚纯微分**

定义 $*d G_p$ 为 $d G_p$ 的 Hodge 对偶。则在 $\Sigma \setminus \{p\}$ 上 $d(*d G_p) = \pm \Delta G_p \, dA = 0$（因为 $\delta_p$ 的支集仅含 $\{p\}$）。

因此存在调和共轭函数 $H$（局部定义），使得 $F = G_p + iH$ 是局部全纯函数。

**步骤 3：绕过单值性困难**

$H$ 可能有多值性（周期围绕 $p$ 的回路）。通过标准单值化论证（利用 $\Sigma$ 是单连通的——亏格 $0$ 的紧致曲面必然是单连通的），$H$ 实际上可以**全局定义**为单值函数。

**步骤 4：得到亚纯函数**

因此 $f = e^{F} = e^{G_p + iH}$ 是 $\Sigma$ 上的全纯函数，在 $p$ 处有一个简单极点。实际上，$f$ 恰好给出：

$$f: \Sigma \xrightarrow{\cong} \mathbb{CP}^1$$

这是一个**双全纯同构**。

### 4.3 拉回标准度量

$\mathbb{CP}^1 \cong S^2$ 上有标准的 Fubini-Study 度量（常曲率 $1$ 的度量）。用 $f$ 将其拉回 $\Sigma$：

$$g = f^* g_{\mathbb{CP}^1}$$

则 $g$ 是 $\Sigma$ 上的光滑度量，且 $K_g \equiv 1$（因为 $f$ 是保曲率的局部等距，且 Fubini-Study 度量曲率为 $1$）。

### 4.4 唯一性

正曲率解的唯一性也可以通过复分析论证：若 $g_1, g_2$ 都是 $\Sigma$ 上的常曲率 $1$ 度量，则在（唯一的）复结构下它们一定共形等价，且共形因子 $u$ 满足 Liouville 方程。通过极大值原理可以证明 $u \equiv 0$，故 $g_1 = g_2$。

## 5. 证明框架总结

| 亏格 | $\Lambda$ | 方法 | 核心工具 |
|------|-----------|------|---------|
| $g = 0$ | $1$ | 复分析 | 全纯函数、Green 函数、亚纯微分、$\cong \mathbb{CP}^1$ |
| $g = 1$ | $0$ | 线性 PDE | Poisson 方程、Fredholm 可解性条件（高斯-博内） |
| $g \ge 2$ | $-1$ | 变分法 | Liouville 能量泛函、凸性 + 强制性 + 下界 |

> [!tip] 统一性
> 三种情形看似方法迥异，实则共享同一个 PDE 框架 $-\Delta u + K_0 = \Lambda e^{2u}$。不同方法的选取仅源于 $\Lambda$ 符号导致的方程性质的差异：
> - $\Lambda = 0$：线性（Fredholm 理论）
> - $\Lambda < 0$：椭圆 + 良好变分结构（直接法）
> - $\Lambda > 0$：焦点型（需要复分析的精细工具）

## 6. 与卡拉比猜想的联系

> [!note] 历史注记
> 单值化定理可视为**卡拉比猜想 (Calabi Conjecture)** 的 $1$ 维复流形（$=2$ 维实流形）特例：
>
> 卡拉比猜想（1954）：紧致 Kähler 流形上，任意表示第一陈类的 $(1,1)$-形式都有唯一的 Kähler 度量以其为里奇形式。
>
> 在一维情形：紧致 Kähler 流形 = 紧致黎曼曲面（二维实曲面），里奇形式 = 高斯曲率 × 面积元。卡拉比猜想退化为：对任意光滑函数 $K$ 满足 $\int K \, dA = 2\pi \chi(\Sigma)$，存在唯一的度量以 $K$ 为高斯曲率。
>
> 单值化定理是对 $K \equiv \text{const}$ 的特例的证明。丘成桐在 1976 年证明了一般维数的卡拉比猜想。
