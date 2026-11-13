---
title: 第九课 MATLAB 进阶程序设计与问题求解
date: 2026-10-29
tags:
  - matlab/lecture
  - matlab/programming
  - matlab/optimization
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/09_MATLAB进阶程序设计与问题求解.md"
matlab_source_sha256: 9511d232195edaf9b23b00cb8dacd28cf6745824b6126c2b82938afc6b1bbe45
---

# 第九课：MATLAB 进阶程序设计与问题求解

来源：[[MATLAB/课程资料/原始课件/第九课 MATLAB进阶程序设计与问题求解（2026-11-04修订）.pdf|第九课 MATLAB进阶程序设计与问题求解（2026-11-04修订）.pdf]]（共 41 页）。本讲系统介绍 M 函数接口与高阶函数句柄封装、逻辑数组高级筛选与时间复杂度实测、递归与记忆化算法、非线性方程求根（二分法、不动点迭代、Newton 求根法、`fzero`、`roots`）、无约束与有约束数值最优化主线（单峰函数黄金分割搜索、极小化 Newton 法与求根 Newton 法的区别、Rosenbrock 测试函数、`fminbnd`、`fminsearch`、`fminunc`、`fmincon`）以及元胞自动机（Conway 生命游戏）建模。

前置阅读：[[MATLAB/课程讲义/05_MATLAB矩阵函数与程序设计初步|第五课的程序与函数]]、[[MATLAB/课程讲义/08_MATLAB线性代数|第八课的矩阵与线性方程]]。

## 1. 脚本、函数工作区与高阶函数句柄封装（第 2–8 页）

### 1.1 工作区隔离与帮助头规范
- **工作区隔离**：脚本（Script）直接在基础工作区（Base Workspace）中读写变量；函数（Function）拥有独立的局部工作区，仅通过显式输入输出参数列表交换数据。
- **帮助头（Help Header）**：紧随 `function` 声明行之后的连续 `%` 注释块可通过 `help func_name` 调阅，首行（H1 行）概述函数核心用途，后续说明输入参数维度、输出返回值及调用示例。

### 1.2 匿名函数、闭包捕获与高阶函数封装
函数句柄（`function_handle`）是将函数作为一等公民传递给高阶数值求解器（如 `integral`、`ode45`、`fzero`、`fminbnd`）或自定义通用算法的标准接口：

```matlab
a = 3;
f_param = @(x) a * x + 1; % 闭包捕获创建时刻的快照值 a = 3
a = 10;
val = f_param(2);         % 计算 3 * 2 + 1，返回值仍为 7
```

**通用二分法求根高阶函数封装算例**：编写接收任意单变量函数句柄 `f` 的通用求根器：
```matlab
function [root, iter] = bisection_solver(f, a, b, tol)
% BISECTION_SOLVER 通用二分法求根高阶函数（含端点零点预检与严格异号区间维护）
    fa = f(a); fb = f(b);
    if fa == 0
        root = a; iter = 0; return; % 左端点本身即为精确零点，直接返回（避免进入循环后被归入右半区间）
    elseif fb == 0
        root = b; iter = 0; return; % 右端点本身即为精确零点，直接返回
    elseif fa * fb > 0
        error('端点函数值同号，不满足二分法严格变号前提 f(a)*f(b) < 0');
    end
    iter = 0;
    % 进入循环时恒满足严格异号 fa * fb < 0
    while (b - a) / 2 > tol
        c = a + (b - a) / 2;
        fc = f(c);
        iter = iter + 1;
        if fc == 0
            root = c; return;
        elseif fa * fc < 0
            b = c; fb = fc;
        else
            a = c; fa = fc;
        end
    end
    root = a + (b - a) / 2;
end
```

## 2. 逻辑筛选进阶、时间复杂度实测与递归/记忆化设计

### 2.1 逻辑数组高级筛选与含递推关系的向量化改写
- **复合逻辑掩码**：通过 `&`、`|`、`~` 与 `any`、`all` 对二维表格或矩阵执行多条件联合筛选。
- **线性递推关系的向量化改写**：
  - 对一阶常系数线性递推 $y_k = a y_{k-1} + x_k$，虽有前后步依赖，但本质上是离散卷积（IIR 数字滤波器），可直接调用内建向量化函数 `y = filter(1, [1, -a], x)`；
  - 对加性或乘性二阶递推（如 $u_k = u_{k-1} + d_k$ 或 $w_k = r_k w_{k-1}$），可通过前缀和 `cumsum` 与前缀积 `cumprod` 完全消除显式循环：
```matlab
% 将 y(1) = c0, y(k) = y(k-1) * r(k) 改写为无循环向量化形式
r = [1, 0.9 * ones(1, 99)];
y_vec = c0 * cumprod(r);
```

### 2.2 算法时间复杂度实测（`tic` / `toc` 与 `timeit`）
在评估算法随规模 $N$ 的增长阶（如 $O(N)$ vs $O(N^2)$）时，使用 `tic`/`toc`（或 `timeit(@() my_func(N))`）在倍增规模序列 $N, 2N, 4N$ 上实测运行时间 $T(N)$：若时间比 $T(2N)/T(N) \approx 2$ 则为线性复杂度 $O(N)$，若 $T(2N)/T(N) \approx 4$ 则为平方复杂度 $O(N^2)$（对数斜率 $p \approx \frac{\ln(T(2N)/T(N))}{\ln 2}$）。

### 2.3 递归（Recursion）与记忆化（Memoization）Fibonacci 对比
以计算第 $n$ 项 Fibonacci 数 $F_n = F_{n-1} + F_{n-2}$ 为例：
1. **朴素双分支递归**：每次调用分裂为 `fib_naive(n-1) + fib_naive(n-2)`，调用树产生海量重复子问题，总调用次数为 $2F_n - 1 = O(\phi^n)$（指数级爆炸，$n = 40$ 即需上亿次调用）。
2. **记忆化搜索（Memoization）与自底向上递推**：利用持久数组 `persistent memo`（或 `memoize` 函数封装）缓存已算出的 $F_k$，每个状态仅计算一次，时间复杂度从指数级 $O(\phi^n)$ 骤降至线性级 **$O(n)$**：
```matlab
function val = fib_memo(n)
% FIB_MEMO 带持久化缓存表的记忆化递归 Fibonacci 函数
    persistent cache
    if isempty(cache)
        cache = [1, 1];
    end
    if n <= numel(cache) && cache(n) > 0
        val = cache(n);
        return;
    end
    val = fib_memo(n - 1) + fib_memo(n - 2);
    cache(n) = val;
end
```

## 3. 非线性方程数值求根（第 9–17 页）

### 3.1 经典求根算法与收敛阶
求解标量非线性方程 $f(x) = 0$ 的三类基本迭代法：
1. **二分法（Bisection Method）**：若 $f \in C[a, b]$ 且端点异号 $f(a)f(b) < 0$，由零点介值定理，每次取中点 $c = (a+b)/2$ 缩小有根区间。第 $k$ 步绝对误差上界满足 $|x_k - x^*| \le \frac{b-a}{2^k}$，具有无条件全局线性收敛性（收敛因子 $1/2$），但无法直接定位偶重数零点。
2. **不动点迭代（Fixed-Point Iteration）**：将方程改写为 $x = \varphi(x)$，构造 $x_{k+1} = \varphi(x_k)$。若在根 $x^*$ 的邻域内 $|\varphi'(x)| \le L < 1$，则由压缩映射原理局部线性收敛；若 $\varphi'(x^*) = 0$ 且 $\varphi''(x^*) \neq 0$，则为二阶收敛。
3. **求根 Newton-Raphson 法**：利用一阶 Taylor 线性化 $f(x_k) + f'(x_k)(x - x_k) \approx 0$ 导出：

$$
x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}.
$$

当 $x^*$ 为单根（$f'(x^*) \neq 0$）且 $f \in C^2$、初值 $x_0$ 充分靠近 $x^*$ 时，误差满足 $\lim_{k\to\infty} \frac{|e_{k+1}|}{|e_k|^2} = \frac{|f''(x^*)|}{2|f'(x^*)|}$，具有**局部二阶（平方）收敛速度**；若 $x^*$ 为 $m \, (m \ge 2)$ 重根，则退化为收敛率为 $1 - 1/m$ 的线性收敛。

### 3.2 内建求根器 `fzero` 与 `roots`
- **`fzero(fun, x0)`**：采用 Dekker-Brent 混合算法（结合二分法的可靠性与割线法、逆二次插值的超线性收敛速度）。若传入双元素有根区间 `[a, b]`，严格要求 $f(a)f(b) \le 0$；注意对于 $\tan x$ 等具有垂直渐近线的奇异函数，`fzero` 在无附加检查时可能将跨奇点的变号点误判为零点。
- **`roots(p)`**：对多项式降幂系数向量 `p = [a_n, a_{n-1}, ..., a_0]`，构造其 $n \times n$ Frobenius 伴随矩阵（Companion Matrix）并通过 QR 算法计算全部复特征值，从而一次性求出全部 $n$ 个复根（含重根）。

## 4. 数值最优化核心主线（第 18–35 页）

### 4.1 一维单峰函数缩区间搜索：三分法与黄金分割法复用机制
设目标函数 $f(x)$ 在闭区间 $[a, b]$ 上是**严格单峰函数（Strictly Unimodal Function）**（即存在唯一极小值点 $x^* \in [a, b]$，在 $x^*$ 左侧严格递减、右侧严格递增）。在无导数条件下，通过取两个对称内点 $x_1 < x_2 \in (a, b)$ 比较 $f(x_1)$ 与 $f(x_2)$ 即可确定缩减方向：
- 若 $f(x_1) < f(x_2)$，则极小点必在 $[a, x_2]$ 内，新区间取 $[a', b'] = [a, x_2]$；
- 若 $f(x_1) \ge f(x_2)$，则极小点必在 $[x_1, b]$ 内，新区间取 $[a', b'] = [x_1, b]$。

**为什么黄金分割搜索（0.618 法）显著优于三分法？**
- **三分法（Trisection）**：取三等分点 $x_1 = a + \frac{1}{3}(b-a), \, x_2 = a + \frac{2}{3}(b-a)$，每次区间长度缩为 $\frac{2}{3}$；但保留下来的内点在新区间中处于 $\frac{1}{2}$ 中点位置，**不是**下一步的三等分点，导致**每步迭代必须重新计算 2 次目标函数值**（每次函数求值的有效区间收缩率为 $(2/3)^{1/2} \approx 0.8165$）。
- **黄金分割法（Golden-Section Search）**：设计对称比例因子 $\tau \in (1/2, 1)$，令 $x_1 = b - \tau(b-a), \, x_2 = a + \tau(b-a)$。为使缩减为 $[a, x_2]$ 后原来的内点 $x_1$ 恰好成为新区间 $[a, x_2]$ 的右黄金分割点，要求比例满足：
  $$
  \frac{x_1 - a}{x_2 - a} = \frac{1 - \tau}{\tau} = \tau \implies \tau^2 + \tau - 1 = 0 \implies \tau = \frac{\sqrt{5} - 1}{2} \approx 0.61803398875.
  $$
  因此，黄金分割法除第 1 步计算 2 次函数值外，**后续每一步均可直接复用上一步保留下来的 1 个内点函数值，每步仅需新计算 1 次函数值**，单次函数求值的区间收缩率即达 $0.618 < 0.8165$！MATLAB 的 `fminbnd(fun, a, b)` 正是将黄金分割搜索（保证全局稳健缩区间）与逆抛物线插值（在光滑极小点附近加速至超线性收敛）结合的混合算法。

### 4.2 方程求根 Newton 法与最优化极小化 Newton 法的本质区别
初学者极易将“求零点的 Newton 法”与“求极值的 Newton 法”混为一谈，二者对比如下：

| 对比维度 | 方程求根 Newton 法 | 最优化（极小化）Newton 法 |
| :--- | :--- | :--- |
| **数学问题** | 求解非线性方程（组）$F(x) = 0$ | 求解无约束最优化 $\min_{x \in \mathbb{R}^d} f(x)$（一阶驻点条件 $\nabla f(x) = 0$） |
| **局部近似模型** | 将 $F(x)$ 作**一阶线性 Taylor 展开**并令其为 $0$ | 将目标函数 $f(x)$ 作**二阶二次 Taylor 展开**并求二次模型的驻点 |
| **标量迭代公式** | $x_{k+1} = x_k - \dfrac{f(x_k)}{f'(x_k)}$（仅需一阶导数） | $x_{k+1} = x_k - \dfrac{f'(x_k)}{f''(x_k)}$（需一阶导数与二阶导数） |
| **多维向量公式** | $x_{k+1} = x_k - \bigl[J_F(x_k)\bigr]^{-1} F(x_k)$（$J_F$ 为雅可比矩阵） | $x_{k+1} = x_k - \bigl[\nabla^2 f(x_k)\bigr]^{-1} \nabla f(x_k)$（$\nabla^2 f$ 为 Hessian 矩阵） |
| **局部适用前提** | 雅可比矩阵 $J_F(x^*)$ 非奇异 | Hessian 矩阵 $\nabla^2 f(x^*)$ **对称正定**（若不定或负定，纯 Newton 步可能走向鞍点或极大值点！） |

### 4.2.1 一阶梯度下降法（Gradient Descent）、$L$-光滑下降引理与线搜索步长准则
对可微目标函数 $\min_{x \in \mathbb{R}^d} f(x)$，负梯度方向 $d_k = -\nabla f(x_k)$ 是当前点处的局部最速下降方向，一阶梯度下降迭代格式为：
$$
x_{k+1} = x_k - \alpha_k \nabla f(x_k), \qquad \alpha_k > 0.
$$
1. **$L$-光滑函数的下降引理与固定步长收敛域**：若 $\nabla f$ 满足全局 Lipschitz 连续条件 $\|\nabla f(y) - \nabla f(x)\|_2 \le L\|y - x\|_2$（即 $f$ 为 $L$-光滑函数），则由积分型 Taylor 余项可得二次上界（**下降引理 Descent Lemma**）：
   $$
   f(y) \le f(x) + \nabla f(x)^{\mathsf T}(y - x) + \frac{L}{2}\|y - x\|_2^2.
   $$
   代入梯度步 $y = x_{k+1} = x_k - \alpha \nabla f(x_k)$，立得单步函数值下降量估计：
   $$
   f(x_{k+1}) \le f(x_k) - \alpha\left(1 - \frac{L\alpha}{2}\right)\|\nabla f(x_k)\|_2^2.
   $$
   因此，只要固定步长满足 **$0 < \alpha < \frac{2}{L}$**（二次上界的最优步长为 $\alpha^* = \frac{1}{L}$，此时每步至少下降 $\frac{1}{2L}\|\nabla f(x_k)\|_2^2$），只要 $\nabla f(x_k) \neq 0$，目标函数值就严格单调递减；反之，**当步长超过该充分下降上界（$\alpha \ge \frac{2}{L}$）时，上述下降引理不再保证目标函数值单调下降或全局收敛**（在最大曲率特征向量方向上会发生跨谷震荡甚至发散；但注意 $\alpha > \frac{2}{L}$ 并不意味着对一切初值必发散——例如对各向异性二次函数 $f(x, y) = \frac{1}{2}x^2 + 50y^2$，全局最小 Lipschitz 常数为 $L = 100$、阈值 $2/L = 0.02$，若取 $\alpha = 0.03 > 0.02$ 从初值 $(1, 0)$ 出发，由于在慢子空间 $y = 0$ 上局部曲率仅为 $1$，迭代点 $(0.97^k, 0)$ 仍收敛于 $(0, 0)$）。
2. **Armijo 回溯线搜索（Backtracking Line Search）**：在实际问题中全局常数 $L$ 往往未知或局部曲率变化剧烈（如 Rosenbrock 函数），此时从初始试探步长 $\alpha = \alpha_0$ 出发，按缩放因子 $\beta \in (0, 1)$ 不断回缩 $\alpha \leftarrow \beta\alpha$，直至满足 **Armijo 充分下降准则**（取常数 $c_1 \in (0, 1)$，通常 $c_1 = 10^{-4}$）：
   $$
   f\bigl(x_k - \alpha \nabla f(x_k)\bigr) \le f(x_k) - c_1 \alpha \|\nabla f(x_k)\|_2^2.
   $$

### 4.3 多维优化经典测试算例：Rosenbrock 香蕉函数与初值传入规范
1. **Rosenbrock 函数（香蕉函数，课件经典测试函数）**：
   $$
   f(x_1, x_2) = 100\bigl(x_2 - x_1^2\bigr)^2 + (1 - x_1)^2.
   $$
   由于两项平方非负，当且仅当 $1 - x_1 = 0$ 且 $x_2 - x_1^2 = 0$ 时取得**唯一全局最小值（亦为唯一驻点）**：
   $$
   (x_1^*, x_2^*) = (1, 1), \qquad f_{\min} = f(1, 1) = 0.
   $$
   该函数极小值位于狭长弯曲的抛物线山谷 $x_2 = x_1^2$ 底部，山谷两侧壁极陡而谷底斜率极缓，是检验多维优化算法（如 `fminsearch`、`fminunc`）能否克服病态曲率的基准问题。
2. **重要语法辨析：矩阵初点 `x0` 不是多起点搜索！**
   在调用 `fminsearch(fun, x0)` 或 `fminunc(fun, x0)` 时，决策变量 `x` 的维度完全由初值 `x0` 的 `size(x0)` 决定：若传入 $k \times 2$ 矩阵作为 `x0`，求解器会认为这是一个**含 $2k$ 个标量分量的矩阵型单次优化问题**，而**绝不是**从 $k$ 个二维初始点分别启动 $k$ 次独立寻优！若需执行**多起点搜索（Multi-start Search）**以规避多峰函数的局部极小陷阱，必须编写外层 `for` 循环遍历各个初始向量 $x_0^{(j)}$ 并比较最优值。

### 4.4 `fminsearch`、梯度优化 `fminunc` 与约束优化 `fmincon` 接口
- **`fminsearch(fun, x0)`（Nelder-Mead 单纯形直接搜索法）**：在 $d$ 维空间维护含 $d+1$ 个顶点的单纯形，通过反射（Reflection）、扩张（Expansion）、内外收缩（Contraction）与整体缩边（Shrink）更新顶点，无需计算梯度。
  - **严格收敛性边界注记**：`fminsearch` 属于**无导数局部直接搜索方法**，仅要求目标函数可返回实标量值；但在数学上它**不保证一般局部收敛性**——即使目标函数光滑可微，Nelder-Mead 单纯形也有可能在非驻点（$\nabla f \neq 0$）处因单纯形压扁退化而提前终止（参见 [MathWorks fminsearch 官方文档](https://www.mathworks.com/help/matlab/ref/fminsearch.html)）。对算出的停止点应进一步检查梯度或做微小扰动重启验证。
- **`fminunc(fun, x0, options)`（Optimization Toolbox 无约束光滑优化）**：默认采用 BFGS 拟牛顿法（Quasi-Newton）或信赖域牛顿法（Trust-Region），当通过 `SpecifyObjectiveGradient` 提供解析梯度 `[f, g] = fun(x)` 时，高维收敛速度与精度远超 `fminsearch`。
- **`fmincon`（有约束非线性规划标准接口）**：求解一般约束极小化问题：
  $$
  \min_{x} f(x) \quad \text{s.t.} \quad A x \le b, \; A_{\text{eq}} x = b_{\text{eq}}, \; lb \le x \le ub, \; c(x) \le 0, \; c_{\text{eq}}(x) = 0,
  $$
  调用格式为 `[x, fval] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options)`，其中非线性约束函数 `[c, ceq] = nonlcon(x)` 分别返回非线性不等式向量 `c(x) <= 0` 与非线性等式向量 `ceq(x) == 0`（若某类约束缺省则传入空矩阵 `[]`）。

## 5. 求根与最优化算法的数学边界对比

| 函数 / 算法 | 求解目标 | 关键数学前提 | 典型失效情形与局限 |
| :--- | :--- | :--- | :--- |
| `fzero(f, [a,b])` | 单变量零点 $f(x)=0$ | $f \in C[a,b]$ 且 $f(a)f(b) \le 0$ | 偶重根不改变符号；间断点（如 $\tan x$ 极点）两侧异号导致伪收敛 |
| `roots(p)` | 代数多项式全部复根 | 输入为有限次多项式降幂系数向量 | 高阶多项式（如 Wilkinson 多项式）根对系数微小扰动极度病态敏感 |
| `fminbnd(f, a, b)` | 一维有界极小化 $\min_{x \in [a,b]} f(x)$ | $f$ 在 $(a,b)$ 上连续 | 多峰函数仅收敛至某一个局部极小值；默认不优先检验边界端点 |
| `fminsearch(f, x0)` | 多维无约束极小化 $\min_{x \in \mathbb{R}^d} f(x)$ | 目标函数可计算标量实值 | 仅具启发式局部搜索性质，停止点不保证为局部极小值点；高维（$d \gtrsim 10$）单纯形易退化 |
| `fminunc` / `fmincon` | 光滑无约束 / 有约束非线性规划 | 目标与约束函数一阶/二阶连续可微 | 非凸问题仅收敛至满足 KKT 条件的局部驻点，全局寻优需配合多起点循环 |

## 6. 网格建模综合算例：元胞自动机与 Conway 生命游戏（第 36–41 页）

**Conway 生命游戏（Game of Life）**：在二维 $M \times N$ 网格上，每个元胞状态为存活 `1` 或死亡 `0`。每个元胞的下一代状态由其周围 **8-邻域（Moore 邻域）**内的存活邻居总数 $S_{ij} \in \{0, 1, \dots, 8\}$ 决定：
1. **存活保持**：当前存活（`X == 1`）且周围有 $2$ 或 $3$ 个存活邻居，下一代继续存活；
2. **繁衍诞生**：当前死亡（`X == 0`）且周围恰好有 $3$ 个存活邻居，下一代变为存活；
3. **孤独或拥挤死亡**：其余情形下一代全部为死亡 `0`。

**向量化邻居计数技巧**：利用矩阵圆周移位 `circshift`（周期边界）或二维卷积 `conv2(X, [1 1 1; 1 0 1; 1 1 1], 'same')`（零边界），无需双重循环即可一步算出全网格的邻居计数矩阵 $S$，并用单行逻辑表达式完成状态演化：

```matlab
function X = game_of_life_step(X)
% GAME_OF_LIFE_STEP 二维生命游戏单步向量化演化（零边界/卷积法）
    kernel = [1, 1, 1;
              1, 0, 1;
              1, 1, 1];
    neighbors = conv2(double(X), kernel, 'same');
    % 存活条件：(原存活且邻居为2或3) 或 (原死亡且邻居恰为3)，等价于 (neighbors==3) | (X & neighbors==2)
    X = (neighbors == 3) | (X & (neighbors == 2));
end
```

## 7. 综合示范函数源码

```matlab
function Out = w09_functions_optimization_demo()
% W09_FUNCTIONS_OPTIMIZATION_DEMO 演示函数句柄、非线性求根、Rosenbrock 优化与多起点搜索
%   返回包含各算例计算结果的结构体 Out

    % 1. 匿名函数与 fzero 区间求根
    f_root = @(x) x.^3 - 2*x - 5;
    root_val = fzero(f_root, [2, 3]);

    % 2. 多项式伴随矩阵求全部复根
    poly_coeff = [1, 0, -2, -5];
    roots_val = roots(poly_coeff);

    % 3. 一维有界区间局部极小化 (黄金分割 + 抛物线插值)
    f_opt1d = @(x) (x - 3).^2 + sin(x);
    [x_opt1d, f_opt1d_val] = fminbnd(f_opt1d, 0, 5);

    % 4. Rosenbrock 香蕉函数二维无约束极小化 (真实全局极小点 [1, 1], 极小值 0)
    rosenbrock = @(v) 100 * (v(2) - v(1)^2)^2 + (1 - v(1))^2;
    [x_rosen, f_rosen_val] = fminsearch(rosenbrock, [-1.2, 1.0]);

    Out.Root_fzero   = root_val;
    Out.Roots_poly   = roots_val;
    Out.Opt1D_x      = x_opt1d;
    Out.Opt1D_val    = f_opt1d_val;
    Out.Rosenbrock_x = x_rosen;
    Out.Rosenbrock_f = f_rosen_val;
end
```

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
