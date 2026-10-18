# App Skills

Skills und Agenten für Claude Code, mit denen Apps nach einem festen Schema entstehen: von der
Idee über Recherche, Plan, Design, Bau, QA und Launch-Material bis in den App Store. Das Schema
stammt aus fünf echten Projekten: Lino liest, Toni tüftelt, Deck Buddy, askesis und Hablamos.

## Schnellstart

```bash
./install.sh
```

Danach in einer neuen Claude-Code-Session:

```
/app-builder Bau mir eine iPad-App, mit der Kinder Uhrzeiten lesen lernen. Vorbild: …
```

Der Skill fragt den Modus ab, legt `docs/BRIEF.md` und `docs/STATUS.md` an und führt durch die Phasen.
Eine spätere Session liest `STATUS.md` und macht an derselben Stelle weiter.

## Beispiele zum Starten

Du musst die Skills nicht beim Namen nennen; die Beschreibungen reichen meist, damit Claude den
richtigen findet. Mit `/name` startest du einen Skill gezielt.

### Neue App

**MVP-first** – Idee klein testen, später ausbauen (Standard für neue Ideen):
```
/app-builder bau mir ne app, mit der kinder die uhr lesen lernen. ipad und iphone, 5–8 jahre.
kostenlos, ohne werbung, ohne konto. erstmal nur MVP zum testen mit kindern.
```

**Production** – direkt fertig für den App Store:
```
/app-builder Ich will eine iOS-App für Kletterer bauen, die ihre Routen und Fortschritte loggen.
Soll in den App Store, Deutsch und Englisch, kostenlos mit optionalem Abo später. Production-Modus.
```

**MVP** – nur schnell prüfen, ob etwas technisch geht:
```
/app-builder Reiner Machbarkeitstest: Kann eine iPhone-App Pflanzen per Kamera erkennen und
Gießtipps geben? Nur MVP, kein Store, ich will wissen, ob die Erkennung trägt.
```

**Mit Vorbild zum Reverse Engineering:**
```
/app-builder Hier ist REA: ~/Leseapp/rea. Reverse engineer den Rechen-Teil von ANTON und bau eine
iOS-App, die besser ist. Zielgruppe Klasse 1–2, Design wie Lino liest.
```

**Kinder-App auf Basis einer eigenen App:**
```
/app-builder Neue Kinder-App „Fipsi zählt“: Zahlen bis 20 für Vorschulkinder.
Nimm Toni tüftelt als Template, gleiches Design, KinderKit. MVP-first.
```

**Web-SaaS:**
```
/app-builder Baue eine Web-App für Musiklehrer: Schüler üben Rhythmen, Lehrer sehen den Fortschritt.
Mehrere Lehrer mit eigenem Login, Klassen per Code, Next.js + Supabase wie Hablamos. Production.
```

### Weitermachen und ausbauen

```
/app-builder wo stehen wir bei der uhr-app? mach weiter.
```
```
/app-builder Der Nutzertest ist durch: 4 von 5 Kindern haben bestanden. Wir bauen aus – Graduation.
```

### Einzelne Phasen in einem bestehenden Projekt

| Ziel | Beispiel |
|---|---|
| Recherche | `/app-research schau dir an, was es an Habit-Trackern gibt, und reverse engineer Streaks` |
| Plan | `/app-plan plan das erstmal, denk hart drüber nach – noch nichts bauen` |
| Design | `/app-design mach drei Designvorschläge, nicht dieses typische AI-Orange` |
| Redesign | `/app-design die App sieht nach KI aus, mach ein Redesign auf Basis der aktuellen Screens` |
| Bauen | `/app-build setz das Projekt auf und bau Meilenstein M1` |
| Feedback | `Live-Scan funktioniert gar nicht, bei Abendlicht ist alles überbelichtet – recherchier das` |
| QA | `/app-qa mach komplettes QA-Engineering: technisch, Usability, Barrierefreiheit` |
| Fachlich | `/app-qa lernen Kinder hier wirklich was? Bewerte das pädagogisch` |
| Landingpage | `/app-launch bau eine geile Landingpage im App-Design und deploy auf Vercel` |
| Warteliste | `/app-launch füge eine Launch-Warteliste mit Double-Opt-in hinzu (Supabase + Brevo)` |
| Videos | `/app-launch render 8 Reels aus dem Simulator für Social Media` |
| Release | `/app-release bereite den Go-Live im App Store vor und führ mich durch` |
| Infrastruktur | `/app-infra welche Infrastruktur fehlt hier? Mach eine Bestandsaufnahme` |
| CI/CD | `/app-infra richte CI mit Xcode Cloud und Dependabot ein` |

### Werkzeuge direkt

```bash
bash ~/.claude/skills/app-infra/scripts/audit.sh ~/projects/stoicHabits
```
```bash
bash ~/.claude/skills/app-design/scripts/render-artboards.sh <canvas-ordner> <ausgabe-ordner>
```

### Tipps

- **Modus nennen** spart eine Rückfrage: „MVP“, „MVP-first“ oder „Production“.
- **Template nennen**, wenn es eine ähnliche eigene App gibt (Lino, Toni, Deck Buddy, askesis, Hablamos).
- **Schlüssel nicht in den Chat**: Secrets setzt du selbst, Claude nennt dir den Befehl.
- **Probelauf:** „Testlauf, keine App bauen, nur bis zum Plan“ – läuft in einem Wegwerf-Ordner.

## Modi

| Modus | Wofür | Ende |
|---|---|---|
| `mvp` | eine Idee schnell mit echten Nutzern testen | Nutzertest, dann Entscheidung |
| `production` | fertig für den Store und echte Nutzer | Freigabe im Store |
| `mvp-first` | klein starten, nach dem Test ausbauen (Standard für neue Ideen) | Graduation, dann Production |

## Phasen und Skills

```
0 Briefing ─ 1 Recherche ─ 2 Plan ─ 3 Design ─ 4 Bauen ─ 5 User-Review ─ 6 QA ─ 7 Launch ─ 8 Release
 app-builder  app-research  app-plan  app-design  app-build ──────────────  app-qa  app-launch  app-release
                                     quer dazu: app-infra (CI/CD, Umgebungen, Monitoring, Graduation)
```

| Skill | Einzeln nutzbar für |
|---|---|
| `app-builder` | neues Projekt, Weitermachen, Modus, Graduation |
| `app-research` | „reverse engineer X“, Konkurrenz, Machbarkeit |
| `app-plan` | Umsetzungsplan mit Persona-Review |
| `app-design` | drei Richtungen, DESIGN.md, Redesign, App-Icon, Anti-KI-Look |
| `app-build` | Setup (iOS/Web), Meilensteine, Feedback einarbeiten |
| `app-qa` | technische QA, Usability, Fachbewertung, UI-Tests, Barrierefreiheit |
| `app-launch` | Landingpage, Warteliste, App-Video, Reels, Screenshots |
| `app-release` | Ablehnungsrisiken, App Store Connect Schritt für Schritt |
| `app-infra` | CI/CD, Staging, Secrets, Monitoring, Audit-Skript, MVP → Production |

## Agenten

Die Agenten prüfen nur, Fixes macht die Haupt-Session.

| Agent | Aufgabe |
|---|---|
| `app-researcher` | Konkurrenz, Reverse Engineering mit REA, Fachquellen |
| `persona-tester` | Plan oder App aus Sicht von Personas, Tap-Zählung |
| `domain-expert` | fachliche Bewertung (Pädagogik, Regelwerk, Wissenschaft) |
| `design-critic` | Screens gegen DESIGN.md und den KI-Einheitslook |
| `qa-engineer` | Build, Tests, Performance, Sicherheit, Daten |
| `release-auditor` | App-Store-Ablehnungsrisiken, Store-Angaben |

## Aufbau

```
skills/<name>/SKILL.md          Anleitung (unter 500 Zeilen)
skills/<name>/references/       Details, die nur bei Bedarf gelesen werden
skills/<name>/templates/        Vorlagen für Docs, Projektdateien, CI
skills/app-infra/scripts/       audit.sh (Bestandsaufnahme eines Repos)
agents/<name>.md                Claude-Code-Subagenten
install.sh                      verlinkt Skills und Agenten nach ~/.claude
validate.sh                     prüft Frontmatter, Länge, Verweise
```

`install.sh` legt Symlinks an. Änderungen hier wirken also sofort. Nach dem Bearbeiten
`./validate.sh` laufen lassen und committen.
