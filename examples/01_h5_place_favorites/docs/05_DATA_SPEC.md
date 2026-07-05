# 数据规范

## 1. 为什么需要数据规范

页面不是凭空显示内容，页面展示的每一项都来自数据字段。

如果没有数据规范，AI 很容易自己发明字段，导致页面、交互和 mock 数据不一致。

## 2. 地点数据结构

| 字段 | 类型 | 必填 | 说明 | 页面使用位置 |
|---|---|---|---|---|
| `id` | string | 是 | 地点唯一标识 | 详情跳转、收藏存储 |
| `name` | string | 是 | 地点名称 | 首页卡片、详情页、收藏页 |
| `region` | string | 是 | 地区 | 首页卡片、详情页 |
| `distanceText` | string | 否 | 距离说明 | 首页卡片 |
| `summary` | string | 是 | 简短摘要 | 首页卡片 |
| `description` | string | 是 | 详细说明 | 详情页 |
| `tags` | string[] | 是 | 标签 | 首页卡片、详情页 |
| `tips` | string[] | 否 | 注意事项 | 详情页 |
| `suitableFor` | string[] | 否 | 适合人群或场景 | 详情页 |

## 3. 收藏数据结构

第一版不单独存储完整收藏对象，只存储地点 ID 列表。

```text
favoritePlaceIds = ["changmei-riverside", "riverbend-grassland"]
```

原因：

- 数据简单。
- 收藏状态容易判断。
- 后续接后端时也容易迁移。

## 4. localStorage 规范

| Key | Value | 说明 |
|---|---|---|
| `h5_place_favorites` | string[] JSON | 收藏地点 ID 列表 |

## 5. 数据验收标准

- 每个地点必须有唯一 `id`。
- 首页至少展示 2 条地点数据。
- 收藏页根据收藏 ID 反查地点数据。
- 删除或清空收藏时，只修改收藏 ID 列表。
- 页面不直接写死地点内容，地点内容统一来自 mock 数据。
