# 检查清单

本目录存放可执行 checklist。

当前主线清单只放在：

```text
checklists/harness/
```

## 目录说明

| 目录 | 作用 |
|---|---|
| `harness/` | 检查 harness 是否完整、是否能交给 AI 执行、是否适合非技术人判断 |

## 使用方式

1. 写完 harness 后，先跑完整性检查。
2. 交给 AI 执行前，确认每个任务都有约束文档。
3. AI 产出后，用 checklist 判断是否通过。
4. 不通过时先判断要补 harness 还是缩小任务。

## 原则

```text
先 checklist，后执行。
先判断，后修改。
```
