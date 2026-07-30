#!/usr/bin/env bash
# Grandmaster bootstrap 安装脚本 —— 把「使用所必需」的治理规程拷贝快照进目标仓库。
# 用法: install.sh [target-repo]   目标仓库路径（缺省 = 当前目录）
#   --force   覆盖目标已有的可定制文件（grandmaster.toml / AGENTS.md / redlines.yml / .gitattributes）
#   --keep    保留目标已有的可定制文件（跳过交互）
#   -h        显示本用法
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="."
MODE="ask"   # ask | force | keep
for a in "$@"; do
  case "$a" in
    --force) MODE="force" ;;
    --keep)  MODE="keep" ;;
    -h|--help) sed -n '2,6p' "$0"; exit 0 ;;
    -*) echo "未知参数: $a" >&2; exit 2 ;;
    *)  TARGET="$a" ;;
  esac
done

TARGET="$(cd "$TARGET" 2>/dev/null && pwd || true)"
{ [ -n "$TARGET" ] && [ -d "$TARGET" ]; } || { echo "目标不是有效目录" >&2; exit 1; }
[ "$TARGET" = "$SRC" ] && { echo "目标不能是 Grandmaster 自身" >&2; exit 1; }
echo "安装 Grandmaster → $TARGET"

# ---- 机件（纯流程定义，重跑覆盖更新）----
mkdir -p "$TARGET/contracts" "$TARGET/modules"
cp -R "$SRC/contracts/." "$TARGET/contracts/"
cp -R "$SRC/modules/." "$TARGET/modules/"
echo "  机件已更新: contracts/ modules/"

# ---- 可定制文件（默认保留 / --force 覆盖 / 交互询问）----
maybe_install() { # <src-abs> <rel>
  local src="$1" rel="$2" dst="$TARGET/$2"
  mkdir -p "$(dirname "$dst")"
  if [ ! -e "$dst" ]; then cp "$src" "$dst"; echo "  安装: $rel"; return; fi
  case "$MODE" in
    force) cp "$src" "$dst"; echo "  覆盖: $rel (--force)" ;;
    keep)  echo "  保留已有: $rel" ;;
    ask)
      if [ -t 0 ]; then
        printf "  %s 已存在，覆盖? [y/N] " "$rel"; read -r ans || ans="N"
        case "${ans:-N}" in y|Y) cp "$src" "$dst"; echo "  覆盖: $rel" ;; *) echo "  保留: $rel" ;; esac
      else echo "  保留已有: $rel（非交互；--force 可覆盖）"; fi ;;
  esac
}
maybe_install "$SRC/grandmaster.toml" "grandmaster.toml"
maybe_install "$SRC/AGENTS.md" "AGENTS.md"
maybe_install "$SRC/.github/workflows/redlines.yml" ".github/workflows/redlines.yml"
maybe_install "$SRC/.gitattributes" ".gitattributes"

# ---- CODEOWNERS：install-if-absent 模板（占位 owner）----
if [ ! -e "$TARGET/.github/CODEOWNERS" ]; then
  mkdir -p "$TARGET/.github"
  cat > "$TARGET/.github/CODEOWNERS" <<'CO'
# 流程、契约与基线改动需 owner 评审（请替换为你的 owner）
/contracts/         @your-team
/modules/           @your-team
/AGENTS.md          @your-team
/grandmaster.toml   @your-team
CO
  echo "  安装: .github/CODEOWNERS（占位 owner，请替换）"
else echo "  保留已有: .github/CODEOWNERS"; fi

# ---- 软链接 + Codex config（tool-onboarding 落法）----
(
  cd "$TARGET"
  ln -sfn AGENTS.md CLAUDE.md
  mkdir -p .claude .codex
  ln -sfn ../modules/skills .claude/skills
  ln -sfn ../modules/skills .codex/skills
  [ -e .codex/config.toml ] || printf '# Codex：技能经 .codex/skills（软链接 → ../modules/skills）自动发现。\n# [[skills.config]] 仅用于禁用个别技能。\n' > .codex/config.toml
)
echo "  软链接: CLAUDE.md→AGENTS.md, .claude/skills, .codex/skills; .codex/config.toml"

# ---- .gitignore：保留 .claude 入库 ----
gi="$TARGET/.gitignore"
if [ ! -f "$gi" ] || ! grep -Fq '!**/.claude/**' "$gi"; then
  printf '\n# Grandmaster: 保留 .claude / .codex 入库\n!**/.claude/**\n' >> "$gi"
  echo "  .gitignore: 追加 !**/.claude/**"
fi

echo "完成。技能: $(ls "$TARGET/modules/skills" 2>/dev/null | tr '\n' ' ')"
