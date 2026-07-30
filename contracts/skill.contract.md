# Contract: skill

- **id**: `skill.contract`
- **version**: 1.0.0
- **适用**: 所有 `kind=skill` 的模块

## Purpose

定义“一份合格技能”的结构与红线，使所有技能同构、可被 `skill-authoring` 自查、可被工具按 `description` 自动触发。

## Interface（`SKILL.md` frontmatter 规范）

**必填**
- `name`：kebab-case，**须等于目录名**。
- `description`：触发文本（何时用）。**自动触发的唯一依据**，须具体、含场景关键词、与其他技能低重叠。
- `version`：语义化版本。
- `kind: skill`
- `implements: skill.contract@^1`
- `metadata.owner`、`metadata.status`（`draft` | `active` | `deprecated`）

**可选**：`requires`（依赖的能力，非实现）、`allowed-tools`、`guardrails.write_file.{allowed_paths,policy}`、`requires_env`（只声明变量名）、`user-invocable`、`disable-model-invocation`、`metadata.tags`、`related`。

## 必备正文分节（按序）

1. `## When to use / When NOT to use`
2. `## Inputs / Preconditions`
3. `## Procedure`（编号、确定性步骤）
4. `## 🚫 Red lines`
5. `## Outputs / Definition of Done`
6. `## Related`（`[[name]]` 互链，允许指向尚未创建的技能）

## 🚫 Red lines

- `description` 不得与既有技能高度重叠（防误触发）。
- 涉外技能（发起 push / 合并 / 通知 / 外部调用）的 `Procedure` 必须含一个显式**确认门**步骤。
- 正文与 frontmatter 中绝不写入任何密钥值。

## Conformance

一份技能视为合规，当且仅当（由 `skill-authoring` 自查逐条核）：

1. 存在 `SKILL.md`，YAML frontmatter 可解析。
2. `name` 存在且**等于所在目录名**。
3. `description` 非空。
4. `kind` 为 `skill`；`implements` 指向本契约且版本兼容。
5. `version`、`metadata.owner`、`metadata.status` 均存在。
6. 六个必备分节标题全部存在且按序。
7. 含 `## 🚫 Red lines` 分节。
8. 若技能会发起对外 / 不可逆操作，`Procedure` 含“确认门”步骤。
9. 全文无硬编码密钥特征（私钥块、`AKIA…`、`token/secret/password = "<非占位值>"` 等）。
10. `description` 与其他技能的重叠低于阈值（AI / 人工判定）。
