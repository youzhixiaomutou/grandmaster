# 0011 · 固化属自动持久化，不受"对外先确认"红线

- **状态**: Accepted（用户已确认；Issue #27）
- **日期**: 2026-07-31
- **需求来源**: `docs/requirements/0010-persist-not-outward.md` · Issue #27

## 目标 / 非目标
- **目标**：固化（把 requirement/design/task/doc 写到 issue/comment/MR）**自动执行**，脱离"对外先确认"红线。
- **非目标**：push / 合并 PR / 发通知 的确认要求不动。

## 方案（改 3 处）
1. **8 个 fan-out provider** `impl.md` 红线：「创建/评论=对外操作、先确认」→「**固化自动执行**；`body`/`description` 不写密钥」。
2. **`AGENTS.md` 红线#2**：加例外——流程固化属自动持久化、自动执行、不需确认。
3. **`contracts/CONVENTIONS.md`**：fan-out（含 github/gitlab）自动执行、不逐次确认；仅 push/合并/发通知 受对外确认约束。

## 验收
- 8 provider 红线不再要求固化确认；`AGENTS`/`CONVENTIONS` 与之一致；审计 0 问题；`redlines` CI 绿。
- 修正后行为已在本需求固化时演示（自动写 Issue #27，未暂缓）。
