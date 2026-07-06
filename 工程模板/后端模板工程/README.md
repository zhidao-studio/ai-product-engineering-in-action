# 后端模板工程

## 1. 定位

这是一个 Spring Boot 单体后端模板工程，用于约束 AI 在固定后端结构中开发业务接口。

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

## 3. 目录结构

```text
src/main/java/com/example/template/
  TemplateApplication.java
  common/       统一响应和错误码
  exception/    业务异常和全局异常处理
  config/       基础配置
  status/       服务状态样例
```

## 4. 命令

```bash
./mvnw test
./mvnw spring-boot:run
```

## 5. AI 修改边界

AI 可以新增业务 Controller、Service、Repository、DTO、Model 和测试。

AI 不得删除：

```text
common/ApiResponse.java
common/ErrorCode.java
exception/BusinessException.java
exception/GlobalExceptionHandler.java
```

AI 不得绕过统一响应和统一异常处理。
