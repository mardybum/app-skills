# App-Video und Reels

Vorbilder:
- Deck Buddy: `Scripts/app-video.sh`, `UITests/AppVideoTests`, `Scripts/video-cut.py`,
  `Scripts/reels.py`, `Scripts/reels/frames.swift`
- askesis: `scripts/app-video.sh`, `AskesisUITests` mit dem Schema `AskesisVideo`, `scripts/reels.py`, `scripts/reel-texts.py`

## App-Video

1. **Drehbuch:** 6–8 Kapitel, je ein Kernablauf (z. B. Scannen, Deck um eine Karte, Liga-Check,
   Einkaufszettel). Pro Kapitel ein UI-Test mit ruhigem Tempo (kurze Pausen auf Ergebnissen).
2. **Daten:** Seed mit gelebtem Zustand; Fake-Kamera für Kamera-Kapitel (nur Debug).
3. **Aufnahme:** `xcrun simctl io <device> recordVideo` pro Kapitel. Vorher störende Simulatoren
   herunterfahren und die Statusleiste setzen (`xcrun simctl status_bar … override --time 9:41`).
4. **Schnitt:** `video-cut.py` kürzt Standbilder, fügt Kapitel zusammen und schreibt Kapitelzeiten.
5. **Ausgabe:** MP4 (H.264) und ein Vorschaubild pro Sprache.

## Reels

- 1080 × 1920, 30 fps, stille Tonspur (die Plattformen legen Musik darunter)
- pro Reel: Überschrift oben, Handy mit Ausschnitt, Abschlusstafel (Name, Link, Launch-Aufruf,
  bei Fan-Apps der Hinweis „inoffiziell“)
- 5–8 Reels pro Sprache: je ein Feature plus ein Überblick
- Cover-PNG und Bildunterschriften als Textdatei

## Ablage

- Google Drive: `~/Google Drive/Meine Ablage/Marketing/<App>/` (bei Lino unter `Videos`)
- öffentliche Kopie unter `website/video/` für Metricool
- große Videos nicht doppelt ins Repo, wenn sie schon auf der Website liegen
