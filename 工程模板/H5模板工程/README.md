# H5 模板工程

## 1. 定位

这是一个面向移动端 H5 的轻量模板工程，用于微信内 H5、移动端表单、移动端生产力工具入口。

参考成熟开源工程：

```text
Vant
```

## 2. 技术栈

```text
Vue 3
Vite
TypeScript
Vue Router
Pinia
Vant
ESLint
Prettier
Vitest
```

## 3. 目录结构

```text
src/
  pages/        页面
  components/   通用组件
  services/     API 调用
  stores/       状态管理
  router/       路由
  types/        类型定义
  styles/       移动端设计变量和全局样式
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

AI 可以新增业务页面、组件、服务、类型和测试。

AI 不得绕过：

```text
src/services/http.ts
src/styles/design-tokens.css
src/router/index.ts
package.json 中的检查命令
```
