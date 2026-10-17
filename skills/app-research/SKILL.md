---
name: app-research
description: "Recherche-Phase für ein App-Projekt: Vorbild-App per REA reverse engineeren (nur öffentlich Zugängliches), Konkurrenz und Rezensionen auswerten, Fachwissen (Regelwerke, Standards, Studien) sammeln und Machbarkeits-Spikes mit echten Daten fahren. Ergebnis ist docs/ANALYSE.md mit Evidenz, Schwächen der Konkurrenz und Leitlinien für die eigene App. Nutze diesen Skill, wenn jemand sagt 'reverse engineer X', 'schau dir an, was ANTON/Scratch/Streaks macht', 'was gibt es schon am Markt', 'ist das technisch machbar', 'welche Datenquelle gibt es' oder wenn app-builder Phase 1 erreicht."
metadata:
  version: 1.1.0
---

# App-Recherche

Ziel: verstehen, was es schon gibt, wo die Lücke ist und ob der Kern technisch trägt, bevor ein
Plan entsteht. Bei Lino liest kamen die besten Ideen aus den Schwächen von ANTON (Zeitdruck, rote
Fehler, hört nicht zu). Bei Deck Buddy hat ein Spike mit echten Daten gezeigt, dass das
Legal-Feld der Datenquelle für alte Drucke falsch ist; ohne Spike wäre das erst im Test aufgefallen.

Ergebnis: `docs/ANALYSE.md` nach `templates/ANALYSE.md`.

## Ablauf

### 1. Vorbild reverse engineeren (wenn es eins gibt)
- Nutze den Skill `reverse-engineer-anything` (REA unter `~/Leseapp/rea`). Web-Apps: Bundle- und
  Seitenanalyse, Browser-Szenario. Mac- und iOS-Apps: Mach-O-Symbole, Swift-Metadaten, Strings, Core-Data-Modell.
- **Nur öffentlich Zugängliches:** kein Login umgehen, robots.txt beachten.
- **Nichts übernehmen außer Ideen:** keine Texte, Bilder, Audios oder Code.
- Den rechtlichen Rahmen schreibst du oben in die Analyse.
- Halte Befunde mit Evidenz-ID fest. Was du bewusst nicht untersucht hast, gehört ebenfalls in die Analyse.
- Ist ein Werkzeug nicht installiert (z. B. ein Decompiler), frag vor der Installation.

### 2. Konkurrenz und Schwächen
- 3 Apps (MVP) bis 6 Apps (Production): Kernfunktionen, Geschäftsmodell, Bewertung, Zielgruppe.
- **Schwächen** aus Rezensionen, Presse und Fachkritik. Sie sind die wichtigste Zutat für die
  eigene Positionierung. Quellen, die funktionieren:
  - App-Store-Seite im Browser-Pane (die Rezensionen stehen unter „Bewertungen und Rezensionen“)
  - Blogtests (z. B. appgefahren), Vergleichsseiten
  - Eltern-, Lehrkräfte- und Spielerforen, Reddit, Discord-Communities
  - Presse und Fachkritik (Medienpädagogik, Testberichte)
- **Belegt oder dünn belegt?** Markiere jede Schwäche. Herstellerangaben sind keine Belege. Eine
  dünne Lage schreibst du offen hin, statt Schwächen zu erfinden.
- Pro App eine Zeile „übernommen als Idee“: was wir besser oder anders machen.

### 3. Fachwissen
Je nach Domäne:
- Regelwerke (Turnier-Handbuch, Rotation)
- Bildungsstandards (GI, CSTA, Lehrpläne)
- Forschung (frühe Programmierbildung, Lesedidaktik, Gewohnheitsbildung)
- gemeinfreie Quellen (Stoa-Texte)

Jede Aussage mit Quelle verlinken. Bei widersprüchlichen Quellen beide nennen und begründen,
welcher du folgst.

### 4. Machbarkeit und Risiken
Ordne jedes große Risiko einer Art zu, denn jede wird anders geprüft:

| Art | Beispiele | Wie prüfen |
|---|---|---|
| technisch | Datenquelle, Texterkennung, Spracherkennung, API-Kosten, Lizenz | **Spike jetzt** (siehe unten) |
| Bedienung | Können 5-Jährige Zeiger drehen? Findet man den Live-Scan? | als früher **Prototyp-Meilenstein mit Gerätetest** in den Plan, mit Go-Kriterium |
| Lernwirkung bzw. Nutzen | Lernen Kinder wirklich? Nutzen Lehrkräfte das? | ist die **Hypothese**; prüft der Nutzertest am Ende des MVP |

Spikes für technische Risiken:
- Wegwerf-Skripte im Scratchpad, nicht im Repo
- echte Daten statt Annahmen: echte Kartenbilder, echte Turnierlisten, echte Antworten der API
- messen, nicht schätzen: Trefferquote, Laufzeit, Abdeckung, Kosten pro Nutzer
- vorher ein **Go-Kriterium** festlegen (z. B. „Code-Erkennung ≥ 95 %, 0 falsche sichere Treffer“)

Scheitert ein Spike: dem User Alternativen nennen und eine Empfehlung geben. Das ist das einzige
Gate dieser Phase.

### 5. Leitlinien ableiten
Am Ende der Analyse stehen 5–8 Leitlinien für die eigene App. Beispiele aus Toni tüftelt:
- „Nur Bilder, keine Wörter am Block“
- „Absolute Richtungen“
- „Fehler sind Teil des Spiels“

Sie fließen in Plan und Design.

## Agenten

**Im MVP recherchierst du selbst**, ohne Agenten. Das ist schneller und billiger als drei
Agenten für eine Top-3-Liste.

In Production gibst du unabhängige Themen parallel an `app-researcher`, in einer Nachricht. Zum Beispiel:
- ein Agent für das Reverse Engineering
- einer für Konkurrenz und Rezensionen
- einer für Fachquellen

Die Spikes machst du selbst, weil sie Code ausführen und Messungen brauchen.

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Vorbild | nur, wenn es der Kern der Idee ist | ja, mit Evidenz |
| Konkurrenz | Top 3, Schwächen | 4–6, Geschäftsmodelle, Bewertungen |
| Fachwissen | die zwei, drei Regeln, die der Kernablauf braucht | vollständig mit Standards |
| Spikes | nur das größte Risiko | alle Risiken aus dem Plan |
| Umfang | 1–2 Seiten | so lang wie nötig, mit Inhaltsverzeichnis ab 300 Zeilen |

## Bericht an den User

Fünf bis acht Punkte, die die Richtung bestimmen:
- was die Vorbild-App macht
- wo ihre Schwächen sind
- was die eigene App besser macht
- welche technischen Risiken geprüft sind und mit welchem Ergebnis

Dazu ausdrücklich, was nicht untersucht wurde.
