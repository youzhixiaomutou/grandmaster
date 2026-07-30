---
name: skill-authoring
description: 当需要在本仓库新增、修改或废弃任何模块（skill / provider / adapter / infra / contract）时使用；生成骨架、填写清单与正文，并按 skill.contract 自查（字段、必备分节、红线、依赖、description 低重叠、密钥特征）后再提 PR。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [governance, authoring] }
related: [design-proposal, version-control, verify-implementation]
---

## When to use / When NOT to use

- 用：新增 / 修改 / 废弃任何模块（技能、provider、adapter、infra、contract）。
- 不用：只读浏览；纯业务代码改动（那是被治理的对象，不是模块本身）。

## Inputs / Preconditions

- 目标模块的 `kind` 与名称；若是实现某能力，先确认对应 `contract` 已存在。

## Procedure

1. 选定 `kind` 与 kebab-case 名称（技能名 == 目录名）。
2. 复制同类模板目录生成骨架（技能 → `SKILL.md`；其余 → `module.toml`）。
3. 填写清单（frontmatter / `module.toml`）与正文分节。
4. **自查**（对照 `contracts/skill.contract.md` 的 `## Conformance`）：frontmatter 可解析、字段齐全、`name`==目录名；六个必备分节 + `## 🚫 Red lines` 齐全；依赖只写“能力”、依赖图无环无悬空；`description` 具体且与既有技能低重叠；全文无硬编码密钥。
5. 若新增实现（provider / adapter），触发 [[verify-implementation]] 核验契约。
6. 按 [[version-control]] 提 PR（含动机与验收）。

## 🚫 Red lines

- 不得引入与既有技能高度重叠的 `description`（防误触发）。
- 不得手改工具目录（`.claude/skills` 等）软链接目标或绕过自查 / 评审。
- 正文与清单中绝不写入密钥值。

## Outputs / Definition of Done

- 一个通过自查的模块目录 + 一个待评审 PR。

## Related

- [[design-proposal]]、[[version-control]]、[[verify-implementation]]
