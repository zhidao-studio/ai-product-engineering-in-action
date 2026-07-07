# 微信小程序模板工程

## 1. 定位

这是一个原生微信小程序轻量模板工程，用于微信生态内的移动端生产力工具入口。

参考成熟开源工程：

```text
Vant Weapp
Taro
```

第一版优先使用原生微信小程序 + TypeScript + Vant Weapp，不直接引入完整跨端复杂度。

## 2. 技术栈

```text
微信小程序
TypeScript
Vant Weapp
miniprogram-api-typings
miniprogram-ci
Jest（可选）
```

## 3. 目录结构

```text
miniprogram/
  app.ts
  app.json
  app.wxss
  pages/
  components/
  services/
  types/
  utils/
```

## 4. 独立工程边界

微信小程序是独立工程。

它和 Web 后台、H5、iOS 的一致性通过接口契约保持，不通过共享前端代码保持。

小程序有自己的页面、组件、服务、类型、样式和检查命令。

## 5. AI 修改边界

AI 可以新增页面、组件、服务、类型和测试。

AI 不得绕过：

```text
miniprogram/services/request.ts
miniprogram/types/api.ts
miniprogram/app.json
```

## 6. 使用说明

1. 安装依赖。
2. 使用微信开发者工具打开本目录。
3. 构建 npm。
4. 运行小程序。
