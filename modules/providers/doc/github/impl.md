# doc-github · 评论到 PR

`implements: doc.contract@^1` · `provides: doc`

把完成文档的摘要 / 链接固化为**当前分支 PR** 上的一条评论。凭据经 `gh` 外部管理，不入库。

## 定位 PR
当前分支的 PR：`gh pr view --json number,url`。**PR 未建时**：先由 `local` 固化，待建好 PR 后补附。

## 操作映射
- **persist(record)**：`gh pr comment <PR> --body "<文档摘要 + 链接>"` → `ref` = 评论 URL。再 `persist` = 编辑该评论（更新）。
- **get(ref)**：`gh` 读取该评论。

## 🚫 Red lines
- body 不含密钥；评论属对外操作，遵循“对外先确认”。

## Conformance 对照（doc.contract）
1. `ref` = PR 评论 URL ✓　2. 含 文档摘要 / 链接 ✓　3. 更新 ✓　4. **评论到 PR（PR 未建则延后）** ✓　5. 不落盘密钥 ✓
