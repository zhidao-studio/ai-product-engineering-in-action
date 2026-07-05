# 课程正文

这里放 6 节基础课程正文和图文课程。

## 当前学习入口

当前对学员学习，统一以图文课程为主：

```text
docs/02_lessons/visual/
```

也就是说，学员第一遍学习时，不需要在多个课程入口之间切换。

## 文件关系

当前只保留两类课程文件：

### 1. 图文主课程

```text
visual/
```

作用：

- 给流程图
- 给操作步骤
- 给输入示例
- 给输出示例
- 给截图占位
- 给检查清单
- 给常见错误
- 给下一步

这是当前主学习路径。

### 2. 基础课程正文

```text
lesson-01-ai-development-is-engineering.md
lesson-02-from-idea-to-prd.md
lesson-03-page-list-and-user-flow.md
lesson-04-agents-rules.md
lesson-05-task-driven-coding.md
lesson-06-review-and-maintenance.md
```

作用：

- 讲概念
- 讲原则
- 讲每节课为什么重要

这些文件用于理解原理，不作为第一学习入口。

## 当前课程主线

```text
需求进入文档
↓
文档拆成任务
↓
任务约束 Agent
↓
Agent 执行任务
↓
代码回溯文档
↓
验收判断结果
```

课程重点不是某个具体产品形态，而是：

```text
通过一整套完整文档，控制需求如何被实现。
```

## 不再保留的课程层级

不再保留单独的：

```text
hands-on-lesson-xx
```

原因：

- `visual/` 已经包含可跟做步骤。
- 多一层文件会增加学员理解成本。
- 当前课程目标是让学员直接沿着图文路径理解文档控制链路。

## 推荐学习顺序

```text
先看 visual/ 图文主课程
↓
需要理解原理时，再看 lesson-xx 基础正文
↓
最后填写自己的项目文档、任务清单和验收清单
```

## 术语说明

本课程统一使用：

```text
样例
实战样例
样例工程
图文课程
Agent
文档控制体系
```

避免使用：

```text
Demo
演示版本
临时样品
```
