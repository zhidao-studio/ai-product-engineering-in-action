# 文档驱动的 AI 产品交付方法论

Document-Driven AI Product Delivery Harness

## 1. 仓库定位

本仓库用于沉淀一套文档驱动的 AI 产品交付方法论。

它的核心目标是：

```text
用约束框架、原型预览、工程基线、工程模板、代码任务包和检查清单，
约束 AI 从产品想法走向可验收的代码交付。
```

## 2. 核心链路

```text
产品定义
↓
界面规格
↓
高保真交互预览
↓
使用者视觉确认
↓
工程规格
↓
工程基线
↓
复制工程模板
↓
代码任务包
↓
AI 在模板工程内编码
↓
自动化验证
↓
使用验收
↓
交付迭代
```

## 3. 仓库结构

```text
文档/        方法论、工程基线、操作手册、教学化内容
样板/        可复用空白样板
工程模板/    可直接复制使用的 Web、H5、微信小程序、iOS、后端多类独立工程模板
检查清单/    可执行检查清单
指令/        AI / Agent / Review 指令
案例/        填好的案例
```

## 4. 从哪里开始

请从这里开始：

```text
文档/说明.md
```

## 5. 当前工程基线

```text
Web 后台：Vue 3 + Vite + TypeScript + Vue Router + Pinia + Element Plus
H5：Vue 3 + Vite + TypeScript + Vant
小程序：原生微信小程序 + TypeScript + Vant Weapp
iOS：SwiftUI + MVVM
后端：Java + Spring Boot + MyBatis-Plus + Flyway 单体应用，不使用 Spring Cloud
数据库：MySQL 优先；主键 32 位字符串；每表 7 要素；时间 trigger 维护
码值：数据库码值是源头，后端常量一致，接口契约记录，前端只翻译不改码
部署：本地开发优先，微信云托管按需适配
多端原则：多个工程，独立建设；接口一致，代码不共享
```

## 6. 最重要的一句话

```text
不是让 AI 从 0 搭工程，
而是先用文档定义边界，用高保真交互预览确认样子，
再用工程模板固定结构，最后让 AI 在模板内完成可验证的业务交付。
```
