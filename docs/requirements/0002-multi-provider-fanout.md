---
id: 0002-multi-provider-fanout
title: 能力支持多 provider 同时启用（fan-out）
created: 2026-07-30
tags: [architecture, providers]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/8]
---

## 复述

让"能力"支持**同时启用多个 provider**；写类操作 **fan-out** 到所有启用实现。例：`issue = ["local","github"]` → 固化同时写本地文档 + 建 GitHub issue，返回多个 `ref`。

## 假设与默认

- 配置：`issue = ["local","github"]`（数组）；字符串仍表示单个，**向后兼容**。
- fan-out 在能力解析 / 调用层；**provider 契约不变**（`persist → 单 ref`，被调多次）；`persist` 返回多 `ref`。
- 🚫 对外操作先确认仍适用（fan-out 到 github 前确认）。

## 确认结论

- **适用范围**：通用机制——所有能力可配多个；写 / 发出类 fan-out，读类（memory / secret-source）多配时取首个 / 主。
- **失败处理**：尽力而为——成功记 `ref`、失败**显式报告**、不整体阻断（契合"不静默截断"红线）。
- **读回**：`get` 按 ref 分派；`recall` 取首个（数组首元素 = primary）。
- 需求来源："需求澄清固化同时启用本地和 github"。双向可回溯：Issue #8。
