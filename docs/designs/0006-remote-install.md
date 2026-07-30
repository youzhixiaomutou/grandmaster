# 0006 · install.sh 远程一条命令安装

- **状态**: Accepted（评论见 [Issue #14](https://github.com/youzhixiaomutou/grandmaster/issues/14)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0005-remote-install.md` · Issue #14

## 目标 / 非目标
- **目标**：`curl … | bash` 一行装入当前仓库，**无需手动 clone**；`install.sh` 自取 tarball。
- **非目标**：不改安装逻辑本身（复用 0005 之前的落法）；不做包管理器。

## 决定
- 仓库改 **public** → `curl -fsSL <raw>/install.sh | bash`。
- `install.sh` 自取 archive **tarball**（`--ref` 默认 `main`）到临时目录（用完删）；`--src <dir>` 本地 / 离线；依赖 `curl` + `tar`。

## install.sh 变更
- 参数：`[target]`（缺省 cwd）、`--ref <ref>`（main）、`--src <dir>`、`--force`/`--keep`。
- **源解析**：`--src` 用本地；否则 `curl <archive tarball> | tar --strip-components=1` 到 `mktemp -d`，`trap` 清理。
- 其余（机件覆盖 / 可定制 / 软链接 / 排除 `docs`）不变。

## 一条命令
```
curl -fsSL https://raw.githubusercontent.com/youzhixiaomutou/grandmaster/main/install.sh | bash
# 带参：| bash -s -- [target] [--force] [--ref <tag>]
```

## 验收
- 本地 `--src` 模式 + 远程 fetch 模式各装入临时仓库成功（11 技能可发现、不含 `docs`）。
- `curl|bash` 一条命令：本 PR 合并后 raw 上的 `install.sh` 更新即生效。
