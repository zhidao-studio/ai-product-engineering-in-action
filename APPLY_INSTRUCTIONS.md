# v0.3 图文课程包应用说明

本次更新目标：

把课程从“方法论文档”升级为“非技术学员可跟做的图文课程”。

## 本次新增

```text
docs/02_lessons/visual/
├── README.md
├── lesson-01-visual-ai-development-is-engineering.md
├── lesson-02-visual-from-idea-to-prd.md
├── lesson-03-visual-page-list-and-user-flow.md
├── lesson-04-visual-ai-rules.md
├── lesson-05-visual-task-driven-coding.md
├── lesson-06-visual-review-and-human-acceptance.md
└── screenshot-guide.md
```

## 推荐提交方式

```bash
git checkout -b feat/v0.3-visual-lessons

# 解压本更新包，把 docs 复制到仓库根目录，覆盖或新增文件

git status
git add .
git commit -m "feat: add v0.3 visual lesson guides"
git push -u origin feat/v0.3-visual-lessons
```

## 说明

本包先使用：

- Mermaid 流程图
- 页面示意图
- 表格步骤图
- 截图占位说明
- 操作检查清单

后续你在本地运行微信开发者工具后，可以按 `screenshot-guide.md` 补真实截图。
