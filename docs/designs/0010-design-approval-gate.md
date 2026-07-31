# 0010 · 设计须经用户确认后才能执行

- **状态**: Proposed（**待用户确认**——本设计正在演示所要加的这条规则）
- **日期**: 2026-07-31
- **需求来源**: `docs/requirements/0009-design-approval-gate.md` · Issue #24

## 目标 / 非目标
- **目标**：`design → 用户确认 → 实现` 强制（**软行为门**）。
- **非目标**：不加 CI status 门 / GitHub 分支保护（B/C，用户暂不做）。

## 方案（仅改 2 处）
1. **`modules/skills/design-proposal/SKILL.md`**
   - Procedure：明确「产出方案 → **交用户明确确认** → 通过后落 `docs/designs/` 并标 `status: Accepted`」；未确认前不进入实现。
   - 🚫 Red lines 增：「**设计未获用户明确确认，禁止进入实现 / 写代码**；`status` 仅在用户确认后标 `Accepted`——AI 不自行盖章」。
2. **`AGENTS.md` 研发流程**：`design-proposal（非平凡）→ 用户确认设计 → 实现`；🚫 补「设计未经用户确认禁止开始实现」。

## 决策
仅 A（软行为门）；`status` `Proposed→Accepted` 仅用户确认后标。

## 验收
- `design-proposal` 红线/步骤含「用户确认 + 不自盖章」；`AGENTS` 含确认门；skill 自查过。
- **本设计自身**：经用户确认后才实现（dogfood 这条规则）。
