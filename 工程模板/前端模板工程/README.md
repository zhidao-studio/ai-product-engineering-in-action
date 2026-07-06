# 前端模板工程

## 1. 定位

这是一个轻量后台前端模板工程，用于约束 AI 在固定前端结构中开发业务页面。

技术栈：

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

## 2. 设计来源

本模板工程参考 `vue-element-plus-admin` 的 mini 思路：只保留后台产品最小通用能力，不引入复杂业务模块。

## 3. 目录结构

```text
src/
  pages/          页面级组件
  components/     可复用组件
  services/       API 调用
  interceptors/   统一请求和错误处理说明
  stores/         Pinia 状态
  router/         路由
  types/          TypeScript 类型
  styles/         design tokens 和全局样式
```

## 4. 命令

```bash
npm install
npm run dev
npm run lint
npm run typecheck
npm run test
npm run build
npm run check
```

## 5. AI 修改边界

AI 可以新增业务页面、业务服务、类型定义和测试。

AI 不得删除：

```text
src/services/http.ts
src/interceptors/README.md
src/styles/design-tokens.css
package.json 中的检查命令
```

AI 不得绕过统一 API 封装直接在页面里写 `fetch`。
