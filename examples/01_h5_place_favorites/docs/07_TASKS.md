# 任务清单

## 状态说明

| 状态 | 含义 |
|---|---|
| TODO | 未开始 |
| DOING | 正在做 |
| REVIEW | 等待审查 |
| FIXING | 修复中 |
| DONE | 已完成 |

## 第一版任务

| 任务编号 | 任务名称 | 依赖文档 | 允许修改 | 验收标准 | 状态 |
|---|---|---|---|---|---|
| TASK-001 | 建立 H5 基础文件结构 | 06_ARCHITECTURE.md | `index.html`、`styles.css`、`app.js`、`mock/places.js` | 浏览器能打开基础页面 | TODO |
| TASK-002 | 实现 mock 地点数据 | 05_DATA_SPEC.md | `mock/places.js` | 至少有 2 条地点数据，字段符合数据规范 | TODO |
| TASK-003 | 实现首页地点列表 | 03_PAGE_LIST.md、05_DATA_SPEC.md | `index.html`、`styles.css`、`app.js` | 首页能展示地点卡片 | TODO |
| TASK-004 | 实现详情页 | 03_PAGE_LIST.md、04_UX_FLOW.md | `index.html`、`styles.css`、`app.js` | 点击地点能进入详情页 | TODO |
| TASK-005 | 实现收藏功能 | 04_UX_FLOW.md、05_DATA_SPEC.md | `app.js` | 能收藏、取消收藏，并写入 localStorage | TODO |
| TASK-006 | 实现收藏页 | 03_PAGE_LIST.md、04_UX_FLOW.md | `index.html`、`styles.css`、`app.js` | 收藏页能展示已收藏地点 | TODO |
| TASK-007 | 实现设置页和关于页 | 03_PAGE_LIST.md | `index.html`、`styles.css`、`app.js` | 能清空收藏，能看到课程样例说明 | TODO |
| TASK-008 | 模拟用户验收 | 04_UX_FLOW.md、07_DOC_TO_CODE_MAPPING.md | 文档和少量页面文案 | 用户能完成首页 → 详情 → 收藏 → 收藏页 | TODO |

## 标准 AI 编码任务格式

每次交给 AI 编码工具时，必须使用这种结构：

```text
当前任务：TASK-xxx

目标：
【只写当前任务目标】

必须阅读：
【列出相关文档】

允许修改：
【列出允许修改的文件】

禁止修改：
【列出禁止修改的文件和能力】

验收标准：
【列出可检查标准】

完成后输出：
1. 修改文件列表
2. 实现说明
3. 验证方式
4. 风险点
```

## 关键原则

```text
不是让 AI 做完整产品，
而是让 AI 每次只完成一个被文档约束的小任务。
```
