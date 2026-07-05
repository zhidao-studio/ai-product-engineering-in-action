# 文档入口

## 1. 本仓库解决什么问题

本仓库不是一个具体产品样例，也不是某个 AI 编码工具教程。

它要定义一套：

```text
文档驱动的 AI 产品交付方法论。
```

目标是提供可复用的 harness 模板、code delivery 模板和 checklist，让非技术人能通过文档工程约束 AI，完成可验收、可追溯、可维护的产品交付。

## 2. 最重要的一句话

```text
不是让 AI 替你做产品，
而是用 harness 和工程基线约束 AI 完成可验收的产品交付。
```

## 3. 三个目标层级

| 优先级 | 目标 | 说明 |
|---:|---|---|
| 1 | 方法论目标 | 定义文档驱动的 AI 产品交付流程 |
| 2 | 工具化目标 | 提供可复用的 harness、code delivery 模板和 checklist |
| 3 | 教学目标 | 让非技术人能学会并实际使用 |

## 4. 推荐阅读顺序

```text
1. docs/methodology/01_GOAL_AND_SCOPE.md
2. docs/methodology/02_CORE_PRINCIPLES.md
3. docs/methodology/03_HARNESS_LAYERS.md
4. docs/methodology/04_HOW_TO_BUILD_HARNESS.md
5. docs/methodology/05_COVERAGE_CHECK.md
6. docs/engineering/01_ENGINEERING_BASELINE.md
7. templates/harness/
8. templates/code_delivery/
9. checklists/harness/
10. checklists/code_delivery/
11. examples/01_minimal_harness/
```

## 5. 目录说明

```text
docs/methodology/        方法论：目标、原则、分层、构造方法、覆盖检查
docs/engineering/        工程基线：前端、后端、API、infra 的推荐约束
docs/lessons/            教学化内容：后续把方法论讲成课程
templates/harness/       可复用 harness 模板
templates/code_delivery/ 可复用代码交付模板
checklists/harness/      harness 检查清单
checklists/code_delivery/代码交付检查清单
prompts/                 AI / Agent / Review 提示词
examples/                填好的示例
```

## 6. 当前工程基线

```text
前端：Vue 3 + Vite + TypeScript + Vue Router + Pinia
后端：Java + Spring Boot 单体应用，不使用 Spring Cloud
基础设施：macOS + Homebrew + nginx + ngrok
工程形态：monorepo
```

## 7. 当前阶段

当前仓库主线已经收敛为：

```text
方法论
模板
checklist
工程基线
代码交付模板
最小示例
```

教学化内容会在方法论、模板和 checklist 稳定后补充。
