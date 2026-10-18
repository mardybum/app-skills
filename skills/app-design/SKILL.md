---
name: app-design
description: "Design-Phase für Apps und Landingpages: drei klar unterschiedliche Designrichtungen auf einem Design-Canvas entwerfen, den User wählen lassen, verfeinern, als DESIGN.md mit Tokens und Komponenten festschreiben, in den Code übernehmen und gegen Screenshots prüfen. Mit konkreten Regeln gegen den generischen KI-Look (kein 'AI-Orange', keine Emoji-Bedienung, keine Kachel-Raster). Nutze diesen Skill immer, wenn jemand ein neues App-Design, ein Redesign, ein App-Icon, ein Design-System oder 'geiles, cleanes, professionelles' Aussehen will, wenn eine App 'nach KI aussieht', bei 'öffne deinen Designer', 'mach mir drei Vorschläge' oder wenn app-builder Phase 3 erreicht – auch für Landingpages im App-Stil."
metadata:
  version: 1.1.0
---

# App-Design

Ziel: ein eigenständiger, hochwertiger Look mit klarer Haltung, der zur Zielgruppe passt und
sich durch die ganze App zieht. Was bisher funktioniert hat:
- **Lino liest:** drei Richtungen, der User wählte „Pusteblume“ (sanft, rund, fröhlich)
- **askesis:** schwarz-weiß editorial wie ein Journal
- **Deck Buddy:** Navy auf ruhigen Flächen mit großen Kennzahlen

Was nicht funktioniert hat: das typische „AI-Orange“, freie Entwürfe ohne Bezug zur bestehenden
App, und erst bauen, dann gestalten.

Ergebnis: Design-Canvas mit den Richtungen, `DESIGN.md` im Repo-Root (Vorlage `templates/DESIGN.md`),
Tokens im Code, geprüfte Screens.

Lies vor dem Entwerfen `references/principles.md`. Bei Kinder-, Editorial- oder Werkzeug-Apps
lies auch `references/house-styles.md`; vielleicht passt ein bestehender Stil.

## Ablauf

### 1. Kontext klären (ohne den User zu löchern)
- Zielgruppe und Ton in **drei Adjektiven** (z. B. „sanft, rund, fröhlich“, „ruhig, klar, ernst“).
  Steht meist schon in BRIEF.md oder der Nachricht des Users.
- Vorbilder und **Anti-Vorbilder** („nicht dieses typische AI-Orange“, „nicht bunt-plastikhaft“).
- **Bei einem Redesign zuerst die aktuellen Screens ansehen** (Screenshots im Simulator) und
  darauf aufbauen. Bei Deck Buddy hat der User freie Entwürfe verworfen und erst den Umbau auf
  Basis der bestehenden Seiten freigegeben.
- Plattformkonventionen: iOS Human Interface Guidelines (Tab-Leiste, Sheets, SF Symbols, Dynamic Type).

### 2. Drei Richtungen entwerfen
Jede Richtung ist eine **echte Alternative**: ein Look **plus eine Idee**, nicht drei Farbvarianten.
Die stärksten Richtungen im Testlauf (Uhr-App) kamen aus den Leitlinien der Analyse:
- „Zeit als Fläche“: Die vergangenen Minuten werden gelb.
- „Die Uhrzeit verändert die Welt“: eine Turmuhr im Dorf, Licht und Sonne wandern mit.

Pro Richtung:
- **Name, Leitbild und Idee** in je einem Satz („Bauklotz – klar, geometrisch; Zeit als Fläche“)
- **Figur oder keine:** Maskottchen, Dorfbewohner oder reine Grafik. Das ist Teil der Richtung,
  und eine Template-App bringt ihre eigene Figur mit, die nicht übernommen wird.
- **Palette:** Neutraltöne für Hintergrund und Text, **eine** Akzentfarbe für Aktionen,
  bei Bedarf Inhaltsfarben (Welten, Kategorien) – mit Hex-Werten
- **Typografie:** höchstens zwei Familien mit Charakter, passend zum Ton (Beispiele in house-styles.md)
- **Formensprache:** Radien, Linien statt Schatten oder Schatten statt Linien, Knopfstil, Illustrationen

**Artboards pro Richtung für die Wahl** (vier reichen; 15 wären zu viel, um zu entscheiden):
1. **Start** bzw. Übersicht
2. **Kernaufgabe auf dem Hauptgerät.** Bei Kinder-Apps ist das meist das iPad (1180 × 820 quer), sonst das iPhone (390 × 844).
3. **Rückmeldung bei einem Fehler.** Dort zeigt sich, ob die Richtung freundlich erklären kann.
4. **Stil-Blatt:** Palette, Schrift, Knöpfe, 3 Prinzipien. Daraus entsteht später direkt die DESIGN.md.

Leere Zustände, Erfolg und Einstellungen folgen erst beim Verfeinern der gewählten Richtung (Schritt 4).
Inhalte sind echt, keine Platzhaltertexte.

**Wo:** Wenn das Artifact-Tool da ist, `quickstart` mit `intent: "design"` und eine Reihe pro
Richtung (A, B, C) mit Titelnotiz. Sonst eine lokale HTML-Datei mit Handy-Rahmen im Browser-Pane.
Die Canvas-Dateien bleiben im Scratchpad. Den Link zum Canvas trägst du in `STATUS.md` und
später in `DESIGN.md` ein.

Im Modus **MVP** reicht eine Richtung oder ein House-Style. Will der User trotzdem Vorschläge
sehen, entwirf drei Richtungen mit genau diesen vier Artboards. Tokens immer zentral anlegen.

### 3. Der User wählt (Gate)
Zeige ihm pro Richtung:
- die Idee
- warum sie zur Zielgruppe passt
- was sie im Bau kostet: House-Style mit KinderKit ist schnell; Illustrationen pro Uhrzeit oder Szene sind teuer

Dazu **eine** Empfehlung passend zum Modus (im MVP zählt der Aufwand). Er darf mischen
(„A, aber mit der Fläche aus B“). Baue nichts ein, bevor er gewählt hat. Bei Vorschlägen ohne
Einbau gilt: „nicht committen, nicht pushen“.

Vor dem Gate prüft der User selbst. Mach keine eigenen Screenshot-Prüfungen des Canvas, denn der
Design-Typ verbietet ungefragtes Prüfen. Biete `design-critic` an, wenn der User eine zweite
Meinung will.

### 4. Verfeinern
Die gewählte Richtung bekommt alle Zustände:
- gedrückt, deaktiviert, ausgewählt, Fehler, Laden, leer, Erfolg
- Dunkelmodus (sofern nicht bewusst ausgeschlossen)
- große Schrift (Dynamic Type bis AX), Kontrast nach WCAG AA
- iPad hoch und quer: wachsen statt Handy-Spalte, siehe `kidScale` in KinderKit
- App-Icon-Skizzen: drei Varianten, auf hellem und dunklem Hintergrund, in 60 px Größe lesbar

### 5. DESIGN.md schreiben
Sie ist die Quelle der Wahrheit für jede spätere Session. Nach `templates/DESIGN.md`:
- Leitbild und 5–7 **prüfbare** Prinzipien („Fehler sind nie rot“, „eine kräftige Farbe pro Aktion“)
- Tokens: Farben (Hex, Rolle), Typo-Skala, Abstände, Radien, Schatten bzw. Linien, Bewegung
- Komponenten mit Namen, wie sie im Code heißen
- Ton der Texte
- Do und Don't, Verweis auf den Canvas

### 6. Tokens in den Code, dann Screens
- Eine Quelle: `Theme.swift` (Farben als adaptive Light/Dark-Werte, Fonts, Radien) bzw.
  CSS-Variablen. Komponenten als Styles (`PrimaryButtonStyle`, `.card()`, `surfaceCard`).
- Keine Farbwerte direkt in Views. Prüfe mit `grep -rnE 'Color\(red:|#[0-9A-Fa-f]{6}' <App>/Views`.
  Treffer außerhalb der Theme-Datei sind Fehler.
- Screen für Screen umsetzen. Nach jedem Screen ein Simulator-Screenshot neben dem Artboard;
  Abweichungen sofort beheben.
- Schriften liegen in der App bzw. auf der Website selbst gehostet; OFL-Lizenzdatei beilegen.

### 7. Review
- `design-critic` mit Screenshots in:
  - hell und dunkel
  - kleinem iPhone, großem iPhone und iPad
  - großer Schrift

  Dazu die Pfade zu `DESIGN.md` und zu `references/principles.md`. Der Agent liefert Funde
  mit Schwere. Du behebst sie und machst neue Screenshots.
- Landingpages: zusätzlich `/design-review` (gstack). Bei askesis hat das 14 Funde ergeben,
  jeder wurde einzeln committet.
- Am Ende zeigst du dem User Vorher/Nachher-Screenshots der wichtigsten Screens.

### 8. App-Icon
- Aus dem Design-System, ein klares Motiv, kein Text, keine geschützten Figuren oder Logos.
- 1024 × 1024 **ohne Alphakanal**.
- Lesbar in 60 px und auf einem bunten Hintergrundbild.
- Rendern per Skript, damit es reproduzierbar bleibt (siehe `house-setup.md`).

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Richtungen | 1 oder House-Style; auf Wunsch 3 × 4 Artboards | 3 × 4 Artboards, Wahl durch den User |
| Zustände | Kernablauf | alle, inkl. Dunkelmodus, große Schrift, iPad |
| DESIGN.md | kurz: Leitbild, Tokens | vollständig |
| Review | eigener Screenshot-Vergleich | `design-critic`, `/design-review` für Web |
| Icon | Platzhalter in Akzentfarbe | drei Varianten, Wahl durch den User |
