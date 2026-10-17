#!/usr/bin/env bash
# Verlinkt alle Skills nach ~/.claude/skills und alle Agenten nach ~/.claude/agents.
# Bestehende Dateien, die keine Symlinks sind, werden nicht überschrieben.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SKILLS_TARGET="${CLAUDE_HOME:-$HOME/.claude}/skills"
AGENTS_TARGET="${CLAUDE_HOME:-$HOME/.claude}/agents"
mkdir -p "$SKILLS_TARGET" "$AGENTS_TARGET"

link() { # link <quelle> <ziel>
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    ln -sfn "$src" "$dst"; echo "  ↻ $(basename "$dst")"
  elif [ -e "$dst" ]; then
    echo "  ⚠️  $(basename "$dst") existiert schon und ist kein Symlink – übersprungen"
  else
    ln -s "$src" "$dst"; echo "  + $(basename "$dst")"
  fi
}

echo "Skills → $SKILLS_TARGET"
for dir in "$ROOT"/skills/*/; do
  name="$(basename "$dir")"
  link "${dir%/}" "$SKILLS_TARGET/$name"
done

echo "Agenten → $AGENTS_TARGET"
for file in "$ROOT"/agents/*.md; do
  link "$file" "$AGENTS_TARGET/$(basename "$file")"
done

echo "Fertig. Neue Claude-Code-Sessions sehen die Skills und Agenten."
