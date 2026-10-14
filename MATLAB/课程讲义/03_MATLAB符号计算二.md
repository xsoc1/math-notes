---
title: "第三课：MATLAB 符号计算（二）"
tags:
  - matlab/lecture
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/03_MATLAB符号计算二.md"
matlab_source_sha256: 6d76cdaeb57c4a2222d2e49d88525f01c6fdfa2d7b4d309a04bbca4f7f1ac0d7
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

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
