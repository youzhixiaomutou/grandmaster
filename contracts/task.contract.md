# Contract: task

- **id**: `task.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = task`

## Purpose

把 `task-orchestration`（执行 · 含测试）的任务计划与执行 / 测试结果固化。

## Operations

- `persist(record) -> ref`：固化任务计划与执行结果；同一任务集再 `persist` 为**更新**。返回 `ref`。
- `get(ref) -> record`（可选）。

> 多 provider 见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)。**github 实现：评论到当前分支的 PR（附执行 / 测试报告）；PR 未建时 local 先行、PR 建好后补附**。

## record 结构

`title`、`tasks`（分解与状态）、`test_report`（测试结果）、`links`。

## 🚫 Red lines

- 不写入密钥 / 敏感值。

## Conformance

1. `persist` 返回可定位 `ref`。
2. 内容含 任务分解 + 测试结果。
3. 同任务集再 `persist` 为更新。
4. github 实现**评论到 PR**（PR 未建则延后补附）。
5. 不落盘密钥。
