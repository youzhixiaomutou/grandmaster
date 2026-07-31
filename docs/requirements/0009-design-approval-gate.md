---
id: 0009-design-approval-gate
title: 设计须经用户确认后才能执行（A 软行为门）
created: 2026-07-31
tags: [process, approval, design]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/24]
---

## 复述

设计文档产出后，**AI 必须暂停、等用户明确确认**，才能开始执行（实现 / 写代码）。当前"评审通过"AI 可自判、无强制"用户确认"门。

## 确认结论（仅 A · 软行为门）

- `design-proposal` 加硬红线：**产出方案后必须交用户明确确认；未确认前禁止进入实现**；`status` 产出时 `Proposed`，仅用户确认后才标 `Accepted`（AI 不自行盖章）。
- `AGENTS.md` 研发流程显式化：`design-proposal（非平凡）→ 用户确认设计 → 实现`，红线补「设计未经用户确认禁止开始实现」。
- **不加** CI status 门（B）/ 分支保护人类批准（C）。诚实记录：A 靠 AI 诚实；真正防"AI 自盖章"需 C（分支保护），用户暂不做。双向可回溯：Issue #24。
