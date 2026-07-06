# iOS 模板工程检查清单

## 1. 工程结构

- [ ] 使用 SwiftUI
- [ ] 使用 MVVM 起步
- [ ] 存在 Swift Package 配置
- [ ] Feature 放在 `Sources/App/Features/`
- [ ] 共享 API 放在 `Sources/App/Shared/API/`
- [ ] 设计变量放在 `Sources/App/Shared/Design/`
- [ ] 页面状态放在 `Sources/App/Shared/State/`
- [ ] 测试放在 `Tests/`

## 2. iOS 体验

- [ ] 页面使用 NavigationStack
- [ ] 表单有禁用或校验状态
- [ ] 操作成功有反馈
- [ ] ViewModel 管理页面状态
- [ ] 不在 View 中直接散落网络请求

## 3. 测试检查

- [ ] 存在基础 XCTest
- [ ] 核心 ViewModel 有测试计划
- [ ] APIClient 可替换或可注入

## 4. 修改边界

- [ ] 保留 APIClient
- [ ] 保留 APIResponse
- [ ] 保留 DesignTokens
- [ ] 保留 ViewState
