# 基础设施规范模板

## 1. 基础设施目标

本文件用于约束本地开发环境、反向代理、内网穿透和基础服务启动方式。

当前基线：

```text
macOS
Homebrew
nginx
ngrok
Docker Compose（可选）
```

## 2. macOS / Homebrew 软件清单

| 软件 | 用途 | 安装方式 |
|---|---|---|
| Node.js | 前端运行环境 | `brew install node` |
| Java | 后端运行环境 | `brew install openjdk` |
| Maven | 后端构建工具 | 优先使用项目自带 `mvnw` |
| nginx | 本地反向代理 | `brew install nginx` |
| ngrok | 本地服务公网访问 | 按 ngrok 官方方式安装 |
| Docker Desktop | 本地数据库和依赖服务 | 手动安装或按团队规范 |

## 3. 本地端口规划

| 服务 | 默认端口 | 说明 |
|---|---:|---|
| 前端 Vite | 5173 | 本地前端开发 |
| 后端 Spring Boot | 8080 | 本地 API 服务 |
| nginx | 8088 / 80 | 本地反向代理，避免和后端冲突 |
| ngrok | 指向 nginx 或后端端口 | 对外访问 |
| 数据库 | 5432 / 3306 | 按数据库类型决定 |

## 4. nginx 规则

nginx 用途：

- 本地统一入口
- 代理前端页面
- 代理后端 API
- 给 ngrok 暴露统一端口

示例约定：

```text
/frontend → 前端 dev server
/api      → 后端 Spring Boot
```

## 5. ngrok 规则

ngrok 用途：

- 临时公网访问
- Webhook 调试
- 外部设备访问本机服务

使用原则：

- 优先暴露 nginx 统一入口
- 不直接暴露数据库
- 不提交 ngrok token
- 不把公网地址写死进代码

## 6. 环境变量

必须提供：

```text
.env.example
```

不得提交：

```text
.env
真实 token
真实密码
真实密钥
```

## 7. AI 禁止行为

AI 不得：

- 自行引入 Kubernetes
- 自行引入复杂 CI/CD
- 自行暴露数据库公网端口
- 自行把密钥写进代码
- 自行改变端口规划
- 自行把 ngrok 地址硬编码进前端或后端

## 8. 验收标准

- [ ] Homebrew 软件清单明确
- [ ] 本地端口规划明确
- [ ] nginx 代理规则明确
- [ ] ngrok 暴露对象明确
- [ ] `.env.example` 完整
- [ ] 不提交敏感信息
- [ ] README 写明启动步骤
