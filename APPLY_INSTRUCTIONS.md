# v0.2.2 术语修正包应用说明

本次更新只做一件事：

统一课程中的交付物表述，避免使用 “Demo / 演示版本” 这类表达。

## 统一术语

推荐使用：

- 样例
- 实战样例
- 样例工程
- 第一版可运行样例
- 第一版可运行样例产品
- 微信小程序实战样例
- 钓鱼露营地点收藏小程序样例

不再使用：

- Demo
- App Demo
- 小程序 Demo
- 演示版本
- 演示样品

## 提交方式

```bash
git checkout -b chore/v0.2.2-wording-fix

# 解压本更新包，把内容复制到仓库根目录，覆盖同名文件

git status
git add .
git commit -m "chore: standardize sample terminology"
git push -u origin chore/v0.2.2-wording-fix
```

然后在 GitHub 上创建 Pull Request。
