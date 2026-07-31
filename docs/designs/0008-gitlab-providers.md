# 0008 · issue/design/task/doc 的 gitlab provider

- **状态**: Accepted（评论见 [Issue #20](https://github.com/youzhixiaomutou/grandmaster/issues/20)）
- **日期**: 2026-07-31
- **需求来源**: `docs/requirements/0007-gitlab-providers.md` · Issue #20

## 目标 / 非目标
- **目标**：为 `issue` / `design` / `task` / `doc` 各加一个 `gitlab` provider（`glab`），与 github 对称；作为**可选** provider。
- **非目标**：不改 github/local providers 与契约；`memory`、`secret-source` 不加；不改默认激活（默认仍 github）。

## 4 个 gitlab provider（`glab` CLI）
| provider | persist | get | github 对应 |
|---|---|---|---|
| `issue/gitlab` | `glab issue create --title --description` → issue URL；更新用 `glab issue note` | `glab issue view` | issue create |
| `design/gitlab` | 评论到**原 GitLab issue**：`glab issue note <origin> -m` | `glab issue view` | 评论原 issue |
| `task/gitlab` | 评论到**当前 MR**：`glab mr note <mr> -m`（MR 未建则 local 先行、补附） | `glab mr view` | 评论 PR |
| `doc/gitlab` | 评论到**当前 MR**：`glab mr note <mr> -m` | `glab mr view` | 评论 PR |

对应关系：**MR ↔ PR、issue note ↔ issue comment**。`requires_env=[]`（glab 外部认证、不入库）；主机由 glab 自身配置。

## 决策
仅 issue/design/task/doc；`glab` CLI；加为可选（默认仍 github，可在 `grandmaster.toml` 启用，如 `issue = ["local","github","gitlab"]`）。

## 验收
- 4 provider 过 `verify-implementation`（glab 命令 spec 核验：ref=URL、评论到 issue/MR、不落密钥）；`implements` 指向对应契约；审计 0 问题；`redlines` CI 绿。
- 本仓库在 GitHub、无 GitLab 远程，故不 live 建（同 github providers 当初）。
