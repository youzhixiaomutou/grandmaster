# Grandmaster

「用 AI Agent 参与研发」的统一规程与**单一事实源**（Single Source of Truth）。

研发中的每个动作——写设计方案、版本控制、任务编排、文档、记忆、消息通知，乃至“校验 / 验证实现 / 接入工具”这些**治理动作本身**——都固化成一份 `SKILL.md`（写清 **何时用 / 步骤 / 红线**）。多种 AI 工具（Claude Code、Codex…）通过**软链接**共享同一套技能，行为一致；所有改动走 **git**，可审查、可回溯、可回滚。

## 核心理念

- **单一事实源**：技能只在 `modules/skills/` 定义一处，各工具目录（`.claude/skills`、`.codex/skills`）是它的软链接。
- **一切皆模块**：`skill` / `provider` / `adapter` / `infra` 四种模块同构，面向 `contracts/` 里的契约编写。
- **治理即 skill，AI 即运行时**：校验、验证实现、接入工具都是靠 `description` 自动触发的技能，不引入命令行工具。唯一的非-skill 可执行物，是 CI 上一道只查不可谈判红线（如密钥）的极小兜底（`.github/workflows/redlines.yml`）。
- **文件即流程**：加一条流程 = 往 `modules/skills/` 加一个文件（整目录软链接下，连“同步”都不用跑）。

## 目录

```
contracts/   接口层（带 ## Conformance 断言清单）
modules/     一切皆模块：skills / providers / adapters / infra
profiles/    命名的实现选择集（local-dev / ci …）
docs/designs 通过评审的设计文档
.github/     CODEOWNERS + 一道极小红线 CI
```

## 加一条流程

在与 AI 的对话中描述“新增 / 修改一个技能或模块”，`skill-authoring` 会按 `description` 自动触发并引导：复制模板 → 填 `SKILL.md` → 自查 → 提 PR。

## 设计与进度

详见 [`docs/designs/0001-grandmaster.md`](docs/designs/0001-grandmaster.md) 与 GitHub Issue #1。当前进度：**P0（Bootstrap）**。
