#!/usr/bin/env bash
# Prüft Skills und Agenten: Frontmatter, Namen, Länge, Verweise auf references/ und templates/.
set -uo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
fail=0; warn=0
err()  { echo "  ❌ $1"; fail=$((fail + 1)); }
note() { echo "  ⚠️  $1"; warn=$((warn + 1)); }

frontmatter() { awk '/^---$/{c++; if (c==2) exit; next} c==1' "$1"; }
field() { frontmatter "$1" | grep -E "^$2:" | head -1 | sed -E "s/^$2:[[:space:]]*//; s/^\"//; s/\"$//"; }

for skill in "$ROOT"/skills/*/SKILL.md; do
  dir="$(dirname "$skill")"; dname="$(basename "$dir")"
  echo "Skill: $dname"
  head -1 "$skill" | grep -q '^---$' || { err "kein Frontmatter"; continue; }
  name="$(field "$skill" name)"; desc="$(field "$skill" description)"
  [ "$name" = "$dname" ] || err "name '$name' ≠ Ordner '$dname'"
  echo "$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$' || err "name ist nicht kebab-case"
  [ -n "$desc" ] || err "description fehlt"
  [ "${#desc}" -le 1024 ] || err "description hat ${#desc} Zeichen (max. 1024)"
  frontmatter "$skill" | grep -qE '^[[:space:]]+version:' || err "metadata.version fehlt"
  lines=$(wc -l < "$skill" | tr -d ' ')
  [ "$lines" -lt 500 ] || err "SKILL.md hat $lines Zeilen (max. 499)"
  # Verweise: "references/x.md" im eigenen Skill, "app-foo/references/x.md" in einem anderen
  for ref in $(grep -oE '(app-[a-z]+/)?(references|templates|scripts)/[A-Za-z0-9._-]+(\.(md|yml|sh|json)|pre-commit)' "$skill" | sort -u); do
    case "$ref" in
      app-*) [ -e "$ROOT/skills/$ref" ] || err "Verweis fehlt: $ref" ;;
      *)     [ -e "$dir/$ref" ] || err "Verweis fehlt: $ref" ;;
    esac
  done
  echo "  ✓ ${#desc} Zeichen Beschreibung, $lines Zeilen"
done

for agent in "$ROOT"/agents/*.md; do
  aname="$(basename "$agent" .md)"
  echo "Agent: $aname"
  head -1 "$agent" | grep -q '^---$' || { err "kein Frontmatter"; continue; }
  [ "$(field "$agent" name)" = "$aname" ] || err "name ≠ Dateiname"
  [ -n "$(field "$agent" description)" ] || err "description fehlt"
  echo "  ✓"
done

# Erwähnte Agenten müssen existieren
for a in $(grep -rhoE '`(app-researcher|persona-tester|domain-expert|design-critic|qa-engineer|release-auditor)`' "$ROOT/skills" | tr -d '`' | sort -u); do
  [ -f "$ROOT/agents/$a.md" ] || err "Agent erwähnt, aber nicht vorhanden: $a"
done

# Keine Schlüssel im Repo
if grep -rEn 'xkeysib-[A-Za-z0-9]{20,}|AIza[0-9A-Za-z_-]{35}|sk-ant-[A-Za-z0-9_-]{20,}' "$ROOT/skills" "$ROOT/agents" >/dev/null; then
  err "möglicher Schlüssel in den Dateien"
fi

echo
echo "Fehler: $fail · Hinweise: $warn"
[ "$fail" -eq 0 ]
