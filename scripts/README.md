# AI 门禁脚本

## 1. 目的

本目录提供可执行门禁，用于把文档约束、AI Context Pack 和结构化契约转成检查脚本。

它解决的问题是：

```text
AI 修改文件后，系统能检查它是否越级、是否缺少上下文、是否修改保护路径、是否缺少关键契约。
```

## 2. 脚本清单

```text
scripts/check-ai-context-pack.sh        检查目标项目是否具备 AI Context Pack
scripts/check-ai-stage.sh               检查当前阶段是否出现越级产物
scripts/check-ai-boundary.sh            检查 Git diff 是否修改保护路径
scripts/check-openapi-contract.sh       检查 OpenAPI 契约基本结构
scripts/check-database-schema.sh        检查数据库 Schema 契约和 7 要素
scripts/check-dependency-whitelist.sh   检查依赖文件是否引入白名单外依赖
scripts/check-ai-guard.sh               检查单个目标项目
scripts/run-ai-guard-all.sh             自动扫描并检查所有目标项目
scripts/install-ai-guard-hook.sh        安装本地 pre-commit 门禁
```

## 3. 检查单个目标项目

在仓库根目录执行：

```bash
bash scripts/check-ai-guard.sh <目标项目目录>
```

示例：

```bash
bash scripts/check-ai-guard.sh 案例/02_全栈生产力工具案例
```

如果目标项目就是当前目录：

```bash
bash scripts/check-ai-guard.sh .
```

## 4. 检查所有目标项目

自动扫描所有包含 `AI_CONTEXT_PACK` 的目标项目：

```bash
bash scripts/run-ai-guard-all.sh
```

也可以指定多个目标项目：

```bash
bash scripts/run-ai-guard-all.sh 目标项目A 目标项目B
```

如果仓库中还没有目标项目，脚本会警告并通过，不阻塞样板和模板仓库自身维护。

## 5. 安装本地 pre-commit 门禁

执行：

```bash
bash scripts/install-ai-guard-hook.sh
```

安装后，每次 `git commit` 前会自动执行：

```bash
bash scripts/run-ai-guard-all.sh
```

如果门禁失败，commit 会被阻止。

## 6. CI 门禁

仓库已提供 GitHub Actions 工作流：

```text
.github/workflows/ai-guard.yml
```

触发条件：

```text
pull_request
push 到 main
```

CI 会执行：

```bash
bash scripts/run-ai-guard-all.sh
```

## 7. 目标项目必须包含

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

## 8. 目标项目建议包含

进入契约确认或工程执行阶段后，目标项目应包含：

```text
contracts/openapi.yaml
contracts/database-schema.yaml
contracts/dependency-whitelist.txt
```

可从这里复制样板：

```text
样板/控制系统/contracts/
```

## 9. 当前能拦截什么

当前能拦截：

```text
缺少 AI Context Pack
idea 阶段直接生成工程规格、接口契约、数据库结构、代码任务包或工程代码
AI 修改工程模板
AI 修改工程基线
AI 修改 pom.xml、package.json、Podfile、Podfile.lock、Package.swift
AI 修改 application.yml / application.properties
AI 修改 Dockerfile 或 GitHub Actions workflow
契约/编码阶段缺少 OpenAPI 契约
契约/编码阶段缺少数据库 Schema 契约
数据库 Schema 缺少 32 位字符串主键和 7 要素声明
依赖文件变更但缺少依赖白名单
依赖文件引入白名单外依赖
```

## 10. iOS 依赖边界

本仓库 iOS 基线使用 CocoaPods。

```text
Podfile
Podfile.lock
```

门禁会把 `Podfile` 和 `Podfile.lock` 视为依赖边界文件。

`Package.swift` 仍会被拦截，因为业务任务不得擅自从 CocoaPods 切换到 Swift Package Manager。

依赖白名单脚本会尝试从 `Podfile` 中识别：

```text
pod 'Name'
```

并检查该 Pod 名称是否出现在：

```text
contracts/dependency-whitelist.txt
```

## 11. 当前只警告什么

当前对数据库 migration 先做警告：

```text
**/db/migration/**
```

原因：真实工程中数据库变更可能是合法任务，但必须人工确认。

如果希望强制阻断，可以在 `scripts/check-ai-boundary.sh` 中把 migration 的 WARN 改成 FAIL。

接口相关代码变更但 OpenAPI 未变更、migration 变更但 database-schema 未变更，也会先警告。

## 12. 当前不能替代什么

当前脚本不能替代：

```text
完整 OpenAPI diff 兼容性校验
完整数据库 DDL 解析
单元测试
端到端测试
安全扫描
代码质量扫描
真实构建验证
专业 SCA 依赖漏洞扫描
```

## 13. 一句话原则

```text
AI 可以写，但必须先有上下文；AI 可以改，但不能越阶段；AI 可以交付，但必须过门禁；AI 可以引入契约变更，但必须同步结构化契约。
```
