# House-Styles

Drei erprobte Stile. Im MVP einen davon übernehmen statt neu zu entwerfen; in Production als
eine der drei Richtungen anbieten oder bewusst davon abgrenzen. Die vollständigen Systeme stehen
in den genannten Dateien. Lies sie, bevor du einen Stil übernimmst.

## Pusteblume – Kinder-Apps

- **Quelle:** `~/Leseapp/LinoLiest/DESIGN.md`, `~/Leseapp/ToniTueftelt/DESIGN.md`, Code in KinderKit
- **Leitbild:** sanft, rund und fröhlich. Cremefarbenes Papier, pastellige Flächen, pro Aktion genau eine kräftige Farbe.
- **Farben:**
  - Hintergrund Creme `#FFF8EF`, Text Tinte `#2D2A4A`
  - Familien mit strong / lip / soft / deep: Himmel `#3A86CF`, Minze `#5CC9A7`, Sonne `#FFC857`,
    Koralle `#F06C5B`, Lila `#9B87F5`
- **Schrift:** Fredoka (Bedienung), Andika (Lesetext, einstöckiges a/g), beide unter OFL
- **Formen:**
  - Pillen-Knöpfe mit 5-pt-Lippe, runde Lippen-Knöpfe
  - weiße Karten mit weichem Schatten, Radien 24–36
- **Figuren:** ein Maskottchen aus SwiftUI-Formen (Lino, lila Eule; Toni, Schildkröte) mit
  Jubel-, Denk- und Schlaf-Gesicht und Sprechblase
- **Regeln:** Fehler nie rot, Touch-Ziele ≥ 56 pt, jede Welt hat ihre Farbe, Eltern-Schranke vor Einstellungen und Links
- **Kontrast beachten:** Weiß auf Himmel (`#3A86CF`, 3,8 : 1) und auf Grün (`#2B9A7B`, 3,5 : 1)
  reicht nur für große, fette Schrift (ab 19 px fett). Kleine Texte in der `deep`- bzw. `lip`-Farbe.
- **Passt für:** Vorschule bis Grundschule, Lernen, Familie

## Stoa – Editorial, Fokus, Gewohnheiten

- **Quelle:** `~/projects/stoicHabits/HabitKit/Theme/Theme.swift`, Landingpage `~/projects/stoicHabits/landing/`
- **Leitbild:** schwarz-weiß wie ein Journal. Keine Akzentfarbe; „erledigt“ ist Tinte, „noch nicht“ eine Haarlinie.
- **Farben:**
  - Papier `#F0F1F3`, Fläche `#FFFFFF`, Tinte `#0A0A0A`
  - Grau `#8E8E94`, Haarlinie `#DADCE0`
  - Dunkelmodus `#0B0B0C` / `#161618`
- **Schrift:** System-Sans heavy für Display und Wortmarke (klein geschrieben mit Punkt:
  „askesis.“), New York Serif für Zitate, große Zahl 72 heavy
- **Formen:** Radius 18, Gutter 20, Haarlinien statt Schatten, Ringe als Fortschritt
- **Passt für:** Produktivität, Journal, Wellness, alles „Erwachsene, Ruhige“

## Navy Pro – Werkzeuge und Daten

- **Quelle:** `~/projects/pokedeck/App/DesignSystem/Theme.swift` (Abschnitt „Redesign tokens“), Website `~/projects/pokedeck/website/`
- **Leitbild:** ruhige Flächen, eine Markenfarbe, große Kennzahlen. Rot nur für echte Fehler.
- **Farben:**
  - Navy als Akzent (AccentColor) mit hellem Navy-Ton für Auswahl
  - Hintergrund `#F2F3F5`, Fläche weiß, Einlage `#F7F8FA`, Haarlinie `#E4E7EC`
  - Status: legal grün, unsicher bernstein, nicht legal rot, jeweils mit eigenen Tints
- **Schrift:** in der App System mit gerundeten tabellarischen Zahlen; auf der Website Bricolage
  Grotesque + Geist + Geist Mono (selbst gehostet)
- **Bausteine:**
  - `surfaceCard`, `StatStrip`, `StatusPill`, `InfoBanner`
  - `ProgressLine`, `SectionHeading`, `UnderlineTabs`
  - einheitliches „4×“-Abzeichen
- **Passt für:** Sammler-, Daten- und Profi-Werkzeuge mit vielen Zahlen und Listen

## Eigene Richtung

Passt keiner der Stile, entwirf drei neue Richtungen nach `SKILL.md`. Einer der House-Styles
darf als Vergleich daneben stehen, damit der User sieht, was „neu“ bedeutet.

## Kandidaten aus Testläufen

Entworfen, noch nicht gebaut. Wird einer gewählt und gebaut, bekommt er einen eigenen Abschnitt oben.
Canvas „Uhr-App – Design-Richtungen“: https://claude.ai/artifact/4j4sq3ZZVTaLZX1MnVFhMW

- **Bauklotz:** Papier `#F4F0E8`, Tinte `#1B1B1F`, Blau `#2A5CAA` (Aktion), Gelb `#F2BF2F`
  (vergangene Zeit), Rot `#D84A2B` (nur Stundenzeiger). Schrift Lexend, flach, Ecken 14–18, keine Figur.
  Formen als Sprache (● volle, ◐ halbe Stunde). Für Kinder ab 7 und alle, die Cartoon zu babyhaft finden.
- **Tickhausen:** Papierschnitt-Landschaft, Tageszeit-Farben (Morgen `#CFE6F1`, Abend `#F2B48C`,
  Nacht `#22305E`), Petrol `#1F6E78` als Aktion, Schrift Baloo 2. Eine Geschichte trägt die Aufgaben.
  Teuer im Bau, weil jede Szene illustriert werden muss.
