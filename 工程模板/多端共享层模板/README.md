# 多端共享层模板

## 1. 定位

本目录用于定义 Web 后台、H5、微信小程序、iOS 可共享的前端基础能力。

共享层不是页面工程，不包含端专属组件。

## 2. 共享内容

```text
api/        API 路径、统一响应、错误码
models/     业务 DTO / VO 类型说明
tokens/     设计 token
utils/      纯函数工具
```

## 3. 使用原则

- Web 后台、H5、小程序可以复制本目录内容到各自项目的 shared packages。
- iOS 不能直接复用 TypeScript 文件，但可以复用接口契约、字段命名和设计 token 说明。
- 共享层变化必须检查所有端。

## 4. 禁止内容

共享层不得包含：

```text
Vue 组件
Element Plus 组件
Vant 组件
微信小程序页面
iOS View
端专属路由
端专属状态管理
```
