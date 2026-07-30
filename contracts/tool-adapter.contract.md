# Contract: tool-adapter

- **id**: `tool-adapter.contract`
- **version**: 1.0.0
- **适用**: 所有 `kind=adapter` 的模块

## Purpose

声明“把工具中立的技能接入某具体工具”所需的信息，供 `tool-onboarding` 技能据以建立软链接与粘合件。

## Interface（`module.toml`）

**必填字段**
- `kind = "adapter"`、`name`、`version`、`implements = "tool-adapter.contract@^1"`
- `[adapter] skills_dir`：该工具发现技能的目录（如 `.claude/skills`）。
- `[adapter] always_on`：该工具的 always-on 文件（如 `CLAUDE.md` / `AGENTS.md`）。
- `[adapter] discovery`：`symlink`（是否支持软链接发现）。
- `[adapter] enable_mechanism`：如何登记 / 开关技能（如 `directory-presence`、`config.toml:[[skills.config]]`）。
- `metadata.owner`、`metadata.status`

## Conformance

一个适配模块 + 一次 `tool-onboarding` 视为合格，当且仅当：

1. `module.toml` 含上述全部必填字段。
2. onboarding 后，`<skills_dir>` 软链接解析到 `modules/skills`，且其下 `SKILL.md` 可达。
3. `always_on` 文件存在（可为软链接）。
4. 在该工具中，一个冒烟技能能被**发现并调用**（自动或显式）。
5. 新增一个技能到 `modules/skills/` 后，**无需改动该工具目录**即可被发现（整目录软链接）。
