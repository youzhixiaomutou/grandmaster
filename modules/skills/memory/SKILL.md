---
name: memory
description: 做事前召回相关记忆作参考、或某步骤产生了跨会话有用的稳定结论需要保存时使用；按标准判断存什么，并经激活的 memory 实现 recall / save / forget。
version: 0.2.0
kind: skill
implements: skill.contract@^1
requires: [memory]
metadata: { owner: "@youzhixiaomutou", status: active, tags: [memory] }
related: [documentation, skill-authoring]
---

## When to use / When NOT to use

- 用：**做事前**（recall 相关记忆参考）；**每个步骤完成后**（判断是否 save）；跨会话稳定事实的召回 / 持久化。
- 不用：仅本会话的临时信息；机密（机密不进记忆）。

## Inputs / Preconditions

- `grandmaster.toml [capabilities].memory` 指向一个激活的 memory 实现（当前 `local`）。

## Procedure

1. **Recall（做事前）**：按当前任务主题在激活实现里 `recall` 相关记忆，作为参考。
2. **判断是否 save（每步后）**：本步是否产生"跨会话有用的稳定事实"？
   - **存**：决策与理由、约定、踩过的坑、用户偏好。
   - **不存**：临时上下文、可从代码 / git 直接得到的、密钥 / 敏感值。
3. 读 `grandmaster.toml [capabilities].memory` 得激活实现，按 `modules/providers/memory/<impl>/impl.md` 执行 `recall` / `save` / `forget`。
4. `save` 前确认不含密钥；与既有记忆重复时**更新**而非新增。

## 🚫 Red lines

- 不记录密钥 / 敏感值。
- 不存可从代码 / git 直接得到的内容（防冗余、防陈旧）。
- 切换 provider 不改变本技能对外行为（由 `memory.contract` 的 Conformance 保证）。

## Outputs / Definition of Done

- 相关记忆已被 recall 参考；本步的稳定结论（若有）已 save 并可回溯。

## Related

- [[documentation]]、[[skill-authoring]]
