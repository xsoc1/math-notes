---
title: "凸集与 Minkowski 泛函"
date: 2026-10-07
tags:
  - functional-analysis
  - fa-convex-fixed-point
  - theory-note
note_type: theory
source_section: "F/5 的凸集与 Minkowski 泛函部分"
exercise_range: "1.5 节"
status: "已补证"
---

# 凸集与 Minkowski 泛函

## 1. 凸性、平衡性与吸收性

> [!note] 定义
> 集合 $C$ **凸**：$x,y\in C$、$0\leq t\leq1$ 时 $(1-t)x+ty\in C$。
>
> $C$ **平衡**：$|\lambda|\leq1$ 时 $\lambda C\subset C$。
>
> $C$ **吸收**：对每个 $x$，存在 $r>0$ 使 $x\in rC$。

有限凸组合 $\sum_j\lambda_jx_j$，$\lambda_j\geq0$、$\sum\lambda_j=1$，由二点凸性的归纳得到。集合的凸包就是全体有限凸组合；在无限维中它不必闭。

交保持凸性，线性映象保持凸性，闭包也保持凸性：对闭包中的两个点先取逼近列，再将逐项凸组合取极限。范数闭球凸，球面通常不凸。

## 2. 凸集的尺度函数

设 $C$ 凸、吸收且含 0，定义 Minkowski 泛函
$$
p_C(x)=\inf\{t>0:x\in tC\}.
$$
吸收性保证下确界有限；包含 0 的凸性保证 $sC\subset tC$（$0<s<t$）。

> [!note] 基本性质
> $p_C$ 非负、正齐次且次可加：
> $$
> p_C(\lambda x)=\lambda p_C(x)\quad(\lambda\geq0),\qquad
> p_C(x+y)\leq p_C(x)+p_C(y).
> $$
> 若 $C$ 平衡，则绝对齐次，因而是半范数。

正齐次先对 $\lambda>0$ 在下确界中换变量，$\lambda=0$ 直接验证。对次可加，给定 $s>p_C(x)$、$t>p_C(y)$，可取 $x/s,y/t\in C$；凸性给出
$$
\frac{x+y}{s+t}
=\frac s{s+t}\frac xs+\frac t{s+t}\frac yt\in C.
$$
所以 $p_C(x+y)\leq s+t$，最后令 $s,t$ 分别降到对应下确界。平衡性给出 $p_C(\lambda x)\leq|\lambda|p_C(x)$，再对 $\lambda^{-1}$ 应用同一估计得到等号。$\square$

## 3. 几何条件对应什么分析性质

总有
$$
\{p_C<1\}\subset C\subset\{p_C\leq1\}.
$$
第一包含使用 $t<1$ 与 $tC\subset C$，第二包含直接由 $x\in C$ 得到。

若 $C$ 是含 0 的开凸集，则 $C=\{p_C<1\}$。对 $x\in C$，开性允许略微沿射线向外移动，使 $(1+\varepsilon)x\in C$，故 $p_C(x)<1$。若 $C$ 含 $B(0,r)$，则
$$
p_C(x)\leq\|x\|/r.
$$
次可加性及交换 $x,y$ 给出 $|p_C(x)-p_C(y)|\leq\|x-y\|/r$，因此 $p_C$ 连续。

若 $C$ 还平衡且有界，$C\subset\overline B(0,R)$，则
$$
\|x\|/R\leq p_C(x)\leq\|x\|/r,
$$
所以 $p_C$ 是与原范数等价的范数。仅仅吸收和平衡不够：若 $C=X$，则 $p_C\equiv0$。

## 4. 有限维紧凸体为什么像一个闭球

设 $C$ 为有限维空间中的非空紧凸集，在其仿射包 $E$ 中讨论。若维数为零，它是单点。否则 $C$ 在 $E$ 中有相对内点：取张成仿射包的有限个仿射无关点，其单纯形的重心就是相对内点。

取相对内点 $c$，平移成 $C-c$，其包含相对小球且有界。其泛函 $p$ 连续，对单位向量 $u$ 有 $0<p(u)<\infty$。每条射线与边界相交于唯一点 $\rho(u)u$，其中 $\rho(u)=1/p(u)$。闭性保证端点属于 $C-c$。

构造
$$
\Phi(ru)=c+r\rho(u)u,\qquad0\leq r\leq1,\qquad\Phi(0)=c.
$$
$\rho$ 连续且有界，所以 $\Phi$ 在原点和其余点都连续；它是相对单位闭球到 $C$ 的双射。紧空间到 Hausdorff 空间的连续双射是同胚：闭集的像紧从而闭，故逆连续。

这里必须先进入仿射包。线段放在平面中没有内部，但在其仿射包中仍是“一维凸体”，不能为了使用球同胚而暗自假设满维。

## 相关链接

- [[00_专题总览|专题总览]]
- [[02_Brouwer与Schauder不动点定理|凸组合在不动点证明中的作用]]
- [[泛函分析/10_Hahn-Banach与凸分离/02_凸集分离与支撑泛函|Minkowski 泛函与分离]]
- [[泛函分析讲义上册习题册#1.5 凸集与不动点|原书 1.5 节]]
