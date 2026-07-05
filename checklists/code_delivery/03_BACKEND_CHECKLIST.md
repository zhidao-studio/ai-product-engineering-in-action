# 后端工程检查清单

## 1. 技术栈

- [ ] 使用 Java
- [ ] 使用 Spring Boot
- [ ] 使用 Maven 或 Maven Wrapper
- [ ] 明确不使用 Spring Cloud
- [ ] 后端是单体应用

## 2. 目录结构

- [ ] `api/` 只放 Controller
- [ ] `service/` 放业务逻辑
- [ ] `repository/` 放数据访问
- [ ] `model/` 放模型或实体
- [ ] `dto/` 放请求和响应对象
- [ ] `exception/` 放异常和错误响应
- [ ] `config/` 放配置

## 3. 编码约束

- [ ] Controller 没有业务逻辑
- [ ] Controller 没有直接访问数据库
- [ ] Service 没有处理 HTTP 细节
- [ ] Repository 没有业务判断
- [ ] 错误响应格式统一
- [ ] 配置不包含真实密钥

## 4. 验证

- [ ] `./mvnw test` 可通过
- [ ] `./mvnw spring-boot:run` 可启动
- [ ] API 返回符合契约
- [ ] 错误响应符合契约

## 5. 结论

```text
是否通过：通过 / 有条件通过 / 不通过
必须修复：
是否可以进入下一任务：是 / 否
```
