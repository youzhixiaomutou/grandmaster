# secret-source-env · 环境变量实现

`implements: secret-source.contract@^1` · `provides: secret-source`

从进程**环境变量**按名读取密钥。值只在运行期存在，**绝不入库 / 回显**。

## 操作映射

- **get(name)**：返回环境变量 `$name` 的值（`name` 须在调用方 `requires_env` 声明过）；未设置则视为缺失（报错 / 空），不泄漏。

## 🚫 Red lines

- 值绝不写入文件 / 日志 / 提交 / 输出。
- 只读取 `requires_env` 声明过的名字。

## Conformance 对照（见 `contracts/secret-source.contract.md`）

1. `get(已声明 name)` = env 值 ✓　2. 未设置 → 缺失（不泄漏）✓　3. 不落盘 / 不回显 ✓　4. 名字来自 `requires_env` ✓
