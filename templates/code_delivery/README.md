# Code Delivery 模板

本目录用于把 harness 继续落到代码交付。

如果项目从 0 开始，不能直接让 AI 写代码。必须先定义工程基线：前端、后端、API、数据库、基础设施、代码任务包和代码验收方式。

## 模板清单

| 模板 | 作用 |
|---|---|
| `01_PROJECT_STRUCTURE_TEMPLATE.md` | 项目总工程结构 |
| `02_FRONTEND_ENGINEERING_TEMPLATE.md` | Vue 前端工程规范 |
| `03_BACKEND_ENGINEERING_TEMPLATE.md` | Java / Spring Boot 后端工程规范 |
| `04_API_CONTRACT_TEMPLATE.md` | 前后端 API 契约 |
| `05_DATABASE_SCHEMA_TEMPLATE.md` | 数据库和数据模型规范 |
| `06_INFRASTRUCTURE_TEMPLATE.md` | macOS / Homebrew / nginx / ngrok 基础设施规范 |
| `07_CODE_TASK_PACKAGE_TEMPLATE.md` | AI 编码任务包 |
| `08_CODE_REVIEW_CHECKLIST_TEMPLATE.md` | 代码交付验收清单 |

## 技术基线

当前推荐基线：

```text
前端：Vue 3 + Vite + TypeScript + Vue Router + Pinia
后端：Java + Spring Boot，不使用 Spring Cloud
基础设施：macOS + Homebrew + nginx + ngrok
工程形态：monorepo
```

## 原则

```text
从 0 到代码，不是直接让 AI 写；
而是先让 AI 进入一个被工程规范约束好的施工现场。
```
