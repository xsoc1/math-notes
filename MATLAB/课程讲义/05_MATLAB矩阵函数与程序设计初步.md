---
title: "第五课：MATLAB 矩阵函数与程序设计初步"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/05_MATLAB矩阵函数与程序设计初步.md"
matlab_source_sha256: e49cf089acb355b688005043d1c2418900317519129c7b98eb4796b22a480dfb
---


# 第五课：MATLAB 矩阵函数与程序设计初步

来源：[[MATLAB/课程资料/原始课件/第五课 MATLAB矩阵函数与程序设计初步.pdf|第五课 MATLAB矩阵函数与程序设计初步.pdf]]，李嘉，中山大学数学学院，共 44 页。

## 1. 课件脉络与先修关系

本课承接第四课的数组索引与逻辑运算，重点阐述矩阵函数（Matrix Functions）的数学定义，以及条件分支、循环结构、元胞数组（Cell）、M 函数封装与综合算法编程练习。

| 原 PDF 页码 | 课件主题 | 核心学习重点 |
| :--- | :--- | :--- |
| 2–8 | 矩阵乘除、幂与矩阵函数；矩阵乘法效率对比 | 区分 `A\b`、`expm`、`logm`、`sqrtm`、`funm` 与逐元素函数 |
| 9–10 | 格式化输出 `fprintf` | 掌握格式占位符 `%d`、`%f`、`%e`、`%g` 与转义字符 `\n` |
| 11–19 | `if` 条件分支；`fminbnd` 与模拟退火算例 | 掌握分支判断、一维局部寻优与启发式搜索算法 |
| 20–23 | `switch` 分支与元胞数组 `cell` | 区分元胞切片 `C(i)` 与内容解引用 `C{i}` |
| 24–29 | `for`、`while` 循环；Hilbert 矩阵、Pascal 矩阵与幻方构造 | 掌握数组预分配（Preallocation）与计算复杂度估计 |
| 30–33 | 流程控制、断点调试与交互式输入 | 掌握 `break`、`continue`、`keyboard`、`dbcont`、`input` |
| 34–44 | 脚本与函数工作区、帮助注释、代码分节及综合编程练习 | 编写具有独立局部工作区的函数并完成 7 类综合编程题 |

## 2. 矩阵运算与矩阵函数

### 2.1 矩阵左除 `A\b` 的数学意义
- 当 $A$ 为非奇异方阵时，$x = A\backslash b$ 求解唯一解 $x = A^{-1}b$，但底层通过三角分解求解而无需显式求逆。
- 当 $A \in \mathbb{R}^{m \times n} \, (m > n)$ 为超定方程组且不相容时，`A\b` 自动通过 QR 分解求解最小二乘问题 $\min_x \|Ax - b\|_2$。例如不相容方程组 $x = 0, \, x = 2$（即 $A = [1; 1], \, b = [0; 2]$），`A\b` 返回最小二乘解 $x = 1$，最小残差范数为 $\|Ax - b\|_2 = \sqrt{2}$。

### 2.2 矩阵指数 `expm(A)` 与逐元素指数 `exp(A)`
`exp(A)` 对矩阵的每个元素分别取自然指数 $(e^{a_{ij}})$；而 `expm(A)` 计算方阵 $A$ 的矩阵指数幂级数：

$$
e^A = \sum_{k=0}^{\infty} \frac{A^k}{k!} = I + A + \frac{A^2}{2!} + \frac{A^3}{3!} + \cdots
$$

若 $A = P D P^{-1}$ 可对角化，则 $e^A = P e^D P^{-1}$；但**可对角化并非矩阵指数存在的前提**（幂级数对任意方阵绝对收敛）。考察不可对角化的幂零 Jordan 块 $N = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$（满足 $N^2 = 0$）：

```matlab
N = [0 1; 0 0];
MatrixExp = expm(N)   % 返回 I + N = [1 1; 0 1]
ElementExp = exp(N)   % 返回 [exp(0) exp(1); exp(0) exp(0)] = [1 e; 1 1]
```

同理，矩阵平方根 `R = sqrtm(A)` 满足矩阵乘积 $R \cdot R = A$（可通过 `norm(R*R - A)` 检验），矩阵对数 `L = logm(A)` 满足 $\operatorname{expm}(L) = A$，一般解析矩阵函数由 `funm(A, @sin)` 计算，均不同于逐元素运算 `sqrt(A)`、`log(A)`、`sin(A)`。

**代数结构注记**：多元素矩阵在逐元素加法与逐元素乘法 `.*` 下构成交换环，但**不构成域（Field）**，因为存在非零零因子（例如 `[1 0] .* [0 1] = [0 0]`）。

## 3. 格式化输出与条件分支

### 3.1 `fprintf` 格式化输出
`fprintf(formatSpec, A1, ..., An)` 将格式化文本写入屏幕或文件。例如 `%6.4e` 中，`6` 指定最小字段宽度，`.4` 指定小数点后保留 4 位数字，`e` 表示科学计数法。当传入矩阵参数时，`fprintf` 同样按**列主序**依次读取元素填充格式串。

### 3.2 `if` 与 `switch` 结构
- 在 `if cond` 中，若 `cond` 为逻辑向量或矩阵，MATLAB 仅当**所有元素全为非零**（等价于 `all(cond(:))`）时才视为条件成立。因此在编写数组条件判断时，应显式调用 `all(...)` 或 `any(...)` 以确保语义清晰。
- `switch` 结构适合离散枚举值或字符串的精确分支匹配（MATLAB 的 `switch` 命中分支后自动跳出，无需写 `break`；多值匹配使用元胞数组 `case {1, 2, 3}`）。

## 4. 循环控制、内存预分配与复杂度

### 4.1 循环遍历与函数封装示例
```matlab
function Total = sum_positive(Values)
% SUM_POSITIVE 计算数值向量中所有正元素的总和
    Total = 0;
    for Index = 1:numel(Values)
        if Values(Index) <= 0
            continue;
        end
        Total = Total + Values(Index);
    end
end
```

### 4.2 数组预分配（Preallocation）与向量化构造
以构造 $n$ 阶 Hilbert 矩阵 $H_{ij} = \frac{1}{i + j - 1}$ 为例：
1. **未预分配动态扩容**：在循环内直接对超出当前尺寸的下标赋值，会导致每次迭代重新分配连续内存并拷贝旧数据，耗时急剧增加。
2. **`zeros` 预分配**：循环前执行 `H = zeros(n, n);`，仅分配一次内存。
3. **隐式扩展向量化**：利用行列下标向量一步生成：
```matlab
idx = 1:n;
H = 1 ./ (idx.' + idx - 1);
```

## 5. 元胞数组、函数工作区与调试

### 5.1 元胞数组 `cell` 的两种索引方式
元胞数组可在不同单元存储不同类型和尺寸的数据。对 `Data = {7, 'ready'}`：
- **圆括号 `Data(1)`**：返回 $1 \times 1$ 的 `cell` 子容器（`class(Data(1))` 为 `'cell'`）。
- **花括号 `Data{1}`**：解引用取出该单元格内部的实际数据 `7`（`class(Data{1})` 为 `'double'`）。

### 5.2 函数局部工作区与写时复制机制
- 每个 M 函数拥有独立的局部工作区（Local Workspace），通过输入输出参数列表与外部传递数据。
- **参数传递内存机制**：MATLAB 对函数参数传递采用**写时复制（Copy-on-Write）**策略。若函数内部仅读取输入数组而不修改其元素，MATLAB 不会复制整块内存，而是共享数据引用；仅当函数内部修改该参数时，才会为修改后的变量分配新内存副本（参见 [MathWorks 避免不必要的数据复制文档](https://www.mathworks.com/help/matlab/matlab_prog/avoiding-unnecessary-copies-of-data.html)）。

## 6. 一维寻优与模拟退火算法边界

- `fminbnd(fun, a, b)` 基于黄金分割搜索与抛物线插值，寻找单变量连续函数在有界区间 $(a, b)$ 内的**局部极小值点**，不保证在多峰函数上找到全局最小值（参见 [MathWorks fminbnd 文档](https://www.mathworks.com/help/matlab/ref/fminbnd.html)）。
- 模拟退火（Simulated Annealing）通过 Metropolis 准则以概率 $\exp(-\Delta E / T)$ 接受目标函数值更差的候选解，从而跳出局部极小陷阱；但其单次运行属于随机启发式搜索，结果受随机数种子、初始温度与降温调度影响。

## 7. 综合编程练习全解（课堂与实验综合题）

### 7.1 练习 1：Pascal 矩阵构造与代数性质验证
$n$ 阶对称 Pascal 矩阵满足 $P_{ij} = \binom{i+j-2}{i-1}$，可由递推关系 $P_{i,1} = P_{1,j} = 1, \, P_{i,j} = P_{i-1,j} + P_{i,j-1}$ 构造（对应内建 `pascal(n)`）。其下三角 Cholesky 因子 $L$ 由组合数 $L_{ij} = \binom{i-1}{j-1}$ 构成且对角元全为 $1$，故恒有 $\det(P_n) = (\det L)^2 = 1$，且 $P_n^{-1}$ 为整数矩阵：
```matlab
n = 6;
P = ones(n, n);
for i = 2:n
    for j = 2:n
        P(i, j) = P(i - 1, j) + P(i, j - 1);
    end
end
det_P = det(P);          % 理论值为 1
inv_P = invhilb_or_inv(P); % round(inv(P)) 全部为精确整数
```

### 7.2 练习 2：数组多条件逻辑筛选与统计
在 $1 \sim 1000$ 的整数数组中筛选出所有既能被 $3$ 整除、又不能被 $5$ 整除且个位数字不为 $2$ 的整数，计算其总个数与总和：
```matlab
nums = 1:1000;
mask = (mod(nums, 3) == 0) & (mod(nums, 5) ~= 0) & (mod(nums, 10) ~= 2);
selected = nums(mask);
count_sel = numel(selected);
sum_sel   = sum(selected);
```

### 7.3 练习 3：Fibonacci 数列相邻项比值逼近黄金分割比
Fibonacci 数列满足 $F_1 = 1, \, F_2 = 1, \, F_n = F_{n-1} + F_{n-2}$。特征方程 $\lambda^2 - \lambda - 1 = 0$ 的两根为黄金分割比 $\phi = \frac{1+\sqrt{5}}{2} \approx 1.618033988749895$ 与 $\psi = \frac{1-\sqrt{5}}{2}$，由 Binet 公式 $F_n = \frac{\phi^n - \psi^n}{\sqrt{5}}$ 知比值误差满足：
$$
\left|\frac{F_{n+1}}{F_n} - \phi\right| = \frac{\sqrt{5}}{\phi^{2n} + O(1)} = O(\phi^{-2n}).
$$
```matlab
N = 45;
F = zeros(1, N);
F(1:2) = 1;
for k = 3:N
    F(k) = F(k - 1) + F(k - 2);
end
ratio = F(2:end) ./ F(1:end-1);
phi = (1 + sqrt(5)) / 2;
err_phi = abs(ratio - phi); % 第 40 项即达双精度机器精度 ~1e-16
```

### 7.4 练习 4：素数表生成（Eratosthenes 筛法）
构造 $[2, N]$ 内的素数表，维护逻辑数组 `is_p = true(1, N)`，筛除所有合数倍数：
```matlab
function primes_list = sieve_primes(N)
    is_p = true(1, N);
    is_p(1) = false;
    for p = 2:floor(sqrt(N))
        if is_p(p)
            is_p(p^2 : p : N) = false;
        end
    end
    primes_list = find(is_p);
end
```

### 7.5 练习 5：Collatz 序列（$3n+1$ 序列）函数封装与最大步数搜寻
编写函数计算任意正整数 $n$ 的 Collatz 序列，并搜寻 $[1, 1000]$ 内到达 $1$ 所需步数最多的初始正整数：
```matlab
function [seq, steps] = collatz_seq(n)
    seq = n;
    while n > 1
        if mod(n, 2) == 0
            n = n / 2;
        else
            n = 3 * n + 1;
        end
        seq(end + 1) = n; %#ok<AGROW>
    end
    steps = numel(seq) - 1;
end
```

### 7.6 练习 6：两道分段函数的向量化实现
1. **分段函数一**：
   $$
   f_1(x) = \begin{cases} \sin x, & x < 0, \\ x^2, & 0 \le x < 2, \\ 4\ln(x - 1) + 4, & x \ge 2. \end{cases}
   $$
2. **分段函数二（二维径向分段函数）**：
   $$
   f_2(x, y) = \begin{cases} 1 - (x^2 + y^2), & x^2 + y^2 \le 1, \\ 0, & x^2 + y^2 > 1. \end{cases}
   $$
```matlab
% 分段函数一向量化计算
x = linspace(-pi, 4, 500);
f1 = zeros(size(x));
f1(x < 0) = sin(x(x < 0));
m_mid = (x >= 0) & (x < 2);
f1(m_mid) = x(m_mid).^2;
f1(x >= 2) = 4 * log(x(x >= 2) - 1) + 4;

% 分段函数二二维网格向量化计算
[X, Y] = meshgrid(linspace(-1.5, 1.5, 151));
R2 = X.^2 + Y.^2;
F2 = max(1 - R2, 0);
```

### 7.7 练习 7：椭圆 $x^2 + 4y^2 \le 1000$ 内部整点计数问题
**问题**：求闭椭圆区域 $E = \{(x, y) \in \mathbb{R}^2 : x^2 + 4y^2 \le 1000\}$ 内部（含边界）所包含的整数格点 $(x, y) \in \mathbb{Z}^2$ 的总个数。

**数学分析与向量化实现**：
由 $x^2 \le 1000 \implies |x| \le \lfloor\sqrt{1000}\rfloor = 31$，$4y^2 \le 1000 \implies |y| \le \lfloor\sqrt{250}\rfloor = 15$。
- **方法一（二维网格逻辑掩码求和）**：在包围盒 $[-31, 31] \times [-15, 15]$ 上生成整数网格，直接对逻辑矩阵 `(X.^2 + 4*Y.^2 <= 1000)` 求 `nnz`（或 `sum(..., 'all')`）；
- **方法二（一维逐列解析计数）**：对每个固定的整数 $y \in [-15, 15]$，满足 $x^2 \le 1000 - 4y^2$ 的整数 $x$ 范围为 $[-\lfloor\sqrt{1000-4y^2}\rfloor, \, +\lfloor\sqrt{1000-4y^2}\rfloor]$，共 $2\lfloor\sqrt{1000 - 4y^2}\rfloor + 1$ 个整点。

```matlab
% 方法一：二维网格逻辑掩码计数
[X, Y] = meshgrid(-31:31, -15:15);
count_2d = nnz(X.^2 + 4 * Y.^2 <= 1000); % 精确返回 1577

% 方法二：一维向量化解析求和 (y = 0 含 63 点, y = +-1..+-15 共 2*757 = 1514 点, 合计 1577 点)
y = -15:15;
x_max = floor(sqrt(1000 - 4 * y.^2));
count_1d = sum(2 * x_max + 1);           % 同样精确返回 1577
fprintf('椭圆 x^2 + 4y^2 <= 1000 内的整点总数为: %d\n', count_1d);
```

## 8. 课程作业与配套参考资料归属

- **课程作业对应说明**：第五课布置的正式课后编程作业对应于**第六周作业提交批次**（包含素数红包枚举、100 节点连通道路网最小生成树 MST 以及新增路口 Steiner 点优化三道大题）。
- 上述三道正式作业题的教师参考代码解析、试除法与 Eratosthenes 筛法对比、Prim/Kruskal 图论算法及局部寻优策略，完整收录于 [[MATLAB/课程讲义/补充_第五周作业参考解读|第五周作业参考解读]]。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
