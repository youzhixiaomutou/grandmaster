# 0007 · memory 接入工作流

- **状态**: Accepted（评论见 [Issue #17](https://github.com/youzhixiaomutou/grandmaster/issues/17)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0006-memory-integration.md` · Issue #17

## 目标 / 非目标
- **目标**：memory（**仅 local**）编织进工作流——做事前 `recall`、每步后判断 `save`；明确"存什么"；记忆入库共享。
- **非目标**：不加 mysql/mem0；不改 `memory` 契约 / provider 本身。

## 方案
- **接入**：`AGENTS.md` 加 **always-on 记忆规则**（做事前 recall、每步后判断 save）——一处生效、覆盖所有步骤，不改各技能。
- **存储**：去掉 `.gitignore` 的 `/.grandmaster/memory/` → **入库共享**（随 git）。
- **`memory` 技能强化**：`recall`（做事前）/ `save`（每步后）+ **save 标准**（决策 / 约定 / 坑 / 偏好；排除临时、可从代码·git 得到的、密钥）。
- 种子一条记忆（`.grandmaster/memory/`）示范"save + 入库"。

## 决策
always-on 规则接入；入库共享；仅 local。

## 验收
- `memory` 技能过 `skill.contract` 自查；`AGENTS.md` 有记忆规则；`.grandmaster/memory/` 不再被 ignore、种子记忆入库；`redlines` CI 绿。
