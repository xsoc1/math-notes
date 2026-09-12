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

## 工作方法
- 链接维护以当前实际文件为准；不存在的后续课程不保留占位 Wikilink，改用已经存在且与正文直接相关的总览或教材入口。
- 修改后从仓库根目录运行 Obsidian CLI 的 `unresolved` 检查，并保留每篇笔记末尾的“相关笔记”小节。

## 对话记录
- 2026-09-12：用户要求扫描笔记仓库并清理无用、多余链接；将第一讲末尾两个尚不存在的未来课程占位链接替换为现有的暑期学校课程总结和 Reid 教材入口，保留“相关笔记”结构。

## 变更日志

| 日期 | 变更内容 |
| --- | --- |
| 2026-09-12 | 清理第一讲的无效占位链接并改接现有资料；Obsidian CLI 复核无未解析链接 |
