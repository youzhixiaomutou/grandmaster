# design-gitlab · 评论到原 GitLab issue

`implements: design.contract@^1` · `provides: design`

把设计固化为「原 GitLab issue」（该设计对应需求的 GitLab issue）上的一条 **note**——**不新建 issue**。凭据由 `glab` 外部管理，不入库。

## 定位「原 issue」
从需求记录（`docs/requirements/NNNN` 的 `links`，或上下文中的需求 issue `ref`）取 GitLab issue id / URL。

## 操作映射
- **persist(record)**：`glab issue note <原issue> -m "<目标 + 方案 + 决策 + 验收>"` → `ref` = note URL。同设计再 `persist` = 追加 / 更新。
- **get(ref)**：`glab issue view <原issue>`。

## 🚫 Red lines
- 不含密钥；评论属对外操作，遵循“对外先确认”。

## Conformance 对照（design.contract）
1. `ref` = note URL ✓　2. 含 目标/方案/验收 ✓　3. 更新 ✓　4. **评论到原 issue（非新建）** ✓　5. 不落盘密钥 ✓
