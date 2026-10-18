#!/usr/bin/env bash
# Checks skills and agents: frontmatter, names, length, references to files, mentioned agents, keys.
set -uo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
fail=0
err() { echo "  ❌ $1"; fail=$((fail + 1)); }

frontmatter() { awk '/^---$/{c++; if (c==2) exit; next} c==1' "$1"; }
field() { frontmatter "$1" | grep -E "^$2:" | head -1 | sed -E "s/^$2:[[:space:]]*//; s/^\"//; s/\"$//"; }

for skill in "$ROOT"/skills/*/SKILL.md; do
  dir="$(dirname "$skill")"; dname="$(basename "$dir")"
  echo "Skill: $dname"
  head -1 "$skill" | grep -q '^---$' || { err "no frontmatter"; continue; }
  name="$(field "$skill" name)"; desc="$(field "$skill" description)"
  [ "$name" = "$dname" ] || err "name '$name' ≠ folder '$dname'"
  echo "$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$' || err "name is not kebab-case"
  [ -n "$desc" ] || err "description missing"
  [ "${#desc}" -le 1024 ] || err "description has ${#desc} characters (max 1024)"
  frontmatter "$skill" | grep -qE '^[[:space:]]+version:' || err "metadata.version missing"
  lines=$(wc -l < "$skill" | tr -d ' ')
  [ "$lines" -lt 500 ] || err "SKILL.md has $lines lines (max 499)"
  # references/x in this skill, app-foo/references/x in another skill
  for ref in $(grep -oE '(app(-[a-z]+)?/)?(references|templates|scripts)/[A-Za-z0-9._-]+(\.(md|yml|sh|json)|pre-commit)' "$skill" | sort -u); do
    case "$ref" in
      app*/*) [ -e "$ROOT/skills/$ref" ] || err "missing reference: $ref" ;;
      *)      [ -e "$dir/$ref" ] || err "missing reference: $ref" ;;
    esac
  done
  echo "  ✓ ${#desc}-character description, $lines lines"
done

for agent in "$ROOT"/agents/*.md; do
  aname="$(basename "$agent" .md)"
  echo "Agent: $aname"
  head -1 "$agent" | grep -q '^---$' || { err "no frontmatter"; continue; }
  [ "$(field "$agent" name)" = "$aname" ] || err "name ≠ file name"
  [ -n "$(field "$agent" description)" ] || err "description missing"
  for path in $(grep -oE '~/.claude/skills/[A-Za-z0-9/._-]+' "$agent" | sort -u); do
    rel="${path#\~/.claude/skills/}"
    [ -e "$ROOT/skills/$rel" ] || err "missing path: $path"
  done
  echo "  ✓"
done

for a in $(grep -rhoE '`(app-researcher|persona-tester|domain-expert|design-critic|qa-engineer|release-auditor)`' "$ROOT/skills" | tr -d '`' | sort -u); do
  [ -f "$ROOT/agents/$a.md" ] || err "agent mentioned but missing: $a"
done

if grep -rEn 'xkeysib-[A-Za-z0-9]{20,}|AIza[0-9A-Za-z_-]{35}|sk-ant-[A-Za-z0-9_-]{20,}' "$ROOT/skills" "$ROOT/agents" >/dev/null; then
  err "possible key in the files"
fi

echo
echo "Errors: $fail"
[ "$fail" -eq 0 ]
