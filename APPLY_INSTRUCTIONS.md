# v0.3.2 图文课程收尾修正包应用说明

本次更新目标：

1. 同步 `AI_ROLE_MATRIX.md`，从“Codex 单一执行员”改为“AI 编码工具可替换”。
2. 修正第 2 课图文版标题序号重复问题。
3. 第 3 课补充“错误流程 vs 正确流程”的反面示例。
4. 第 5 课说明任务状态：样例工程已完成，学员跟做时从 TODO 开始。
5. 说明 `visual/` 图文版是当前学习主入口。
6. 进一步统一术语：不再使用 `demo-lesson-*` 文件名，改为 `hands-on-lesson-*`。

## 推荐提交方式

```bash
git checkout -b feat/v0.3.2-visual-course-polish

# 解压本更新包，把 docs 复制到仓库根目录，覆盖同名文件

# 建议删除旧的 demo-lesson 文件，避免术语残留：
rm -f docs/02_lessons/demo-lesson-01-ai-development-is-engineering.md
rm -f docs/02_lessons/demo-lesson-02-from-idea-to-prd.md
rm -f docs/02_lessons/demo-lesson-03-page-list-and-user-flow.md
rm -f docs/02_lessons/demo-lesson-04-ai-rules.md
rm -f docs/02_lessons/demo-lesson-05-task-driven-coding.md
rm -f docs/02_lessons/demo-lesson-06-review-and-human-acceptance.md

git status
git add .
git commit -m "chore: polish v0.3 visual course wording and structure"
git push -u origin feat/v0.3.2-visual-course-polish
```

## 文件命名调整

旧名称：

```text
demo-lesson-xx-*.md
```

新名称：

```text
hands-on-lesson-xx-*.md
```

原因：

课程统一使用“样例 / 实战样例 / 手把手演示 / 图文课”，避免 `Demo` 语感。
