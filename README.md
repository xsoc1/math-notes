# Math Notes

个人数学学习笔记，使用 Obsidian 管理，内容以中文为主。

## 仓库结构

```
math-notes/
├── README.md
├── AGENTS.md                    # Codex 工作维护文件
├── 变分法/
│   └── 变分法基本引理.md
└── 拓扑学 Munkres/
    ├── Chapter 01 - Set Theory and Logic/
    ├── Chapter 02 - Topological Spaces and Continuous Functions/
    ├── Chapter 03 - Connectedness and Compactness/
    ├── Chapter 04 - Countability and Separation Axioms/
    ├── Chapter 05 - The Tychonoff Theorem/
    ├── Chapter 06 - Metrization Theorems and Paracompactness/
    ├── Chapter 07 - Complete Metric Spaces and Function Spaces/
    └── Chapter 08 - Baire Spaces and Dimension Theory/
```

## 拓扑学（Munkres, *Topology*, 2nd Edition）

基于 James R. Munkres《拓扑学》（第 2 版）的完整学习笔记，覆盖**代数拓扑之前**的全部章节：

| 章节 | 内容 | 笔记数 |
|------|------|--------|
| Chapter 1 | Set Theory and Logic（集合论与逻辑） | 1 |
| Chapter 2 | Topological Spaces and Continuous Functions（拓扑空间与连续函数） | 11 |
| Chapter 3 | Connectedness and Compactness（连通性与紧致性） | 7 |
| Chapter 4 | Countability and Separation Axioms（可数性与分离性公理） | 7 |
| Chapter 5 | The Tychonoff Theorem（Tychonoff 定理） | 1 |
| Chapter 6 | Metrization Theorems and Paracompactness（度量化定理与仿紧性） | 3 |
| Chapter 7 | Complete Metric Spaces and Function Spaces（完备度量空间与函数空间） | 4 |
| Chapter 8 | Baire Spaces and Dimension Theory（Baire 空间与维数论） | 2 |

每节笔记包含：定义/定理（`[!note]` callout）、完整证明（以 `$\square$` 结尾）、多个例子（`[!example]`）、课后习题解析（`[!question]`，6–8 题/节）、相关链接（Wikilink）。

## 其他笔记

- [[变分法/变分法基本引理|变分法基本引理]]：变分法核心引理（`$f\in L^1(E)$`，`$\int_E fg=0\Rightarrow f=0$ a.e.）的三种条件证明

## 使用说明

- 本仓库为 Obsidian Vault 中的子目录，建议用 [Obsidian](https://obsidian.md) 打开 `F:\Obsidian Storage` 使用（含 callout、Wikilink、LaTeX 渲染）。
- 直接浏览 GitHub 时，`.md` 文件中的 callout 与 Wikilink 可能无法完整渲染，建议本地使用 Obsidian。
