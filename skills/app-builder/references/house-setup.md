# Gemeinsame Infrastruktur aller Apps

Was schon existiert und wiederverwendet wird. Vor dem Anlegen von Konten, Projekten oder Diensten
hier nachsehen. Pfade und Kennungen vorher prüfen; sie können sich geändert haben.

## Konten und Dienste

| Dienst | Stand | Hinweis |
|---|---|---|
| GitHub | Konto `mardybum`, alle App-Repos privat | `gh repo create mardybum/<name> --private --source . --push` |
| Apple Developer Program | bezahltes Team `JTF9P5K777` | Ein Konto für alle Apps. In `project.yml` als `DEVELOPMENT_TEAM` |
| Bundle-IDs | Präfix `de.rudall` (Lino, Toni) | Deck Buddy nutzt `de.yanrudall.pokedeck`. Für neue Apps `de.rudall.<app>` |
| Supabase | ein geteiltes Projekt in Frankfurt, Ref `unrfqwmvsaoishifbwrd` | Tabellen und Funktionen mit App-Präfix (`lino_`, `askesis_`, `pokedeck_`). In Production prüfen, ob ein eigenes Projekt oder Staging nötig ist (`app-infra`) |
| Brevo | Double-Opt-in-Mails und Listen | Den API-Schlüssel setzt der User selbst als Secret |
| Vercel | ein Projekt pro Website, Domain `<app>.vercel.app` | Hablamos deployt per Hook aus dem CI; Landingpages per `vercel deploy --prod` |
| Google Drive | `~/Google Drive/Meine Ablage/Marketing/<App>/` | Fertige Videos und Reels kommen immer dorthin |
| Metricool | Social-Media-Planung | Braucht öffentliche Video-URLs (Website) |

## Vorlagen-Repos

| Für | Vorlage | Pfad |
|---|---|---|
| Kinder-App (iOS) | Toni tüftelt + KinderKit (Design, Stimme, Speicher, Eltern-Schranke, Lernpfad) | `~/Leseapp/ToniTueftelt` |
| Kinder-App mit Lesen | Lino liest | `~/Leseapp/LinoLiest` |
| Werkzeug- und Daten-App (iOS) | Deck Buddy: Swift-Paket mit Modulen, Datenpipeline, Scanner, Konten, Sync | `~/projects/pokedeck` |
| Habit- und Journal-App (iOS) | askesis: Engine-Paket, Widgets, App Intents, App Group | `~/projects/stoicHabits` |
| Web-SaaS | Hablamos: Next.js, Supabase-Auth, RLS, Stripe, i18n, CI | `~/projects/hablamos-app` |

## Bewährte Skripte zum Kopieren

| Zweck | Quelle |
|---|---|
| Release-Archiv und Upload | `~/projects/pokedeck/Scripts/archive.sh`, `~/projects/stoicHabits/scripts/release/` |
| Bezahltes Team eintragen | `~/projects/pokedeck/Scripts/use-paid-team.sh` |
| Kontaktdaten überall ersetzen | `~/projects/pokedeck/Scripts/fill-contact.py` |
| Store-Screenshots | `~/projects/pokedeck/Scripts/screenshots.sh`, `~/projects/stoicHabits/scripts/appstore/screenshots.swift`, `~/Leseapp/ToniTueftelt/ToniTueftelUITests/AppStoreScreenshots.swift` |
| App-Video aus dem Simulator | `~/projects/pokedeck/Scripts/app-video.sh` + `video-cut.py`, gleiche Dateien in askesis |
| Reels 1080×1920 | `~/projects/pokedeck/Scripts/reels.py` + `reels/frames.swift`, askesis `scripts/reels.py` + `reel-texts.py` |
| UI-Tests als Skript | `~/projects/pokedeck/Scripts/run-ui-tests.sh` |
| Übersetzungen prüfen | `~/projects/pokedeck/Scripts/l10n/` (bricht bei fehlenden Übersetzungen ab) |
| Website mit DE/EN bauen | `~/projects/pokedeck/Scripts/website/build.py` |
| App-Icon rendern | `~/Leseapp/ToniTueftelt/tools/icon/`, `~/projects/stoicHabits/scripts/make_app_icon.swift` |
| Lokaler Website-Server | `~/Leseapp/ToniTueftelt/tools/serve_site.py` |

## Stimme (Sprachausgabe)

- Pipeline: `~/Leseapp/LinoLiest/tools/voice/README.md`. Qwen3-TTS (Apache 2.0) läuft lokal über
  mlx-audio, die Stimme entsteht per VoiceDesign, Whisper prüft die Qualität.
- Die Clips werden vorab erzeugt und liegen in der App: offline, ohne laufende Kosten.
- Modelle und venv teilen sich Lino und Toni. Neue Sätze laufen über den Sprachkatalog;
  ein Test meldet Ausgaben ohne Aufnahme.
- In der App immer als „KI-generiert“ kennzeichnen.

## Reverse Engineering

- REA liegt geklont unter `~/Leseapp/rea`, der Skill heißt `reverse-engineer-anything`.
- Bisher untersucht:
  - ANTON (Web, CDP)
  - Scratch-Editor (Browser-Szenario)
  - Streaks.app (Mach-O, Swift-Metadaten, Strings)
- Auf diesem Mac gibt es keinen Decompiler (Ghidra fehlt). Vor einer Installation fragen.

## Rechtstexte

- Impressum und Datenschutz liegen fertig in `~/Leseapp/LinoLiest/website/impressum.html` und
  `datenschutz.html` sowie in der Deck-Buddy-Website. Kontaktdaten von dort übernehmen und
  nicht neu abfragen. Die Daten nicht in Skills oder Docs kopieren.
- Datenschutz-Bausteine: Warteliste (Supabase, Brevo), Hosting (Vercel), App selbst (erhebt nichts).
