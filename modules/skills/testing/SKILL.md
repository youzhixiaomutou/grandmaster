---
name: testing
description: 当实现或修改代码 / 功能后、在提交前需要验证改动行为是否正确时使用；为改动写 / 更新相称的测试并运行，对关键行为至少端到端验证一次，全绿才算完成。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [testing, process] }
related: [task-orchestration, version-control]
---

## When to use / When NOT to use

- 用：实现 / 修改代码或功能后、提交前，需验证改动行为。
- 不用：纯文档 / 配置且无行为改动；provider 对契约的一致性核验（那走 [[verify-implementation]]）。

## Inputs / Preconditions

- 已实现 / 修改的改动，及其"应有行为"。

## Procedure

1. 明确本次改动要覆盖的关键行为与边界。
2. 写 / 更新相称的测试（改到哪测到哪；不为无关部分补测、不追求覆盖率数字）。
3. 运行相关测试。
4. 对关键行为**至少端到端跑一次真实路径**验证（非仅打桩单测）。
5. **全绿才算完成**；失败则修复实现或修正测试假设——不跳过。

## 🚫 Red lines

- 相关测试未过 → **不算完成、不提 PR**。
- 不靠删除 / skip / 篡改测试来迁就错误实现。
- 测试与固定数据中不写入密钥 / 敏感值。

## Outputs / Definition of Done

- 相关测试写好并全绿；关键行为经端到端验证；改动方可进入 [[version-control]]。

## Related

- [[task-orchestration]]、[[version-control]]
