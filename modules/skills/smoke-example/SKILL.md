---
name: smoke-example
description: 当需要验证 Grandmaster 的技能已被当前工具正确发现并可触发（冒烟测试），或需要一个可复制的最简技能范例时使用；输出一行确认标记，不产生任何副作用。
version: 0.1.0
kind: skill
implements: skill.contract@^1
metadata: { owner: "@youzhixiaomutou", status: active, tags: [example, smoke] }
user-invocable: true
related: [skill-authoring]
---

## When to use / When NOT to use

- 用：确认技能已被工具发现 / 触发；或需要一个最简技能模板照抄。
- 不用：任何真实研发动作（那有对应技能）。

## Inputs / Preconditions

- 无。

## Procedure

1. 输出一行确认：`Grandmaster skill discovered & triggered ✓（来源：<当前工具>）`。
2. 若用户在照抄模板：指向 [[skill-authoring]] 走正式新增流程。

## 🚫 Red lines

- 只读：不写文件、不调用外部服务、不打印任何环境变量值。

## Outputs / Definition of Done

- 一行确认标记；无任何副作用。

## Related

- [[skill-authoring]]
