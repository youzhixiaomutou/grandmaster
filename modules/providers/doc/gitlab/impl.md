# doc-gitlab · 评论到 MR

`implements: doc.contract@^1` · `provides: doc`

把完成文档的摘要 / 链接固化为**当前分支 MR** 上的一条 note。凭据由 `glab` 外部管理，不入库。

## 定位 MR
当前分支的 MR：`glab mr view`。**MR 未建时**：先由 `local` 固化，待建好 MR 后补附。

## 操作映射
- **persist(record)**：`glab mr note <MR> -m "<文档摘要 + 链接>"` → `ref` = note URL。再 `persist` = 追加 / 更新。
- **get(ref)**：`glab mr view <MR>`。

## 🚫 Red lines
- 不含密钥；评论属对外操作，遵循“对外先确认”。

## Conformance 对照（doc.contract）
1. `ref` = MR note URL ✓　2. 含 文档摘要 / 链接 ✓　3. 更新 ✓　4. **评论到 MR（未建则延后）** ✓　5. 不落盘密钥 ✓
