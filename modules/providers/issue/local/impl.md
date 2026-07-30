# issue-local · 本地文档实现

`implements: issue.contract@^1` · `provides: issue`

把需求条目写为本地 markdown：`docs/requirements/NNNN-<slug>.md`（`NNNN` 为四位递增序号）。目录由 `module.toml` 的 `[config].dir` 指定（默认 `docs/requirements`）。随 git 版本管理，强可回溯，无需凭据。

## 文件格式

- 文件名 `<NNNN>-<slug>.md`；`NNNN` = 目录内现有最大序号 + 1（从 `0001` 起）。
- frontmatter：`id`(=`NNNN-slug`)、`title`、`created`；可选 `tags` / `links`。
- 正文分节：`## 复述` / `## 假设与默认` / `## 确认结论`。

## 操作映射

- **persist(record)**：由 `title` 生成 kebab-case `slug`；若目录内已有同 `slug` 文件则**更新其内容**（不新建），否则取新 `NNNN` 建文件。返回 `ref` = 相对路径。
- **get(ref)**：读取该路径文件，解析回 `record`。

## 🚫 Red lines

- 不写入密钥 / 敏感值（明文 markdown；由 [[requirement-intake]] 红线把关）。

## Conformance 对照（见 `contracts/issue.contract.md`）

1. `ref` = `docs/requirements/NNNN-slug.md`（可定位路径）。✓
2. 三分节覆盖 复述 / 假设 / 结论。✓
3. 同 `slug` 更新而非新建（无重复）。✓
4. `get` 按路径读回。✓
5. 不落盘密钥。✓
