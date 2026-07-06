# iOS 模板工程

## 1. 定位

这是一个 iOS SwiftUI 轻量模板工程，用于约束 AI 在固定 iOS 结构中开发移动端功能。

参考成熟开源工程：

```text
SwiftUI 官方应用结构
The Composable Architecture
Kingfisher
```

第一版采用 SwiftUI + MVVM，不默认强绑定完整 TCA。

## 2. 技术方向

```text
SwiftUI
MVVM
Swift Package Manager
XCTest
```

复杂状态管理可以参考 TCA 的 Feature / State / Action / Reducer 思路，但需要项目确认后再引入。

图片加载和缓存可以参考 Kingfisher，但第一版不默认引入。

## 3. 目录结构

```text
Sources/App/
  AppEntry.swift
  AppRootView.swift
  Features/
  Shared/
    API/
    Design/
    State/
Tests/
```

## 4. 多端基座

使用本模板前，必须先阅读：

```text
工程模板/前端多端基座说明.md
工程模板/多端共享层模板/README.md
```

iOS 不能直接复用 TypeScript 文件，但必须对齐共享层中的接口字段、错误码、设计 token 命名和业务模型语义。

iOS 不得直接复制 Web/H5/小程序页面结构，应使用 SwiftUI 原生体验重新表达。

## 5. 使用方式

1. 使用 Xcode 新建 SwiftUI App。
2. 将 `Sources/App/` 下的文件复制进 App target。
3. 将 `Tests/` 下的文件复制进测试 target。
4. 按项目需要接入后端 API。

## 6. AI 修改边界

AI 可以新增 Feature、View、ViewModel、Model、Service 和测试。

AI 不得绕过：

```text
Shared/API/APIClient.swift
Shared/API/APIResponse.swift
Shared/Design/DesignTokens.swift
Shared/State/ViewState.swift
```
