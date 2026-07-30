# Contract: design

- **id**: `design.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = design`

## Purpose

把 `design-proposal` 的设计方案固化为可追溯产物。

## Operations

- `persist(record) -> ref`：固化一份设计；同一设计再次 `persist` 为**更新**。返回 `ref`。
- `get(ref) -> record`（可选）。

> 多 provider 行为见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)。**github 实现：评论到该设计对应需求的「原 issue」（不新建 issue）**。

## record 结构

`title`、`goals`（目标 / 非目标）、`approach`（方案）、`decisions`、`acceptance`；关联需求 / issue 链接。

## 🚫 Red lines

- 不写入密钥 / 敏感值。

## Conformance

1. `persist` 返回可定位 `ref`。
2. 内容含 目标 / 方案 / 验收。
3. 同一设计再 `persist` 为更新（不重复）。
4. github 实现**评论到原 issue**（非新建）。
5. 不落盘密钥。
