---
title: SL边值问题研究入门计划
date: 2026-08-11
tags:
  - SL
  - learning-plan
  - teaching
aliases:
  - Sturm-Liouville 学习计划
  - SL 入门路线
---
# Sturm-Liouville 边值问题研究入门计划（12 周双主线）

本计划面向 **Sturm--Liouville (SL) 边值问题、盒约束谱极值优化与左定空间标度理论** 研究课题的入门阶段，设定为 **12 周双主线并行推进**的研究训练路线（在夯实正则/奇异 SL 基础谱理论的同时，推进两项具体研究主线）：

- **主线一（盒约束 $1\le\rho(x)\le R$ 下特征值间隙与比值极值问题）**：在正则 Sturm--Liouville 基础理论之上，紧扣纯盒约束可测密度（权函数）容许类
  $$
  \mathcal A_R=\left\{\rho\in L^\infty(a,b):1\le\rho(x)\le R\ \text{a.e. }x\in(a,b)\right\},
  $$
  系统研究特征值极值、相邻特征值间隙 $\lambda_{n+1}(\rho)-\lambda_n(\rho)$（重点为第一谱隙 $\lambda_2-\lambda_1$）以及在 **Dirichlet 边界条件**（或保证基态特征值 $\lambda_1(\rho)>0$ 的分离型边界条件）下特征值比值 $\lambda_n(\rho)/\lambda_1(\rho)$（重点为 $\lambda_2/\lambda_1$）的上下界极值问题，掌握特征值关于权函数 $\rho$ 的 Fréchet 方向导数、[Keller (1976)](https://epubs.siam.org/doi/10.1137/0131042) / Mahar--Willner (1976) 变分最优性条件、bang--bang 分段常值极值结构（极值权函数仅在 $\{1,R\}$ 两端取值，开关阈值为 $\Phi(x)=0$；注：若额外附加总质量积分约束 $\int_a^b\rho(x)\,dx=M$，则属于带 Lagrange 乘子 $\mu$ 的另一变分问题，其开关条件将平移为 $\Phi(x)-\mu\gtrless 0$，本主线默认讨论无积分约束的纯盒约束类 $\mathcal A_R$）。
- **主线二（指定移位 Krein 模型 $A_c = K_c$ 的左定空间标度 $\mathcal H_c^s$ 与稀疏多项式族完备性主线）**：在一般正定自伴算子 $A \ge cI > 0$ 生成抽象左定空间族 $\mathcal H_s = D(A^{s/2})$（第 10–11 章）的基础上，**所有关于“临界阈值 $s = 7/2$”“余有限删项闭包分类”与“两迹余维分类”的具体定量定理，均严格固定在区间 $[-1, 1]$ 上的移位 Krein 自伴算子模型**（详见 [[SL谱理论/讲义/项目文档映射表|项目文档映射表]] 与 [Jones--Littlejohn--Quintero Roba (2025)](https://doi.org/10.3390/axioms14020115)）：
  $$
  A_c = K_c = -\frac{d^2}{dx^2} + c \quad (c > 0\text{ 固定}), \qquad D(K_c) = \left\{f \in H^2(-1, 1) : f'(1) = f'(-1) = \frac{f(1) - f(-1)}{2}\right\},
  $$
  （等价地写为 $f'(1) - f'(-1) = 0$ 且 $f'(1) + f'(-1) = f(1) - f(-1)$，使得分部积分边界项 $-[f'\overline{g}]_{-1}^1 = -\frac{1}{2}(f(1)-f(-1))\overline{(g(1)-g(-1))}$ 共轭对称，$K_c$ 成为严格正定自伴算子），以及满足该齐次 Krein 边界条件的**显式指定稀疏多项式族** $\mathcal P_{\mathrm{sp}} = \{p_0, p_1\} \cup \{p_n\}_{n \in \mathcal I}$（其中指标集 $\mathcal I = \{n \in \mathbb N : n \ge 4\}$ 缺失 $n = 2, 3$，各生成元由显式二项公式固定为：
  $$
  p_0(x) = 1, \quad p_1(x) = x, \qquad p_{2m}(x) = x^{2m} - \frac{m}{m-1}x^{2m-2}, \quad p_{2m+1}(x) = x^{2m+1} - \frac{m}{m-1}x^{2m-1} \quad (m \ge 2),
  $$
  例如 $p_4(x) = x^4 - 2x^2, \, p_5(x) = x^5 - 2x^3, \, p_6(x) = x^6 - \frac{3}{2}x^4$，其对一切 $n \ge 4$ 均满足原点零迹 $\Gamma p_n = (p_n(0), p_n'(0)) = (0, 0)$；注意仅靠“次数为 $n$ 且满足 Krein 边界条件”不足以唯一锁定该族，如 $p_4(x)+1$ 亦满足边界条件却改变原点迹，故必须固定上述显式公式）。（注：不同算子与边界条件的成员门槛截然不同，例如标准 Dirichlet 算子 $A = I - d^2/dx^2$ 上常函数 $1$ 仅在 $s < 1/2$ 时属于 $D(A^{s/2})$；切不可脱离具体移位 Krein 模型将 $s = 7/2$ 泛化为任意 $A \ge cI$ 的普适常数！）同时，将主线一在 W9–W12 的盒约束谱极值问题（区分比值 $Q_2 = \lambda_2/\lambda_1$ 的 $2$ 开关点三段结构与一般谱隙 $D_n = \lambda_{n+1}-\lambda_n$ 的有限块约化、精确 $2n$ 开关点、Wronskian 负定性 $W < 0$ 及归一化块能量关系 $K = -2D$）与主线二在 W9–W12 的移位 Krein 左定标度三项核心结论各自独立对应。

## 一、 双主线逻辑架构与项目文档调用顺序

```
===========================================================================================
        12 周双主线并行研究训练路线（盒约束谱极值优化 × 左定空间标度 H^s 完备性）
===========================================================================================

  【主线一：正则理论与盒约束 1<=rho<=R 谱极值】      【主线二：奇异理论、左定空间标度 H^s 与完备性】
  ──────────────────────────────────────────      ──────────────────────────────────────────────
  W1-W2  物理建模 / 正则 SL / 初值解析性     ───►  W1-W2  加权空间 L^2_rho 与右定二次型基础
         Dirichlet 盒约束 1<=rho<=R 基准谱                 算子域与边值条件规范化
           │                                                │
           ▼                                                ▼
  W3-W4  Liouville 变换 / Prüfer 相位单调性  ───►  W3-W4  Sturm 比较定理、Wronskian 恒等式与
         阶跃权 (Bang-Bang) 相平面拼接超越方程             特征函数精确内部零点计数
           │                                                │
           ▼                                                ▼
  W5-W6  固定能量空间 H^1_0 上的紧算子 K_rho ───►  W5-W6  实正则参数 Green 函数与紧自伴预解算子 R_gamma
         L^\infty 弱*紧性与 ||K_{rho_k}-K_rho||->0         奇异端点 Weyl 极限点/极限圆 (LP/LC) 分类
           │                                                │
           ▼                                                ▼
  W7-W8  Rayleigh-Ritz / Feynman-Hellmann 导数 ──► W7-W8  Weyl 渐近相移公式与左定空间族 H_s = D(A^{s/2})
         开关函数 Phi(x) 与 Bang-Bang 极值充要性           从 L^2 完备性到能量空间 H_1 范数收敛
           │                                                │
           ▼                                                ▼
  W9-W10 谱隙 D_n 有限块约化与精确 2n 开关点   ───► W9-W10 移位 Krein 模型 K_c 与显式族 P_sp：
         Wronskian W<0、精确零点与块能量关系 K=-2D         H_c^2/H_c^3 完备性与单项式矩跳跃递推 (BVE-H2/H3)
           │                                                │
           ▼                                                ▼
  W11-12 盒约束比值/谱隙超越方程消元与综合复核 ──► W11-12 移位 Krein 左定标度 H_c^s 三大定量分类：
                                                           0<=s<7/2 稠密窗口与门槛、余有限删项与两迹分类
```

### 仓库内项目文档与讲义调用顺序

在执行本计划时，请严格按以下顺序调阅本仓库 `SL谱理论/讲义/` 下的配套讲义与索引文档：

1. **全局导航与符号校准**：先阅读 [[SL谱理论/讲义/00_SL谱理论讲义总览|00_SL谱理论讲义总览]]、[[SL谱理论/讲义书写计划|讲义体例与章节规划说明]] 与 [[SL谱理论/讲义/符号表|符号表]]，统一全书从 $n=1$ 起递增的谱编号约定与内积线性约定；对照 [[SL谱理论/讲义/Zettl参考映射|Zettl参考映射]] 明确各章在 [Anton Zettl《*Sturm-Liouville Theory*》](https://doi.org/10.1090/surv/121)中的对应章节。
2. **阶段一（第 1–4 周）经典 ODE 与振荡主线文档**：依次研读 [[SL谱理论/讲义/02_正则Sturm-Liouville问题|第 1 章：从物理问题到正则 SL 问题]] $\to$ [[SL谱理论/讲义/03_Liouville标准形|第 2 章：Liouville 标准形与 Prüfer 变换]] $\to$ [[SL谱理论/讲义/05_Sturm比较定理与零点交错|第 3 章：Sturm 比较定理与零点交错]]。
3. **阶段二（第 5–7 周）Hilbert 空间、Green 函数与完备性主线文档**：依次研读 [[SL谱理论/讲义/06_特征函数正交性与广义Fourier级数|第 4 章：Hilbert 空间中的正交几何]] $\to$ [[SL谱理论/讲义/07_自伴边界条件与Hilbert空间框架|第 5 章：一维 Sobolev 空间、算子域与边界形式]] $\to$ [[SL谱理论/讲义/09_Green函数预解式与紧性|第 6 章：Green 函数、紧预解式与自伴性]] $\to$ [[SL谱理论/讲义/10_完备性与Fourier收敛|第 7 章：紧自伴谱定理与特征函数完备性]]。
4. **阶段三（第 8–10 周）变分原理、方向导数与渐近分析主线文档**：重点精读 [[SL谱理论/讲义/08_特征值的变分刻画与单调性|第 8 章：变分原理、系数单调性与方向导数]] 与 [[SL谱理论/讲义/11_特征值渐近与Weyl公式|第 9 章：特征值渐近与 Weyl 公式]]（这两章是开展主线一盒约束 $1\le\rho(x)\le R$ 谱极值变分推导的核心理论引擎）。
5. **阶段四（第 11–12 周）算子幂、左定空间与前沿拓展文档**：调阅 [[SL谱理论/讲义/12_从L2展开到能量空间|第 10 章：从能量到算子幂]]、[[SL谱理论/讲义/21_右定算子与左定空间|第 11 章：左定空间与左定算子]]、[[SL谱理论/讲义/项目文档映射表|项目文档映射表]] 及 [[SL谱理论/讲义/27_现代左定理论的阅读入口|第 17 章：现代左定理论的阅读入口]]，并通过 [[SL谱理论/讲义/习题分类索引|习题分类索引]] 检索各章必做的主线习题。

## 二、 分阶段双主线研习内容、手工推导任务与读完判定标准

### 第一阶段（第 1–3 周）：正则 SL 模型、Prüfer 相位与盒约束问题建立

#### 1. 基础与主线二准备（正则 SL 基础与极坐标相平面）
- **物理建模与正则问题定义**：掌握弹性细杆欧拉屈曲、非均匀弦横向振动导出的二阶特征值方程
  $$
  -(p(x)y')'+q(x)y=\lambda \rho(x)y,\qquad x\in(a,b),
  $$
  理解分离型边界条件 $A_1 y(a)+A_2(py')(a)=0$、$B_1 y(b)+B_2(py')(b)=0$ 的角度化规范表示与物理保守意义。
- **Liouville 变换与 Prüfer 极坐标变换**：掌握自变量光学长度拉伸 $s(x)=\int_a^x\sqrt{\rho(t)/p(t)}\,dt$ 与振幅调制，推导 Prüfer 代换 $p(x)y'=R\cos\theta,\ y=R\sin\theta$ 下的一阶相位方程
  $$
  \theta'(x,\lambda)=\frac{1}{p(x)}\cos^2\theta+\bigl(\lambda\rho(x)-q(x)\bigr)\sin^2\theta,
  $$
  严格证明右端点相位 $\theta(b,\lambda)$ 关于实谱参数 $\lambda$ 的严格单调递增性，以及穿过 $\theta=k\pi$ 时的单向锁定性质。

#### 2. 主线一（盒约束 $1\le\rho(x)\le R$ 目标设定、边界条件约定与分段常值拼接）
- **盒约束容许类、Dirichlet 边界约定与平凡比较界**：针对标准弦振动模型 $-y''=\lambda\rho(x)y$（$x\in(0,1)$），明确盒约束容许集 $\mathcal A_R=\{\rho\in L^\infty(0,1):1\le\rho(x)\le R\text{ a.e.}\}$。
  - **边界条件与正基态前提**：在讨论特征值比值 $\lambda_n(\rho)/\lambda_1(\rho)$ 时，**主线默认固定两端 Dirichlet 边界条件 $y(0)=y(1)=0$**（或使第一特征值满足一致正下界 $\lambda_1(\rho)\ge\lambda_1(R)>0$ 的分离型边界条件）。此时由比较原理立得全体特征值的逐项正夹逼界：
    $$
    0<\frac{\lambda_n(1)}{R}=\lambda_n(R)\le\lambda_n(\rho)\le\lambda_n(1)\qquad(\forall n\ge 1),
    $$
    并由此获得特征值比值的粗界 $\frac{1}{R}\frac{\lambda_n(1)}{\lambda_1(1)}\le\frac{\lambda_n(\rho)}{\lambda_1(\rho)}\le R\frac{\lambda_n(1)}{\lambda_1(1)}$，理解为何寻求**精确**极值必须研究非均匀的分段常值（bang--bang）权函数。
  - **Neumann 零模态警示**：若改为两端纯 Neumann 边界条件 $y'(0)=y'(1)=0$（且 $q\equiv 0$），则对一切 $\rho\in\mathcal A_R$ 恒有基态特征值 $\lambda_1(\rho)\equiv 0$（对应常值特征函数 $y_1(x)\equiv c$），此时比值 $\lambda_n(\rho)/\lambda_1(\rho)$ 分母为零而无定义！若在 Neumann 边界下讨论正特征值比值，必须先在加权正交补空间 $\{u\in H^1(0,1):\int_0^1\rho u\,dx=0\}$ 上扣除零模态，将目标重新定义为前两个正特征值之比 $\lambda_3(\rho)/\lambda_2(\rho)$。
- **两段与三段阶跃权函数的相平面拼接**：当 $\rho(x)$ 在 $(0,1)$ 上取两段或对称三段常值 $\{1,R\}$ 时，在跳跃点 $x=x_0$ 处利用 $y$ 与 $y'$ 的连续性条件，推导特征值满足的超越方程及 Prüfer 相位角斜率折断关系。

#### 3. 手工推导任务（必做）
1. 独立完成 [[SL谱理论/讲义/02_正则Sturm-Liouville问题|第 1 章]] 主线习题 1.4–1.7，手推验证 Lagrange 恒等式与实特征值性质。
2. 独立完成 [[SL谱理论/讲义/03_Liouville标准形|第 2 章]] 主线习题 2.3、2.4、2.6–2.8，完整手推 Prüfer 相位对参数 $\lambda$ 的偏导数公式 $\frac{\partial\theta}{\partial\lambda}(b,\lambda)=\frac{1}{R(b)^2}\int_a^b\rho(x)y(x,\lambda)^2\,dx>0$。
3. 对称三段常值密度计算：在 $[0,1]$ 上取对称阶跃权函数（两端区间 $[0,\alpha]\cup[1-\alpha,1]$ 取 $\rho=1$，中间区间 $(\alpha,1-\alpha)$ 取 $\rho=R$，或反之），手工写出 Dirichlet 边值条件下偶对称基频 $\lambda_1$ 与奇对称二阶频率 $\lambda_2$ 满足的超越方程。

#### 4. 读完判定标准
- 能合上讲义默写 Prüfer 相位方程与幅值方程，并解释为何 $\theta(x,\lambda)$ 在达到 $k\pi$ 处必定满足 $\theta'(x_0)=1/p(x_0)>0$（从而不可能向下倒退穿过 $k\pi$）。
- 能清晰说明在可测有界权函数 $1\le\rho(x)\le R$（不必连续）下，Carathéodory 意义下的绝对连续解 $y,py'\in AC[a,b]$ 如何保持 Prüfer 相位单调性与跳跃点斜率连接条件。

---

### 第二阶段（第 4–6 周）：Sturm 比较定理、固定能量空间紧算子与极值存在性

#### 1. 基础与主线二准备（振荡理论、算子域与 Green 预解式）
- **Sturm 比较定理与分离定理**：利用 Wronskian 微分不等式证明 Sturm 比较定理与线性无关解的零点交错定理，掌握第 $n$ 个特征函数 $y_n$ 在 $(a,b)$ 内恰有 $n-1$ 个简单零点的节点计数定理。
- **加权 Hilbert 空间与一维 Sobolev 算子域**：在加权空间 $L^2_\rho(a,b)$（内积 $(f,g)_\rho=\int_a^b f(x)\overline{g(x)}\rho(x)\,dx$）中，借助一维 Sobolev 空间 $H^1(a,b)$ 与 $H^2(a,b)$ 刻画微分算子 $A=\rho^{-1}L$ 的自伴算子域 $D(A)$ 与能量二次型域 $V$。
- **Green 函数与预解算子 $R_\zeta=(A-\zeta I)^{-1}$**：当正则点 $\zeta\in\mathbb C\setminus\sigma(A)$ 不是特征值时，利用左、右边界基本解 $u_a,u_b$ 及其常数准 Wronskian 显式构造 Green 核 $G(x,t;\zeta)$。
  > [!warning] 预解算子自伴性的参数条件（审核重点 C04）
  > 预解积分算子
  > $$
  > (R_\zeta f)(x)=\bigl((A-\zeta I)^{-1}f\bigr)(x)=\int_a^b G(x,t;\zeta)f(t)\rho(t)\,dt
  > $$
  > 对任意复正则点 $\zeta\in\mathbb C\setminus\sigma(A)$ 都是 $L^2_\rho(a,b)$ 上的有界**紧算子**（Hilbert--Schmidt 算子），且其伴随算子满足一般关系
  > $$
  > R_\zeta^* = R_{\overline\zeta}.
  > $$
  > 因此，**唯有当正则参数取实数 $\zeta\in\mathbb R\setminus\sigma(A)$ 时（例如取低于谱下界的实数 $\zeta<\lambda_1$），预解算子 $R_\zeta$ 才是有界紧自伴算子**（当 $\operatorname{Im}\zeta\neq 0$ 时，$R_\zeta$ 的特征值 $(\lambda_n-\zeta)^{-1}$ 非实，此时 $R_\zeta$ 是紧正规算子而非自伴算子）。在应用紧自伴算子 Hilbert--Schmidt 谱定理证明本征系完备性时，必须显式固定实正则参数 $\zeta=\gamma\in\mathbb R\setminus\sigma(A)$。

#### 2. 主线一（可测权盒约束下的能量空间紧算子构造与弱*极值存在性）
- **可测权 $1\le\rho(x)\le R$ 下的预解算子紧性**：确认当权函数 $\rho\in\mathcal A_R$ 仅为有界可测函数（不要求连续）时，加权范数 $\|\cdot\|_\rho$ 与标准 $L^2(a,b)$ 范数满足双向常数控制（$\|f\|_{L^2}\le\|f\|_\rho\le\sqrt{R}\|f\|_{L^2}$），且在实正则点处 Green 积分算子 $R_\gamma$ 依然是 $L^2_\rho(a,b)$ 上的紧自伴算子，故离散单重实谱 $\lambda_1(\rho)<\lambda_2(\rho)<\cdots\to+\infty$ 与完备正交规范特征基对一切 $\rho\in\mathcal A_R$ 均严格成立。
- **盒约束集 $\mathcal A_R$ 的弱*紧性与固定能量空间 $H_0^1$ 上的算子范数收敛（极值存在性严格证明）**：
  由 Banach--Alaoglu 定理，盒约束集 $\mathcal A_R=\{\rho\in L^\infty(0,1):1\le\rho(x)\le R\text{ a.e.}\}$ 在 $L^\infty(0,1)=\bigl(L^1(0,1)\bigr)^*$ 的弱*拓扑下是紧凸集。为证明当 $\rho_k\stackrel{w^*}{\rightharpoonup}\rho$ 时特征值 $\lambda_n(\rho_k)\to\lambda_n(\rho)$，必须注意泛函分析中的一个关键陷阱：
  > [!important] 为什么不能在 $L^2(0,1)$ 上直接断言 $R_{\rho_k}(0)=T M_{\rho_k}$ 按算子范数收敛？
  > 在标准 $L^2(0,1)$ 空间上，若记 Dirichlet 积分算子为 $(Th)(x)=\int_0^1 G_0(x,t)h(t)\,dt$、乘法算子为 $(M_\rho f)(t)=\rho(t)f(t)$，则 $R_\rho(0)=T M_\rho$ 将乘法算子 $M_\rho$ 置于**右端（输入端）**。由于 $L^2(0,1)$ 的单位球在 $L^2$ 强拓扑下不紧，当 $\rho_k\stackrel{w^*}{\rightharpoonup}\rho$ 时，$T M_{\rho_k}$ 在 $\mathcal L(L^2(0,1))$ 中**一般不按算子范数收敛**！例如取高频振荡权 $\rho_k(x)=2+\sin(k\pi x)\stackrel{w^*}{\rightharpoonup}\rho(x)\equiv 2$ 及单位球函数 $f_k(x)=\sqrt{2}\sin(k\pi x)$，则 $(\rho_k-2)f_k(x)=\sqrt{2}\sin^2(k\pi x)=\frac{\sqrt{2}}{2}(1-\cos(2k\pi x))$ 含有非零常值分量 $\frac{\sqrt{2}}{2}$，经 $T$ 作用后在 $L^2(0,1)$ 中收敛于 $\frac{\sqrt{2}}{2}T(1)\neq 0$，故 $\|T M_{\rho_k}-T M_2\|_{\mathcal L(L^2)}\not\to 0$。
  >
  > **正确的严格证明路径（固定能量空间 $H_0^1(0,1)$ 上的对称双线性型表示算子 $K_\rho$）**：
  > 1. 固定与权函数 $\rho$ 无关的能量 Hilbert 空间 $V=H_0^1(0,1)$（配备内积 $(u,v)_{H_0^1}=\int_0^1 u'(x)\overline{v'(x)}\,dx$，或一般正定算子能量内积）。对每个 $\rho\in\mathcal A_R$，由 Riesz 表示定理定义有界自伴正算子 $K_\rho:H_0^1(0,1)\to H_0^1(0,1)$ 如下：
  >    $$
  >    (K_\rho u,v)_{H_0^1}=\int_0^1 \rho(x)u(x)\overline{v(x)}\,dx\qquad\bigl(\forall u,v\in H_0^1(0,1)\bigr).
  >    $$
  >    由变分原理，$u\in H_0^1(0,1)\setminus\{0\}$ 是 $-u''=\lambda\rho u$ 的特征函数当且仅当 $K_\rho u=\mu u$（其中 $\mu=1/\lambda$），即 $K_\rho$ 的正特征值序列恰为 $\mu_n(\rho)=\frac{1}{\lambda_n(\rho)}$（$n\ge 1$）。
  > 2. 由一维 Sobolev 紧嵌入定理（Rellich--Kondrachov 定理），嵌入映射 $H_0^1(0,1)\hookrightarrow C([0,1])$ 是**紧算子**。因此，$H_0^1(0,1)$ 的闭单位球 $B_1=\{u\in H_0^1:\|u\|_{H_0^1}\le 1\}$ 在一致收敛空间 $C([0,1])$ 中是相对紧集（等度连续且一致有界），从而乘积集合 $\mathcal F=\{u\overline{v}:u,v\in B_1\}$ 在 $C([0,1])$（进而也在 $L^1(0,1)$）中是**相对紧集**。
  > 3. 当 $\rho_k\stackrel{w^*}{\rightharpoonup}\rho$ 于 $L^\infty(0,1)=\bigl(L^1(0,1)\bigr)^*$ 时，弱*收敛在 $L^1(0,1)$ 的任意相对紧子集 $\mathcal F$ 上必为**一致收敛**（由有限 $\varepsilon$-网覆盖即证）！因此：
  >    $$
  >    \|K_{\rho_k}-K_\rho\|_{\mathcal L(H_0^1)}
  >    =\sup_{u,v\in B_1}\left|\bigl((K_{\rho_k}-K_\rho)u,v\bigr)_{H_0^1}\right|
  >    =\sup_{u,v\in B_1}\left|\int_0^1\bigl(\rho_k(x)-\rho(x)\bigr)u(x)\overline{v(x)}\,dx\right|\longrightarrow 0\quad(k\to\infty).
  >    $$
  > 4. 在固定 Hilbert 空间 $H_0^1(0,1)$ 上，由紧自伴算子特征值的 Weyl 范数扰动不等式 $|\mu_n(\rho_k)-\mu_n(\rho)|\le\|K_{\rho_k}-K_\rho\|_{\mathcal L(H_0^1)}\to 0$，立即推出每个特征值泛函 $\rho\mapsto\lambda_n(\rho)=1/\mu_n(\rho)$、相邻谱隙 $\lambda_{n+1}(\rho)-\lambda_n(\rho)$ 及（在 Dirichlet 边界 $\lambda_1(\rho)\ge\pi^2/R>0$ 下的）比值 $\lambda_n(\rho)/\lambda_1(\rho)$ 在弱*拓扑下连续，从而在紧集 $\mathcal A_R$ 上严格达到极大值与极小值。

#### 3. 手工推导任务（必做）
1. 完成 [[SL谱理论/讲义/05_Sturm比较定理与零点交错|第 3 章]] 主线习题 3.1、3.3、3.4，手推证明 Sturm 分离定理。
2. 完成 [[SL谱理论/讲义/07_自伴边界条件与Hilbert空间框架|第 5 章]] 主线习题 5.2–5.4 与 [[SL谱理论/讲义/09_Green函数预解式与紧性|第 6 章]] 主线习题 6.1、6.3、6.5，独立写出实参数 $\gamma\in\mathbb R\setminus\sigma(A)$ 下实对称 Green 核 $G(x,t;\gamma)=G(t,x;\gamma)$ 的构造过程及 $R_\gamma^*=R_\gamma$ 的验证。
3. 手推证明：设 $B_1$ 为 $H_0^1(0,1)$ 的闭单位球，利用 Arzelà--Ascoli 定理证明 $\mathcal F=\{uv:u,v\in B_1\}$ 在 $L^1(0,1)$ 中相对紧，并由此完整写出 $\rho_k\stackrel{w^*}{\rightharpoonup}\rho\implies\|K_{\rho_k}-K_\rho\|_{\mathcal L(H_0^1)}\to 0\implies\lambda_n(\rho_k)\to\lambda_n(\rho)$ 的证明。

#### 4. 读完判定标准
- 能准确写出 Green 核在 $x=t$ 处的导数跃度条件 $\lim_{x\to t^+}p(x)\partial_x G(x,t)-\lim_{x\to t^-}p(x)\partial_x G(x,t)=-1$，并说明为何构造紧自伴预解算子必须取实参数 $\zeta\in\mathbb R\setminus\sigma(A)$。
- 能清晰解释为何 $R_{\rho_k}(0)=TM_{\rho_k}$ 在 $L^2$ 上不按算子范数收敛，而固定能量空间 $H_0^1$ 上的算子 $K_{\rho_k}$ 按算子范数收敛。

---

### 第三阶段（第 7–9 周）：紧自伴谱定理、Feynman--Hellmann 导数与左定空间标度入门

#### 1. 基础与主线二推进（本征展开、Weyl 渐近相移与左定空间族 $\mathcal H_s$）
- **紧自伴算子谱定理与振荡定理**：完成 [[SL谱理论/讲义/10_完备性与Fourier收敛|第 7 章]] 中由实预解算子 $R_\gamma$ 的紧自伴谱定理导出特征函数系 $\{e_n\}_{n=1}^\infty$ 在 $L^2_\rho(a,b)$ 中完备性的证明，并结合 Prüfer 相位锁定第 $n$ 个特征函数恰有 $n-1$ 个内部零点。
- **Rayleigh 商与 Courant--Fischer 极小极大原理**：在能量空间 $V$ 上建立 Rayleigh 商
  $$
  R(y;\rho)=\frac{\int_a^b\bigl(p(x)|y'(x)|^2+q(x)|y(x)|^2\bigr)\,dx+\text{边界能量项}}{\int_a^b |y(x)|^2\rho(x)\,dx},
  $$
  掌握第 $n$ 个特征值的极小极大刻画 $\lambda_n(\rho)=\min_{\dim E=n}\max_{y\in E\setminus\{0\}}R(y;\rho)$ 与极大极小刻画。
- **高阶特征值的 Weyl 渐近公式与边界相移辨析**：
  > [!warning] 分离型边界条件下的 Weyl 渐近主阶与余项相移（审核重点 C03）
  > 设光学长度为 $c=\int_a^b\sqrt{\rho(x)/p(x)}\,dx$，全体特征值统一按全书约定从指标 $n=1$ 起递增编号为 $\lambda_1<\lambda_2<\cdots$。
  > 1. **普适主阶渐近**：对**任意**正则分离型边界条件，高阶特征值均满足主阶 Weyl 渐近律：
  >    $$
  >    \lambda_n\sim\left(\frac{n\pi}{c}\right)^2\qquad(n\to\infty),
  >    \qquad\text{更精确地有 }\sqrt{\lambda_n}=\frac{n\pi}{c}+O(1).
  >    $$
  > 2. **带 $O(1)$ 余项的精细渐近与边界相移**：若进一步写出平方展开后的 $O(1)$ 级余项，则**决不能**将所有分离型边界条件笼统地写成同一个无相移公式 $\lambda_n=(n\pi/c)^2+O(1)$！在光滑系数 $p,q,\rho\in C^2[a,b]$ 下，Prüfer 相位跨度取决于两端是否为 Dirichlet 端（即角度表示中是否满足 $\sin\alpha=0$ 或 $\sin\beta=0$）：
  >    - **两端均为 Dirichlet 条件（$\sin\alpha=\sin\beta=0$）**：无相移，成立
  >      $$
  >      \lambda_n=\left(\frac{n\pi}{c}\right)^2+O(1)\qquad(n\ge 1);
  >      $$
  >    - **一端 Dirichlet、另一端非 Dirichlet（如左固定右自由/Robin，恰有一端满足 $\sin=0$）**：存在半整数相移 $-1/2$，成立
  >      $$
  >      \lambda_n=\left(\frac{(n-\tfrac12)\pi}{c}\right)^2+O(1)=\frac{n^2\pi^2}{c^2}-\frac{n\pi^2}{c^2}+O(1)\qquad(n\ge 1);
  >      $$
  >    - **两端均非 Dirichlet 条件（$\sin\alpha\neq 0$ 且 $\sin\beta\neq 0$，如两端 Neumann 或 Robin）**：由于从 $n=1$ 起编号包含了零节点基态，存在整数相移 $-1$，成立
  >      $$
  >      \lambda_n=\left(\frac{(n-1)\pi}{c}\right)^2+O(1)=\frac{n^2\pi^2}{c^2}-\frac{2n\pi^2}{c^2}+O(1)\qquad(n\ge 1).
  >      $$
  >    可以看到，在非 Dirichlet 情形下，$\lambda_n-(n\pi/c)^2$ 含有显著的 $O(n)$ 一阶相移项，唯有计入边界相移 $\nu\in\{0,1/2,1\}$ 写成 $\lambda_n=\bigl((n-\nu)\pi/c\bigr)^2+O(1)$，余项才真正达到 $O(1)$ 阶。

#### 2. 主线一（Feynman--Hellmann 导数、Bang--Bang 极值原理与谱隙/比值）
- **特征值对权函数微扰的 Fréchet 方向导数**：因为正则分离型问题的每个特征值 $\lambda_n(\rho)$ 都是**单重**特征值，设 $y_n(x;\rho)$ 是对应的归一化实特征函数（满足 $\int_a^b\rho(x)y_n(x)^2\,dx=1$），则映射 $\rho\mapsto\lambda_n(\rho)$ 在 $L^\infty(a,b)$ 正锥开集上实解析，且沿任意有界可测扰动方向 $\eta\in L^\infty(a,b)$ 的一阶方向导数（Feynman--Hellmann 公式）为：
  $$
  \left.\frac{d}{d\varepsilon}\lambda_n(\rho+\varepsilon\eta)\right|_{\varepsilon=0}
  =\langle D\lambda_n(\rho),\eta\rangle
  =-\lambda_n(\rho)\int_a^b y_n(x;\rho)^2\eta(x)\,dx.
  $$
- **相邻谱隙与特征值比值的变分导数与开关函数**：
  利用单模态导数公式，立即导出纯盒约束 $\rho\in\mathcal A_R$ 下两类核心目标泛函的梯度密度（即**开关函数 / Switching Function** $\Phi(x)$）：
  1. **相邻特征值间隙 $G_n(\rho)=\lambda_{n+1}(\rho)-\lambda_n(\rho)$**：
     $$
     \langle DG_n(\rho),\eta\rangle
     =\int_a^b\underbrace{\bigl[\lambda_n(\rho)y_n(x)^2-\lambda_{n+1}(\rho)y_{n+1}(x)^2\bigr]}_{\Phi_{\mathrm{gap}}(x)}\eta(x)\,dx;
     $$
  2. **Dirichlet 边界下的特征值比值 $Q_n(\rho)=\frac{\lambda_n(\rho)}{\lambda_1(\rho)}$**（这里 $\lambda_1(\rho)>0$，特别地取 $n=2$ 即二阶与基频之比 $\lambda_2(\rho)/\lambda_1(\rho)$）：
     $$
     \langle DQ_n(\rho),\eta\rangle
     =\frac{\lambda_n(\rho)}{\lambda_1(\rho)}\int_a^b\underbrace{\bigl[y_1(x)^2-y_n(x)^2\bigr]}_{\Phi_{\mathrm{ratio}}(x)}\eta(x)\,dx.
     $$
- **Bang--Bang 极值结构与开关点（Switching Points）分析**：
  若 $\rho^*\in\mathcal A_R=\{1\le\rho\le R\}$ 使目标泛函达到极大值，则对一切容许扰动 $\eta=\rho-\rho^*$（$\rho\in\mathcal A_R$）必有一阶必要条件 $\int_a^b\Phi(x)(\rho(x)-\rho^*(x))\,dx\le 0$。由此立得纯盒约束下的逐点最优性条件：
  $$
  \rho^*(x)=
  \begin{cases}
  R,&\text{若 }\Phi(x)>0,\\
  1,&\text{若 }\Phi(x)<0.
  \end{cases}
  $$
  由于特征函数 $y_1,y_n$ 满足二阶微分方程，开关函数 $\Phi(x)$ 的零点集合不可能在任何正测度子集上恒为零，因此**最优权函数 $\rho^*(x)$ 几乎处处只取上下界极端值 $\{1,R\}$**（即 **bang--bang 分段常值结构**），且其从 $1$ 跳变到 $R$ 的**开关点**恰好是两条特征函数曲线 $\lambda_{n+1}y_{n+1}^2=\lambda_n y_n^2$（或 $y_n^2=y_1^2$）的交点。
  - **文献结论与待研究课题的严格区分**：对于 Dirichlet 边界下**特征值比值 $\lambda_2(\rho)/\lambda_1(\rho)$** 的极值问题，[Keller (1976)](https://epubs.siam.org/doi/10.1137/0131042) 与 Mahar--Willner (1976) 建立了盒约束 $1\le\rho(x)\le R$ 下对称三段常值极值密度（恰含 $2$ 个内部开关点）的经典理论，Ashbaugh--Benguria (1993) 进一步给出了一般特征值比值的精确界，而 [Huang (1999)](https://scispace.com/pdf/on-the-eigenvalue-ratio-for-vibrating-strings-24j6us65dk.pdf) 则在回顾上述盒约束基准结果的基础上重点研究了凹密度与对称单阱/单垒（single-well / single-barrier）密度类的比值 $\lambda_2/\lambda_1$ 极值；至于盒约束下**第一谱隙 $G_1(\rho)=\lambda_2(\rho)-\lambda_1(\rho)$** 的开关函数 $\Phi_{\mathrm{gap}}(x)=\lambda_1 y_1^2-\lambda_2 y_2^2$ 的精确开关点个数上界与极值对称性证明，则是本主线第四阶段需利用 Prüfer 相平面轨迹自行展开的**研究核验任务**（不可直接将 $\lambda_2-\lambda_1$ 的结论归于 Huang (1999)）。

#### 3. 手工推导任务（必做）
1. 完成 [[SL谱理论/讲义/08_特征值的变分刻画与单调性|第 8 章]] 主线习题 8.1、8.2、8.4 与 [[SL谱理论/讲义/11_特征值渐近与Weyl公式|第 9 章]] 主线习题 9.1、9.2、9.4。
2. 手工完整推导特征值关于权函数 $\rho$ 的 Feynman--Hellmann 公式 $\langle D\lambda_n(\rho),\eta\rangle=-\lambda_n\int_a^b y_n^2\eta\,dx$（分别用“对特征方程求变分再与 $y_n$ 作内积消去 $\delta y_n$”和“对 Rayleigh 商求方向导数”两种方法验证）。
3. 针对特征值比值 $Q_2(\rho)=\lambda_2(\rho)/\lambda_1(\rho)$，手工推导开关函数 $\Phi_{\mathrm{ratio}}(x)=y_1(x)^2-y_2(x)^2$ 在 $(0,1)$（Dirichlet 边界）上不可能在任何子区间上恒为零：假设在某开子区间 $I\subset(0,1)$ 上 $y_1(x)=\pm y_2(x)$，代入各自方程 $-y_k''=\lambda_k\rho(x)y_k$（$k=1,2$）相减导出 $(\lambda_2-\lambda_1)\rho(x)y_1(x)=0$ 于 $I$，从而与 $\lambda_2>\lambda_1$、$\rho\ge 1$ 及 $y_1$ 无内部零点矛盾！

#### 4. 读完判定标准
- 能独立写出单特征值 $\lambda_n(\rho)$、相邻谱隙 $\lambda_{n+1}-\lambda_n$ 与比值 $\lambda_n/\lambda_1$ 关于权函数 $\rho$ 的方向导数公式及对应的开关函数 $\Phi(x)$。
- 能清晰解释为何在一般分离型边界条件下，$n=1$ 起编号的 Weyl 渐近公式必须写成 $\lambda_n=\bigl((n-\nu)\pi/c\bigr)^2+O(1)$（$\nu\in\{0,1/2,1\}$），并能举例说明两端 Neumann 条件在 $[0,\pi]$ 上 $\lambda_n=(n-1)^2=n^2-2n+1$ 为何与无相移的 $n^2+O(1)$ 不相容。

---

### 第四阶段（第 10–12 周）：移位 Krein 左定标度 $\mathcal H_c^s$ 完备性分类与盒约束极值有限块约化

#### 1. 主线二核心攻坚（指定移位 Krein 模型 $A_c=K_c$、显式稀疏多项式族 $\mathcal P_{\mathrm{sp}}$ 与三项定量定理核验）
- **奇异 SL 分类与抽象左定空间标度基础**：掌握 Weyl 极限圆（LC）/极限点（LP）分类定理（[Zettl (2005)](https://doi.org/10.1090/surv/121) 第 7、10 章），并在一般正定自伴算子 $A \ge cI > 0$ 下建立第 $s$ 阶左定 Hilbert 空间 $\mathcal H_s = D(A^{s/2})$（[[SL谱理论/讲义/12_从L2展开到能量空间|第 10 章]]、[[SL谱理论/讲义/21_右定算子与左定空间|第 11 章]]）。
- **固定具体模型假设（第 12–17 章及 [[SL谱理论/讲义/项目文档映射表|项目文档映射表]] 的精确作用域）**：
  在进入第 12–17 章的具体完备性与门槛定理时，必须首先**固定如下四个模型要素**（切勿将具体模型的数字直接套用到一般 $A \ge cI$ 上；例如在 $(0, \pi)$ 的 Dirichlet 模型 $A = I - d^2/dx^2$ 中，关于单位正交基 $e_n(x) = \sqrt{2/\pi}\sin(nx)$，常函数 $1$ 的奇数项系数为 $\frac{2\sqrt{2/\pi}}{n}$（在 $(0,1)$ 上关于 $e_n(x) = \sqrt{2}\sin(n\pi x)$ 则为 $\frac{2\sqrt{2}}{n\pi}$），其 $\mathcal H_s$ 范数平方级数主阶均为 $\sum_{n\text{ 奇}} n^{2s-2}$，仅当 **$s < 1/2$** 时收敛！）：
  1. **底空间与移位 Krein 算子 $A_c = K_c$**：在 $L^2(-1, 1)$ 上固定正移位参数 $c > 0$，取微分算子式 $K_c f = -f'' + c f$；
  2. **耦合 Krein 自伴边界条件**：算子域 $D(K_c)$ 由满足耦合 Krein 边界条件（参见 [[SL谱理论/讲义/22_边界条件与Krein模型|第 12 章]] 与 [Jones--Littlejohn--Quintero Roba (2025) 式 (4)](https://www.mdpi.com/2075-1680/14/2/115)）
     $$f'(1) = f'(-1) = \frac{f(1) - f(-1)}{2} \qquad \bigl(\text{等价于 } f'(1) - f'(-1) = 0, \; f'(1) + f'(-1) = f(1) - f(-1)\bigr)$$
     的 $f \in H^2(-1, 1)$ 组成，其第一左定空间 $\mathcal H_c^1 = D(K_c^{1/2}) = H^1[-1, 1]$ 的内积为 $(f,g)_{1,c} = -\frac{1}{2}(f(1)-f(-1))\overline{(g(1)-g(-1))} + \int_{-1}^1 (f'\overline{g'} + c f\overline{g})\,dx$，第 $s$ 阶左定空间为 $\mathcal H_c^s = D(K_c^{s/2})$；
  3. **显式指定稀疏多项式族 $\mathcal P_{\mathrm{sp}}$ 与指标集**：固定生成元公式（参见 [[SL谱理论/讲义/23_正交多项式与Krein-Sobolev系|第 13 章]] 与 [Jones--Littlejohn--Quintero Roba (2025) §6](https://www.mdpi.com/2075-1680/14/2/115)）
     $$p_0(x) = 1, \quad p_1(x) = x, \qquad p_{2m}(x) = x^{2m} - \frac{m}{m-1}x^{2m-2}, \quad p_{2m+1}(x) = x^{2m+1} - \frac{m}{m-1}x^{2m-1} \qquad (m \ge 2),$$
     令指定稀疏多项式族为 $\mathcal P_{\mathrm{sp}} = \{p_0, p_1\} \cup \{p_n(x)\}_{n \in \mathcal I}$，其中指标集 $\mathcal I = \{4, 5, 6, \dots\}$ 缺失了次数 $2$ 和 $3$（具体地，$p_4(x) = x^4 - 2x^2, \, p_5(x) = x^5 - 2x^3, \, p_6(x) = x^6 - \frac{3}{2}x^4$，其张成空间为满足齐次 Krein 边界条件的多项式空间 $\mathcal P_K = \operatorname{span}(\mathcal P_{\mathrm{sp}})$，且每个 $p_n\ (n \ge 4)$ 均满足原点零迹 $p_n(0) = p_n'(0) = 0$）；
  4. **三项不同定量结论的严格区分与逐项核验（对应 `BVE-H2` 至 `BVE-MOM`）**：
     - **结论一（非负阶成员性门槛 $s = 7/2$ 与分数阶稠密窗口 `BVE-H2/H3/FRAC`）**：在移位 Krein 左定标度 $\mathcal H_c^s$ 中，原稀疏族 $\mathcal P_{\mathrm{sp}}$ 对一切 **$0 \le s < 7/2$** 均属于 $\mathcal H_c^s$ 且在 $\mathcal H_c^s$ 中**稠密（完备）**（其中 $\mathcal H_c^2, \mathcal H_c^3$ 的完备性通过算子幂等距降阶与单项式矩的二阶代数跳跃递推关系证明）；当 **$s \ge 7/2$** 时，原稀疏族中所有非仿射多项式 $p_n\ (n \ge 4)$ 因二阶迭代 Krein 边界残差 $\mathcal B p_n \neq 0$（如 $p_4'' = 12x^2 - 4$ 在 $\pm 1$ 处导数为 $\pm 24 \neq 0$，违反 $K_c p_4 \in D(K_c)$）而脱离 $\mathcal H_c^s$，但经残差配平后的相容组合（如 $p_6 - \frac{7}{2}p_4$）连同四维端点迹映射 $T$ 的有界右逆修正 $R$ 仍构成四阶算子域 $D(K_c^2) = \mathcal H_c^4$ 的图范数核心；
     - **结论二（第二左定空间 $\mathcal H_c^2$ 中余有限删项闭包与非基不稳定性 `BVE-COF`）**：在**第二左定空间 $\mathcal H_c^2$** 中，从上述显式族 $\mathcal P_{\mathrm{sp}}$ 中删去任意有限个成员后所得余有限子族仍全空间稠密，当且仅当保留了仿射基元 $\{p_0, p_1\} = \{1, x\}$（正是因为 $n \ge 4$ 的生成元 $p_n$ 均满足 $p_n(0) = p_n'(0) = 0$，一旦删去 $1$ 或 $x$ 就会丢失原点处的值或导数自由度！）；由于删去单个生成元 $p_4$ 后剩余子族仍在 $\mathcal H_c^2$ 中稠密，原稀疏族 $\mathcal P_{\mathrm{sp}}$（及其任意非零逐项缩放族）在 $\mathcal H_c^2$ 中**既不是 Schauder 基，也不是 Riesz 基**（唯有对其做 Gram--Schmidt 正交化后的 Krein--Sobolev 正交多项式系才构成正交基）；
     - **结论三（含完整高次单项式尾部的两迹余维分类 `BVE-PROJ/MOM`）**：在**第二左定空间 $\mathcal H_c^2$** 中，针对保留了某阶 $L$ 以上全部高次生成元尾部的受约束多项式子族，通过原点处的二维点迹映射 $\Gamma f = (f(0), f'(0))$ 与矩可表示性判据，由**两迹分类定理**精确刻画其闭包的有限余维正交障碍空间（至于无穷删项 Müntz 型问题与 $m \ge 3$ 更高阶左定空间的迹分类，则列为后续延伸研究任务）。

#### 2. 主线一核心攻坚（盒约束 $1\le\rho(x)\le R$ 下特征值比值与相邻谱隙极值的分别刻画及块能量关系）
- **特征值比值 $Q_n$ 与相邻谱隙 $D_n$ 的极值结构区分及项目证明义务复核**：
  在完成阶段三的一阶变分导数与 bang--bang 定性定理后，第 9–12 周在盒约束 $\rho \in \mathcal A_R = \{1 \le \rho(x) \le R\}$ 主线上，**严格区分特征值比值与相邻谱隙两类目标泛函的开关点个数与极值命题**：
  1. **特征值比值 $Q_n(\rho) = \frac{\lambda_n(\rho)}{\lambda_1(\rho)}$（重点为 $n = 2$ 即首两特征值比值 $Q_2 = \lambda_2/\lambda_1$）**：
     其开关函数为 $\Phi_{\mathrm{ratio}}(x) = y_1(x)^2 - y_n(x)^2$。对于有经典文献支撑的 **$n = 2$（即 $Q_2 = \lambda_2/\lambda_1$）**，由 [Keller (1976)](https://epubs.siam.org/doi/10.1137/0131042) 与 Mahar--Willner (1976) 定理知：在 $[0, 1]$ 的 Dirichlet 边界条件下，$Q_2(\rho)$ 的极小值与极大值均由具有**精确 $2$ 个内部对称开关点、共 $3$ 段常值**的 bang--bang 权函数达到（极小化 $\lambda_2/\lambda_1$ 时两端取高密度 $R$、中间取低密度 $1$；极大化 $\lambda_2/\lambda_1$ 时两端取低密度 $1$、中间取高密度 $R$），并与 Ashbaugh--Benguria (1993) 及 [Huang (1999)](https://scispace.com/pdf/on-the-eigenvalue-ratio-for-vibrating-strings-24j6us65dk.pdf)（凹密度与对称单阱/单垒密度）的比值界对照（注：$Q_1 \equiv 1$ 为平凡常数；至于 $n \ge 3$ 的非相邻模态比值 $Q_n = \lambda_n/\lambda_1$，不能直接套用下述相邻模态谱隙的 Wronskian 计数，其针对极大/极小分支的精确开关点个数需作为后续研究课题单独论证，此处不作无依据的通式断言）；
  2. **相邻特征值谱隙 $D = \lambda_{n+1}(\rho) - \lambda_n(\rho)$（含 $n = 1$ 与高阶谱隙 $n \ge 2$）的有限块约化与精确 $2n$ 开关点命题**：
     在加权归一化 $\int_0^1 \rho(x) u_k(x)^2\,dx = 1$ 下，记相邻两阶特征值为 $a = \lambda_n(\rho), \, b = \lambda_{n+1}(\rho)$，相邻特征值差（谱隙）为 **$D = b - a = \lambda_{n+1}(\rho) - \lambda_n(\rho)$**，对应开关函数为 $\Phi_{\mathrm{gap}, n}(x) = a u_n(x)^2 - b u_{n+1}(x)^2$。在每个节点子区间上建立两相邻特征函数的 Wronskian 判别式严格负定条件 **$W(u_n, u_{n+1}) = u_n u'_{n+1} - u'_n u_{n+1} < 0$**，结合 Sturm 零点交错与 Rolle 定理严格计算 $\Phi_{\mathrm{gap}, n}(x)$ 在 $(0, 1)$ 内部的精确零点个数，证明第 $n$ 阶相邻谱隙 $D = \lambda_{n+1} - \lambda_n$ 的极值候选解约化为具有**精确 $2n$ 个内部开关点**（即 $2n+1$ 个常值块）的有限块 bang--bang 结构；
  3. **两模态块能量差恒等式 $K = -2D$ 与单参数超越消元**：
     在密度取常数 $\rho(x) \equiv r \in \{1, R\}$ 的每个常值块内部，定义同时包含动能项与加权势能项的**两模态块能量差函数**：
     $$K(x) := \bigl(u_n'(x)^2 + a r u_n(x)^2\bigr) - \bigl(u_{n+1}'(x)^2 + b r u_{n+1}(x)^2\bigr).$$
     由特征方程 $-u_n'' = a r u_n$ 与 $-u_{n+1}'' = b r u_{n+1}$，在常值块内部对 $K(x)$ 求导恒有 $K'(x) = 2u_n'(u_n'' + a r u_n) - 2u_{n+1}'(u_{n+1}'' + b r u_{n+1}) = 0$，故 $K(x)$ 在每个常值块上均为常数。在任意跳跃界面 $x = s$ 处，由 $u_k, u_k'$ 的连续性知块能量差的接口跳量为：
     $$K(s_+) - K(s_-) = (r_+ - r_-)\bigl(a u_n(s)^2 - b u_{n+1}(s)^2\bigr) = (r_+ - r_-)\Phi_{\mathrm{gap}, n}(s).$$
     当 bang--bang 极值结构使每个有效内部开关点 $s$ 均满足开关条件 $\Phi_{\mathrm{gap}, n}(s) = 0$ 时，接口跳量恒为零（$K(s_+) = K(s_-)$），从而各块的局部常数拼接为整个区间 $[0, 1]$ 上的**同一个全局常数 $K$**！在长度为 $1$ 的全区间 $[0, 1]$ 上对 $K(x) \equiv K$ 积分，并利用归一化条件 $\int_0^1 r u_k^2\,dx = 1$ 及 Dirichlet 能量恒等式 $\int_0^1 u_k'^2\,dx = \lambda_k \int_0^1 r u_k^2\,dx = \lambda_k$，立即导出精确全局恒等式：
     $$K = \int_0^1 K(x)\,dx = \underbrace{(a - b)}_{\text{动能积分差}} + \underbrace{(a - b)}_{\text{加权势能积分差}} = 2(a - b) = -2D!$$
     （注意：$K(x)$ 必须同时包含动能项与加权势能项，二者对全区间积分各贡献一个 $a - b = -D$，叠加才给出因子 $2$，即 $K = -2D$。）利用该块能量守恒常数 $K = -2D$ 即可严格锁定各同质块之间的等相位跨度与对称性，将多开关点位置消元化归为单参数超越方程求解。
- **开题与专题综述定稿**：将前 11 周的手推笔记整合为结构严谨的研究笔记，涵盖：
  1. 可测权 $1\le\rho\le R$ 下固定能量空间紧自伴算子 $K_\rho:H_0^1\to H_0^1$ 的泛函分析定义；
  2. $L^\infty$ 弱*紧性、Rellich--Kondrachov 紧嵌入与 $\|K_{\rho_k}-K_\rho\|_{\mathcal L(H_0^1)}\to 0$ 的极值存在性证明；
  3. 特征值、谱隙与比值的 Feynman--Hellmann 变分导数及无退化平台证明（Bang--Bang 定理）；
  4. 分段常值权函数下的 Prüfer 相位拼接、超越方程求解，以及左定标度 $\mathcal H_s$ 在临界阈值 $s=7/2$ 处的双迹完备性总结。

#### 3. 手工推导任务（必做）
1. 完成 [[SL谱理论/讲义/12_从L2展开到能量空间|第 10 章]] 主线习题 10.2–10.4 与 [[SL谱理论/讲义/21_右定算子与左定空间|第 11 章]] 主线习题 11.1、11.3，并核对 [[SL谱理论/讲义/项目文档映射表|项目文档映射表]] 中关于左定标度 $s=7/2$ 阈值与双迹分类的推导步骤。
2. 针对第 1 阶段任务 3 写出的对称三段常值权函数超越方程，手工消去振幅系数，导出关于切换位置参数 $\alpha\in(0,1/2)$ 的一维极值函数来刻画 $\max_{\rho\in\mathcal A_R}\frac{\lambda_2(\rho)}{\lambda_1(\rho)}$ 与 $\min_{\rho\in\mathcal A_R}\frac{\lambda_2(\rho)}{\lambda_1(\rho)}$，并检验当 $R\to 1^+$ 时结果退化为常系数 Dirichlet 比值 $\lambda_2(1)/\lambda_1(1)=4$。

#### 4. 读完判定标准
- 能清晰区分奇异端点 LP 型与 LC 型在平方可积解个数及边界条件个数上的本质差异，并说明左定空间族 $\mathcal H_s=D(A^{s/2})$ 在 $s=1,2$ 及临界半整数阈值处的范数结构。
- 能不借助外部资料，从头至尾完整串讲“Dirichlet 边界可测权盒约束 $1\le\rho(x)\le R$ 下特征值比值/谱隙极值问题”的 $H_0^1$ 算子范数收敛存在性、变分导数、bang--bang 极值结构与开关点相平面分析全过程。

## 三、 核心参考文献与专著索引

1. **Anton Zettl**, [*Sturm-Liouville Theory*](https://doi.org/10.1090/surv/121), Mathematical Surveys and Monographs, Vol. 121, American Mathematical Society, 2005.（第一主线与奇异理论核心专著：第 1–4 章对应正则问题、Prüfer 变换与变分单调性，第 6 章对应振荡理论，第 7 章对应奇异端点 LP/LC 分类，第 10 章对应奇异自伴边值问题）
2. **Gerald Teschl**, *Ordinary Differential Equations and Dynamical Systems*, Graduate Studies in Mathematics, Vol. 140, AMS, 2012, Chapter 5.（常微分方程与经典 SL 振荡理论的现代简明教材）
3. **J. B. Keller**, [*The minimum ratio of two eigenvalues*](https://epubs.siam.org/doi/10.1137/0131042), SIAM Journal on Applied Mathematics 31 (1976), 485–491；以及 **T. J. Mahar & B. E. Willner**, *An extremal eigenvalue problem*, Comm. Pure Appl. Math. 29 (1976), 517–529.（盒约束主线奠基文献：盒约束密度 $1\le\rho(x)\le R$ 下特征值与比值极值的变分导数、bang--bang 结构与开关点分析）
4. **M. S. Ashbaugh & R. D. Benguria**, *Eigenvalue ratios for Sturm-Liouville operators*, J. Differential Equations 103 (1993), 205–219；以及 **M.-J. Huang**, [*On the eigenvalue ratio for vibrating strings*](https://scispace.com/pdf/on-the-eigenvalue-ratio-for-vibrating-strings-24j6us65dk.pdf), Proc. Amer. Math. Soc. 127 (1999), 1805–1813.（特征值比值核心文献：Ashbaugh--Benguria 建立一般 SL 算子特征值比值界；Huang (1999) 在综述盒约束极值的基础上，系统给出凹密度与对称单阱/单垒密度下弦振动特征值比值 $\lambda_2/\lambda_1$ 的极值刻画）
5. **L. L. Littlejohn & R. Wellman**, *A General Left-Definite Theory for Certain Self-Adjoint Operators with Applications to Differential Equations*, J. Differential Equations 181 (2002), 280–339.（左定空间主线基础文献：算子幂与左定空间标度 $\mathcal H_s=D(A^{s/2})$ 的泛函分析框架）

## 相关链接

- [[SL谱理论/讲义/00_SL谱理论讲义总览|进入 SL 谱理论 17 章讲义总览]]
- [[SL谱理论/讲义书写计划|讲义体例与章节规划说明]]
- [[SL谱理论/讲义/Zettl参考映射|Zettl 专著章节对照与参考文献]]
- [[SL谱理论/讲义/习题分类索引|全书 96 道习题分类索引]]
- [[AI教学工程/OpenMAIC课程与教材规划调研]]
