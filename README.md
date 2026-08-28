# Math Notes

个人数学学习笔记仓库，使用 Obsidian 管理，内容以中文为主。本地仓库根目录为 `F:\Obsidian Storage\数学`，与 GitHub 仓库 [xsoc1/math-notes](https://github.com/xsoc1/math-notes) 保持同步。

## 目录结构

```
math-notes/
├── README.md
├── AGENTS.md
├── Obsidian技能与Agent调用指南.md
├── 高等代数/
│   └── 高等代数简明教程重点与代数思想.md
├── 泛函分析/
│   └── 泛函分析讲义上册习题册.md
├── 常微分方程/
│   └── 常微分方程复习指南.md
├── 实变函数/
│   └── 实变函数简明教程重点与数学思想.md
├── 变分法/
│   └── 变分法基本引理.md
├── 拓扑学 Munkres/
│   ├── Chapter 01 - Set Theory and Logic/
│   ├── Chapter 02 - Topological Spaces and Continuous Functions/
│   ├── Chapter 03 - Connectedness and Compactness/
│   ├── Chapter 04 - Countability and Separation Axioms/
│   ├── Chapter 05 - The Tychonoff Theorem/
│   ├── Chapter 06 - Metrization Theorems and Paracompactness/
│   ├── Chapter 07 - Complete Metric Spaces and Function Spaces/
│   └── Chapter 08 - Baire Spaces and Dimension Theory/
├── 2026浙大暑期学校/
│   ├── 代数几何课程记录/
│   └── 黎曼几何课程记录/
├── 代数几何初步/
│   └── Undergraduate Algebraic Geometry/
├── SL谱理论/
│   ├── SL边值问题研究入门计划.md
│   └── 讲义/
│       ├── 00_SL谱理论讲义总览.md
│       ├── 01_杆的弯曲问题与Euler-Bernoulli梁.md
│       ├── 02_正则Sturm-Liouville问题.md
│       ├── 03_Liouville标准形.md
│       ├── 04_Pruefer变换与特征值存在性.md
│       ├── 05_Sturm比较定理与零点交错.md
│       ├── 06_特征函数正交性与广义Fourier级数.md
│       ├── 附录_手写笔记页面索引.md
│       └── images/
└── 未命名.base
```

## 笔记登记

| 位置 | 内容 | 文件数 |
|---|---|---|
| Obsidian技能与Agent调用指南.md | Obsidian Skills 规范、安装配置与 Agent CLI / REST / MCP 调用指南 | 1 md |
| 高等代数/ | 蓝以中《高等代数简明教程》重点、几何代数主线与代数思想 | 1 md |
| 泛函分析/ | 张恭庆、林源渠《泛函分析讲义（上册）》全部 208 道编号习题，答案留空 | 1 md |
| 常微分方程/ | 本科常微分方程重点、求解方法、存在唯一性与方程组复习指南 | 1 md |
| 实变函数/ | 邓东皋《实变函数简明教程》重点、知识脉络与数学思想 | 1 md |
| 拓扑学 Munkres/ | Munkres《Topology》第 1-8 章学习笔记 | 43 md + 2 base |
| 变分法/ | 变分法基本引理 | 1 md |
| SL谱理论/SL边值问题研究入门计划.md | SL 边值问题 12 周入门研究计划 | 1 md |
| SL谱理论/讲义/ | SL 谱理论讲义（7 md + 11 图片） | 7 md + 11 images |
| 2026浙大暑期学校/ | 暑期学校代数几何、黎曼几何课程记录与作业 | 21 md + 1 base + 367 jpg |
| 2026浙大暑期学校/代数几何课程记录/ | 仿射簇与平面曲线等课程记录、作业 | 7 md + 367 jpg |
| 2026浙大暑期学校/黎曼几何课程记录/ | 黎曼流形与曲率、单值化、高斯-博内等笔记与作业 | 14 md + 1 base |
| 代数几何初步/ | Undergraduate Algebraic Geometry 原书笔记 | 2 md + 367 jpg |
| 未命名.base | Obsidian 表格视图 | 1 base |

注：`2026浙大暑期学校/代数几何课程记录/Undergraduate Algebraic Geometry/` 与 `代数几何初步/Undergraduate Algebraic Geometry/` 当前是同一份内容的两个副本。

## 拓扑学（Munkres, *Topology*, 2nd Edition）

| 章节 | 内容 | 笔记数 |
|---|---|---|
| Chapter 1 | Set Theory and Logic（集合论与逻辑） | 1 |
| Chapter 2 | Topological Spaces and Continuous Functions（拓扑空间与连续函数） | 12 |
| Chapter 3 | Connectedness and Compactness（连通性与紧致性） | 8 |
| Chapter 4 | Countability and Separation Axioms（可数性与分离性公理） | 8 |
| Chapter 5 | The Tychonoff Theorem（Tychonoff 定理） | 2 |
| Chapter 6 | Metrization Theorems and Paracompactness（度量化定理与仿紧性） | 4 |
| Chapter 7 | Complete Metric Spaces and Function Spaces（完备度量空间与函数空间） | 5 |
| Chapter 8 | Baire Spaces and Dimension Theory（Baire 空间与维数论） | 3 |
| 合计 | | 43 md + 2 base |

## SL 谱理论

- [[SL谱理论/SL边值问题研究入门计划|SL 边值问题研究入门计划]]
- [[SL谱理论/讲义/00_SL谱理论讲义总览|SL 谱理论讲义]]

## 插件与技能

详细的技能说明、安装方法与 Agent 调用示例参见库内文档：
👉 **[[Obsidian技能与Agent调用指南|Obsidian 技能与 Agent 调用指南]]**

1. **官方 Agent 技能套件（[kepano/obsidian-skills](https://github.com/kepano/obsidian-skills)）**：
   - 已部署至 DSH / Agent 技能目录 `C:\Users\HuangZY\.dsh\skills\`
   - `obsidian-cli`：通过 Obsidian 官方 CLI 实现笔记读取、创建、追加、搜索与插件重载
   - `obsidian-markdown`：规范 Frontmatter、Wikilinks 双链、Callouts、LaTeX 公式与嵌入语法
   - `obsidian-bases`：`.base` 数据库视图（表格/卡片/列表/地图）、公式过滤与计算
   - `json-canvas`：`.canvas` 无限白板与思维导图（节点、连线与布局）
   - `defuddle`：网页内容提取与 token 压缩
2. **安装与调用方式**：
   - 自动添加：`npx skills add https://github.com/kepano/obsidian-skills`
   - CLI 注册：Obsidian 桌面端（v1.12.4+）→ 设置 → 通用 → 开启 CLI 并点击注册
3. **扩展生态**：
   - 本地 REST API：`obsidian-local-rest-api`（HTTPS 端口 27124）
   - 协议集成：Model Context Protocol (MCP) 与 `obsidian-agent-memory-skills`

## 维护说明

- 子目录中独立的 AGENTS.md 由对应子项目 agent 维护，本仓库不修改。
- 新增或调整笔记后，同步更新本 README 的笔记登记表并推送云端。
- Obsidian 配置（`.obsidian/`）与 `.trash/` 不入库。
- 2026-08-28 已清理本地未跟踪的旧拼写拓扑目录、顶层变分法重复笔记和空白 Canvas，文件移至仓库外的可恢复备份目录。
- 建议用 [Obsidian](https://obsidian.md) 打开 `F:\Obsidian Storage\数学` 使用；GitHub 上 callout 与 Wikilink 可能无法完整渲染。
