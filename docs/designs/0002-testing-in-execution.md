# 0002 · 执行阶段纳入测试

- **状态**: Accepted（评审通过，见 [Issue #6](https://github.com/youzhixiaomutou/grandmaster/issues/6)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0001-testing-in-execution.md` · Issue #6

## 目标 / 非目标

- **目标**：执行阶段强制"为改动写/跑测试、全绿才算完成、才提 PR"，编织进流水线。
- **非目标**：不绑定测试框架；runner 后置；不新增 Grandmaster 本仓库功能测试 CI。

## 方案

1. **新增 `modules/skills/testing`**（kind=skill, `implements: skill.contract@^1`）
   - description（自动触发）：实现/修改代码或功能后、提交前需验证改动行为时使用。
   - Procedure：明确关键行为 → 写/更新相称测试 → 运行 → 关键行为至少端到端跑一次真实路径 → 全绿才算完成，失败即修。
   - 🚫 红线：相关测试未过 = 不算完成/不提 PR；不删/skip/改测试迁就错误实现。
2. **衔接改造**
   - `task-orchestration` DoD 增"每个涉及代码/功能的产出经 testing 相应测试通过"。
   - `version-control` DoD 增"相关测试通过"；🚫 红线增"相关测试未过不提 PR"。
3. **流水线**：`intake → design-proposal → task-orchestration → testing → version-control → documentation`
4. **runner 后置**：`testing` 先通用描述"用项目现有测试命令跑"；未来立可插拔 `test-runner` 能力（pytest/jest/go…）P-later。

## 边界（防 description 撞车）

`testing` = 验证**改动的功能行为**；≠ `verify-implementation`（provider 对**契约** Conformance 核验）；≠ `smoke-example`（验证技能被发现）。

## 决策

- test-runner：后置（P-later）。
- 测试深度：相称 + 关键路径端到端；不设硬性覆盖率门槛。
- `AGENTS.md` **不加**测试基线行（由 `testing` 技能承载）。

## 验收

- `testing` 过 `skill.contract` 自查；两处 DoD 更新且与红线一致；`redlines` CI 绿。
