# 0004 · 其他步骤加“产出可插拔固化”（各步骤独立能力）

- **状态**: Accepted（评论见 [Issue #10](https://github.com/youzhixiaomutou/grandmaster/issues/10)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0003-fanout-other-steps.md` · Issue #10

## 目标 / 非目标

- **目标**：`design-proposal` / `task-orchestration`（执行 · 含测试）/ `documentation` 三个产出型步骤各有**独立能力**，产出经 `local` + `github` fan-out 固化。
- **非目标**：不改 fan-out 机制（`CONVENTIONS.md`）；`testing` 不单列（属执行环节内）；不改 `issue` / `memory`。

## 3 能力

| 步骤 | 能力 | `local` | `github` |
|------|------|---------|----------|
| design-proposal | `design` | `docs/designs/NNNN` | **评论到原 issue** |
| task-orchestration | `task` | `docs/plans/NNNN`（含测试报告） | **评论到 PR** |
| documentation | `doc` | `docs/notes/NNNN` | **评论到 PR** |

每能力 = `<cap>.contract` + `<cap>/local` + `<cap>/github`；默认 `["local","github"]`（fan-out）。

## github 线程模型

- **规划产物（需求 + 设计）挂「原 issue」**：`requirement-intake` → 建 issue；`design` → 评论该 issue。
- **改动产物（测试报告 + 文档）挂 PR**：`task` / `doc` → 评论当前分支 PR。
- `design/github` 从需求记录的 `links` 取「原 issue」；`task/doc` 的 github 用当前分支 PR（未建则 local 先行、PR 建好后补附）。

## 衔接

- `design-proposal` 落 `docs/designs` → 改为经 `design` 能力 `persist`。
- `task-orchestration` 收敛 → 经 `task` 能力固化（计划 + 测试结果）。
- `documentation` → 经 `doc` 能力固化条目。

## 配置（grandmaster.toml）

`[capabilities] design / task / doc = ["local","github"]`；`[providers.<cap>.local].dir`。

## 决策

命名 `design`/`task`/`doc`；默认 fan-out；`doc` 只记条目不动正文；github 线程（design→原 issue、task/doc→PR）。

## 验收

- 6 provider 各过 `verify-implementation`（local 实测、github 规格核验）；3 技能衔接；`grandmaster.toml` 配置；`redlines` CI 绿。
