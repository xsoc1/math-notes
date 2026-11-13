# 参考文献、物理模型对照与 Zettl 专著章节映射

## 与 Zettl《Sturm--Liouville Theory》的章节对照

Anton Zettl 所著的《*Sturm--Liouville Theory*》（Mathematical Surveys and Monographs, Vol. 121, American Mathematical Society, 2005）是本讲义经典 Sturm--Liouville 谱理论部分（第 1–9 章）的核心参考著作。下表列出了本讲义各章与 Zettl 专著相应章节的对应关系，供读者在正文自包含证明之外进一步查阅更一般的系数假设（如局部可积条件 $1/p, q, r\in L^1$）与奇异推广。

::: center
| 讲义章节 | 章节主题 | Zettl 专著对应章节 | 对照阅读与拓展内容 |
|:---|:---|:---|:---|
| 第 1 章 | 从物理问题到正则 SL 问题 | Ch. 1--2; Ch. 3 §3.1; Ch. 4 §4.1 | 初值问题解的存在唯一性、对参数与数据的连续/可微依赖性、正则边值问题的标准定义 |
| 第 2 章 | Liouville 标准形与 Prüfer 变换 | Ch. 4 §4.5--§4.6; Ch. 3 §3.2 | Prüfer 极坐标变换定理链、分离型边界条件下的相位演化与特征函数节点计数 |
| 第 3 章 | Sturm 比较定理与零点交错 | Ch. 2 §2.6; Ch. 6 §6.2--§6.4 | Sturm 分离定理、比较定理及无穷区间上解的振动性判别准则 |
| 第 4 章 | Hilbert 空间中的正交几何 | Ch. 3 §3.2--§3.3; Ch. 4 §4.11--§4.12; Ch. 16 | Green 核积分算子、实特征值性质与特征函数展开定理的经典文献脉络 |
| 第 5 章 | 一维 Sobolev 空间、算子域与边界形式 | Ch. 4 §4.2, §4.10, §4.12; Ch. 10 §10.2--§10.4 | 自伴边界条件的矩阵标准形、特征值重数分析以及奇异算子的自伴扩张理论 |
| 第 6 章 | Green 函数、紧预解式与自伴性 | Ch. 3 §3.8; Ch. 4 §4.11--§4.12; Ch. 10 §10.9--§10.10 | 正则与奇异问题的 Green 函数显式构造、紧预解算子与离散实谱 |
| 第 7 章 | 紧自伴谱定理与特征函数完备性 | Ch. 4 §4.11--§4.12; Ch. 16 | 紧自伴算子谱定理与特征函数展开（第 7 章关于 Dirichlet 振荡定理的相位证明可同时参阅 Teschl《ODE》第 5.5 节） |
| 第 8 章 | 变分原理、系数单调性与方向导数 | Ch. 4 §4.9; Ch. 5 §5.5--§5.6; Ch. 3 §3.6 | 特征值关于方程系数与边界参数的单调性定理、变分不等式与可微性（Feynman--Hellmann 公式） |
| 第 9 章 | 特征值渐近与 Weyl 公式 | Ch. 4 §4.3, §4.5, §4.8; Ch. 3 §3.7 | 基于 Prüfer 相位比较的特征值计数估计、Weyl 渐近公式与 Rayleigh 商比值下确界 |
| 第 10--17 章 | 左定空间理论与指定函数族完备性 | 参阅下方现代左定理论文献与专题论文 | 将正定自伴算子幂生成的左定 Hilbert 空间标度与 Zettl 书中的不定权（变号权）问题加以区分阅读 |
:::

## 物理模型与数学概念对照表

为帮助读者建立直观的物理图像，下表汇总了讲义各章所引用的经典力学、电磁学与量子力学模型及其对应的 Sturm--Liouville 数学结构：

::: center
| 物理系统 | 控制方程与物理图像 | Sturm--Liouville 算子形式 | 对应讲义章节与核心数学概念 |
|:---|:---|:---|:---|
| 受压细杆屈曲 | $EIy''''+Py''=0$（两端简支） | $-EIy''=Py$ | 第 1 章：欧拉临界屈曲载荷、失稳弯曲模态 |
| 边界支撑与耦合约束 | 固定端、自由端、弹性支撑端、闭合圆环 | $Ky-L(py')=0$ 或周期条件 | 第 1、5 章：边界无耗散能量守恒、力学互易性、自伴边界形式 |
| 非均匀弦/杆振动 | $\rho u_{tt}=(Tu_x)_x$ | $-(Ty')'=\lambda \rho y$ | 第 1、2、8 章：固有振动频率、Rayleigh 能量商 |
| 圆形薄膜振动与悬链线 | $u_{tt}=c^2\Delta u$（极坐标分离变量） | Bessel 方程 | 第 2 章：Bessel 函数 $J_m$ 的零点分布、圆形节线与基频 |
| 球面角向调和分布 | 球坐标下的 Laplace 方程 | Legendre 方程 | 第 2 章：Legendre 多项式 $P_n$、球面调和函数与多极展开 |
| 一维无限深量子势阱 | $-\psi''=E\psi$（Dirichlet 边界） | $p=r=1$，$q=0$ | 第 2、3、4、7 章：量子化离散能级、波函数节点数、态空间完备性 |
| 弦乐器与管乐器驻波 | $u_{tt}=c^2u_{xx}$ | $-y''=\lambda y$ | 第 2、3 章：基音与泛音谐波频率、内部节点计数 |
| 非均匀介质热传导 | $c\rho u_t=(ku_x)_x$ | $-(ky')'=\lambda c\rho y$ | 第 4、7 章：广义 Fourier 级数展开、最低特征值与热衰减率 |
| 无阻尼保守线性振动 | 动能与势能相互转化的守恒系统 | 正定自伴微分算子 | 第 5--7 章：实固有频率、正交简正模态、模态展开完备性 |
| 点源静电场与波导传输 | $-\Delta G=\delta$；$-\Delta u=\lambda u$ | Green 函数 / 波导横向本征模 | 第 6、9 章：单位点源响应核、高阶模态的 Weyl 渐近计数 |
| 谱几何（听音辨鼓） | 鼓膜固有频率谱与几何区域形状的关系 | $-\Delta u=\lambda u$ 的特征值序列 | 第 7、9 章：Weyl 渐近定律（由高频渐近测定区域尺度）、逆谱问题 |
:::

## 常见物理术语的数学直观解释

::: center
| 物理术语 | 物理直观与对应的数学内涵 |
|:---|:---|
| **力学互易性（Reciprocity）** | 在无能量损耗的线性弹性系统中，于 $A$ 点施加单位集中力并在 $B$ 点测量产生的位移，与于 $B$ 点施加同样集中力并在 $A$ 点测量位移，所得结果完全相等。在数学上，这直接体现为 Green 函数的对称性 $G(x,\xi)=G(\xi,x)$ 以及算子的对称性 $(Au,v)=(u,Av)$。 |
| **屈曲与临界载荷（Buckling）** | 承受轴向压力的细长直杆在压力越过某一阈值时突然丧失直线稳定性而发生横向弯曲，称为屈曲；触发首次弯曲失稳的最小压力恰好等于对应 Sturm--Liouville 边值问题的最小特征值 $\lambda_1$。 |
| **弹性支撑（Robin 边界条件）** | 振动弦或杆的端点连接在服从胡克定律的弹簧支座上，端点所受弹性恢复力与端点位移成正比，从而在边界上产生形如 $(py')(a)=h y(a)$ 的第三类（Robin）混合边界条件。 |
| **节点（节线）与波腹** | 在驻波振动模态中，始终保持静止不动的点（二维中为曲线）称为**节点**（或节线），对应于特征函数 $y_n(x)=0$ 的内部零点；振幅达到局部最大值的点则称为**波腹**。 |
| **谱隙（Spectral Gap）** | 相邻两个特征值之间的差值（尤指 $\lambda_2-\lambda_1$）。在热传导半群演化 $u(x,t)=\sum c_n e^{-\lambda_n t}e_n(x)$ 中，系统整体向零态衰减的绝对速率由最低特征值 $\lambda_1$ 决定；而在扣除基态分量后，高阶扰动向基态收敛的相对衰减速率则由谱隙 $\lambda_2-\lambda_1$ 控制。 |
| **截止频率与共振频率** | 波导中允许电磁波或声波向前传播的最低频率阈值称为**截止频率**；有界腔体可激发稳定驻波的固有频率称为**共振频率**；二者在数学上均由横向或腔体微分算子特征值的平方根 $\sqrt{\lambda_n}$ 给出。 |
| **多极展开（Multipole Expansion）** | 将空间局部电荷或质量分布在远处产生的位势场按球面调和函数（或 Legendre 多项式）展开为级数，依次提取单极矩（总电量）、偶极矩、四极矩等由强到弱的主导渐近项。 |
| **听音辨鼓与谱几何** | 源于 M. Kac 的经典问题“Can one hear the shape of a drum?”，即探讨微分算子的特征值全谱 $\{\lambda_n\}$ 能否唯一决定几何区域的形状；Weyl 渐近公式表明，从特征值的高频渐近行为可以直接读出鼓膜的面积（一维中为 Liouville 光学长度）。 |
| **无阻尼保守系统** | 不存在摩擦、黏性耗散或边界辐射损耗的理想力学系统；在算子理论中恰好对应于具有实特征值与正交本征模的自伴算子。 |
:::

## 主要参考文献与经典著作

1. A. Zettl, *Sturm--Liouville Theory*, Mathematical Surveys and Monographs, Vol. 121, American Mathematical Society, Providence, RI, 2005.
2. G. Teschl, *Ordinary Differential Equations and Dynamical Systems*, Graduate Studies in Mathematics, Vol. 140, American Mathematical Society, Providence, RI, 2012. 作者公开电子版：[<https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf>](https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf).
3. G. Teschl, *Mathematical Methods in Quantum Mechanics: With Applications to Schrödinger Operators*, Graduate Studies in Mathematics, Vol. 99, American Mathematical Society, 2009. 本讲义第 4--8 章引用的节号对应作者公开的 2009 年在线版：[<https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf>](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf)（注：2014 年出版的第二版为 Vol. 157，核对具体节号时请留意版本差异）。
4. M. Reed and B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*, revised and enlarged ed., Academic Press, New York, 1980.
5. E. C. Titchmarsh, *Eigenfunction Expansions Associated with Second-Order Differential Equations, Part I*, 2nd ed., Oxford University Press, Oxford, 1962.
6. A. Zygmund, *Trigonometric Series*, 3rd ed., Cambridge University Press, Cambridge, 2002.
7. J. Weidmann, *Spectral Theory of Ordinary Differential Operators*, Lecture Notes in Mathematics, Vol. 1258, Springer, Berlin, 1987.
8. M. A. Naimark, *Linear Differential Operators, Part II*, Frederick Ungar, New York, 1968.
9. F. V. Atkinson, *Discrete and Continuous Boundary Problems*, Mathematics in Science and Engineering, Vol. 8, Academic Press, New York, 1964.
10. W. T. Reid, *Ordinary Differential Equations*, Applied Mathematics Series, Wiley, New York, 1971.
11. N. Dunford and J. T. Schwartz, *Linear Operators, Part II: Spectral Theory*, Interscience, New York, 1963.
12. L. L. Littlejohn and R. Wellman, *A General Left-Definite Theory for Certain Self-Adjoint Operators with Applications to Differential Equations*, Journal of Differential Equations 181 (2002), 280--339. [<https://doi.org/10.1006/jdeq.2001.4078>](https://doi.org/10.1006/jdeq.2001.4078).
13. C. Fischbacher, F. Gesztesy, P. Hagelstein and L. L. Littlejohn, *Abstract Left-Definite Theory: A Model Operator Approach, Examples, Fractional Sobolev Spaces, and Interpolation Theory*, arXiv:2408.01514v1（本讲义主要参考其 Theorems 1.1, 1.3, Remark 1.2, Sections 2, 4 及附录）. [<https://arxiv.org/html/2408.01514v1>](https://arxiv.org/html/2408.01514v1).
14. A. Jones, L. L. Littlejohn and A. Quintero Roba, *Krein--Sobolev Orthogonal Polynomials II*, Axioms 14 (2025), article 115. [<https://doi.org/10.3390/axioms14020115>](https://doi.org/10.3390/axioms14020115).
15. D. Frymark and C. Liaw, *Perspectives on General Left-Definite Theory*, arXiv:2012.01014v1；收录于 *From Operator Theory to Orthogonal Polynomials, Combinatorics, and Number Theory*, Springer, 2021. [<https://arxiv.org/abs/2012.01014>](https://arxiv.org/abs/2012.01014).

## 理论来源层次说明

- **经典泛函与基理论**：Hilbert 空间中的正交投影、最佳逼近、Schauder 基与 Riesz 基的一般准则均属经典泛函分析内容。第 17 章所采用的 Schauder 基定义与 Riesz 基等价刻画，可参阅 C. Heil 的讲义 *A Basis Theory Primer*（1998 年在线电子稿，Definition 4.5 与 Theorem 11.9(a),(d)，[<https://heil.math.gatech.edu/papers/bases.pdf>](https://heil.math.gatech.edu/papers/bases.pdf)；注意该节号对应于 1998 年电子稿而非 2011 年正式出版的扩充本专著），讲义正文中已给出所需等价刻画的完整自包含证明。
- **前沿专题问题与研究文稿**：第 14–16 章所探讨的移位 Krein 左定空间中特定稀疏多项式族的完备性问题，源于上方文献 [14]（Jones--Littlejohn--Quintero Roba, 2025）中提出的公开问题；而讲义第 14–16 章正文展开的具体解析证明、分数阶门槛定理以及余有限删项闭包分类，则改编自下述六篇配套研究项目未刊证明文稿。

## 配套研究项目证明文稿索引（BVE Research）

以下六篇专题证明文稿来自配套研究仓库（BVE Research 项目），按文稿标识与固定版本链接著录如下，供读者溯源核查原始推导：

##### BVE-H2

BVE Research 项目专题文稿：*第二左定空间 $H^2[-1,1]$ 中多项式基的解析完备性：证明文档*（2026-08-04，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_h2_completeness_proof.tex)；仓库内路径：`docs/SL_h2_completeness_proof.tex`。

##### BVE-H3

BVE Research 项目专题文稿：*第三左定空间 $H^3[-1,1]$ 中多项式基的解析完备性：证明文档*（2026-08-04 初稿，2026-09-20 修订，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_h3_completeness_proof.tex)；仓库内路径：`docs/SL_h3_completeness_proof.tex`。

##### BVE-FRAC

BVE Research 项目专题文稿：*稀疏多项式族的完整非负阶稠密窗口与成员阈值*（2026-08-05 初稿，2026-09-20 勘误，2026-09-21 补证，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_fractional_left_definite.tex)；仓库内路径：`docs/SL_fractional_left_definite.tex`。

##### BVE-COF

BVE Research 项目专题文稿：*第二左定空间中余有限稀疏子族的精确闭包*（2026-09-21，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_cofinite_left_definite.tex)；仓库内路径：`docs/SL_cofinite_left_definite.tex`。

##### BVE-PROJ

BVE Research 项目专题文稿：*投影稠密性与有限矩检验的修复证明*（2026-09-21，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_projection_moment_repairs.tex)；仓库内路径：`docs/SL_projection_moment_repairs.tex`。

##### BVE-MOM

BVE Research 项目专题文稿：*边界约束 Hilbert 空间中多项式稠密的一般准则：充分条件、矩刻画与临界指数*（2026-08-05 初稿，2026-09-20 修订，含 2026-09-21 补充，未刊证明文稿）。[固定版本源码](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_denseness_criteria.tex)；仓库内路径：`docs/SL_denseness_criteria.tex`。

返回 [[00_SL谱理论讲义总览]].
