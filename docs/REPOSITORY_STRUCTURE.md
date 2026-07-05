# 仓库结构说明

## 1. 目的

本文件用于定义当前仓库的目录职责，避免同一类内容在多个目录重复维护。

## 2. 顶层目录职责

| 目录 | 职责 | 不应该放什么 |
|---|---|---|
| `docs/` | 方法论、工程基线、结构说明、教学化说明 | 空白模板、checklist、提示词、完整示例 |
| `templates/` | 可复用空白模板 | 方法论解释、长篇教学内容、填好的示例 |
| `checklists/` | 可执行检查清单 | 方法论正文、模板正文、示例正文 |
| `prompts/` | AI / Agent / Review 提示词 | 方法论文档、模板、checklist |
| `examples/` | 填好的参考示例 | 空白模板、仓库方法论主文档 |

## 3. docs 目录职责

```text
docs/README.md                文档导航
docs/REPOSITORY_STRUCTURE.md  仓库结构说明
docs/methodology/             方法论
docs/engineering/             工程基线和质量红线
docs/lessons/                 后续教学化内容
```

### docs 不负责

`docs/` 不保存可复制模板、不保存 checklist、不保存提示词、不保存完整示例。

这些内容分别进入：

```text
templates/
checklists/
prompts/
examples/
```

## 4. templates 目录职责

```text
templates/harness/        产品交付 harness 模板
templates/code_delivery/  代码交付模板
```

模板只回答：

```text
应该填写什么？
AI 应该被什么约束？
```

模板不负责解释完整方法论。

## 5. checklists 目录职责

```text
checklists/harness/        harness 完整性检查
checklists/code_delivery/  工程基线和代码交付检查
```

检查清单只回答：

```text
是否完整？
是否可以进入下一步？
哪里缺约束？
```

## 6. prompts 目录职责

```text
prompts/ai/      通用大模型起草提示词
prompts/agent/   Agent 执行提示词
prompts/review/  审查提示词
```

提示词只回答：

```text
如何让 AI 执行一个受约束的动作？
```

## 7. examples 目录职责

```text
examples/01_minimal_harness/  最小填好示例
```

示例只回答：

```text
模板填完以后大概长什么样？
```

示例不是主方法论文档。

## 8. 当前唯一基线来源

当前工程技术基线只以这里为准：

```text
docs/engineering/01_ENGINEERING_BASELINE.md
```

工程质量红线只以这里为准：

```text
docs/engineering/02_ENGINEERING_QUALITY_GUARDRAILS.md
```

其他目录如需引用技术基线，只能引用这两个文件，不应重复维护另一套基线说明。

## 9. 当前唯一阅读入口

仓库总入口：

```text
README.md
```

文档入口：

```text
docs/README.md
```

不要重新创建：

```text
docs/00_start_here/
docs/00_overview/
docs/01_methodology/
docs/02_lessons/
```

## 10. 一句话原则

```text
一个内容类型只放一个地方；
需要引用时引用源文件，不复制一份新的。
```
