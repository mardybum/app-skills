# <App-Name>

<Ein Satz: was die App ist und für wen.> Modus und Phase: `docs/STATUS.md`.

## Befehle

```bash
xcodegen generate
xcodebuild -project <App>.xcodeproj -scheme <App> -destination 'platform=iOS Simulator,name=iPhone 17' test
```

## Aufbau

- `Packages/<Kit>/`: Engine ohne UI. Neue Regeln zuerst hier mit Test.
- `<App>/Views/Components/Theme.swift`: einzige Quelle für Farben, Schriften, Radien (siehe `DESIGN.md`).
- `docs/`: BRIEF, ANALYSE, PLAN, QA-REPORT, APPSTORE, BACKLOG.

## Konventionen

- Commit-Regel: <nach jedem grünen Meilenstein committen und pushen>.
- Texte nur über `Localizable.xcstrings`; Standardsprache: <…>.
- Keine Farbwerte in Views; neue Komponenten in DESIGN.md eintragen.
- Debug-Startargumente: `-uitest`, `-screenshots` (nur `#if DEBUG`).

## Stolperfallen

- Audio nie auf dem Main-Thread (`AudioWork`-Queues).
- Speichern mit Dateischutz `completeFileProtectionUntilFirstUserAuthentication`.
- `TARGETED_DEVICE_FAMILY` pro Target in `project.yml`.
- <app-spezifisch>

## Nie

- Schlüssel committen oder in Docs schreiben.
- Ohne OK deployen oder an Produktionsdaten gehen.
