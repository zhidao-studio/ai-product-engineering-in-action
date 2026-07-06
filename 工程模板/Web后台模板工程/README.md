# Web 后台模板工程

## 1. 定位

这是一个 Web 后台轻量模板工程，用于管理后台、运营后台、内部生产力工具。

参考成熟开源工程：

```text
vue-element-plus-admin mini 思路
Vue Vben Admin 的 monorepo / apps-packages 分离思路
```

第一版只保留后台产品最小通用能力，不引入复杂业务模块。

## 2. 技术栈

```text
Vue 3
Vite
TypeScript
Vue Router
Pinia
Element Plus
ESLint
Prettier
Vitest
Playwright
```

## 3. 目录结构

```text
src/
  layouts/       后台布局
  pages/         页面级组件
  components/    可复用组件
  services/      API 调用
  interceptors/  错误处理说明
  stores/        Pinia 状态
  router/        路由
  types/         TypeScript 类型
  styles/        设计变量和全局样式
```

## 4. 多端基座

使用本模板前，必须先阅读：

```text
工程模板/前端多端基座说明.md
工程模板/多端共享层模板/README.md
```

Web 后台可以复用共享层中的 API 类型、业务模型和设计 token。

Web 后台不得直接引用 H5、小程序或 iOS 的页面、组件和端专属能力。

## 5. 命令

```bash
npm install
npm run dev
npm run lint
npm run format:check
npm run typecheck
npm run test
npm run build
npm run check
```

## 6. AI 修改边界

AI 可以新增业务页面、服务、类型、组件和测试。

AI 不得绕过：

```text
src/services/http.ts
src/styles/design-tokens.css
src/router/index.ts
src/layouts/BasicLayout.vue
package.json 中的检查命令
```
