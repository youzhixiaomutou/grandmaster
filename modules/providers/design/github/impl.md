# design-github · 评论到原 issue

`implements: design.contract@^1` · `provides: design`

把设计固化为「原 issue」（该设计对应需求的 GitHub issue）上的一条**评论**——**不新建 issue**。凭据经 `gh` 外部管理，不入库。

## 定位「原 issue」
从需求记录（`docs/requirements/NNNN` 的 `links`，或上下文中的需求 issue `ref`）取原 issue 编号 / URL。

## 操作映射
- **persist(record)**：`gh issue comment <原issue> --body "<目标 + 方案 + 决策 + 验收>"` → `ref` = 评论 URL。同设计再 `persist` = 编辑该评论（更新），不新增重复。
- **get(ref)**：`gh` 读取该评论。

## 🚫 Red lines
- **固化自动执行**：创建 / 评论属流程内持久化（低风险、可回滚），自动执行、不受“对外先确认”约束；`body` / `description` 不写入密钥 / 敏感值。

## Conformance 对照（design.contract）
1. `ref` = 评论 URL ✓　2. 含 目标/方案/验收 ✓　3. 更新（编辑评论）✓　4. **评论到原 issue（非新建）** ✓　5. 不落盘密钥 ✓
