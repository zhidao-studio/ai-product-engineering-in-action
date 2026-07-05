# 项目总工程结构模板

## 1. 使用说明

本模板用于“目标项目”，不是当前方法论仓库自身。

目标项目指 AI 将要生成或维护的具体产品工程。

## 2. 工程形态

推荐形态：monorepo。

```text
project-root/
  docs/
  frontend/
  backend/
  infra/
  scripts/
  README.md
```

## 3. 目录职责

| 目录 | 职责 | AI 可否自行新增 |
|---|---|---|
| `docs/` | 当前目标项目的 harness、工程规格、任务包、验收记录 | 否 |
| `frontend/` | Vue 前端工程 | 否 |
| `backend/` | Spring Boot 后端工程 | 否 |
| `infra/` | 本地基础设施、nginx、ngrok、部署说明 | 否 |
| `scripts/` | 本地启动、检查、辅助脚本 | 需任务允许 |

## 4. 启动方式

前端启动：

```text
cd frontend
npm install
npm run dev
```

后端启动：

```text
cd backend
./mvnw spring-boot:run
```

基础设施启动：

```text
cd infra
docker compose up -d
```

## 5. AI 工程边界

AI 不得：

- 自行改成多仓库
- 自行引入 Spring Cloud
- 自行引入微服务拆分
- 自行新增未定义目录
- 自行改变前后端通信方式

## 6. 通过标准

- [ ] 工程目录清楚
- [ ] 每个目录职责明确
- [ ] 前端、后端、infra 边界明确
- [ ] 本地启动方式明确
- [ ] AI 修改范围可被任务包约束
