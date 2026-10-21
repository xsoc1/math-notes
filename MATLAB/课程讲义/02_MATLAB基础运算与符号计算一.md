---
title: "第二课：MATLAB 基础运算与符号计算（一）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/02_MATLAB基础运算与符号计算一.md"
matlab_source_sha256: f1891a249f62a73a63636ecc9890185e97f2e6374ca7f5d9fa0bafd9cab4f54c
---

# 第二课：MATLAB 基础运算与符号计算（一）

> 资料来源：《第二课 MATLAB基础运算与符号计算（一）.pdf》。题目和函数主线来自课件；补充解释不冒充课堂原话。

## 本讲目标

1. 掌握数值显示、矩阵定义、复矩阵和向量化运算。
2. 理解数值计算与符号计算的区别。
3. 使用 `sym`、`syms`、`solve`、`limit`、`diff`、`taylor` 和 `int`。
4. 知道符号输出仍需检查定义域、可导性和收敛条件。

## 1. MATLAB 作为计算器

`format short`、`format long`、`format rat` 等命令改变输出显示。分号、逗号、冒号和续行符 `...` 在构造矩阵与书写程序时有不同作用。

矩阵可以按行输入：

```matlab
A = [1, 3; 2, 4];
```

冒号表达式 `a:h:b` 生成等步长向量。绘图时常用逐元素运算，例如：

```matlab
t = 0:pi/50:4*pi;
y = exp(-t/3).*sin(3*t);
plot(t, y)
```

这里的 `.*` 是必要的，因为两个函数值向量需要逐元素相乘。

## 2. 数值对象与符号对象

### 课件内容

- `sym` 把数或字符串转换为符号对象。
- `syms` 创建符号变量，并可声明实数、正数或整数假设。
- 符号计算用于公式化简、方程求解、极限、微分、级数和积分。

### 讲解补充：转换时机很重要

```matlab
sym(0.3)
sym('0.3')
sym(3/10)
```

第一种写法先产生二进制浮点近似，再转为符号数；字符串 `'0.3'` 可被解释为精确的十进制有理数。若目标是精确运算，应尽早建立符号对象，例如 `sym(3)/10`。

本机 R2026a 实测中，`sym(0.3)` 被启发式识别并显示为 `3/10`。这类自动有理化不能作为一般保证；要明确表达数学上的精确数，仍应使用字符串、整数比或符号常量。

### 讲解补充与运行核验：圆周率常量

从 R2020a 起，`sym('pi')` 或 `sym("pi")` 创建的是名称为 `pi` 的符号变量，不是数学常量 $\pi$。因此 `sin(sym('pi')/2)` 会保留为未化简的 `sin(pi/2)`。应使用 `sym(pi)` 创建精确的符号圆周率常量；此版本变化见 [MathWorks `sym` 文档](https://www.mathworks.com/help/symbolic/sym.html)：

```matlab
PiVariable = sym('pi'); % 名为 pi 的符号变量
PiConstant = sym(pi);   % 精确的符号圆周率常量

sin(PiVariable/2)       % 保留为 sin(pi/2)
sin(PiConstant/2)       % 化简为 1
```

上述区别已在本机 MATLAB R2026a Update 5 实际核验。字符串适合表示十进制数和大整数，但不能据此推断所有内置数学常量也应写成字符串。

## 3. 符号表达式、符号函数和自由变量

```matlab
syms x a real
expr = a*sin(x) + 1;
vars = symvar(expr);
f(x) = expr;
```

符号表达式保存代数结构；符号函数还记录形参。`symvar` 给出表达式中的符号变量，但在多变量问题中最好显式指定求导、极限或积分变量。

## 4. 方程求解

```matlab
syms x real
solutions = solve(x^2 - 4 == 0, x);
```

`solve` 的输出要结合变量假设和原方程检查。含根式、分母或参数时，代回验证尤其重要。

## 5. 极限与无穷级数

```matlab
syms n positive integer
L = limit((1 + 1/n)^n, n, inf);
```

符号极限给出候选结果；数学证明仍需说明定理条件。`isAlways` 可以验证符号命题是否在当前假设下恒真，但不能代替证明。

## 6. 微分与不可导点

`diff(f,x)` 对表达式关于 $x$ 求导；对向量或矩阵求导时，需要分清逐元素导数、Jacobian 和 Hessian。

对

$$
y(t)=|\sin t|
$$

在 $t\ne k\pi$ 时有

$$
y'(t)=\cos t\,\operatorname{sgn}(\sin t).
$$

在 $t=k\pi$ 处左右导数相反，导数不存在。符号表达式在这些点可能给出形式值或条件表达式，因此必须回到导数定义检查。

## 7. Taylor 展开

```matlab
syms x
p = taylor(sin(x)/x, x, 0, 'Order', 8);
```

`Order` 指定截断的阶界，不等同于“必然含有该次数的非零项”。比较近似时应同时说明展开点、截断阶和考察区间。

## 8. 符号积分与广义积分

```matlab
syms x positive
I = int(sin(x)/x, x, 0, inf);
```

返回值 $\pi/2$ 需要由分析说明：被积函数在零点是可去奇点，无穷远处利用振荡产生条件收敛。软件结果不能省略收敛性论证。

## 9. 第二周作业要求

课件要求将方法、代码、运行结果和图形放入同一 PDF，并提供必要的 AI 交互。题目包括 $|\sin t|$ 的导数、两个阶乘极限和 Dirichlet 积分。正式实现见 [作业01：第二周电子版作业](file:///F:/MATLAB%20course/%E4%BD%9C%E4%B8%9A/%E4%BD%9C%E4%B8%9A01_%E7%AC%AC%E4%BA%8C%E5%91%A8/README.md)。

课件写明截止时间为 9 月 22 日 23:59:59，年份在现有材料中无法确认，提交前必须核对课堂派通知。

## 10. 运行练习

运行 [`lecture02_numeric_symbolic.m`](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/lecture02_numeric_symbolic.m)，比较：

1. `sym(0.3)` 与 `sym('0.3')`。
2. 数值求值和符号极限。
3. 符号导数表达式与不可导点的数学定义。

## 课后自检

- [ ] 能解释 `*` 与 `.*`、`/` 与 `./` 的区别。
- [ ] 能建立带假设的符号变量。
- [ ] 能区分符号表达式和符号函数。
- [ ] 能用 `limit`、`diff`、`taylor`、`int` 完成基本计算。
- [ ] 能独立检查定义域、不可导点和广义积分收敛性。

## 2026-10-21 补充参考

[[MATLAB/课程讲义/补充_第二周与第四周作业参考解读|第二周教师参考解读与证明边界]]已加入；原件为三页参考，不替换既有本人作品与报告。返回[课程入口](file:///F:/MATLAB%20course/README.md)。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
