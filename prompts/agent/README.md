# Agent 提示词

本目录放 Agent 执行和修正类提示词。

## 文件

| 文件 | 用途 |
|---|---|
| `AGENT_TASK_PROMPT.md` | 让 Agent 按 harness 执行一个明确任务 |
| `AGENT_FIX_BUG_PROMPT.md` | 当产物未通过 checklist 时，让 Agent 修正 |

## 原则

```text
Agent 只在 harness 约束内执行。
```

如果 harness 不清楚，先补 harness，不要让 Agent 自由发挥。
