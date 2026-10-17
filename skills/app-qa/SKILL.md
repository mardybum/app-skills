---
name: app-qa
description: "QA-Phase für Apps: technisches QA-Engineering (Build, Tests, Abdeckung, Performance, Sicherheit, Daten), Usability-Durchläufe mit Personas und Tap-Zählung, fachliche Bewertung ('lernen Kinder wirklich etwas?'), UI-Tests, Barrierefreiheits-Audits und Gerätematrix – parallel durch Review-Agenten, Fixes durch die Haupt-Session, Ergebnis als docs/QA-REPORT.md. Nutze diesen Skill bei 'mach komplettes QA', 'QA engineering, technisch und usability', 'code review und testing', 'UI-Test, VoiceOver', 'ist das App-Store-fertig?', 'was fehlt noch, damit die App nutzbar ist?' oder wenn app-builder Phase 6 erreicht."
metadata:
  version: 1.0.0
---

# App-QA

Ziel: Bevor jemand Fremdes die App sieht, sind die Fehler gefunden, behoben und dokumentiert,
und es ist klar, was noch offen ist. Bei Deck Buddy fand die erste QA-Runde 11 technische und
9 Usability-Funde. Bei Toni tüftelt zeigte die Fachbewertung, dass Kinder nur „Pfeile probieren,
bis es klappt“ lernten. Daraus entstanden neue Sterne, gestufte Tipps und ein neuer Aufgabentyp.

Ergebnis: `docs/QA-REPORT.md` nach `templates/QA-REPORT.md`, Fixes als Commits, Offenes in `docs/BACKLOG.md`.

## Ablauf

### 1. Prüfungen parallel starten
In einer Nachricht, alle mit Pfaden zu `docs/PLAN.md` (Personas, Ziel-Taps), `DESIGN.md`
und `references/checklists.md`:

| Agent | Prüft |
|---|---|
| `qa-engineer` | Build, Tests, Abdeckung, Performance, Sicherheit, Daten, Sprachen, Randfälle |
| `persona-tester` | die Kernabläufe jeder Persona im Simulator, Taps, Stolperstellen, Ersteindruck |
| `domain-expert` | Fachlichkeit: Lernwirkung, Regelwerk, Inhalte, Altersgerechtheit |
| `design-critic` | Screens gegen DESIGN.md, Dunkelmodus, große Schrift, iPad |

Läuft die App für mehrere Agenten im Simulator, gib jedem ein eigenes Gerät (z. B. iPhone 17
für persona-tester, iPad für design-critic). Sonst stören sie sich gegenseitig.

### 2. Selbst prüfen, während die Agenten laufen
- Release-Build bauen: keine Debug- oder Testteile in der Store-Version.
- Mit Flugmodus starten: kein Absturz.
- Frisch installieren in der Store-Sprache: Startet die App in der richtigen Sprache?
- Alten Spielstand bzw. alte Daten laden: geht nichts verloren?

### 3. Funde zusammenführen
- Doppeltes streichen. Jeder Fund bekommt Schwere (hoch / mittel / niedrig), Auswirkung, Beleg.
- **Hoch und mittel jetzt beheben**, niedrig je nach Aufwand. Fixes macht nur diese Session, in
  kleinen Commits (`fix: …`). Nach jedem Fix das betroffene Stück erneut prüfen.
- Funde, die ein Produktthema sind (Sterne bestrafen Ausprobieren, zu wenig Inhalt), dem User als
  Empfehlung mit Begründung vorlegen. Bei klarer Sachlage gleich umsetzen und berichten.

### 4. UI-Tests und Barrierefreiheit (Production)
- XCUITest-Abläufe für jede Persona; Kernabläufe der ersten Level bzw. Screens durchspielen.
- `performAccessibilityAudit()` auf allen Hauptscreens. Prüfung, dass VoiceOver Kacheln als einen
  Satz liest. Dynamic Type bis AX; Kontrast hell und dunkel.
- Rundgang über die Geräte: iPhone klein und groß, iPad mini, Air 11″, Pro 13″, hoch und quer
  (wie `IPadTour` in Toni tüftelt).
- UI-Test-Modus mit Beispieldaten im Arbeitsspeicher, damit Tests unabhängig sind.

### 5. Test mit echten Nutzern vorbereiten
Leitfaden `docs/NUTZERTEST.md` nach dem Muster in `references/checklists.md`:
- Ziel, Ablauf, Vorher- und Nachher-Aufgaben, Beobachtungsbogen
- Einverständnis; keine Fotos von Gesichtern

Der Test selbst läuft beim User. Im MVP ist er das Exit-Kriterium.

### 6. Bericht
`QA-REPORT.md` mit Ergebnis-Tabelle oben, dann Technik, Usability, Fachlichkeit,
Barrierefreiheit, „Gefunden und behoben“ und offene Empfehlungen. Dem User eine Zusammenfassung
in wenigen Punkten:
- Ist die App bereit?
- Was wurde geändert?
- Was ist offen?
- Was hat niemand auf einem echten Gerät oder mit echten Nutzern geprüft?

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Technisch | Build, Unit-Tests, Kernablauf, Flugmodus | vollständige Checkliste |
| Usability | `persona-tester` mit 1–2 Personas | 3 Personas, Tap-Zahlen gegen den Plan |
| Fachlich | nur bei fachlichem Kern | `domain-expert` mit Standards |
| UI-Tests | keine oder ein Smoke-Test | alle Kernabläufe, A11y-Audits, Gerätematrix |
| Bericht | Abschnitt in STATUS.md | `docs/QA-REPORT.md` |
