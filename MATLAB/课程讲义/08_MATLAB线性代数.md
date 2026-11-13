---
title: 第八课 MATLAB 线性代数
date: 2026-10-21
tags:
  - matlab/lecture
  - matlab/linear-algebra
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/08_MATLAB线性代数.md"
matlab_source_sha256: cdc5866e3423a6386f243e5a50e3efc07fba94af16b6f88451b160382d275a27
---

# 第八课：MATLAB 线性代数

来源：[[MATLAB/课程资料/原始课件/第八课 MATLAB线性代数.pdf|第八课 MATLAB线性代数.pdf]]（共 35 页）。本课承接[[MATLAB/课程讲义/07_MATLAB微分方程数值解法|第七课微分方程数值解法]]，系统讲解矩阵分解、向量与矩阵范数、子空间标准正交基、魔方阵秩亏分析、超定与欠定方程组中 `A\b` 与 `pinv(A)*b` 的本质区别、含参线性方程组讨论、Hilbert 病态矩阵扰动实验，以及大型线性方程组的分裂迭代法与共轭梯度法。

## 1. 核心矩阵分解与特征分析命令（第 2–4 页）

| 命令 | 数学分解与返回值 | 数值分析注意事项 |
| :--- | :--- | :--- |
| `det(A)`、`inv(A)` | 方阵行列式 $\det(A)$、逆矩阵 $A^{-1}$ | 行列式易发生上下溢且受尺度缩放影响（$\det(cA)=c^n\det A$），**不能**用 $\vert{}\det A\vert{}$ 小来判断矩阵病态，应使用条件数 `cond(A)` |
| `rank(A, tol)` | 数值秩 | 统计大于容差阈值 `tol`（默认 $\max(m,n)\,\text{eps}(\|A\|_2)$）的奇异值个数 |
| `tril(A, k)`、`triu(A, k)` | 截取下三角/上三角元素 | 仅做元素置零截取，不是相似变换或消元分解 |
| `[V, D] = eig(A)` | 谱分解 $AV = VD$ | 亏损矩阵（Defective Matrix）的特征向量矩阵 $V$ 不可逆；一般非对称矩阵的特征向量不自动正交 |
| `[V, J] = jordan(A)` | Jordan 标准形 $A = VJV^{-1}$ | 仅适用于精确符号矩阵 `sym(A)`；浮点扰动会破坏重特征值的 Jordan 块结构 |
| `[U, S, V] = svd(A)` | 奇异值分解 $A = U S V^*$ | 对任意 $m \times n$ 矩阵存在且数值高度稳定；复矩阵下 `V'` 为共轭转置 $V^*$ |
| `[L, U, P] = lu(A)` | 列主元三角分解 $PA = LU$ | 双输出 `[L, U] = lu(A)` 将置换阵并入 $L$（即 $P^{\mathsf{T}} L$），此时 $L$ 为心理下三角阵而非标准下三角阵（参见 [MathWorks lu 文档](https://www.mathworks.com/help/matlab/ref/lu.html)） |
| `[Q, R] = qr(A)` | 正交-上三角分解 $A = QR$ | `qr(A, 0)` 返回经济型（Economy-size）分解，常用于超定最小二乘求解 |

## 2. 线性方程组求解：超定、欠定与含参方程组分析（第 5–6 页）

### 2.1 超定与欠定方程组中 `A\b` 与 `pinv(A)*b` 的本质区别
对于一般线性系统 $Ax = b$（$A \in \mathbb{R}^{m \times n}, \, \operatorname{rank}(A) = r$），矩阵左除 `x_bs = A \ b` 与 Moore-Penrose 伪逆求解 `x_pinv = pinv(A) * b`（或 `lsqminnorm(A, b)`）在代数目标与底层分解上存在本质差异：

1. **超定列满秩方程组（$m > n, \, r = n$）**：
   此时最小二乘问题 $\min_{x \in \mathbb{R}^n} \|Ax - b\|_2$ 的解唯一，`A \ b`（基于 QR 分解）与 `pinv(A) * b`（基于 SVD）给出**相同的唯一最小二乘解** $x_{\text{LS}} = (A^{\mathsf{T}}A)^{-1}A^{\mathsf{T}}b$。
2. **欠定方程组（$m < n$）与秩亏方程组（$r < n$，严格区分矩形矩阵与奇异方阵）**：
   此时相容方程组 $Ax = b$（或最小二乘问题）存在无穷多解，通解集为仿射子空间 $x_p + \mathcal{N}(A)$：
   - **矩形矩阵（$m \neq n$）下的 `A \ b`（基本解 Basic Solution）**：当 $A$ 为**非方阵**时，`A \ b` 底层通过**带列主元的 QR 分解** $AP = QR$ 选出 $r = \operatorname{rank}(A)$ 个线性无关的主元列，将剩余 $n - r$ 个非主元自由变量置为 $0$，求得一个**至多含有 $r = \operatorname{rank}(A)$ 个非零分量的基本解**（偏向稀疏性，但通常不具有最小欧氏范数）。
   - **奇异/秩亏方阵（$m = n, \, r < n$）下的 `A \ b`**：当 $A$ 为**方阵**时，`A \ b` 底层按矩阵结构分派至方阵 LU / 三角消元求解器，**并不执行列主元 QR 分解，也不保证返回至多含 $r$ 个非零元的基本解**！遇到奇异或近奇异方阵时，MATLAB 会发出 `Matrix is close to singular or badly scaled` 警告并返回受浮点主元舍入影响的单个计算解（例如 [MathWorks `mldivide` 官方文档](https://www.mathworks.com/help/matlab/ref/double.mldivide.html)中 `A = magic(4)` 秩为 $3$，对 `b = 34*ones(4,1)` 调用 `A \ b` 返回的向量四个分量全非零）。
   - **`pinv(A) * b`（极小 2-范数解 Minimum 2-Norm Solution）**：底层通过**奇异值分解（SVD）** $A = U\Sigma V^{\mathsf{T}}$ 构造 $A^+ = V\Sigma^+ U^{\mathsf{T}}$，将解正交投影至行空间 $\mathcal{R}(A^{\mathsf{T}}) = \mathcal{N}(A)^\perp$，从而求得所有精确解（或所有最小二乘解）中**欧氏 2-范数 $\|x\|_2$ 最小的唯一极小范数解**：
     $$
     x^+ = A^+ b = \arg\min_{x \in \mathcal{S}} \|x\|_2, \qquad \mathcal{S} = \bigl\{x \in \mathbb{R}^n : \|Ax - b\|_2 = \min_y \|Ay - b\|_2\bigr\}.
     $$

```matlab
%% 欠定满秩方程组中 A\b (基本解) 与 pinv(A)*b (极小 2-范数解) 的异同对比
A_under = [1, 2, 3; 4, 5, 6]; % 2x3 欠定满秩矩阵, rank(A) = 2, 零空间基为 v = [1; -2; 1]

% 情形 1：特例右端项 b1 = [1; 1] —— 此时中间分量恰好为 0，基本解与极小 2-范数解偶然重合！
b1 = [1; 1];
x1_basic   = A_under \ b1;       % 返回 [-0.5; 0; 0.5] (恰与零空间 v=[1;-2;1] 正交: -0.5+0+0.5 = 0)
x1_minnorm = pinv(A_under) * b1; % 同样返回 [-0.5; 0; 0.5], 2-范数均为 sqrt(0.5) ≈ 0.707107

% 情形 2：右端项 b2 = [1; 2] —— 全体精确解为 x(t) = [t - 1/3; 2/3 - 2*t; t] (验证 A_under * x(t) == [1; 2])
% 范数平方 ||x(t)||_2^2 = (t-1/3)^2 + (2/3-2*t)^2 + t^2 = 6*t^2 - (10/3)*t + 5/9:
%   - 取 t = 1/3 得到含两个零分量的基本解 x2_basic = [0; 0; 1/3]，其范数平方为 1/9 = 6/54 (2-范数 = 1/3 ≈ 0.333333)；
%   - 取极小点 t* = 5/18 得到唯一的极小 2-范数解 x2_minnorm = [-1/18; 1/9; 5/18]，其范数平方为 5/54 < 6/54 (2-范数 = sqrt(5/54) ≈ 0.304290)！
b2 = [1; 2];
x2_basic   = [0; 0; 1/3];        % 基本解 (与 A_under \ b2 一致): [0; 0; 0.333333], ||x||_2 = 1/3 ≈ 0.333333
x2_minnorm = pinv(A_under) * b2; % 极小 2-范数解: [-1/18; 1/9; 5/18] ≈ [-0.055556; 0.111111; 0.277778], ||x||_2 = sqrt(5/54) ≈ 0.304290

fprintf('b2=[1;2] 基本解:   残差 = %.1e, 2-范数 = %.6f (范数平方 6/54)\n', norm(A_under*x2_basic - b2), norm(x2_basic, 2));
fprintf('b2=[1;2] 伪逆解:   残差 = %.1e, 2-范数 = %.6f (范数平方 5/54, 严格更小)\n', norm(A_under*x2_minnorm - b2), norm(x2_minnorm, 2));
```

### 2.2 魔方阵 `magic(n)` 的秩亏规律与相容性验证
$n$ 阶魔方阵 `M = magic(n)` 的每行、每列及两条主对角线元素之和均等于幻方常数 $S_n = \frac{n(n^2+1)}{2}$，其秩 $\operatorname{rank}(\text{magic}(n))$ 由 $n \bmod 4$ 的余数决定：
- **奇数阶（$n = 2k+1$）**：满秩 $\operatorname{rank}(M) = n$，行列式非零，`M \ ones(n,1)` 有唯一解 $\frac{1}{S_n}\mathbf{1}_n$；
- **双偶数阶（$n = 4k$，如 `magic(4)`、`magic(8)`）**：严重秩亏，恒有 $\operatorname{rank}(\text{magic}(4k)) = 3$！对 `A = magic(4)`（$\operatorname{rank}(A)=3$），当右端项为 $b_1 = \text{ones}(4,1)$ 时，$\operatorname{rank}([A, b_1]) = 3 = \operatorname{rank}(A)$，方程组**相容且有无穷多解**，通解为 $x = \text{pinv}(A)*b_1 + c\cdot\text{null}(A, 'r')$；当右端项为 $b_2 = [1;2;3;4]$ 时，$\operatorname{rank}([A, b_2]) = 4 > \operatorname{rank}(A)$，方程组**不相容（无精确解）**；
- **单偶数阶（$n = 4k+2$，如 `magic(6)`）**：秩为 $\operatorname{rank}(\text{magic}(n)) = \frac{n}{2} + 2$。

### 2.3 含参线性方程组的符号消元与分情况讨论
对含参数 $\lambda$（或 $a, b$）的线性方程组 $A(\lambda)x = b(\lambda)$，直接对符号矩阵调用 `rref([A, b])` 会默认假设主元多项式非零。规范分析流程是：先计算系数行列式 `factor(det(A))` 定位使矩阵降秩的**临界参数值**，再将临界参数值逐一代回增广矩阵 `[A, b]` 比较 `rank(A)` 与 `rank([A, b])`（或调用 `solve(eqns, vars, 'ReturnConditions', true)`）：

```matlab
%% 含参线性方程组讨论算例
syms a b x1 x2 x3
A_sym = [1, 1, 1; 1, a, 1; 1, 1, a^2];
b_sym = [1; b; b^2];

det_A = factor(det(A_sym)); % (a - 1)^2 * (a + 1)，临界值为 a = 1 与 a = -1
% (1) 当 a ~= 1 且 a ~= -1 时：det(A) ~= 0，有唯一解
sol_unique = simplify(A_sym \ b_sym);
% (2) 当 a = 1 时：代入增广矩阵检验相容性 (仅当 b = 1 时相容，有无穷多解)
Aug_a1 = subs([A_sym, b_sym], a, 1);
% (3) 当 a = -1 时：第 1 行与第 3 行相同，仅当 b^2 = 1 (b = 1 或 -1) 时相容
Aug_am1 = subs([A_sym, b_sym], a, -1);
```

## 3. 向量范数、矩阵范数与低秩逼近（第 7–9 页）

### 3.1 常见矩阵范数
对矩阵 $A \in \mathbb{C}^{m \times n}$，算子诱导范数 $\|A\|_p = \sup_{x \neq 0} \frac{\|Ax\|_p}{\|x\|_p}$ 与 Frobenius 范数计算公式如下：

$$
\begin{aligned}
\|A\|_2 &= \sigma_{\max}(A) = \sqrt{\lambda_{\max}(A^*A)} \quad &\implies \quad &\text{\texttt{norm(A)} 或 \texttt{norm(A, 2)}}, \\
\|A\|_F &= \left(\sum_{i=1}^m\sum_{j=1}^n |a_{ij}|^2\right)^{1/2} = \sqrt{\operatorname{tr}(A^*A)} \quad &\implies \quad &\text{\texttt{norm(A, 'fro')}}, \\
\|A\|_1 &= \max_{1 \le j \le n} \sum_{i=1}^m |a_{ij}| \quad &\implies \quad &\text{\texttt{norm(A, 1)}（最大列绝对值和）}, \\
\|A\|_\infty &= \max_{1 \le i \le m} \sum_{j=1}^n |a_{ij}| \quad &\implies \quad &\text{\texttt{norm(A, inf)}（最大行绝对值和）}.
\end{aligned}
$$

- **概念辨析**：`nnz(A)` 统计非零元素个数（常俗称为“$\ell_0$ 范数”），但由于 $\|cA\|_0 = \|A\|_0 \, (c \neq 0)$ 不满足绝对齐次性 $\|cA\| = |c|\|A\|$，严格数学意义上**不是范数**。
- **核范数（Nuclear Norm / Trace Norm）**：定义为全部奇异值之和 $\|A\|_* = \sum_i \sigma_i(A) = \text{\texttt{sum(svd(A))}}$，是矩阵秩函数 $\operatorname{rank}(A)$ 在单位谱范数球上的凸包络（Convex Envelope）。仅当 $A$ 为半正定 Hermite 矩阵时，才有 $\|A\|_* = \operatorname{tr}(A)$。

### 3.2 截断 SVD 与 Eckart-Young-Mirsky 定理
设 $A = \sum_{i=1}^r \sigma_i u_i v_i^*$（$\sigma_1 \ge \sigma_2 \ge \cdots \ge \sigma_r > 0$），取前 $k \, (k < r)$ 项构造秩 $k$ 截断矩阵 $A_k = \sum_{i=1}^k \sigma_i u_i v_i^*$，则对所有秩不超过 $k$ 的矩阵 $B$：

$$
\min_{\operatorname{rank}(B) \le k} \|A - B\|_2 = \|A - A_k\|_2 = \sigma_{k+1}, \qquad
\min_{\operatorname{rank}(B) \le k} \|A - B\|_F = \|A - A_k\|_F = \sqrt{\sum_{i=k+1}^r \sigma_i^2}.
$$

## 4. 四大基本子空间基与不变子空间验证（第 12–14 页）

### 4.1 四大基本子空间基的提取
- **最简行阶梯形 `[R, jb] = rref(A)`**：返回值 `jb` 为主元列索引向量。由于初等行变换改变列空间，提取列空间 $\mathcal{R}(A)$ 的极大线性无关组时必须从**原矩阵**取主元列 `A(:, jb)`，而非取 `R(:, jb)`。
- **标准正交基**：`orth(A)` 基于 SVD 返回列空间 $\mathcal{R}(A)$ 的一组标准正交基；`null(A)` 返回零空间 $\mathcal{N}(A)$ 的标准正交基（`null(A, 'r')` 则基于 `rref` 返回有理基）。

### 4.2 特征值、特征向量与不变子空间验证
设 $W = \operatorname{span}(V_k) \subseteq \mathbb{C}^n$ 是由矩阵 $A$ 的 $k$ 个线性无关特征向量 $V_k = [v_1, \dots, v_k]$ 张成的子空间，则 $AV_k = V_k \Lambda_k$，这表明 $A(W) \subseteq W$，即 $W$ 是 $A$ 的一个**不变子空间（Invariant Subspace）**。更一般地，对任意满秩列矩阵 $Q \in \mathbb{C}^{n \times k}$，子空间 $\mathcal{R}(Q)$ 是 $A$-不变子空间的充要条件是 $AQ$ 对 $\mathcal{R}(Q)$ 的正交补投影残差为零：
```matlab
[V, D] = eig(A);
Vk = V(:, 1:2); % 取前两个特征向量张成子空间 W
% 验证 A*Vk 完全落在 span(Vk) 内：投影残差 norm(A*Vk - Vk*(Vk \ (A*Vk))) 接近机器零
proj_err = norm(A * Vk - Vk * (Vk \ (A * Vk)));
```

## 5. 条件数与 Hilbert 病态矩阵扰动实验（第 15–20 页）

设非奇异方程组 $Ax = b$ 的近似解为 $\hat{x}$，定义残差向量 $r = b - A\hat{x}$ 与误差向量 $e = \hat{x} - x = -A^{-1}r$。由范数次乘性可得相对误差与相对残差的基本不等式：

$$
\frac{1}{\kappa(A)} \frac{\|b - A\hat{x}\|}{\|b\|} \le \frac{\|\hat{x} - x\|}{\|x\|} \le \kappa(A)\frac{\|b - A\hat{x}\|}{\|b\|}, \qquad \kappa(A) = \|A\| \|A^{-1}\|.
$$

其中 $\kappa(A)$ 为矩阵的条件数（`cond(A)`）。当 $\kappa(A) \gg 1$ 时，矩阵称为**病态矩阵（Ill-conditioned Matrix）**。

**经典算例：Hilbert 病态矩阵实验**
$n$ 阶 Hilbert 矩阵 $H_{ij} = \frac{1}{i + j - 1}$（`hilb(n)`）是对称正定矩阵，但其条件数随阶数 $n$ 呈指数级增长（$\kappa_2(H_n) \sim O\bigl((1+\sqrt{2})^{4n}/\sqrt{n}\bigr)$）：当 $n = 12$ 时，$\kappa_2(H_{12}) \approx 1.7 \times 10^{16} > \varepsilon_{\text{mach}}^{-1}$。此时预设真解 $x_{\text{true}} = \mathbf{1}_n$，计算右端项 $b = H_n x_{\text{true}}$，再用 `x_hat = H_n \ b` 反解：尽管残差范数 $\|b - H_n\hat{x}\|_2 \approx 10^{-16}$ 极小，但解的真实相对误差 $\|\hat{x} - x_{\text{true}}\|_2 / \|x_{\text{true}}\|_2$ 已超过 $100\%$！

```matlab
%% Hilbert 病态矩阵条件数增长与小残差大误差实验
for n = [4, 8, 12]
    H = hilb(n);
    x_true = ones(n, 1);
    b = H * x_true;
    x_hat = H \ b;
    rel_res = norm(b - H * x_hat) / norm(b);
    rel_err = norm(x_hat - x_true) / norm(x_true);
    fprintf('n = %2d: cond(H) = %.2e, 相对残差 = %.2e, 解的相对真误差 = %.2e\n', ...
            n, cond(H), rel_res, rel_err);
end
```

## 6. 定常分裂迭代法：Jacobi 与 Gauss-Seidel（第 21–25 页）

将系数矩阵分解为 $A = D - L - U$，其中 $D = \operatorname{diag}(\operatorname{diag}(A))$ 为对角部分，$-L$ 与 $-U$ 分别为严格下三角与严格上三角部分：

$$
\begin{aligned}
\text{Jacobi 迭代：}\quad & D x^{(k+1)} = (L + U)x^{(k)} + b, \qquad & B_J &= D^{-1}(L + U), \\
\text{Gauss-Seidel 迭代：}\quad & (D - L)x^{(k+1)} = U x^{(k)} + b, \qquad & B_{GS} &= (D - L)^{-1}U.
\end{aligned}
$$

在 MATLAB 中，Gauss-Seidel 的单步更新应通过下三角前代求解 `x = tril(A) \ (b - triu(A, 1) * x)` 实现，避免显式计算 `(D - L)` 的逆矩阵。

**收敛性定理**：
1. **充要条件**：定常线性迭代 $x^{(k+1)} = B x^{(k)} + f$ 对任意初值 $x^{(0)}$ 收敛于唯一真解 $x^*$ 的**充要条件**是迭代矩阵的谱半径满足 $\rho(B) < 1$。
2. **充分条件**：若存在某种算子诱导范数使得 $\|B\| < 1$（例如当 $A$ 为严格对角占优矩阵时 $\|B_J\|_\infty < 1$ 且 $\|B_{GS}\|_\infty < 1$），则必有 $\rho(B) \le \|B\| < 1$，迭代收敛。反之，若 $\|B\| \ge 1$，只要 $\rho(B) < 1$，迭代依然收敛。
3. **对称正定矩阵（SPD）**：当 $A = A^{\mathsf{T}} > 0$ 时，Gauss-Seidel 迭代无条件收敛（Householder-John 定理），但 Jacobi 迭代仅在 $2D - A$ 也正定时才收敛。

## 7. 变分二次型、最速下降法与共轭梯度法（第 26–31 页）

当 $A \in \mathbb{R}^{n \times n}$ 对称正定（$A = A^{\mathsf{T}} > 0$）时，求解线性方程组 $Ax = b$ 等价于无约束严格凸二次泛函的极小化问题：

$$
\min_{x \in \mathbb{R}^n} \varphi(x) = \frac{1}{2} x^{\mathsf{T}} A x - b^{\mathsf{T}} x, \qquad \nabla \varphi(x) = Ax - b = -r.
$$

- **最速下降法（Steepest Descent）**：沿负梯度（残差）方向 $r_k = b - Ax_k$ 执行精确一维线搜索，最优步长与迭代格式为：

$$
\alpha_k = \frac{r_k^{\mathsf{T}} r_k}{r_k^{\mathsf{T}} A r_k}, \qquad x_{k+1} = x_k + \alpha_k r_k.
$$

相邻两步残差正交（$r_{k+1}^{\mathsf{T}} r_k = 0$），在条件数较大时轨迹呈直角锯齿形，收敛率受 $\left(\frac{\kappa(A)-1}{\kappa(A)+1}\right)^2$ 限制。
- **共轭梯度法（Conjugate Gradient, `pcg`）**：从初始猜测 $x_0$（初始残差 $r_0 = b - A x_0$）出发，构造一组关于内积 $\langle p, q \rangle_A = p^{\mathsf{T}} A q$ 彼此 $A$-共轭（$A$-正交）的搜索方向，第 $k$ 步迭代点 $x_k$ 在**平移后的仿射 Krylov 子空间**
  $$
  x_0 + \mathcal{K}_k(A, r_0), \qquad \text{其中 } \mathcal{K}_k(A, r_0) = \operatorname{span}\{r_0, \, Ar_0, \, \dots, \, A^{k-1}r_0\}
  $$
  中极小化能量范数误差 $\|x - x^*\|_A = \sqrt{(x - x^*)^{\mathsf{T}}A(x - x^*)}$（即修正量 $x_k - x_0 \in \mathcal{K}_k(A, r_0)$；当取零初值 $x_0 = 0$ 时，$r_0 = b$，极小化子空间退化为线性子空间 $\mathcal{K}_k(A, b)$）。在**无浮点舍入误差的精确算术（Exact Arithmetic）**下，共轭梯度法至多 $n$ 步（更精确地，至多等于 $A$ 的互异特征值个数步）必求得精确解，其第 $k$ 步误差满足上界估计：
  $$
  \|x_k - x^*\|_A \le 2\left(\frac{\sqrt{\kappa_2(A)} - 1}{\sqrt{\kappa_2(A)} + 1}\right)^k \|x_0 - x^*\|_A.
  $$

```matlab
[x, flag, relres, iter, resvec] = pcg(A, b, 1e-8, 500);
```

## 8. 课后练习与学习任务汇总表（第 32–35 页）

| 任务编号 | 主题模块 | 核心训练内容与目标 | 配套参考讲义 |
| :--- | :--- | :--- | :--- |
| **任务 1** | 矩阵分解与子空间 | 对给定秩亏矩阵求 `rref`、`orth`、`null`，验证秩-零度定理 $\operatorname{rank}(A)+\dim\mathcal{N}(A)=n$ | [[MATLAB/课程讲义/08B_第八周实验课\|第八周实验课]] |
| **任务 2** | 欠定/超定系统对比 | 对比 `A\b`（基本解）与 `pinv(A)*b`（极小 2-范数解）在魔方阵及矩形矩阵上的表现 | [[MATLAB/课程讲义/10B_第十周实验课\|第十周实验课]] |
| **任务 3** | 病态系统扰动实验 | 对 `hilb(n)` 施加 $10^{-7}$ 级右端微扰，验证相对误差上界 $\kappa(A)\frac{\|\Delta b\|}{\|b\|}$ | 本讲 §5 |
| **任务 4** | 定常分裂迭代与 CG | 编程实现 Jacobi、Gauss-Seidel、最速下降法与 `pcg`，对比迭代谱半径 $\rho(B)$ 与收敛步数 | [[MATLAB/课程讲义/08D_第八课迭代补充|第八课迭代补充]] |
| **任务 5** | 第八周课后正式作业 | 奇异值与范数计算、`magic(4)` 通解表示、Gauss-Seidel 前代实现与终止判据分析 | [[MATLAB/课程讲义/补充_第七周与第八周作业参考解读\|第七周与第八周作业参考解读]] |

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
