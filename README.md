# AI 产品工程实战

AI Product Engineering in Action

这是一套面向非开发者的 AI 产品工程实战教程。

目标不是教你“AI 一键生成产品”，而是教你构造一套 AI 驱动交付 Harness：用产品、设计、工程、任务、验证、体验和迭代等多层约束，控制需求如何被实现。

## 核心诉求

```text
通过一整套完整 Harness，控制 AI 如何交付产品。
```

本课程关注的不是某个 AI 工具，而是这条主线：

```text
产品定义锁边界
↓
设计规格锁视觉和交互
↓
工程规格锁前端 / 后端 / 接口
↓
任务 Harness 锁本次执行范围
↓
验证 Harness 判断是否做对
↓
体验验收判断用户能不能用
↓
交付迭代保证变更可控
```

一句话：

```text
不是用 AI 替代文档，
而是用 Harness 控制 AI。
```

## 当前版本

当前仓库处于 `v0.4` 阶段：

- `v0.1`：完成课程仓库骨架、模板、提示词、第一版样例初稿。
- `v0.2`：补齐课程正文、产品验证、决策树、排错手册、模拟用户验收机制。
- `v0.2.2`：统一课程表述，不再使用 “Demo / 演示版本”，改为“样例 / 实战样例 / 样例工程”。
- `v0.3`：补齐 6 节图文课程，形成可跟做的主学习路径。
- `v0.3.3`：收敛课程入口，明确 `docs/02_lessons/visual/` 为当前唯一主课程入口，去掉多余学习层级。
- `v0.4`：重构为 AI 驱动交付 Harness 方法论，补齐产品定义、设计规格、工程规格、任务执行、验证、体验验收、交付迭代七层结构。

## 当前学习入口

当前学习请优先进入：

```text
docs/02_lessons/visual/
```

这是当前主课程入口。

核心方法论文档：

```text
docs/01_methodology/09_DOCUMENT_CONTROL_SYSTEM.md
docs/01_methodology/10_AI_DELIVERY_HARNESS_ARCHITECTURE.md
docs/01_methodology/11_HOW_TO_BUILD_HARNESS.md
```

其他文档的定位：

```text
docs/02_lessons/visual/     图文主课程，学员优先阅读
docs/02_lessons/lesson-xx   概念解释和原理补充，按需阅读
templates/                  可复制填写的 Harness 模板
prompts/                    可复制使用的 AI / Agent 提示词
examples/01_h5_place_favorites/  第一版 H5 实战样例工程
```

## 第一版实战样例

H5 页面 / 轻量 Web App：钓鱼露营地点收藏

H5 只是第一版承载形态，不是课程核心。

课程核心是：

```text
先构造 Harness，
再让 AI / Agent 在 Harness 约束内交付。
```

后续可以迁移到微信小程序、iOS App 或 Web App。

## 学习路径

1. 进入 `docs/02_lessons/visual/` 阅读图文课程。
2. 理解七层 AI 交付 Harness。
3. 写产品定义 Harness：产品验证、项目总说明、PRD。
4. 写设计规格 Harness：视觉风格、配色、组件、布局、原型。
5. 写工程规格 Harness：数据、前端、后端、接口、技术架构。
6. 写任务执行 Harness：任务清单、允许修改、禁止修改、验收标准。
7. 用 Agent 按分层任务执行。
8. 用验证 Harness 检查代码、功能、视觉、数据和文档追溯。
9. 用体验验收 Harness 判断真实用户能不能用。
10. 用交付与迭代 Harness 管理部署、反馈、变更和迭代。

## AI 工具说明

本课程不绑定某一个 AI 编码工具或 Agent。

你可以使用：

- Codex
- Cursor
- Windsurf
- Kimi Coding
- Trae / MarsCode
- GitHub Copilot
- 其他可以读取文档、修改工程、执行任务、审查结果的 AI / Agent

核心不是工具名称，而是 Harness：

> 需求有边界，设计有规格，工程有接口，任务有窗口，验证有断言，体验有验收，变更有协议。

## 仓库目录

```text
docs/          课程文档和方法论
templates/     可复制填写的 Harness 模板
prompts/       给通用大模型、Agent、审查模型的提示词
examples/      实战样例，包含文档和代码
tools/         工具脚本和配置
archive/       草稿、历史版本和归档内容
```

## 核心分工

| 角色 | 作用 |
|---|---|
| 学员 / 产品负责人 | 确认决策、做最终判断 |
| 通用大模型 | 起草产品定义、设计规格、工程规格、任务和验收文档 |
| 设计 / 原型 Agent | 生成风格方案、原型说明、视觉参考 |
| 前端 Agent | 在前端边界内实现页面、组件、交互和样式 |
| 后端 Agent | 在后端边界内实现数据模型、接口和业务规则 |
| 接口 / 联调 Agent | 检查前后端字段、接口、Mock 和错误状态 |
| 审查 Agent | 生成代码审查、视觉比对、数据一致性、文档追溯报告 |

一句话：

> 人做判断，AI 做辅助和执行，Harness 负责约束全过程。

## 课程原则

- 不神化 AI
- 不承诺一键生成商业产品
- Harness 的每一层都要回答“阻止 AI 做什么”
- 每一个任务都要可验收
- Agent 写完不等于完成，必须验证和体验验收
- 需求变更必须先改 Harness，再改任务，再改代码
- 第一版只做最小闭环，不做大而全
