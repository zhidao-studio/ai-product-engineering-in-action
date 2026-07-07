# Web 后台模板工程

这是一个 Web 后台轻量模板工程，用于管理后台、运营后台、内部生产力工具。

参考成熟开源工程：vue-element-plus-admin mini 思路，以及 Vue Vben Admin 的应用分层和构建命令思路。

## 技术栈

Vue 3、Vite、TypeScript、Vue Router、Pinia、Element Plus、ESLint、Prettier、Vitest、Playwright。

## 目录结构

src/layouts 放后台布局。
src/pages 放页面。
src/components 放组件。
src/services 放 API 调用。
src/stores 放状态。
src/router 放路由。
src/types 放类型。
src/styles 放设计变量和全局样式。

## 独立工程边界

Web 后台是独立工程。

它和 H5、微信小程序、iOS 的一致性通过接口契约保持，不通过共享前端代码保持。

## 命令

npm install
npm run dev
npm run lint
npm run format:check
npm run typecheck
npm run test
npm run build
npm run check

## 修改边界

可以新增业务页面、服务、类型、组件和测试。

必须保留统一请求封装、设计变量、路由、后台布局和检查命令。
