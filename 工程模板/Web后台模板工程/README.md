# Web 后台模板工程

## 1. 定位

这是一个 Web 后台轻量模板工程，用于管理后台、运营后台、内部生产力工具。

参考成熟开源工程：

```text
vue-element-plus-admin mini 思路
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

## 4. 命令

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

## 5. AI 修改边界

AI 可以新增业务页面、服务、类型、组件和测试。

AI 不得绕过：

```text
src/services/http.ts
src/styles/design-tokens.css
src/router/index.ts
src/layouts/BasicLayout.vue
package.json 中的检查命令
```
