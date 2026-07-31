# 0009 · 流程强制执行

- **状态**: Accepted（评论见 [Issue #22](https://github.com/youzhixiaomutou/grandmaster/issues/22)）
- **日期**: 2026-07-31
- **需求来源**: `docs/requirements/0008-process-enforcement.md` · Issue #22

## 目标 / 非目标
- **目标**：让研发流程**真正强制**——写实现代码前必须 intake + design；从软性 prose 升级为「强制顺序 + 机器门」。
- **非目标**：不改 pipeline 步骤本身；Claude Code hook（C）暂缓。

## A · AGENTS 强制流程
`AGENTS.md` 顶部加「研发流程（每个任务的强制顺序）」：`requirement-intake`（澄清+固化）→ `design-proposal`（非平凡）→ 实现（含 `testing`）→ `version-control` → `documentation`；🚫 **未完成 intake +（非平凡）design 前禁止写实现代码**。并把原「怎么改」限定为「怎么改 Grandmaster 模块」，与研发流程区分（原混淆是主因之一）。

## B · redlines process-gate（仅 pull_request）
- checkout `fetch-depth: 0`（供 `git diff base...HEAD`）。
- 算改动文件；**豁免**（不需流程）：`docs/**`、`*.md`、`*.toml`、`profiles/**`、`.github/**`、`modules/**`、`contracts/**`、`install.sh`、`.grandmaster/**`、`.claude/**`、`.codex/**`、`AGENTS.md`、`CLAUDE.md`、`.gitignore`、`.gitattributes`、`README*`、`LICENSE`。
- 有豁免之外改动（=**代码**）→ 需 **requirement**（`docs/requirements/` 变更 或 PR body `Refs/Closes/Resolves #N` / issue 链接）+ **design**（`docs/designs/` 变更 或 body 含 `docs/designs/` 链接）；缺 → 打红。
- **`[trivial]`**（PR 标题含 `[trivial]` 或 `trivial` 标签）→ 跳过 design 要求，`::notice::` 回显（不静默）。
- 纯文档/配置/机件改动 → 流程门免检。

## 决策
requirement 必需 + design 必需（`[trivial]` 可跳 design）；Claude hook 暂缓。

## 验收
- 本地对合成用例测门逻辑：无 req/des→红；有→绿；docs-only→免检；`[trivial]`→跳 design。
- 本 PR（docs/CI-only，全豁免）流程门自身免检通过；`redlines` CI 绿。
