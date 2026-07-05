# AI 执行规则

## 1. 当前仓库目标

本仓库的目标是：

```text
定义一套文档驱动的 AI 产品交付方法论，
提供可复用的 harness、工程基线、code delivery 模板和 checklist，
让非技术人能学会并实际使用。
```

当前优先级：

```text
B 方法论目标
↓
C 工具化目标
↓
A 教学目标
```

也就是：

1. 先定义方法论。
2. 再沉淀 harness、工程基线、代码任务包和 checklist。
3. 最后把它讲成非技术人能学会的课程。

## 2. 当前结构原则

1. 不再围绕某个具体样例工程组织主线。
2. 不再堆叠旧文档。
3. 新结构必须围绕“方法论、工程基线、模板、checklist、提示词、示例、教学化”组织。
4. `docs/` 只放说明性文档。
5. `templates/` 只放可复用模板。
6. `checklists/` 只放可执行检查清单。
7. `prompts/` 只放 AI / Agent / Review 提示词。
8. `examples/` 只放填好的示例。
9. 文件名和目录名使用英文，正文使用中文。
10. 所有 commit message 使用中文。

## 3. 目录职责

```text
docs/        方法论、工程基线、教学化说明
templates/   harness 模板和 code delivery 模板
checklists/  harness 检查清单和 code delivery 检查清单
prompts/     AI / Agent / Review 提示词
examples/    填好的示例
```

不得在多个目录重复维护同一类内容。

## 4. 内容判断标准

任何文档都必须回答至少一个问题：

```text
它定义了什么流程？
它定义了什么工程基线？
它提供了什么模板？
它提供了什么检查清单？
它能不能让非技术人照着使用？
它能不能约束 AI 写出可验收、可维护的代码？
```

如果一份文档不能回答这些问题，就不应该保留在新结构里。

## 5. AI / Agent 执行边界

AI / Agent 可以用于：

- 起草方法论文档
- 生成 harness 模板
- 生成 code delivery 模板
- 生成 checklist
- 生成代码任务包
- 生成示例
- 审查文档一致性
- 审查代码交付是否符合工程基线
- 修正表达和结构

AI / Agent 不应该自行决定：

- 方法论边界
- 工程基线
- 技术栈变更
- 是否引入新依赖
- 是否改变目录结构
- 是否跳过 checklist
- 是否新增复杂产品形态
- 是否引入无关样例工程

## 6. 代码交付红线

涉及代码交付时，必须遵守：

```text
docs/engineering/01_ENGINEERING_BASELINE.md
docs/engineering/02_ENGINEERING_QUALITY_GUARDRAILS.md
templates/code_delivery/07_CODE_TASK_PACKAGE_TEMPLATE.md
checklists/code_delivery/
```

没有工程基线，不允许直接让 AI 写代码。

没有代码任务包，不允许 Agent 修改工程。

没有代码验收清单，不算代码交付完成。

## 7. 完成任务后必须输出

每次修改后必须说明：

1. 修改了哪些文件。
2. 为什么这样改。
3. 属于方法论、工程基线、模板、checklist、提示词、示例还是教学化。
4. 是否还有旧结构或重复职责残留。
5. 下一步建议。
