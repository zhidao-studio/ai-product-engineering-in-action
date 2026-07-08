# AI 门禁脚本

## 1. 目的

本目录提供最小可执行门禁，用于把文档约束和 AI Context Pack 转成可执行检查。

它解决的问题是：

```text
AI 修改文件后，系统能检查它是否越级、是否缺少上下文、是否修改保护路径。
```

## 2. 脚本清单

```text
scripts/check-ai-context-pack.sh   检查目标项目是否具备 AI Context Pack
scripts/check-ai-stage.sh          检查当前阶段是否出现越级产物
scripts/check-ai-boundary.sh       检查 Git diff 是否修改保护路径
scripts/check-ai-guard.sh          一次性运行全部门禁检查
```

## 3. 使用方式

在仓库根目录执行：

```bash
bash scripts/check-ai-guard.sh <目标项目目录>
```

示例：

```bash
bash scripts/check-ai-guard.sh 案例/03_钓鱼爱好者移动端平台案例
```

如果目标项目就是当前目录：

```bash
bash scripts/check-ai-guard.sh .
```

## 4. 目标项目必须包含

目标项目必须先具备：

```text
AI_CONTEXT_PACK/00_当前阶段.md
AI_CONTEXT_PACK/01_产品蓝图.yaml
AI_CONTEXT_PACK/02_已确认决策.md
AI_CONTEXT_PACK/03_允许修改范围.yaml
AI_CONTEXT_PACK/04_工程基线摘要.md
AI_CONTEXT_PACK/05_当前任务包.md
```

可从这里复制样板：

```text
样板/控制系统/AI_CONTEXT_PACK/
```

## 5. 当前能拦截什么

当前能拦截：

```text
缺少 AI Context Pack
idea 阶段直接生成工程规格、接口契约、数据库结构、代码任务包或工程代码
AI 修改工程模板
AI 修改工程基线
AI 修改 pom.xml、package.json、Package.swift
AI 修改 application.yml / application.properties
AI 修改 Dockerfile 或 GitHub Actions workflow
```

## 6. 当前只警告什么

当前对数据库 migration 先做警告：

```text
**/db/migration/**
```

原因：真实工程中数据库变更可能是合法任务，但必须人工确认。

如果希望强制阻断，可以在 `scripts/check-ai-boundary.sh` 中把 migration 的 WARN 改成 FAIL。

## 7. 当前不能替代什么

当前脚本不能替代：

```text
OpenAPI 契约校验
数据库 schema 深度校验
单元测试
端到端测试
安全扫描
代码质量扫描
真实构建验证
```

## 8. 一句话原则

```text
AI 可以写，但必须先有上下文；AI 可以改，但不能越阶段；AI 可以交付，但必须过门禁。
```
