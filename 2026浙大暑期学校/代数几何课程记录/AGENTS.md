# AGENTS.md — 代数几何课程记录

## 项目结构
```
2026浙大暑期学校/代数几何课程记录/
├── Undergraduate Algebraic Geometry/
│   ├── Undergraduate Algebraic Geometry.md    ← 原书全文 (325KB)
│   └── AGENTS.md
├── 课程记录/
│   └── 第一讲：仿射簇与平面曲线.md              ← [1] 仿射簇、二次曲线、射影、Bézout、三次曲线
├── 作业/
└── AGENTS.md
```

## 参考教材
- Miles Reid, *Undergraduate Algebraic Geometry*, LMS Student Texts 12

## 通用规则
- 所有 .md 文件必须有 YAML frontmatter：`title`、`date`、`tags`、`aliases`
- 笔记间链接使用 `[[笔记名]]`
- 数学公式：行内 `$...$`，行间 `$$...$$`
- Callout：`> [!abstract]` 核心命题、`> [!note]` 定义/注记、`> [!important]` 关键结论、`> [!tip]` 直觉/技巧
- 每篇笔记末尾有"相关笔记"小节

## 内容标准
- 核心概念给出严格定义，定理引用原书出处（如 Reid §1.4）
- 每个抽象概念后有几何直观
- 使用表格对比总结
- 对应原书章节在笔记中标注

## 编码
- UTF-8 无 BOM
- 写入用 `[System.IO.File]::WriteAllText`
- 禁止 `Set-Content -Encoding UTF8`