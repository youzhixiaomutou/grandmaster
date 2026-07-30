---
id: 0005-remote-install
title: install.sh 一条命令远程执行（curl|bash 自取，无需 clone）
created: 2026-07-30
tags: [install, bootstrap, remote]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/14]
---

## 复述

`install.sh` 支持**一条命令远程执行**（`curl … | bash`），用户**无需手动 clone** 整个 Grandmaster——脚本自取内容装进当前仓库。

## 约束 / 决定

- 仓库**已改为 public**（用户操作）→ 采用最简 `curl -fsSL <raw>/install.sh | bash`。

## 确认结论

- **入口**：`curl -fsSL https://raw.githubusercontent.com/youzhixiaomutou/grandmaster/main/install.sh | bash`（可 `| bash -s -- [target] [--force] [--ref <ref>]`）。
- **自取内容**：`install.sh` 下载 archive **tarball**（`--ref`，默认 `main`）到临时目录、装入当前目录、用完即删；`--src <dir>` 支持本地 / 离线。
- **依赖**：`curl` + `tar`（无需 git / gh）。
- **复用**现有安装逻辑（机件覆盖 / 可定制让用户选 / 软链接 / 排除 `docs`）。双向可回溯：Issue #14。
