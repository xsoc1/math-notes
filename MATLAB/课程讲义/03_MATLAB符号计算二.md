---
title: "第三课：MATLAB 符号计算（二）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/03_MATLAB符号计算二.md"
matlab_source_sha256: ebf6a2ab1791e7e6db030de4bbe25002a8ee8f65ea00a56c14cb5ef036e4289a
---

# 第三课：MATLAB 符号计算（二）

来源：[[MATLAB/课程资料/原始课件/第三课 MATLAB符号计算（二） .pdf|第三课 MATLAB符号计算（二） .pdf]]，共 44 页。下列页码均指 PDF 页码。原课件示例有旧语法；笔记区分课件内容与当前教学建议。

## 知识路线

| 页码 | 课件内容 | 学习时要回答的问题 |
|---|---|---|
| 2–7 | 构造符号数组，区分 `double`、`char`、`sym`；用 `size`、`class`、`isa`、`whos` 检查对象 | 矩阵乘法 `*` 与逐元素 `.*` 分别要求什么？ |
| 8–10 | `simplify`、`collect`、`pretty` | 化简是在什么假设与定义域下保持等价？ |
| 11–15 | `subs`、`double`、`vpa`、`digits` | 代入、数值近似与精确符号对象怎样转换？ |
| 16–18 | 阿基米德螺线弧长与 `fplot` | 积分的被积函数如何由参数曲线导出？ |
| 19–25 | `dsolve`、初值问题、皮卡迭代 | 解是否满足方程和给定条件？ |
| 26–33 | 傅里叶变换、逆变换、Heaviside 与 Dirac 例子 | 变换约定、适用函数类及广义函数如何区分？ |
| 34–37 | 拉普拉斯变换与卷积 | 变换结果对参数和收敛域有什么要求？ |
| 38–41 | 单边 Z 变换与逆变换 | 序列下标从何处开始？ |
| 42–43 | 第三周参考作业与课后反馈，课件明确“无需提交” | 自测先独立完成，再对照核验 |

## 基础解释与数学核验

**对象和维度。** `sym` 是符号对象类型，不等于保存字符的 `char`。符号矩阵仍遵守通常矩阵维度规则。课件第 5 页展示符号矩阵的乘法与对应元素相乘；同形矩阵的 `.*` 不产生矩阵乘积。

**化简。** 第 9 页使用 `IgnoreAnalyticConstraints`，这种设置可能在复数分支上改变恒等式的适用域。学习时应先列变量假设，必要时取数值反例或用 `isAlways` 核查，不把更短的式子自动视为全域相等。

**微分方程。** 第 19 页说明使用符号方程与初值条件调用 `dsolve`。第 20–21 页仍展示字符串方程和 `ezplot` 的旧例；学习时优先使用符号函数与方程形式，并回代检验。第 23–25 页用 $y'=x+y,\ y(0)=1$ 说明皮卡迭代：$y_{k+1}(x)=1+\int_0^x(t+y_k(t))\,dt$。

**三种变换。** 课件采用 $\mathcal F[f](\omega)=\int_{-\infty}^{\infty}f(t)e^{-i\omega t}\,dt$、$\mathcal L[f](s)=\int_0^{\infty}f(t)e^{-st}\,dt$ 和 $\mathcal Z[f](z)=\sum_{n=0}^{\infty}f_nz^{-n}$。Heaviside、Dirac 的傅里叶式涉及广义函数，不应当按普通点值函数理解或积分。

新收到的 [[MATLAB/课程讲义/补充_第三周傅里叶参考资料|Week3 傅里叶资料包导览]]含两本参考书和两张图片，可在学习本节 `fourier` 后按需查阅；其中一本参考书采用 $e^{-2\pi i t\xi}$，与课件的 $e^{-i\omega t}$ 需换算频率变量。

## 先动手再做参考作业

先自己构造一个 $2\times2$ 符号矩阵，预测 `size`、`class`、`A*A`、`A.*A` 的结果形式，再运行。接着任选一个 `subs` 或 `dsolve` 例子，写出数学预期与回代检验。通过这些前置练习后，再引导做第 42 页三道无需提交的[第三周参考自测](file:///F:/MATLAB%20course/%E8%87%AA%E6%B5%8B/%E7%AC%AC%E4%B8%89%E5%91%A8%E5%8F%82%E8%80%83%E4%BD%9C%E4%B8%9A/%E9%A2%98%E7%9B%AE.md)；独立题面与原 PDF 自带的参考答案已分开，这里不预写答案。

当前示范源码见 [符号对象与代入](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/lecture03_symbolic_subs.m)；其运行状态以 [运行结果](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E6%96%B0%E5%A2%9E%E7%A4%BA%E4%BE%8B%E8%BF%90%E8%A1%8C%E7%BB%93%E6%9E%9C.txt)为准。

## 2026-10-19 引导学习：符号数组、整理与数值转换

本人实时脚本任务已通过，本节按尚未接触的起点讲解。以下为讲解补充；对应原课件第 2–15 页，仍以 MATLAB 对象、命令机制和结果解释为主线。

### 1. 符号数组保存表达式

`syms x real` 创建符号变量 x，并声明它取实数；这不等于已经给 x 指定一个数值。`S=[x,sym(1)/3;0,x+1]` 是 2×2 的 `sym` 数组，每个位置保存表达式。数组里分号换行；整条赋值末尾的分号则抑制输出。整数 0 等会自动转为符号元素，`sym(1)/3` 从符号整数构造精确分数。

符号数组仍遵守原矩阵尺寸与运算规则；本轮不重做已经验证过的矩阵乘法与逐元素乘法练习。重点是元素可以含未知量，不能把它当作已知数值矩阵。

### 2. 不同命令有不同整理目标

| 命令 | 意义 |
|---|---|
| `expand(E)` | 展开乘积与整数幂，例如 `(x+1)^3` 展开成多项式 |
| `factor(E)` | 返回因子列表；将列表元素相乘才还原原多项式 |
| `collect(E,x)` | 按 x 的幂收集同类项，便于查看各次项系数 |
| `simplify(E)` | 在对象及假设允许的范围内尝试简化，不承诺某种唯一形式 |
| `pretty(E)` | 改善命令窗口显示，不改变对象、不把符号值变成 double |

简化要服从变量假设。已声明实数时，`sqrt(x^2)` 为 `abs(x)`，不能一般写成 x，因为 x 仍可能为负。符号整理应保持数学意义，不把式子短或软件能输出当作不带条件的恒等证明。

### 3. 先代入，再转换类型

`AtTwo=subs(S,x,2)` 对数组中各表达式替换 x，返回新的符号数组；S 本身仍含 x。此时 `AtTwo=[2,1/3;0,3]` 已无自由变量，`double(AtTwo)` 才能转为普通数值数组，其中 1/3 存为浮点近似。直接 `double(S)` 仍无法把未知量 x 变成一个已知数值。

`symvar` 可查看还剩哪些自由变量。需要多位十进制近似时用 `vpa(E,20)`，结果仍为符号对象；`digits` 影响未显式指定精度的 vpa 运算，不提高 double 的存储精度。

```matlab
syms x real
S = [x, sym(1)/3; 0, x+1]; % Keep an exact symbolic fraction.
Expanded = expand((x+1)^3)
Simple = simplify(sin(x)^2+cos(x)^2)
AtTwo = subs(S,x,2)
Approx = double(AtTwo)
```

`Expanded` 是展开后的三次多项式，`Simple` 为 1；`AtTwo` 保留符号类型和精确分数，`Approx` 为 double。完整[短示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_symbolic_arrays_demo.m)还核对 factor 的因子列表、collect、实数假设和自由变量数；本机 R2026a Update 5 实际运行结果见[日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E8%B5%B7%E6%AD%A5%E4%B8%8E%E5%AE%9E%E6%97%B6%E8%84%9A%E6%9C%AC%E6%A0%B8%E9%AA%8C_20261019.txt)。示范执行不登记为本人已完成。

### 一次综合动手

在 MATLAB 新建脚本 `w03_symbolic_arrays.m`。声明实符号变量 t，自行建立 `T=[t^2+1,sym(2)/5;sin(t),t+2]`；将 `(t-1)*(t+2)` 展开，用 simplify 检查展开前后的差。再将 T 中 t 替换为 0，分别保留符号结果与 double 结果。回传两个矩阵、展开前后差值，以及一句“为何原 T 不能直接转换成 double”的解释；一次操作核对三个主题，不另设每个函数的重复练习。

## 2026-10-20 本人反馈与下一环节：参数曲线、弧长和 fplot

### 已完成的符号矩阵任务

本人[原稿](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_symbolic_arrays.m)与[截图](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_symbolic_arrays_learner_20261020.png)显示展开前后差为 0，代入矩阵为 `[1,2/5;0,2]`，转换后为对应 double 矩阵，结果正确。原 T 仍含未确定的 t，因此不能直接成为具体数值矩阵；这与数值“准不准确”是两个问题。当前关口通过，不重复练习。原稿保留字节，截图和 SHA-256 见[校核记录](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_symbolic_arrays_review_20261020.json)。

以下为对应课件第 16–18 页主题的讲解补充；半径 2 的四分之一圆是助手教学示范。螺线任务的区间由本次教学选定，不冒充原课件的逐字题面。

### 1. 一个参数同时决定两个坐标

普通函数图像 `fplot(F,[a b])` 上的点是 `(t,F(t))`。参数曲线则用两个表达式 `X=x(t)` 和 `Y=y(t)` 表示点 `(x(t),y(t))`；参数 t 不必是横坐标，也不必代表时间。

例如 `X=2*cos(t); Y=2*sin(t)` 中，t 从 0 到 pi/2 时，点从 `(2,0)` 走到 `(0,2)`，描出半径 2 的四分之一圆。X 与 Y 在这里各是一个含 t 的标量符号表达式，`syms t real` 声明 t 是实参数。

### 2. 坐标变化率合成沿曲线的速度

参数增加一个很小的正量 dt 时，两方向位移近似为 x'(t)dt 和 y'(t)dt。由勾股关系，小段长度近似为 `sqrt(x'(t)^2+y'(t)^2)*dt`，因此光滑曲线的长度为

$$
L=\int_a^b\sqrt{[x'(t)]^2+[y'(t)]^2}\,dt.
$$

MATLAB 用 `diff(X,t)` 和 `diff(Y,t)` 求坐标对参数的导数，组成根号内的量，再 `simplify`。这里 t 为实数，根号中的量非负；`Speed` 表示每单位参数变化对应的路程。对本圆弧，`Dx=-2*sin(t)`，`Dy=2*cos(t)`，故 Speed 恒为 2，弧长为 `2*(pi/2)=pi`。若路径重复走过同一段，此积分会累计每次走过的路程。

`int(Speed,t,0,sym(pi)/2)` 指定积分变量和精确符号终点；`vpa(ArcLength,10)` 显示 10 位有效数字，结果仍为 sym。这里 X、Y 和导数都是标量符号表达式，所以平方用 `^2`；若后续先代入一整组数值得到向量，再逐点平方，就要用 `.^2`。

### 3. 用两个表达式画参数曲线

```matlab
% Teaching supplement: a radius-2 quarter circle.
syms t real
X = 2*cos(t);
Y = 2*sin(t);

% Differentiate the coordinates, then form the scalar speed.
Dx = diff(X,t);
Dy = diff(Y,t);
Speed = simplify(sqrt(Dx^2 + Dy^2))

% Integrate with an exact symbolic endpoint.
ArcLength = int(Speed,t,0,sym(pi)/2)
ArcApprox = vpa(ArcLength,10)

% Here the third argument gives the parameter interval.
figure;
fplot(X,Y,[0 pi/2],'LineWidth',1.5);
axis equal;
grid on;
xlabel('x');
ylabel('y');
title('Radius-2 quarter circle');
```

`fplot(X,Y,[0 pi/2])` 中第三个参数给的是 t 的区间，并非强行规定横坐标范围。fplot 会自动选取数值采样点绘制曲线，不要求先生成冒号向量。只写 `fplot(Y,[0 pi/2])` 画的是 `(t,Y(t))`，含义不同。`axis equal` 使横纵坐标的一个单位在屏幕上同长，避免圆被比例拉伸；不要求两个坐标轴的数值范围相同。[MathWorks fplot 文档](https://www.mathworks.com/help/symbolic/sym.fplot.html)给出参数形式和区间约定。

积分终点用 `sym(pi)/2` 保留符号常数；绘图范围中的普通 `pi/2` 供数值采样使用。预期输出为 `Speed=2`、`ArcLength=pi`、`ArcApprox=3.141592654`，图形为第一象限四分之一圆。本机示范和本人原稿的独立批处理见[实际日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E5%8F%82%E6%95%B0%E6%9B%B2%E7%BA%BF%E6%A0%B8%E9%AA%8C_20261020.txt)；示范源码见[脚本](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_parametric_arc_demo.m)。助手运行示范不登记为本人完成本节，图形也不替代符号弧长计算。

### 一次综合动手：改成螺线

自行保存 `环境/学习证据/w03_spiral.m`，沿用上述流程，将两个坐标改成 `X=t*cos(t)` 与 `Y=t*sin(t)`，参数从 0 到 `2*pi`。它的极径随 t 增大，同时绕原点旋转一圈，是一段阿基米德螺线。

分别修改精确积分终点和绘图参数区间，保留 `diff`、速度合成、`int`、`vpa` 和 `axis equal`。回传 Speed、ArcApprox 与图，并用一句话解释 `fplot(X,Y,[0 2*pi])` 中 `[0 2*pi]` 限制哪个量。只布置这一项，不另要求重做圆弧。

## 2026-10-20 螺线任务通过；微分方程第一步

### 本人尝试与反馈

本人[提交原稿](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_spiral_submitted_20261020.m)、[图窗](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_spiral_plot_20261020.png)和[数值输出](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_spiral_output_20261020.png)相符：Speed 为 `sqrt(t^2+1)`，精确长度为 `asinh(2*pi)/2+pi*sqrt(4*pi^2+1)`，10 位有效数字为 `21.25629415`。参数弧长与绘图任务通过。

`[0,2*pi]` 限制 t 从 0 变到 2*pi；对 X=t*cos(t)、Y=t*sin(t)，极角旋转一圈而极径从 0 增至 2*pi，所以整条螺线不周期重复。图标题遗留的圆弧字样已在[工作脚本](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_spiral.m)中唯一替换为 `Archimedean spiral`，不改计算；提交原字节及两版 SHA-256 见[记录](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_spiral_review_20261020.json)。本措辞和标题不另设关卡。

以下是对应课件第 19 页命令与初值主题的讲解补充。一阶示范先建立基础，后续仍须覆盖二阶语法、课件第 20 页方程组与第 21–22 页奇解/通解图示，再进入 Picard；本轮不把这些内容标成已完成。

### 1. 未知对象变成一个函数

代数方程通常求未知数，微分方程求一个函数：函数值及其导数必须在一段区间上符合关系。例如 `y'(t)=-2*y(t)` 要求变化率等于当前值的 -2 倍，解的候选是整条函数。

`syms y(t)` 创建一个尚未确定表达式的符号函数 y，并建立自变量 t；`diff(y,t)` 表示它对 t 的导数。不要写成 `syms y t` 来代替：后者把 y 与 t 建成两个独立符号，`diff(y,t)` 就是 0，已经丢失 y 依赖 t 的含义。

`Eqn=diff(y,t)==-2*y` 的单等号把右侧对象存入 Eqn，双等号在这里构造符号方程，交给求解器；不把数学等式误写成赋值。课件旧的字符串 `Dx=...` 语法不用于本轮示范。

### 2. 通解包含常数，初值选定成员

对此方程，`dsolve(Eqn)` 返回 `C1*exp(-2*t)`，因为对任意常数 C1 求导都满足关系。`Condition=y(0)==3` 是要求解在 t=0 时取 3；对本线性方程，它使 C1=3，因此 `dsolve(Eqn,Condition)` 返回 `3*exp(-2*t)`。

初值是在某个起点对函数的要求，不是先给 y 整体赋值成 3。一般方程的初值可能不相容或不足以保证唯一；本例具有唯一解。dsolve 无法返回符号解也不等于数学上无解。

### 3. 分开核对方程与初值

```matlab
% Teaching supplement: first-order symbolic differential equation.
syms y(t)
Eqn = diff(y,t) == -2*y;

% Without a condition, return a family containing an arbitrary constant.
GeneralSolution = dsolve(Eqn)

% The condition selects one member for this linear equation.
Condition = y(0) == 3;
Solution = dsolve(Eqn,Condition)

% Verify the differential equation and the initial value separately.
EquationResidual = simplify(diff(Solution,t) + 2*Solution)
InitialResidual = simplify(subs(Solution,t,0) - 3)
```

`EquationResidual` 是导数减去方程右端，这里写成 `y'+2*y`；它为 0 检验微分关系。`InitialResidual` 是解在 0 处的值减 3；它为 0 检验初值。只有一个为 0 不够，例如 `5*exp(-2*t)` 满足该微分方程，却不满足本初值。

按此赋值方式，y 是 symfun，但 Solution 是含 t 的 sym 表达式；求 t=0 处的值用 `subs(Solution,t,0)`。不要把表达式当已命名函数写 `Solution(0)`，那会被当作数组索引。输出应为 `GeneralSolution=C1*exp(-2*t)`、`Solution=3*exp(-2*t)`，两个残差都为 0。[MathWorks dsolve 文档](https://www.mathworks.com/help/symbolic/sym.dsolve.html)列出符号方程、初值与函数的当前语法。示范源码见[一阶初值示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_dsolve_ivp_demo.m)，实际版本与独立核验结果见[运行日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E5%BE%AE%E5%88%86%E6%96%B9%E7%A8%8B%E8%B5%B7%E6%AD%A5%E6%A0%B8%E9%AA%8C_20261020.txt)。助手运行不登记为本人已完成新主题。

### 一次动手

本人保存 `环境/学习证据/w03_dsolve.m`，求 `y'=t-y, y(0)=2` 的符号解。沿用示范结构，但同时修改方程、初值和两个残差：方程残差必须对应新的“左侧减右侧”，不能照搬旧的 `y'+2*y`。

回传 Solution、EquationResidual、InitialResidual，并用一句话分别说明两个残差核对什么。尚未收到本人尝试时，第 9 项仍为当前，不推进后续内容。

### 本节后续保留内容与课件勘误

二阶用 `diff(y,t,2)`，导数初值需要先为导数命名；方程组使用符号方程向量及结构字段取解。课件第 19 页把所需条件数与“方程个数”联系并不普遍正确：一条二阶方程通常涉及两个积分常数；条件数也不能代替相容性与唯一性判断。第 21–22 页的奇解示范需区分任意常数族与不属于该族的解，并用当前 fplot 语法代替 ezplot。这些主题留在同一阶段继续讲解和操作，不以本次一阶示范替代。

## 2026-10-20 一阶任务通过；二阶、方程组与奇解

本人[原稿](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_dsolve.m)和[截图](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_dsolve_output_20261020.png)给出 `Solution=t+3*exp(-t)-1`，两个残差均为 0，且分别解释为检查原方程和初值，完全正确。一阶部分通过，原字节保留；SHA-256 与反馈见[记录](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_dsolve_review_20261020.json)。不追加一阶近似题。

以下合并三个相关新主题。二阶语法是第三周自测的先修补充；方程组与奇解对应已核对的课件第 19–22 页。本轮先讲解并示范，本人综合任务未回传前，第 9 项仍为当前。

### 1. 二阶导数与导数初值

二阶方程含 y 的二阶导数。例如 `y''+y=0` 的通解为 `A*cos(t)+B*sin(t)`；初值 y(0)=1 与 y'(0)=0 分别确定 A=1、B=0，得到 cos(t)。因此不能按“只有一条方程”就认为总是只需一个条件。条件的相容性与唯一性仍要结合方程判断。

`diff(y,t,2)` 中最后的 2 是求导阶数，表示对 t 连续求两次导数。`Dy=diff(y,t)` 给符号导数函数命名，随后 `Dy(0)==0` 表示导数初值。`[y(0)==1,Dy(0)==0]` 把两个条件放进同一数组，传给 dsolve。

### 2. 用两个一阶方程描述同一问题

令 x=y、z=y'，则 `y''+y=0` 等价于 `x'=z, z'=-x`。条件也同步变成 x(0)=1、z(0)=0。这两种写法应得到相同的第一分量，提供了一次不同表示之间的核对。

`Eqns=[diff(x,t)==z,diff(z,t)==-x]` 把两个符号方程放进数组；`S=dsolve(Eqns,Conditions)` 在本例返回 struct 结构。`S.x` 取名为 x 的解，`S.z` 取名为 z 的解，点号在这里是取字段的语法。得到的 Xsol、Zsol 为符号表达式，可继续 diff、subs 和 fplot。[MathWorks 文档](https://www.mathworks.com/help/symbolic/sym.dsolve.html)给出二阶初值与结构字段的相应语法。

### 3. 奇解不一定藏在任意常数族中

课件例子是 `y=t*y'-(y')^2`，残差移到左侧为 `(y')^2-t*y'+y`。对每个固定常数 C，直线族 `Family=C*t-C^2` 都满足这个方程。另外，`Singular=t^2/4` 也满足它，但不能通过选择某个固定 C 使整条直线等于这条抛物线；这就是本例的奇解。

MATLAB 本机 dsolve 对这个例子返回两个候选：`t^2/4` 与 `-C1^2+t*C1`。不能把某个固定返回位置当作“奇解”的永久标记，应按表达式和代回检验识别。本例的两类候选都能直接核验；本节不据候选列表声称已经分类所有可能的分段拼接解。

下面的[完整示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_ode_more_demo.m)串联三个主题，最后把三个固定 C 对应的直线与奇解画在一起。实符号常数用单独的 `syms C real` 声明；不对符号函数使用 real 假设。

```matlab
%% Second-order equation with a derivative initial condition.
syms y(t)
Dy = diff(y,t);
SecondSolution = dsolve(diff(y,t,2)+y==0,[y(0)==1,Dy(0)==0])
SecondResidual = simplify(diff(SecondSolution,t,2)+SecondSolution)
SecondInitialResiduals = [subs(SecondSolution,t,0)-1,subs(diff(SecondSolution,t),t,0)]

%% The equivalent first-order system returns a structure.
syms x(t) z(t)
Eqns = [diff(x,t)==z,diff(z,t)==-x];
Conditions = [x(0)==1,z(0)==0];
S = dsolve(Eqns,Conditions);
Xsol = S.x
Zsol = S.z
Consistency = simplify(Xsol-SecondSolution)
SystemResiduals = simplify([diff(Xsol,t)-Zsol,diff(Zsol,t)+Xsol])
SystemInitialResiduals = [subs(Xsol,t,0)-1,subs(Zsol,t,0)]

%% A family of line solutions and a singular solution.
syms w(t)
syms C real
Candidates = dsolve(diff(w,t)^2-t*diff(w,t)+w==0)
Family = C*t-C^2;
Singular = t^2/4;
FamilyResidual = simplify(diff(Family,t)^2-t*diff(Family,t)+Family)
SingularResidual = simplify(diff(Singular,t)^2-t*diff(Singular,t)+Singular)

% Substitute three constant choices; fplot accepts a symbolic array.
FamilyLines = subs(Family,C,[-1 0 1]);
figure;
fplot([FamilyLines,Singular],[-4 4],'LineWidth',1.5);
grid on;
xlabel('t');
ylabel('y');
legend('C=-1','C=0','C=1','Singular','Location','best');
title('Line family and singular solution');
```

输出预期：SecondSolution 与 Xsol 都为 cos(t)，Zsol 为 -sin(t)，Consistency 为 0；二阶方程、方程组与其初值残差均为零。FamilyResidual 与 SingularResidual 也为零，但这不说明两个解相同，只说明各自满足同一方程。

`subs(Family,C,[-1 0 1])` 分别取三个常数，形成 1×3 的符号表达式数组；`[FamilyLines,Singular]` 加上第四条抛物线，再由 fplot 一次画出。此处复用已有数组、代入和绘图知识，不提前引入循环。实际 MATLAB 版本、两次表示核对、候选和四条函数线的核验见[日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E4%BA%8C%E9%98%B6%E6%96%B9%E7%A8%8B%E7%BB%84%E4%B8%8E%E5%A5%87%E8%A7%A3%E6%A0%B8%E9%AA%8C_20261020.txt)。助手运行示范不登记为本人完成。

### 一次综合动手

本人保存 `环境/学习证据/w03_ode_more.m`。沿用示范，将二阶初值的 y'(0) 改成 1，并把等价方程组的 z(0) 同步改为 1；对应的初值残差也减去新的目标值。保留 y(0)=x(0)=1，运行比较两种表示及奇解图示。

回传 SecondSolution、Xsol、Zsol、Consistency、FamilyResidual、SingularResidual 与图，并用一句话解释为何不能用某个固定 C 得到本例奇解。一个脚本完成三个相关主题，不另设三轮重复练习；收到本人正确作品后再完成第 9 项并进入 Picard。

## 2026-10-20 微分方程综合任务通过；Picard 迭代

本人[原稿](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_ode_more.m)、[图](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_ode_more_plot_20261020.png)和[输出](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_ode_more_output_20261020.png)相符：SecondSolution 与 Xsol 为 `cos(t)+sin(t)`，Zsol 为 `cos(t)-sin(t)`，一致性和两类解的代回残差均为 0。本人解释直线族关于 t 一次、奇解二次，因此固定 C 无法使两者整条重合，理由正确。C=0 时直线族退化为常数，统一说“至多一次”更准确；不为此加练。第 9 项完成。原字节与哈希见[校核记录](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_ode_more_review_20261020.json)。

以下是课件第 23–25 页的 Picard 主题讲解补充，已核对第 23–24 页公式和图示。先用更简单的 y'=y、y(0)=1 示范命令，再由本人完成课件 y'=x+y 的任务。本轮不提前教授循环；以后第五课完整学习 for/while，不因这里的递推而登记学过循环。

### 1. 用上一轮近似构造下一轮

对初值问题 y'=f(x,y)、y(0)=b，由微积分基本定理可写成

$$
y(x)=b+\int_0^x f(\tau,y(\tau))\,d\tau.
$$

右侧仍含未知函数，先取简单的 P0(x)=b，再将上一轮的近似代入积分：

$$
P_{n+1}(x)=b+\int_0^x f(\tau,P_n(\tau))\,d\tau.
$$

这就是 Picard 迭代。本轮只需理解“取上一轮、代入右端、积分得到下一轮”。每次积分前加的是原来的初值 b，不能改成 Pn(x)。因为上限 x=0 时积分为 0，每轮都保留同一个初值。对于本例的线性方程，迭代在有界区间上收敛；一般方程需检查相应连续性和局部 Lipschitz 等条件，不能从某次图形贴近推断所有问题都收敛。

### 2. 区分外部变量和积分变量

示范中 y'=y，递推为 `Pnext=1+int(Pold(tau),tau,0,x)`。我们保存的 Pold 是关于 x 的 sym 表达式，因此先用 `subs(Pold,x,tau)` 得到积分中的表达式，再显式用 tau 积分。

例如 P1=1+x 时，积分里应放 `1+tau`；直接 `int(P1,tau,0,x)` 会把其中的 x 当成常数，得到错误的下一轮。`expand` 只把结果展开，便于检查每个幂次；它不承担迭代本身。[subs](https://www.mathworks.com/help/symbolic/sym.subs.html)与[int](https://www.mathworks.com/help/symbolic/sym.int.html)的文档分别说明替换与显式积分变量/上下限的语法。

```matlab
% Teaching supplement: Picard iteration for y'=y, y(0)=1.
syms x tau real
P0 = sym(1);

% Substitute the integration variable into the previous approximation.
P1 = expand(1 + int(subs(P0,x,tau),tau,0,x))
P2 = expand(1 + int(subs(P1,x,tau),tau,0,x))
P3 = expand(1 + int(subs(P2,x,tau),tau,0,x))

% Compare a finite approximation with the exact solution.
syms y(x)
Exact = dsolve(diff(y,x)==y,y(0)==1);
InitialCheck = simplify(subs(P3,x,0)-1)
Residual = simplify(diff(P3,x)-P3)
ErrorAtHalf = vpa(abs(subs(Exact-P3,x,sym(1)/2)),10)

% Plot the approximations and the exact solution together.
figure;
fplot([P0,P1,P2,P3,Exact],[0 1],'LineWidth',1.5);
grid on;
xlabel('x');
ylabel('y');
legend('P0','P1','P2','P3','Exact','Location','best');
title('Picard approximations for y''=y');
```

示范得到 P1=1+x，P2=1+x+x^2/2，P3=1+x+x^2/2+x^3/6。这里单独保存前三轮，便于查看递推，不要求先掌握循环语法。完整[示范源码](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_picard_demo.m)和[实际日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BEPicard%E8%BF%AD%E4%BB%A3%E6%A0%B8%E9%AA%8C_20261020.txt)只作为助手运行证据，不认定本人完成新主题。

### 3. 有限迭代是近似，分别看初值、方程残差与误差

示范精确解为 exp(x)。P3 的 InitialCheck 为 0，说明初值满足；Residual 为 `-x^3/6`，不是恒零，说明这次有限迭代尚非精确解。ErrorAtHalf 约为 0.002887937367，是 x=1/2 处相对已知精确解的绝对误差，和微分方程残差属于不同的量。

非零残差在这里是预期结果，不应要求把所有近似的残差都算成零。fplot 将 P0–P3 和 Exact 作为五个表达式画在一起，帮助观察本例在原点附近的逼近；有限图形与单点误差不代替收敛证明，也不能代替整个区间的误差上界。

### 一次动手：课件的 Picard 例子

本人保存 `环境/学习证据/w03_picard.m`，对 `y'=x+y, y(0)=1` 计算 P1、P2、P3。仍取 P0=sym(1)，将每轮被积表达式改成 `tau+subs(Pold,x,tau)`，每轮积分前仍加 1。

精确解用 dsolve 按新方程求出；Residual 相应改为 `diff(P3,x)-(x+P3)`，InitialCheck 与 x=1/2 的绝对误差按示范计算。按课件在 `[0 3]` 上画 P0–P3 与精确解，注意这里会比示范区间 `[0 1]` 更明显地显示有限迭代的差距。

回传 P3、InitialCheck、Residual、ErrorAtHalf 和图，并用一句话说明“本次 Residual 不为零为何不自动表示程序错误”。一个综合任务核对递推、代入与近似解释；本人未尝试前，第 10 项保持当前，三种变换仍待学习。

## 2026-10-20 Picard 通过；第 11.1 轮：傅里叶基础与逆变换

本人[原稿](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_picard.m)、[图](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_picard_plot_20261020.png)与[输出](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_picard_output_20261020.png)相符，第三轮近似、初值、残差和单点误差均正确。本人指出 P3 是近似而非精确解，解释正确。第 10 项通过，不重复本人已正确的运行；证据层级、哈希与加速要求见[记录](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E5%AD%A6%E4%B9%A0%E8%AF%81%E6%8D%AE/w03_picard_review_20261020.json)。

用户要求加速并显示具体轮次。变换阶段按 11.1 基础、11.2 性质与广义函数、11.3 拉普拉斯、11.4 单边 Z 四轮计划推进；第 12 轮进入第三周参考自测。这是教学轮次安排，不把四轮计划视作完成证据；必要澄清不自动增加相似练习。

### 1. 从原变量到频率变量

本轮对应课件第 26 页定义与命令，Gaussian 为助手讲解补充。傅里叶变换把关于 t 的函数变成关于频率 w 的函数，用来描述不同振荡频率的成分。核 `exp(-1i*w*t)=cos(w*t)-1i*sin(w*t)` 表明结果一般可以是复数；这里 w 是角频率，不是又一个时间点。

课件与 MATLAB 默认约定为

$$
F(\omega)=\int_{-\infty}^{\infty} f(t)e^{-i\omega t}\,dt,
\qquad
f(t)=\frac{1}{2\pi}\int_{-\infty}^{\infty}F(\omega)e^{i\omega t}\,d\omega.
$$

正变换指数中的负号和逆变换前的 1/(2*pi) 是成对约定；不能把其他教材采用的 `exp(-2*pi*1i*frequency*t)` 结果直接混用。本例 exp(-t^2) 光滑且快速衰减，正反变换均无普通积分收敛问题；非可积的常数和阶跃如何处理留在 11.2，不把它们按本轮的绝对可积函数处理。

### 2. 显式指定两个变量，再逆变换检验

```matlab
syms t w real
f = exp(-t^2);

% 从 t 变到 w, 再从 w 还原到 t
F = simplify(fourier(f,t,w))
Recovered = simplify(ifourier(F,w,t))
RecoveryResidual = simplify(Recovered-f)

% 在零频率处, 指数核为 1
ZeroFrequency = simplify(subs(F,w,0))
Area = int(f,t,-Inf,Inf);
AreaResidual = simplify(ZeroFrequency-Area)
```

`fourier(f,t,w)` 的第二项是原变量，第三项是结果变量；`ifourier(F,w,t)` 正好反向。两者都返回符号对象。这个例子得到 `F=sqrt(pi)*exp(-w^2/4)`、`Recovered=exp(-t^2)`、RecoveryResidual=0。实偶函数的本例变换仍为实数，不代表所有实函数的变换都实值。[fourier](https://www.mathworks.com/help/symbolic/sym.fourier.html)与[ifourier](https://www.mathworks.com/help/symbolic/sym.ifourier.html)文档说明显式变量和变换约定。

### 3. 零频率与图形核对

令 w=0，核等于 1，故本例 ZeroFrequency 等于原函数在整个实轴上的积分，均为 sqrt(pi)，AreaResidual 为 0。它核对归一化；RecoveryResidual 则核对逆变换还原，两者目标不同。

分别用 `fplot(f,[-3 3])` 和 `fplot(F,[-6 6])` 在两个图窗绘制，并将横轴分别标成 t、w；不要把频率轴标成时间。完整[示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w03_fourier_basics_demo.m)含两图与注释；实际默认 FourierParameters、运行和核验结果见[日志](file:///F:/MATLAB%20course/%E7%8E%AF%E5%A2%83/%E7%AC%AC%E4%B8%89%E8%AF%BE%E5%82%85%E9%87%8C%E5%8F%B611_1%E6%A0%B8%E9%AA%8C_20261020.txt)。未改写全局符号首选项，助手示范不登记为本人完成。

### 本轮一个任务

本人保存 `环境/学习证据/w03_fourier.m`，将 f 改为 `exp(-2*t^2)`，计算 F、Recovered、RecoveryResidual、ZeroFrequency 和 AreaResidual，并画原函数与变换两图。回传 F、两个残差、ZeroFrequency 和频率图，用一句话说明逆变换调用中第二、第三个变量为什么换了位置。得到正确作品后进入 11.2，拉普拉斯、Z 和 Parseval/广义函数不提前略去。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
