# iOS 模板工程

## 1. 定位

这是一个 iOS SwiftUI 轻量模板工程，用于约束 AI 在固定 iOS 结构中开发移动端功能。

参考成熟实践：

```text
SwiftUI 官方应用结构
MVVM 分层
CocoaPods 依赖管理
```

第一版采用 SwiftUI + MVVM，不默认强绑定完整 TCA，也不默认使用 Swift Package Manager。

## 2. 技术方向

```text
SwiftUI
MVVM
CocoaPods
XCTest
```

复杂状态管理可以参考 TCA 的 Feature / State / Action / Reducer 思路，但需要项目确认后再引入。

图片加载和缓存等第三方依赖优先通过 CocoaPods 引入。

## 3. 目录结构

```text
ios/
  Podfile
  Podfile.lock        pod install 后生成
  *.xcworkspace       pod install 后生成
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
4. 将 `Podfile` 放到 `.xcodeproj` 同级目录。
5. 按项目需要在 `Podfile` 中声明依赖。
6. 执行 `pod install`。
7. 后续使用 `.xcworkspace` 打开工程。
8. 按项目需要接入后端 API。

## 6. CocoaPods 规则

默认依赖管理方式是 CocoaPods：

```text
Podfile
Podfile.lock
*.xcworkspace
```

规则：

- 第三方依赖必须先写入依赖白名单。
- 新增或升级 Pod 必须说明原因和影响范围。
- 业务开发不得擅自切换到 Swift Package Manager。
- 不得同时混用 CocoaPods 和 SPM 管理同一类第三方依赖。
- 如果确需切换依赖管理方式，必须进入开发者模式并确认工程基线变更。

## 7. AI 修改边界

AI 可以新增 Feature、View、ViewModel、Model、Service 和测试。

AI 不得绕过：

```text
Shared/API/APIClient.swift
Shared/API/APIResponse.swift
Shared/Design/DesignTokens.swift
Shared/State/ViewState.swift
Podfile
Podfile.lock
```
