# 最小 Harness 示例

## 1. 示例目标

这个示例不开发完整产品，只展示如何从一个产品想法构造最小可用 harness。

示例产品想法：

```text
做一个页面，帮助用户收藏自己喜欢的地点。
```

## 2. 示例解决什么问题

这个示例用于回答：

```text
七层 harness 模板填完之后，到底长什么样？
非技术人如何照着模板判断 AI 能不能开始执行？
```

它不是代码工程，也不是 H5 样例。

它是一个填好的 harness 参考样本。

## 3. 示例文件

| 文件 | 对应层级 | 作用 |
|---|---|---|
| `01_PRODUCT_DEFINITION.md` | 产品定义 Harness | 锁定做什么、不做什么、成功标准 |
| `02_DESIGN_SPEC.md` | 设计规格 Harness | 锁定视觉风格、页面模块和状态 |
| `03_ENGINEERING_SPEC.md` | 工程规格 Harness | 锁定字段、前端范围、后端范围和接口方案 |
| `04_TASK_EXECUTION.md` | 任务执行 Harness | 锁定 AI 本次只能做什么 |
| `05_VALIDATION.md` | 验证 Harness | 判断 AI 产物是否符合文档和任务 |
| `06_ACCEPTANCE.md` | 体验验收 Harness | 判断真实用户是否能完成核心流程 |
| `07_DELIVERY_ITERATION.md` | 交付迭代 Harness | 约束上线、反馈、变更和迭代 |

## 4. 推荐阅读顺序

```text
01_PRODUCT_DEFINITION.md
↓
02_DESIGN_SPEC.md
↓
03_ENGINEERING_SPEC.md
↓
04_TASK_EXECUTION.md
↓
05_VALIDATION.md
↓
06_ACCEPTANCE.md
↓
07_DELIVERY_ITERATION.md
```

## 5. 如何使用这个示例

1. 先读完整示例，理解每一层在约束什么。
2. 打开 `templates/harness/`，对照模板字段。
3. 打开 `checklists/harness/01_HARNESS_COMPLETENESS_CHECKLIST.md`，检查这个示例是否覆盖主要 AI 决策点。
4. 把示例产品想法替换成自己的产品想法。
5. 让 AI 先起草 harness，而不是直接写代码。

## 6. 这个示例的边界

本示例故意保持最小：

- 不做登录。
- 不做后端。
- 不做真实 API。
- 不做地图。
- 不做完整 UI 稿。
- 不写代码。

这样可以让学习者先看懂 harness，而不是被工程细节干扰。

## 7. 最重要的一句话

```text
示例不是为了证明 AI 能写代码，
而是为了证明 harness 能约束 AI 交付。
```
