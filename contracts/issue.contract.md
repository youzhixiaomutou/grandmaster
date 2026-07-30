# Contract: issue

- **id**: `issue.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = issue` 的模块

## Purpose

把一条**已确认的需求**固化为一个可追溯条目（issue），使不同后端（本地文档 / GitHub issue / …）可安全替换、`requirement-intake` 零感知。

## Operations

- `persist(record) -> ref`：创建一个需求条目；若同一需求已存在则**更新**。返回可定位 `ref`（URL 或路径）。
- `get(ref) -> record`（可选）：按 `ref` 取回。

> 多 provider（同时启用）行为见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)：`persist` fan-out（best-effort、返回多 `ref`），`get` 按 ref 分派。

## record 结构

至少含：`title`、`restatement`（复述）、`assumptions`（假设 / 默认）、`confirmed`（确认结论）；可选 `links` / `tags`。

## 🚫 Red lines

- 不写入密钥 / 敏感值。

## Conformance

一个 issue 实现视为合规，当且仅当：

1. `persist` 返回一个**可定位** `ref`（URL 或路径）。
2. 固化内容至少含 **复述 + 假设/默认 + 确认结论**。
3. 同一需求再次 `persist` 为**更新**（不产生重复条目）。
4. `get(ref)`（若实现）能取回 `persist` 的内容。
5. 不落盘密钥值。
