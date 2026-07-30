# 模块协议约定（Conventions）

本仓库模块协议的通用约定，供各 `contract` / `skill` 引用。

## 多 provider（同时启用 · fan-out）

能力（capability）可在 `grandmaster.toml [capabilities]` 里配置为**单个**或**多个** provider：

- 单个：`issue = "local"`
- 多个：`issue = ["local", "github"]`

**向后兼容**：字符串等价于单元素数组。

语义：

- **写 / 发出类操作**（如 `persist`、`notify`）：**fan-out** 到所有启用的 provider；**尽力而为（best-effort）**——成功的记录其 `ref`、失败的**显式报告**（不静默吞、不整体阻断）。返回 `ref` **列表**。
- **读 / 取回类操作**（如 `get`、`recall`）：`get` 按 `ref` 格式**分派**到对应 provider（各 provider 认自己的 ref）；`recall` / 单值读取用**首个**（数组第一个元素 = primary）。

## 🚫 红线（多 provider 相关）

- fan-out 到**对外** provider（如 `github`）前，遵循全局"对外操作先确认"。
- 失败必须**显式报告**，不得静默丢弃（契合"不静默截断"）。
