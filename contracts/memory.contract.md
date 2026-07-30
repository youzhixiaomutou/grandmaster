# Contract: memory

- **id**: `memory.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = memory` 的模块

## Purpose

定义“记忆”能力的稳定接口，使不同后端（本地 markdown / MySQL / mem0…）可安全替换、调用方零感知。

## Operations

- `save(content, tags?) -> id`：持久化一条事实，返回稳定 `id`；同一 `id` 再次 `save` 为**更新 / 覆盖**。
- `recall(query) -> [facts]`：按关键词 / 标签检索，返回零或多条；无命中返回空列表。
- `forget(id) -> void`：删除指定 `id`；`id` 不存在时为幂等无操作。

> 多 provider（同时启用）行为见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)：写类（`save` / `forget`）fan-out（best-effort），`recall` 取首个。

## I/O 与语义

- 一条 fact 至少含：`id`、`content`；可选 `tags`、`created`。
- 检索为尽力而为（子串 / 标签匹配即可），不要求排序保证。

## 🚫 Red lines

- 不存储、不返回密钥 / 敏感值；某后端若需凭据，只经 `secret-source` 获取。

## Conformance

一个 memory 实现视为合规，当且仅当：

1. `save` 后以相同关键词 `recall` 能取回该条。
2. `forget(id)` 后 `recall` 不再返回该条。
3. 对不存在的 query，`recall` 返回**空**而非报错。
4. 对不存在的 `id`，`forget` 幂等、无副作用、不报错。
5. 同一 `id` 再次 `save` 表现为更新（不产生重复条目）。
6. 实现不落盘任何密钥值。
