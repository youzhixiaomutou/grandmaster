---
id: 0010-persist-not-outward
title: 固化(issue/comment/MR)属自动持久化，不受"对外先确认"红线
created: 2026-07-31
tags: [process, red-line, fix]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/27]
---

## 复述

把 requirement/design/task/doc **固化**到 issue/comment/MR（fan-out 写类）当前被 provider `impl.md` 与全局红线"对外操作先确认"当成需确认的对外动作而暂缓/不自动执行。**固化是流程内的自动持久化**（低风险、可回滚、正是 fan-out 本意），应**自动执行**；仅 push / 合并 PR / 发通知 等真正外向不可逆动作才需确认。

## 确认结论（范围）

1. 去掉 8 个 fan-out provider（issue/design/task/doc × github/gitlab）`impl.md` 里"创建/评论=对外操作、先确认"红线，改为"固化自动执行；不写密钥"。
2. `AGENTS.md` 红线#2「对外操作先确认」加豁免：流程固化（写 issue/comment/MR）属自动持久化，不需确认。
3. `contracts/CONVENTIONS.md`：注明 fan-out（含 github/gitlab）自动执行、不逐次确认。
- 非目标：push / 合并 PR / 发通知 的确认要求不动。双向可回溯：Issue #27。
