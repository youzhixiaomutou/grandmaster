---
id: 0007-gitlab-providers
title: 为 issue/design/task/doc 加 gitlab provider（glab；memory 除外；可选）
created: 2026-07-31
tags: [gitlab, providers]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/20]
---

## 复述

为开发流程步骤能力 **issue / design / task / doc** 各加一个 **gitlab** provider（`glab` CLI）；**memory 除外**、**secret-source 不加**（凭据源 = env）。

## 确认结论

- **范围**：仅 issue / design / task / doc（4 个）。
- **激活**：加为**可选 provider**——默认仍 `github`（+local），gitlab 备好、按需在 `grandmaster.toml` 启用；不改现有默认行为。
- **机制**：`glab` CLI，对称 github——`issue.persist`→`glab issue create`（ref=issue URL）、`design`→评论原 GitLab issue（`glab issue note`）、`task`/`doc`→评论 MR（`glab mr note`）。
- 认证走外部、`requires_env=[]`（不入库）；主机由 glab 自身配置；契约不变。双向可回溯：Issue #20。
