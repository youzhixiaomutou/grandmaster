---
id: 0006-memory-integration
title: memory 接入工作流（always-on recall/save；入库共享；仅 local）
created: 2026-07-30
tags: [memory, process]
links: [https://github.com/youzhixiaomutou/grandmaster/issues/17]
---

## 复述

把 memory（**仅 local**）编织进工作流：**做事前先 `recall`** 相关记忆参考；**每步完成后判断是否 `save`**（固化跨会话有用的稳定结论）。memory 能力 / local provider 已存在，本需求 = 接入 + 明确判断标准。

## 确认结论

- **接入方式**：**always-on 规则**（`AGENTS.md`）——做事前 recall、每步后判断 save；由 `memory` 技能承载"存什么 / 何时存"。不改各技能。
- **记忆存储**：**入库共享**（去掉 `.grandmaster/memory/` 的 gitignore，随 git，多 agent / 团队共享）。
- **save 标准**：只存跨会话有用的稳定事实——决策与理由、约定、踩过的坑、用户偏好；**排除**临时上下文、可从代码 / git 直接得到的、密钥。
- **recall 时机**：每次开始任务 / 步骤时按当前主题 recall。
- **不加** mysql/mem0（保持 local）。双向可回溯：Issue #17。
