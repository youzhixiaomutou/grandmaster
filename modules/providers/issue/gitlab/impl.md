# issue-gitlab · GitLab issue 实现

`implements: issue.contract@^1` · `provides: issue`

把需求条目固化为 GitLab issue（用已认证的 `glab` CLI）。`ref` = issue URL。凭据由 `glab` 外部管理，不入库。

## 操作映射

- **persist(record)**：
  - 新建：`glab issue create --title "<title>" --description "<复述 + 假设/默认 + 确认结论>"` → 返回 issue URL。
  - 更新：调用方带既有 `ref`（issue id / URL）时 → `glab issue note <id> -m "<更新>"`。返回 issue / note URL。
- **get(ref)**：`glab issue view <ref>`。

## 🚫 Red lines
- **固化自动执行**：创建 / 评论属流程内持久化（低风险、可回滚），自动执行、不受“对外先确认”约束；`body` / `description` 不写入密钥 / 敏感值。

## Conformance 对照（issue.contract）
1. `ref` = issue / note URL ✓　2. 含 复述/假设/结论 ✓　3. 同需求带 `ref` 走更新（note）不新建 ✓　4. `get` 用 `glab issue view` ✓　5. 不落盘密钥 ✓
