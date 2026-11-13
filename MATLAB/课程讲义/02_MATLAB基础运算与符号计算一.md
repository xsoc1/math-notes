---
title: "第二课：MATLAB 基础运算与符号计算（一）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/02_MATLAB基础运算与符号计算一.md"
matlab_source_sha256: bfdcab79014a5d188131a4809b2df9da206d93295b746967ebc694fcf8430fb8
---


# 第二课：MATLAB 基础运算与符号计算（一）

## 本讲目标

1. 掌握数值格式控制、矩阵构造、复矩阵操作与向量化表达式。
2. 理解双精度数值计算（`double`）与计算机代数符号计算（`sym`）的本质区别。
3. 掌握 `sym`、`syms`、`solve`、`limit`、`diff`、`taylor` 与 `int` 的标准用法。
4. 结合数学分析理论，检验符号计算结果的定义域、可导点与反常积分收敛条件。

## 1. 向量化表达与函数绘图

在 MATLAB 中，使用冒号运算符 `a:h:b`（或 `linspace(a, b, n)`）可生成等步长采样向量，配合逐元素运算符 `.*`、`./`、`.^` 可直接完成函数在离散网格上的向量化求值，无需编写显式循环：

```matlab
t = 0:pi/50:4*pi;
y = exp(-t/3) .* sin(3*t);
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('t'); ylabel('y(t)');
title('阻尼振荡曲线 y(t) = e^{-t/3} sin(3t)');
```

对于符号函数或函数句柄，也可直接调用自适应采样绘图函数 `fplot`：
```matlab
syms x
fplot(exp(-x/3)*sin(3*x), [0, 4*pi], 'LineWidth', 1.5);
grid on;
```

## 2. 数值对象与符号对象

Symbolic Math Toolbox 引入了符号数据类型 `sym`，用于执行无舍入误差的精确有理数运算、代数化简与微积分符号推导：
- `sym`：将数值常量、有理分数或字符串转换为精确符号对象。
- `syms`：快捷声明一个或多个符号变量及抽象符号函数（如 `syms x y f(x)`），并支持附加定义域假设（如 `real`、`positive`、`integer`、`rational`）。

### 2.1 符号常量的精确构造与转换标志

对比以下不同构造方式：
```matlab
s1 = sym(0.3);         % 先将 0.3 存为二进制 double 浮点数，再按默认有理启发式转换
s2 = sym(0.3, 'f');    % 忠实还原 0.3 在 IEEE 754 内存中的精确二进制分数值 5404319552844595/18014398509481984
s3 = sym('3/10');      % 从字符串直接构造精确有理数 3/10
s4 = sym(3) / sym(10); % 精确符号整数相除，结果为 3/10
```
当需要构造精确的超高精度十进制数或有理分数时，应使用符号整数运算 `sym(p)/sym(q)` 或精确字符串字面量，避免先经由 `double` 浮点数中转而损失有效数字。如需将符号结果转换为指定十进制有效数字的可变精度浮点数，可调用 `vpa(expr, digits)`。

### 2.2 符号圆周率常量与同名变量的区别

构造符号圆周率常量应使用 `sym(pi)`，而非字符串 `'pi'`：

```matlab
PiVariable = sym('pi'); % 仅创建名为 pi 的普通未赋值符号变量
PiConstant = sym(pi);   % 创建精确的符号圆周率常量 \pi

sin(PiVariable / 2)     % 保持未求值状态 sin(pi/2)
sin(PiConstant / 2)     % 精确化简为 1
```

## 3. 符号表达式、符号函数与自由变量

```matlab
syms x a real
expr = a * sin(x) + 1;
vars = symvar(expr);    % 返回按字母排序的所有符号变量向量 [a, x]
main_v = symvar(expr, 1); % 返回默认主变量 x（最接近字母 'x' 的变量）
f(x) = expr;            % 定义以 x 为形式自变量的符号函数 f(x)
val_pi6 = f(sym(pi)/6); % 直接代入求值，返回 a/2 + 1
```
在多变量符号表达式中，若不指定自变量，MATLAB 默认按靠近字母 `x` 的规则（`symvar(expr, 1)`）选取主变量。为消除多参数表达式的歧义，调用求导 `diff`、极限 `limit`、级数 `taylor` 或积分 `int` 时，**应始终显式传入目标自变量**。

## 4. 代数方程与超越方程求解

使用 `solve(eqn, var)` 求解代数或超越方程（组）：

```matlab
syms x a b c real
% 1. 单变量代数方程
sol1 = solve(x^2 - 4 == 0, x);                  % 返回 [-2; 2]

% 2. 含参二次方程求根公式
sol_quad = solve(a*x^2 + b*x + c == 0, x);      % 在 a ~= 0 下返回求根公式

% 3. 超越方程与数值近似求解
eqn_trans = exp(-x) == sin(x);
sol_num = vpasolve(eqn_trans, x, [0, 1]);       % 在区间 [0, 1] 内求高精度数值根 0.58853...
```
注意等式必须使用双等号 `==`（单等号 `=` 为赋值）。对于含偶次根式、分式或对数的方程，使用 `solve` 求解后应结合变量定义域假设（如 `assume(x > 0)`、`assumeAlso(x ~= 1)`）及回代检验 `simplify(subs(eqn, x, sol))` 排除增根；当需要完整输出周期解或参数成立条件时，可附加选项 `'ReturnConditions', true`。

## 5. 极限计算与无穷级数

调用 `limit(f, x, x0)` 计算当 $x \to x_0$ 时的双侧极限，附加 `'left'` 或 `'right'` 计算单侧极限：

```matlab
syms x n
assume(n, {'positive', 'integer'});

L1 = limit((1 + 1/n)^n, n, inf);            % 重要极限：返回 exp(1)
L2 = limit(sin(x)/x, x, 0);                 % 重要极限：返回 1
L3 = limit(exp(-1/x), x, 0, 'right');       % 右极限 x -> 0+：返回 0
L4 = limit(exp(-1/x), x, 0, 'left');        % 左极限 x -> 0-：返回 Inf
L5 = limit(exp(-1/x), x, 0);                % 左右极限不等，双侧极限返回 NaN
```
当左右极限不相等（如 $e^{-1/x}$ 在 $x=0$ 处）或函数无穷振荡（如 $\lim_{x\to\infty}\sin x$，MATLAB 返回 `NaN`）时，符号输出给出了直观提示，而在数学分析写作中则需结合夹逼准则、单调有界定理、Heine 归结原则或 Stolz 定理给出严格证明。

## 6. 符号微分与不可导点分析

`diff(f, x, k)` 计算符号表达式 $f$ 关于自变量 $x$ 的 $k$ 阶导数（一阶导数可简写为 `diff(f, x)`）。

```matlab
syms x
f = x^3 * log(x);
df1 = simplify(diff(f, x));    % 一阶导数：x^2*(3*log(x) + 1)
df2 = simplify(diff(f, x, 2)); % 二阶导数：x*(6*log(x) + 5)
```

### 典型案例：绝对值复合函数的不可导点辨析

考察绝对值复合函数：

$$
y(t) = |\sin t| = \sqrt{\sin^2 t}.
$$

- 当 $t \neq k\pi \, (k \in \mathbb{Z})$ 时，$\sin t \neq 0$，函数在局部光滑，由链式法则得：

$$
y'(t) = \cos t \cdot \operatorname{sgn}(\sin t) = \frac{\sin t \cdot \cos t}{|\sin t|}.
$$

- 而在零点 $t = k\pi \, (k \in \mathbb{Z})$ 处，按导数定义分别计算左导数与右导数：

$$
\begin{aligned}
y'_-(k\pi) &= \lim_{h \to 0^-} \frac{|\sin(k\pi + h)| - 0}{h} = \lim_{h \to 0^-} \frac{|\sin h|}{h} = -1,\\
y'_+(k\pi) &= \lim_{h \to 0^+} \frac{|\sin(k\pi + h)| - 0}{h} = \lim_{h \to 0^+} \frac{\sin h}{h} = 1.
\end{aligned}
$$

由于左导数 $-1$ 与右导数 $+1$ 不相等，故 $y(t) = |\sin t|$ 在所有 $t = k\pi \, (k \in \mathbb{Z})$ 处**不可导**（图像呈折角尖点）。在 MATLAB 中，执行 `diff(abs(sin(t)), t)` 会返回形式导数 `cos(t)*sign(sin(t))`；若盲目将 `t = 0` 代入该表达式，会因软件约定 `sign(0) = 0` 得出错误结果 `0`。因此在分段函数与绝对值函数求导中，必须先确定光滑开区间，再对分界点单独用单侧导数定义检验。

## 7. Taylor 幂级数展开

调用 `taylor(f, x, x0, 'Order', m)` 计算函数 $f(x)$ 在展开中心 $x = x_0$（默认 $x_0 = 0$）处的 Taylor 多项式：

```matlab
syms x
T8 = taylor(sin(x)/x, x, 0, 'Order', 8);
% 返回：x^6/5040 - x^4/120 + x^2/6 + 1
```
需要特别注意参数 `'Order', m` 的数学含义：它表示截断余项为 $O\bigl((x - x_0)^m\bigr)$，即返回的多项式最高包含到 $(x - x_0)^{m-1}$ 次项（例如 `'Order', 8` 保留至 $x^7$ 项，由于 $\frac{\sin x}{x}$ 为偶函数，$x^7$ 项系数为 $0$，故显示至 $x^6$ 项）。使用 Taylor 展开近似函数时，必须指明展开中心 $x_0$、截断阶数以及幂级数的收敛半径 $R$。

## 8. 符号积分与广义积分

调用 `int(f, x)` 计算不定积分 $\int f(x)\,\mathrm{d}x$（输出结果省略积分常数 $+C$），调用 `int(f, x, a, b)` 计算定积分或反常积分 $\int_a^b f(x)\,\mathrm{d}x$：

```matlab
syms x
F_indef = int(x * exp(-x), x);        % 不定积分：-exp(-x)*(x + 1)
I_def   = int(x * exp(-x), x, 0, 1);  % 定积分：1 - 2*exp(-1)
I_dir   = int(sin(x)/x, x, 0, inf);   % Dirichlet 反常积分：pi/2
```

**Dirichlet 积分的数学分析要点**：
对于反常积分 $\int_0^\infty \frac{\sin x}{x} \, \mathrm{d}x = \frac{\pi}{2}$：
1. 在左端点 $x = 0$ 处，由于 $\lim_{x\to 0^+}\frac{\sin x}{x} = 1$，$x = 0$ 是有界可去奇点，非瑕点；
2. 在无穷区间 $[1, +\infty)$ 上，$\int_1^A \sin x\,\mathrm{d}x = \cos 1 - \cos A$ 一致有界，且 $\frac{1}{x}$ 单调递减趋于 $0$，由 **Dirichlet 判别法**知该无穷积分收敛；
3. 但其绝对值积分满足 $\int_{k\pi}^{(k+1)\pi} \frac{|\sin x|}{x}\,\mathrm{d}x \ge \frac{2}{(k+1)\pi}$，由于调和级数 $\sum_{k=1}^\infty \frac{1}{k+1} = +\infty$ 发散，故 $\int_0^\infty \frac{|\sin x|}{x}\,\mathrm{d}x = +\infty$。因此 Dirichlet 积分是**条件收敛而非绝对收敛**的（即 $\frac{\sin x}{x}$ 在 $[0, +\infty)$ 上 Riemann 反常可积，但不属于 Lebesgue 可积空间 $L^1(0, +\infty)$）。

## 9. 延伸阅读与配套练习

- 运行 [`lecture02_numeric_symbolic.m`](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/lecture02_numeric_symbolic.m) 验证数值与符号对象的转换规律。
- 第二周课后作业（不可导点证明、阶乘极限夹逼证明与 Dirichlet 积分含参积分法严格证明）详见：[[MATLAB/课程讲义/补充_第二周与第四周作业参考解读|第二周与第四周作业参考解读]]。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
