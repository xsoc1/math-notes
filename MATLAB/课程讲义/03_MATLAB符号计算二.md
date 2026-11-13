---
title: "第三课：MATLAB 符号计算（二）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/03_MATLAB符号计算二.md"
matlab_source_sha256: ae26be3e99438f345ea89a056a5e0611c643ab0bfae6133e3dee796775796de9
---


# 第三课：MATLAB 符号计算（二）

资料来源：[[MATLAB/课程资料/原始课件/第三课 MATLAB符号计算（二） .pdf|第三课 MATLAB符号计算（二）.pdf]]。本讲全面展开符号代数变形、高阶极限与级数求和、有理分式 Taylor 展开、椭圆积分的无初等原函数过渡、参数曲线弧长积分、常微分方程符号求解（含二阶系统降阶、Clairaut 方程奇解与 Picard 逐次逼近）以及 Fourier / Laplace / Z 三大积分变换。

## 1. 课程核心脉络

| 主题 | 核心操作与函数 | 关键数学与计算问题 |
| :--- | :--- | :--- |
| 符号矩阵与数组 | 构造符号数组，使用 `size`、`class`、`isa`、`whos` 检视对象类型 | 符号矩阵乘法 `*` 与逐元素乘法 `.*` 的代数与维度约束 |
| 代数变形与化简 | `simplify`、`expand`、`factor`、`collect`、`numden`、`pretty` | 恒等变形成立的变量定义域与主值分支假设 |
| 符号替换与精度评估 | `subs`、`double`、`vpa`、`digits` | 精确符号代换、任意精度浮点（VPA）与双精度转换的区别 |
| 极限、Taylor 与级数求和 | `limit`、`taylor`、`symsum`、含参方程组 `solve` | 高阶无穷小相消极限、有理函数展开收敛半径与级数闭式和 |
| 积分与非初等原函数过渡 | `int`、椭圆积分 $\int\sqrt{1+\cos^2 x}\,\mathrm{d}x$ | Liouville 定理无初等原函数情形下向 Taylor 积分与数值积分的过渡 |
| 参数曲线与弧长 | 圆弧、阿基米德螺线与三维螺线弧长积分及 `fplot` 绘图 | 参数曲线弧长微元 $\mathrm{d}s = \sqrt{\dot{x}^2+\dot{y}^2}\,\mathrm{d}t$ 的推导与符号积分 |
| 常微分方程求解 | `dsolve`、二阶 IVP 等价系统、Clairaut 方程与 Picard 迭代 | 直线族通解与包络奇解回代、Lipschitz 适定条件、残差与真误差区分 |
| 连续与离散积分变换 | `fourier`/`ifourier`、`laplace`/`ilaplace`、`ztrans`/`iztrans` | 三大变换的函数类适用前提、收敛域 (ROC)、零频核验与广义函数表示 |

## 2. 代数化简、高阶极限、Taylor 展开与级数求和算例

### 2.1 符号化简中的解析约束与代数变形命令

| 命令 | 功能说明 | 典型应用场景 |
| :--- | :--- | :--- |
| `expand(E)` | 将乘积、幂次及三角/指数恒等式展开 | 多项式展开、三角倍角公式展开 |
| `factor(E)` | 对多项式或整数进行因式/质因数分解 | 分母因式分解定位极点、大整数素因子分解 |
| `collect(E, x)` | 按指定自变量 $x$ 的幂次合并同类项 | 整理含参多项式关于主变量 $x$ 的系数 |
| `simplify(E)` | 综合应用代数、三角、对数与指数规则进行化简 | 复杂导数或积分结果的紧凑化简 |
| `subs(E, old, new)` | 将符号表达式中的子表达式或变量替换为新值 | 参数赋值、复合函数代换 |
| `vpa(E, d)` | 按 $d$ 位十进制有效数字计算可变精度浮点值 | 超越常数与无理数的高精度数值评估 |

调用 `simplify(E, 'IgnoreAnalyticConstraints', true)` 会忽略复平面上的多值函数分支切割条件（例如将 $\sqrt{x^2}$ 直接化为 $x$，或将 $\ln(ab)$ 化为 $\ln a + \ln b$）。在严格数学推导中，推荐通过 `syms x positive` 或 `assume(x >= 0)` 显式附加定义域假设，而非盲目关闭解析约束。

### 2.2 典型算例：指数-幂指函数高阶极限与符号验证

考察高阶相消极限算例：

$$
L_{\alpha} = \lim_{x \to 0^+} \frac{1}{x^\alpha} \left[ \left(1 + x + \frac{x^2}{2}\right)^{1/x} - e \right] \quad (\alpha = 2, 3), \qquad
\widetilde{L}_3 = \lim_{x \to 0^+} \frac{1}{x^3} \left[ \left(1 + x + \frac{x^2}{2} + \frac{x^3}{6}\right)^{1/x} - e \right].
$$

**解析渐近展开与 MATLAB 对照**：
令 $u = x + \frac{x^2}{2}$，当 $x \to 0^+$ 时，将 $\ln(1 + u) = u - \frac{u^2}{2} + \frac{u^3}{3} - \frac{u^4}{4} + O(x^5)$ 展开至 $x^4$ 阶：

$$
\begin{aligned}
\ln\!\left(1 + x + \frac{x^2}{2}\right)
&= \left(x + \frac{x^2}{2}\right) - \frac{1}{2}\left(x^2 + x^3 + \frac{x^4}{4}\right) + \frac{1}{3}\left(x^3 + \frac{3}{2}x^4\right) - \frac{1}{4}x^4 + O(x^5) \\
&= x - \frac{1}{6}x^3 + \frac{1}{8}x^4 + O(x^5).
\end{aligned}
$$

因此幂指函数具有渐近展开：

$$
\left(1 + x + \frac{x^2}{2}\right)^{1/x} = \exp\!\left(1 - \frac{1}{6}x^2 + \frac{1}{8}x^3 + O(x^4)\right) = e\left(1 - \frac{1}{6}x^2 + \frac{1}{8}x^3 + O(x^4)\right).
$$

由此立即可见：
- 由于括号内缺失了 $e^x$ 的三次项 $\frac{x^3}{6}$，$(1+x+x^2/2)^{1/x} - e$ 的首项主部是二阶无穷小 $-\frac{e}{6}x^2$！因此当分母取 $x^2$ 时，$\lim_{x\to 0^+}\frac{(1+x+x^2/2)^{1/x}-e}{x^2} = -\frac{e}{6}$；而当分母取 $x^3$ 时，主部 $\frac{-e x^2/6}{x^3} = -\frac{e}{6x} \to -\infty$（右极限发散为 $-\infty$）。
- 若将三阶项补齐，考察 $\lim_{x\to 0^+}\frac{1}{x^3}\bigl[(1+x+\frac{x^2}{2}+\frac{x^3}{6})^{1/x} - e\bigr]$，则 $\frac{1}{x}\ln(1+x+\frac{x^2}{2}+\frac{x^3}{6}) = 1 - \frac{1}{24}x^3 + O(x^4)$，此时除以 $x^3$ 的极限精确收敛于 $-\frac{e}{24}$。

在双精度浮点下，当 $x = 10^{-6}$ 时直接计算 `((1+x+x^2/2)^(1/x) - exp(1))/x^3` 会因大数相减的灾难性有效数字抵消（Catastrophic Cancellation）彻底失真；而 `limit` 与 `taylor` 在符号域内可精确给出渐近主部：

```matlab
syms x positive
expr = (1 + x + x^2/2)^(1/x) - exp(1);

% 1. Taylor 展开直接观察无穷小首项阶数
T_expr = taylor(expr, x, 0, 'Order', 4) % 返回 (exp(1)*x^3)/8 - (exp(1)*x^2)/6

% 2. 符号极限计算
L_div_x2 = limit(expr / x^2, x, 0, 'right') % 返回 -exp(1)/6
L_div_x3 = limit(expr / x^3, x, 0, 'right') % 返回 -Inf

% 3. 含三阶泰勒项的幂指极限
expr_3 = (1 + x + x^2/2 + x^3/6)^(1/x) - exp(1);
L3_exact = limit(expr_3 / x^3, x, 0, 'right') % 返回 -exp(1)/24
```

### 2.3 分式复合函数 $\frac{\sin x}{x^2+4x+3}$ 的 Taylor 展开与收敛半径

求函数 $f(x) = \frac{\sin x}{x^2 + 4x + 3}$ 在 $x = 0$ 处的麦克劳林（Maclaurin）级数展开：

将有理分式拆为部分分式 $\frac{1}{x^2+4x+3} = \frac{1}{2}\left(\frac{1}{1+x} - \frac{1}{3(1+x/3)}\right) = \frac{1}{3} - \frac{4}{9}x + \frac{13}{27}x^2 - \frac{40}{81}x^3 + \frac{121}{243}x^4 - \cdots$，与 $\sin x = x - \frac{1}{6}x^3 + \frac{1}{120}x^5 - \cdots$ 相乘可得前五阶精确麦克劳林级数：

$$
\frac{\sin x}{x^2 + 4x + 3} = \frac{1}{3}x - \frac{4}{9}x^2 + \frac{23}{54}x^3 - \frac{34}{81}x^4 + \frac{4087}{9720}x^5 + O(x^6).
$$

```matlab
syms x
f_rat = sin(x) / (x^2 + 4*x + 3);
T_rat = taylor(f_rat, x, 0, 'Order', 6)
% 返回：(4087*x^5)/9720 - (34*x^4)/81 + (23*x^3)/54 - (4*x^2)/9 + x/3
```

**收敛半径分析**：分母多项式 $x^2 + 4x + 3 = (x + 1)(x + 3)$ 的两个奇点（一阶极点）位于 $x_1 = -1$ 与 $x_2 = -3$，分子 $\sin x$ 为整函数且在 $x = -1, -3$ 处非零。由幂级数收敛半径等于展开中心 $x_0 = 0$ 到最近奇点的距离，知该 Taylor 展开的收敛半径为 $R = \min(|-1 - 0|, |-3 - 0|) = 1$（收敛开区间为 $(-1, 1)$）。

### 2.4 无穷级数求和（两道典型练习）与含参方程组求解

**级数求和练习**：
1. **有理分式裂项级数**：$S_1 = \sum_{n=1}^\infty \frac{1}{n(n+2)} = \frac{1}{2}\sum_{n=1}^\infty \left(\frac{1}{n} - \frac{1}{n+2}\right) = \frac{1}{2}\left(1 + \frac{1}{2}\right) = \frac{3}{4}$；
2. **指数型幂级数 / 平方倒数级数**：$S_2 = \sum_{n=1}^\infty \frac{n^2}{2^n} = 6$（以及 Euler 级数 $\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}$）。

```matlab
syms n k a b x y
% 练习 1：裂项级数与平方倒数级数求和
S1 = symsum(1 / (n * (n + 2)), n, 1, inf) % 返回 3/4
S2 = symsum(n^2 / 2^n, n, 1, inf)         % 返回 6
S_euler = symsum(1 / n^2, n, 1, inf)      % 返回 pi^2/6

% 练习 2：含参线性方程组 a*x + y = 1, x + a*y = b 求解
eqns = [a*x + y == 1, x + a*y == b];
sol = solve(eqns, [x, y]);
x_sol = simplify(sol.x) % 返回 (a - b)/(a^2 - 1) = (b - a)/(1 - a^2) （当 a ~= 1 且 a ~= -1）
y_sol = simplify(sol.y) % 返回 (a*b - 1)/(a^2 - 1) = (1 - a*b)/(1 - a^2)
% 注：当 a = 1 时若 b = 1 有无穷多解 y = 1 - x，若 b ~= 1 无解；当 a = -1 时若 b = -1 有无穷多解 y = 1 + x，若 b ~= -1 无解
```

### 2.5 从符号积分的理论边界引出数值积分（椭圆积分算例）

在符号积分中，诸如 $\int x^2 e^{-x}\,\mathrm{d}x$、$\int \frac{1}{x^2+4x+3}\,\mathrm{d}x = \frac{1}{2}\ln\left|\frac{x+1}{x+3}\right| + C$ 均可由 `int` 直接给出初等原函数。然而，考察计算椭圆周长时自然出现的**第二类椭圆积分**：

$$
I(x) = \int \sqrt{1 + \cos^2 x} \, \mathrm{d}x, \qquad I_{[0, \pi/2]} = \int_0^{\pi/2} \sqrt{1 + \cos^2 x} \, \mathrm{d}x.
$$

根据微分域上的 **Liouville 定理**，被积函数 $\sqrt{1 + \cos^2 x}$ 的原函数**不是初等函数**（无法表示为有限次有理函数、根式、指数、对数及三角函数的复合）。当在 MATLAB 中调用 `int(sqrt(1 + cos(x)^2), x)` 时，符号引擎无法将其化为初等函数，只能原样返回未求值的积分表达式 `int((cos(x)^2 + 1)^(1/2), x)`（或用第二类完全/不完全椭圆积分特殊函数 `ellipticE` 表示，如定积分返回 `sqrt(2)*ellipticE(1/2)`）。

**教学过渡策略**：当遇到无初等原函数的积分时，科学计算通常采取两条替代路径：
1. **Taylor 级数展开逐项积分**：将 $\sqrt{1+\cos^2 x}$ 在展开点附近展为幂级数 `taylor(sqrt(1+cos(x)^2), x, 0, 'Order', 8)` 后再调用 `int` 求多项式近似积分；
2. **高精度数值积分**：将该定积分转交 `vpa(int(sqrt(1+cos(x)^2), x, 0, sym(pi)/2), 20)` 或第六课的自适应数值求积器 `integral(@(x) sqrt(1 + cos(x).^2), 0, pi/2)`，直接求得高精度数值解 $\approx 1.910098894513856$。

```matlab
syms x
f_ellip = sqrt(1 + cos(x)^2);

% 1. 直接符号不定积分：无初等原函数，保持未求值或特殊函数形式
I_indef = int(f_ellip, x)

% 2. 方法一：6 阶 Taylor 多项式展开后逐项积分（适用于小区间 [0, 0.5]）
T_ellip = taylor(f_ellip, x, 0, 'Order', 7);
I_taylor = double(int(T_ellip, x, 0, 0.5));

% 3. 方法二：自适应数值积分（第六课核心工具）
I_num = integral(@(t) sqrt(1 + cos(t).^2), 0, pi/2); % 1.910098894513856
```

## 3. 参数曲线弧长与常微分方程符号求解

### 3.1 参数曲线弧长微元推导与螺线/圆弧长度计算

设平面或空间光滑参数曲线 $\mathbf{r}(t) = \bigl(x(t), y(t)\bigr) \, (t \in [\alpha, \beta])$（空间曲线则附加 $z(t)$），在小参数增量 $\Delta t$ 上用弦长近似弧长并取极限，导出**弧长微元公式**：

$$
\mathrm{d}s = \sqrt{\bigl(x'(t)\bigr)^2 + \bigl(y'(t)\bigr)^2}\,\mathrm{d}t \quad \left(\text{极坐标 } r = r(\theta) \text{ 下为 } \mathrm{d}s = \sqrt{r(\theta)^2 + r'(\theta)^2}\,\mathrm{d}\theta\right).
$$

1. **半径为 $R$ 的圆弧**：$x(t) = R\cos t, \, y(t) = R\sin t \, (t \in [0, \theta_0])$，则 $\sqrt{\dot{x}^2 + \dot{y}^2} = R$，弧长 $L = \int_0^{\theta_0} R\,\mathrm{d}t = R\theta_0$。
2. **阿基米德螺线（Archimedean Spiral）**：$x(t) = a t\cos t, \, y(t) = a t\sin t \, (a > 0, \, t \in [0, 2\pi])$，计算导数平方和得 $\dot{x}^2 + \dot{y}^2 = a^2(1 + t^2)$，故弧长为：

$$
L = a \int_0^{2\pi} \sqrt{1 + t^2}\,\mathrm{d}t = \frac{a}{2}\left[t\sqrt{1 + t^2} + \operatorname{arsinh}(t)\right]_0^{2\pi} = \frac{a}{2}\left(2\pi\sqrt{1+4\pi^2} + \ln\bigl(2\pi + \sqrt{1+4\pi^2}\bigr)\right).
$$

```matlab
syms t a positive
x_sp = a * t * cos(t);
y_sp = a * t * sin(t);
ds   = simplify(sqrt(diff(x_sp, t)^2 + diff(y_sp, t)^2)); % a * sqrt(t^2 + 1)
L_sp = simplify(int(ds, t, 0, 2*pi))

% 绘制 a = 1 时的阿基米德螺线
figure;
fplot(subs(x_sp, a, 1), subs(y_sp, a, 1), [0, 4*pi], 'LineWidth', 1.5);
axis equal; grid on; title('阿基米德螺线 r = \theta');
```

### 3.2 二阶初值问题与等价一阶系统、Clairaut 方程与奇解

1. **二阶常微分方程与等价一阶系统（含简谐振子初值算例 $y'' + y = 0$）**：
   二阶初值问题 $y'' + p(x)y' + q(x)y = g(x), \, y(x_0) = y_0, \, y'(x_0) = v_0$ 通过引入状态变量 $u_1 = y, \, u_2 = y'$，等价于一阶耦合系统：
   $$
   \begin{cases} u_1' = u_2, & u_1(x_0) = y_0, \\ u_2' = -q(x)u_1 - p(x)u_2 + g(x), & u_2(x_0) = v_0. \end{cases}
   $$
   例如原课典型算例 $y'' + y = 0, \, y(0) = 1, \, y'(0) = 0$，等价于一阶线性系统 $u_1' = u_2, \, u_2' = -u_1, \, [u_1(0); u_2(0)] = [1; 0]$，其唯一精确解为 $y^*(x) = \cos x$（在 `dsolve` 中求出后，可通过 `simplify(diff(ySol, x, 2) + ySol)` 回代验证微分方程残差恒等于 $0$）。

2. **Clairaut（克莱罗）方程的直线族通解与包络奇解**：
   考察非线性一阶方程（Clairaut 方程）：
   $$
   y = x y' - (y')^2.
   $$
   两边对 $x$ 求导得 $y' = y' + x y'' - 2y' y'' \implies y''(x - 2y') = 0$，产生两个分支：
   - **通解（切线直线族）**：由 $y'' = 0$ 得 $y' = C$，代回原方程得单参数直线族通解 $y = C x - C^2$；
   - **奇解（包络抛物线）**：由 $x - 2y' = 0$ 得 $y' = x/2$，代回原方程消去参数得抛物线包络奇解 $y = \frac{x^2}{4}$（该奇解处处与直线族相切，不能由通解赋予任何常数 $C$ 得到）。
   使用 `dsolve` 求解非线性方程时，务必将所得解回代原方程计算**方程残差** $\text{res} = \text{simplify}(\text{LHS} - \text{RHS})$ 核验恒等于 $0$。

```matlab
syms x y(x)
eqn_clairaut = (y == x * diff(y, x) - diff(y, x)^2);
sol_all = dsolve(eqn_clairaut) % 同时返回直线族通解 C1*x - C1^2 与包络奇解 x^2/4

% 回代检验奇解 y_sing = x^2/4 的方程残差
y_sing = x^2 / 4;
residual = simplify(subs(y_sing - (x*diff(y_sing,x) - diff(y_sing,x)^2))) % 返回 0
```

### 3.3 常微分方程初值问题与 Picard 逐次逼近法

考虑一阶常微分方程初值问题 (IVP)：

$$
y' = f(x, y), \quad y(x_0) = y_0.
$$

**Picard-Lindelöf 适定条件与压缩映射前提**：当 $f(x, y)$ 在包含 $(x_0, y_0)$ 的矩形闭邻域 $R = [x_0-a, x_0+a]\times[y_0-b, y_0+b]$ 上连续（设 $|f(x,y)| \le M$），且关于第二变量 $y$ 满足 **Lipschitz 条件** $|f(x, y_1) - f(x, y_2)| \le L|y_1 - y_2|$ 时，积分算子 $(Ty)(x) = y_0 + \int_{x_0}^x f\bigl(t, y(t)\bigr)\,\mathrm{d}t$ 将闭球映入自身需满足 $h \le \min(a, b/M)$；若在一致上确界范数 $\|\cdot\|_\infty$ 下直接应用 Banach 压缩映射定理，还必须附加**步长压缩条件 $Lh < 1$**（即取 $h = \min(a, \, b/M, \, q/L)$，其中 $0 < q < 1$，此时 $\|Ty_1 - Ty_2\|_\infty \le Lh\|y_1 - y_2\|_\infty = q\|y_1 - y_2\|_\infty$；注：若想在整个 $h = \min(a, b/M)$ 上不缩小步长直接证明收敛，则需改用指数加权 Bielecki 范数 $\|y\|_B = \max_{|x-x_0|\le h} e^{-\gamma|x-x_0|}|y(x)|\ (\gamma > L)$ 或利用第 $k$ 次迭代算子满足 $\|T^k y_1 - T^k y_2\|_\infty \le \frac{(Lh)^k}{k!}\|y_1 - y_2\|_\infty$ 的幂压缩性质）。在此条件下，Picard 逐次逼近序列

$$
y_0(x) = y_0, \quad y_{k+1}(x) = y_0 + \int_{x_0}^x f\bigl(t, y_k(t)\bigr) \, \mathrm{d}t
$$

一致收敛于唯一精确解 $y^*(x)$。
- **真误差（True Error）与残差（Residual）的区别**：第 $k$ 步近似解的**真误差**定义为 $e_k(x) = y_k(x) - y^*(x)$（需要已知真解 $y^*$），而**微分方程残差**定义为 $r_k(x) = y_k'(x) - f\bigl(x, y_k(x)\bigr) = f\bigl(x, y_{k-1}(x)\bigr) - f\bigl(x, y_k(x)\bigr)$（无需知道真解即可直接代回方程检验）。

1. **原课基准算例一（一阶初值问题 $y' = y, \, y(0) = 1$ 的有限步 Picard 残差与真误差对比）**：
   对 $y' = y, \, y(0) = 1$（精确解 $y^*(x) = e^x$），第 $m$ 步 Picard 迭代多项式恰为指数函数的 $m$ 阶 Taylor 多项式 $T_m(x) = \sum_{k=0}^m \frac{x^k}{k!}$（例如第 4 步为 $T_4(x) = 1 + x + \frac{x^2}{2} + \frac{x^3}{6} + \frac{x^4}{24}$）。由于 $T_m'(x) = T_{m-1}(x)$，其代入原方程的**微分方程残差**与**真误差**分别为：
   $$
   r_m(x) = T_m'(x) - T_m(x) = -\frac{x^m}{m!} \quad (\text{如 } r_4(x) = -\frac{x^4}{24}), \qquad
   e_m(x) = T_m(x) - e^x = -\sum_{k=m+1}^\infty \frac{x^k}{k!}.
   $$
2. **补充算例二（非齐次线性初值问题 $y' = x + y, \, y(0) = 1$）**：
   前几步 Picard 迭代多项式依次为 $P_0(x) = 1$，$P_1(x) = 1 + x + \frac{x^2}{2}$，$P_2(x) = 1 + x + x^2 + \frac{x^3}{6}$，$P_3(x) = 1 + x + x^2 + \frac{x^3}{3} + \frac{x^4}{24}$。注意因 $P_3(x) = 1 + \int_0^x (t + P_2(t))\,\mathrm{d}t$ 求导得 **$P_3'(x) = x + P_2(x)$**，其代入方程 $y' - (x + y) = 0$ 的**残差**为：
   $$
   r_3(x) = P_3'(x) - \bigl(x + P_3(x)\bigr) = P_2(x) - P_3(x) = -\frac{x^3}{6} - \frac{x^4}{24}
   $$
   （切勿将 $y' = y$ 中 $T_4$ 的残差 $-\frac{x^4}{24}$ 与此处 $y' = x+y$ 中 $P_3$ 的残差 $-\frac{x^3}{6} - \frac{x^4}{24}$ 混用！），而相对精确解 $y^*(x) = 2e^x - x - 1$ 的真误差为 $P_3(x) - (2e^x - x - 1)$。
3. **原课基准算例三（二阶初值问题 $y'' + y = 0, \, y(0) = 1, \, y'(0) = 0$ 的步数与算子对应）**：
   对于四阶余弦截断多项式 $P_4(x) = 1 - \frac{x^2}{2} + \frac{x^4}{24}$（其二阶方程残差为 $P_4''(x) + P_4(x) = \frac{x^4}{24} \neq 0$，真误差为 $P_4(x) - \cos x$），说明其对应的 Picard 迭代步数时需指明积分算子：若按一阶耦合系统 $u_1' = u_2, \, u_2' = -u_1$ 同步迭代（每步次数升 $1$ 阶），$P_4(x)$ 是**第 $4$ 步**迭代的第一个分量；若直接按二阶等价 Volterra 积分算子 $(Ty)(x) = 1 - \int_0^x (x - t)y(t)\,\mathrm{d}t$ 迭代（每步次数升 $2$ 阶），则 $P_4(x)$ 是**第 $2$ 步**迭代结果。

```matlab
syms x t y(x)

% 1. 原课算例 y' = y, y(0) = 1: 第 4 步 Picard 多项式 T4 的残差 (-x^4/24) 与真误差
T4 = 1 + x + x^2/2 + x^3/6 + x^4/24;
res_T4 = simplify(diff(T4, x) - T4)        % 返回 -x^4/24
err_T4 = simplify(T4 - exp(x))             % 真误差: T4(x) - exp(x)

% 2. 补充算例 y' = x + y, y(0) = 1: 第 3 步 Picard 多项式 P3 的残差 (-x^3/6 - x^4/24)
ySol(x) = dsolve(diff(y, x) == x + y, y(0) == 1);
P0 = sym(1);
P1 = 1 + int(t + P0, t, 0, x);
P2 = 1 + int(t + subs(P1, x, t), t, 0, x);
P3 = 1 + int(t + subs(P2, x, t), t, 0, x);
res_P3 = simplify(diff(P3, x) - (x + P3))  % 返回 -x^3/6 - x^4/24 (等于 P2 - P3)
err_P3 = simplify(P3 - ySol(x))            % 真误差: P3(x) - (2*exp(x) - x - 1)

% 3. 原课二阶算例 y'' + y = 0, y(0) = 1, y'(0) = 0: 符号解与 P4 残差 (x^4/24)
y2_sol = dsolve(diff(y, x, 2) + y == 0, y(0) == 1, subs(diff(y,x),x,0) == 0) % cos(x)
P4_cos = 1 - x^2/2 + x^4/24;               % 一阶系统第 4 步 / 二阶 Volterra 算子第 2 步
res_cos = simplify(diff(P4_cos, x, 2) + P4_cos) % 返回 x^4/24
```

## 4. 三大积分变换的定义约定、适用函数类与零频核验

MATLAB 符号工具箱中三种常用积分变换的标准定义、适用函数类与收敛域如下：

1. **Fourier 变换**（默认采用角频率 $\omega$ 约定，经典分析中要求 $f \in L^1(\mathbb{R})$ 绝对可积或属于平方可积空间 $L^2(\mathbb{R})$，在符号工具箱中延拓至缓增广义函数空间 $\mathcal{S}'(\mathbb{R})$）：

$$
F(\omega) = \mathcal{F}[f(t)] = \int_{-\infty}^{\infty} f(t) e^{-\mathrm{i}\omega t} \, \mathrm{d}t, \qquad f(t) = \mathcal{F}^{-1}[F(\omega)] = \frac{1}{2\pi} \int_{-\infty}^{\infty} F(\omega) e^{\mathrm{i}\omega t} \, \mathrm{d}\omega.
$$

   - **零频核验准则**：对任意绝对可积函数 $f \in L^1(\mathbb{R})$，令角频率 $\omega = 0$，必有零频分量等于全轴定积分：
     $$
     F(0) = \int_{-\infty}^{\infty} f(t)\,\mathrm{d}t.
     $$
     这提供了快速检验 Fourier 变换常数因子是否遗漏的实用方法（如高斯函数 $f(t) = e^{-t^2}$ 满足 $F(\omega) = \sqrt{\pi}e^{-\omega^2/4}$，代入 $\omega = 0$ 得 $F(0) = \sqrt{\pi} = \int_{-\infty}^\infty e^{-t^2}\,\mathrm{d}t$）。

2. **单边 Laplace 变换**（要求 $t \ge 0$ 上分段连续且满足指数阶增长 $|f(t)| \le M e^{\sigma_0 t}$，收敛域 ROC 为半平面 $\operatorname{Re}(s) > \sigma_0$）：

$$
F(s) = \mathcal{L}[f(t)] = \int_{0^-}^{\infty} f(t) e^{-st} \, \mathrm{d}t.
$$

3. **单边 Z 变换**（针对因果离散序列 $x[n] \, (n \ge 0)$，收敛域为圆外区域 $|z| > R$）：

$$
X(z) = \mathcal{Z}[x[n]] = \sum_{n=0}^{\infty} x[n] z^{-n}.
$$

其中 `heaviside(t)`（单位阶跃函数 $H(t)$，默认 `heaviside(0) = 1/2`）与 `dirac(t)`（Dirac $\delta$ 广义函数，满足筛选性质 $\int_{-\infty}^\infty \varphi(t)\delta(t-t_0)\,\mathrm{d}t = \varphi(t_0)$ 及 $\mathcal{F}[\delta(t)] = 1$、$\mathcal{F}[1] = 2\pi\delta(\omega)$）在广义函数（Schwartz 分布）意义下参与微积分与积分变换运算。不同文献的 Fourier 变换常数因子约定对比详见 [[MATLAB/课程讲义/补充_第三周傅里叶参考资料|第三周傅里叶参考资料]]。

```matlab
syms t w s n z real
f = exp(-t^2);

% 1. Fourier 正逆变换与零频核验
F_w   = simplify(fourier(f, t, w));       % 输出 sqrt(pi)*exp(-w^2/4)
F_0   = subs(F_w, w, 0);                  % 零频值 sqrt(pi)，等于 int(exp(-t^2), -inf, inf)
f_rec = simplify(ifourier(F_w, w, t));    % 还原为 exp(-t^2)

% 2. 单边 Laplace 正逆变换
L_s   = laplace(t * exp(-2*t), t, s);     % 输出 1 / (s + 2)^2
l_rec = ilaplace(L_s, s, t);              % 还原为 t * exp(-2*t)

% 3. 单边 Z 正逆变换
Z_z   = ztrans((1/2)^n, n, z);            % 输出 z / (z - 1/2)
z_rec = iztrans(Z_z, z, n);               % 还原为 (1/2)^n
```

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
