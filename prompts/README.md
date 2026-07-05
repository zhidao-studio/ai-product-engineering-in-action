# 提示词

本目录存放 AI / Agent / Review 提示词。

## 目录说明

| 目录 | 作用 |
|---|---|
| `ai/` | 通用大模型提示词，用于起草 harness |
| `agent/` | Agent 执行提示词，用于按 harness 或工程基线执行任务 |
| `review/` | 审查提示词，用于检查 harness、代码交付和 AI 产物 |

## 使用原则

```text
AI 负责起草，
Agent 负责执行，
Review 负责检查，
人负责确认和最终判断。
```

## 推荐顺序

```text
prompts/ai/
↓
prompts/agent/
↓
prompts/review/
```
