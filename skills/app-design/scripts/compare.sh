#!/usr/bin/env bash
# Builds a before/after image from two screenshot folders (same file names).
# Usage: bash compare.sh <before-folder> <after-folder> <out.png> name [name ...]
set -uo pipefail

before="$(cd "${1:?before folder missing}" && pwd)"; after="$(cd "${2:?after folder missing}" && pwd)"; out="${3:?out file missing}"; shift 3
[ "$#" -gt 0 ] || { echo "At least one name (without .png)"; exit 1; }

chrome=""
for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
         $(ls -d "$HOME"/Library/Caches/ms-playwright/chromium_headless_shell-*/chrome-headless-shell-mac-*/chrome-headless-shell 2>/dev/null | sort -r); do
  [ -x "$c" ] && { chrome="$c"; break; }
done
[ -n "$chrome" ] || { echo "No Chrome/Chromium found"; exit 1; }

html="$(mktemp -t compare).html"
{
  echo '<!doctype html><html lang="en"><head><meta charset="utf-8"><style>'
  echo 'body{margin:0;background:#EFE8DC;font-family:-apple-system,sans-serif;color:#2D2A4A}'
  echo '.row{display:flex;gap:28px;padding:24px 28px;align-items:flex-start}.col{display:flex;flex-direction:column;gap:8px;align-items:center}'
  echo 'h2{margin:0;font-size:20px}img{width:390px;border-radius:18px;box-shadow:0 2px 10px rgba(0,0,0,.12)}</style></head><body><div class="row">'
  for n in "$@"; do
    echo "<div class=\"col\"><h2>Before · $n</h2><img src=\"file://$before/$n.png\"></div>"
    echo "<div class=\"col\"><h2>After · $n</h2><img src=\"file://$after/$n.png\"></div>"
  done
  echo '</div></body></html>'
} > "$html"

width=$(( 56 + $# * 2 * 418 )); height=980
"$chrome" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --allow-file-access-from-files \
  --window-size="$width,$height" --virtual-time-budget=3000 --screenshot="$out" "file://$html" >/dev/null 2>&1 \
  && echo "✓ $out" || echo "❌ comparison failed"
rm -f "$html"
