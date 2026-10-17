# Modi im Detail

Der Modus steht in `docs/STATUS.md` und gilt für alle Phasen. Jeder Unter-Skill hat einen
Abschnitt „Je nach Modus“. Diese Datei ist die Gesamtsicht.

## MVP – „Trägt die Idee?“

**Ziel:** die eine Kernannahme mit echten Zielnutzern prüfen. Beispiele:
- „Kinder lösen Level ohne Hilfe“
- „Anfänger kommen in 6 Taps zum legalen Deck“
- „Lehrkräfte nutzen die Chats im Unterricht“

**Hypothese** in `BRIEF.md` als Satz festhalten: *Wir glauben, dass [Zielgruppe] [Ergebnis] erreicht, wenn [Kernablauf]. Wir wissen es, wenn [messbares Signal].*

| Phase | Im MVP |
|---|---|
| Recherche | Top 3 Konkurrenten mit Schwächen; Reverse Engineering nur, wenn das Vorbild der Kern der Idee ist; Spikes nur für das größte Risiko (Datenquelle, Erkennung, Schnittstelle) |
| Plan | eine Seite: Hypothese, Kernablauf, 2–4 Meilensteine, bewusst weggelassene Teile |
| Design | House-Style übernehmen oder eine Richtung skizzieren; Tokens trotzdem zentral |
| Bauen | ein Kernablauf mit echten Inhalten; alles andere weglassen oder fest verdrahten |
| Daten | lokal (SwiftData oder JSON); Backend nur, wenn es der Kern ist |
| Tests | Unit-Tests für die Kernlogik; ein Selbsttest im Simulator mit Screenshot |
| QA | Build ohne Fehler, Kernablauf durchgespielt, eine kurze Runde mit `persona-tester` |
| Infra | privates GitHub-Repo, `.gitignore`, `CLAUDE.md`, Secrets nur in Umgebungsvariablen |
| Launch | keiner; höchstens eine einfache Seite mit Warteliste, wenn Nachfrage die Hypothese ist |
| Release | Simulator, eigenes Gerät (Personal Team) oder TestFlight intern; Web: Vercel-Vorschau |

**Exit-Kriterien:**
- Der Kernablauf läuft auf einem echten Gerät.
- 3–10 Zielnutzer haben getestet; ein Leitfaden liegt in `docs/NUTZERTEST.md`.
- Das Ergebnis steht in `STATUS.md`.
- Danach entscheidet der User: ausbauen, umbauen oder stoppen.

**Zeitrahmen als Richtwert:** ein Arbeitstag bis zum testbaren Stand. Toni tüftelt hatte nach
etwa zwei Stunden einen Prototyp mit 10 Leveln.

## Production – „Fertig für echte Nutzer“

Alle Phasen vollständig:
- **Recherche:** komplette `ANALYSE.md` mit REA-Evidenz.
- **Plan:** Meilensteine mit Definition of Done; Review aus drei Persona-Sichten plus Fachbewertung.
- **Design:** drei Richtungen, Wahl durch den User, `DESIGN.md`, Review durch `design-critic`.
- **Bauen:** alle Meilensteine; Sprachen; Barrierefreiheit von Anfang an.
- **QA:** technisch, Usability, Fachlichkeit, UI-Tests, Barrierefreiheits-Audits, Gerätematrix; `QA-REPORT.md`.
- **Infra:** CI bei jedem Push; Lint und Format; Secret- und Abhängigkeits-Scan; Staging-Umgebung;
  Migrationen per Pipeline; Crash- und Fehler-Monitoring; Backups mit Wiederherstellungstest;
  Tags und CHANGELOG.
- **Launch:** Landingpage; Impressum, Datenschutz, Support; Warteliste mit Double-Opt-in; App-Video; Reels; Store-Screenshots.
- **Release:** Risiko-Sweep, `APPSTORE.md`, TestFlight-Selbsttest wie ein Prüfer, Einreichen mit manueller Freigabe.

**Exit:** Die App ist im Store freigegeben bzw. live; Monitoring läuft; der Backlog ist gepflegt.

## MVP-first – „Klein starten, dann richtig“

Empfohlener Standard für neue Ideen:
1. Das MVP läuft komplett nach den MVP-Regeln.
2. Am Ende steht das **Graduation-Gate** (siehe `SKILL.md`): Nutzertest auswerten, der User entscheidet.
3. Beim Ausbau folgt `app-infra/references/graduation.md`, dann die Production-Phasen ab Design bzw. Plan.

Was das MVP richtig machen muss, damit die Graduation billig bleibt:

| Gleich richtig machen | Warum |
|---|---|
| Tokens zentral, keine Farben direkt in Views | Das Redesign wird dann eine Tokendatei statt 40 Screens (Lino: drei Designs an einem Tag) |
| Logik als eigenes Paket mit Tests | Die Engine überlebt jeden UI-Umbau (PokeDeckKit, HabitEngine) |
| Texte über String Catalogs | Englisch nachzurüsten hat bei Deck Buddy 662 Strings bedeutet; askesis startete im Store versehentlich auf Deutsch |
| Stabile IDs für Level und Daten | Gespeicherter Fortschritt überlebt neue Inhalte (Toni: alte Level-IDs blieben) |
| Keine Tracking-SDKs | Datenschutz-Label „keine Daten erhoben“ bleibt wahr |
| Privates GitHub-Repo ab dem ersten Commit | askesis lag zwei Tage nur lokal |
| Debug-Startargumente (Testmodus, Beispieldaten) | UI-Tests, Screenshots und Videos bauen später darauf auf |
