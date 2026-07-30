---
name: version-control
description: 在进行任何分支、提交、合并或发起 PR / MR 时使用；默认分支不直接提交、先建分支，提交信息含动机与 Co-Authored-By 尾注，push / merge 等对外操作前先确认，绝不提交密钥。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [git, process] }
related: [design-proposal, skill-authoring]
---

## When to use / When NOT to use

- 用：任何 git 分支 / 提交 / 合并 / 发起 PR / MR。
- 不用：只读查看历史（无写操作）。

## Inputs / Preconditions

- 明确的变更意图与目标分支。

## Procedure

1. 若在默认分支：先建特性分支（禁止直接在主干提交）。
2. 提交信息写清动机；尾注 `Co-Authored-By:`。
3. 开 PR，描述含变更动机与验收标准。
4. 【确认门】push / 合并等对外操作前先与人确认（除非已持久授权）。
5. 评审通过后合并；必要时 `git revert` 回滚。

## 🚫 Red lines

- 绝不提交密钥 / 令牌。
- 对外操作（push / merge）先确认。
- 不强推主干（no force-push to main）。

## Outputs / Definition of Done

- 一个通过评审、CI 绿的 PR；提交历史清晰可回溯。

## Related

- [[design-proposal]]、[[skill-authoring]]
