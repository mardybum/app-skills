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
