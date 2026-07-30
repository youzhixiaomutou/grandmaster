---
name: memory
description: 需要跨会话持久化或召回稳定事实（决策、约定、上下文）时使用；规定何时 save / recall / forget，并经当前激活的 memory 实现执行。
version: 0.1.0
kind: skill
implements: skill.contract@^1
requires: [memory]
metadata: { owner: "@youzhixiaomutou", status: active, tags: [memory] }
related: [documentation, skill-authoring]
---

## When to use / When NOT to use

- 用：跨会话需要记住 / 召回的稳定事实。
- 不用：仅本会话的临时信息；机密（机密不进记忆）。

## Inputs / Preconditions

- `grandmaster.toml [capabilities].memory` 指向一个激活的 memory 实现。

## Procedure

1. 读 `grandmaster.toml [capabilities].memory` 得知激活实现（本 P0 为 `local`）。
2. 按 `modules/providers/memory/<impl>/impl.md` 执行 `save` / `recall` / `forget`。
3. 写入前检查内容不含密钥 / 敏感值。

## 🚫 Red lines

- 不记录密钥 / 敏感值。
- 切换 provider 不改变本技能对外行为（由 `memory.contract` 的 Conformance 保证）。

## Outputs / Definition of Done

- 事实已持久化且可被 `recall`；操作可回溯。

## Related

- [[documentation]]、[[skill-authoring]]
