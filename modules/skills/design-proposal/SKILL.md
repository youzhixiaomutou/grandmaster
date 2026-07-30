---
name: design-proposal
description: 当改动非平凡（涉及多文件、架构选择、不可逆操作或存在多种合理方案）时，先写设计方案再实现；明确目标与非目标、现状、方案与取舍、开放决策、红线与验收，评审通过后落 docs/designs/NNNN-*.md。
version: 0.1.0
kind: skill
implements: skill.contract@^1
requires: [design]
metadata: { owner: "@youzhixiaomutou", status: active, tags: [design, process] }
related: [version-control, skill-authoring]
---

## When to use / When NOT to use

- 用：多文件 / 架构选择 / 不可逆 / 多方案的改动。
- 不用：单行修复、显而易见的小改。

## Inputs / Preconditions

- 待解决的问题陈述与约束（**应已由 [[requirement-intake]] 澄清确认**）。

## Procedure

1. 写目标与非目标。
2. 调研现状与约束（读码、查资料）。
3. 给出方案与取舍；必要时多方案对比。
4. 列开放决策、红线、验收标准。
5. 评审（可借 Issue / PR 讨论）。
6. 通过后经 `design` 能力 `persist` 固化（按 `contracts/CONVENTIONS.md` fan-out：`local`=`docs/designs/NNNN`、`github`=评论到原 issue）。

## 🚫 Red lines

- 无评审通过不进入实现。
- 方案必须显式写出红线与验收标准。

## Outputs / Definition of Done

- 一份编号设计文档 + 评审通过记录。

## Related

- [[requirement-intake]]、[[version-control]]、[[skill-authoring]]
