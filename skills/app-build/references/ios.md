# iOS-Setup (SwiftUI, XcodeGen)

Bewährt in Lino liest, Toni tüftelt, Deck Buddy und askesis.

## Werkzeuge

- Xcode 26 und XcodeGen (`/opt/homebrew/bin/xcodegen`). Das Xcode-Projekt wird aus
  `project.yml` erzeugt und nie von Hand bearbeitet.
- Swift 6 mit strikter Concurrency für neue Apps; iOS 17 oder 18 als Mindestversion.
  Deck Buddy ging auf iOS 18 zurück, damit es auf iPhones läuft, die nicht aktualisieren.
- Simulatoren: iPhone 17, iPhone 17 Pro; iPad mini, iPad Air 11″, iPad Pro 13″.

## Aufbau

```
<App>/
  App/            Einstieg, AppModel, Debug-Startargumente
  Model/          SwiftData-Modelle bzw. Codable-Typen
  Engine/         nur, wenn kein eigenes Paket; sonst Packages/<Kit>
  Services/       Speicher, Audio, Netzwerk, Updates
  Views/          Screens, Components/ (Theme, Styles)
  Content/        Level, Texte, Daten (JSON)
  Resources/      Assets, Fonts (+ OFL), Voice, Localizable.xcstrings, PrivacyInfo.xcprivacy
Packages/<Kit>/   Swift-Paket: Engine und Domänenlogik, eigene Tests
<App>Tests/       Unit-Tests der App
<App>UITests/     Abläufe, Barrierefreiheit, AppStoreScreenshots, AppVideo
tools/            Icon, Stimme, lokaler Server
Scripts/          archive.sh, screenshots.sh, app-video.sh, reels.py
website/          Landingpage
docs/             BRIEF, ANALYSE, PLAN, QA-REPORT, APPSTORE, BACKLOG
project.yml · DESIGN.md · README.md · CLAUDE.md
```

## project.yml

Vorlage: `../templates/project.yml` (aus Toni tüftelt abgeleitet). Wichtig:
- `TARGETED_DEVICE_FAMILY` **in jedem Target** setzen: `"1"` für nur iPhone, `"1,2"` für iPhone und iPad.
- `INFOPLIST_KEY_ITSAppUsesNonExemptEncryption: NO` für die Exportangabe.
- `DEVELOPMENT_TEAM: JTF9P5K777` (bezahltes Team) für TestFlight; Personal Team nur für Gerätetests.
- `MARKETING_VERSION` in `project.yml`, die Build-Nummer setzt das Archiv-Skript aus der Commit-Anzahl.
- Schema mit Unit- und UI-Tests, damit `xcodebuild test` beide laufen lässt.
- Ressourcenordner mit vielen Dateien (Stimme) als `type: folder` einbinden.
- Feature-Schalter als Build-Settings plus Info.plist-Schlüssel, z. B. `POKEDECK_ACCOUNTS: "NO"`.

## Befehle

```bash
xcodegen generate
xcodebuild -project <App>.xcodeproj -scheme <App> -destination 'platform=iOS Simulator,name=iPhone 17' test
xcodebuild -project <App>.xcodeproj -scheme <App> -destination 'platform=iOS Simulator,name=iPad Air 11-inch (M3)' test
swift test --package-path Packages/<Kit>
```

Den genauen Simulatornamen mit `xcrun simctl list devices available` prüfen.

## Muster, die sich bewährt haben

- **Daten:**
  - SwiftData mit App Group, wenn Widgets mitlesen (askesis)
  - sonst JSON-Store mit Dateischutz `completeFileProtectionUntilFirstUserAuthentication` (KinderKit `JSONStore`)
- **Audio:**
  - Sprache und Effekte auf eigenen Queues (`AudioWork.voiceQueue`, `effectsQueue`)
  - Session-Wechsel per Continuation abwarten, nie mit `sync` vom Main-Thread aus
- **Bilder aus dem Netz:** Nuke mit Wiederholversuchen und einer gezeichneten Platzhalterkarte.
- **Externe Daten:**
  - Ein Builder-Werkzeug erzeugt den Katalog (SQLite oder JSON), der in die App kommt.
  - Updates kommen über ein öffentliches Daten-Repo mit Manifest und SHA-256.
  - Die App prüft, installiert atomar und lehnt schrumpfende Kataloge ab (Deck Buddy `CatalogUpdater`).
- **Widgets und Siri:** App Intents in einem geteilten Ordner für App und Widget.
- **Eltern-Schranke:** `ParentGateView` aus KinderKit (Zehnerzahl × Ziffer, Antwort eintippen).
- **Crash-Berichte ohne Tracking:** MetricKit lokal sammeln, teilbar machen (Deck Buddy).
- **Debug:**
  - `#if DEBUG`-Startargumente `-uitest`, `-screenshots`, `-seedStress N`
  - `UITEST_FAKE_CAMERA`

## Lokalisierung

- String Catalogs für App und Pakete. Texte über `LocalizedStringKey` bzw. `String(localized:)`.
  Singular und Plural als echte Varianten.
- Prüfskript wie `~/projects/pokedeck/Scripts/l10n/`: bricht bei fehlenden Übersetzungen oder
  falschen Platzhaltern ab.
- Sprachwahl in der App, wenn Store und Gerätesprache auseinanderfallen können (askesis `AppLanguage`).

## Datenschutz

- `PrivacyInfo.xcprivacy` für App, Widget und Pakete: kein Tracking, keine erhobenen Daten,
  „Required Reason“-Gründe für UserDefaults (`CA92.1`, mit App Group zusätzlich `1C8F.1`).
- Spracherkennung auf dem Gerät (`requiresOnDeviceRecognition`), Server nur nach Opt-in.
