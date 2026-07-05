# 文档入口

## 1. 解决什么问题

本仓库定义一套文档驱动的 AI 产品交付方法论。

目标是提供可复用的 harness 模板、code delivery 模板和 checklist，让非技术人通过文档工程约束 AI，完成可验收、可追溯、可维护的产品交付。

## 2. 推荐阅读顺序

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

## 3. 目录说明

```text
docs/methodology/        方法论：目标、原则、分层、构造方法、覆盖检查
docs/engineering/        工程基线：前端、后端、API、基础设施约束
docs/lessons/            教学化内容：后续把方法论讲成课程
templates/harness/       可复用 harness 模板
templates/code_delivery/ 可复用代码交付模板
checklists/harness/      harness 检查清单
checklists/code_delivery/代码交付检查清单
prompts/                 AI / Agent / Review 提示词
examples/                填好的示例
```

## 4. 当前工程基线

```text
前端：Vue 3 + Vite + TypeScript + Vue Router + Pinia
后端：Java + Spring Boot 单体应用，不使用 Spring Cloud
基础设施：macOS + Homebrew + nginx + ngrok
工程形态：monorepo
```
