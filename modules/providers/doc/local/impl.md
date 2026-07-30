# doc-local · 本地文档实现

`implements: doc.contract@^1` · `provides: doc`

写 `docs/notes/NNNN-<slug>.md`（frontmatter + 文档摘要 + 指向正文文档的链接）。**不改正文文档本身**。目录由 `[config].dir`（默认 `docs/notes`）。随 git，无凭据。

## 操作映射
- **persist(record)**：由 `title` 生成 `slug`；同 `slug` 更新、否则取新 `NNNN`。`ref` = 相对路径。
- **get(ref)**：读回。

## 🚫 Red lines
- 不写入密钥 / 敏感值。

## Conformance 对照（doc.contract）
1. `ref` = 路径 ✓　2. 含 文档摘要 / 链接 ✓　3. 同 slug 更新 ✓　4.（github 专属：评论 PR，local 不涉及）　5. 不落盘密钥 ✓
