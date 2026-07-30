---
id: 0003-fanout-other-steps
title: 其他步骤加“产出可插拔固化”（各步骤独立能力）
created: 2026-07-30
tags: [architecture, providers, pipeline]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/10]
---

## 复述

把"产出经可插拔能力固化（local + github fan-out）"这套，套用到其他流水线步骤：**design-proposal / task-orchestration（执行 · 含测试）/ documentation**（`testing` 属执行环节内，不单列）。每步各自独立能力。

## 假设与默认

- 每步一个能力（`contract`）+ `local` / `github` 两 provider，复用 `contracts/CONVENTIONS.md` 多-provider 语义。
- 固化内容 = 各步骤主产出（设计文档 / 任务计划 / 测试报告 / 文档）。
- 默认 provider 待设计敲定（倾向各步默认 `local`，可按需配 fan-out）。

## 确认结论

- **范围**：3 个产出型步骤（design-proposal / task-orchestration（执行 · 含测试）/ documentation）；`testing` 属执行环节内，不单列。
- **能力结构**：**各步骤独立能力** `design` / `task` / `doc`，默认 `["local","github"]`（fan-out）。
- **github 线程**：需求 + 设计挂「原 issue」（`design` 评论到需求 issue）；测试报告 + 文档挂 **PR**（评论）。
- 详见 `docs/designs/0004`。双向可回溯：Issue #10。
