# 0003 · 固化属自动持久化，脱离"对外先确认"红线

- **日期**: 2026-07-31
- **关联**: PR #28 · Issue #27 · `docs/designs/0011-persist-not-outward.md`

## 变更
固化（创建 / 评论 issue/comment/MR、fan-out 写类）**不再**受"对外操作先确认"红线约束——它是**流程内的自动持久化**（低风险、可回滚）。仅 push / 合并 PR / 发通知 等外向不可逆动作才需确认。

- 8 个 fan-out provider（`issue/design/task/doc × github/gitlab`）`impl.md` 红线 → **固化自动执行**；不写密钥。
- `AGENTS.md` 红线#2 → 加"流程固化"例外。
- `contracts/CONVENTIONS.md` → fan-out（含 github/gitlab）**自动执行、不逐次确认**。

## 影响
使用方 `install.sh . --force` 同步 `AGENTS.md` 后，AI 在需求澄清 / 设计后会**自动**把结论固化到本地文档与 issue/评论，不再暂缓等待确认。`version-control` 的 push / 开 PR 确认要求不变。
