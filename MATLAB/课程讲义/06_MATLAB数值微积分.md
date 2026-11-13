---
title: "第六课：MATLAB 数值微积分"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/06_MATLAB数值微积分.md"
matlab_source_sha256: da731f7d58acb9682cc1421b3e4f4d6d51c2c66e1f788b285b6ecdc469fa5c72
---


# 第六课：MATLAB 数值微积分

来源：[[MATLAB/课程资料/原始课件/第六课 MATLAB数值微积分.pdf|第六课 MATLAB数值微积分.pdf]]，李嘉，中山大学数学学院，共 34 页。

## 1. 课件脉络与核心主题

| 原 PDF 页码 | 课件内容 | 核心数值分析问题 |
| :--- | :--- | :--- |
| 2–8 | 数值差分 `diff` 与数值梯度 `gradient`；步长选择、舍入误差与噪声放大 | 前向差分与中心差分的截断误差阶、数组长度变化、相减抵消及高频噪声放大 |
| 9 | 数组求和 `sum` 与累积和 `cumsum` | 默认求和维度规则与显式维度参数 |
| 10–19 | 复合矩形、中点、梯形（`trapz`/`cumtrapz`）与 Simpson 公式 | 节点数与子区间数的对应关系、求积权重、代数精度与四条经典曲线弧长计算 |
| 20–22 | 蒙特卡洛（Monte Carlo）随机积分估计 | 均匀采样期望估计、可积与平方可积条件、方差 $O(1/K)$ 与标准误差 $O(K^{-1/2})$ |
| 23–28 | 匿名函数句柄 `@`、自适应求积 `integral`、反常积分与复路径积分 | 向量化被积函数、绝对/相对容差控制与奇点处理 |
| 29–34 | 二重与三重数值积分 `integral2`、`integral3` 及二维中点公式 | 变限积分边界函数句柄、极坐标转换与曲面面积元雅可比权重 |

## 2. 数值微分：有限差分、舍入误差平衡与噪声放大效应

### 2.1 前向差商、后向差商与中心差商
对等距网格节点 $x_i = a + ih \, (i = 0, 1, \dots, N)$，由 Taylor 展开导出：
- **前向差分商**：

$$
D_h^+ f(x_i) = \frac{f(x_{i+1}) - f(x_i)}{h} = f'(x_i) + \frac{h}{2}f''(\xi_i), \quad \text{截断误差 } O(h).
$$

- **中心差分商**（内部节点 $1 \le i \le N-1$）：

$$
D_h^0 f(x_i) = \frac{f(x_{i+1}) - f(x_{i-1})}{2h} = f'(x_i) + \frac{h^2}{6}f'''(\eta_i), \quad \text{截断误差 } O(h^2).
$$

**MATLAB 函数 `diff` 与 `gradient` 对比**：
- 对长度为 $N$ 的数值向量 `Y`，`diff(Y) / h` 返回相邻元素的前向差商，输出向量长度缩减为 $N - 1$（`diff(Y, k)` 则计算 $k$ 阶差分，长度为 $N - k$）。
- `gradient(Y, h)` 返回与 `Y` **同长度（$N$）**的数值导数向量：在内部节点 $2 \le i \le N-1$ 采用二阶中心差分 $\frac{Y_{i+1}-Y_{i-1}}{2h}$，在左右端点 $i = 1, N$ 采用一阶单边差分。

```matlab
x = linspace(0, pi, 101);
h = x(2) - x(1);
y = sin(x);

dy_diff = diff(y) / h;          % 长度为 100，对应前向差商（或中点中心差商）
dy_grad = gradient(y, h);       % 长度为 101，内部二阶中心差商，端点一阶差商
err_diff_left = max(abs(dy_diff - cos(x(1:end-1)))); % O(h) 误差
err_grad_in   = max(abs(dy_grad(2:end-1) - cos(x(2:end-1)))); % O(h^2) 误差
```

### 2.2 步长过小导致的舍入误差放大
设函数值计算存在量级为 $\varepsilon_{\text{mach}} \approx 2.22 \times 10^{-16}$ 的浮点舍入误差，则前向差商与中心差商的总误差上界分别为：

$$
E_{\text{fwd}}(h) \lesssim \frac{M_2}{2} h + \frac{2\varepsilon_{\text{mach}} |f(x)|}{h}, \qquad
E_{\text{cen}}(h) \lesssim \frac{M_3}{6} h^2 + \frac{\varepsilon_{\text{mach}} |f(x)|}{h}.
$$

当步长 $h$ 减小时，截断误差下降而相减抵消舍入误差按 $O(1/h)$ 增大：前向差商在 $h^* \sim \varepsilon_{\text{mach}}^{1/2} \approx 10^{-8}$ 处达到最小误差 $\sim 10^{-8}$，中心差商在 $h^* \sim \varepsilon_{\text{mach}}^{1/3} \approx 10^{-5}$ 处达到最小误差 $\sim 10^{-11}$；若继续缩小步长至 $10^{-12} \sim 10^{-16}$，舍入误差完全主导，总误差呈 V 字形回升直至差商归零。

### 2.3 含噪声信号的数值微分放大效应算例
在工程测量中，观测信号常叠加高频微幅随机噪声：$\tilde{y}(t) = y(t) + \eta(t)$，其中 $|\eta(t)| \le \delta$。直接对采样序列求差商时，噪声项的差商误差为：

$$
\left|\frac{\tilde{y}(t+h) - \tilde{y}(t)}{h} - y'(t)\right| \le O(h) + \frac{2\delta}{h}.
$$

从频域角度看，微分算子 $\frac{\mathrm{d}}{\mathrm{d}t}$ 对应频域乘以 $\mathrm{i}\omega$，会将高频噪声幅值按频率 $\omega \propto 1/h$ 剧烈放大！当网格加密（$h \ll \delta$）时，噪声差商 $\frac{\eta(t+h)-\eta(t)}{h}$ 的振幅远超真实导数 $y'(t)$。

```matlab
%% 含噪声正弦信号的数值微分放大效应演示
rng(0);
t = linspace(0, 2*pi, 500);
h = t(2) - t(1);
y_clean = sin(t);
y_noisy = y_clean + 0.02 * randn(size(t)); % 叠加标准差 0.02 的高斯白噪声

dy_true  = cos(t);
dy_noisy = gradient(y_noisy, h);           % 噪声被放大约 1/h 倍，剧烈振荡
y_smooth = movmean(y_noisy, 15);           % 滑动平均平滑滤波后再求导
dy_smooth = gradient(y_smooth, h);

figure;
plot(t, dy_noisy, 'Color', [0.8 0.8 0.8]); hold on;
plot(t, dy_true, 'k-', 'LineWidth', 1.8);
plot(t, dy_smooth, 'r--', 'LineWidth', 1.5); hold off;
grid on; xlabel('t'); ylabel('dy/dt');
title('含噪声信号直接数值求导的高频放大效应与平滑求导对比');
legend('直接对含噪信号求导', '真实导数 cos(t)', '平滑滤波后求导');
```

## 3. 数组求和维度、离散求积公式与四条参数曲线弧长

### 3.1 `sum` 与 `cumsum` 的维度约定
`sum(A)` 默认沿**第一个长度不为 1 的维度**求和：若 `R = [1, 2, 3]` 为 $1 \times 3$ 行向量，`sum(R)` 沿第 2 维求和得标量 `6`，而显式指定第 1 维 `sum(R, 1)` 则原样返回 `[1, 2, 3]`。对矩阵 `A`，`sum(A, 1)` 按列求和返回行向量，`sum(A, 2)` 按行求和返回列向量，`sum(A, 'all')` 求全矩阵总和。

### 3.2 复合数值求积公式
将区间 $[a, b]$ 等分为 $N$ 个子区间，步长 $h = (b - a)/N$，节点为 $x_0, x_1, \dots, x_N$，子区间中点为 $m_i = (x_i + x_{i+1})/2$：

$$
\begin{aligned}
Q_L &= h \sum_{i=0}^{N-1} f(x_i) \\
&\quad\text{（复合左矩形公式，整体误差 } O(h)\text{，代数精度 0 阶）}, \\
Q_M &= h \sum_{i=0}^{N-1} f(m_i) \\
&\quad\text{（复合中点矩形公式，整体误差 } O(h^2)\text{，代数精度 1 阶）}, \\
Q_T &= h \left( \frac{1}{2}f(x_0) + \sum_{i=1}^{N-1} f(x_i) + \frac{1}{2}f(x_N) \right) \\
&\quad\text{（复合梯形公式，整体误差 } O(h^2)\text{，代数精度 1 阶）}, \\
Q_S &= \frac{h}{6} \sum_{i=0}^{N-1} \bigl( f(x_i) + 4f(m_i) + f(x_{i+1}) \bigr) \\
&\quad\text{（复合 Simpson 公式，整体误差 } O(h^4)\text{，代数精度 3 阶）}.
\end{aligned}
$$

- 注意 $N$ 个子区间共有 $N + 1$ 个端点，实现左矩形求积时应取 `X(1:end-1)`，右矩形取 `X(2:end)`，切勿将全部 $N+1$ 个端点直接相加乘以 $h$。
- `trapz(X, Y)` 与 `cumtrapz(X, Y)` 直接对离散采样数组执行复合梯形定积分与变上限累积梯形积分，支持非等距网格节点向量 `X`。

### 3.3 典型算例：四条经典参数曲线的弧长计算
参数曲线 $(x(t), y(t)) \, (t \in [\alpha, \beta])$ 的弧长公式为 $L = \int_\alpha^\beta \sqrt{x'(t)^2 + y'(t)^2}\,\mathrm{d}t$（或对离散采样点 $(x_i, y_i)$ 用折线弦长和 `sum(hypot(diff(x), diff(y)))` 近似）。考察课程中的四条经典曲线（取尺度参数 $a = 1$）：

| 曲线名称 | 参数方程 / 极坐标方程 | 弧长被积函数 $\sqrt{\dot{x}^2+\dot{y}^2}$ | 理论精确弧长 |
| :--- | :--- | :--- | :--- |
| **摆线 (Cycloid)**（一拱 $t \in [0, 2\pi]$） | $x = a(t - \sin t), \; y = a(1 - \cos t)$ | $a\sqrt{2(1-\cos t)} = 2a\left\vert{}\sin\frac{t}{2}\right\vert{}$ | $8a = 8$ |
| **星形线 (Astroid)**（全周 $t \in [0, 2\pi]$） | $x = a\cos^3 t, \; y = a\sin^3 t$ | $3a\vert{}\sin t\cos t\vert{} = \frac{3}{2}a\vert{}\sin(2t)\vert{}$ | $6a = 6$ |
| **心形线 (Cardioid)**（全周 $\theta \in [0, 2\pi]$） | $r = a(1 - \cos\theta)$ | $\sqrt{r^2 + r'^2} = 2a\left\vert{}\sin\frac{\theta}{2}\right\vert{}$ | $8a = 8$ |
| **对数螺线 (Logarithmic Spiral)**（$\theta \in [0, 2\pi], \, k=0.2$） | $r = a e^{k\theta}$ | $a\sqrt{1+k^2}\,e^{k\theta}$ | $\frac{a\sqrt{1+k^2}}{k}\bigl(e^{2\pi k}-1\bigr)$ |

```matlab
%% 四条经典参数曲线弧长的数值计算与理论值对比 (a = 1)
a = 1; k = 0.2;
t = linspace(0, 2*pi, 2001);

% 1. 摆线 (Cycloid): 理论值 8a = 8
L_cycloid = integral(@(t) a * sqrt((1 - cos(t)).^2 + sin(t).^2), 0, 2*pi);

% 2. 星形线 (Astroid): 理论值 6a = 6
L_astroid = integral(@(t) 3 * a * abs(sin(t) .* cos(t)), 0, 2*pi);

% 3. 心形线 (Cardioid): r = a*(1 - cos(t)), 理论值 8a = 8
L_cardioid = integral(@(t) a * sqrt((1 - cos(t)).^2 + sin(t).^2), 0, 2*pi);

% 4. 对数螺线 (Logarithmic Spiral): r = a*exp(k*t)
L_spiral_num   = integral(@(t) a * sqrt(1 + k^2) * exp(k * t), 0, 2*pi);
L_spiral_exact = (a * sqrt(1 + k^2) / k) * (exp(2*pi*k) - 1);

fprintf('摆线弧长 = %.12f, 星形线弧长 = %.12f, 心形线弧长 = %.12f\n', ...
        L_cycloid, L_astroid, L_cardioid);
fprintf('对数螺线弧长 = %.12f (理论值 = %.12f)\n', L_spiral_num, L_spiral_exact);
```

## 4. 自适应数值积分 `integral`

`integral(fun, a, b)` 接收函数句柄 `fun`（默认要求 `fun` 支持向量输入并按元素返回同尺寸输出），采用全局自适应 Gauss-Kronrod (G7, K15) 求积算法，尝试使估计误差满足：

$$
|q - Q| \le \max\bigl(\mathrm{AbsTol}, \, \mathrm{RelTol} \cdot |q|\bigr),
$$

其中默认绝对容差 `AbsTol = 1e-10`，相对容差 `RelTol = 1e-6`。
- 对于向量值被积函数或内部无法向量化的函数，可设置 `'ArrayValued', true`。
- 对于复平面折线路径积分 $\int_\gamma f(z)\,\mathrm{d}z$，可通过 `'Waypoints', [z1, z2, ...]` 指定中间路径转折节点。

## 5. 蒙特卡洛积分与多重数值积分

### 5.1 蒙特卡洛（Monte Carlo）方法的收敛条件与方差阶
在有界区间 $[a, b]$ 上独立抽取均匀分布随机样本 $U_1, \dots, U_K \stackrel{\text{i.i.d.}}{\sim} U(a, b)$（密度为 $p_U(x) = \frac{1}{b-a}$），定义积分的蒙特卡洛估计量为：

$$
Q_{\text{MC}} = (b - a) \frac{1}{K} \sum_{j=1}^K f(U_j).
$$

在分析其收敛性质时，必须严格区分**一阶可积条件**与**二阶平方可积条件**：
1. **无偏性与强大数定律（仅需 $f \in L^1([a, b])$ 可积）**：当 $\int_a^b |f(x)|\,\mathrm{d}x < \infty$ 时，单次抽样期望为 $\mathbb{E}[(b-a)f(U_j)] = \int_a^b f(x)\,\mathrm{d}x = I$，故 $Q_{\text{MC}}$ 是 $I$ 的无偏估计，且由 Kolmogorov 强大数定律知当 $K \to \infty$ 时 $Q_{\text{MC}} \xrightarrow{\text{a.s.}} I$。
2. **方差阶 $O(1/K)$ 与标准误差率 $O(K^{-1/2})$（必须满足 $f \in L^2([a, b])$ 平方可积）**：当且仅当 $\int_a^b |f(x)|^2\,\mathrm{d}x < \infty$ 时，单样本方差 $\sigma_f^2 = \operatorname{Var}\bigl(f(U_1)\bigr) = \frac{1}{b-a}\int_a^b \bigl(f(x) - \frac{I}{b-a}\bigr)^2\,\mathrm{d}x < \infty$ 有限。此时估计量的**方差（Variance）为 $O(1/K)$**，而**标准差（Standard Error）为 $O(K^{-1/2})$**：

$$
\operatorname{Var}(Q_{\text{MC}}) = \frac{(b - a)^2 \sigma_f^2}{K} = O(K^{-1}), \qquad
\operatorname{Std}(Q_{\text{MC}}) = \frac{(b - a)\sigma_f}{\sqrt{K}} = O(K^{-1/2}),
$$

   且由中心极限定理（CLT）知 $\frac{\sqrt{K}(Q_{\text{MC}} - I)}{(b-a)\sigma_f} \xrightarrow{d} \mathcal{N}(0, 1)$。
   - **平方不可积的反例警示**：考察 $(0, 1)$ 上的瑕积分 $f(x) = x^{-3/4}$。虽然 $f \in L^1(0, 1)$（精确积分为 $\int_0^1 x^{-3/4}\,\mathrm{d}x = 4$，大数定律仍成立），但 $\int_0^1 \bigl(x^{-3/4}\bigr)^2\,\mathrm{d}x = \int_0^1 x^{-3/2}\,\mathrm{d}x = +\infty$，即 $f \notin L^2(0, 1)$，方差 $\sigma_f^2 = \infty$！此时有限方差公式与标准正态 CLT 均**不再适用**，经验均值会出现剧烈的重尾跳跃。
3. **非均匀分布与重要性采样（Importance Sampling）**：算术均值公式 $(b-a)\frac{1}{K}\sum f(X_j)$ 仅在 $X_j \sim U(a, b)$ 下成立；若样本 $X_j$ 服从一般概率密度 $p(x)$，则必须满足**支撑集覆盖条件** $\{x \in [a,b] : f(x) \neq 0\} \subseteq \{x \in [a,b] : p(x) > 0\}$，并采用重要性加权估计量 $\hat{I}_{\text{IS}} = \frac{1}{K}\sum_{j=1}^K \frac{f(X_j)}{p(X_j)}$。

### 5.2 二重与三重数值积分算例（`integral2` 与 `integral3`）

1. **二维复合中点公式与矩形域积分**：对于矩形区域 $[a, b] \times [c, d]$ 上的二重积分，二维复合中点公式可利用列向量与行向量的隐式扩展高效计算：$Q_{2\text{D}} = h_x h_y \sum_{i=0}^{N_x-1} \sum_{j=0}^{N_y-1} f(\xi_i, \eta_j)$。
2. **一般曲边区域二重积分 `integral2` 与三重积分 `integral3`**：在 `integral2(fun, xmin, xmax, ymin, ymax)` 中，内层积分上下限 `ymin`、`ymax` 可传入关于 `x` 的**函数句柄**（如单位圆盘 $y \in [-\sqrt{1-x^2}, \sqrt{1-x^2}]$）：

```matlab
%% 二重数值积分与三重数值积分算例
% 算例 1：矩形区域 x in [0, 2], y in [0, 1] 上的二重积分 \int_0^2 dx \int_0^1 x*sin(x*y) dy
f2_rect = @(x, y) x .* sin(x .* y);
I2_rect = integral2(f2_rect, 0, 2, 0, 1); % 先对 y in [0,1] 积分得 1-cos(x), 再对 x in [0,2] 积分得 2 - sin(2) = 1.090702573174... (注：若交换区间为 x in [0,1], y in [0,2] 则为 1 - sin(2)/2 ≈ 0.54535129)

% 算例 2：曲边区域（抛物线 y = x^2 与直线 y = x 围成区域）二重积分
f2_curve = @(x, y) x.^2 + y.^2;
I2_curve = integral2(f2_curve, 0, 1, @(x) x.^2, @(x) x); % 精确值 3/35

% 算例 3：三维单位球 x^2 + y^2 + z^2 <= 1 上的三重积分 \iiint (x^2+y^2+z^2) dx dy dz
f3_ball = @(x, y, z) x.^2 + y.^2 + z.^2;
ymin = @(x) -sqrt(1 - x.^2);
ymax = @(x)  sqrt(1 - x.^2);
zmin = @(x, y) -sqrt(max(0, 1 - x.^2 - y.^2));
zmax = @(x, y)  sqrt(max(0, 1 - x.^2 - y.^2));
I3_ball = integral3(f3_ball, -1, 1, ymin, ymax, zmin, zmax); % 精确值 4*pi/5
```

3. **第一型曲面积分的面积元权重**：若计算显式曲面 $z = z(x, y)$ 上的第一型曲面积分 $\iint_S g(x, y, z)\,\mathrm{d}S$，投影至平面区域 $D_{xy}$ 时必须乘以曲面面积元雅可比因子 $\mathrm{d}S = \sqrt{1 + z_x^2 + z_y^2}\,\mathrm{d}x\,\mathrm{d}y$，不可直接用被积函数均值乘以底面投影面积。

## 6. 配套材料与参考练习说明

- **参考练习说明**：第六课配套的四道数值微积分练习题（自适应求积容差实验、差分网格对齐、非均匀采样积分与球面曲面积分）属于**课后参考练习题（无需提交）**，完整数学解析详见 [[MATLAB/课程讲义/补充_第六周参考作业解读|第六周参考作业解读]]。
- [[MATLAB/课程讲义/06B_第六周实验课|第六周实验课]]：符号拉普拉斯变换、矩阵特征分解与差商误差实验、含噪信号求导、摆线弧长及欧拉通路算法。
- [[MATLAB/课程讲义/07_MATLAB微分方程数值解法|第七课：MATLAB 微分方程数值解法]]。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
