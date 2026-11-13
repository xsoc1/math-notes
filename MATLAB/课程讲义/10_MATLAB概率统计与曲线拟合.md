---
title: 第十课 MATLAB 概率统计与曲线拟合
date: 2026-11-04
tags:
  - matlab/lecture
  - matlab/statistics
  - matlab/curve-fitting
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/10_MATLAB概率统计与曲线拟合.md"
matlab_source_sha256: 0ca2057e4c49e91be38e532ada00939d3f842fd7d29b92fde65a09274b7b4e09
---

# 第十课：MATLAB 概率统计与曲线拟合

来源：[[MATLAB/课程资料/原始课件/第十课 MATLAB概率统计与曲线拟合.pdf|第十课 MATLAB概率统计与曲线拟合.pdf]]（共 32 页）。本讲系统讲解常见概率分布函数族、伪随机数仿射变换、生日悖论 Monte Carlo 模拟、双纵轴图形绘制、样本描述性统计量，以及多项式拟合、一般线性基函数拟合（$\Phi\mathbf{c} \approx \mathbf{y}$）、加权最小二乘、正则化/鲁棒回归与非线性最小二乘曲线拟合的数学原理及 MATLAB 实现。

阅读前置：[[MATLAB/课程讲义/04_MATLAB数组定义与数组化编程|第四课的向量与矩阵运算]]、[[MATLAB/课程讲义/09_MATLAB进阶程序设计与问题求解|第九课的最优化与求根]]。

## 1. 概率分布函数族、随机数线性变换与生日悖论模拟

### 1.1 概率分布函数族后缀体系
MATLAB Statistics and Machine Learning Toolbox 采用统一的后缀规则组织概率分布函数：
- `*pdf`：连续型分布的概率密度函数 $f(x)$ 或离散型分布的概率质量函数 $P(X = k)$；
- `*cdf`：累积分布函数 $F(x) = P(X \le x)$；
- `*inv`：逆累积分布函数（分位数函数）$F^{-1}(p) = \inf\{x : F(x) \ge p\}$；
- `*stat`：分布的理论均值与方差 $[E(X), \operatorname{Var}(X)]$；
- `*rnd`：对应分布的伪随机数生成函数。

常见分布前缀对照：
- 正态分布 $\mathcal{N}(\mu, \sigma^2)$：`normpdf`, `normcdf`, `norminv`, `normstat`, `normrnd`（注意参数为**标准差 $\sigma$** 而非方差 $\sigma^2$）
- 连续均匀分布 $U(a, b)$：`unifpdf`, `unifcdf`, `unifinv`, `unifstat`, `unifrnd`
- 二项分布 $B(n, p)$：`binopdf`, `binocdf`, `binoinv`, `binostat`, `binornd`
- 泊松分布 $\mathcal{P}(\lambda)$：`poisspdf`, `poisscdf`, `poissinv`, `poissstat`, `poissrnd`

### 1.2 基础伪随机数的仿射线性变换与分位数计算
在不依赖统计工具箱时，可直接利用内建基础随机数生成器通过**仿射线性变换**构造任意区间均匀分布与一般正态分布：
1. **区间 $[a, b]$ 上的均匀分布 $X \sim U(a, b)$**：由标准均匀分布 $U \sim U(0, 1)$（`rand`）作线性伸缩平移：
   $$
   X = a + (b - a)U \implies \text{\texttt{X = a + (b - a) * rand(m, n)}}.
   $$
2. **均值 $\mu$、方差 $\sigma^2$ 的正态分布 $Y \sim \mathcal{N}(\mu, \sigma^2)$**：由标准正态分布 $Z \sim \mathcal{N}(0, 1)$（`randn`）作线性变换（注意乘以标准差 $\sigma = \sqrt{\sigma^2}$，因为 $\operatorname{Var}(\sigma Z) = \sigma^2 \operatorname{Var}(Z) = \sigma^2$）：
   $$
   Y = \mu + \sigma Z \implies \text{\texttt{Y = mu + sigma * randn(m, n)}}.
   $$
3. **逆变换抽样法（Inverse Transform Sampling）**：对具有严格递增连续分布函数 $F(x)$ 的随机变量（如参数为 $\lambda$ 的指数分布 $F(x) = 1 - e^{-\lambda x}$），令 $U \sim U(0, 1)$，则 $X = F^{-1}(U) = -\frac{1}{\lambda}\ln(1 - U) \stackrel{d}{=} -\frac{1}{\lambda}\ln U$ 即精确服从该分布。

### 1.3 双纵轴图形绘制（`yyaxis left` / `yyaxis right`）
当需要在同一张图中同时展示量纲或数值范围不同的两条曲线（例如标准正态分布的概率密度函数 $f(x) \in (0, 0.4]$ 与累积分布函数 $F(x) \in [0, 1]$，或标注双侧 $95\%$ 临界分位数 $z_{0.975} = \Phi^{-1}(0.975) \approx 1.95996$）时，使用 `yyaxis left` 与 `yyaxis right` 创建左右双纵轴：

```matlab
x = linspace(-3.5, 3.5, 301);
f_norm = normpdf(x, 0, 1);
F_norm = normcdf(x, 0, 1);
z_0975 = norminv(0.975, 0, 1); % 标准正态双侧 95% 临界分位数 1.95996...

figure;
yyaxis left
plot(x, f_norm, 'b-', 'LineWidth', 1.5);
ylabel('概率密度 PDF f(x)');

yyaxis right
plot(x, F_norm, 'r--', 'LineWidth', 1.5);
ylabel('累积分布 CDF \Phi(x)');
xline(z_0975, 'k:', 'z_{0.975} \approx 1.96');
grid on; xlabel('x');
title('标准正态分布 PDF 与 CDF 双纵轴对照图');
```

### 1.4 经典概率算例：生日悖论（Birthday Paradox）解析计算与 Monte Carlo 模拟
**问题**：假设一年有 $365$ 天且每天出生概率相等，房间内有 $k$ 个人，求“至少有两人生日相同”的概率 $P(k)$。
- **精确解析概率**：对立事件“$k$ 个人生日两两不同”的概率为 $P_{\text{diff}}(k) = \frac{365 \times 364 \times \cdots \times (365 - k + 1)}{365^k} = \prod_{j=0}^{k-1}\left(1 - \frac{j}{365}\right)$，故 $P(k) = 1 - \prod_{j=0}^{k-1}\left(1 - \frac{j}{365}\right)$。当 $k = 23$ 时，$P(23) \approx 0.5073 > 50\%$；当 $k = 50$ 时，$P(50) \approx 0.9704$。
- **向量化 Monte Carlo 模拟**：生成 $k \times M$ 的随机整数矩阵 `B = randi(365, k, M)`，对每列排序后用 `any(diff(sort(B, 1), 1, 1) == 0, 1)` 检验是否存在相邻重复生日：

```matlab
%% 生日悖论：理论概率与 Monte Carlo 随机模拟对比
k = 23;
M = 100000; % 模拟 10 万次
p_exact = 1 - prod((365 - (0:k-1)) / 365);

rng(42);
B = randi(365, k, M);
has_collision = any(diff(sort(B, 1), 1, 1) == 0, 1);
p_mc = mean(has_collision);
fprintf('k = %d 人时生日撞期概率: 精确值 = %.4f, Monte Carlo 估计 = %.4f\n', k, p_exact, p_mc);
```

## 2. 样本描述性统计量与归一化分母

设样本观测向量为 $\mathbf{x} = [x_1, x_2, \dots, x_N]^{\mathsf{T}}$：
- **样本均值**：$\bar{x} = \frac{1}{N} \sum_{i=1}^N x_i \implies \text{\texttt{mean(x)}}$
- **无偏样本方差（Bessel 修正，默认权重 `w = 0`）**：$S^2 = \frac{1}{N-1} \sum_{i=1}^N (x_i - \bar{x})^2 \implies \text{\texttt{var(x)} 或 \texttt{var(x, 0)}}$
- **二阶样本中心矩（有偏样本方差 / 正态 MLE，权重 `w = 1`）**：$\hat{\sigma}^2_{\text{MLE}} = \frac{1}{N} \sum_{i=1}^N (x_i - \bar{x})^2 \implies \text{\texttt{var(x, 1)}}$
- **样本标准差**：$S = \sqrt{S^2} \implies \text{\texttt{std(x, 0)}}$；$\hat{\sigma}_{\text{MLE}} = \sqrt{\hat{\sigma}^2_{\text{MLE}}} \implies \text{\texttt{std(x, 1)}}$
- **中位数、四分位距与协方差阵**：`median(x)`、`iqr(x)`、`cov(X)`、`corrcoef(X)`

## 3. 多项式最小二乘拟合 `polyfit` 与预测标准误差 `polyval`

### 3.1 法方程、Vandermonde 超定系统与中心化缩放
给定离散观测点 $(x_i, y_i) \, (i = 1, \dots, N)$，寻找 $n \, (n < N)$ 次多项式 $P_n(x) = a_n x^n + a_{n-1}x^{n-1} + \cdots + a_1 x + a_0$ 极小化残差平方和：

$$
\min_{\mathbf{a} \in \mathbb{R}^{n+1}} \sum_{i=1}^N \bigl(P_n(x_i) - y_i\bigr)^2 = \min_{\mathbf{a}} \|V \mathbf{a} - \mathbf{y}\|_2^2,
$$

其中 $V \in \mathbb{R}^{N \times (n+1)}$ 为 Vandermonde 矩阵。当节点中含有至少 $n+1$ 个互异点时，$V$ 列满秩，法方程 $V^{\mathsf{T}} V \mathbf{a} = V^{\mathsf{T}} \mathbf{y}$ 存在唯一最小二乘解（`polyfit` 底层通过列主元 QR 分解求解以改善数值稳定性）。通过三输出形式 `[p, S, mu] = polyfit(x, y, n)`，MATLAB 对自变量做中心化与标准差缩放 $\hat{x} = (x - \mu_1)/\mu_2$，可显著降低高阶拟合时 Vandermonde 矩阵的条件数。

### 3.2 `polyval` 输出 `delta` 的严格统计定义与 95% 预测区间构造
在调用 `[y_fit, delta] = polyval(p, x_fine, S, mu)` 时，必须准确理解第二个返回值 `delta` 的统计含义：
- **`delta` 是未来新观测值的预测标准误差估计（Standard Error of Prediction），尚未乘以 $95\%$ 置信水平的临界分位数**（参见 [MathWorks polyval 官方文档](https://www.mathworks.com/help/matlab/ref/polyval.html)）：
  $$
  \text{delta}(x_0) = s \sqrt{1 + \mathbf{v}(x_0)^{\mathsf{T}}(V^{\mathsf{T}}V)^{-1}\mathbf{v}(x_0)}, \qquad s = \frac{\|\mathbf{r}\|_2}{\sqrt{\nu}},
  $$
  其中 $\nu = N - (n + 1)$（保存于 `S.df` 中）为残差自由度。
- **逐点 $95\%$ 预测区间（Prediction Interval）**：在多项式模型设定正确、且随机误差独立同分布服从同方差正态分布 $\varepsilon_i \stackrel{\text{i.i.d.}}{\sim} \mathcal{N}(0, \sigma^2)$ 的前提下，新观测值 $Y(x_0)$ 的精确逐点 $1 - \alpha$（如 $95\%$）预测区间应乘以自由度为 $\nu = N - (n+1)$ 的 Student-$t$ 分布双侧临界值 $t_{1-\alpha/2, \, \nu}$：
  $$
  \hat{y}(x_0) \pm t_{0.975, \, \nu} \cdot \text{delta}(x_0), \qquad t_{0.975, \, \nu} = \operatorname{tinv}(0.975, \, \nu).
  $$
  例如下方算例中样本数 $N = 6$，二次多项式拟合阶数 $n = 2$（共 $n+1 = 3$ 个待估系数），残差自由度为 **$\nu = 6 - 3 = 3$**，对应的 $95\%$ 临界值为 $t_{0.975, 3} \approx 3.1824$（仅当样本量 $N \to \infty$ 使 $\nu \gg 30$ 时，$t_{0.975, \nu} \to 1.96 \approx 2$，此时文档中常见的粗略近似 $\hat{y} \pm 2\,\text{delta}$ 才渐近接近 $95\%$ 预测区间）。

```matlab
x = [1, 2, 3, 4, 5, 6];
y = [2.1, 3.9, 8.2, 15.8, 26.1, 38.0];

% 二次多项式最小二乘拟合（返回降幂系数 [a2, a1, a0] 与误差结构体 S, 缩放参数 mu）
[p, S, mu] = polyfit(x, y, 2);

% 在加密网格上求值并计算预测标准误差估计 delta (自由度 S.df = 6 - 3 = 3)
x_fine = linspace(1, 6, 200);
[y_fit, delta] = polyval(p, x_fine, S, mu);

% 构造自由度 df = 3 下的逐点 95% 预测区间: y_fit +/- t_(0.975, 3) * delta
t_crit = tinv(0.975, S.df); % df = 3 时 t_crit = 3.182446...
y_pred_lo = y_fit - t_crit * delta;
y_pred_hi = y_fit + t_crit * delta;
```

## 4. 一般线性基函数拟合 $\Phi \mathbf{c} \approx \mathbf{y}$、加权/正则化回归与非线性拟合

### 4.1 一般线性基函数拟合与正规方程唯一可逆条件
若拟合模型关于待估参数向量 $\mathbf{c} = [c_1, c_2, \dots, c_m]^{\mathsf{T}} \in \mathbb{R}^m$ 呈线性组合形式：

$$
f(x; \mathbf{c}) = c_1 \varphi_1(x) + c_2 \varphi_2(x) + \cdots + c_m \varphi_m(x),
$$

（例如谐波模型 $y(x) = c_1 + c_2 \sin x + c_3 \cos x$ 或含对数/指数已知基的组合），在观测节点 $x_1, \dots, x_N$（$N \ge m$）上构造 **$N \times m$ 设计矩阵（Design Matrix）** $\Phi$：

$$
\Phi = \begin{bmatrix} \varphi_1(x_1) & \varphi_2(x_1) & \cdots & \varphi_m(x_1) \\ \varphi_1(x_2) & \varphi_2(x_2) & \cdots & \varphi_m(x_2) \\ \vdots & \vdots & \ddots & \vdots \\ \varphi_1(x_N) & \varphi_2(x_N) & \cdots & \varphi_m(x_N) \end{bmatrix} \in \mathbb{R}^{N \times m}.
$$

最小二乘问题 $\min_{\mathbf{c} \in \mathbb{R}^m} \|\Phi \mathbf{c} - \mathbf{y}\|_2^2$ 对 $\mathbf{c}$ 求梯度并令其为零，导出**正规方程（Normal Equations / 法方程）**：

$$
\Phi^{\mathsf{T}} \Phi \mathbf{c} = \Phi^{\mathsf{T}} \mathbf{y}.
$$

- **正规方程唯一求解的满秩条件**：**当且仅当设计矩阵 $\Phi$ 列满秩（即 $\operatorname{rank}(\Phi) = m$，各基函数在采样节点集上线性无关）时，Gram 矩阵 $\Phi^{\mathsf{T}}\Phi \in \mathbb{R}^{m \times m}$ 是对称正定矩阵（从而可逆）**，此时最小二乘解唯一，理论表达式为 $\mathbf{c}^* = (\Phi^{\mathsf{T}}\Phi)^{-1}\Phi^{\mathsf{T}}\mathbf{y}$。
- **MATLAB 数值求解规范**：在代码中切勿显式计算 `inv(Phi' * Phi) * (Phi' * y)`（因为 $\kappa_2(\Phi^{\mathsf{T}}\Phi) = \kappa_2(\Phi)^2$ 会将条件数平方恶化），而应直接使用左除 `c = Phi \ y`（底层通过列主元 QR 分解直接获得全局最优最小二乘解）。

```matlab
%% 一般线性基函数模型 y = c1 + c2*sin(x) + c3*cos(x) 最小二乘拟合
x_obs = linspace(0, 2*pi, 50).';
y_obs = 1.5 + 2.0 * sin(x_obs) - 0.8 * cos(x_obs) + 0.1 * randn(size(x_obs));

Phi = [ones(size(x_obs)), sin(x_obs), cos(x_obs)]; % 50x3 列满秩设计矩阵 (rank = 3)
c_hat = Phi \ y_obs; % 直接通过 QR 分解求解 Phi * c ≈ y_obs
```

### 4.2 非线性最小二乘拟合（`lsqcurvefit` / `nlinfit` / `fit`）与算法选项
1. **何时必须使用非线性最小二乘？**
   当未知参数进入指数衰减率、**未知角频率**或分母等无法通过恒等展开化为线性组合的位置时（例如指数模型 $y = p_1 e^{-p_2 x} + p_3$，或**频率 $\omega$ 未知**的谐波模型 $y = A\sin(\omega x + \varphi)$——注意：若频率 $\omega$ 已知，可用和角公式化为 $c_1\sin(\omega x) + c_2\cos(\omega x)$ 线性最小二乘；一旦 $\omega$ 未知，目标函数关于 $\omega$ 高度非凸且遍布局部极小值，必须采用非线性最小二乘配合良好初值）。
2. **`lsqcurvefit` 的底层算法选项说明**：
   调用 `p_opt = lsqcurvefit(modelfun, p0, xdata, ydata, lb, ub, options)` 时，**其默认优化算法是信赖域反射法（`'trust-region-reflective'`，支持上下界约束 `lb, ub`）**，而非把所有非线性拟合接口一概等同于 Levenberg-Marquardt 算法！具体采用的迭代算法由 `optimoptions` 中的 `'Algorithm'` 选项决定：若求解无上下界约束的非线性最小二乘并希望使用经典的 **Levenberg-Marquardt（LM 阻尼高斯-牛顿法）**，应显式配置 `'Algorithm', 'levenberg-marquardt'`（参见 [MathWorks lsqcurvefit 官方文档](https://www.mathworks.com/help/optim/ug/lsqcurvefit.html)）：

```matlab
modelfun = @(p, x) p(1) * exp(-p(2) * x) + p(3);
xdata = linspace(0, 5, 30);
ydata = 2.5 * exp(-1.2 * xdata) + 0.5 + 0.05 * randn(size(xdata));

p0 = [1, 1, 0]; % 初始参数猜测
% 默认调用 trust-region-reflective 算法；也可通过 optimoptions 显式切换为 levenberg-marquardt
opts_lm = optimoptions('lsqcurvefit', 'Algorithm', 'levenberg-marquardt', 'Display', 'off');
p_opt = lsqcurvefit(modelfun, p0, xdata, ydata, [], [], opts_lm);
```

### 4.3 加权最小二乘、正则化回归与鲁棒回归的目标区分

在实际数据分析中，应根据误差分布特征与共线性情况严格区分以下拟合模型与适用条件：

| 模型类别 | 优化目标函数 | 适用条件与 MATLAB 实现要点 |
| :--- | :--- | :--- |
| **普通最小二乘 (OLS)** | $\min_{\mathbf{c}} \sum_{i=1}^N r_i^2 = \|\Phi\mathbf{c} - \mathbf{y}\|_2^2$ | 随机误差零均值、**同方差（Homoscedastic）**且无显著离群点 |
| **加权最小二乘 (WLS)** | $\min_{\mathbf{c}} \sum_{i=1}^N w_i r_i^2 = \|W^{1/2}(\Phi\mathbf{c} - \mathbf{y})\|_2^2$ | **异方差误差**（最优权重取方差倒数 $w_i \propto \sigma_i^{-2}$）。注意 `fit(..., 'Weights', w)` 传入 $w_i$，而手动构造矩阵左除时**必须对每行乘以 $\sqrt{w_i}$**：`(sqrt(w).*Phi) \ (sqrt(w).*y)` |
| **岭回归 (Ridge / $\ell_2$)** | $\min_{\mathbf{c}} \|\Phi\mathbf{c} - \mathbf{y}\|_2^2 + \lambda \|\mathbf{c}\|_2^2$ | 抑制高阶多项式或多重共线性导致的病态大系数：$(\Phi^{\mathsf{T}}\Phi + \lambda I)\mathbf{c} = \Phi^{\mathsf{T}}\mathbf{y}$（或 `ridge`） |
| **LASSO ($\ell_1$ 稀疏回归)** | $\min_{\mathbf{c}} \frac{1}{2N}\|\Phi\mathbf{c} - \mathbf{y}\|_2^2 + \lambda \|\mathbf{c}\|_1$ | 利用 $\ell_1$ 惩罚项的尖点性质将冗余基函数系数精确压缩为 $0$（调用 `lasso`） |
| **鲁棒回归 (LAR / Bisquare)** | $\min_{\mathbf{c}} \sum_{i=1}^N \vert{}r_i\vert{}$（LAR）或双权 $\rho(r_i)$ | 数据含**脉冲尖峰或异常离群点（Outliers）**，调用 `fit(x, y, ftype, 'Robust', 'LAR')` 或 `'Bisquare'` |

- **重要统计禁忌（加权与未加权 SSE 不可直接比较）**：加权最小二乘输出的加权残差平方和 $\mathrm{SSE}_w = \sum_{i=1}^N w_i r_i^2$ 与普通未加权最小二乘的 $\mathrm{SSE} = \sum_{i=1}^N r_i^2$ 具有完全不同的权重尺度（例如将权重整体乘以 $0.01$ 会使 $\mathrm{SSE}_w$ 缩小 $100$ 倍），**严禁直接比较加权拟合的 $\mathrm{SSE}_w$ 与未加权拟合的 $\mathrm{SSE}$ 数值大小来声称某一方拟合更优**！

## 5. 配套实验与课后参考作业说明

- **实验、课后参考题（免交）与独立选做题的边界说明**：
  1. 第十周实验课（幻方相容性、求根对比、固定步长梯度下降收敛域、铁丝截段约束优化）详见 [[MATLAB/课程讲义/10B_第十周实验课|第十周实验课]]；
  2. 原课件**第 43 页的三道数据参考练习题**（`Q1.mat` 均匀分布矩估计与极大似然估计、`Q2.mat` 谐波/三次多项式离群点中值滤波与鲁棒拟合、`Q3.mat` 152 人成绩调分核对）属于**供课后对照自测的参考题，无需提交**，完整解析详见 [[MATLAB/课程讲义/补充_第十周参考作业解读|第十周参考作业解读]]；
  3. 原课件**第 44–45 页新增的“麦穗（Wheat Ears）”统计与回归分析题**则属于**独立选做专题**（需与第 43 页三道免交参考题明确区分）。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
