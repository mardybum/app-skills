---
name: app-plan
description: "Plan-Phase für ein App-Projekt: aus Briefing und Analyse einen umsetzbaren Plan mit V1-Umfang, Personas, Kernabläufen, Architektur, Datenmodell und Meilensteinen (jeder mit Definition of Done) machen und ihn von simulierten Nutzern und einem Fachexperten prüfen lassen, bevor gebaut wird. Ergebnis ist docs/PLAN.md mit Freigabe durch den User. Nutze diesen Skill bei 'plan das erstmal', 'denk hart drüber nach', 'was gehört in V1', 'mach einen Umsetzungsplan', bei großen Umbauten an Live-Apps ('geh in den Plan-Modus') oder wenn app-builder Phase 2 erreicht."
metadata:
  version: 1.1.0
---

# App-Plan

Ziel: ein Plan, den der User in fünf Minuten versteht und freigibt und nach dem die Umsetzung
ohne Rückfragen laufen kann. Bei Deck Buddy hat der Review aus drei Persona-Sichten den Plan
stark verändert:
- Schatzsuche statt erst 500 Karten erfassen
- zwei Anzeigen statt einer Ampel
- kalibrierte Warnungen

Das war billig, weil noch keine Zeile Code stand.

Ergebnis: `docs/PLAN.md` nach `templates/PLAN.md`.

## Ablauf

1. **Lesen:** `docs/BRIEF.md`, `docs/ANALYSE.md`, bei einem Template auch dessen README und DESIGN.md.
2. **Personas:** drei konkrete Menschen mit Name, Alter, Vorwissen und Ziel. Wähle sie so, dass
   sie die Spannbreite abdecken:
   - Toni: Mila (5, kann nicht lesen), Ben (6), Emma (8)
   - Deck Buddy: Kind mit Schuhkarton, Wiedereinsteiger, Turnierspieler
3. **Kernabläufe:** pro Persona der wichtigste Ablauf als Schrittfolge mit Ziel-Tap-Zahl
   (z. B. „Kind ohne Karten → erstes legales Deck: ≤ 6 Taps“). Diese Zahlen prüft später die QA.
4. **Umfang V1:** Was drin ist, was bewusst nicht drin ist und warum. Im MVP ist die
   „Nicht drin“-Liste länger als die „Drin“-Liste.
   - **Kernablauf vollständig beschreiben**, auch im MVP:
     - die Interaktion (was ist ziehbar, in welchem Raster)
     - die Rückmeldesätze pro Fehlerfall
     - wann und wie ein Tipp kommt
     - wie falsche Antwortoptionen entstehen

     Genau diese Details fand der Review im Testlauf lückenhaft.
   - **Gegenprobe:** Wie könnte man die Aufgabe lösen, *ohne* das Ziel zu lernen?
     Beispiele: feste Paare auswendig lernen („Frühstück = sieben“), nach Gehör lösen, Tipp abwarten
     und abmalen (Toni), Pfeile probieren statt planen. Jede Lücke bekommt eine Gegenmaßnahme.
   - **Figur und Stimme** bei Template-Apps bewusst entscheiden: eigene oder vorhandene
     (siehe `app-builder/references/house-setup.md`).
5. **Architektur:**
   - die Logik als eigenes Paket (Engine) ohne UI, mit Tests
   - App-Schichten: Model, Services, Views
   - Datenhaltung: lokal, App Group oder Backend
   - Datenquellen und wie sie aktualisiert werden
   - Sprachen
   - wo Debug-Modi gebraucht werden: UI-Test-Modus, Screenshot-Seed, Fake-Kamera
6. **Meilensteine M0 … Mn:** jeder liefert etwas Sichtbares und endet mit einer **Definition of Done**:
   - Build ohne Warnungen, alle Tests grün
   - Kernablauf des Meilensteins im Simulator durchgespielt, mit Screenshot
   - Commit nach der Commit-Regel
   - Typische Reihenfolge: M0 Setup und App-Gerüst → M1 Engine mit Tests → M2 Datenpipeline
     (falls nötig) → M3 erster Kernablauf → … → letzter Meilenstein Feinschliff (Icon,
     Barrierefreiheit, README).
7. **Risiken:** was schiefgehen kann, wie früh es sich zeigt, Plan B. Funktionen, die nur auf echter
   Hardware testbar sind, bekommen einen eigenen frühen Gerätetest.
8. **Review lassen**, siehe unten, dann den Plan anpassen.
9. **Freigabe:** Fasse den Plan für den User in wenigen Punkten zusammen:
   - die Wünsche des Users und wie sie umgesetzt werden
   - was der Review geändert hat
   - die Meilensteine
   - was er freigeben muss (Installationen, Konten, Kosten)

   Dann stell eine Frage zur Freigabe. Im Plan-Modus heißt das: `ExitPlanMode` aufrufen.

## Review vor der Freigabe

Starte parallel in einer Nachricht:
- `persona-tester`: soll `PLAN.md` aus Sicht jeder Persona durchspielen. Wo bricht der Ablauf ab?
  Was fehlt, was ist zu viel? Welche Warnung wäre falsch kalibriert?
- `domain-expert`: Stimmen die Regeln, Standards und das pädagogische bzw. fachliche Modell?
  - in Production immer
  - im MVP dann, wenn die Hypothese fachlich ist (Lern-Apps, Regelwerke)

Gib beiden die Pfade zu BRIEF, ANALYSE und PLAN, die Personas und eine Liste der Fragen, die dich
selbst unsicher machen. Sie lesen nur und ändern nichts.

Übernimm die berechtigten Funde in den Plan und liste sie in „Was der Review geändert hat“.
Lehnst du einen Fund ab, schreib einen Satz, warum.

## Live-Apps und große Umbauten

Wenn schon echte Nutzer da sind (Hablamos):
- im Plan-Modus planen, auf einem Branch arbeiten, ohne Deploy ohne ausdrückliches OK
- **bestehende Daten dürfen nicht verloren gehen.** Migrationspfad mit Probelauf ist Teil des Plans.
- Fragen an den User sammeln und gemeinsam stellen, statt Annahmen zu treffen
- Schrittweise vorgehen: zuerst das, was der User als Nächstes braucht (bei Hablamos die
  Anmeldung pro Lehrkraft, danach Klassen)

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Länge | kurz, der Kernablauf aber vollständig | vollständig nach Vorlage |
| Personas | 2 plus die Person, die den Nutzertest leitet | 3 |
| Meilensteine | M0 + 2–4 Bau-Meilensteine + Nutzertest | so viele wie nötig, jeder ≤ ein halber Tag |
| Review | `persona-tester`; `domain-expert`, wenn die Hypothese fachlich ist | `persona-tester` + `domain-expert`, optional `/plan-eng-review` |
| Extra | Nutzertest als letzter Meilenstein: Aufnahme, Vor- und Nachtest, Bestehenskriterium, Messweg | Infrastruktur-Meilenstein (CI, Staging) aus `app-infra` |
