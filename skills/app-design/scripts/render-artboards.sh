#!/usr/bin/env bash
# Renders design-canvas artboards (.dc.html) to PNG, e.g. for design-critic or before/after.
# Usage: bash render-artboards.sh <canvas-folder-with-project/> <out-folder> [name ...]
#   Without names every artboard in project/canvas.json is rendered; size comes from "w"/"h" in the index.
# Needs Google Chrome or Playwright's headless Chromium (~/Library/Caches/ms-playwright).
set -uo pipefail

root="${1:?canvas folder missing}"; out="${2:?out folder missing}"; shift 2
project="$root/project"
[ -f "$project/canvas.json" ] || { echo "No $project/canvas.json"; exit 1; }
mkdir -p "$out"

chrome=""
for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
         $(ls -d "$HOME"/Library/Caches/ms-playwright/chromium_headless_shell-*/chrome-headless-shell-mac-*/chrome-headless-shell 2>/dev/null | sort -r); do
  [ -x "$c" ] && { chrome="$c"; break; }
done
[ -n "$chrome" ] || { echo "No Chrome/Chromium found (npx playwright install chromium-headless-shell)"; exit 1; }

# read name and size from the index
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
