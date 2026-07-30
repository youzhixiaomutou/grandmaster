---
id: 0001-testing-in-execution
title: 执行阶段纳入测试
created: 2026-07-30
tags: [testing, process]
---

## 复述

把**测试**固化进研发**执行阶段**：AI 实现一处改动后，必须为该改动**写 / 更新相应测试并跑到全绿**才算完成、才可提 PR。编织进流水线：`task-orchestration → testing → version-control`。

## 假设与默认

- 做成**独立 `testing` 技能**（符合"每个动作一个 skill"）。
- 🚫 红线：相关测试未过 → **不算完成、不提 PR**；不靠删 / skip / 改测试迁就错误实现。
- 衔接：`task-orchestration` 与 `version-control` 的 DoD 加"相关测试通过"。
- 不新增 Grandmaster 本仓库的功能测试 CI（本仓库只有技能 / 契约 / 文档，无功能码；`redlines` 保持极小）；`testing` 技能**建议目标项目在其 CI 跑测试**。

## 确认结论

- **test-runner**：后置（P-later）——`testing` 技能先通用描述"写 / 跑测试、全绿才算完"；pytest / jest / go test 等具体 runner 做成可插拔能力留待后续。
- **测试深度**：**相称 + 关键路径端到端**——改到哪测到哪；对改动的关键行为至少端到端验证一次；不设硬性覆盖率门槛。
- 需求来源：会话审计发现"执行阶段无显式测试环节"（`task-orchestration` 仅"验收"、`version-control` 的"CI 绿"实为 redlines 密钥/结构扫描）。
