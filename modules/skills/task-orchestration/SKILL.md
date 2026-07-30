---
name: task-orchestration
description: 当一个任务需要 ≥3 个步骤、可并行、或需要拆解与跟踪时使用；把工作拆成可跟踪的任务、标注依赖、决定串行 / 并行 / 子代理，逐项推进并在收敛时对照验收。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [process, orchestration] }
related: [design-proposal, version-control]
---

## When to use / When NOT to use

- 用：任务需 ≥3 步、可并行、或需拆解跟踪。
- 不用：单步、显而易见的小改。

## Inputs / Preconditions

- 目标与产出的粗略范围。

## Procedure

1. 把工作拆成可跟踪的任务，每个有明确产出与完成判据。
2. 标注任务间依赖与顺序；决定串行 / 并行 / 是否派子代理。
3. 逐项推进并更新状态（进行中 / 完成）。
4. 收敛：逐项对照产出与验收；补齐遗漏。

## 🚫 Red lines

- 不静默截断范围：若做了 top-N、采样、跳步或延后，必须显式说明。
- 涉及对外 / 不可逆子步骤时，遵循相应技能的确认门。

## Outputs / Definition of Done

- 一份任务分解与其最终状态；全部产出对照验收通过，且**每个涉及代码 / 功能的产出经 [[testing]] 相应测试通过**。

## Related

- [[design-proposal]]、[[version-control]]
