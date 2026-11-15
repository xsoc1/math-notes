---
title: "§22 商拓扑"
date: 2026-07-08
tags:
  - topology/munkres/chapter2
  - topology/quotient-topology
  - topology/quotient-map
aliases:
  - "The Quotient Topology"
  - "22_The_Quotient_Topology"
---

# §22 The Quotient Topology

> [!abstract] 核心问题
> 如何将“把拓扑空间中的某些点或边界粘合（等同）起来构造新空间”这一直观几何操作严格公理化？商映射（Quotient Map）与一般的连续满射有何本质区别？如何利用商空间的万有性质（Universal Property）简洁地判定商空间上诱导映射的连续性？

> [!important] **商拓扑——“粘合（Gluing）”空间的艺术**
> 商拓扑是几何与代数拓扑中构造新空间最强大的工具。直观上，商空间是通过将原空间 $X$ 中的某些子集或边界按照指定的等价关系 $\sim$“粘合”在一起而得到的新空间：
> - 将闭区间 $[0,1]$ 的两个端点 $0$ 与 $1$ 粘合，得到圆周 $S^1$；
> - 将单位正方形 $[0,1] \times [0,1]$ 的两组对边同向粘合得到二维环面 $T^2$，将一对对边反向扭转粘合得到 Möbius 带或 Klein 瓶；
> - 将球面 $S^2$ 上的每对对径点 $x$ 与 $-x$ 等同，得到实射影平面 $\mathbb{R}P^2$。
>
> **商拓扑的公理化机制**：如果说子空间拓扑和积拓扑是由映射 $f: X \to Y$ 从目标空间往回“拉回（pull-back）”生成的**最粗拓扑**，那么商拓扑则是由满射 $p: X \to A$ 从定义域往前“推出（push-forward）”生成的**最细拓扑**——规定 $A$ 中的子集 $U$ 为开集，**当且仅当**它的原像 $p^{-1}(U)$ 在母空间 $X$ 中为开集。
>
> **核心定理（商空间的万有性质，定理 22.2）**：任何在等价类（$p$ 的纤维）上取常值的连续映射 $g: X \to Z$，都可以唯一地下降（诱导）为商空间上的连续映射 $f: Y \to Z$（使得 $g = f \circ p$）。这是在商空间上构造连续映射并证明同胚的黄金法则。

## 22.1 商映射、商拓扑与商空间的定义

> [!note] **定义 22.1（商映射 / Quotient Map）**
> 设 $X$ 和 $Y$ 是两个拓扑空间，$p: X \to Y$ 是一个**满射（surjective map）**。称 $p$ 为一个 **商映射（quotient map）**，如果对于 $Y$ 的任意子集 $U \subseteq Y$，均有以下充要条件成立：
> $$U \text{ 在 } Y \text{ 中是开集} \iff p^{-1}(U) \text{ 在 } X \text{ 中是开集}$$

> [!important] **理解要点：商映射 vs. 连续满射**
> - 一般的**连续满射**仅保证单向蕴含“$U$ 在 $Y$ 中开 $\implies p^{-1}(U)$ 在 $X$ 中开”；
> - **商映射**则进一步要求逆向蕴含“只要 $p^{-1}(U)$ 在 $X$ 中开，那么 $U$ 在 $Y$ 中就必须是开集”（这种性质称为**强连续性**）。等价地，由补集对偶可知，满射 $p: X \to Y$ 是商映射当且仅当：
>   $$F \text{ 在 } Y \text{ 中是闭集} \iff p^{-1}(F) \text{ 在 } X \text{ 中是闭集}$$

为了刻画商映射的局部性质，引入**饱和集（Saturated Set）**的概念：
- 称子集 $C \subseteq X$ 关于映射 $p: X \to Y$ 是 **饱和的（saturated）**，如果 $C$ 完整地包含它所触及的每一个纤维 $p^{-1}(\{y\})$，即存在 $Y$ 的子集 $V \subseteq Y$ 使得 $C = p^{-1}(V)$（等价于 $C = p^{-1}(p(C))$）。
- 于是，“$p: X \to Y$ 是商映射”等价于说：**$p$ 是连续满射，且 $p$ 将 $X$ 中的每一个饱和开集映为 $Y$ 中的开集（或将每一个饱和闭集映为 $Y$ 中的闭集）**。

> [!note] **定义 22.2（商拓扑 / Quotient Topology）**
> 设 $X$ 是一个拓扑空间，$A$ 是一个集合，$p: X \to A$ 是一个满射。在集合 $A$ 上定义子集族：
> $$\mathcal{T}_p = \bigl\{ U \subseteq A \;\big|\; p^{-1}(U) \text{ 在 } X \text{ 中是开集} \bigr\}$$
> 则 $\mathcal{T}_p$ 构成 $A$ 上的一个拓扑（由原像 $p^{-1}$ 保持空集、全集、任意并与有限交立即可证），称为由满射 $p$ 诱导的 **商拓扑（quotient topology）**。

> [!note] **定义 22.3（商空间 / Quotient Space / Decomposition Space）**
> 设 $X$ 是拓扑空间，$X^*$ 是 $X$ 的一个划分（即由两两不交的非空子集构成的覆盖，等价于 $X$ 上某个等价关系 $\sim$ 的全体等价类集合 $X/{\sim}$）。设 $p: X \to X^*$ 为将每个点 $x \in X$ 映为其所属等价类 $[x] \in X^*$ 的自然投射满射。在 $X^*$ 上赋予由 $p$ 诱导的商拓扑，所得的拓扑空间 $X^*$（或记作 $X/{\sim}$）称为 $X$ 的 **商空间（quotient space）**。

## 22.2 商映射的判定与子空间限制性质

根据定义，若连续满射 $p: X \to Y$ 满足“将所有开集映为开集”（**开映射 / open map**）或“将所有闭集映为闭集”（**闭映射 / closed map**），则它自然将所有饱和开集（或饱和闭集）映为开集（或闭集），因此立得：

> [!note] **定理 22.1（开满射与闭满射必为商映射）** ^theorem-22-1
> 设 $p: X \to Y$ 是连续满射。若 $p$ 是**开映射**或**闭映射**，则 $p$ 必为商映射。

**证明**：设 $p$ 是连续开满射。若 $U$ 在 $Y$ 中开，由 $p$ 连续知 $p^{-1}(U)$ 在 $X$ 中开；反之，若 $p^{-1}(U)$ 在 $X$ 中开，因为 $p$ 是满射且是开映射，故 $U = p\bigl(p^{-1}(U)\bigr)$ 在 $Y$ 中是开集。因此 $p$ 是商映射。当 $p$ 是连续闭满射时，对闭集完全同理。$\square$

> [!warning] **易错警示：商映射的若干反直觉性质**
> 1. **商映射未必是开映射，也未必是闭映射**：例如将 $\mathbb{R}$ 中闭半直线 $C = [0, +\infty)$ 捏合成一点的商映射 $q: \mathbb{R} \to \mathbb{R}/C$ **是闭商映射，但不是开映射**（对任意闭集 $F \subseteq \mathbb{R}$，其饱和化为 $F$ 或 $F \cup C$，仍为闭集，故 $q$ 是闭映射；但开区间 $(0, 1)$ 的饱和化为 $[0, +\infty)$ 非开，故 $q$ 不是开映射）；若将有理数集 $\mathbb{Q} \subseteq \mathbb{R}$ 捏合成一点，则商映射 $\mathbb{R} \to \mathbb{R}/\mathbb{Q}$ **既不是开映射也不是闭映射**（开集 $(0, 1)$ 的饱和化为 $(0, 1) \cup \mathbb{Q}$ 非开，闭单点集 $\{0\}$ 的饱和化为 $\mathbb{Q}$ 非闭）；
> 2. **两个商映射的复合仍是商映射**，但**商映射限制在一般子空间 $A \subseteq X$ 上未必仍是商映射**！常见充分条件是：当子空间 $A$ 是**饱和开集或饱和闭集**时，或者当 **$p$ 是开映射且 $A$ 是开子集**（或 **$p$ 是闭映射且 $A$ 是闭子集**）时，限制映射 $p|_A: A \to p(A)$ 保证是商映射（见下方定理 22.1 补充；注意这些是充分条件而非必要条件，且单凭 $p$ 是开映射并不能保证它在任意闭子集 $A$ 上的限制仍是商映射）；
> 3. **两个商映射的笛卡尔积 $p \times q$ 未必是商映射**（除非因子空间满足局部紧致性等良好条件，见习题 22.6 Whitehead 定理）；
> 4. **Hausdorff 空间的商空间未必是 Hausdorff 空间**！

> [!note] **定理 22.1 补充（商映射在子空间上的限制）**
> 设 $p: X \to Y$ 是商映射，$A \subseteq X$ 是 $X$ 的子空间，赋予像集 $p(A) \subseteq Y$ 子空间拓扑，考虑限制满射 $q = p|_A: A \to p(A)$：
> 1. 若 $A$ 是 **饱和开集** 或 **饱和闭集**，则 $q: A \to p(A)$ 是商映射；
> 2. 若 $p$ 本身是开映射（或闭映射），且 $A$ 是任意开子集（或任意闭子集），则 $q: A \to p(A)$ 也是商映射。

**证明（以 $A$ 是饱和开集为例）**：首先因为 $A$ 是饱和集，对任意 $V \subseteq p(A)$，恆有 $q^{-1}(V) = p^{-1}(V) \cap A = p^{-1}(V)$，且 $p(A) = p(A)$ 满足 $p^{-1}(p(A)) = A$。因为 $A$ 在 $X$ 中开且 $p$ 是商映射，故 $p(A)$ 在 $Y$ 中是开集。
任取 $V \subseteq p(A)$，假设 $q^{-1}(V) = p^{-1}(V)$ 在 $A$ 中是开集。由于 $A$ 在 $X$ 中是开集，由引理 16.2 知 $p^{-1}(V)$ 在母空间 $X$ 中也是开集。再由 $p$ 是商映射知，$V$ 在 $Y$ 中是开集，从而 $V = V \cap p(A)$ 在子空间 $p(A)$ 中也是开集。故 $q$ 是商映射。$\square$

## 22.3 商空间的万有性质（Universal Property）

> [!note] **定理 22.2（商映射与商空间的万有性质）** ^theorem-22-2
> 设 $p: X \to Y$ 是商映射，$Z$ 是任意拓扑空间。
> 1. 映射 $f: Y \to Z$ 是连续的，**当且仅当**复合映射 $g = f \circ p: X \to Z$ 是连续的；
> 2. **（诱导连续映射与诱导同胚）** 设 $g: X \to Z$ 是一个连续映射，它在 $p$ 的每一个纤维 $p^{-1}(\{y\})$ 上取常值（即 $p(x_1) = p(x_2) \implies g(x_1) = g(x_2)$）。则 $g$ 唯一地诱导出一个映射 $f: Y \to Z$ 使得 $f \circ p = g$，并且：
>    - 诱导映射 $f: Y \to Z$ 必是**连续映射**；
>    - 进一步，映射 $f: Y \to Z$ 是一个**同胚**，当且仅当 $g: X \to Z$ 本身是一个**商映射**且满足 $g(x_1) = g(x_2) \iff p(x_1) = p(x_2)$（此时 $f$ 为双射）。
>
> ```mermaid
> graph TD
>     X["X"] -- "p (商映射)" --> Y["Y = X/~"]
>     X -- "g (在纤维上常值的连续映射)" --> Z["Z"]
>     Y -. "存在唯一连续映射 f" .-> Z
> ```

**证明**：
1. ($\Rightarrow$) 若 $f$ 连续，由于商映射 $p$ 连续，复合映射 $g = f \circ p$ 自然连续。
   ($\Leftarrow$) 设 $g = f \circ p$ 连续。任取 $Z$ 中的开集 $V$，则
   $$p^{-1}\bigl(f^{-1}(V)\bigr) = (f \circ p)^{-1}(V) = g^{-1}(V)$$
   因为 $g$ 连续，故 $g^{-1}(V)$ 在 $X$ 中是开集。又因为 $p: X \to Y$ 是商映射，由 $p^{-1}(f^{-1}(V))$ 在 $X$ 中开立即可推知 **$f^{-1}(V)$ 在 $Y$ 中是开集**！故 $f$ 连续。
2. 当 $g$ 在每个纤维 $p^{-1}(\{y\})$ 上为常值时，对每个 $y \in Y$ 取 $x \in p^{-1}(\{y\})$ 并定义 $f(y) = g(x)$，该定义与代表元 $x$ 的选取无关，故 $f: Y \to Z$ 良定义且唯一满足 $f \circ p = g$。由 (1) 知 $f$ 连续。
   若进一步 $g: X \to Z$ 是商映射且 $f$ 是双射，则对 $Y$ 中任意开集 $U$，由于 $p$ 连续，$p^{-1}(U) = g^{-1}(f(U))$ 在 $X$ 中开；再由 $g$ 是商映射知 $f(U)$ 在 $Z$ 中是开集，故 $f$ 是开双射（即同胚）。$\square$

## 22.4 经典几何商空间算例

> [!example] **例 22.1（粘合线段两端得到圆周：$[0,1]/{\sim} \cong S^1$）**
> 在闭区间 $X = [0,1]$ 上定义等价关系：将两端点 $0 \sim 1$ 等同，其余内部点 $t \in (0,1)$ 各自成类。为证明商空间 $[0,1]/{\sim}$ 同胚于单位圆周 $S^1 \subseteq \mathbb{R}^2$，考察映射 $g: [0,1] \to S^1$：
> $$g(t) = (\cos 2\pi t, \, \sin 2\pi t)$$
> 1. $g$ 是连续满射，且恰好仅在两端点处有 $g(0) = g(1) = (1,0)$；
> 2. 因为 $[0,1]$ 是紧空间，$S^1$ 是 Hausdorff 空间，将在第三章（定理 26.6）证明 $g$ 必是**闭映射**（也可直接验证 $[0,1]$ 中饱和闭集的像在 $S^1$ 中闭），从而由定理 22.1 知 $g$ 是**商映射**；
> 3. 由商空间的万有性质（定理 22.2），$g$ 诱导的双射 $f: [0,1]/{\sim} \xrightarrow{\sim} S^1$ 是**同胚**！
> 4. **全实直线上的周期商映射 $p: \mathbb{R} \to S^1$**：同样地，全实直线上的周期映射 $p: \mathbb{R} \to S^1, \, p(t) = (\cos 2\pi t, \, \sin 2\pi t)$ 也是**商映射**（诱导同胚 $\mathbb{R}/\mathbb{Z} \cong S^1$）。事实上，$p$ 是连续满射，且其限制在闭区间 $[0, 1]$ 上恰为上述已证的商映射 $g = p \circ j$（其中 $j: [0, 1] \hookrightarrow \mathbb{R}$ 为子空间包含映射）；若子集 $U \subseteq S^1$ 满足 $p^{-1}(U)$ 在 $\mathbb{R}$ 中是开集，则 $g^{-1}(U) = j^{-1}\bigl(p^{-1}(U)\bigr) = p^{-1}(U) \cap [0, 1]$ 在 $[0, 1]$ 中是开集，由 $g$ 是商映射立知 $U$ 在 $S^1$ 中是开集，故 $p: \mathbb{R} \to S^1$ 是商映射。

> [!example] **例 22.2（正方形粘合对边得到二维环面：$[0,1]^2/{\sim} \cong S^1 \times S^1$）**
> 在单位正方形 $[0,1] \times [0,1]$ 上将左右对边同向粘合 $(0, y) \sim (1, y)$，上下对边同向粘合 $(x, 0) \sim (x, 1)$（四角点 $(0,0) \sim (1,0) \sim (0,1) \sim (1,1)$ 粘合为一点）。利用映射 $g(s, t) = \bigl((\cos 2\pi s, \sin 2\pi s), (\cos 2\pi t, \sin 2\pi t)\bigr): [0,1]^2 \to S^1 \times S^1$（紧空间到 Hausdorff 空间的连续满射必为闭商映射），立即由定理 22.2 证得商空间同胚于环面 $T^2 = S^1 \times S^1$。

> [!example] **例 22.3（圆盘捏边界得球面 $B^2/\partial B^2 \cong S^2$ 与实射影平面 $\mathbb{R}P^2$）**
> - **圆盘边界捏合为球面**：将二维闭单位圆盘 $B^2 = \{(x,y) \in \mathbb{R}^2 \mid x^2 + y^2 \leqslant 1\}$ 的整个边界圆周 $S^1 = \partial B^2$ 捏合为一个单点，其余内部点各自成类，所得商空间 $B^2/S^1$ 同胚于二维球面 $S^2$。
> - **实射影平面 $\mathbb{R}P^2$**：在二维球面 $S^2$ 上定义对径点等同关系 $x \sim -x$，所得商空间 $S^2/{\sim}$ 称为实射影平面 $\mathbb{R}P^2$；等价地，它也同胚于在去原点三维空间 $\mathbb{R}^3 \setminus \{\mathbf{0}\}$ 上模去非零标量伸缩等价关系 $\mathbf{v} \sim \lambda \mathbf{v}$（$\lambda \in \mathbb{R} \setminus \{0\}$）所得的商空间 $(\mathbb{R}^3 \setminus \{\mathbf{0}\})/{\sim}$（即 $\mathbb{R}^3$ 中全体过原点的直线空间）。

> [!example] **例 22.4（Möbius 带 / Möbius Band）**
> 在单位正方形 $X = [0, 1] \times [0, 1]$ 上定义边界反向粘合等价关系：将左右两条竖直边按相反方向粘合，即对所有 $y \in [0, 1]$ 令
> $$(0, y) \sim (1, 1 - y)$$
> 其余点仅与自身等价。所得的商空间 $[0, 1]^2/{\sim}$ 即为经典的不可定向曲面——**Möbius 带**。

> [!example] **例 22.5（楔和 / Wedge Sum $X \vee Y$）**
> 设 $(X, x_0)$ 和 $(Y, y_0)$ 是两个带有指定基点（base point）的拓扑空间。先取两者的拓扑不交并 $X \sqcup Y$，再模去将两个基点粘合为一点的等价关系 $x_0 \sim y_0$（其余点各自成类），所得的商空间记作
> $$X \vee Y = (X \sqcup Y) / (x_0 \sim y_0)$$
> 称为 $(X, x_0)$ 与 $(Y, y_0)$ 的**楔和（wedge sum / 一点并）**（例如两个圆周的楔和 $S^1 \vee S^1$ 同胚于平面上的“8”字形曲线）。

## 22.5 习题解析

> [!question] **习题 22.2**
> 1. 设 $p: X \to Y$ 是连续映射。证明：若存在连续映射 $f: Y \to X$ 使得 $p \circ f = \operatorname{id}_Y$（称 $f$ 为 $p$ 的一个截面 / section，或 $Y$ 是 $X$ 的收缩核），则 $p$ 必是商映射。
> 2. 若 $A \subseteq X$，一个连续映射 $r: X \to A$ 满足对所有 $a \in A$ 有 $r(a) = a$（即 $r|_A = \operatorname{id}_A$），则称 $r$ 为 $X$ 到 $A$ 的一个 **收缩（retraction）**。证明收缩映射 $r: X \to A$ 必是商映射。

**证明**：
1. 首先因为 $p \circ f = \operatorname{id}_Y$ 是满射，故 $p$ 必为满射。任取子集 $U \subseteq Y$：若 $U$ 在 $Y$ 中开，由 $p$ 连续知 $p^{-1}(U)$ 在 $X$ 中开；反之，假设 $p^{-1}(U)$ 在 $X$ 中是开集。因为 $f: Y \to X$ 连续，所以 $p^{-1}(U)$ 在 $f$ 下的原像在 $Y$ 中必是开集。但注意到：
   $$f^{-1}\bigl(p^{-1}(U)\bigr) = (p \circ f)^{-1}(U) = \operatorname{id}_Y^{-1}(U) = U$$
   因此 $U$ 在 $Y$ 中是开集！这证明了 $p$ 是商映射。
2. 设 $j: A \hookrightarrow X$ 为子空间包含映射，则 $j$ 连续，且收缩条件 $r|_A = \operatorname{id}_A$ 恰好就是 $r \circ j = \operatorname{id}_A$。直接应用 (1) 即知收缩映射 $r: X \to A$ 是商映射。$\square$

> [!question] **习题 22.3（原书 §22 Exercise 3, p. 145：是商映射但既非开映射亦非闭映射的经典例子）**
> 设 $\pi_1: \mathbb{R} \times \mathbb{R} \to \mathbb{R}$ 为第一坐标投射 $\pi_1(x, y) = x$。在 $\mathbb{R}^2$ 中定义闭子空间
> $$A = \bigl\{(x, y) \in \mathbb{R}^2 \;\big|\; x \geqslant 0 \text{ 或 } y = 0\bigr\}$$
> （即闭右半平面与整条 $x$ 轴的并集），并令 $q = \pi_1|_A: A \to \mathbb{R}$。
> (a) 证明 $q$ 是**商映射**；
> (b) 证明 $q$ **既不是开映射，也不是闭映射**！（另附：非饱和闭子空间 $B = \{xy = 1\} \cup \{(0,0)\}$ 上限制映射不再是商映射的反例。）

**证明**：
1. **(a) 证明 $q: A \to \mathbb{R}$ 是商映射**：
   首先，$\pi_1$ 连续，故其子空间限制 $q = \pi_1|_A: A \to \mathbb{R}$ 是连续映射。又因为整条 $x$ 轴 $\mathbb{R} \times \{0\}$ 包含于 $A$ 中，我们可以直接构造映射 $s: \mathbb{R} \to A, \, s(t) = (t, 0)$。显然 $s$ 是连续映射，且对一切 $t \in \mathbb{R}$ 满足：
   $$(q \circ s)(t) = q(t, 0) = t = \operatorname{id}_{\mathbb{R}}(t)$$
   即 $s$ 是 $q$ 的一个连续右逆（截面）！直接调用**习题 22.2(1)**，立即证得 **$q: A \to \mathbb{R}$ 必定是商映射**！
2. **(b) 证明 $q$ 既不是开映射，也不是闭映射**：
   - **$q$ 不是开映射**：在子空间 $A$ 中考察集合
     $$U = \bigl\{(x, y) \in A \;\big|\; y > 1\bigr\} = \bigl(\mathbb{R} \times (1, +\infty)\bigr) \cap A = [0, +\infty) \times (1, +\infty)$$
     因为 $\mathbb{R} \times (1, +\infty)$ 在 $\mathbb{R}^2$ 中是开集，所以 $U$ 在子空间 $A$ 中是**开集**。然而 $U$ 在 $q$ 下的正向像为 $q(U) = [0, +\infty)$，它在 $\mathbb{R}$ 中**不是开集**！故 $q$ 不是开映射。
   - **$q$ 不是闭映射**：在子空间 $A$ 中考察双曲线的正分支
     $$F = \bigl\{(x, y) \in A \;\big|\; xy = 1, \, x > 0\bigr\} = \bigl\{(x, 1/x) \;\big|\; x > 0\bigr\}$$
     因为 $F = \{(x, y) \in \mathbb{R}^2 \mid xy = 1\} \cap \{(x, y) \in \mathbb{R}^2 \mid x \geqslant 0\}$ 是 $\mathbb{R}^2$ 中的闭集且包含于 $A$，故 $F$ 在子空间 $A$ 中是**闭集**。然而 $F$ 在 $q$ 下的正向像为开射线 $q(F) = (0, +\infty)$，它在 $\mathbb{R}$ 中**不是闭集**！故 $q$ 也不是闭映射。
3. **补充反例（商映射 $\pi_1$ 限制在闭子空间 $B$ 上不再是商映射）**：
   若改取 $\mathbb{R}^2$ 中的闭子集 $B = \{(x, y) \in \mathbb{R}^2 \mid xy = 1\} \cup \{(0, 0)\}$，令 $\tilde{q} = \pi_1|_B: B \to \mathbb{R}$。则 $\tilde{q}$ 是连续满射，但在子空间 $B$ 中，单点集 $\{(0, 0)\} = B((0, 0), 1) \cap B$ 是孤立点（即在 $B$ 中是**开集**），且恰好是单点集 $\{0\} \subseteq \mathbb{R}$ 的原像 $\tilde{q}^{-1}(\{0\}) = \{(0, 0)\}$；然而 $\{0\}$ 在 $\mathbb{R}$ 中不是开集，故 $\tilde{q}: B \to \mathbb{R}$ **不是商映射**。$\square$

> [!question] **习题 22.3 补充（原笔记旧题：实直线模去有理数群的商空间 $\mathbb{R}/\mathbb{Q}$ 具有平庸拓扑）**
> 在实直线 $\mathbb{R}$ 上定义等价关系 $x \sim y \iff x - y \in \mathbb{Q}$。证明商空间 $\mathbb{R}/\mathbb{Q}$ 在商拓扑下具有**平庸拓扑（indiscrete / trivial topology）**。

**证明**：设 $\pi: \mathbb{R} \to \mathbb{R}/\mathbb{Q}$ 为自然商投射，任取 $\mathbb{R}/\mathbb{Q}$ 中的**非空**开集 $V \neq \varnothing$。由商拓扑定义，其原像 $U = \pi^{-1}(V)$ 是 $\mathbb{R}$ 中的非空饱和开集。因为 $U$ 在 $\mathbb{R}$ 中非空开，必存在某个非空开区间 $(a, b) \subseteq U$（$a < b$）。另一方面，因为 $U$ 关于等价关系 $x \sim y \iff x - y \in \mathbb{Q}$ 是饱和集，对任意 $x \in U$ 和任意有理数 $q \in \mathbb{Q}$，必有 $x + q \in U$，即 $U$ 包含开区间 $(a, b)$ 的全体有理平移 $\bigcup_{q \in \mathbb{Q}} (a + q, b + q) \subseteq U$。由有理数集 $\mathbb{Q}$ 在 $\mathbb{R}$ 中的稠密性，对任意实数 $z \in \mathbb{R}$，开区间 $(z - b, z - a)$ 内必存在有理数 $q \in \mathbb{Q}$，即 $z \in (a + q, b + q) \subseteq U$！故 $\pi^{-1}(V) = U = \mathbb{R}$，从而 $V = \pi(\mathbb{R}) = \mathbb{R}/\mathbb{Q}$。这说明 $\mathbb{R}/\mathbb{Q}$ 中的开集只有 $\varnothing$ 和全空间 $\mathbb{R}/\mathbb{Q}$。$\square$

> [!question] **习题 22.4**
> 1. 在 $\mathbb{R}^2$ 上定义等价关系 $(x_0, y_0) \sim (x_1, y_1) \iff x_0 + y_0^2 = x_1 + y_1^2$。证明其商空间同胚于实直线 $\mathbb{R}$。
> 2. 在 $\mathbb{R}^2$ 上定义等价关系 $(x_0, y_0) \sim (x_1, y_1) \iff x_0^2 + y_0^2 = x_1^2 + y_1^2$。证明其商空间同胚于闭射线 $[0, +\infty)$。

**证明**：
1. 构造映射 $g: \mathbb{R}^2 \to \mathbb{R}, \, g(x, y) = x + y^2$。显然 $g$ 是连续满射，且 $g(x_0, y_0) = g(x_1, y_1) \iff (x_0, y_0) \sim (x_1, y_1)$。由定理 22.2，只需证 $g$ 是商映射。为此构造连续截面 $f: \mathbb{R} \to \mathbb{R}^2, \, f(t) = (t, 0)$，则 $(g \circ f)(t) = t + 0^2 = t = \operatorname{id}_\mathbb{R}(t)$。由习题 22.2(1) 立知 $g$ 是商映射，故商空间 $\mathbb{R}^2/{\sim} \cong \mathbb{R}$。
2. 构造映射 $g: \mathbb{R}^2 \to [0, +\infty), \, g(x, y) = x^2 + y^2$。它是连续满射，且存在连续截面 $f: [0, +\infty) \to \mathbb{R}^2, \, f(t) = (\sqrt{t}, 0)$ 满足 $(g \circ f)(t) = t = \operatorname{id}_{[0, +\infty)}(t)$。由习题 22.2(1) 知 $g$ 是商映射，再由定理 22.2 即得 $\mathbb{R}^2/{\sim} \cong [0, +\infty)$。$\square$

> [!question] **习题 22.5（原笔记题 & Whitehead 定理特例：商映射与局部紧 Hausdorff 空间的乘积仍是商映射）**
> 设 $p: X \to Y$ 是商映射，$Z$ 是局部紧 Hausdorff 空间（定义见 Chapter 3 §29）。证明笛卡尔积映射 $\pi = p \times \operatorname{id}_Z: X \times Z \to Y \times Z$ 也是商映射。

**证明**：显然 $\pi = p \times \operatorname{id}_Z$ 是连续满射。设 $W \subseteq Y \times Z$ 使得 $\pi^{-1}(W)$ 在 $X \times Z$ 中是开集，我们需要证明 $W$ 在 $Y \times Z$ 中也是开集。任取点 $(y_0, z_0) \in W$，取 $x_0 \in p^{-1}(\{y_0\})$，则 $(x_0, z_0) \in \pi^{-1}(W)$。
1. 因为 $\pi^{-1}(W)$ 在 $X \times Z$ 中开，存在包含 $x_0$ 的开集 $U_0 \subseteq X$ 和包含 $z_0$ 的开集 $V_0 \subseteq Z$ 使得 $U_0 \times V_0 \subseteq \pi^{-1}(W)$。由 $Z$ 的局部紧 Hausdorff 性质（§29 定理 29.2），存在 $z_0$ 的开邻域 $V \subseteq Z$，其闭包 $\overline{V}$ 是紧集且满足 $z_0 \in V \subseteq \overline{V} \subseteq V_0$，于是 $U_0 \times \overline{V} \subseteq \pi^{-1}(W)$。
2. 定义集合 $U := \bigl\{x \in X \;\big|\; \{x\} \times \overline{V} \subseteq \pi^{-1}(W)\bigr\}$。注意：
   - **饱和性**：若 $x \in U$ 且 $p(x') = p(x)$，则对任意 $z \in \overline{V}$，有 $\pi(x', z) = (p(x'), z) = (p(x), z) = \pi(x, z) \in W$，即 $(x', z) \in \pi^{-1}(W)$，故 $x' \in U$。因此 $U = p^{-1}(p(U))$ 是关于 $p$ 的**饱和集**！
   - **开集性**：对任意 $x \in U$，由于紧致切片 $\{x\} \times \overline{V}$ 包含于开集 $\pi^{-1}(W)$ 中，由管状引理（§26 定理 26.8，Tube Lemma）存在包含 $x$ 的开邻域 $U_x \subseteq X$ 使得 $U_x \times \overline{V} \subseteq \pi^{-1}(W)$，即 $x \in U_x \subseteq U$。故 $U$ 在 $X$ 中是**开集**！
3. 因为 $U$ 是 $X$ 中的饱和开集且 $p: X \to Y$ 是商映射，像集 $p(U)$ 在 $Y$ 中必是**开集**！从而 $p(U) \times V$ 是 $Y \times Z$ 中包含 $(y_0, z_0)$ 的基开邻域，且满足 $\pi^{-1}(p(U) \times V) = U \times V \subseteq U \times \overline{V} \subseteq \pi^{-1}(W) \implies p(U) \times V \subseteq W$。这证明了 $W$ 在 $Y \times Z$ 中是开集，故 $p \times \operatorname{id}_Z$ 是商映射。$\square$

> [!question] **补充练习（经典非 Hausdorff 流形算例：带两个原点的直线 / Line with Two Origins；注：原书 §22 Exercise 6, p. 145 讨论的是实直线 $K$-拓扑空间 $\mathbb{R}_K$ 将 $K=\{1/n\mid n\in\mathbb{Z}_+\}$ 捏合为一点所得的 $T_1$ 非 Hausdorff 商空间及 $p\times p$ 非商映射性质，本题为微分流形标准反例）**
> 设 $Y \subseteq \mathbb{R}^2$ 为两条平行直线 $Y = (\mathbb{R} \times \{1\}) \cup (\mathbb{R} \times \{-1\})$。在 $Y$ 上定义等价关系：当 $x \neq 0$ 时将上下对应的点 $(x, 1) \sim (x, -1)$ 粘合，而两个原点 $p = (0, 1)$ 与 $q = (0, -1)$ **不粘合**（各自单独成为等价类）。证明所得商空间 $X = Y/{\sim}$ 是**局部欧氏空间**（每个点都有同胚于实直线 $\mathbb{R}$ 或开区间的开邻域），但 **$X$ 不是 Hausdorff 空间**！

**证明**：设 $\pi: Y \to X = Y/{\sim}$ 为自然商映射。
1. **证明 $X$ 是局部欧氏空间（每点均有同胚于 $\mathbb{R}$ 的开邻域）**：
   在商空间 $X$ 中考察两个子集：
   $$U_+ := X \setminus \{[q]\} = \pi(\mathbb{R} \times \{1\}), \qquad U_- := X \setminus \{[p]\} = \pi(\mathbb{R} \times \{-1\})$$
   - **$U_+$ 与 $U_-$ 在 $X$ 中是开集且覆盖 $X$**：计算它们在 $\pi$ 下的饱和原像：
     $$\pi^{-1}(U_+) = (\mathbb{R} \times \{1\}) \cup \bigl((\mathbb{R} \setminus \{0\}) \times \{-1\}\bigr), \qquad \pi^{-1}(U_-) = (\mathbb{R} \times \{-1\}) \cup \bigl((\mathbb{R} \setminus \{0\}) \times \{1\}\bigr)$$
     由于 $\mathbb{R} \times \{\pm 1\}$ 与 $(\mathbb{R} \setminus \{0\}) \times \{\pm 1\}$ 在 $Y$ 中都是开集，故 $\pi^{-1}(U_+)$ 和 $\pi^{-1}(U_-)$ 在 $Y$ 中是开集，由商拓扑定义知 **$U_+$ 和 $U_-$ 在 $X$ 中都是开集**，且显然 $X = U_+ \cup U_-$。
   - **$U_+ \cong \mathbb{R}$ 且 $U_- \cong \mathbb{R}$**：考察上直线嵌入映射与商映射的复合 $\varphi_+: \mathbb{R} \to U_+, \, \varphi_+(t) = \pi(t, 1)$。显然 $\varphi_+$ 是连续双射（$t = 0$ 对应 $[p]$，$t \neq 0$ 对应 $[(t, 1)] = [(t, -1)]$）。进一步，对 $\mathbb{R}$ 中的任意开集 $W \subseteq \mathbb{R}$，像集 $\varphi_+(W) \subseteq U_+$ 在 $\pi$ 下的饱和原像为：
     $$\pi^{-1}\bigl(\varphi_+(W)\bigr) = (W \times \{1\}) \cup \bigl((W \setminus \{0\}) \times \{-1\}\bigr)$$
     因为 $W$ 和 $W \setminus \{0\}$ 在 $\mathbb{R}$ 中都是开集，故 $\pi^{-1}(\varphi_+(W))$ 在 $Y$ 中是开集，从而 $\varphi_+(W)$ 在商空间 $X$（进而也在开子空间 $U_+$）中是开集！这证明了 $\varphi_+: \mathbb{R} \xrightarrow{\sim} U_+$ 是开连续双射，即**同胚**！完全对称地，$\varphi_-: \mathbb{R} \xrightarrow{\sim} U_-, \, t \mapsto \pi(t, -1)$ 也是同胚。因此 $X$ 中每一点都属于同胚于 $\mathbb{R}$ 的开集 $U_+$ 或 $U_-$，故 $X$ 是 $1$ 维局部欧氏空间。
2. **证明 $X$ 不是 Hausdorff 空间**：在商空间 $X = Y/{\sim}$ 中考察两个不同的原点等价类 $[p] = [(0,1)]$ 与 $[q] = [(0,-1)]$。
   - 任取包含 $[p]$ 的开邻域 $U \subseteq X$，其原像 $\pi^{-1}(U)$ 在 $Y$ 中是包含 $(0,1)$ 的饱和开集，故必包含上直线上的某个开区间 $(-\varepsilon_1, \varepsilon_1) \times \{1\}$；又因 $\pi^{-1}(U)$ 是饱和集，对所有 $0 < |x| < \varepsilon_1$，下直线上的点 $(x, -1)$ 也必须属于 $\pi^{-1}(U)$！
   - 同理，对包含 $[q]$ 的任意开邻域 $V \subseteq X$，其原像 $\pi^{-1}(V)$ 必包含 $(-\varepsilon_2, \varepsilon_2) \times \{-1\}$ 以及去心上区间 $\bigl((-\varepsilon_2, \varepsilon_2) \setminus \{0\}\bigr) \times \{1\}$。
   于是取 $x = \frac{1}{2}\min(\varepsilon_1, \varepsilon_2) > 0$，等价类 $[(x, 1)] = [(x, -1)]$ 必定同时属于 $U$ 和 $V$，即 $U \cap V \neq \varnothing$！因此 $[p]$ 与 $[q]$ 无法被不相交的开集分离，$X$ 不是 Hausdorff 空间（这是微分流形定义中必须显式附加 Hausdorff 公理的经典动机算例）。$\square$

## 相关链接

- 上一节: [[21_The_Metric_Topology_II|§21 The Metric Topology II]]
- 下一章: [[../Chapter 03 - Connectedness and Compactness/00_Chapter_03_Overview|Chapter 3: Connectedness and Compactness]]
- 连续函数: [[18_Continuous_Functions|§18 Continuous Functions]]
- 子空间拓扑: [[16_The_Subspace_Topology|§16 The Subspace Topology]]
- 返回总览: [[00_Chapter_02_Overview|Chapter 2 Overview]]
