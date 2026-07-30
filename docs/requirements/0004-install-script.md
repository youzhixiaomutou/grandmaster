---
id: 0004-install-script
title: bootstrap 安装脚本（拷贝快照装入目标仓库）
created: 2026-07-30
tags: [install, bootstrap, tooling]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/12]
---

## 复述

做一个 **bootstrap 安装脚本**，把 Grandmaster「使用所必需」的部分**拷贝快照**进指定的目标仓库，装完即用；**不带** Grandmaster 自身的开发产物（`docs/requirements`、`docs/designs` 等无关文件）。

## 假设与默认

- 脚本**幂等**、接收目标仓库路径、非 `--force` 不覆盖目标自有文件。
- 装完在目标里建 `.claude/skills`、`.codex/skills` 软链接、`CLAUDE.md→AGENTS.md`、`.codex/config.toml`（复用 `tool-onboarding` 落法）。

## 确认结论

- **方式**：拷贝快照（自包含、无外部依赖；更新 = 重跑覆盖机件）。
- **范围（仅使用所必需）**：`contracts/`、`modules/`（skills + providers + adapters + infra）、`grandmaster.toml`、`AGENTS.md`(+`CLAUDE.md` 软链接)、`.github/workflows/redlines.yml`、`.github/CODEOWNERS`、`.gitattributes`；**排除** `docs/`（Grandmaster 自身记录/设计）、`README.md`、`.git`、会话文件。
- 具体拷贝清单与覆盖策略见设计（`docs/designs/0005` / Issue #12）。双向可回溯：Issue #12。
