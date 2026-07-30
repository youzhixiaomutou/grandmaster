# 0005 · bootstrap 安装脚本

- **状态**: Accepted（评论见 [Issue #12](https://github.com/youzhixiaomutou/grandmaster/issues/12)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0004-install-script.md` · Issue #12

## 目标 / 非目标
- **目标**：`install.sh` 把 Grandmaster「使用所必需」拷贝进目标仓库 + 建软链接 / config，**装完即用**。
- **非目标**：不用 submodule / 包管理器；不拷 Grandmaster 自身 `docs/`、`README`；bootstrap 例外（非治理子命令）。

## install.sh（仓库根 · 单脚本）
用法：`./install.sh [target]`（缺省 = 当前目录）；`--force` 覆盖可定制文件；`--keep` 保留（默认）。

- **机件（纯流程定义，重跑覆盖）**：`contracts/`、`modules/`。
- **可定制（目标可能自有；默认保留 / `--force` 覆盖 / 交互询问）**：`grandmaster.toml`、`AGENTS.md`、`.github/workflows/redlines.yml`、`.gitattributes`。
- **CODEOWNERS**：install-if-absent 模板（占位 `@your-team`）。
- **软链接 / config（`tool-onboarding` 落法）**：`CLAUDE.md→AGENTS.md`、`.claude/skills`、`.codex/skills`、`.codex/config.toml`。
- **`.gitignore`**：追加 `!**/.claude/**`（若缺）。
- **排除**：`docs/`、`README.md`、`.git/`、会话文件、`install.sh` 自身。

## 决策（评审已定）
1. 目标路径缺省 = 当前目录。
2. 可定制文件更新**让用户选择**（交互 / `--force` / `--keep`，默认保留）。
3. **不做备份**（机件是快照、git 可回溯）。

## 更新机制
拷贝快照 → 更新 = 重跑 `install.sh`（机件覆盖、可定制默认保留）。快照不删除 Grandmaster 已移除的文件（可接受）。

## 验收
- 空白临时 git 仓库跑 `install.sh <tmp>`：得可用 `.claude/skills` / `.codex/skills`（列出全部技能）、`AGENTS.md`/`CLAUDE.md`、`grandmaster.toml`、`redlines.yml`；**不含** Grandmaster 的 `docs/`。
- 重跑幂等（机件更新、可定制保留）。
