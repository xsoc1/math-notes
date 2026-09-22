# 参考文献与 Zettl 章节对照

## 与 Zettl 的章节对照

Anton Zettl, *Sturm--Liouville Theory*, Mathematical Surveys and Monographs, Vol. 121, American Mathematical Society, 2005,是本讲义 SL 理论部分的主参考. 下表给出各章与 Zettl 的对应关系;表内为主题阅读对应, 不是用书名替代正文证明.

::: center
| 讲义章节 | 主题 | Zettl 章节 | 主要用途 |
|:---|:---|:---|:---|
| 讲义章节 | 主题 | Zettl 章节 | 主要用途 |
| 第 1 章 | 从物理问题到正则 SL 问题 | Ch. 1--2;Ch. 3 §3.1;Ch. 4 §4.1 | 存在唯一性,对数据的连续与可微依赖,标准问题定义 |
| 第 2 章 | Liouville 标准形与 Prüfer 变换 | Ch. 4 §4.5--§4.6;Ch. 3 §3.2 | Prüfer 定理链,分离边界条件与结点计数 |
| 第 3 章 | Sturm 比较定理与零点交错 | Ch. 2 §2.6;Ch. 6 §6.2--§6.4 | 分离定理,比较定理与振动性刻画 |
| 第 4 章 | Hilbert 空间中的正交几何 | Ch. 3 §3.2--§3.3;Ch. 4 §4.11--§4.12;Ch. 16 | Green 核算子,有限实谱与展开定理文献 |
| 第 5 章 | 一维 Sobolev 空间,算子域与边界形式 | Ch. 4 §4.2,§4.10,§4.12;Ch. 10 §10.2--§10.4 | 边界条件标准形,重数与奇异自伴扩张 |
| 第 6 章 | Green 函数,紧预解式与自伴性 | Ch. 3 §3.8;Ch. 4 §4.11--§4.12;Ch. 10 §10.9--§10.10 | 正则与奇异 Green 函数,有限实谱 |
| 第 7 章 | 紧自伴谱定理与特征函数完备性 | Ch. 4 §4.11--§4.12;Ch. 16 | 紧自伴谱定理与特征展开; 本章振荡证明另见 Teschl ODE 第5.5节 |
| 第 8 章 | 变分原理,系数单调性与方向导数 | Ch. 4 §4.9;Ch. 5 §5.5--§5.6;Ch. 3 §3.6 | 单调性定理,特征值不等式与可微性 |
| 第 9 章 | 特征值渐近与 Weyl 公式 | Ch. 4 §4.3,§4.5,§4.8;Ch. 3 §3.7 | Prüfer 相位比较,Weyl 计数与特征值渐近,比值下确界 |
| 第 10--17 章 | 左定理论与具体完备性问题 | 见下列现代文献与研究注记 | Zettl 的变号权框架与正自伴空间标度分开阅读 |
:::

## 物理模型与讲次对照

下表只登记作为\"动机\"的物理模型,不另设物理章节,也不展开推导.

::: center
| 物理系统 | 物理图像 / 方程 | SL 形式 | 对应章节与数学落点 |
|:---|:---|:---|:---|
| 受压杆屈曲 | $EIy''''+Py''=0$,简支 | $-EIy''=Py$ | 第 1 章:临界载荷,失稳模态 |
| 边界条件 | 固定,自由,弹性支撑,闭合环 | $Ky-L(py')=0$ | 第 1 章:能量守恒,互易性 |
| 变密度弦/杆 | $\rho u_{tt}=(Tu_x)_x$ | $-(Ty')'=\lambda\rho y$ | 第 1,2,8 章:自然频率,Rayleigh 商 |
| 圆膜与悬挂链 | $u_{tt}=c^2\Delta u$ | Bessel 方程 | 第 2 章:$J_m$ 零点,节线,基频 |
| 球面角向问题 | 球坐标 Laplace 方程 | Legendre 方程 | 第 2 章:$P_n$,球面调和,多极展开 |
| 无限深势阱 | $-\psi''=E\psi$,Dirichlet | $p=r=1$,$q=0$ | 第 2,3,4,7 章:能级,结点数,完备性 |
| 弦与管乐器 | $u_{tt}=c^2u_{xx}$ | 同上 | 第 2,3 章:谐波频率,零点计数 |
| 热传导与波动 | $c\rho u_t=(ku_x)_x$ | $-(ky')'=\lambda c\rho y$ | 第 4,7 章:Fourier 展开,谱隙 |
| 能量与互易性 | 无阻尼振动 | 正自伴算子 | 第 5--7 章:实频率,正交模态,完备性 |
| 点电荷与波导 | $-\Delta G=\delta$;$-\Delta u=\lambda u$ | Green 函数 / 横向模式 | 第 6 章及后续:点源响应,Weyl 计数 |
| 谱几何 | 听音辨鼓 | 特征值决定鼓声 | 第 7,9 章及后续:Weyl 定律,逆谱问题 |
:::

## 物理术语白话表

::: center
| 术语 | 白话解释 |
|:---|:---|
| 互易性 | 在 $A$ 点加力,$B$ 点测位移,与在 $B$ 点加同样力,$A$ 点测位移,结果相同;数学上就是 $G(x,\xi)=G(\xi,x)$ 或 $(Au,v)=(u,Av)$.只对无损耗的线性系统成立. |
| 屈曲 / 临界载荷 | 压杆在压力达到某个值时突然侧向弯曲,称为屈曲;这个压力等于最小特征值. |
| 弹性支撑(Robin) | 端点接在弹簧或弹性材料上,恢复力与位移成正比,于是出现 $y'=hy$ 型边界条件. |
| 节线 / 波腹 | 节线是振动中始终不动的曲线;波腹是振幅最大的位置. |
| 谱隙 | 相邻特征值之差. 热半群本身的最低模态衰减率由最低特征值给出; 提取最低模态后的相对衰减才由谱隙控制. |
| 截止频率 / 共振频率 | 截止频率是\"低于它就传不过去\"的频率;共振频率是腔体的固有振动频率;两者都由 $\sqrt{\lambda}$ 给出. |
| 多极展开 | 把远处的静电场或引力场按球谐函数(单极,偶极,四极......)展开,便于提取主导项. |
| 听音辨鼓 / 谱几何 | 问鼓的振动频率(谱)能否唯一决定鼓的形状,是逆谱问题的入门版本. |
| 无阻尼 | 没有摩擦,黏性或辐射等能量损耗的理想系统;自伴边界条件正对应这种情形. |
:::

## 主要参考书

1.  A. Zettl, *Sturm--Liouville Theory*, Mathematical Surveys and Monographs, Vol. 121, American Mathematical Society, Providence, RI, 2005.

2.  G. Teschl, *Ordinary Differential Equations and Dynamical Systems*, Graduate Studies in Mathematics, Vol. 140, American Mathematical Society, Providence, RI, 2012. 作者公开初版稿: <https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf>.

3.  G. Teschl, *Mathematical Methods in Quantum Mechanics: With Applications to Schrödinger Operators*, Graduate Studies in Mathematics, Vol. 99, American Mathematical Society, 2009. 本讲义第 4--8 章对应作者公开的 2009 在线版, <https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf>. 2014 第二版为 Vol. 157, 阅读时应另核对节号.

4.  M. Reed and B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*, revised and enlarged ed., Academic Press, New York, 1980.

5.  E. C. Titchmarsh, *Eigenfunction Expansions Associated with Second-Order Differential Equations, Part I*, 2nd ed., Oxford University Press, Oxford, 1962.

6.  A. Zygmund, *Trigonometric Series*, 3rd ed., Cambridge University Press, Cambridge, 2002.

7.  J. Weidmann, *Spectral Theory of Ordinary Differential Operators*, Lecture Notes in Mathematics, Vol. 1258, Springer, Berlin, 1987.

8.  M. A. Naimark, *Linear Differential Operators, Part II*, Frederick Ungar, New York, 1968.

9.  F. V. Atkinson, *Discrete and Continuous Boundary Problems*, Mathematics in Science and Engineering, Vol. 8, Academic Press, New York, 1964.

10. W. T. Reid, *Ordinary Differential Equations*, Applied Mathematics Series, Wiley, New York, 1971.

11. N. Dunford and J. T. Schwartz, *Linear Operators, Part II: Spectral Theory*, Interscience, New York, 1963.

12. L. L. Littlejohn and R. Wellman, *A General Left-Definite Theory for Certain Self-Adjoint Operators with Applications to Differential Equations*, Journal of Differential Equations 181 (2002), 280--339. <https://doi.org/10.1006/jdeq.2001.4078>.

13. C. Fischbacher, F. Gesztesy, P. Hagelstein and L. L. Littlejohn, *Abstract Left-Definite Theory: A Model Operator Approach, Examples, Fractional Sobolev Spaces, and Interpolation Theory*, arXiv:2408.01514v1. 本文使用的定位: Theorems 1.1,1.3, Remark 1.2, Sections 2,4 及附录. <https://arxiv.org/html/2408.01514v1>.

14. A. Jones, L. L. Littlejohn and A. Quintero Roba, *Krein--Sobolev Orthogonal Polynomials II*, Axioms 14 (2025), article 115. <https://doi.org/10.3390/axioms14020115>.

15. D. Frymark and C. Liaw, *Perspectives on General Left-Definite Theory*, arXiv:2012.01014v1; 收于 *From Operator Theory to Orthogonal Polynomials, Combinatorics, and Number Theory*, 2021. <https://arxiv.org/abs/2012.01014>.

## 来源层次

Hilbert 空间中的投影,基与稳定性属于经典理论. 第17章使用的 Schauder 基定义与 Riesz 基刻画, 可参阅 C. Heil, *A Basis Theory Primer*, 1998年电子稿, Definition 4.5 与 Theorem 11.9(a),(d), <https://heil.math.gatech.edu/papers/bases.pdf>. 这里定位的是该电子稿, 不是2011年扩充版的节号; 正文所用刻画给出完整证明.

第14--16章的具体稀疏族结果来自书末注明的未刊研究文稿, 不能与经典一般理论或已发表论文中的问题陈述混为一谈. 一般谱测度,完整插值与扩张理论的阅读入口位于第17章; 书中的引用定理与已在正文展开的证明分别标明.

## 未刊研究证明

以下六篇按 BVE research 项目文稿登记; 原稿未署名个人作者. 题名与文稿日期按各自题名页记载, 与讲义采用的版本分开列明. 所引文件均取自2026-09-22仓库快照, 下列"固定版本"链接直接定位到该快照中的各篇源码. 这些条目属于未刊研究证明, 出版论文中的问题来源另见前列文献.

##### BVE-H2

BVE research 项目文稿. *第二左定空间 $H^2[-1,1]$ 中多项式基的解析完备性: 证明文档*. 2026-08-04. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_h2_completeness_proof.tex); 仓库内位置: `docs/SL_h2_completeness_proof.tex`.

##### BVE-H3

BVE research 项目文稿. *第三左定空间 $H^3[-1,1]$ 中多项式基的解析完备性: 证明文档*. 2026-08-04初稿, 2026-09-20修订. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_h3_completeness_proof.tex); 仓库内位置: `docs/SL_h3_completeness_proof.tex`.

##### BVE-FRAC

BVE research 项目文稿. *稀疏多项式族的完整非负阶稠密窗口与成员阈值*. 2026-08-05初稿, 2026-09-20勘误, 2026-09-21补证. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_fractional_left_definite.tex); 仓库内位置: `docs/SL_fractional_left_definite.tex`.

##### BVE-COF

BVE research 项目文稿. *第二左定空间中余有限稀疏子族的精确闭包*. 2026-09-21. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_cofinite_left_definite.tex); 仓库内位置: `docs/SL_cofinite_left_definite.tex`.

##### BVE-PROJ

BVE research 项目文稿. *投影稠密性与有限矩检验的修复证明*. 2026-09-21. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_projection_moment_repairs.tex); 仓库内位置: `docs/SL_projection_moment_repairs.tex`.

##### BVE-MOM

BVE research 项目文稿. *边界约束 Hilbert 空间中多项式稠密的一般准则: 充分条件, 矩刻画与临界指数*. 2026-08-05初稿, 题名页标注2026-09-20修订; 所引文件含2026-09-21补充. 未刊证明文稿. [固定版本](https://github.com/Zhongshan-Big-Jun/Sturm-Liouville-theory-research/blob/2a81b608d53e3decee04c46716a8d8f8c2d9b1b4/docs/SL_denseness_criteria.tex); 仓库内位置: `docs/SL_denseness_criteria.tex`.

返回 [[00_SL谱理论讲义总览]].
