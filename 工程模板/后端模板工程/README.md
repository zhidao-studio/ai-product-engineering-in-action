# 后端模板工程

## 1. 定位

这是一个 Spring Boot 单体后端模板工程，用于约束 AI 在固定后端结构中开发业务接口。

后端默认面向多端接入，统一服务：

```text
Web 后台
H5
微信小程序
iOS
未来其他端
```

默认不使用 Spring Cloud，不引入注册中心、配置中心、网关、消息队列和分布式事务。

## 2. 成熟技术栈

本模板默认采用成熟、常用、容易被团队维护的后端组合：

```text
Java 17+
Spring Boot 3
Spring Web
Spring Validation
MyBatis-Plus
Flyway
MySQL
H2（测试）
JUnit 5
```

参考思路：

```text
RuoYi-Vue-Plus 的 controller / domain / mapper / service / service.impl 分层
```

只借成熟分层和常用组件，不引入多租户、工作流、OSS、Redis、动态数据源等复杂平台能力。

## 3. 分层结构

```text
src/main/java/com/example/template/
  TemplateApplication.java
  common/                 统一响应和错误码
  exception/              业务异常和全局异常处理
  controller/v1/          API v1 控制器
  domain/*/entity/        数据库实体对象
  domain/*/bo/            业务入参对象
  domain/*/vo/            接口返回对象
  mapper/                 MyBatis-Plus Mapper
  service/                Service 接口
  service/impl/           Service 实现
  status/                 服务状态样例
```

## 4. API 版本规则

所有新增接口默认使用：

```text
/api/v1/...
```

不兼容变更必须新增：

```text
/api/v2/...
```

不得直接破坏 v1 接口的请求字段、响应字段和错误码。

## 5. 多端接入规则

多端接入使用统一 API。

如需识别客户端，可使用请求头：

```text
X-Client-Type: web-admin / h5 / weapp / ios
```

客户端类型只能用于日志、审计、兼容判断和灰度判断，不应在业务逻辑中大量散落条件分支。

## 6. Service 规则

Service 必须优先定义接口，再提供实现类：

```text
service/IAuthService.java
service/impl/AuthServiceImpl.java
service/IVideoTaskService.java
service/impl/VideoTaskServiceImpl.java
```

Controller 只依赖 Service 接口，不直接依赖实现类。

Controller 只处理协议层逻辑，不写业务规则。

## 7. 数据访问和数据库规则

数据访问默认使用 MyBatis-Plus。

数据库结构变更默认使用 Flyway。

必须遵守：

```text
文档/工程基线/07_数据库设计规范.md
样板/代码交付/05_数据库结构样板.md
工程模板/后端模板工程/数据库规范说明.md
```

规则：

- Entity 放在 `domain/*/entity/`。
- Mapper 放在 `mapper/`。
- BO 只用于接收业务入参。
- VO 只用于对外返回。
- 不直接把 Entity 暴露给前端。
- 表结构变更必须通过 Flyway migration。
- 新表必须先写入数据库结构文档。
- 字段必须能追溯到接口契约。

## 8. 已包含样板

当前模板包含两类样板：

```text
认证样板：AuthController + IAuthService + AuthServiceImpl
业务 CRUD 样板：VideoTaskController + IVideoTaskService + VideoTaskServiceImpl + VideoTaskMapper + Flyway 建表
```

业务 CRUD 样板用于指导后续业务模块按同样结构扩展。

## 9. 命令

```bash
./mvnw test
./mvnw spring-boot:run
```

## 10. AI 修改边界

AI 可以新增业务 Controller、Service、Mapper、Entity、BO、VO、Flyway migration 和测试。

AI 不得删除：

```text
common/ApiResponse.java
common/ErrorCode.java
exception/BusinessException.java
exception/GlobalExceptionHandler.java
service/IAuthService.java
service/impl/AuthServiceImpl.java
controller/v1/AuthController.java
```

AI 不得绕过统一响应、统一异常处理、参数校验、API 版本规则、Service 接口分层、MyBatis-Plus Mapper 分层、数据库设计规范和 Flyway migration。
