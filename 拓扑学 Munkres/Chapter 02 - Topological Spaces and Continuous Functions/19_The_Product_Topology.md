---
title: "§19 积拓扑（任意积）"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/product-topology
  - topology/box-topology
aliases:
  - "The Product Topology"
  - "19_The_Product_Topology"
---

# §19 The Product Topology (Arbitrary Products)

> [!abstract] 核心问题
> 当我们将有限个拓扑空间的笛卡尔积推广到无穷多个（可数乃至不可数无穷多个）拓扑空间的乘积 $\prod_{\alpha \in J} X_\alpha$ 时，出现了两种看似自然的拓扑定义——**箱拓扑（Box Topology）**与**积拓扑（Product Topology）**。这两者有何本质区别？为什么现代数学最终选择表面上看似“带有有限限制”的 Tychonoff 积拓扑作为标准拓扑？

## 19.1 箱拓扑与积拓扑的定义

设 $\{X_\alpha\}_{\alpha \in J}$ 是由任意指标集 $J$（有限、可数或不可数）索引的一族拓扑空间。笛卡尔积 $\prod_{\alpha \in J} X_\alpha$ 定义为全体选择族（元组）$\mathbf{x} = (x_\alpha)_{\alpha \in J}$（其中对每个 $\alpha \in J$ 有 $x_\alpha \in X_\alpha$）构成的集合。对每个指标 $\beta \in J$，定义第 $\beta$ 个**坐标投射映射（projection mapping）** $\pi_\beta: \prod_{\alpha \in J} X_\alpha \to X_\beta$ 为：
$$\pi_\beta\bigl((x_\alpha)_{\alpha \in J}\bigr) = x_\beta$$

回顾 [[15_The_Product_Topology_on_XxY|§15]] 中两个空间 $X_1 \times X_2$ 的积拓扑，我们当时给出了两种等价刻画：
1. **方式一（按开集之积作基）**：以全体形如 $U_1 \times U_2$（$U_i$ 在 $X_i$ 中开）的集合为拓扑基；
2. **方式二（按投射原像作子基）**：以全体柱状集 $\pi_1^{-1}(U_1)$ 和 $\pi_2^{-1}(U_2)$ 为**子基**，取其有限交作为拓扑基。

在有限乘积下，这两种方式生成完全相同的拓扑；但当指标集 $J$ 是**无穷集**时，这两种推广方式分道扬镳，分别导出了**箱拓扑**与**积拓扑**：

> [!note] **定义 19.1（箱拓扑 / Box Topology）**
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间。在笛卡尔积 $\prod_{\alpha \in J} X_\alpha$ 上，以全体形如
> $$\prod_{\alpha \in J} U_\alpha \quad (\text{其中对每个 } \alpha \in J, \; U_\alpha \text{ 是 } X_\alpha \text{ 中的开集})$$
> 的集合构成的集族 $\mathcal{B}_{\text{box}}$ 作为拓扑基所生成的拓扑，称为 **箱拓扑（box topology）**。

> [!note] **定义 19.2（积拓扑 / Tychonoff Product Topology）**
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间。在笛卡尔积 $\prod_{\alpha \in J} X_\alpha$ 上，以全体坐标投射原像构成的集族
> $$\mathcal{S} = \bigcup_{\beta \in J} \bigl\{ \pi_\beta^{-1}(U_\beta) \;\big|\; U_\beta \text{ 是 } X_\beta \text{ 中的开集} \bigr\}$$
> 作为**子基（subbasis）**所生成的拓扑，称为 **积拓扑（product topology）**。赋予了积拓扑的 $\prod_{\alpha \in J} X_\alpha$ 称为**积空间（product space）**。

### 积拓扑的拓扑基刻画

由子基生成拓扑基的规则是取子基中元素的**有限交集**。注意到对任意有限个不同指标 $\beta_1, \dots, \beta_n \in J$ 及开集 $U_{\beta_i} \subseteq X_{\beta_i}$，子基元素的有限交为：
$$\pi_{\beta_1}^{-1}(U_{\beta_1}) \cap \pi_{\beta_2}^{-1}(U_{\beta_2}) \cap \cdots \cap \pi_{\beta_n}^{-1}(U_{\beta_n}) = \prod_{\alpha \in J} U_\alpha$$
其中当 $\alpha \in \{\beta_1, \dots, \beta_n\}$ 时 $U_\alpha = U_{\beta_i}$ 为开集，而对**其余所有指标** $\alpha \notin \{\beta_1, \dots, \beta_n\}$，均必须有 $U_\alpha = X_\alpha$（全空间）！由此立得：

> [!note] **定理 19.1（积拓扑与箱拓扑的基对比）** ^theorem-19-1
> 积拓扑的一组拓扑基 $\mathcal{B}_{\text{prod}}$ 由全体形如 $\prod_{\alpha \in J} U_\alpha$ 的集合构成，其中：
> 1. 对每个 $\alpha \in J$，$U_\alpha$ 是 $X_\alpha$ 中的开集；
> 2. **除有限个指标 $\alpha$ 外，恒有 $U_\alpha = X_\alpha$**。
>
> $$\mathcal{B}_{\text{prod}} = \left\{\prod_{\alpha \in J} U_\alpha \;\middle|\; U_\alpha \in \mathcal{T}_{X_\alpha}, \text{ 且仅对有限个 } \alpha \text{ 有 } U_\alpha \neq X_\alpha \right\}$$

> [!important] **核心差异对比**
> - **在箱拓扑中**：基元素 $\prod_{\alpha \in J} U_\alpha$ 允许**同时在无穷多个坐标方向上**对开集 $U_\alpha$ 施加严格收缩限制；
> - **在积拓扑中**：基元素 $\prod_{\alpha \in J} U_\alpha$ **每次只允许在有限个坐标方向上**施加开邻域限制，其余无穷多个坐标方向必须完全放开为全空间 $X_\alpha$。
> - 当指标集 $J$ 是有限集时，两者完全相同；当 $J$ 是无穷集时，因为 $\mathcal{B}_{\text{prod}} \subseteq \mathcal{B}_{\text{box}}$，**箱拓扑比积拓扑更细（通常严格细于积拓扑）**。

## 19.2 基本性质与分量连续性定理

下面的定理 19.2 至 19.5 指出，在子空间基、子空间相容性、Hausdorff 性质以及积集闭包公式这四个方面，积拓扑与箱拓扑的表现是相同的：

> [!note] **定理 19.2–19.5（对积拓扑与箱拓扑同时成立的性质）** ^theorem-19-2
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间，在 $\prod_{\alpha \in J} X_\alpha$ 上赋予积拓扑或箱拓扑。则：
> 1. **（因子空间的基生成乘积基，定理 19.2）** 若对每个 $\alpha$，$\mathcal{B}_\alpha$ 是 $X_\alpha$ 的拓扑基，则全体 $\prod_{\alpha \in J} B_\alpha$（在箱拓扑下 $B_\alpha \in \mathcal{B}_\alpha$；在积拓扑下有限个 $B_\alpha \in \mathcal{B}_\alpha$，其余 $B_\alpha = X_\alpha$）构成相应拓扑的一组基；
> 2. **（子空间相容性，定理 19.3）** 若每个 $A_\alpha$ 是 $X_\alpha$ 的子空间，则 $\prod A_\alpha$ 上的积拓扑（或箱拓扑）与它作为 $\prod X_\alpha$ 子空间所继承的子空间拓扑一致；
> 3. **（Hausdorff 性质遗传，定理 19.4）** 若每个 $X_\alpha$ 都是 Hausdorff 空间，则 $\prod X_\alpha$ 在两种拓扑下都是 Hausdorff 空间；
> 4. **（闭包乘积公式，定理 19.5）** 若对每个 $\alpha$ 有 $A_\alpha \subseteq X_\alpha$，则在两种拓扑下均有：
>    $$\overline{\prod_{\alpha \in J} A_\alpha} = \prod_{\alpha \in J} \overline{A_\alpha}$$

**定理 19.5（闭包乘积公式）的证明**：
- 先证 $\prod_{\alpha \in J} \overline{A_\alpha} \subseteq \overline{\prod_{\alpha \in J} A_\alpha}$：设点 $\mathbf{x} = (x_\alpha) \in \prod \overline{A_\alpha}$，即对每个 $\alpha$ 有 $x_\alpha \in \overline{A_\alpha}$。任取包含 $\mathbf{x}$ 的基元素 $U = \prod U_\alpha$（无论是积拓扑基还是箱拓扑基，每个 $U_\alpha$ 都是 $X_\alpha$ 中包含 $x_\alpha$ 的开集）。因为 $x_\alpha \in \overline{A_\alpha}$，必有 $U_\alpha \cap A_\alpha \neq \varnothing$。在每个非空交集 $U_\alpha \cap A_\alpha$ 中选取一点 $y_\alpha$，则点 $\mathbf{y} = (y_\alpha) \in \bigl(\prod U_\alpha\bigr) \cap \bigl(\prod A_\alpha\bigr)$。由定理 17.5 知 $\mathbf{x} \in \overline{\prod A_\alpha}$。
- 再证 $\overline{\prod_{\alpha \in J} A_\alpha} \subseteq \prod_{\alpha \in J} \overline{A_\alpha}$：设 $\mathbf{x} = (x_\alpha) \in \overline{\prod A_\alpha}$。对任意固定的指标 $\beta \in J$ 及包含 $x_\beta$ 的任意开集 $U_\beta \subseteq X_\beta$，柱状集 $\pi_\beta^{-1}(U_\beta)$ 在积拓扑（从而在更细的箱拓扑）中是包含 $\mathbf{x}$ 的开集。因此 $\pi_\beta^{-1}(U_\beta) \cap \prod A_\alpha \neq \varnothing$，取其中一点 $\mathbf{y} = (y_\alpha)$，其第 $\beta$ 坐标即满足 $y_\beta \in U_\beta \cap A_\beta \neq \varnothing$。这说明 $x_\beta \in \overline{A_\beta}$ 对所有 $\beta \in J$ 成立。$\square$

### 为什么积拓扑优于箱拓扑？——映射的泛性质

真正让积拓扑在两个候选者中胜出的决定性性质，是下面的**分量连续性定理（定理 19.6）**以及第五章的 **Tychonoff 紧致性定理**。这一定理对**积拓扑成立，但对箱拓扑彻底失效**！

> [!note] **定理 19.6（映射到积空间的连续性泛性质）** ^theorem-19-6
> 设映射 $f: A \to \prod_{\alpha \in J} X_\alpha$ 由坐标分量函数 $f_\alpha = \pi_\alpha \circ f: A \to X_\alpha$ 给出，即 $f(a) = \bigl(f_\alpha(a)\bigr)_{\alpha \in J}$。若在 $\prod_{\alpha \in J} X_\alpha$ 上赋予**积拓扑**，则映射 $f$ 连续，**当且仅当每一个坐标分量函数 $f_\alpha$ 都连续**。

**证明**：
- ($\Rightarrow$)：对每个指标 $\beta \in J$，坐标投射 $\pi_\beta: \prod X_\alpha \to X_\beta$ 是连续的，因为对 $X_\beta$ 中任意开集 $U_\beta$，原像 $\pi_\beta^{-1}(U_\beta)$ 本身就是积拓扑的子基元素（故为开集）。因此，若 $f$ 连续，则复合映射 $f_\beta = \pi_\beta \circ f$ 必连续。
- ($\Leftarrow$)：假设对每个 $\beta \in J$，分量函数 $f_\beta$ 都连续。为证 $f$ 关于积拓扑连续，只需验证积拓扑**子基** $\mathcal{S}$ 中任意元素 $\pi_\beta^{-1}(U_\beta)$（其中 $U_\beta$ 在 $X_\beta$ 中开）的原像在 $A$ 中是开集。由复合映射原像公式有：
  $$f^{-1}\bigl(\pi_\beta^{-1}(U_\beta)\bigr) = (\pi_\beta \circ f)^{-1}(U_\beta) = f_\beta^{-1}(U_\beta)$$
  因为 $f_\beta$ 连续且 $U_\beta$ 在 $X_\beta$ 中开，故 $f_\beta^{-1}(U_\beta)$ 在 $A$ 中是开集。由于子基元素的原像均为开集，其有限交（即积拓扑基元素）的原像也必为开集（因为原像保持交集，而**有限个开集的交仍是开集**！），故 $f$ 连续。$\square$

> [!warning] **经典反例（例 19.2）：定理 19.6 对箱拓扑为什么不成立？**
> 在上述证明的最后一步中，我们 crucially 用到了“子基的**有限交**对应开集的**有限交**”。而在箱拓扑中，基元素 $\prod_{n=1}^\infty U_n$ 是**无穷多个**柱状集 $\pi_n^{-1}(U_n)$ 的交集，但无穷多个开集的交集未必是开集！
>
> **具体反例**：考察可数无穷乘积 $\mathbb{R}^\omega = \prod_{n=1}^\infty \mathbb{R}$，定义对角映射 $f: \mathbb{R} \to \mathbb{R}^\omega$ 为：
> $$f(t) = (t, t, t, \ldots)$$
> 它的每一个坐标分量函数都是恒等映射 $f_n(t) = t$，显然全部连续。由定理 19.6，$f$ 关于**积拓扑**是连续的。
> 但若在 $\mathbb{R}^\omega$ 上赋予**箱拓扑**，$f$ 却**不连续**！为此，考察箱拓扑中的基开集：
> $$B = (-1, 1) \times \left(-\frac{1}{2}, \frac{1}{2}\right) \times \left(-\frac{1}{3}, \frac{1}{3}\right) \times \cdots = \prod_{n=1}^{\infty} \left(-\frac{1}{n}, \frac{1}{n}\right)$$
> 计算 $B$ 在 $f$ 下的原像：
> $$f^{-1}(B) = \left\{ t \in \mathbb{R} \;\middle|\; \forall n \in \mathbb{Z}_+, \, t \in \left(-\frac{1}{n}, \frac{1}{n}\right) \right\} = \bigcap_{n=1}^{\infty} \left(-\frac{1}{n}, \frac{1}{n}\right) = \{0\}$$
> 单点集 $\{0\}$ 在 $\mathbb{R}$ 中不是开集！因此 $f$ 在箱拓扑下不连续。

## 19.3 箱拓扑与积拓扑全面对比表

| 拓扑性质 | 箱拓扑 (Box Topology) | 积拓扑 (Product Topology) |
| :--- | :--- | :--- |
| **基元素形式** | $\prod_{\alpha \in J} U_\alpha$（每个 $U_\alpha$ 均可取任意开集） | $\prod_{\alpha \in J} U_\alpha$（仅有限个 $U_\alpha \neq X_\alpha$） |
| **粗细关系（$J$ 无限）** | 较细（开集太多，约束过强） | 较粗（恰为使全体 $\pi_\alpha$ 连续的最粗拓扑） |
| **投射映射 $\pi_\alpha$** | 连续开映射（当乘积非空 $\prod X_\beta \neq \varnothing$ 时为满射） | 连续开映射（当乘积非空 $\prod X_\beta \neq \varnothing$ 时为满射） |
| **分量连续 $\iff$ 整体连续** | ❌ **不成立**（如 $t \mapsto (t, t, \dots)$ 不连续） | ✅ **恒成立**（定理 19.6，范畴乘积泛性质） |
| **点列收敛 $x^{(k)} \to x$** | 对每个箱邻域 $\prod_{\alpha \in J} U_\alpha \ni x$，存在统一的 $N$ 使 $k \geqslant N$ 时所有 $\alpha \in J$ 同时有 $x_\alpha^{(k)} \in U_\alpha$ | ✅ 等价于**逐坐标收敛**（对每个 $\alpha$，$x_\alpha^{(k)} \to x_\alpha$，下标阈值 $N_\alpha$ 可随坐标 $\alpha$ 变化） |
| **连通性与紧致性遗传** | ❌ 连通/紧致空间的无穷箱积通常**不连通、不紧** | ✅ 连通空间的积仍连通；**紧致空间的积仍紧致**（Tychonoff 定理） |
| **Hausdorff 与闭包公式** | ✅ 保持 Hausdorff，且 $\overline{\prod A_\alpha} = \prod \overline{A_\alpha}$ | ✅ 保持 Hausdorff，且 $\overline{\prod A_\alpha} = \prod \overline{A_\alpha}$ |

## 19.4 习题解析

> [!question] **习题 19.1（原笔记题：直接验证箱拓扑基 $\mathcal{B}_{\text{box}}$ 与积拓扑基 $\mathcal{B}_{\text{prod}}$ 满足拓扑基的两条公理）**
> 设 $\{X_\alpha\}_{\alpha \in J}$ 是一族拓扑空间。验证定义 19.1 中的集族 $\mathcal{B}_{\text{box}} = \{\prod_{\alpha \in J} U_\alpha \mid U_\alpha \text{ 在 } X_\alpha \text{ 中开}\}$ 与 $\mathcal{B}_{\text{prod}}$ 满足 §13 拓扑基的两条公理。

**证明**：
1. **覆盖性**：对乘积空间中的任意元素 $\mathbf{x} = (x_\alpha)_{\alpha \in J} \in \prod_{\alpha \in J} X_\alpha$，取每个坐标开集为全因子空间 $U_\alpha = X_\alpha$，则 $\mathbf{x} \in \prod_{\alpha \in J} X_\alpha$，且该全空间既属于 $\mathcal{B}_{\text{box}}$ 也属于 $\mathcal{B}_{\text{prod}}$（非全空间因子个数为 $0$ 个）。
2. **交集封闭性**：设 $B^{(1)} = \prod_{\alpha \in J} U_\alpha$ 与 $B^{(2)} = \prod_{\alpha \in J} V_\alpha$ 是两个基成员，由笛卡尔积与交集的交换恒等式：
   $$\left(\prod_{\alpha \in J} U_\alpha\right) \cap \left(\prod_{\alpha \in J} V_\alpha\right) = \prod_{\alpha \in J} (U_\alpha \cap V_\alpha)$$
   - 在箱拓扑下，每个 $U_\alpha \cap V_\alpha$ 仍是 $X_\alpha$ 中的开集，故交集本身仍属于 $\mathcal{B}_{\text{box}}$；
   - 在积拓扑下，若 $U_\alpha \neq X_\alpha$ 仅对有限集 $F_1 \subseteq J$ 成立、$V_\alpha \neq X_\alpha$ 仅对有限集 $F_2 \subseteq J$ 成立，则对一切 $\alpha \notin F_1 \cup F_2$ 仍有 $U_\alpha \cap V_\alpha = X_\alpha \cap X_\alpha = X_\alpha$，故非全空间坐标至多落在有限集 $F_1 \cup F_2$ 中，交集本身仍属于 $\mathcal{B}_{\text{prod}}$。$\square$

> [!question] **习题 19.1 补充（原书 §19 Exercise 1, p. 118：证明定理 19.2）**
> 证明定理 19.2：若对每个 $\alpha \in J$，$\mathcal{B}_\alpha$ 是 $X_\alpha$ 的拓扑基，则 $\prod B_\alpha$（箱拓扑下 $B_\alpha \in \mathcal{B}_\alpha$；积拓扑下有限个 $B_\alpha \in \mathcal{B}_\alpha$，其余 $B_\alpha = X_\alpha$）分别构成箱拓扑与积拓扑的基。

**证明**：利用已知拓扑下基的判定准则（引理 13.2）。任取箱拓扑（或积拓扑）中的开集 $W$ 及点 $\mathbf{x} = (x_\alpha) \in W$。则存在定义 19.1（或定理 19.1）中的基元素 $\prod U_\alpha$ 使得 $\mathbf{x} \in \prod U_\alpha \subseteq W$。
- 在箱拓扑下，对每个 $\alpha \in J$，因 $x_\alpha \in U_\alpha$，存在 $B_\alpha \in \mathcal{B}_\alpha$ 使 $x_\alpha \in B_\alpha \subseteq U_\alpha$，于是 $\mathbf{x} \in \prod B_\alpha \subseteq \prod U_\alpha \subseteq W$；
- 在积拓扑下，仅对那有限个满足 $U_{\alpha_i} \neq X_{\alpha_i}$ 的指标 $\alpha_1, \dots, \alpha_n$ 选取 $B_{\alpha_i} \in \mathcal{B}_{\alpha_i}$ 使 $x_{\alpha_i} \in B_{\alpha_i} \subseteq U_{\alpha_i}$，而对其余 $\alpha$ 仍取 $B_\alpha = X_\alpha$，同样有 $\mathbf{x} \in \prod B_\alpha \subseteq \prod U_\alpha \subseteq W$。
由引理 13.2 即证。$\square$

> [!question] **习题 19.3（原笔记题：$\mathbb{R}^\omega$ 在箱拓扑下不连通、在积拓扑下连通的证明）**
> 证明可数无穷乘积 $\mathbb{R}^\omega$ 在箱拓扑下**不是连通的**（连通性定义见 Chapter 3 §23），而在积拓扑下是连通的。

**证明**：
1. **在箱拓扑下 $\mathbb{R}^\omega$ 不连通**：将 $\mathbb{R}^\omega$ 划分为两个非空且互不相交的子集：
   - **有界实序列集** $A = \bigl\{\mathbf{x} = (x_n)_{n=1}^\infty \in \mathbb{R}^\omega \;\big|\; \sup_{n \geqslant 1} |x_n| < \infty\bigr\}$；
   - **无界实序列集** $B = \bigl\{\mathbf{x} = (x_n)_{n=1}^\infty \in \mathbb{R}^\omega \;\big|\; \sup_{n \geqslant 1} |x_n| = \infty\bigr\} = \mathbb{R}^\omega \setminus A$。
   显然 $\mathbf{0} = (0, 0, \dots) \in A \neq \varnothing$，$(1, 2, 3, \dots) \in B \neq \varnothing$，且 $\mathbb{R}^\omega = A \sqcup B$。对任意点 $\mathbf{x} = (x_1, x_2, \dots) \in \mathbb{R}^\omega$，考察箱拓扑中包含 $\mathbf{x}$ 的单位半径基开邻域：
   $$U(\mathbf{x}) = \prod_{n=1}^\infty (x_n - 1, \, x_n + 1)$$
   对任意 $\mathbf{y} \in U(\mathbf{x})$，每个坐标都满足 $|y_n - x_n| < 1$，从而由三角不等式有 $|x_n| - 1 < |y_n| < |x_n| + 1$：
   - 若 $\mathbf{x} \in A$（存在 $M$ 使 $|x_n| \leqslant M$），则对一切 $\mathbf{y} \in U(\mathbf{x})$ 均有 $|y_n| < M + 1$，即 $U(\mathbf{x}) \subseteq A$，故 **$A$ 在箱拓扑中是开集**；
   - 若 $\mathbf{x} \in B$（$|x_n|$ 无上界），则对一切 $\mathbf{y} \in U(\mathbf{x})$ 均有 $|y_n| > |x_n| - 1$ 同样无上界，即 $U(\mathbf{x}) \subseteq B$，故 **$B$ 在箱拓扑中也是开集**！
   因此 $\mathbb{R}^\omega = A \sqcup B$ 是两个非空不相交箱开集的并，故 $\mathbb{R}^\omega$ 在箱拓扑下**不连通**。
2. **在积拓扑下 $\mathbb{R}^\omega$ 连通**：将在 Chapter 3 §23 习题中证明，任意族连通空间的积拓扑空间仍是连通的（先由有限积连通证明在 $\mathbb{R}^\infty$ 上连通，再由稠密子集的闭包 $\overline{\mathbb{R}^\infty} = \mathbb{R}^\omega$ 仍连通得出）。$\square$

> [!question] **习题 19.6（原书 §19 Exercise 6, p. 118）**
> 设 $\mathbf{x}_1, \mathbf{x}_2, \ldots$ 是积空间 $\prod_{\alpha \in J} X_\alpha$ 中的点列。证明：在**积拓扑**下，点列 $\mathbf{x}_n$ 收敛于点 $\mathbf{x}$，当且仅当对每一个坐标指标 $\alpha \in J$，坐标点列 $\pi_\alpha(\mathbf{x}_n)$ 在 $X_\alpha$ 中收敛于 $\pi_\alpha(\mathbf{x})$。该结论对箱拓扑是否成立？

**证明**：
- ($\Rightarrow$)：因为每个坐标投射 $\pi_\alpha$ 在积拓扑（及箱拓扑）下都是连续映射，而连续映射保持收敛点列的极限，故由 $\mathbf{x}_n \to \mathbf{x}$ 必有 $\pi_\alpha(\mathbf{x}_n) \to \pi_\alpha(\mathbf{x})$。
- ($\Leftarrow$)：假设对每个 $\alpha \in J$ 均有 $\pi_\alpha(\mathbf{x}_n) \to \pi_\alpha(\mathbf{x})$。任取积拓扑下包含 $\mathbf{x}$ 的基本开邻域 $U = \prod_{\alpha \in J} U_\alpha$，其中仅有**有限个**指标 $\alpha_1, \dots, \alpha_k$ 满足 $U_{\alpha_i} \neq X_{\alpha_i}$。对每个 $i \in \{1, \dots, k\}$，由于 $\pi_{\alpha_i}(\mathbf{x}_n) \to \pi_{\alpha_i}(\mathbf{x}) \in U_{\alpha_i}$，存在正整数 $N_i$ 使得当 $n \geqslant N_i$ 时 $\pi_{\alpha_i}(\mathbf{x}_n) \in U_{\alpha_i}$。因为指标个数有限，我们得以取最大下标 $N = \max(N_1, \dots, N_k)$！于是当 $n \geqslant N$ 时，对所有 $i=1,\dots,k$ 有 $\pi_{\alpha_i}(\mathbf{x}_n) \in U_{\alpha_i}$，而对其余 $\alpha$ 自动有 $\pi_\alpha(\mathbf{x}_n) \in X_\alpha = U_\alpha$，即 $\mathbf{x}_n \in U$。故 $\mathbf{x}_n \to \mathbf{x}$。
- **对箱拓扑不成立**：例如在 $\mathbb{R}^\omega$ 中取点列 $\mathbf{x}_n = (1/n, 1/n, 1/n, \dots)$，它在每个坐标上都收敛于 $0$，但在箱拓扑中不收敛于 $\mathbf{0}$（不落入箱邻域 $\prod_{k=1}^\infty (-1/k, 1/k)$ 中）。$\square$

> [!question] **习题 19.7**
> 记 $\mathbb{R}^\infty$ 为 $\mathbb{R}^\omega$ 中全体“除有限个坐标外均为 $0$”（即最终为 $0$）的实序列构成的子集。求 $\mathbb{R}^\infty$ 在 $\mathbb{R}^\omega$ 的积拓扑与箱拓扑下的闭包。

**解**：
1. **在积拓扑下，$\overline{\mathbb{R}^\infty} = \mathbb{R}^\omega$（即 $\mathbb{R}^\infty$ 在积拓扑下稠密）**：任取 $\mathbf{x} = (x_1, x_2, \dots) \in \mathbb{R}^\omega$ 及包含 $\mathbf{x}$ 的任意积拓扑基元素 $U = U_1 \times \cdots \times U_N \times \mathbb{R} \times \mathbb{R} \times \cdots$。直接构造截断序列 $\mathbf{y} = (x_1, \dots, x_N, 0, 0, \dots)$，则显然 $\mathbf{y} \in \mathbb{R}^\infty$ 且 $\mathbf{y} \in U$。这说明 $U \cap \mathbb{R}^\infty \neq \varnothing$，故 $\overline{\mathbb{R}^\infty} = \mathbb{R}^\omega$。
2. **在箱拓扑下，$\overline{\mathbb{R}^\infty} = \mathbb{R}^\infty$（即 $\mathbb{R}^\infty$ 在箱拓扑下是闭集）**：任取 $\mathbf{x} = (x_1, x_2, \dots) \in \mathbb{R}^\omega \setminus \mathbb{R}^\infty$，则 $\mathbf{x}$ 有无穷多个坐标非零。对每个坐标 $n \in \mathbb{Z}_+$，构造开区间：
   $$U_n = \begin{cases} \bigl(x_n - \frac{1}{2}|x_n|, \, x_n + \frac{1}{2}|x_n|\bigr), & \text{若 } x_n \neq 0, \\ (-1, 1), & \text{若 } x_n = 0. \end{cases}$$
   注意当 $x_n \neq 0$ 时，$0 \notin U_n$！因此在箱拓扑基开集 $U = \prod_{n=1}^\infty U_n \ni \mathbf{x}$ 中，任何元素在无穷多个非零坐标位置上都不可能取 $0$，即 $U \cap \mathbb{R}^\infty = \varnothing$。这证明了补集 $\mathbb{R}^\omega \setminus \mathbb{R}^\infty$ 在箱拓扑中是开集，故 $\mathbb{R}^\infty$ 在箱拓扑中是闭集！

## 相关链接

- 上一节: [[18_Continuous_Functions|§18 Continuous Functions]]
- 下一节: [[20_The_Metric_Topology_I|§20 The Metric Topology (I)]]
- 返回总览: [[00_Chapter_02_Overview|Chapter 2 Overview]]
