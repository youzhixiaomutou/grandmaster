# memory-local · 本地 Markdown 实现

`implements: memory.contract@^1` · `provides: memory`

将记忆存为本地 markdown 文件：每条事实一份 `<id>.md`，另有一份 `MEMORY.md` 索引（每条一行）。目录由 `module.toml` 的 `[config].dir` 指定（默认 `.grandmaster/memory`）。本实现无需任何凭据。

## 文件格式

- 每条 `<dir>/<id>.md`：YAML frontmatter 含 `id`、可选 `tags`、`created`；其后为正文（fact 内容）。
- 索引 `<dir>/MEMORY.md`：每条一行，形如 `- [<title>](<id>.md) — <一句话摘要>`。

## 操作映射

- **save(content, tags?)**：由 content 生成 kebab-case `id`（已存在则视为**更新**，覆盖同名文件）；写 `<dir>/<id>.md`；在 `MEMORY.md` 增或改对应行。返回 `id`。
- **recall(query)**：在 `<dir>/` 内对文件名、frontmatter `tags`、正文做子串 / 标签匹配；返回命中的 fact 列表；无命中返回 `[]`。
- **forget(id)**：删除 `<dir>/<id>.md`（不存在则跳过）；从 `MEMORY.md` 移除对应行。

## 🚫 Red lines

- 绝不写入密钥 / 敏感值（记忆为明文 markdown；入库前由 [[memory]] 技能红线把关）。

## Conformance 对照（见 `contracts/memory.contract.md`）

1. save→recall 取回：写文件后子串匹配即命中。✓
2. forget→recall 取不到：删文件后不再命中。✓
3. 缺失 query 返回空：无匹配 → `[]`。✓
4. forget 不存在 id 幂等：文件不存在则跳过、不报错。✓
5. 同 id 覆盖：同名文件覆盖、索引行更新，无重复。✓
6. 不落盘密钥：只存调用方明文，密钥由红线拦截。✓
