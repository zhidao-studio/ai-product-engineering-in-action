# 文档驱动的 AI 产品交付方法论

Document-Driven AI Product Delivery Harness

## 1. 项目目标

本仓库用于定义文档驱动的 AI 产品交付方法论。

它提供可复用的 harness 模板、code delivery 模板和 checklist，帮助非技术人通过文档工程约束 AI，完成可验收、可追溯、可维护的产品交付。

## 2. 核心链路

```text
产品定义
↓
设计规格
↓
工程规格
↓
工程基线
↓
代码任务包
↓
AI 编码
↓
验证
↓
体验验收
↓
交付迭代
```

## 3. 仓库结构

```text
docs/
  README.md
  methodology/
  engineering/
  lessons/

templates/
  harness/
  code_delivery/

checklists/
  harness/
  code_delivery/

prompts/
  ai/
  agent/
  review/

examples/
  01_minimal_harness/
```

## 4. 推荐阅读顺序

```text
1. docs/README.md
2. docs/methodology/01_GOAL_AND_SCOPE.md
3. docs/methodology/02_CORE_PRINCIPLES.md
4. docs/methodology/03_HARNESS_LAYERS.md
5. docs/methodology/04_HOW_TO_BUILD_HARNESS.md
6. docs/methodology/05_COVERAGE_CHECK.md
7. docs/engineering/01_ENGINEERING_BASELINE.md
8. templates/harness/
9. templates/code_delivery/
10. checklists/harness/
11. checklists/code_delivery/
12. examples/01_minimal_harness/
```

## 5. 当前工程基线

```text
前端：Vue 3 + Vite + TypeScript + Vue Router + Pinia
后端：Java + Spring Boot 单体应用，不使用 Spring Cloud
基础设施：macOS + Homebrew + nginx + ngrok
工程形态：monorepo
```

## 6. 最重要的一句话

```text
不是让 AI 替你做产品，
而是用 harness 和工程基线约束 AI 完成可验收的产品交付。
```
