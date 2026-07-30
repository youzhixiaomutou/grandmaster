# design-local · 本地文档实现

`implements: design.contract@^1` · `provides: design`

写 `docs/designs/NNNN-<slug>.md`（frontmatter + 目标 / 方案 / 决策 / 验收）。目录由 `[config].dir`（默认 `docs/designs`）。随 git，无凭据。

## 操作映射
- **persist(record)**：由 `title` 生成 `slug`；同 `slug` 更新、否则取新 `NNNN` 建文件。`ref` = 相对路径。
- **get(ref)**：读回。

## 🚫 Red lines
- 不写入密钥 / 敏感值。

## Conformance 对照（design.contract）
1. `ref` = 路径 ✓　2. 含 目标/方案/验收 ✓　3. 同 slug 更新 ✓　4.（github 专属语义，local 不涉及）　5. 不落盘密钥 ✓
