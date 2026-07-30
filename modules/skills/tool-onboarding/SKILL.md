---
name: tool-onboarding
description: 当接入一个新的 AI 工具（Claude Code / Codex / 其他）或初始化、修复本仓库与工具之间的链接时使用；建立 .claude/skills、.codex/skills 软链接与 CLAUDE.md→AGENTS.md，生成 .codex/config.toml；不支持软链接时以 --copy 物化。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [governance, tooling] }
related: [skill-authoring]
---

## When to use / When NOT to use

- 用：接入新工具、初次初始化仓库、或软链接损坏需修复。
- 不用：日常新增技能（整目录软链接下自动可见，无需再跑）。

## Inputs / Preconditions

- `grandmaster.toml` 的 `[tools].enabled` 与 `[link]`；各工具的 `modules/adapters/<tool>/module.toml`。

## Procedure

1. 读 `[tools].enabled` 与 `[link]`（`granularity` / `mode`）。
2. 对每个启用工具，读其 adapter `module.toml` 的 `skills_dir`、`always_on`、`discovery`。
3. 建技能链接：`mode=symlink` 时 `ln -s`（`granularity=dir` → `<skills_dir> -> ../modules/skills`）；`mode=copy` 时物化副本。
4. 建 always-on：若该工具 `always_on` 为 `CLAUDE.md`，则 `CLAUDE.md -> AGENTS.md`。
5. 生成 / 刷新工具粘合件：如 `.codex/config.toml`（技能经 `.codex/skills` 自动发现；`[[skills.config]]` 仅用于禁用个别技能）。
6. 【确认门】若操作会写入工具目录或删除既有链接，先确认。
7. 验证：`<skills_dir>` 解析正确、其下 `SKILL.md` 可达、冒烟技能可被发现。

## 🚫 Red lines

- 软链接目标只指向 `modules/skills`（或契约允许的路径），不得指向仓库外。
- 幂等：重复执行不产生副作用；不得手改而绕过本流程。
- 写入 / 覆盖工具目录前先确认（对外 / 不可逆动作确认门）。

## Outputs / Definition of Done

- 各启用工具目录下技能可发现；`tool-adapter.contract` 的 Conformance 通过。

## Related

- [[skill-authoring]]
