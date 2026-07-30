---
id: 0003-fanout-other-steps
title: 其他步骤加“产出可插拔固化”（各步骤独立能力）
created: 2026-07-30
tags: [architecture, providers, pipeline]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/10]
---

## 复述

把"产出经可插拔能力固化（local + github fan-out）"这套，套用到其他流水线步骤：**design-proposal / task-orchestration / testing / documentation**。每步各自独立能力。

## 假设与默认

- 每步一个能力（`contract`）+ `local` / `github` 两 provider，复用 `contracts/CONVENTIONS.md` 多-provider 语义。
- 固化内容 = 各步骤主产出（设计文档 / 任务计划 / 测试报告 / 文档）。
- 默认 provider 待设计敲定（倾向各步默认 `local`，可按需配 fan-out）。

## 确认结论

- **范围**：全部 4 个产出型步骤。
- **能力结构**：**各步骤独立能力**（design / task / test-report / doc 各一套契约 + provider）。
- 具体命名与本地目录见设计方案（`docs/designs/0004` / Issue #10）。双向可回溯：Issue #10。
