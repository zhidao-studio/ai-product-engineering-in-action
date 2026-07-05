# 工程基线

本目录用于定义从 0 开始写代码前必须先确定的工程基线。

它服务于一个问题：

```text
AI 在什么工程规范里写代码？
```

如果没有工程基线，AI 会自行决定框架、目录、接口、数据库、基础设施和启动方式。

## 当前技术方向

```text
前端：Vue 体系
后端：Java / Spring Boot 体系，不使用 Spring Cloud
基础设施：macOS + Homebrew + nginx + ngrok
工程形态：monorepo
```

## 文件

| 文件 | 作用 |
|---|---|
| `01_ENGINEERING_BASELINE.md` | 工程基线总说明 |

## 和模板的关系

```text
docs/engineering/           说明当前推荐基线
templates/code_delivery/    提供可复用模板
checklists/code_delivery/   提供检查清单
```
