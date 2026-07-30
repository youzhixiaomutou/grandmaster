# Contract: doc

- **id**: `doc.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = doc`

## Purpose

把 `documentation` 的完成文档 / 文档条目固化（**不改正文文档本身**，额外记一条可追溯条目）。

## Operations

- `persist(record) -> ref`；`get(ref) -> record`（可选）。

> 多 provider 见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)。**github 实现：评论到当前分支的 PR（附完成文档摘要 / 链接）；PR 未建时 local 先行、PR 建好后补附**。

## record 结构

`title`、`summary`、`doc_links`（指向正文文档）。

## 🚫 Red lines

- 不写入密钥 / 敏感值。

## Conformance

1. `persist` 返回可定位 `ref`。
2. 内容含 文档摘要 / 链接。
3. 同条目再 `persist` 为更新。
4. github 实现**评论到 PR**。
5. 不落盘密钥。
