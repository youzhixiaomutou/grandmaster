# task-github · 评论到 PR

`implements: task.contract@^1` · `provides: task`

把任务计划与执行 / 测试报告固化为**当前分支 PR** 上的一条评论。凭据经 `gh` 外部管理，不入库。

## 定位 PR
当前分支的 PR：`gh pr view --json number,url`（在该分支上）。**PR 未建时**：先由 `local` 固化，待 `version-control` 建好 PR 后补附评论。

## 操作映射
- **persist(record)**：`gh pr comment <PR> --body "<任务分解与状态 + 测试报告>"` → `ref` = 评论 URL。再 `persist` = 编辑该评论（更新）。
- **get(ref)**：`gh` 读取该评论。

## 🚫 Red lines
- body 不含密钥；评论属对外操作，遵循“对外先确认”。

## Conformance 对照（task.contract）
1. `ref` = PR 评论 URL ✓　2. 含 任务分解 + 测试结果 ✓　3. 更新 ✓　4. **评论到 PR（PR 未建则延后）** ✓　5. 不落盘密钥 ✓
