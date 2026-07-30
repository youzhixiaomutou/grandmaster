---
id: memory-integration
tags: [memory, decision]
created: 2026-07-30
---

memory 接入工作流的决策：**always-on 规则**（`AGENTS.md`：做事前 recall、每步后判断 save）；记忆**入库共享**（`.grandmaster/memory/`，随 git）；保持**仅 local**（不加 mysql/mem0）。save 标准 = 决策与理由 / 约定 / 坑 / 用户偏好，排除临时上下文与密钥。来源 Issue #17 / `docs/designs/0007`。
