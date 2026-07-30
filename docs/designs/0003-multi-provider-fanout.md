# 0003 · 能力支持多 provider 同时启用（fan-out）

- **状态**: Accepted（评审通过，见 [Issue #8](https://github.com/youzhixiaomutou/grandmaster/issues/8)）
- **日期**: 2026-07-30
- **需求来源**: `docs/requirements/0002-multi-provider-fanout.md` · Issue #8

## 目标 / 非目标

- **目标**：capability 可配多个 active provider；写类 op fan-out（best-effort），读类取首个；**向后兼容**单 provider。
- **非目标**：不改各 provider 实现；不做跨 provider 强一致 / 事务。

## 方案

1. **配置**：`[capabilities] X = "p"`（单）或 `["p1","p2"]`（多）。
2. **语义集中在 `contracts/CONVENTIONS.md`**（决策 b）：写类 fan-out best-effort（多 `ref`、失败显式报告）；读类 `get` 按 ref 分派、`recall` 取首个。
3. 各 capability contract（`issue` / `memory`）**引用** CONVENTIONS。
4. 消费技能（`requirement-intake` 第 5 步）按 CONVENTIONS fan-out。
5. `grandmaster.toml`：`issue = ["local","github"]`（本需求要求两处并行）。

## 决策

- 通用机制（所有能力）；失败尽力而为、显式报告；读类取首个（primary = 数组首元素）。
- 语义规范落点：**(b)** 集中 `contracts/CONVENTIONS.md` + 各 contract 引用。

## 验收

- `issue = ["local","github"]` 时，`requirement-intake` 固化**同时**写本地 + 建 github、返回 2 个 `ref`；其中一个失败也显式报告、不阻断。
- 单字符串**向后兼容**。
- `redlines` CI 绿。

## 端到端验证

- 本需求自身即演示：已**同时**固化到 `docs/requirements/0002`（local）+ Issue #8（github）。
