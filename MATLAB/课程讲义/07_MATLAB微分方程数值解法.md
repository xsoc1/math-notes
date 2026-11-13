---
title: 第七课 MATLAB 微分方程数值解法
tags:
  - matlab/lecture
  - matlab/ode
date: 2026-10-21
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/07_MATLAB微分方程数值解法.md"
matlab_source_sha256: 0dcd8a89c85cd925db0e0f8398be3a11aee47e4e521cdd6d3382516ecabeb882
---

# 第七课：MATLAB 微分方程数值解法

来源：[[MATLAB/课程资料/原始课件/第七课 MATLAB微分方程数值解法.pdf|第七课 MATLAB微分方程数值解法.pdf]]（共 37 页）。本课承接[[MATLAB/课程讲义/06_MATLAB数值微积分|第六课数值微积分]]与[[MATLAB/课程讲义/06B_第六周实验课|第六周实验课]]。

本课主线：将连续动力系统建立为常微分方程初值问题（IVP），对比 `dsolve` 符号解析求解与离散数值步进算法；从积分恒等式的数值求积近似系统推导显式 Euler 法、隐式 Euler 法、隐式梯形法、改进 Euler 法（Heun 预测-校正法）与 Runge-Kutta 法；严格剖析局部截断误差 $O(h^{p+1})$ 与全局累积误差 $O(h^p)$、Dahlquist 试验方程下的绝对稳定域；掌握高阶方程与耦合系统（城乡人口迁移、Van der Pol 振子、Lorenz 混沌吸引子）的降阶方法，以及非刚性求解器 `ode45` 与刚性求解器 `ode15s` 的选型对比。

## 1. 从复利递推到线性差分方程与收敛性理论（第 2–5 页）

设单期名义利率为 $1$，若拆分为 $n$ 次复利计息，则期末本利和为 $(1 + 1/n)^n \to e \, (n \to \infty)$。记离散时间步长为 $h$，则一步递推关系为 $u_{k+1} = (1 + h)u_k$。

一般 $r$ 阶常系数线性差分方程写作：

$$
u_k = a_1 u_{k-1} + \cdots + a_r u_{k-r} + g_k.
$$

当非齐次项 $g_k = 0$ 时，代入指数试探解 $u_k = \lambda^k$ 可得特征方程 $\lambda^r - a_1\lambda^{r-1} - \cdots - a_r = 0$。若 $r$ 个特征根 $\lambda_1, \dots, \lambda_r$ 互异，则齐次通解为 $u_k = \sum_{j=1}^r c_j \lambda_j^k$。

**相容性的严格定义与收敛性定理适用边界（单步法 vs 线性多步法 vs 线性 PDE）**：
在数值分析中，判断单步法 $Y_{n+1} = Y_n + h\Phi(x_n, Y_n, h)$ 是否具备**相容性（Consistency）**，必须将**精确解 $y(x)$** 代入格式考察单位步长局部截断余项（缺陷 / Local Defect）$\tau_{n+1} := \frac{y(x_{n+1}) - y(x_n)}{h} - \Phi\bigl(x_n, y(x_n), h\bigr)$：
- 当 $\lim_{h\to 0} \tau_{n+1} = 0$（对连续增量函数等价于 $\Phi(x, y, 0) = f(x, y)$）时，仅说明格式是**相容的（Consistent）**，这既**不意味着具备“一阶相容性”**，甚至**不等价于存在正代数相容阶 $p > 0$**！例如：对 $y' = 0$ 取 $\Phi(x, y, h) = \frac{1}{\ln(e/h)}$，虽满足相容极限 $\lim_{h\to 0}\tau_{n+1} = 0$，但缺陷仅按对数速率衰减，对任意 $p > 0$ 均不满足 $O(h^p)$；又如取 $\Phi(x, y, h) = f(x, y) + \sqrt{h}$，单位步长截断余项为 $\tau_{n+1} = O(h^{1/2})$（一步误差 $T_{n+1} = O(h^{3/2})$），仅具分数阶 $1/2$ 而非一阶相容性。在数值分析中，必须另行按幂次阶条件 $\tau_{n+1} = O(h^p)$（即一步截断误差 $T_{n+1} = O(h^{p+1})$，$p \ge 1$）定义 **$p$ 阶代数相容阶**。
- 更进一步，仅凭相容性本身不足以保证在有限区间 $[x_0, b]$ 上历经 $N = (b-x_0)/h$ 步递推后数值解收敛于真解，不同问题类别的收敛定理边界如下：
1. **一般非线性 ODE 的单步法 $Y_{n+1} = Y_n + h\Phi(x_n, Y_n, h)$**：当增量函数 $\Phi(x, y, h)$ 与原方程相容（$\Phi(x, y, 0) = f(x, y)$，一步局部截断误差为 $O(h^{p+1})$）且关于状态变量 $y$ 满足 **Lipschitz 条件** $|\Phi(x, y_1, h) - \Phi(x, y_2, h)| \le L_\Phi |y_1 - y_2|$ 时，单步法天然具备零稳定性，由**离散 Gronwall 不等式**可严格证得全局误差满足 $\max_n |y(x_n) - Y_n| = O(h^p)$。
2. **一般非线性 ODE 的线性多步法**：由 **Dahlquist 等价定理**，线性多步法在 $h \to 0$ 时收敛的充要条件是同时满足**相容性**与第一特征多项式的根条件（即**零稳定性 Zero-stability**）。
3. **线性适定发展方程的 Lax-Richtmyer 等价定理**：对于 Banach 空间上的**线性**适定初值问题，相容差分格式收敛的充要条件是算子幂次一致有界（稳定性，参见 [Lax-Richtmyer 定理讲义](https://math.berkeley.edu/~wilken/228B.S07/LaxRichtmyer.pdf)）；注意 Lax-Richtmyer 定理仅适用于线性问题，不能无条件直接套用于一般非线性 ODE。

## 2. 初值问题适定性、`dsolve` 符号解与离散网格表示（第 6–7 页）

考虑一阶初值问题 $y' = f(x, y), \, y(x_0) = y_0$。
- **符号解析求解**：对线性或可分离变量的常微分方程，可调用 `ySol = dsolve(diff(y, x) == f(x, y), y(x0) == y0)` 求闭式解析解；但绝大多数非线性动力系统无初等解析解，必须依赖数值步进法在离散节点 $x_n = x_0 + nh$ 上构造近似序列 $Y_n \approx y(x_n)$。
- **局部存在唯一性（Picard-Lindelöf 定理）**：当 $f(x, y)$ 连续且关于 $y$ 满足局部 Lipschitz 条件时，初值问题在 $x_0$ 邻域内存在唯一解。
- **有限时间爆破（Finite-time Blow-up）**：局部 Lipschitz 条件不保证解在全局区间上存在。例如 Riccati 初值问题 $y' = x^2 + y^2, \, y(0) = 1$，由比较定理 $y(x) \ge \tan x$ 可知，精确解在有限奇点 $x^* < \frac{\pi}{2}$ 处趋于 $+\infty$。

**课件记号修正**：原课件第 6 页将初值条件记作 $y_0 = f(x_0) = y^*$，易将状态函数 $y(x)$ 与右端斜率函数 $f(x, y)$ 混淆；规范记法应为 $y_0 = y(x_0) = y^*$。

## 3. 从积分求积公式导出四类基本单步法（第 7–15 页）

在子区间 $[x_n, x_{n+1}]$（$x_{n+1} = x_n + h$）上对微分方程 $y'(s) = f\bigl(s, y(s)\bigr)$ 两边积分，得到精确积分恒等式：

$$
y(x_{n+1}) = y(x_n) + \int_{x_n}^{x_{n+1}} f\bigl(s, y(s)\bigr)\,\mathrm{d}s.
$$

对右端积分项分别采用不同的数值求积公式，即系统导出四类基本单步格式：

1. **显式（向前）Euler 法（左端点矩形公式）**：
   $$
   Y_{n+1} = Y_n + h f(x_n, Y_n).
   $$
2. **隐式（向后）Euler 法（右端点矩形公式）**：
   $$
   Y_{n+1} = Y_n + h f(x_{n+1}, Y_{n+1}).
   $$
   每步需通过不动点迭代或 Newton 法求解关于未知量 $Y_{n+1}$ 的隐式方程，一阶全局精度 $O(h)$，但具备优异的无条件稳定性。
3. **隐式梯形法（Trapezoidal Rule，两端点梯形求积）**：
   $$
   Y_{n+1} = Y_n + \frac{h}{2}\Bigl(f(x_n, Y_n) + f(x_{n+1}, Y_{n+1})\Bigr).
   $$
   具有二阶全局精度 $O(h^2)$ 且为 $A$-稳定（对称保结构格式）。
4. **改进 Euler 法（Heun 显式预测-校正格式，第 13–14 页）**：
   为避免隐式梯形法中的非线性方程求解，先用显式 Euler 步预测右端点状态 $\widetilde{Y}_{n+1}$，再代入梯形公式完成校正：
   $$
   \begin{aligned}
   K_1 &= f(x_n, Y_n), \\
   \widetilde{Y}_{n+1} &= Y_n + h K_1 \quad \text{（显式预测步 Predictor）}, \\
   Y_{n+1} &= Y_n + \frac{h}{2}\bigl(K_1 + f(x_n + h, \widetilde{Y}_{n+1})\bigr) \quad \text{（梯形校正步 Corrector）}.
   \end{aligned}
   $$
5. **显式中点法（RK2，中点矩形求积，第 15 页）**：
   $$
   K_1 = f(x_n, Y_n), \qquad Y_{n+1} = Y_n + h f\left(x_n + \frac{h}{2}, \, Y_n + \frac{h}{2} K_1\right).
   $$

对于课程检验方程：

$$
y' = x\cos x + \frac{y}{x}, \quad y(\pi) = \pi, \qquad \text{精确解为 } y(x) = x(1 + \sin x),
$$

可通过不断减半步长 $h$ 检验显式 Euler 法的一阶全局误差 $O(h)$ 与改进 Euler 法的二阶全局误差 $O(h^2)$。

## 4. 局部截断误差、全局误差阶与绝对稳定域分析（第 15–16 页）

### 4.1 局部截断误差 $O(h^{p+1})$ 与全局累积误差 $O(h^p)$ 的严格区分

设真解为 $y(x)$，一般显式单步法写作 $Y_{n+1} = Y_n + h\Phi(x_n, Y_n, h)$。
1. **一步局部截断误差（One-step Local Truncation Error）**：假定第 $n$ 步起点精确落在真解轨线上（即令 $Y_n = y(x_n)$），经过**一步**推进后真解与数值公式之差定义为：
   $$
   T_{n+1} := y(x_{n+1}) - y(x_n) - h\Phi\bigl(x_n, y(x_n), h\bigr).
   $$
   （注：部分教材将差商余项 $\tau_{n+1} = h^{-1}T_{n+1} = \frac{y(x_{n+1})-y(x_n)}{h} - \Phi\bigl(x_n, y(x_n), h\bigr)$ 称为单位步长局部截断误差。）若存在最大正整数 $p$ 使得一步误差满足
   $$
   T_{n+1} = O(h^{p+1}) \qquad \bigl(\text{等价地，单位步长误差 } \tau_{n+1} = h^{-1}T_{n+1} = O(h^p)\bigr),
   $$
   则称该单步法为 **$p$ 阶方法**。
2. **全局截断误差（Global Error）**：在固定长度区间 $[x_0, b]$ 上，总步数为 $N = \frac{b - x_0}{h} = O(h^{-1})$。当增量函数 $\Phi$ 关于 $y$ 满足 Lipschitz 条件（常数为 $L$）时，全局误差 $e_n = y(x_n) - Y_n$ 满足递推不等式 $|e_{n+1}| \le (1 + hL)|e_n| + |T_{n+1}|$。当初值无误差 $e_0 = 0$ 时，由离散 Gronwall 不等式求和放大因子 $\sum_{k=0}^{N-1}(1+hL)^k = \frac{(1+hL)^N - 1}{hL} \le \frac{e^{L(b-x_0)} - 1}{hL} = O(h^{-1})$，最终将 $N = O(h^{-1})$ 步的一步局部误差 $O(h^{p+1})$ 累积为 **$p$ 阶全局误差**：
   $$
   \max_{1 \le n \le N} |y(x_n) - Y_n| \le \frac{e^{L(b - x_0)} - 1}{L} \cdot \max_n \frac{|T_{n+1}|}{h} = O(h^{-1}) \cdot O(h^{p+1}) = O(h^p).
   $$
   - **显式/隐式 Euler 法（$p = 1$）**：一步局部截断误差为 $T_{n+1} = \frac{h^2}{2}y''(\xi_n) = O(h^2)$，**全局累积误差为 $O(h)$**。
   - **改进 Euler 法 / 隐式梯形法 / 显式中点法（$p = 2$）**：一步局部截断误差为 $T_{n+1} = O(h^3)$，**全局累积误差为 $O(h^2)$**。
   - **经典四阶 Runge-Kutta 法（RK4，$p = 4$）**：一步局部截断误差为 $O(h^5)$，**全局累积误差为 $O(h^4)$**。

### 4.2 Dahlquist 试验方程与绝对稳定域

考察固定步长 $h > 0$ 时数值解在长时积分下的误差增长特性，引入经典的 **Dahlquist 线性试验方程**：

$$
y' = \lambda y, \quad y(0) = y_0, \qquad \text{其中 } \operatorname{Re}(\lambda) < 0.
$$

由于 $\operatorname{Re}(\lambda) < 0$，精确解 $y(t) = y_0 e^{\lambda t}$ 随 $t \to +\infty$ 严格指数衰减至 $0$。将单步法应用于该试验方程，得到一步递推关系 $Y_{n+1} = G(z) Y_n$，其中 $z = h\lambda \in \mathbb{C}$，$G(z)$ 称为**稳定性函数（放大因子）**。若要求数值解同样保持衰减 $|Y_{n+1}| < |Y_n|$，当且仅当放大因子满足**绝对稳定条件**：

$$
|G(h\lambda)| < 1.
$$

- **显式 Euler 法的绝对稳定域**：代入 $y' = \lambda y$ 得 $Y_{n+1} = Y_n + h\lambda Y_n = (1 + h\lambda)Y_n$，放大因子为 $G(h\lambda) = 1 + h\lambda$。绝对稳定域为左半复平面上以 $-1$ 为圆心、半径为 $1$ 的开圆盘：
  $$
  |1 + h\lambda| < 1.
  $$
  特别地，当 $\lambda < 0$ 为**实负特征值**时，不等式 $-1 < 1 + h\lambda < 1$ 给出了严格的**显式步长上限**：
  $$
  0 < h < \frac{2}{|\lambda|} = -\frac{2}{\lambda}.
  $$
  一旦步长 $h > 2/|\lambda|$，放大因子 $1 + h\lambda < -1$，数值解将发生符号正负交替且振幅指数爆炸的非物理振荡！
- **隐式 Euler 法与隐式梯形法的 $A$-稳定性**：隐式 Euler 法的放大因子为 $G(h\lambda) = \frac{1}{1 - h\lambda}$，在左半复平面 $\operatorname{Re}(\lambda) < 0$ 上恒有 $|1 - h\lambda| > 1 \implies |G(h\lambda)| < 1$；隐式梯形法的放大因子为 $G(h\lambda) = \frac{1 + h\lambda/2}{1 - h\lambda/2}$，对一切 $\operatorname{Re}(\lambda) < 0$ 及任意步长 $h > 0$ 恒有 $|G(h\lambda)| < 1$（即绝对稳定域包含整个左半复平面，称为 **$A$-稳定**）。

## 5. 一阶微分方程组、守恒律与矩阵指数（第 17–25 页）

对向量初值问题 $U'(t) = F(t, U(t)), \, U(0) = U_0 \in \mathbb{R}^d$，常系数齐次线性系统 $U' = AU$ 的唯一解析解由矩阵指数给出：

$$
U(t) = e^{At} U(0) = \operatorname{expm}(At) U(0).
$$

考察城乡人口迁移马尔可夫模型（第 19–21 页）：

$$
A = \begin{bmatrix} -0.1 & 0.3 \\ 0.1 & -0.3 \end{bmatrix}, \qquad U(0) = \begin{bmatrix} 8 \\ 6 \end{bmatrix}.
$$

由于 $(1, 1) A = (0, 0)$，因此总人口 $\frac{\mathrm{d}}{\mathrm{d}t}(U_1 + U_2) = (1, 1)AU = 0$，即 $U_1(t) + U_2(t) \equiv 14$ 为严格守恒量。结合特征值 $\lambda_1 = 0, \, \lambda_2 = -0.4$ 与零空间方程 $AU_\infty = 0$（即 $U_1 : U_2 = 3 : 1$），当 $t \to +\infty$ 时系统指数收敛于稳态平衡点 $U_\infty = (10.5, \, 3.5)^{\mathsf{T}}$。

## 6. 高阶方程降阶、`ode45` 容差机制、Lorenz 吸引子与刚性方程对比（第 26–29 页）

### 6.1 高阶微分方程降阶与 `ode45` 容差控制
任何 $k$ 阶显式常微分方程 $y^{(k)} = g(t, y, y', \dots, y^{(k-1)})$ 均可通过状态替换 $U_1 = y, \, U_2 = y', \, \dots, \, U_k = y^{(k-1)}$ 转化为一阶向量方程组。以 Van der Pol 非线性自激振荡方程为例：

$$
y'' - \mu(1 - y^2)y' + y = 0, \qquad \mu = 2,
$$

令 $U = [y; \, y']$，降阶为一阶微分方程组：

$$
\frac{\mathrm{d}}{\mathrm{d}t}\begin{bmatrix} U_1 \\ U_2 \end{bmatrix} = \begin{bmatrix} U_2 \\ \mu(1 - U_1^2)U_2 - U_1 \end{bmatrix}, \qquad U(0) = \begin{bmatrix} 1 \\ 0 \end{bmatrix}.
$$

在 MATLAB 中调用自适应步长求解器 `ode45`（基于 Dormand-Prince RK4(5) 嵌入式公式，详见 [MathWorks ode45 文档](https://www.mathworks.com/help/matlab/ref/ode45.html)）。
- **`RelTol` 与 `AbsTol` 的准确数学定义**：通过 `odeset('RelTol', rtol, 'AbsTol', atol)` 设置的参数中，**`RelTol` 是“每步局部相对误差控制容限（默认值为 $10^{-3}$，即 $0.1\%$）”**，**`AbsTol` 是“每步局部绝对误差控制容限（默认值为 $10^{-6}$）”**。在每一个时间步 $h_n$，求解器利用 4 阶与 5 阶嵌入式公式之差估计局部截断误差 $e_i$，并动态调整步长以确保每个状态分量满足：
  $$
  |e_i| \le \max\bigl(\mathrm{RelTol} \cdot |U_i|, \, \mathrm{AbsTol}_i\bigr).
  $$

```matlab
mu = 2;
vdp_rhs = @(t, u) [u(2); mu * (1 - u(1)^2) * u(2) - u(1)];
opts = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);
[Time, State] = ode45(vdp_rhs, [0, 20], [1; 0], opts);
```

注意传给 `ode45` 的右端函数句柄 `vdp_rhs(t, u)` 必须返回**列向量**；返回的矩阵 `State` 每行对应一个时间步，第 $j$ 列对应第 $j$ 个状态分量 $U_j(t)$。

### 6.2 三维混沌动力系统：Lorenz 吸引子仿真
考察著名的大气对流 **Lorenz 方程组**：

$$
\begin{cases}
\dot{x} = \sigma(y - x), \\
\dot{y} = x(\rho - z) - y, \\
\dot{z} = x y - \beta z,
\end{cases}
\qquad \sigma = 10, \; \rho = 28, \; \beta = \frac{8}{3}.
$$

该三维非线性自治系统对初值具有极度敏感依赖性（混沌“蝴蝶效应”），其相轨线被吸引到一个具有分形结构的有界奇异吸引子（Lorenz Attractor）上：

```matlab
%% Lorenz 混沌吸引子三维相轨线与初值敏感性仿真
sigma = 10; rho = 28; beta = 8/3;
lorenz_rhs = @(t, u) [sigma * (u(2) - u(1));
                      u(1) * (rho - u(3)) - u(2);
                      u(1) * u(2) - beta * u(3)];

opts = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);
[t1, U1] = ode45(lorenz_rhs, [0, 40], [1; 1; 1], opts);
[t2, U2] = ode45(lorenz_rhs, [0, 40], [1 + 1e-5; 1; 1], opts); % 初值微小扰动 1e-5

figure;
plot3(U1(:,1), U1(:,2), U1(:,3), 'b-', 'LineWidth', 0.8);
grid on; view(45, 25);
xlabel('x(t)'); ylabel('y(t)'); zlabel('z(t)');
title('Lorenz 混沌吸引子三维相空间轨线 (\sigma=10, \rho=28, \beta=8/3)');
```

### 6.3 刚性微分方程（Stiff ODEs）：`ode45` 与 `ode15s` 效率对比
当动力系统中同时包含衰减极快的瞬态分量（对应负实部绝对值极大的特征值 $\lambda_{\text{fast}} = -1000$）与变化平缓的慢变分量时，系统称为**刚性方程（Stiff System）**。考察典型刚性初值问题：

$$
y' = -1000(y - \sin t) + \cos t, \quad y(0) = 1, \qquad \text{精确解为 } y(t) = e^{-1000t} + \sin t.
$$

尽管快衰减项 $e^{-1000t}$ 在 $t > 0.01$ 后已彻底归零、真解退化为平滑的 $\sin t$，但显式求解器 `ode45` 受限于有界绝对稳定域（要求 $h|\lambda| \lesssim 2.8 \implies h \lesssim 0.0028$），在整个积分区间上被迫采用极小步长；而基于隐式数值微分公式（NDF/BDF）的刚性求解器 `ode15s` 具备近似无界稳定域，在渡过初始瞬态层后可自动放大步长，仅需数十步即可完成求解：

```matlab
%% 刚性方程中显式求解器 ode45 与隐式刚性求解器 ode15s 步数对比
stiff_rhs = @(t, y) -1000 * (y - sin(t)) + cos(t);
[t_45, y_45]   = ode45(stiff_rhs, [0, 10], 1);
[t_15s, y_15s] = ode15s(stiff_rhs, [0, 10], 1);

fprintf('刚性方程 [0, 10] 求解: ode45 耗时步数 = %d 步, ode15s 仅需 = %d 步\n', ...
        numel(t_45), numel(t_15s));
```

## 7. PDE Modeler 有限元求解流程（第 30–32 页）

二维偏微分方程工具箱（PDE Modeler / `solvepde`）的标准有限元（FEM）工作流依次为：
1. **几何建模（Draw Mode）**：通过基本多边形、圆与椭圆的集合布尔运算构造二维求解域 $\Omega$；
2. **边界条件设定（Boundary Mode）**：在各边界段指定 Dirichlet 条件（$h u = r$）或广义 Neumann 条件（$\mathbf{n}\cdot(c\nabla u) + qu = g$）；
3. **PDE 系数配置（PDE Mode）**：设定椭圆型、抛物型、双曲型或特征值方程的系数 $c, a, f, d$；
4. **自适应三角网格剖分与求解（Mesh & Solve Mode）**：生成 Delaunay 三角形网格并加密验证网格收敛性，求解线性或非线性有限元方程组。

## 8. 延伸阅读

- 常微分方程单步法、刚性问题及边值问题理论详见 [[MATLAB/课程讲义/补充_第七周微分方程数值解法参考资料|第七周微分方程数值解法参考资料]]。
- 动力学模型与守恒律数值检验详见 [[MATLAB/课程讲义/补充_第七周与第八周作业参考解读|第七周与第八周作业参考解读]]。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
