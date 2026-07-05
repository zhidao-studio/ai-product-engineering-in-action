# 文档驱动的 AI 产品交付方法论

Document-Driven AI Product Delivery Harness

## 1. 项目目标

本仓库用于定义一套：

```text
文档驱动的 AI 产品交付方法论。
```

它提供可复用的 harness 模板和 checklist，帮助非技术人通过文档工程约束 AI，完成产品交付，并保持可验收、可追溯、可维护。

一句话目标：

```text
定义一套文档驱动的 AI 产品交付方法论，
提供可复用的 harness 模板和 checklist，
让非技术人能学会并实际使用。
```

## 2. 三个目标层级

本仓库按三个目标层级组织，优先级从高到低：

| 目标 | 说明 | 仓库产物 |
|---|---|---|
| B 方法论目标 | 定义文档驱动的 AI 产品交付流程 | 方法论文档 |
| C 工具化目标 | 提供可复用的 harness 模板和 checklist | 模板、检查清单 |
| A 教学目标 | 让非技术人能学会并实际使用 | 课程化说明、示例、操作说明 |

当前优先级：

```text
先 B：定义方法论
再 C：沉淀模板和 checklist
最后 A：教学化表达
```

## 3. 核心思想

AI 不是产品负责人。

AI 可以起草、生成、执行和检查，但产品交付必须被文档工程约束。

文档驱动交付的核心链路是：

```text
产品定义
↓
设计规格
↓
工程规格
↓
任务执行
↓
验证
↓
体验验收
↓
交付迭代
```

每一层都要回答：

```text
这一层在阻止 AI 做什么？
这一层怎么判断 AI 做对了没有？
非技术人能不能根据它做判断？
```

## 4. 什么是 harness

在本仓库里，harness 不是单份文档，而是一组约束制品：

```text
方法论
模板
checklist
示例
验收规则
变更规则
```

它的作用是：

- 约束 AI 不要自由发挥
- 让需求能被拆解
- 让任务能被执行
- 让结果能被验收
- 让问题能被追溯
- 让变更能被控制

## 5. 仓库结构

```text
docs/
  README.md              文档总入口
  methodology/           方法论：目标、原则、分层、构造方法、覆盖检查
  lessons/               教学化内容：后续面向非技术人的学习路径

templates/
  harness/               可复用 harness 模板

checklists/
  harness/               可复用检查清单

prompts/
  ai/                    通用大模型提示词
  agent/                 Agent 执行提示词
  review/                审查和验收提示词

examples/
  01_minimal_harness/    最小可用 harness 示例
```

## 6. 推荐阅读顺序

```text
1. docs/README.md
2. docs/methodology/01_GOAL_AND_SCOPE.md
3. docs/methodology/02_CORE_PRINCIPLES.md
4. docs/methodology/03_HARNESS_LAYERS.md
5. docs/methodology/04_HOW_TO_BUILD_HARNESS.md
6. docs/methodology/05_COVERAGE_CHECK.md
7. templates/harness/
8. checklists/harness/
9. examples/01_minimal_harness/
```

## 7. 当前阶段

当前主线已经收敛为：

```text
方法论
模板
checklist
最小示例
教学化说明
```

## 8. 不做什么

当前阶段不做：

- 不直接开发完整产品
- 不绑定某个具体 AI 工具
- 不以某个小程序或 H5 样例作为主线
- 不把重点放在代码工程本身
- 不堆叠历史课程文档

## 9. 最重要的一句话

```text
不是让 AI 替你做产品，
而是用 harness 约束 AI 完成可验收的产品交付。
```
