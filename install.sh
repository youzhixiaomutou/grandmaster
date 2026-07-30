#!/usr/bin/env bash
# Grandmaster bootstrap 安装脚本 —— 一条命令把治理规程装进目标仓库。
# 远程一行（无需手动 clone）：
#   curl -fsSL https://raw.githubusercontent.com/youzhixiaomutou/grandmaster/main/install.sh | bash
#   curl -fsSL .../install.sh | bash -s -- [target] [--force|--keep] [--ref <ref>]
# 参数：
#   [target]        目标仓库路径（缺省 = 当前目录）
#   --ref <ref>     拉取的分支/标签（缺省 main）
#   --src <dir>     用本地目录作源（离线/开发；跳过下载）
#   --force|--keep  可定制文件覆盖/保留策略（默认交互询问）
set -euo pipefail

REPO="youzhixiaomutou/grandmaster"
TARGET="."; REF="main"; MODE="ask"; SRCDIR=""
while [ $# -gt 0 ]; do
  case "$1" in
    --force) MODE="force" ;;
    --keep)  MODE="keep" ;;
    --ref)   REF="${2:?--ref 需要值}"; shift ;;
    --ref=*) REF="${1#*=}" ;;
    --src)   SRCDIR="${2:?--src 需要值}"; shift ;;
    --src=*) SRCDIR="${1#*=}" ;;
    -h|--help) sed -n '2,15p' "$0" 2>/dev/null || true; exit 0 ;;
    -*) echo "未知参数: $1" >&2; exit 2 ;;
    *)  TARGET="$1" ;;
  esac
  shift
done

# ---- 解析源：本地 --src，或远程拉取 tarball 到临时目录 ----
CLEAN=""
if [ -n "$SRCDIR" ]; then
  SRC="$(cd "$SRCDIR" && pwd)"
else
  command -v curl >/dev/null 2>&1 || { echo "需要 curl" >&2; exit 1; }
  command -v tar  >/dev/null 2>&1 || { echo "需要 tar"  >&2; exit 1; }
  SRC="$(mktemp -d)"; CLEAN="$SRC"
  trap 'rm -rf "$CLEAN"' EXIT
  echo "拉取 Grandmaster@$REF …"
  curl -fsSL "https://github.com/$REPO/archive/$REF.tar.gz" | tar xz --strip-components=1 -C "$SRC"
fi
{ [ -d "$SRC/contracts" ] && [ -d "$SRC/modules" ]; } || { echo "源不含 contracts/modules（拉取失败？）" >&2; exit 1; }

TARGET="$(cd "$TARGET" 2>/dev/null && pwd || true)"
{ [ -n "$TARGET" ] && [ -d "$TARGET" ]; } || { echo "目标不是有效目录" >&2; exit 1; }
[ "$TARGET" = "$SRC" ] && { echo "目标不能是源目录" >&2; exit 1; }
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
