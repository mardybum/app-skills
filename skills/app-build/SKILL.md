---
name: app-build
description: "Bau-Phase für ein App-Projekt: Repo und Projekt aufsetzen (iOS mit XcodeGen und SwiftUI oder Web mit Next.js, Supabase und Vercel), dann Meilenstein für Meilenstein bauen – Logik zuerst als getestetes Paket, Oberfläche auf den Design-Tokens, Selbsttest im Simulator, Commit pro Meilenstein – und danach das Feedback des Users aus seinem eigenen Test einarbeiten. Nutze diesen Skill, wenn jemand sagt 'bau das', 'implementiere', 'GO', 'continue', 'setz das Projekt auf', 'mach weiter mit M3', wenn der User Testfeedback schickt ('Stimme geht gar nicht', 'Live-Scan funktioniert nicht') oder wenn app-builder Phase 4 oder 5 erreicht."
metadata:
  version: 1.0.0
---

# App bauen

Ziel: eine App, die nach jedem Meilenstein läuft, getestet ist und im Repo liegt, damit jede
spätere Session dort weitermachen kann. Grundsatz aus allen Projekten: **erst die Logik mit
Tests, dann die Oberfläche**. Die Engine überlebt jedes Redesign. Die Streak-Engine von askesis
mit 41 Szenario-Tests oder der Deck-Validator von Deck Buddy wurden nie umgebaut, die Screens mehrfach.

## Setup (Meilenstein M0)

1. **Plattform-Referenz lesen:** iOS → `references/ios.md`, Web → `references/web.md`.
2. **Template prüfen:** Gibt es eine eigene App als Vorlage (`app-builder/references/house-setup.md`)?
   Dann übernimm Struktur, Theme und geteilte Pakete; kopiere keine Inhalte.
3. **Repo:** `git init -b main`, `.gitignore`, privates GitHub-Repo
   (`gh repo create mardybum/<name> --private --source . --push`). Gleich am Anfang, nicht am Ende.
4. **`CLAUDE.md`** nach `templates/CLAUDE.md`: Befehle, Aufbau, Konventionen, Stolperfallen.
   Das ist das Gedächtnis für jede spätere Session.
5. **README** mit „Bauen & starten“ und dem Testbefehl.
6. App startet leer im Simulator, Tests laufen (auch wenn es noch keine gibt). Dann der erste Commit.

## Meilenstein-Schleife

Für jeden Meilenstein aus `docs/PLAN.md`:

1. **Logik zuerst:** Engine bzw. Domänenlogik im Paket, mit Szenario-Tests aus Spec und Plan.
   Echte Daten als Testfälle, wo es geht (echte Turnierlisten, echte OCR-Ausgaben).
2. **Oberfläche** nur mit den Tokens und Komponenten aus `DESIGN.md`. Kein Farbwert direkt in einer View.
3. **Inhalte** in echter Qualität. Im MVP wenige, aber echte.
4. **Bauen und testen:** Build ohne Warnungen im eigenen Code, alle Tests grün.
5. **Selbsttest:** Spiel den Kernablauf des Meilensteins durch:
   - iOS: Simulator-Werkzeug (Screenshot, Tippen)
   - Web: Browser-Vorschau
   - Fehler absichtlich provozieren
   - ein Screenshot als Beleg
6. **Status:** `docs/STATUS.md` und die Meilenstein-Tabelle in PLAN.md aktualisieren.
7. **Commit** nach der Commit-Regel. Nachricht: `feat: …` / `fix: …` mit einer Zeile pro
   wichtiger Änderung und den Funden aus dem Selbsttest.
8. **Kurzer Bericht:** was jetzt geht, was geprüft ist, was nicht.

Dann direkt der nächste Meilenstein. Zwischen den Meilensteinen nicht auf Freigabe warten, außer
der Plan sagt es.

## Von Anfang an mitbauen

Nachrüsten war in jedem Projekt teurer als gleich machen:
- **Sprachen:** String Catalogs (`Localizable.xcstrings`) bzw. i18n-Dateien ab dem ersten Text.
  Standardsprache bewusst setzen.
- **Barrierefreiheit:** `accessibilityLabel` an Bildern und Symbolknöpfen; Identifier für UI-Tests
  an wichtigen Elementen.
- **Debug-Startargumente** (nur in Debug-Builds):
  - UI-Test-Modus mit Speicher nur im Arbeitsspeicher und Beispieldaten
  - `-screenshots` mit „gelebtem“ Seed
  - Fake-Kamera für den Simulator, falls die App eine Kamera nutzt
- **Datenschutz:** keine Tracking-SDKs; `PrivacyInfo.xcprivacy` gleich anlegen.
- **Stabile IDs** für Level, Inhalte und gespeicherte Objekte. Fortschritt muss Updates überleben.
- **iOS-Stolperfallen** aus `app-builder/references/lessons.md`: Audio nie auf dem Main-Thread,
  Dateischutz, `TARGETED_DEVICE_FAMILY` pro Target.

## Sprachausgabe (falls die App spricht)

Pipeline aus Lino liest übernehmen (`~/Leseapp/LinoLiest/tools/voice/README.md`):
- jeder gesprochene Satz steht als fester Eintrag in einem Sprachkatalog
- Clips lokal erzeugen und mit Whisper prüfen
- als AAC in die App legen
- ein Test meldet Sätze ohne Aufnahme
- fehlt ein Clip, spricht die Systemstimme
- „KI-generiert“ kennzeichnen

## User-Review (Phase 5)

Wenn der erste testbare Stand da ist (im MVP: der Kernablauf):

1. Starte die App für den User (Simulator-Panel bzw. lokale URL). Gib ihm eine **nummerierte
   Testanleitung** mit 4–6 Punkten: was er antippen soll, was er absichtlich falsch machen soll,
   wo der Testmodus ist.
2. Sein Feedback kommt oft diktiert und gemischt. Sortiere es in **Fehler**, **Bedienung** und
   **Umfang** und bestätige in einem Satz, was du verstanden hast.
3. Fehler und Bedienung sofort beheben. Umfang: einordnen (jetzt, später in den Backlog, gar nicht)
   und bei größeren Erweiterungen kurz nachfragen („macht das Sinn oder ist das überladen?“ –
   gib eine klare Empfehlung).
4. Bei grundlegenden Problemen (Live-Scan geht gar nicht) nicht nachbessern, sondern
   **recherchieren und messen**. Bei Deck Buddy gab es dafür ein Messwerkzeug mit echten
   Kartenbildern und Störungen (Spiegelung, Unschärfe, Dunkelheit), danach den Umbau mit Zahlen
   vorher und nachher.
5. Funktionen, die nur auf dem Gerät gehen, beim User auf dem iPhone testen lassen (Personal Team
   bzw. TestFlight).

## Parallel arbeiten

- Eine Session ändert eine Menge von Dateien. Arbeitet eine zweite Session am selben Projekt,
  absprechen, wer welche Dateien besitzt. Fixes in fremden Dateien als Nachricht übergeben.
- Lesende Aufgaben (Reviews, Recherche) dürfen parallel laufen, siehe Agenten in `app-builder`.

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Meilensteine | 2–4, nur der Kernablauf | alle aus dem Plan |
| Tests | Unit-Tests für die Engine | + Integrations- und UI-Tests je Meilenstein |
| Sprachen | String Catalogs, eine Sprache gefüllt | alle Zielsprachen, Prüfskript |
| Geräte | iPhone-Simulator, ein echtes Gerät | iPhone und iPad, hoch und quer |
| Backend | nur, wenn es der Kern ist | nach `app-infra` mit Staging |
