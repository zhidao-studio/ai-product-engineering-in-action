# 后端工程规范模板

## 1. 技术选择

后端采用 Java / Spring Boot 体系。

推荐基线：

```text
Java：使用当前稳定 LTS 或项目指定版本
Spring Boot：使用当前稳定版本
构建工具：Maven
架构风格：单体应用
不使用：Spring Cloud
```

## 2. 目录结构

```text
backend/
  src/main/java/com/example/app/
    AppApplication.java
    api/
    service/
    repository/
    model/
    dto/
    config/
    exception/
  src/main/resources/
    application.yml
  src/test/java/
  pom.xml
  mvnw
```

## 3. 分层职责

| 目录 | 职责 |
|---|---|
| `api/` | Controller，请求和响应处理 |
| `service/` | 业务逻辑 |
| `repository/` | 数据访问 |
| `model/` | 领域模型或实体 |
| `dto/` | 请求和响应对象 |
| `config/` | 配置类 |
| `exception/` | 统一异常和错误响应 |

## 4. 后端编码规则

AI 必须遵守：

- Controller 只处理 HTTP 请求和响应。
- 业务逻辑必须放在 service。
- 数据访问必须放在 repository。
- 请求和响应对象必须使用 dto。
- 不把 SQL 写进 controller。
- 不把业务逻辑写进 controller。
- 不自行新增 Spring Cloud 依赖。
- 不自行新增消息队列、注册中心、配置中心。

## 5. API 风格

默认使用 REST API。

响应格式建议统一：

```json
{
  "code": "OK",
  "message": "success",
  "data": {}
}
```

错误响应建议统一：

```json
{
  "code": "ERROR_CODE",
  "message": "可读错误说明",
  "details": {}
}
```

## 6. 配置规则

- 配置写入 `application.yml`。
- 敏感信息使用环境变量。
- 不提交真实密码、token、密钥。
- 本地配置使用 `.env.example` 或 README 说明。

## 7. AI 禁止行为

AI 不得：

- 引入 Spring Cloud
- 改成微服务架构
- 新增注册中心、配置中心、网关服务
- 自行新增未定义的业务模块
- 绕过 service / repository 分层

## 8. 验收标准

- [ ] 后端目录结构符合规范
- [ ] 分层职责清楚
- [ ] API 符合 API Contract
- [ ] 错误响应统一
- [ ] 配置不包含敏感信息
- [ ] `./mvnw test` 可通过
- [ ] `./mvnw spring-boot:run` 可启动
