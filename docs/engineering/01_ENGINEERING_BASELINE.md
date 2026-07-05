# 工程基线总说明

## 1. 为什么需要工程基线

如果工程完全从 0 开始，就不能直接让 AI 写代码。

必须先定义：

```text
前端怎么组织
后端怎么组织
API 怎么对接
数据库怎么设计
本地环境怎么启动
nginx 和 ngrok 怎么使用
AI 每次能改什么
```

否则 AI 会自己搭工程，后续很难维护。

## 2. 当前推荐技术基线

### 前端

```text
Vue 3
Vite
TypeScript
Vue Router
Pinia
ESLint
Prettier
Vitest
```

初始化方式：

```text
npm create vue@latest
```

### 后端

```text
Java
Spring Boot
Maven / Maven Wrapper
REST API
单体应用
不使用 Spring Cloud
```

### 基础设施

```text
macOS
Homebrew
nginx
ngrok
Docker Compose（按需）
```

## 3. 推荐目标项目结构

这里描述的是“被 AI 生成或维护的目标项目结构”，不是当前方法论仓库自身的目录结构。

推荐目标项目采用 monorepo：

```text
project-root/
  docs/
  frontend/
  backend/
  infra/
  scripts/
  README.md
```

目标项目中：

- `docs/` 存放该具体项目的 harness、工程规格、任务包和验收记录。
- `frontend/` 存放 Vue 前端工程。
- `backend/` 存放 Spring Boot 后端工程。
- `infra/` 存放本地基础设施配置。
- `scripts/` 存放本地辅助脚本。

## 4. 前端边界

前端只负责：

- 页面展示
- 组件拆分
- 路由
- 状态管理
- API 调用封装
- 页面状态展示
- 样式实现

前端不得自行决定：

- 新增后端接口
- 新增业务规则
- 新增未定义字段
- 更换技术栈

## 5. 后端边界

后端只负责：

- API 实现
- 业务逻辑
- 数据访问
- 错误响应
- 配置读取
- 测试

后端不得自行决定：

- 引入 Spring Cloud
- 拆成微服务
- 新增未定义业务模块
- 绕过 API 契约
- 把敏感信息写入代码

## 6. 基础设施边界

基础设施只负责：

- 本地软件安装说明
- 端口规划
- nginx 反向代理
- ngrok 内网穿透
- 环境变量样例
- 本地依赖服务启动

基础设施不得自行引入：

- Kubernetes
- 复杂 CI/CD
- 云厂商专属部署
- 生产级网关
- 注册中心或配置中心

## 7. AI 编码前必须具备

```text
工程规格 Harness
项目总工程结构模板
前端工程规范模板
后端工程规范模板
API 契约模板
数据库规范模板
基础设施规范模板
代码任务包
代码验收清单
```

## 8. 一句话原则

```text
从 0 到代码，不是直接让 AI 写；
而是先让 AI 进入一个被工程规范约束好的施工现场。
```
