#!/usr/bin/env bash
# Baut ein Vorher/Nachher-Bild aus zwei Screenshot-Ordnern (gleiche Dateinamen).
# Aufruf: bash compare.sh <vorher-ordner> <nachher-ordner> <ausgabe.png> Name [Name ...]
set -uo pipefail

before="$(cd "${1:?vorher fehlt}" && pwd)"; after="$(cd "${2:?nachher fehlt}" && pwd)"; out="${3:?Ausgabe fehlt}"; shift 3
[ "$#" -gt 0 ] || { echo "Mindestens ein Name (ohne .png)"; exit 1; }

chrome=""
for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
         $(ls -d "$HOME"/Library/Caches/ms-playwright/chromium_headless_shell-*/chrome-headless-shell-mac-*/chrome-headless-shell 2>/dev/null | sort -r); do
  [ -x "$c" ] && { chrome="$c"; break; }
done
[ -n "$chrome" ] || { echo "Kein Chrome/Chromium gefunden"; exit 1; }

html="$(mktemp -t vergleich).html"
{
  echo '<!doctype html><html lang="de"><head><meta charset="utf-8"><style>'
  echo 'body{margin:0;background:#EFE8DC;font-family:-apple-system,sans-serif;color:#2D2A4A}'
  echo '.row{display:flex;gap:28px;padding:24px 28px;align-items:flex-start}.col{display:flex;flex-direction:column;gap:8px;align-items:center}'
  echo 'h2{margin:0;font-size:20px}img{width:390px;border-radius:18px;box-shadow:0 2px 10px rgba(0,0,0,.12)}</style></head><body><div class="row">'
  for n in "$@"; do
    echo "<div class=\"col\"><h2>Vorher · $n</h2><img src=\"file://$before/$n.png\"></div>"
    echo "<div class=\"col\"><h2>Nachher · $n</h2><img src=\"file://$after/$n.png\"></div>"
  done
  echo '</div></body></html>'
} > "$html"

width=$(( 56 + $# * 2 * 418 )); height=980
"$chrome" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --allow-file-access-from-files \
  --window-size="$width,$height" --virtual-time-budget=3000 --screenshot="$out" "file://$html" >/dev/null 2>&1 \
  && echo "✓ $out" || echo "❌ Vergleich fehlgeschlagen"
rm -f "$html"
