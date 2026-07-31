# Grandmaster · Always-on 基线

本仓库为「AI Agent 参与研发」定义统一规程。技能（`SKILL.md`）位于 `modules/skills/`，经软链接共享给各工具，由 `description` **自动触发**。
**本文件同时经 `CLAUDE.md` 软链接供 Claude Code 读取；Codex 读取本 `AGENTS.md`。**

## 🚫 全局红线（不可谈判）

1. **绝不打印、提交或回显密钥 / 令牌。** 密钥只经 `requires_env` 声明变量名，运行期由 `secret-source` 能力读取；日志、输出、提交一律不含其值。
2. **对外操作先确认。** push、合并 PR、发通知、调用外部服务等外向 / 不可逆动作，未获持久授权前先与人确认。**例外：流程固化——把 requirement/design/task/doc 写到 issue/comment/MR——属自动持久化，自动执行、不需确认。**
3. **不静默截断。** 凡做了范围裁剪（top-N、采样、跳步）必须显式说明。
4. **改流程必经 PR。** 不得手改工具目录（`.claude/skills` 等）的软链接目标或绕过评审 / 自查。

## 研发流程（每个任务的强制顺序）

对任何**功能 / 代码 / 变更**请求（不只是改本仓库），**必须按顺序**：

1. **`requirement-intake`** —— 复述 + 澄清关键问题 + **固化确认结论**（`issue` 能力：本地记录 / GitHub · GitLab issue）。关键歧义未清不动手。
2. **`design-proposal`** —— 非平凡改动先出方案；**产出后必须交用户明确确认**，确认后才经 `design` 能力固化并标 `status: Accepted`（AI 不自盖章）。仅确属琐碎才可跳过。
3. **实现** —— `task-orchestration`（含 `testing`：写 / 跑测试、全绿才算完成）。
4. **`version-control`** —— 建分支、提交、开 PR（对外操作先确认）。
5. **`documentation`** —— 同 PR 更新文档。

🚫 **未完成第 1 步、且（非平凡时）设计未获用户确认之前，禁止直接编写实现代码。** CI（`redlines` 的 process-gate）会对"涉及代码却缺 requirement / design"的 PR 打红（琐碎改动可标 `[trivial]` 跳过 design）。

## 模块协议（速览）

- 模块 = 目录 + 清单（技能用 `SKILL.md` frontmatter；provider/adapter/infra 用 `module.toml`）+ `implements: <contract>@semver`。
- 四种 `kind`：`skill`（流程）/ `provider`（能力后端）/ `adapter`（工具接入）/ `infra`（横切，如 secret-source）。
- 依赖“能力”而非具体实现；激活实现由 skill 步骤内联读 `grandmaster.toml`（+激活 profile）决定。

## 怎么改 Grandmaster 模块（区别于上面的「研发流程」）

- 新增 / 修改任何模块 → 由 `skill-authoring` 引导并按 `contracts/skill.contract.md` 自查。
- 替换某能力的实现 → 由 `verify-implementation` 按契约 `## Conformance` 逐条核验，全过才启用。
- 接入新工具 / 初始化链接 → 由 `tool-onboarding`。

## 记忆（always-on）

- **做事前**：先按当前主题 `recall` 相关记忆（`memory` 能力）作参考。
- **每步完成后**：由 `memory` 技能判断是否 `save`——只存跨会话有用的稳定事实（决策与理由 / 约定 / 坑 / 用户偏好），不存临时上下文与密钥。
- 记忆**入库共享**（`.grandmaster/memory/`，随 git）。

详见 `docs/designs/0001-grandmaster.md`。
