# 前端工程规范模板

## 1. 技术选择

前端采用 Vue 体系。

推荐基线：

```text
Vue 3
Vite
TypeScript
Vue Router
Pinia
ESLint
Prettier
Vitest
Playwright 或 Cypress（二选一，按项目复杂度决定）
```

初始化方式：

```text
npm create vue@latest
```

## 2. 目录结构

```text
frontend/
  src/
    pages/
    components/
    services/
    stores/
    router/
    types/
    utils/
    styles/
    App.vue
    main.ts
  public/
  package.json
  vite.config.ts
```

## 3. 目录职责

| 目录 | 职责 |
|---|---|
| `pages/` | 页面级组件 |
| `components/` | 可复用 UI 组件 |
| `services/` | API 调用和数据访问封装 |
| `stores/` | Pinia 状态管理 |
| `router/` | 路由配置 |
| `types/` | TypeScript 类型定义 |
| `utils/` | 通用工具函数 |
| `styles/` | 全局样式和设计 token |

## 4. 前端编码规则

AI 必须遵守：

- 页面组件只能放在 `pages/`。
- 可复用组件只能放在 `components/`。
- 接口调用只能放在 `services/`。
- 类型定义必须放在 `types/`。
- 页面里不能直接写 `fetch`。
- 页面里不能硬编码后端地址。
- 复杂状态必须进入 Pinia store。
- 样式必须遵守设计规格 Harness。

## 5. 页面状态

每个核心页面至少考虑：

```text
loading
empty
success
error
```

## 6. AI 禁止行为

AI 不得：

- 自行改成 React、Angular 或其他框架
- 自行引入 UI 组件库
- 自行新增状态管理库
- 自行新增 API 字段
- 自行改变路由结构
- 自行把所有逻辑写进一个页面文件

## 7. 验收标准

- [ ] 前端目录结构符合规范
- [ ] 页面、组件、服务、类型分层清楚
- [ ] API 调用不直接散落在页面中
- [ ] 页面状态完整
- [ ] 样式符合设计规格
- [ ] `npm run dev` 可启动
- [ ] `npm run build` 可通过
