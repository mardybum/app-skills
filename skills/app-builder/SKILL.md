---
name: app-builder
description: "Baut eine App von der Idee bis zum Store nach dem bewährten Ablauf aus Lino liest, Toni tüftelt, Deck Buddy, askesis und Hablamos: Briefing, Recherche, Plan, Design, Bauen, User-Review, QA, Launch, Release. Fragt zuerst den Modus ab: MVP (Idee schnell testen), Production (fertig für App Store und echte Nutzer) oder MVP-first (klein starten, dann ausbauen). Nutze diesen Skill immer, wenn jemand eine neue App oder einen Prototyp bauen will, ein MVP in Produktion bringen möchte oder wissen will, wo ein App-Projekt steht – auch bei 'bau mir eine iOS-App für …', 'build an app like X but better', 'reverse engineer X und mach es besser', 'mach daraus ein MVP', 'mach die App store-fertig', 'stell von MVP auf Production um', selbst wenn das Wort Skill nicht fällt. Einzelne Phasen haben eigene Skills: app-research, app-plan, app-design, app-build, app-qa, app-launch, app-release, app-infra."
metadata:
  version: 1.2.0
---

# App Builder

Du führst ein App-Projekt durch feste Phasen. Der User ist Product Owner: Er liefert Idee,
Urteil und Freigaben. Du machst den Rest: recherchieren, planen, gestalten, bauen, testen und
die Veröffentlichung vorbereiten. Das Schema stammt aus fünf echten Projekten. Jede Phase endet
mit einem prüfbaren Ergebnis im Repo, und der User muss nur an wenigen, klar benannten Stellen
entscheiden. So bleibt das Tempo hoch, ohne dass er die Kontrolle verliert.

## Zuerst: Wo stehen wir?

1. Liegt im Projekt eine `docs/STATUS.md`? Dann lies sie, übernimm Modus und Phase und mach dort
   weiter. Sag in einem Satz, wo das Projekt steht.
2. Gibt es sie nicht, ist es ein neues Projekt: weiter mit Phase 0.
3. Betrifft die Anfrage nur eine Phase („mach QA“, „bau eine Landingpage“), nutze direkt den
   passenden Unter-Skill und aktualisiere danach `STATUS.md`, falls vorhanden.
4. Laufen mehrere Projekte oder Sessions parallel, bestätige vor der ersten Änderung das Ziel-Repo.
   Einmal landete eine Änderung für Conjugamos in Lino liest und musste zurückgenommen werden.

## Phase 0: Briefing

Ergebnis: `docs/BRIEF.md` (Vorlage `templates/BRIEF.md`) und `docs/STATUS.md` (Vorlage `templates/STATUS.md`).

- Zieh zuerst aus der Nachricht heraus, was schon drinsteht. Der User diktiert oft frei; Kern,
  Zielgruppe, Vorbild und Anspruch („besser als alles, was es gibt“) sind meist enthalten.
- Frag nur, was fehlt und die Richtung ändert, höchstens vier Fragen auf einmal. Typische Lücken:
  Modus, Plattform, Zielgruppe, Vorbild oder Template-App, Geschäftsmodell und Leitplanken
  (kostenlos? offline? ohne Konto? ohne Tracking?).
- **Modus:** Was der User sagt, zählt.
  - „erstmal MVP“ oder „zum Testen“ → `mvp-first`, denn „erstmal“ heißt, dass es weitergehen soll
  - „nur ausprobieren, ob das geht“ → `mvp`
  - „launchen“ oder „für den App Store“ → `production`

  Sagt er nichts dazu, empfiehl `mvp-first` für eine neue, unbewiesene Idee.
- **Commit-Regel:** Übernimm den Standard und nenne ihn im ersten Bericht, statt zu fragen.
  Standard: nach jedem grünen Meilenstein committen und ins private GitHub-Repo pushen. In früheren
  Projekten wurde ständig „commit?“ gefragt und immer mit Ja beantwortet.
- **Name:** Ein Arbeitstitel reicht. Der echte Name kommt mit Design bzw. Release, inklusive
  Markenprüfung (siehe Deck Buddy).
- **Hypothese** (MVP und mvp-first): Das messbare Signal muss jeden Teil der Hypothese prüfen
  (z. B. ablesen **und** einstellen). Dazu gehören ein Bestehenskriterium und eine
  Aufnahmebedingung, z. B. „nur Kinder, die den Vortest nicht bestehen“.
- Gibt es eine ähnliche eigene App, nimm sie als Template (Kinder-Apps: Lino liest bzw. Toni tüftelt
  mit KinderKit). Steht in `references/house-setup.md`, inklusive der Einschränkungen beim Einbinden.

## Die drei Modi

| | MVP | Production | MVP-first |
|---|---|---|---|
| Ziel | Kernannahme testen | echte Nutzer, Store | erst MVP, dann Graduation |
| Umfang | ein Kernablauf, echt gebaut | voller V1-Umfang | wie MVP, danach V1 |
| Recherche | Top 3 Konkurrenten, nur kritische Spikes | vollständig | wie MVP |
| Design | House-Style oder eine Richtung | drei Richtungen, DESIGN.md, Review | eine Richtung, Vollrunde bei Graduation |
| Tests | Unit-Tests für die Kernlogik, Selbsttest im Simulator | + UI-Tests, Barrierefreiheit, QA-Bericht | wie MVP |
| Infrastruktur | privates Repo, CLAUDE.md, Secrets sauber | CI/CD, Staging, Monitoring, Backups | wie MVP, dann Production |
| Launch | – (höchstens eine Warteliste) | Landingpage, Recht, Videos, Screenshots | bei Graduation |
| Release | Simulator, eigenes Gerät, TestFlight intern | App Store bzw. Produktion | bei Graduation |
| Ende | Test mit 3–10 Zielnutzern, dann Entscheidung | Freigabe im Store | Graduation-Gate |

Details pro Phase und die Exit-Kriterien stehen in `references/modes.md`. Lies sie, sobald der Modus feststeht.

**Auch im MVP von Anfang an**, weil Nachrüsten jedes Mal teuer war:
- Design-Tokens zentral (eine Theme-Datei bzw. CSS-Variablen)
- Logik in einem eigenen Paket
- alle Texte über String Catalogs bzw. i18n-Dateien
- keine Tracking-SDKs
- stabile IDs für gespeicherte Daten
- privates GitHub-Repo

## Phasen-Landkarte

| # | Phase | Skill | Ergebnis im Repo | Gate (User entscheidet) |
|---|---|---|---|---|
| 0 | Briefing | app-builder | `docs/BRIEF.md`, `docs/STATUS.md` | Modus, Commit-Regel |
| 1 | Recherche | app-research | `docs/ANALYSE.md` | Go/No-Go nur, wenn ein Spike scheitert |
| 2 | Plan | app-plan | `docs/PLAN.md`, von Personas geprüft | Plan freigeben |
| 3 | Design | app-design | Design-Canvas, `DESIGN.md` | Richtung wählen |
| 4 | Bauen | app-build | App und Tests, ein Commit pro Meilenstein | – |
| 5 | User-Review | app-build | Feedback eingearbeitet | User testet selbst |
| 6 | QA | app-qa | `docs/QA-REPORT.md`, Fixes | – |
| 7 | Launch-Material | app-launch | Website, Warteliste, Videos, Screenshots | Texte vor dem Veröffentlichen |
| 8 | Release | app-release | `docs/APPSTORE.md`, Upload | Einreichen |
| quer | Infrastruktur | app-infra | CI/CD, Umgebungen, Monitoring | Änderungen an Produktion |

**Design kommt vor dem Bau der Oberfläche.** Bei Lino liest entstanden an einem Tag drei Designs,
weil erst gebaut und dann gestaltet wurde. Im MVP reicht dafür eine Stunde mit einem House-Style.
Die Engine (Phase 4, erster Meilenstein) darf parallel zum Design entstehen, weil sie keine UI hat.

## So läuft jede Phase

1. Lies den Unter-Skill und befolge ihn.
2. Lege das Ergebnis als Datei im Repo ab, nicht nur im Chat, damit spätere Sessions es finden.
3. Aktualisiere `STATUS.md`: Phase, Ergebnis, Entscheidungen, nächster Schritt.
4. Berichte kurz auf Deutsch:
   - was fertig ist
   - was geprüft ist und wo (Simulator, Gerät, lokal, live)
   - was **nicht** geprüft ist
   Funktionen, die nur auf echter Hardware gehen (Kamera, Mikrofon, Push), immer ausdrücklich benennen.
5. Braucht die Phase eine Freigabe, stell genau eine Frage und warte. Sonst geh direkt weiter.
   Der User will Tempo und schreibt meist nur „GO“ oder „continue“.

## Freigaben

**Immer fragen bei:**
- Plan und Designrichtung
- öffentlichen Texten (Website, Store)
- Änderungen an Produktion (Datenbank, Deploy einer Live-App)
- Geld und Konten
- Einreichen im Store
- Löschen

**Nie selbst eintippen:** Passwörter, Schlüssel, Zahlungsdaten. Der User setzt Secrets selbst
(`supabase secrets set`, Vercel-Umgebungsvariablen, `.env.local`). Schreibt er einen Schlüssel in
den Chat, darfst du ihn für die Aufgabe verwenden. Committe ihn nie und sag ihm, dass er ihn
danach rotieren sollte, weil er jetzt im Klartext im Verlauf steht.

Bei Live-Apps mit echten Nutzern (wie Hablamos): Plan-Modus, eigener Branch, kein Deploy ohne
ausdrückliches OK, bestehende Daten dürfen nie verloren gehen.

## Agenten

Die Agenten liegen in `~/.claude/agents/` und prüfen nur. Sie ändern keinen Code.

| Agent | Aufgabe | Phase |
|---|---|---|
| `app-researcher` | Konkurrenz, Reverse Engineering, Machbarkeits-Spikes | 1, parallel je Thema |
| `persona-tester` | Plan oder App aus Sicht von drei Personas durchspielen | 2 (Plan), 6 |
| `domain-expert` | fachliche Bewertung (Pädagogik, Regelwerk, Wissenschaft) | 2, 6 |
| `design-critic` | Screens gegen `DESIGN.md` und den KI-Einheitslook prüfen | 3, 6, 7 |
| `qa-engineer` | Build, Tests, Performance, Sicherheit, Daten | 6 |
| `release-auditor` | Ablehnungsrisiken und Store-Angaben | 8 |

**Regeln:**
- Unabhängige Reviews startest du parallel in einer Nachricht. Danach führst du die Funde
  zusammen, streichst Doppeltes und sortierst nach Schwere.
- Fixes macht nur die Haupt-Session. So überschreibt niemand fremde Änderungen (das ist bei Toni
  tüftelt mit zwei Sessions im selben Ordner fast passiert).
- Agenten kosten. Im MVP `persona-tester`, und `domain-expert` nur, wenn die Hypothese fachlich ist
  (Lern-Apps: Lernt das Kind wirklich?). In Production alle, die die Phase vorsieht. Im MVP
  recherchierst du selbst, statt `app-researcher` zu starten.

## Probelauf

Soll der Ablauf nur geprüft werden (Testlauf des Skills, Machbarkeitsgespräch):
- Arbeite in einem Wegwerf-Ordner im Scratchpad, ohne GitHub-Repo.
- Höre nach dem Plan-Gate auf.
- Schreib Funde zum Ablauf in eine eigene Datei. Die Verbesserungen gehören nach
  `~/skills/app-skills`.

## Graduation: vom MVP zu Production

Der Wechsel geht in den Modi `mvp` und `mvp-first`, und zwar jederzeit, sobald der User es sagt.
Typische Formulierungen: „auf Production umstellen“, „Modus Production“, „wir bauen aus“,
„mach daraus eine richtige App“, „Graduation“. Im Modus `mvp-first` schlägst du den Wechsel
außerdem selbst vor, sobald der Nutzertest ausgewertet ist.

Fehlt der Nutzertest noch, sag in einem Satz, dass die Hypothese ungeprüft ist, und frag einmal,
ob trotzdem gewechselt werden soll. Ändere den Modus nie still in `STATUS.md`, ohne die Schritte
unten zu gehen: Sonst fehlen später CI, Staging, Design-Vollrunde und QA.

1. Fass das Ergebnis des Nutzertests zusammen: was funktioniert hat, was nicht, was überrascht hat.
2. Der User entscheidet: **ausbauen**, **umbauen** (zurück zu Phase 2) oder **stoppen**.
3. Bei „ausbauen“:
   - `app-infra` mit `app-infra/references/graduation.md` abarbeiten
   - volle Design-Runde (`app-design`, falls das MVP nur einen House-Style hatte)
   - `PLAN.md` auf V1 erweitern
   - die Phasen 4 bis 8 im Production-Standard durchlaufen
4. In `STATUS.md` den Modus auf `production` setzen und das Graduation-Datum eintragen.

## Bevor du loslegst

- Lies `references/lessons.md` vor Phase 4 und noch einmal vor Phase 8. Dort stehen die Fehler
  aus den bisherigen Apps; jeder davon hat Stunden gekostet.
- `references/house-setup.md` beschreibt die gemeinsame Infrastruktur aller Apps:
  - Apple-Konto, Supabase, Brevo, Vercel
  - Google-Drive-Ablage, Rechtstexte
  - Stimme, REA, Vorlagen-Repos
