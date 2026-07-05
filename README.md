# 文档驱动的 AI 产品交付方法论

Document-Driven AI Product Delivery Harness

## 1. 仓库定位

本仓库用于沉淀一套文档驱动的 AI 产品交付方法论。

它的核心目标是：

```text
用 harness、工程基线、代码任务包和 checklist，
约束 AI 从产品想法走向可验收的代码交付。
```

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
docs/        方法论、工程基线、教学化内容
templates/   可复用模板
checklists/  可执行检查清单
prompts/     AI / Agent / Review 提示词
examples/    填好的示例
```

## 4. 从哪里开始

请从这里开始：

```text
docs/README.md
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
