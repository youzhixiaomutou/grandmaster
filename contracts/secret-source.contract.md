# Contract: secret-source

- **id**: `secret-source.contract`
- **version**: 1.0.0
- **适用**: `kind=provider` 且 `provides = secret-source`

## Purpose

为需要凭据的模块提供"按名取密钥"的统一入口；密钥值只在运行期读取，**绝不入库、绝不回显**。

## Operations

- `get(name) -> value`：按变量名返回密钥值（`name` 来自调用方的 `requires_env`）。未定义则视为缺失（报错或空，由实现约定），且不泄漏。

> 多 provider 见 [`contracts/CONVENTIONS.md`](CONVENTIONS.md)（读类取首个 / 主）。

## 🚫 Red lines

- 值绝不写入文件、日志、提交或回显。
- 只接受调用方 `requires_env` 声明过的名字。

## Conformance

1. `get(已声明的 name)` 返回其值。
2. `get(未声明 / 不存在的 name)` 不返回值（报错或空），且不泄漏。
3. 值不落盘、不回显。
4. 名字来源于 `requires_env`（不接受任意名）。
