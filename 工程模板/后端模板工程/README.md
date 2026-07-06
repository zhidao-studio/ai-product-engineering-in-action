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

## 2. 技术栈

```text
Java 17+
Spring Boot
Spring Web
Spring Validation
MyBatis-Plus 或 JPA（二选一，由项目决定）
Flyway
JUnit
```

## 3. 分层结构

本模板参考 RuoYi-Vue-Plus 的分层思路，但只保留轻量单体所需结构。

```text
src/main/java/com/example/template/
  TemplateApplication.java
  common/                 统一响应和错误码
  exception/              业务异常和全局异常处理
  controller/v1/          API v1 控制器
  domain/*/bo/            业务入参对象
  domain/*/vo/            接口返回对象
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
```

Controller 只依赖 Service 接口，不直接依赖实现类。

Controller 只处理协议层逻辑，不写业务规则。

## 7. 命令

```bash
./mvnw test
./mvnw spring-boot:run
```

## 8. 最小认证样板

当前认证样板只提供最小登录结构，用于约束 Controller、BO、VO、Service 接口、Service 实现和测试分层。

它不是完整权限平台。

真实项目需要认证、权限、密码哈希、会话策略时，必须先更新接口契约、安全约束和代码任务包。

## 9. AI 修改边界

AI 可以新增业务 Controller、Service、Repository、BO、VO、Model 和测试。

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

AI 不得绕过统一响应、统一异常处理、DTO 校验、API 版本规则和 Service 接口分层。
