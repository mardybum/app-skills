# Plan – <App-Name>

Stand: <Datum> · Modus: <…> · Status: <Entwurf / freigegeben am …>

## Ziel
<ein Absatz; im MVP die Hypothese aus BRIEF.md>

## Personas

| Name | Wer | Ziel | Kernablauf | Ziel-Taps |
|---|---|---|---|---|
| <Mila, 5> | <kann nicht lesen, kennt Tablets> | <…> | <…> | ≤ <n> |

## Umfang V1

**Drin:**
- <…>

**Bewusst nicht drin (und warum):**
- <…>

## Architektur

```
<App>/            App, Screens, Services
Packages/<Kit>/   Engine ohne UI, mit Tests
<App>Tests/       Unit-Tests
<App>UITests/     UI-Tests, Screenshots, App-Video
website/          Landingpage (ab Production)
docs/             BRIEF, ANALYSE, PLAN, QA-REPORT, APPSTORE
```

- Datenhaltung: <SwiftData / JSON / App Group / Supabase>
- Datenquellen: <Quelle, Aktualisierung, Schutz gegen schlechte Updates>
- Sprachen: <de/en>, String Catalogs ab dem ersten Screen
- Debug-Modi: <UI-Test-Modus, -screenshots, Fake-Kamera>

## Datenmodell
<Kernobjekte und Beziehungen; stabile IDs>

## Meilensteine

| # | Ergebnis | Definition of Done |
|---|---|---|
| M0 | Projekt-Setup, App startet | Build ok, Repo gepusht, CLAUDE.md |
| M1 | Engine mit Tests | <n> Szenario-Tests grün |
| M2 | <…> | <…> im Simulator durchgespielt, Screenshot |

## Risiken

| Risiko | Wann sichtbar | Plan B |
|---|---|---|
| <nur auf echtem Gerät testbar: …> | <M3, Gerätetest> | <…> |

## Was der Review geändert hat
- <Fund> → <Änderung>

## Offene Entscheidungen für den User
- <…>
