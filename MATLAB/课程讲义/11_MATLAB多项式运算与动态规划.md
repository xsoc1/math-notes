---
title: 第十一课 MATLAB 多项式运算与动态规划
date: 2026-11-12
tags:
  - matlab/lecture
  - matlab/polynomials
  - matlab/dynamic-programming
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/11_MATLAB多项式运算与动态规划.md"
matlab_source_sha256: e9ede8c0d70e7bfe59a4eda964babf0ac7c3c0a416d9e864e37783bc85679201
---

# 第十一课：MATLAB 多项式运算与动态规划

来源：[[MATLAB/课程资料/原始课件/第十一课 MATLAB多项式运算与动态规划.pdf|第十一课 MATLAB多项式运算与动态规划.pdf]]（共 36 页）。本讲介绍 MATLAB 中多项式的系数向量表示、卷积下标与微积分运算、有理分式部分分式展开（`residue`），以及多阶段决策问题中的动态规划（Dynamic Programming）理论、时间复杂度（含伪多项式时间辨析）及四大经典动态规划模型（0-1 背包与特殊分组约束、硬币找零、最长递增/不降子序列 LIS、矩阵链乘法）与网格最短路径。

阅读前置：[[MATLAB/课程讲义/09_MATLAB进阶程序设计与问题求解|第九课的最优化]]、[[MATLAB/课程讲义/10_MATLAB概率统计与曲线拟合|第十课的多项式拟合]]。

## 1. 多项式的系数表示、卷积下标与代数微积分运算

在 MATLAB 中，$n$ 次多项式 $P(x) = a_n x^n + a_{n-1} x^{n-1} + \dots + a_1 x + a_0$ 表示为长度为 $n + 1$ 的**降幂系数行向量** `p = [an, an-1, ..., a1, a0]`（缺项处必须显式补 `0`）。

### 1.1 多项式构造、求值、卷积下标与带余除法
- **由根构造多项式**：`p = poly(r)`（若输入方阵 $A$，则返回其特征多项式 $\det(\lambda I - A)$ 的降幂系数向量）。
- **求根与求值**：`r = roots(p)`；标量/数组逐元素求值使用 `polyval(p, x)`（内部采用 Horner 秦九韶算法 $P(x) = (\cdots((a_n x + a_{n-1})x + a_{n-2})x + \cdots + a_0)$，仅需 $n$ 次乘法与 $n$ 次加法）；方阵多项式求值 $P(A) = a_n A^n + \cdots + a_1 A + a_0 I$ 使用 `polyvalm(p, A)`（注意常数项自动乘以单位阵 $I$）。
- **加减法**：将较短系数向量左侧前置补零至相同长度后直接相加减（如 `[0, p_short] + p_long`）。
- **乘法与离散卷积（`conv`）的下标、三种截断模式（`full`/`same`/`valid`）及连续卷积步长关系**：
  设向量 `a` 长度为 $m$（对应 $m-1$ 次多项式），向量 `b` 长度为 $n$（对应 $n-1$ 次多项式），在 MATLAB 的 1-based 下标下，全卷积第 $k \, (1 \le k \le m+n-1)$ 个元素由离散卷积公式给出（参见 [MathWorks 多项式与卷积文档](https://www.mathworks.com/help/matlab/ref/polyval.html)）：
  $$
  c(k) = \sum_{j = \max(1, \, k + 1 - n)}^{\min(k, \, m)} a(j)\,b(k - j + 1).
  $$
  调用 `c = conv(a, b, shape)` 支持三种输出长度模式：
  1. **`'full'`（默认模式，多项式乘法）**：返回完整离散卷积，长度为 **$m + n - 1$**（对应 $(m-1)+(n-1) = m+n-2$ 次乘积多项式）；
  2. **`'same'`（等长中心截断，常用于信号滤波）**：从全卷积结果中截取与第一输入向量 `a` 等长的中心部分，返回长度为 **$m$**（起始下标偏移为 $\lfloor n/2 \rfloor + 1$）；
  3. **`'valid'`（无补零有效重叠区）**：仅保留卷积核 `b` 完全落在 `a` 内部、无需边界补零即可计算的元素，返回长度为 **$\max(m - n + 1, \, 0)$**。
  （注：若利用 `conv` 近似计算两个在等距网格步长 $h$ 上采样的连续函数卷积积分 $(f * g)(t) = \int f(\tau)g(t-\tau)\,\mathrm{d}\tau$，必须乘以步长因子 $h$，即 `h * conv(f_vec, g_vec)`。）
- **带余除法（解卷积）**：`[q, r] = deconv(b, a)`，求得商多项式 `q` 与余式 `r`，满足 $b(x) = q(x)a(x) + r(x)$。

```matlab
p1 = [1, 2, 3]; % x^2 + 2x + 3 (长度 m = 3, 次数 2)
p2 = [1, 1];    % x + 1        (长度 n = 2, 次数 1)

p_mul = conv(p1, p2);       % 乘积: x^3 + 3x^2 + 5x + 3 -> [1, 3, 5, 3] (长度 m+n-1 = 4)
[q, r] = deconv(p_mul, p2); % 商 q = [1, 2, 3], 余式 r = [0, 0, 0, 0]
```

### 1.2 多项式微分与不定积分
- **求导**：`polyder(p)` 返回导多项式系数；`polyder(a, b)` 返回乘积 $a(x)b(x)$ 的导数；双输出 `[q, d] = polyder(b, a)` 返回有理分式 $\frac{b(x)}{a(x)}$ 导数的分子 `q` 与分母 `d`。
- **不定积分**：`polyint(p, k)` 返回积分常数为 `k`（默认为 `0`）的不定积分多项式系数。

```matlab
p = [3, 2, 1];      % 3x^2 + 2x + 1
dp = polyder(p);    % 6x + 2 -> [6, 2]
ip = polyint(p, 0); % x^3 + x^2 + x -> [1, 1, 1, 0]
```

## 2. 有理分式部分分式展开与留数 `residue`

对有理分式函数 $H(s) = \frac{B(s)}{A(s)}$，若分母无重极点，其部分分式展开（Partial Fraction Expansion）为：

$$
\frac{B(s)}{A(s)} = \sum_{i=1}^n \frac{r_i}{s - p_i} + K(s),
$$

其中 $p_i$ 为极点（Poles），$r_i$ 为对应极点处的留数（Residues），$K(s)$ 为整式直接项（当 $\deg B < \deg A$ 时为空矩阵 `[]`）。若极点 $p_i$ 具有重数 $m$，则展开式中包含 $\frac{r_{i,1}}{s-p_i} + \frac{r_{i,2}}{(s-p_i)^2} + \cdots + \frac{r_{i,m}}{(s-p_i)^m}$。

**算例与公因式退化辨析**：
1. 当分子 $B_1 = [1, 3]$（即 $s + 3$）、分母 $A = [1, 5, 6]$（即 $s^2 + 5s + 6 = (s + 2)(s + 3)$）时，分子与分母含有公因式 $(s + 3)$，约分后恒有：
   $$
   \frac{s + 3}{s^2 + 5s + 6} = \frac{s + 3}{(s + 2)(s + 3)} = \frac{0}{s + 3} + \frac{1}{s + 2}.
   $$
   此时极点 $s = -3$ 为可去奇点，其对应留数严格等于 **$0$**，按极点 `p = [-3; -2]` 排列时输出留数向量为 **`r = [0; 1]`**。
2. 若分子取互素的 $B_2 = [1, 4]$（即 $s + 4$），则由 Heaviside 留数公式 $r_1 = \left.\frac{s+4}{s+2}\right|_{s=-3} = -1, \, r_2 = \left.\frac{s+4}{s+3}\right|_{s=-2} = 2$，得到非退化的两项展开：
   $$
   \frac{s + 4}{s^2 + 5s + 6} = \frac{-1}{s + 3} + \frac{2}{s + 2}.
   $$

```matlab
A = [1, 5, 6]; % s^2 + 5s + 6 = (s + 2)(s + 3)

% 情形 1：含公因式 B1 = [1, 3] (即 s + 3)
B1 = [1, 3];
[r1, p1, k1] = residue(B1, A);
% 返回: r1 = [0; 1], p1 = [-3; -2], k1 = []
% 即 (s + 3) / (s^2 + 5s + 6) = 0 / (s + 3) + 1 / (s + 2) = 1 / (s + 2)

% 情形 2：互素非退化情形 B2 = [1, 4] (即 s + 4)
B2 = [1, 4];
[r2, p2, k2] = residue(B2, A);
% 返回: r2 = [-1; 2], p2 = [-3; -2], k2 = []
% 即 (s + 4) / (s^2 + 5s + 6) = -1 / (s + 3) + 2 / (s + 2)
```

该展开是求解有理函数高阶导数、不定积分以及 Laplace / Z 逆变换的核心代数工具。

## 3. 动态规划（Dynamic Programming）核心理论与四大经典模型

### 3.1 Bellman 最优性原理、复杂度分析与伪多项式时间辨析
动态规划通过将多阶段决策问题分解为一系列相互关联的子问题，利用状态表存储已解决子问题的最优值。一个优化问题可采用动态规划求解的三个核心要素为：
1. **最优子结构（Optimal Substructure）**：全局最优解所包含的子阶段决策也是对应子问题的最优解；
2. **无后效性（Markovian Property）**：给定当前阶段状态 $s_k$，后续阶段的演化与代价仅依赖于 $s_k$ 及后续决策，而与到达 $s_k$ 的历史路径无关；
3. **重叠子问题（Overlapping Subproblems）**：不同决策路径反复访问同一批子状态，通过自底向上填表（Tabulation）或自顶向下记忆化（Memoization）消除重复展开。

设阶段 $k$ 的状态为 $s_k$，决策为 $u_k \in U_k(s_k)$，状态转移方程为 $s_{k+1} = g_k(s_k, u_k)$，阶段指标为 $c_k(s_k, u_k)$，则逆向 Bellman 递推方程为：

$$
V_k(s_k) = \min_{u_k \in U_k(s_k)} \bigl\{ c_k(s_k, u_k) + V_{k+1}\bigl(g_k(s_k, u_k)\bigr) \bigr\}.
$$

**重要复杂度概念辨析（消除重复子问题 $\neq$ 多项式时间，以及伪多项式时间）**：
- 动态规划的总时间复杂度由 **“状态总数 $\times$ 单个状态的转移计算代价”** 决定。如果问题的状态空间本身随输入规模呈指数级增长（例如旅行商问题 TSP 的子集状态压缩 DP，状态数为 $n 2^n$，复杂度为 $O(n^2 2^n)$），则动态规划虽然消除了阶乘级 $O(n!)$ 的重复排列，但**依然是指数级复杂度，并不保证多项式时间复杂度**。
- **伪多项式时间（Pseudo-polynomial Time）**：在下方 0-1 背包问题中，DP 的时间复杂度为 $O(n C)$（$n$ 为物品数，$C$ 为整数背包容量）。这关于数值 $C$ 看似是线性的，但在计算复杂性理论中，输入整数 $C$ 是以二进制位串编码给出的，其**输入编码长度（Bit-length）为 $b = \lfloor\log_2 C\rfloor + 1 = \Theta(\log C)$**。用输入规模 $(n, b)$ 衡量时，$O(n C) = O(n \cdot 2^b)$ 关于位长 $b$ 实际上是**指数级**的！因此 $O(n C)$ 称为**伪多项式时间复杂度**（当 $C = 10^{12}$ 时直接分配长度为 $C$ 的数组会立即导致内存耗尽）。

---

**一般多阶段决策过程的 Bellman 最优性递推与终端边界条件**：
设离散多阶段决策过程共有 $N$ 个阶段 $k = 1, 2, \dots, N$，状态转移方程为 $s_{k+1} = T_k(s_k, u_k)$，阶段指标为 $g_k(s_k, u_k)$，终端状态代价为 $g_{N+1}(s_{N+1})$。记值函数 $V_k(s_k)$ 为从第 $k$ 阶段状态 $s_k$ 出发到终端第 $N+1$ 阶段的最优累积指标，则逆向 Bellman 递推必须显式固定**终端边界条件（Terminal Boundary Condition）**，正向填表则必须固定**初始空集/零容量边界条件（Initial Table Boundary）**：
$$
\begin{cases}
V_{N+1}(s_{N+1}) = g_{N+1}(s_{N+1}) & \text{（逆向递推终端边界条件）}, \\
V_k(s_k) = \min_{u_k \in U_k(s_k)} \Bigl\{ g_k(s_k, u_k) + V_{k+1}\bigl(T_k(s_k, u_k)\bigr) \Bigr\} & (k = N, N-1, \dots, 1).
\end{cases}
$$

### 3.2 模型一：0-1 背包问题（含倒序空间压缩、回溯与特殊物品分组约束）

**基本问题**：给定 $n$ 件物品，第 $i$ 件物品的重量为正整数 $w_i$，价值为 $v_i$，背包最大承重（或预算容量）为正整数 $C$。每件物品至多选 1 次（$x_i \in \{0, 1\}$），求在总重量 $\sum_{i=1}^n w_i x_i \le C$ 下的最大总价值。

1. **二维状态转移方程与最优方案回溯**：
   记 $dp(i, j)$ 为仅考虑前 $i$ 件物品、可用容量不超过 $j \, (0 \le j \le C)$ 时的最大价值：
   $$
   dp(i, j) = \begin{cases}
   dp(i - 1, j), & j < w_i \;\text{（容量不足，不装第 } i \text{ 件）}, \\
   \max\bigl\{dp(i - 1, j), \; dp(i - 1, j - w_i) + v_i\bigr\}, & j \ge w_i \;\text{（在不装与装入第 } i \text{ 件中取较优者）}.
   \end{cases}
   $$
   填表完成后，$dp(n, C)$ 即为最大价值；从 $j = C$ 开始按 $i = n, n-1, \dots, 1$ 逆向检查：若 $dp(i, j) > dp(i-1, j)$，则说明第 $i$ 件物品被选中，并更新剩余容量 $j \leftarrow j - w_i$。

2. **一维滚动数组压缩与倒序更新的必然性**：
   由于第 $i$ 行 $dp(i, \cdot)$ 仅依赖第 $i-1$ 行 $dp(i-1, \cdot)$ 中容量更小的状态，可将空间从 $O(n C)$ 压缩为一维数组 `f = zeros(1, C + 1)`（下标 `j + 1` 对应容量 `j`）。此时内层容量循环**必须从 $C$ 到 $w_i$ 倒序更新**：
   $$
   \text{对 } j = C, C - 1, \dots, w_i: \qquad f(j) \leftarrow \max\bigl\{f(j), \; f(j - w_i) + v_i\bigr\}.
   $$
   （若改为从 $w_i$ 到 $C$ 正序更新，则计算 $f(j)$ 时引用的 $f(j - w_i)$ 已经是本轮刚装入过第 $i$ 件物品的新值，导致同一件物品被无限次重复装入，退化为**完全背包问题**！）

3. **带特殊约束变体（特殊物品组“恰好买一件”或“至多买一件”）**：
   在课程综合练习中，若将部分物品划分为特殊互斥集合 $S$（例如某类核心组件有 $k$ 种型号 $i \in S$，规定**必须恰好购买其中一件**，且总预算不超过 $C$）：
   - 先对普通物品集合 $U \setminus S$ 执行标准 0-1 背包得到一维表 $f_{\text{normal}}(j) \, (0 \le j \le C)$；
   - 再对特殊物品组 $S$ 强制“恰选一件”转移：对每个容量 $j \in [0, C]$，令
     $$
     f_{\text{final}}(j) = \max_{\substack{i \in S \\ w_i \le j}} \bigl\{ f_{\text{normal}}(j - w_i) + v_i \bigr\}
     $$
     （若对某个 $j$ 无满足 $w_i \le j$ 的特殊物品，则置为 $-\infty$ 表示不可行）。

```matlab
function [maxVal, chosenItems, dp] = knapsack_01(weights, values, C)
% KNAPSACK_01 0-1 背包问题二维填表与最优物品子集回溯 (MATLAB 1-based 下标)
%   dp 尺寸为 (n+1) x (C+1), 第 i+1 行对应前 i 件物品, 第 j+1 列对应容量 j
    n = numel(weights);
    dp = zeros(n + 1, C + 1);
    for i = 1:n
        wi = weights(i);
        vi = values(i);
        for j = 0:C
            if j < wi
                dp(i + 1, j + 1) = dp(i, j + 1);
            else
                dp(i + 1, j + 1) = max(dp(i, j + 1), dp(i, j - wi + 1) + vi);
            end
        end
    end
    maxVal = dp(n + 1, C + 1);

    % 逆向回溯找出具体选中的物品编号
    chosenItems = [];
    remC = C;
    for i = n:-1:1
        if dp(i + 1, remC + 1) ~= dp(i, remC + 1)
            chosenItems = [i, chosenItems]; %#ok<AGROW>
            remC = remC - weights(i);
        end
    end
end
```

---

### 3.3 模型二：硬币找零问题（Coin Change Problem）与贪心反例

**问题**：给定正整数硬币面额数组 $c = [c_1, c_2, \dots, c_k]$（每种面额供应无限）与目标金额 $M$，求凑出总金额恰好为 $M$ 所需的最少硬币枚数。
- **为什么贪心法（每次优先选最大面额）会失效？**
  考察面额系 $c = [1, 3, 4]$、目标金额 $M = 6$：贪心策略先选一枚 $4$，剩余 $2$ 只能选两枚 $1$，共需 $4 + 1 + 1 \implies 3$ 枚；而全局最优解是选两枚 $3$（$3 + 3 \implies 2$ 枚）。
- **DP 状态转移方程**：记 $dp(x)$ 为凑出金额 $x \, (0 \le x \le M)$ 的最少硬币数，初始化 $dp(0) = 0$，其余 $dp(x) = +\infty$：
  $$
  dp(x) = \min_{\substack{1 \le j \le k \\ c_j \le x}} \bigl\{ dp(x - c_j) + 1 \bigr\}, \qquad x = 1, 2, \dots, M.
  $$

```matlab
function [minCoins, usedCoins] = coin_change_dp(coins, M)
% COIN_CHANGE_DP 动态规划求解最少硬币找零问题及面额回溯
    dp = inf(1, M + 1);
    choice = zeros(1, M + 1);
    dp(1) = 0; % dp(x + 1) 对应金额 x, dp(0 + 1) = 0
    for x = 1:M
        for j = 1:numel(coins)
            cj = coins(j);
            if cj <= x && dp(x - cj + 1) + 1 < dp(x + 1)
                dp(x + 1) = dp(x - cj + 1) + 1;
                choice(x + 1) = cj;
            end
        end
    end
    minCoins = dp(M + 1);
    usedCoins = [];
    if isfinite(minCoins)
        cur = M;
        while cur > 0
            c = choice(cur + 1);
            usedCoins = [c, usedCoins]; %#ok<AGROW>
            cur = cur - c;
        end
    end
end
```

---

### 3.4 模型三：最长递增 / 不降子序列（LIS）状态设计与前驱回溯

**问题**：给定长度为 $n$ 的实数序列 $a = [a_1, a_2, \dots, a_n]$，求其最长的**严格递增子序列**（满足下标 $1 \le i_1 < i_2 < \cdots < i_k \le n$ 且 $a_{i_1} < a_{i_2} < \cdots < a_{i_k}$；若要求**最长不降子序列**，则将条件改为 $a_{i_1} \le a_{i_2} \le \cdots \le a_{i_k}$）的长度并输出一条最长子序列。
- **状态定义的关键**：不能直接定义 $dp(i)$ 为“前 $i$ 个元素中的 LIS 长度”（因为不知道该子序列末尾元素的大小，无法判断 $a_{i+1}$ 能否接在后面，违背无后效性！）；必须定义 $L(i)$ 为**以第 $i$ 个元素 $a_i$ 作为结尾元素**的最长递增（或不降）子序列长度：
  $$
  L(i) = 1 + \max\Bigl(\{0\} \cup \bigl\{L(j) : 1 \le j < i \text{ 且 } a_j < a_i \text{（不降则为 } a_j \le a_i\text{）}\bigr\}\Bigr), \quad 1 \le i \le n.
  $$
  全局最长长度为 $\max_{1 \le i \le n} L(i)$，时间复杂度为 $O(n^2)$（若结合维护各长度最小末尾元素的单调数组与二分查找，可将求长度的时间复杂度进一步优化至 $O(n\log n)$）。

```matlab
function [maxLen, subseq] = lis_dp(a, allow_equal)
% LIS_DP 最长递增 (allow_equal=false) 或最长不降 (allow_equal=true) 子序列及回溯
    if nargin < 2, allow_equal = false; end
    n = numel(a);
    L = ones(1, n);
    prev = zeros(1, n); % 记录最优前驱下标用于回溯

    for i = 2:n
        for j = 1:i-1
            cond = (allow_equal && a(j) <= a(i)) || (~allow_equal && a(j) < a(i));
            if cond && L(j) + 1 > L(i)
                L(i) = L(j) + 1;
                prev(i) = j;
            end
        end
    end

    [maxLen, endIdx] = max(L);
    subseq = zeros(1, maxLen);
    curr = endIdx;
    for k = maxLen:-1:1
        subseq(k) = a(curr);
        curr = prev(curr);
    end
end
```

---

### 3.5 模型四：矩阵链乘法（Matrix Chain Multiplication）与 $O(n^3)$ 区间 DP

**问题**：给定 $n$ 个待相乘的矩阵链 $A_1 A_2 \cdots A_n$，其中第 $i$ 个矩阵 $A_i$ 的尺寸为 $p_{i-1} \times p_i \, (i = 1, \dots, n)$，维度向量为 $p = [p_0, p_1, \dots, p_n]$。矩阵乘法满足结合律，但不同加括号顺序下的标量乘法总次数相差悬殊（例如 $A_1 \in \mathbb{R}^{10\times 100}, \, A_2 \in \mathbb{R}^{100\times 5}, \, A_3 \in \mathbb{R}^{5\times 50}$：先算 $(A_1 A_2)A_3$ 需 $10\times 100\times 5 + 10\times 5\times 50 = 7500$ 次，而先算 $A_1(A_2 A_3)$ 需 $100\times 5\times 50 + 10\times 100\times 50 = 75000$ 次，相差 $10$ 倍！）。

**区间 DP 状态转移与拓扑序**：
记 $m(i, j) \, (1 \le i \le j \le n)$ 为计算子链乘积 $A_{i..j} = A_i A_{i+1}\cdots A_j$ 所需的最少标量乘法次数。当 $i = j$ 时单个矩阵无需乘法，$m(i, i) = 0$；当 $i < j$ 时，枚举最后一次乘法的分割位置 $k \, (i \le k < j)$，将子链拆为 $(A_i\cdots A_k)(A_{k+1}\cdots A_j)$：

$$
m(i, j) = \min_{i \le k < j} \bigl\{ m(i, k) + m(k + 1, j) + p_{i-1} p_k p_j \bigr\}.
$$

由于长区间 $m(i, j)$ 依赖于更短的子区间 $m(i, k)$ 与 $m(k+1, j)$，外层循环**必须按子链长度 $L = j - i + 1 = 2, 3, \dots, n$ 从小到大递推**！共有 $\Theta(n^2)$ 个区间状态，每个状态枚举 $O(n)$ 个分割点 $k$，故**总时间复杂度为 $O(n^3)$，空间复杂度为 $O(n^2)$**（将 Catalan 数级 $\Omega(4^n / n^{3/2})$ 的穷举搜索缩减为立方级）。

```matlab
function [minOps, m, s] = matrix_chain_order(p)
% MATRIX_CHAIN_ORDER 矩阵链乘法 O(n^3) 区间动态规划
%   输入 p = [p0, p1, ..., pn], 其中矩阵 A_i 维度为 p(i) x p(i+1)
    n = numel(p) - 1;
    m = zeros(n, n); % m(i, j) 存储子链 A_i...A_j 的最少标量乘法次数
    s = zeros(n, n); % s(i, j) 记录最优分割点 k

    for L = 2:n                 % L 为子链包含的矩阵个数
        for i = 1:(n - L + 1)
            j = i + L - 1;
            m(i, j) = inf;
            for k = i:(j - 1)
                cost = m(i, k) + m(k + 1, j) + p(i) * p(k + 1) * p(j + 1);
                if cost < m(i, j)
                    m(i, j) = cost;
                    s(i, j) = k;
                end
            end
        end
    end
    minOps = m(1, n);
end
```

---

### 3.6 补充算例：二维网格最短路径 DP
在 $m \times n$ 非负权值网格 `grid` 中，从左上角 $(1, 1)$ 移动至右下角 $(m, n)$（每步仅允许向右或向下），最小路径代价满足 $dp(i, j) = \text{grid}(i, j) + \min\bigl(dp(i-1, j), \, dp(i, j-1)\bigr)$：

```matlab
function [minCost, dp] = grid_min_path(grid)
% GRID_MIN_PATH 动态规划求解二维网格最小路径和
    [m, n] = size(grid);
    dp = zeros(m, n);
    dp(1, 1) = grid(1, 1);

    for j = 2:n, dp(1, j) = dp(1, j - 1) + grid(1, j); end
    for i = 2:m, dp(i, 1) = dp(i - 1, 1) + grid(i, 1); end

    for i = 2:m
        for j = 2:n
            dp(i, j) = grid(i, j) + min(dp(i - 1, j), dp(i, j - 1));
        end
    end
    minCost = dp(m, n);
end
```

## 4. 搜索与多阶段优化方法复杂度汇总

| 问题 / 求解方法 | 状态规模 | 时间复杂度 | 空间复杂度 | 算法特征与复杂度定性 |
| :--- | :--- | :--- | :--- | :--- |
| **0-1 背包 DP** | $n \times C$ | $O(n C)$ | $O(n C)$（一维倒序压缩为 $O(C)$） | 关于容量二进制位长 $\log_2 C$ 为**伪多项式时间** |
| **硬币找零 DP** | $M + 1$ | $O(k M)$ | $O(M)$ | 完全背包型递推，克服贪心算法在非标准面额下的局部次优陷阱 |
| **最长递增子序列 (LIS)** | $n$ | 填表 $O(n^2)$ / 二分优化 $O(n\log n)$ | $O(n)$ | 状态须绑定“以 $a_i$ 结尾”方满足无后效性，前驱数组 `prev` 重构序列 |
| **矩阵链乘法区间 DP** | $\frac{n(n+1)}{2}$ | $O(n^3)$ | $O(n^2)$ | 按区间长度 $L = 2 \to n$ 拓扑序递推，分割表 `s(i,j)` 递归输出括号 |
| **二维网格最短路径** | $m \times n$ | $O(mn)$ | $O(mn)$（滚动数组 $O(\min(m,n))$） | 消除朴素 DFS 搜索的 $\binom{m+n-2}{m-1}$ 指数级重复访问 |

## 5. 课程综合练习数据说明

- 第十一课课件末尾附带的综合应用题（题库编号 Q31–Q34，涉及外部实验观测与大规模规划数据集）依赖独立下发的外部 `.mat` / `.xlsx` 数据文件；本讲义聚焦于上述多项式运算与四大核心动态规划模型的通用算法实现，不脱离原始数据文件对缺数据的外部题目作无依据的数值推断。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
