# AI 产品工程实战

AI Product Engineering in Action

这是一套面向非开发者的 AI 产品工程实战教程。

目标不是教你“AI 一键生成产品”，而是教你如何用 AI 按工程流程做出可维护的产品第一版。

## 第一版实战项目

微信小程序：钓鱼露营地点收藏

页面：

- 首页
- 详情页
- 收藏页
- 设置页
- 关于页

第一版不做：登录、后端、地图、发布、评论、私信、支付、云同步。

## 学习路径

1. 写《项目总说明》
2. 写《产品需求文档》
3. 拆《页面清单》
4. 写《用户流程》
5. 写《AI 执行规则》
6. 拆《任务清单》
7. 让 Codex 按任务写代码
8. 用 DeepSeek 做代码审查
9. 运行、修复、迭代

## 仓库目录

```text
docs/          课程文档和方法论
templates/     可复制填写的文档模板
prompts/       给 ChatGPT / Codex / DeepSeek / Kimi 的提示词
examples/      实战案例，包含文档和代码
tools/         工具脚本和配置
archive/       草稿、历史版本和归档内容
```

## 快速开始

### 1. 阅读课程总览

```text
docs/00_overview/00_COURSE_BRIEF.md
docs/00_overview/01_COURSE_OUTLINE.md
docs/00_overview/02_LEARNING_PATH.md
```

### 2. 查看实战案例

```text
examples/01_wechat_mini_program_favorites/
```

### 3. 用微信开发者工具打开小程序

打开目录：

```text
examples/01_wechat_mini_program_favorites/miniapp
```

如果暂时没有正式 AppID，可以先使用测试号或无 AppID 模式进行学习和预览。

## 核心分工

| 工具 | 作用 |
|---|---|
| ChatGPT | 产品设计、需求拆解、架构设计、任务拆分、最终验收 |
| Codex | 进入工程写代码、改文件、修 bug、执行任务 |
| DeepSeek | 代码审查、风险检查、逻辑检查 |
| Kimi | 长文档整理、中文说明、竞品分析、文案辅助 |
| 学员 | 做决定、控范围、运行验证、确认是否完成 |

> ChatGPT 想清楚，Codex 写出来，DeepSeek 查问题，Kimi 整资料，学员做决定。
