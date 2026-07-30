---
name: verify-implementation
description: 当新增、替换或升级某能力（memory / notification / secret-source 等）的后端实现，或改动 provider / adapter 后需要确认其满足契约时使用；对照对应 contract 的 ## Conformance 断言逐条核验，全部通过才可在 grandmaster.toml 启用。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [governance, verification] }
related: [skill-authoring]
---

## When to use / When NOT to use

- 用：新增 / 替换 / 升级某能力的 provider 或工具 adapter，或启用前核验。
- 不用：纯技能（流程）文本改动（那走 [[skill-authoring]] 自查）。

## Inputs / Preconditions

- 目标模块 `implements` 指向的 `contract` 及其 `## Conformance` 断言清单。

## Procedure

1. 读目标模块 `module.toml` 的 `implements`，定位对应 `contracts/<id>.contract.md`。
2. 打开该契约的 `## Conformance` 断言清单。
3. 逐条核验实现是否满足（必要时按其 `impl.md` 实际执行 / 推演）。
4. 记录每条通过 / 失败与证据。
5. 仅当**全部通过**，才在 `grandmaster.toml`（或对应 profile）将该实现设为激活。
6. 有失败 → 退回 [[skill-authoring]] 修正，不得启用。

## 🚫 Red lines

- 未全过的实现不得启用。
- 核验涉及的凭据只经 `secret-source`，绝不打印其值。

## Outputs / Definition of Done

- 一份逐条核验结论；仅在全过时发生启用变更。

## Related

- [[skill-authoring]]
