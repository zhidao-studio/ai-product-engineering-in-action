# Code Delivery 模板

本目录用于把 harness 继续落到代码交付。

如果项目从 0 开始，不能直接让 AI 写代码。必须先定义工程基线、前端规范、后端规范、API 契约、数据库规范、基础设施规范、代码任务包和代码验收方式。

## 模板清单

| 模板 | 作用 |
|---|---|
| `01_PROJECT_STRUCTURE_TEMPLATE.md` | 项目总工程结构 |
| `02_FRONTEND_ENGINEERING_TEMPLATE.md` | 前端工程规范 |
| `03_BACKEND_ENGINEERING_TEMPLATE.md` | 后端工程规范 |
| `04_API_CONTRACT_TEMPLATE.md` | 前后端 API 契约 |
| `05_DATABASE_SCHEMA_TEMPLATE.md` | 数据库和数据模型规范 |
| `06_INFRASTRUCTURE_TEMPLATE.md` | 基础设施规范 |
| `07_CODE_TASK_PACKAGE_TEMPLATE.md` | AI 编码任务包 |
| `08_CODE_REVIEW_CHECKLIST_TEMPLATE.md` | 代码交付验收清单 |

## 基线来源

当前项目推荐技术基线以这里为准：

```text
docs/engineering/01_ENGINEERING_BASELINE.md
```

工程质量红线以这里为准：

```text
docs/engineering/02_ENGINEERING_QUALITY_GUARDRAILS.md
```

## 原则

```text
模板只定义要填写什么，
具体项目基线由 docs/engineering/ 决定。
```
