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
  AppRootView.swift
  Features/
  Shared/
    API/
    Design/
    State/
Tests/
```

## 4. 独立工程边界

iOS 是独立工程。

它和 Web 后台、H5、微信小程序的一致性通过接口契约保持，不通过共享前端代码保持。

iOS 使用 SwiftUI 原生体验重新表达页面，不复制 Web/H5/小程序页面结构。

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
