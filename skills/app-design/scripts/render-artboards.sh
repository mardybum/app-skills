#!/usr/bin/env bash
# Rendert Artboards eines Design-Canvas (.dc.html) als PNG, z. B. für design-critic oder Vorher/Nachher.
# Aufruf: bash render-artboards.sh <canvas-ordner-mit-project/> <ausgabe-ordner> [Name ...]
#   Ohne Namen werden alle Artboards aus project/canvas.json gerendert; Größe aus "w"/"h" im Index.
# Braucht Google Chrome oder den Headless-Chromium von Playwright (~/Library/Caches/ms-playwright).
set -uo pipefail

root="${1:?Canvas-Ordner fehlt}"; out="${2:?Ausgabe-Ordner fehlt}"; shift 2
project="$root/project"
[ -f "$project/canvas.json" ] || { echo "Kein $project/canvas.json"; exit 1; }
mkdir -p "$out"

chrome=""
for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
         $(ls -d "$HOME"/Library/Caches/ms-playwright/chromium_headless_shell-*/chrome-headless-shell-mac-*/chrome-headless-shell 2>/dev/null | sort -r); do
  [ -x "$c" ] && { chrome="$c"; break; }
done
[ -n "$chrome" ] || { echo "Kein Chrome/Chromium gefunden (npx playwright install chromium-headless-shell)"; exit 1; }

# Name und Größe aus dem Index lesen
boards="$(python3 -I - "$project/canvas.json" "$@" <<'EOF'
import json, sys
index = json.load(open(sys.argv[1]))
wanted = sys.argv[2:]
for name, b in index["boards"].items():
    stem = name[:-len(".dc.html")] if name.endswith(".dc.html") else name
    if not wanted or stem in wanted or name in wanted:
        print(name, int(b["w"]), int(b["h"]))
EOF
)"

while read -r name w h; do
  [ -n "$name" ] || continue
  png="$out/${name%.dc.html}.png"
  "$chrome" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --window-size="$w,$h" --virtual-time-budget=5000 --screenshot="$png" "file://$project/$name" >/dev/null 2>&1 \
    && echo "  ✓ $png ($w × $h)" || echo "  ❌ $name"
done <<< "$boards"
