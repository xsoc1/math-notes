---
title: 第八周实验代码与二维 Simpson 扩充
date: 2026-10-30
tags:
  - matlab/lecture
  - matlab/numerical-calculus
  - matlab/monte-carlo
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/08C_第八周实验代码与二维Simpson.md"
matlab_source_sha256: 5c1e62f780a7658c1b0087c263bc7090edfc280fd470bfa81e418d9b3a1d84b5
---

# 第八周实验代码与二维 Simpson 节点权重化

来源：[[MATLAB/课程讲义/08B_第八周实验课|第八周实验课]] 配套完整代码解析与二维复合 Simpson 张量积权重矩阵推导。本文完整收录第八周实验课全部实验题的可复现 MATLAB 代码、二维复合 Simpson 求积公式推导、张量积权重矩阵构造，以及针对基准积分 $\iint_{[0,1]^2}(1+x^2+y^2)^{-3/2}\,dx\,dy = \frac{\pi}{6}$ 的 $O(h^4)$ 误差阶验证与浮点舍入误差分析。

## 一、 二维复合 Simpson 数值积分公式推导与张量积权重矩阵构造

### 1.1 从一维复合 Simpson 到二维累次求积推导

设矩形积分区域为 $D = [a, b] \times [c, d]$。将 $x$ 方向区间 $[a, b]$ 偶等分为 $N_x = 2m$ 个子区间，步长 $h_x = \frac{b-a}{2m}$，节点为 $x_i = a + i h_x \, (i = 0, 1, \dots, 2m)$；将 $y$ 方向区间 $[c, d]$ 偶等分为 $N_y = 2n$ 个子区间，步长 $h_y = \frac{d-c}{2n}$，节点为 $y_j = c + j h_y \, (j = 0, 1, \dots, 2n)$。

对任意固定的 $y \in [c, d]$，对内层积分 $\phi(y) = \int_a^b f(x, y)\,dx$ 应用一维复合 Simpson 公式：

$$
\phi(y) = \int_a^b f(x, y)\,dx = \frac{h_x}{3} \sum_{i=0}^{2m} w_i^{(x)} f(x_i, y) + R_x(y),
$$

其中一维无量纲 Simpson 节点权重为：

$$
w^{(x)} = \bigl[1, \, 4, \, 2, \, 4, \, 2, \, \dots, \, 2, \, 4, \, 1\bigr] \in \mathbb{R}^{1 \times (2m+1)}, \qquad
R_x(y) = -\frac{b - a}{180} h_x^4 \frac{\partial^4 f}{\partial x^4}(\xi_y, y).
$$

再对外层积分 $I = \int_c^d \phi(y)\,dy$ 应用 $y$ 方向的一维复合 Simpson 公式（无量纲权重向量记为 $w^{(y)} = [1, 4, 2, 4, \dots, 4, 1] \in \mathbb{R}^{1 \times (2n+1)}$），由积分线性性质可得二维复合 Simpson 求积公式：

$$
I = \int_c^d \int_a^b f(x, y)\,dx\,dy \approx \frac{h_x h_y}{9} \sum_{j=0}^{2n} \sum_{i=0}^{2m} w_j^{(y)} w_i^{(x)} f(x_i, y_j).
$$

当被积函数 $f \in C^4([a, b] \times [c, d])$ 时，将内层余项与外层余项合并，可得二维复合 Simpson 公式的整体截断误差为：

$$
E_{\text{trunc}}(h_x, h_y) = -\frac{(b-a)(d-c)}{180}\left[ h_x^4 \frac{\partial^4 f}{\partial x^4}(\xi_1, \eta_1) + h_y^4 \frac{\partial^4 f}{\partial y^4}(\xi_2, \eta_2) \right] = O(h_x^4 + h_y^4).
$$

特别地，当取各向同性步长 $h_x \asymp h_y \asymp h$ 且四阶偏导数主项非零并占主导地位时，随着网格加密（$h \to 0$），每次将网格等分数加倍（$h \to h/2$），理论截断误差主项**渐近缩小为原来的 $\left(\frac{1}{2}\right)^4 = \frac{1}{16}$**，且该公式对所有关于 $x$ 和 $y$ 次数均不超过 $3$ 的二元多项式精确成立。

### 1.2 张量积权重矩阵与矩阵双线性型表达

令带步长因子的一维行权重向量分别为：

$$
W_x = \frac{h_x}{3} w^{(x)} \in \mathbb{R}^{1 \times (N_x + 1)}, \qquad
W_y = \frac{h_y}{3} w^{(y)} \in \mathbb{R}^{1 \times (N_y + 1)}.
$$

当使用 `[X, Y] = meshgrid(x, y)` 生成二维网格采样矩阵时，$F = f(X, Y)$ 的尺寸为 $(N_y + 1) \times (N_x + 1)$（行指标 $j$ 对应 $y_j$，列指标 $i$ 对应 $x_i$）。此时有两种完全等价的向量化实现形式：

1. **张量积（外积）二维权重矩阵法**：构造二维权重矩阵 $W = W_y^{\mathsf T} W_x \in \mathbb{R}^{(N_y+1) \times (N_x+1)}$，其中纯无量纲权重矩阵 $\widetilde{W} = (w^{(y)})^{\mathsf T} w^{(x)}$ 在单个 $2 \times 2$ 子块上的 9 点模板为
   $$
   \widetilde{W}_{\text{local}} = \begin{bmatrix} 1 \\ 4 \\ 1 \end{bmatrix} \begin{bmatrix} 1 & 4 & 1 \end{bmatrix} = \begin{bmatrix} 1 & 4 & 1 \\ 4 & 16 & 4 \\ 1 & 4 & 1 \end{bmatrix},
   $$
   在复合拼接处边界权重叠加为 $2$、交叉点叠加为 $4$，求积公式写作逐元素乘积总和 $I \approx \operatorname{sum}(W \odot F, \, \text{'all'})$。
2. **矩阵-向量双线性型法（免显式生成二维权重阵）**：直接利用矩阵乘法计算
   $$
   I \approx \sum_{j=1}^{N_y+1} \sum_{i=1}^{N_x+1} W_{y,j} F_{j,i} W_{x,i} = W_y \cdot F(X, Y) \cdot W_x^{\mathsf T}.
   $$

```matlab
function [I, W] = simpson2d(func, a, b, c, d, m, n)
% SIMPSON2D 二维复合 Simpson 向量化数值求积与张量积权重矩阵构造
%   m, n 分别为 x, y 方向的 Simpson 子块数（总子区间数为 Nx = 2*m, Ny = 2*n）
    Nx = 2 * m;
    Ny = 2 * n;
    hx = (b - a) / Nx;
    hy = (d - c) / Ny;
    x = linspace(a, b, Nx + 1);
    y = linspace(c, d, Ny + 1);

    wx = ones(1, Nx + 1);
    wx(2:2:Nx) = 4;
    wx(3:2:Nx-1) = 2;
    Wx = (hx / 3) * wx;

    wy = ones(1, Ny + 1);
    wy(2:2:Ny) = 4;
    wy(3:2:Ny-1) = 2;
    Wy = (hy / 3) * wy;

    [X, Y] = meshgrid(x, y);
    F = func(X, Y);

    % 构造二维张量积权重矩阵 W，并由双线性型计算积分
    W = Wy.' * Wx;
    I = Wy * F * Wx.';
end
```

### 1.3 原稿基准二重积分 $\frac{\pi}{6}$ 的 $O(h^4)$ 误差阶验证与浮点舍入分析

考察原讲义基准二重积分（其精确解析解为 $\frac{\pi}{6}$）：

$$
I_{\text{exact}} = \int_0^1 \int_0^1 \frac{1}{(1 + x^2 + y^2)^{3/2}}\,dx\,dy = \arctan\!\left(\frac{1}{\sqrt{3}}\right) = \frac{\pi}{6} \approx 0.523598775598299.
$$

与上方 `simpson2d(func, a, b, c, d, m, n)` 的参数定义完全一致，令 Simpson 子块数依次取 $m = n = 1, 2, 4, 8, 16, 32, 64, 128$（对应每个方向的总子区间数 $N = 2m = 2, 4, 8, 16, 32, 64, 128, 256$，步长 $h = \frac{1}{2m}$），验证渐近四阶收敛阶 $p = \log_2\bigl(E(2h)/E(h)\bigr) \to 4$：

```matlab
func = @(x, y) (1 + x.^2 + y.^2).^(-3/2);
I_exact = pi / 6;

m_list = [1, 2, 4, 8, 16, 32, 64, 128]; % Simpson 子块数 m (总子区间数 N = 2*m)
errs = zeros(size(m_list));
for k = 1:numel(m_list)
    m = m_list(k);
    errs(k) = abs(simpson2d(func, 0, 1, 0, 1, m, m) - I_exact);
end
ratios = errs(1:end-1) ./ errs(2:end);
orders = log2(ratios);

for k = 1:numel(m_list)
    if k == 1
        fprintf('m = %3d (N = %3d): 绝对误差 = %.6e\n', m_list(k), 2*m_list(k), errs(k));
    else
        fprintf('m = %3d (N = %3d): 绝对误差 = %.6e, 误差比 = %7.4f, 观测阶 = %.4f\n', ...
            m_list(k), 2*m_list(k), errs(k), ratios(k-1), orders(k-1));
    end
end
```

上述脚本输出的精确绝对误差、相邻误差比与观测收敛阶逐行对照表如下：

| Simpson 子块数 $m$ | 总子区间数 $N = 2m$ | 步长 $h = \frac{1}{2m}$ | 绝对误差 $\vert{}I_{m,m} - \frac{\pi}{6}\vert{}$ | 相邻误差比 $E(2h)/E(h)$ | 观测收敛阶 $p = \log_2\frac{E(2h)}{E(h)}$ |
| :---: | :---: | :---: | :---: | :---: | :---: |
| $1$ | $2$ | $1/2$ | $4.055494\times 10^{-3}$ | — | — |
| $2$ | $4$ | $1/4$ | $1.876600\times 10^{-5}$ | $216.1086$ | $7.7556$ |
| $4$ | $8$ | $1/8$ | $5.081450\times 10^{-7}$ | $36.9304$ | $5.2067$ |
| $8$ | $16$ | $1/16$ | $2.833603\times 10^{-8}$ | $17.9328$ | $4.1645$ |
| $16$ | $32$ | $1/32$ | $1.717306\times 10^{-9}$ | $16.5003$ | $4.0444$ |
| $32$ | $64$ | $1/64$ | $1.064920\times 10^{-10}$ | $16.1261$ | $4.0113$ |
| $64$ | $128$ | $1/128$ | $6.642686\times 10^{-12}$ | $16.0315$ | $4.0028$ |
| $128$ | $256$ | $1/256$ | $4.148947\times 10^{-13}$ | $16.0105$ | $4.0010$ |

**渐近四阶收敛、浮点舍入与原稿 $M = 2000$ 时 `err = 0` 的原理辨析**：
1. **渐近趋于 $16$ 倍**：当网格较粗（$m = 1 \to 2 \to 4$）时，高阶导数余项尚未进入主阶渐近区；随着子块数加密至 $m = 16, 32, 64, 128$，相邻步长减半的误差比依次为 $16.5003 \to 16.1261 \to 16.0315 \to 16.0105$，**渐近趋于理论值 $2^4 = 16$**，且在 $m \le 128$ 范围内四阶截断误差 $O(h^4)$ 仍占主导地位。
2. **原讲义中大网格 $M = 2000$ 出现计算误差 `err = 0` 的浮点解释**：在原实验中，当取极细网格（如 $M = 2000$）计算 `err = abs(I_num - pi/6)` 时，有时会观测到输出 `err = 0`。这**绝不意味着数学上的真实积分截断误差恒等于零，也不意味着 IEEE 754 `double` 浮点数不能表示比 $10^{-16}$ 更小的非零正数**（事实上 `double` 的最小正规正数 `realmin` 低达 $2^{-1022} \approx 2.225\times 10^{-308}$）！其真实原因是：被减数 `I_num` 与减数 `pi/6` 均位于数值 $\approx 0.5236 \in [0.5, 1)$ 附近，而在该量级处相邻两个双精度浮点数的最小间隔（Unit in the Last Place）为 $\operatorname{eps}(0.5) = 2^{-53} \approx 1.11\times 10^{-16}$；当数值求积结果 `I_num` 与 `fl(pi/6)` 恰好舍入到同一个 64 位二进制浮点数比特位时，两者相减的结果必然精确为 `0`.

## 二、 原课件实验题完整参考代码

### 2.1 原课件四道核心数值实验题完整脚本

```matlab
function lab08_core_problems()
% LAB08_CORE_PROBLEMS 第八周实验课原课件四道核心题完整实现

    %% 第 1 题：原题 Q1 在 [0, 1] 上对 1/(1+x^2) 用高阶 Newton-Cotes (Boole) 求积并乘 4 估计 pi
    f1 = @(x) 1 ./ (1 + x.^2);       % 原题 Q1 被积函数 1/(1+x^2), 乘以 4 后真值为 pi
    a = 0; b = 1; m = 10;
    N = 4 * m; h = (b - a) / N;
    x = linspace(a, b, N + 1);
    w = [7, repmat([32, 12, 32, 14], 1, m - 1), 32, 12, 32, 7] * (2 * h / 45);
    pi_boole = 4 * sum(w .* f1(x));
    fprintf('[题1] 原题 Q1 复合 Boole 估计 pi = %.15f, 相对 pi 误差 = %.2e\n', pi_boole, abs(pi_boole - pi));

    %% 第 2 题：原题 Q2 在 [0, 1] 上对 f2(x) = x^2 + x 随机乱序采样点的联合排序求积 (真值 5/6)
    rng(101);
    f2 = @(x) x.^2 + x;              % 原题 Q2 被积函数 x^2 + x, 在 [0, 1] 上精确积分为 5/6
    K = 1000;
    X_rand = a + (b - a) * rand(1, K); % [0, 1] 上无序随机点
    Y_rand = f2(X_rand);               % 对应函数值 X.^2 + X
    [X_sort, order] = sort(X_rand);
    Y_sort = Y_rand(order);
    % 补齐区间左右端点 [0, 1] 以消除边界覆盖缺失误差
    X_full = [a, X_sort, b];
    Y_full = [f2(a), Y_sort, f2(b)];
    I_sort_trapz = trapz(X_full, Y_full);
    fprintf('[题2] 原题 Q2 (x^2+x) 联合排序 trapz 积分 = %.8f (精确真值 5/6 = %.8f)\n', I_sort_trapz, 5/6);

    %% 第 3 题：原题 Q3 读取外部数据 prob_data401.mat (t in [0, 2*pi] 共 2001 个采样点) 滤波求导
    if isfile('prob_data401.mat')
        S_data = load('prob_data401.mat'); % 载入原题 2001 点观测数据 t, y (t in [0, 2*pi])
        t = S_data.t(:).';
        y_obs = S_data.y(:).';
        dt = t(2) - t(1);
        dy_direct   = gradient(y_obs, dt);
        dy_filtered = gradient(smoothdata(y_obs, 'movmean', 21), dt);
        fprintf('[题3] 原题数据 prob_data401.mat (N=%d 点): 直接差商标准差 = %.4f, 平滑导数标准差 = %.4f\n', ...
            numel(t), std(dy_direct), std(dy_filtered));
    else
        % 合成教学信号示范（严格与 prob_data401.mat 实测数据区分，不冒用原数据文件名）
        t_syn = linspace(0, 2*pi, 2001);
        dt_syn = t_syn(2) - t_syn(1);
        y_syn = sin(t_syn) + 0.02 * randn(size(t_syn));
        dy_syn_raw  = gradient(y_syn, dt_syn);
        dy_syn_filt = gradient(smoothdata(y_syn, 'movmean', 21), dt_syn);
        fprintf('[题3-合成示范] 未检测到 prob_data401.mat，运行 2001 点合成正弦信号: 直接求导 RMSE = %.4f, 平滑 RMSE = %.4f\n', ...
            sqrt(mean((dy_syn_raw - cos(t_syn)).^2)), sqrt(mean((dy_syn_filt - cos(t_syn)).^2)));
    end

    %% 第 4 题：圆盘内四只鸭子同处一个半圆的几何概率模拟 (理论值 1/2)
    num_trials = 5e5;
    % 在单位圆盘内按面积均匀抽样：r = sqrt(U_1), theta = 2*pi*U_2
    r_duck = sqrt(rand(4, num_trials)); %#ok<NASGU>
    theta_duck = sort(2 * pi * rand(4, num_trials), 1);
    arc_gaps = [diff(theta_duck, 1, 1); 2*pi - theta_duck(4, :) + theta_duck(1, :)];
    p_same_semicircle = mean(max(arc_gaps, [], 1) >= pi);
    fprintf('[题4] 四鸭同处半圆模拟概率 = %.6f, 理论精确值 = 0.500000\n', p_same_semicircle);
end
```

### 2.2 线性代数六道实验题完整汇总脚本

```matlab
function lab08_linalg_six_problems()
% LAB08_LINALG_SIX_PROBLEMS 第八周线性代数 6 道实验题完整参考代码

    % 实验题 1：矩阵构造、子块提取与矩阵函数对比
    M = magic(5);
    T = diag(2*ones(5,1)) - diag(ones(4,1),1) - diag(ones(4,1),-1);
    sub_M = M(2:4, 2:4); %#ok<NASGU>
    err_expm = norm(expm(T) - exp(T), 2);

    % 实验题 2：线性方程组相容性、基本解与极小范数解对比
    A2 = [1, 2, 1, 1; 2, 4, 3, 3; 1, 2, 2, 2];
    b2 = [4; 11; 7];
    x_qr   = A2 \ b2;
    x_pinv = pinv(A2) * b2;
    Z_null = null(A2, 'r'); %#ok<NASGU>

    % 实验题 3：LU, Cholesky, QR, SVD 分解验证
    A3 = [4, 1, -1; 1, 3, 1; -1, 1, 5];
    [L3, U3, P3] = lu(A3);
    R3 = chol(A3);
    [Q3, R_qr3] = qr(A3);
    [U_s3, S_s3, V_s3] = svd(A3);
    decomp_err = max([norm(P3*A3 - L3*U3), norm(A3 - R3.'*R3), ...
                      norm(A3 - Q3*R_qr3), norm(A3 - U_s3*S_s3*V_s3.')]);

    % 实验题 4：特征分解与矩阵高次幂状态转移
    P_markov = [0.85, 0.25; 0.15, 0.75];
    [V4, D4] = eig(P_markov);
    P_k = V4 * (D4^50) / V4; %#ok<NASGU>

    % 实验题 5：Hilbert 矩阵病态扰动实验
    H8 = hilb(8);
    x_exact = ones(8, 1);
    b8 = H8 * x_exact;
    x_pert = H8 \ (b8 + 1e-10 * ones(8, 1));
    hilb_rel_err = norm(x_pert - x_exact) / norm(x_exact);

    % 实验题 6：Jacobi 与 Gauss-Seidel 分裂迭代对比
    A6 = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, -1; 0, 3, -1, 8];
    b6 = [6; 25; -11; 15];
    x_j = zeros(4, 1); x_gs = zeros(4, 1);
    D6 = diag(diag(A6)); L6 = -tril(A6, -1); U6 = -triu(A6, 1);
    for k = 1:50
        x_j  = D6 \ ((L6 + U6) * x_j + b6);
        x_gs = (D6 - L6) \ (U6 * x_gs + b6);
    end

    fprintf('expm差异=%.2e, 极小范数||x_pinv||=%.4f <= ||x_qr||=%.4f\n', ...
        err_expm, norm(x_pinv), norm(x_qr));
    fprintf('四大分解最大残差=%.2e, Hilb(8)扰动相对误差=%.2e, GS残差=%.2e\n', ...
        decomp_err, hilb_rel_err, norm(b6 - A6*x_gs));
end
```

## 三、 补充算例：二阶常微分方程降阶与 `ode45` 实现

考虑二阶线性非齐次初值问题 $y'' + 2y' + 5y = \sin(t), \, y(0) = 1, \, y'(0) = 0$。令 $y_1 = y, \, y_2 = y'$，化为一阶系统：

$$
\begin{cases}
y_1' = y_2, \\
y_2' = \sin(t) - 2y_2 - 5y_1.
\end{cases}
$$

```matlab
function ode_demo()
    tspan = [0, 10];
    y0 = [1; 0];
    [t, Y] = ode45(@sys_ode, tspan, y0);
    plot(t, Y(:, 1), '-b', t, Y(:, 2), '--r', 'LineWidth', 1.2);
    xlabel('t'); ylabel('State');
    legend('y(t)', 'y''(t)');
    grid on;
end

function dYdt = sys_ode(t, Y)
    dYdt = [Y(2); sin(t) - 2*Y(2) - 5*Y(1)];
end
```

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
