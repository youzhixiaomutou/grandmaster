# task-gitlab · 评论到 MR

`implements: task.contract@^1` · `provides: task`

把任务计划与执行 / 测试报告固化为**当前分支 MR** 上的一条 note。凭据由 `glab` 外部管理，不入库。

## 定位 MR
当前分支的 MR：`glab mr view`（在该分支上）取 MR id / URL。**MR 未建时**：先由 `local` 固化，待 `version-control` 建好 MR 后补附 note。

## 操作映射
- **persist(record)**：`glab mr note <MR> -m "<任务分解与状态 + 测试报告>"` → `ref` = note URL。再 `persist` = 追加 / 更新。
- **get(ref)**：`glab mr view <MR>`。

## 🚫 Red lines
- **固化自动执行**：创建 / 评论属流程内持久化（低风险、可回滚），自动执行、不受“对外先确认”约束；`body` / `description` 不写入密钥 / 敏感值。

## Conformance 对照（task.contract）
1. `ref` = MR note URL ✓　2. 含 任务分解 + 测试结果 ✓　3. 更新 ✓　4. **评论到 MR（未建则延后）** ✓　5. 不落盘密钥 ✓
