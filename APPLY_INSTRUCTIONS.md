# v0.2 更新包应用说明

这个更新包用于把 `ai-product-engineering-in-action` 从 v0.1 初始化骨架升级到 v0.2 可学习课程骨架。

## 推荐方式：新建分支 + 复制覆盖 + 提 PR

```bash
git clone https://github.com/zhidao-studio/ai-product-engineering-in-action.git
cd ai-product-engineering-in-action

git checkout -b feat/v0.2-course-content

# 把本更新包里的 docs、prompts、README.md 复制到仓库根目录
# 如果提示覆盖，确认覆盖

git status
git add .
git commit -m "feat: add v0.2 course content and human acceptance workflow"
git push -u origin feat/v0.2-course-content
```

然后在 GitHub 上创建 Pull Request：

```text
base: main
compare: feat/v0.2-course-content
```

## 本次更新内容

1. 补齐 6 节 MVP 课程正文。
2. 新增产品验证步骤。
3. 新增非技术用户决策树。
4. 新增版本迭代指南。
5. 新增工具与成本说明。
6. 扩展问题排查手册。
7. 增加“模拟用户验收”机制。
8. 增强 ChatGPT / AI 编码工具 / DeepSeek 提示词。
9. 调整工具表述：从强绑定 Codex 改成“AI 编码工具可替换”。
