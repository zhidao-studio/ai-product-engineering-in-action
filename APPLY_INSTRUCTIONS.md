# v0.3.1 手把手课程修正包应用说明

本次更新目标：

1. 统一 `Agent` 与 `AI 编码工具` 的关系，降低学员理解成本。
2. 补齐第 1、3、4、5、6 课的手把手演示文件。
3. 让 6 节课都具备“起始输入 → 使用提示词 → 输出示例 → 检查标准 → 追问修正 → 合格产物”的可跟做结构。

## 新增 / 更新文件

```text
docs/04_notes/TERMS.md
docs/02_lessons/README.md
docs/02_lessons/demo-lesson-01-ai-development-is-engineering.md
docs/02_lessons/demo-lesson-03-page-list-and-user-flow.md
docs/02_lessons/demo-lesson-04-ai-rules.md
docs/02_lessons/demo-lesson-05-task-driven-coding.md
docs/02_lessons/demo-lesson-06-review-and-human-acceptance.md
```

## 推荐提交方式

```bash
git checkout -b feat/v0.3.1-hands-on-lessons

# 解压本更新包，把 docs 复制到仓库根目录，覆盖同名文件

git status
git add .
git commit -m "feat: add v0.3.1 hands-on lesson walkthroughs"
git push -u origin feat/v0.3.1-hands-on-lessons
```
