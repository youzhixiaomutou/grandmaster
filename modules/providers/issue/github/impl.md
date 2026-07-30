# issue-github · GitHub issue 实现

`implements: issue.contract@^1` · `provides: issue`

把需求条目固化为 GitHub issue（用已认证的 `gh` CLI）。`ref` = issue URL。凭据由 `gh` 外部管理，**不入库、不在 `requires_env` 声明**。

## 操作映射

- **persist(record)**：
  - 新建：`gh issue create --title "<title>" --body "<复述 + 假设/默认 + 确认结论>"` → 返回 issue URL。
  - 更新：调用方带既有 `ref`（issue 号 / URL）时 → `gh issue comment <n> --body "<更新>"`（或编辑正文）。返回该 issue / 评论 URL。
- **get(ref)**：`gh issue view <ref> --json title,body,url` 取回。

## 🚫 Red lines

- body 不含密钥 / 敏感值。
- 创建 / 评论属**对外操作**：由 [[requirement-intake]] / `version-control` 的确认门约束（未获授权前先确认）。

## Conformance 对照（见 `contracts/issue.contract.md`）

1. `ref` = issue / 评论 URL（可定位）。✓
2. body 含 复述 / 假设 / 结论 三部分。✓
3. 同需求带 `ref` 时走更新（评论 / 编辑），不新建重复。✓
4. `get` 用 `gh issue view` 取回。✓
5. 不落盘密钥（`gh` 认证在外部）。✓
