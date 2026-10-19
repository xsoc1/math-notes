---
title: "第三课：MATLAB 符号计算（二）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/03_MATLAB符号计算二.md"
matlab_source_sha256: ce9e9717ed313219c0be5d79e4ef0892d13ab9990a55fb0963cac598e208365c
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

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
