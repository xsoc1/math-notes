---
title: OpenMAIC 课程与教材规划调研
date: 2026-09-12
tags:
  - AI教学
  - OpenMAIC
  - curriculum
  - course-design
  - textbook
aliases:
  - OpenMAIC 调研
  - OpenMAIC 课程规划
source: https://github.com/THU-MAIC/OpenMAIC
local: F:\tools\OpenMAIC
---

# OpenMAIC 课程与教材规划调研

## 1. OpenMAIC 项目定位与核心理念

OpenMAIC（Open Multi-Agent Interactive Course）是基于多 Agent 协作的智能化课程与交互式教材生成框架。其核心设计理念是将静态线性教学文档转化为具备前置依赖图谱、多模态交互组件与结构化机器校验的教学系统。

## 2. 课程大纲的层次化组织逻辑

课程大纲遵循 **“模块 (Module) — 章节 (Chapter) — 知识点 (Topic) — 互动页 (Page)”** 四级结构：
1. **知识图谱建模**：基于知识点的先修与后继依赖关系构建有向无环图（DAG），确保概念引入符合逻辑拓扑序。
2. **三阶递进设计**：
   - **基础篇**：核心定义、直观动机与基本性质推导；
   - **进阶篇**：核心定理证明骨架、反例辨析与典型算例；
   - **工具与前沿篇**：数值实验可视化、算子谱分析与研究专题导读。

## 3. 教材模块化配置范式

课程结构通过声明式 JSON 与 Markdown 双向链接描述：

```json
{
  "course_id": "math-sl-theory",
  "title": "Sturm-Liouville 理论与边值问题",
  "modules": [
    {
      "module_id": "m1",
      "title": "基础算子理论",
      "topics": ["[[SL边值问题研究入门计划]]"]
    }
  ]
}
```

## 4. 交互式教学组件机制

框架内置四类页面与互动组件，服务于不同认知阶段的教学目标：
- **`slide`（讲授页）**：呈现严格数学定义、定理陈述与主线证明步骤；
- **`interactive`（动态交互实验）**：实时渲染参数化函数图像、相平面轨线、Prüfer 相角演化与 Rayleigh 商极值分布；
- **`quiz`（诊断测验页）**：针对定理前提条件、边界条件符号及典型反例设计即时概念检验；
- **`pbl`（研究型任务页）**：给出小型综合推导或数值实验任务，引导学习者串联多节工具。

## 5. 节奏控制与排版生成约束

为防止生成内容流于大段文字堆砌，系统在大纲与页面生成阶段引入定量约束：
- **节奏密度**：页面场景切换保持 **1–2 个/分钟**；
- **测验频率**：每 **3–5 张 `slide`** 插入 1 个概念诊断 `quiz`；
- **交互配额**：深度 `interactive` 控件每课控制在 **1–2 个**，综合 `pbl` 任务每课至多 **1 个**；
- **纯净排版**：幻灯片标题与核心要点（`keyPoints`）直接聚焦数学命题本身，不掺杂无关角色前缀或冗余寒暄。

## 6. 教学法 Skill 层与机器校验机制

OpenMAIC 将教学设计理论（Pedagogy）解耦为可组合的 Skill 指令层与机器约束检查器（`outline-constraints.json`）。

### 6.1 基线与风格 Skill 矩阵

| Skill 名称 | 教学法定位与适用场景 |
| :--- | :--- |
| `stage-design` | 单课底层递进基线：动机引入 $\rightarrow$ 概念形式化 $\rightarrow$ 算例演练 $\rightarrow$ 迁移总结 |
| `lecture-style` | 理论讲授型：以 `slide` 严密推导为主（占比 $\ge 65\%$），配 $1\sim 3$ 个 `quiz` 与至多 $2$ 个 `interactive` |
| `workshop-style` | 实验工作坊型：概念讲解后立即进入动手编程或数值实验（`interactive` 占比 $\ge 40\%$ 且不少于 $3$ 个） |
| `deep-interactive` | 深度探索型：以参数操控与动态可视化为主导（`interactive` 占比 $\ge 60\%$，禁止同类型控件连续堆叠） |
| `feynman-learning` | 费曼学习循环：引导学习者复述定理核心思想，针对逻辑缺口Targeted补强 |
| `understanding-by-design` | UbD 逆向教学设计：先确立持久理解（Enduring Understanding）与评估证据，再反推页面编排 |
| `spiral-curriculum` | 螺旋式课程规划：核心概念在不同章节以更高抽象度与更广适用范围重访升维 |

### 6.2 机器检查闭环流程
1. 根据选定的教学风格 Skill 生成课程大纲与 `teacherContext`；
2. 校验器自动核对大纲页面配比、组件类型分布及前置依赖是否满足 `outline-constraints.json`；
3. 若违反结构约束，将结构化诊断信息返回规划器重新调整大纲，通过后再进入单页内容生成。

> [!note] 架构设计启示
> 将“教学法自然语言指导（Skill）”与“确定性结构校验（JSON Schema / Constraints）”分离，既保留了大模型在数学叙述上的灵活性，又从工程上保证了讲义结构的均衡与完整。

## 7. 对数学讲义体系编写的借鉴路径

将 OpenMAIC 的课程规划机制应用于本仓库（特别是 Sturm-Liouville 谱理论与微分方程讲义）的编写，可遵循以下四项原则：
1. **模块化分层设计**：将专题讲义划分为“基础算子与自伴性 / 谱理论核心 / 变分与极值工具 / 左定空间尺度 / 前沿文献导读”五个递进层级，每讲开头明确本讲核心问题与学习目标。
2. **UbD 逆向组织每讲结构**：每节先明确核心定理结论与证明骨架，再配置对应的几何直观说明、反例辨析与课后推导练习。
3. **螺旋式概念主线**：围绕自伴算子、Sturm 振荡与零点计数、正交特征展开、Rayleigh-Ritz 变分原理、谱隙估计等核心概念，在常系数算例、正则 SL 问题与奇异/左定问题中逐层深化。
4. **先大纲后正文的规划流程**：在开展多章节讲义编写前，先锁定阅读对象、先修基础、章节目录与符号约定（参见 [[SL边值问题研究入门计划]]），再分节撰写正文与配套代码。

## 8. 参考规范路径

- `skills/agent-runtime/curriculum-planner/SKILL.md`
- `skills/agent-runtime/stage-design/SKILL.md`
- `skills/agent-runtime/understanding-by-design/SKILL.md`
