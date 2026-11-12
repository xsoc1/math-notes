---
title: 第十课 MATLAB 概率统计与曲线拟合
date: 2026-11-04
tags:
  - matlab/lecture
  - matlab/statistics
  - matlab/curve-fitting
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/10_MATLAB概率统计与曲线拟合.md"
matlab_source_sha256: 510a259c09f173ac53e40344f462684849346e2027d004776fdc6048e4e1b9f8
---

# 第十课：MATLAB 概率统计与曲线拟合

来源：[[MATLAB/课程资料/原始课件/第十课 MATLAB概率统计与曲线拟合.pdf|47 页原课件]]。本课接续[[MATLAB/课程讲义/09_MATLAB进阶程序设计与问题求解|第九课的优化接口]]，也复用[[MATLAB/课程讲义/08_MATLAB线性代数|第八课]]的矩阵左除和残差。下文按页整理教师主题；数学前提、勘误与学习任务为讲解补充。

> [!abstract] 从随机模型到数据检验
> 概率分布描述「数据如何产生」，样本统计量总结「这批数据是什么样」，曲线拟合回答「用哪个函数解释数据」。先能用命令区分这三个对象，再讨论模型是否合适。

## 1. 分布、概率和样本（第 2–11 页）

| 分布 | 概率或密度、累积概率 | 随机样本与解释 |
|---|---|---|
| 二项 $X\sim B(N,p)$ | `binopdf(k,N,p)` 给 $P(X=k)$；`binocdf(k,N,p)` 给 $P(X\le k)$ | `binornd(N,p,m,n)` 返回 $m\times n$ 个成功次数；各样本均值理论值 $Np$、方差 $Np(1-p)$ |
| 正态 $X\sim N(\mu,\sigma^2)$ | `normpdf(x,Mu,Sigma)` 给密度；`normcdf(x,Mu,Sigma)` 给左侧累计面积 | `normrnd(Mu,Sigma,m,n)` 或 `Mu+Sigma*randn(m,n)`；`Sigma` 是标准差，不是方差 |
| 泊松 $X\sim\mathrm{Pois}(\lambda)$ | `PD=makedist('Poisson','lambda',2)`，`pdf(PD,0:4)` 给 0 到 4 的逐点概率；`cdf(PD,4)` 给它们的总和 | `random(PD,m,n)` 给次数样本；`makedist` 固定模型参数，不是从数据估计参数 |

正态分布单点概率为零，密度不是概率；例如 $P(|X-\mu|\le k\sigma)$ 要用两次 `normcdf` 相减，$k=1,2,3$ 约为 0.68269、0.95450、0.99730。课件用 `subplot` 和 `fill` 画密度及对应面积。二项图在左轴画点概率、右轴画累积概率，课件用 `plotyy`，示范用 `yyaxis`；两条曲线纵轴不是一个尺度。第 9–10 页展示 `disttool` 的交互图，可先用上表命令理解改变参数后曲线如何变化。

## 2. 可复现实验与按列统计（第 12–20 页）

`rand` 生成连续均匀样本，`randn` 生成标准正态，`randi([lo,hi],m,n)` 生成包含端点的均匀整数，`exprnd(Mu,...)` 接收指数分布的均值。`rng(17,'twister')` 固定种子和算法；`State=rng` / `rng(State)` 保存并恢复当前状态，可重现接下来的抽样。`rng('default')` 依赖 MATLAB 默认设置；`rng('shuffle')` 用当前时间设种子，仍是伪随机，不能把它当成独立随机流或真随机源。复现实验不要反复在循环内用相同种子。

把数据矩阵的行看作观测、列看作变量：`min/max/mean/median/std/var` 默认沿第一非单例维度计算；常规多行矩阵得到各列统计量。用 `A(:)` 可把全表展平。`var(A,0)` 除以 $m-1$，`var(A,1)` 除以 $m$；同一归一化下 `diag(cov(A)).'` 与 `var(A)` 一致到舍入误差。`corrcoef(A)` 比较列间线性相关；常数列零方差，相关系数没有定义；接近零不代表独立。课件的移位列示例中，各列复用同一序列的不同位置，不能因为相关系数小就说整列相互独立。`histfit` 叠加直方图与拟合密度形状，用来观察样本，不证明分布类型。

## 3. 用同一数据对照 `polyfit` 和左除（第 21–26 页）

给定 $m$ 对 $(x_i,y_i)$，$n$ 次模型的设计矩阵第 $i$ 行是 $[x_i^n,\ldots,x_i,1]$。令 $r=Xa-y$，普通最小二乘最小化 $\|r\|_2^2$；MATLAB 用 `X\y`，无需显式构造或求逆 $X^\top X$。`polyfit(x,y,n)` 返回**降幂**系数，`polyval(p,x)` 代回同一坐标。R2026a 的 `[p,S,Mu]=polyfit(x,y,n)` 会中心化/缩放 $x$，应配套 `polyval(p,x,[],Mu)`。

对课件 11 点例子，三次拟合的 $\|r\|_2\approx1.8653$，不是 SSE；`sum(r.^2)` 才是 SSE，$\|r\|_\infty$ 约 0.95592。`table(x,y,yhat,r)` 可定位哪一行偏差最大。若有 $n+1$ 个不同横坐标，且 $m=n+1$，Vandermonde 方阵可逆，拟合退化为插值；训练残差为零并不说明噪声已去掉。课件另列岭回归（惩罚系数平方和）、Lasso（惩罚系数绝对值和）与最小绝对残差（惩罚的是**残差**绝对值和）；三者改变的是不同目标。是否惩罚截距须按使用的模型与接口说明。

## 4. Curve Fitter：比较模型，不只比较一个 SSE（第 27–42 页）

1. 用 `cftool(x,y)` 导入数据，先看散点与线性基线；修改次数或模型后对照残差图和样本外行为。第 30 页的「完全相同」不能指前面的三次拟合：该图为五次，SSE 约 1.5199，三次 SSE 约 3.479。
2. 第 29 页提高第 5 点权重。接口的 `Weights` 值 $w_i$ 对应 $\sum_i w_i r_i^2$；若写成 $\|Wr\|_2^2$，$W$ 的对角元应是 $\sqrt{w_i}$。加权 100 不等于强制通过该点，且加权 SSE 不能直接与未加权 SSE 比较。
3. 课件比较多项式、二阶 Fourier、双高斯、3/2 阶有理式、自定义混合基及分片三次插值。第 32 页以截图方程为准，第 $k$ 项角度是 $k\omega x$，不是所有项共用 $\omega x$。已知 $\omega$ 时 Fourier 对系数线性；连 $\omega$ 一起拟合时不再是单个线性最小二乘。双高斯的中心/宽度、有理式的分母参数也改变模型形状；有理式外推要检查分母是否接近零。
4. 将第五个点从 5.02 改为 50.02 后，比较原最小二乘、确认异常后剔除、预平滑、`Robust='LAR'`。预平滑可能把单点异常扩散到邻点；LAR 的单点损失随残差绝对值线性增长，不是把异常点删除。零均值高斯噪声与离群污染是不同问题：独立同方差高斯误差下，最小二乘与最大似然相符，但它对任意离群点不稳健。第 42 页给出的函数只是教师对该样例的猜测，不是第 43 页未知数据的答案。

## 引导顺序：四轮，到自测入口为止

| 轮次 | 先讲再动手 | 通过证据 |
|---|---|---|
| W10.1 | 概率质量/密度/CDF、随机数状态；运行[分布与统计示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w10_distributions_demo.m)，改变 $N$ 和 $p$ | 用一次 `sum` 和一次 `binocdf` 交叉核对区间概率，并解释密度与概率的差别 |
| W10.2 | 按列统计、标准差归一化、协方差与相关；用同一脚本改变矩阵列 | 比较 `var(A,0)`、`var(A,1)`；指出为何常数列没有相关系数 |
| W10.3 | 设计矩阵、左除与 `polyfit/polyval`；运行[拟合示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w10_curve_fit_demo.m)，改一次次数 | 对齐两种实现的预测值；区别 2-范数、SSE 与最大绝对残差 |
| W10.4 | 权重、模型选择和离群诊断；用同一示范与 Curve Fitter 比较拟合 | 改变一个权重或插入异常点，说明哪条曲线更贴近未受污染的数据及依据 |

第 43 页的[三道第十周参考自测](file:///F:/MATLAB%20course/%E8%87%AA%E6%B5%8B/%E7%AC%AC%E5%8D%81%E5%91%A8%E5%8F%82%E8%80%83%E4%BD%9C%E4%B8%9A/README.md)不用交；第 44–45 页的[新麦穗推荐题](file:///F:/MATLAB%20course/%E4%BD%9C%E4%B8%9A/%E6%8E%A8%E8%8D%90%E9%A2%98_%E6%96%B0%E9%BA%A6%E7%A9%97/README.md)独立选做，不作必经关卡。第 46 页的课后反馈同样标为不用交。2026-11-12 四份指定 MAT 已补齐，路径和参考解核对见[[MATLAB/课程讲义/补充_第十周参考作业解读|第十周参考解读]]。此后接[[MATLAB/课程讲义/10B_第十周实验课|第十周实验课]]及[[MATLAB/课程讲义/11_MATLAB多项式运算与动态规划|第十一课]]；新资料不推进学习指针。

接口依据：[rng](https://www.mathworks.com/help/matlab/ref/rng.html)、[makedist](https://www.mathworks.com/help/stats/makedist.html)、[polyfit](https://www.mathworks.com/help/matlab/ref/polyfit.html)、[MathWorks 加权与稳健最小二乘](https://www.mathworks.com/help/curvefit/least-squares-fitting.html)。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
