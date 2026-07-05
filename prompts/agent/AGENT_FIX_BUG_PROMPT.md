# Agent 修正提示词

## 1. 使用场景

当 AI 产物没有通过 checklist 时，使用这个提示词。

## 2. 提示词模板

```text
请只修正下面这个问题，不要扩大范围。

当前问题：
【填写问题】

对应 harness：
【填写相关 harness】

对应 checklist：
【填写未通过的检查项】

允许处理的内容：
【填写允许范围】

本次不处理的内容：
【填写限制范围】

请输出：
1. 问题原因
2. 修正内容
3. 对应的 harness 条目
4. 是否通过 checklist
5. 是否需要补 harness
```

## 3. 使用原则

- 先判断是 harness 不清楚，还是 AI 没遵守 harness。
- 如果是 harness 不清楚，先补 harness。
- 如果是 AI 没遵守，再缩小任务重新执行。
