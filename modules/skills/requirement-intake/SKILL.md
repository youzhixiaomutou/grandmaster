---
name: requirement-intake
description: 当收到一个新的需求、功能请求或不明确的任务时（作为研发第一步）使用：用自己的话复述需求、界定范围、列出歧义与隐含假设，提出有针对性的澄清问题，确认后将结论固化，再进入设计或实现。
version: 0.1.0
kind: skill
implements: skill.contract@^1
requires: [issue]
metadata: { owner: "@youzhixiaomutou", status: active, tags: [process, requirements] }
related: [design-proposal, task-orchestration]
---

## When to use / When NOT to use

- 用：任何新需求 / 功能请求 / 含糊任务的最开始。
- 不用：需求已澄清并确认后（进入 [[design-proposal]] / [[task-orchestration]]）；纯执行既定明确指令。

## Inputs / Preconditions

- 干系人给出的原始需求陈述。
- `grandmaster.toml [capabilities].issue` 指向一个激活的 issue 实现。

## Procedure

1. **复述**：用自己的话重述需求与目标，界定范围（含明确的非目标）。
2. **找歧义**：列出不明确点、边界条件、隐含假设与约束（性能 / 兼容 / 期限 / 规模 / 依赖）。
3. **提问**：就"影响做法"的关键歧义提出有针对性问题；能用合理默认解决的直接声明默认值。
4. **确认**：拿到答复后给出"已确认的需求要点"。
5. **固化**：读 `grandmaster.toml [capabilities].issue` 得知激活实现，按 `modules/providers/issue/<impl>/impl.md` 执行 `persist`，回报 `ref`。
6. **路由**：**默认进入 [[design-proposal]]（方案设计）**；仅当确属琐碎小改（单行 / 显然、无需方案）时，才显式跳过、直接 [[task-orchestration]]。

## 🚫 Red lines

- **需求不清不动手**：关键歧义未澄清前，不进入设计 / 实现。
- **不臆测代替确认**：可声明默认，但影响结果的假设必须显式暴露、让人可否决。
- **澄清结论须固化**（经 issue 能力），不得只存在于对话；固化内容不含密钥。

## Outputs / Definition of Done

- 一份"复述 + 假设/默认 + 确认结论"，已由激活的 issue 实现固化并返回 `ref`；下一步路由明确。

## Related

- [[design-proposal]]、[[task-orchestration]]
