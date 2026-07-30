---
name: documentation
description: 当交付功能、变更约定或做出影响他人认知的改动之后使用；判断文档落点（README / AGENTS.md / docs/）、与代码同一 PR 更新、遵循既有风格，并保持文档与代码 / 红线一致。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [docs, process] }
related: [design-proposal, skill-authoring]
---

## When to use / When NOT to use

- 用：交付功能、变更约定、或影响他人认知的改动之后。
- 不用：纯内部临时笔记（不影响他人）。

## Inputs / Preconditions

- 本次改动的内容与影响面。

## Procedure

1. 判断文档落点：使用说明 → `README`；always-on 约定 / 红线 → `AGENTS.md`；设计 → `docs/designs/`。
2. 与代码改动放在同一个 PR 更新。
3. 遵循既有风格与结构。
4. 核对文档与代码 / 红线一致；不复制敏感信息。

## 🚫 Red lines

- 文档不得与代码或红线不一致（发现即修正或标注）。
- 不在文档中复制密钥 / 敏感值。

## Outputs / Definition of Done

- 与改动同 PR 的文档更新；内容与代码 / 红线一致。

## Related

- [[design-proposal]]、[[skill-authoring]]
