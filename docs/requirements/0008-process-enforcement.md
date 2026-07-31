---
id: 0008-process-enforcement
title: 流程强制执行（AGENTS 强制顺序 + redlines process-gate）
created: 2026-07-31
tags: [process, enforcement, ci]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/22]
---

## 复述

实际使用中流程没被执行——让 AI 写代码，澄清后没固化 issue、没 design，直接写完代码。要让研发流程**真正强制**：写实现代码前必须先 `requirement-intake`（澄清+固化）、再 `design-proposal`（非平凡）。

## 根因

- `AGENTS.md` 的流程要求是软性 prose，且混在"怎么改（模块）"节里、未成强制完整顺序。
- 零强制机制（`redlines` 只查密钥/name，无 CI 门、无 hook）。

## 确认结论（A + CI 硬门）

- **A（必做）**：`AGENTS.md` 顶部加「研发流程（强制顺序）」——任何功能/代码/变更任务按 intake→design→实现→version-control→documentation；**未完成 intake +（非平凡）design 前禁止写实现代码**；与"改 Grandmaster 模块"分开。
- **B（CI 硬门）**：`redlines.yml` 加 process-gate（仅 PR）——**涉及代码**的 PR（改动落在 docs/*.toml/modules/contracts/.github/AGENTS 等豁免之外）须关联 **requirement**（`docs/requirements/` 变更 或 `Refs/Closes #N`）+ **design**（`docs/designs/` 变更 或链接）；缺则打红。**`[trivial]`**（标题/标签）可跳 design（跳过在 CI 日志回显，不静默）。纯文档/配置/机件改动免检。
- **C（Claude hook）暂不做**。双向可回溯：Issue #22。
