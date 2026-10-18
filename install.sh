#!/usr/bin/env bash
# Symlinks all skills into ~/.claude/skills and all agents into ~/.claude/agents.
# Removes stale links that point into this repo (e.g. renamed skills). Never overwrites real files.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SKILLS_TARGET="${CLAUDE_HOME:-$HOME/.claude}/skills"
AGENTS_TARGET="${CLAUDE_HOME:-$HOME/.claude}/agents"
mkdir -p "$SKILLS_TARGET" "$AGENTS_TARGET"

# 1. Remove stale links into this repo
for link in "$SKILLS_TARGET"/* "$AGENTS_TARGET"/*; do
  [ -L "$link" ] || continue
  target="$(readlink "$link")"
  case "$target" in
    "$ROOT"/*) [ -e "$target" ] || { rm "$link"; echo "  − $(basename "$link") (stale)"; } ;;
  esac
done

link() { # link <source> <target>
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    ln -sfn "$src" "$dst"; echo "  ↻ $(basename "$dst")"
  elif [ -e "$dst" ]; then
    echo "  ⚠️  $(basename "$dst") exists and is not a symlink – skipped"
  else
    ln -s "$src" "$dst"; echo "  + $(basename "$dst")"
  fi
}

echo "Skills → $SKILLS_TARGET"
for dir in "$ROOT"/skills/*/; do
  link "${dir%/}" "$SKILLS_TARGET/$(basename "$dir")"
done

echo "Agents → $AGENTS_TARGET"
for file in "$ROOT"/agents/*.md; do
  link "$file" "$AGENTS_TARGET/$(basename "$file")"
done

echo "Done. New Claude Code sessions see the skills and agents."
