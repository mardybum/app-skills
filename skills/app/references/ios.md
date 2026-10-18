# iOS setup (SwiftUI, XcodeGen)

Proven in Lino liest, Toni tüftelt, Deck Buddy and askesis.

## Tools
- Xcode 26 and XcodeGen. The project is generated from `project.yml`; never edit the `.xcodeproj` by hand.
- Swift 6 with strict concurrency. iOS 17 or 18 as minimum; Deck Buddy went down to 18 to reach phones that don't update.
- Simulators: iPhone 17 and 17 Pro, iPad mini, iPad Air 11″, iPad Pro 13″. Check names with `xcrun simctl list devices available`.

## Layout
```
<App>/            App, Model, Services, Views (Components/Theme.swift), Content, Resources
Packages/<Kit>/   engine and domain logic with its own tests
<App>Tests/       unit tests
<App>UITests/     flows, accessibility, AppStoreScreenshots, AppVideo
Scripts/          archive.sh, screenshots.sh, app-video.sh, reels.py
website/  docs/   landing page · BRIEF, ANALYSIS, PLAN, QA-REPORT, APPSTORE, BACKLOG
project.yml · DESIGN.md · README.md · CLAUDE.md
```

## project.yml
Template: `../templates/project.yml`.
- `TARGETED_DEVICE_FAMILY` in **every** target: "1" for iPhone only, "1,2" for iPhone and iPad.
- `INFOPLIST_KEY_ITSAppUsesNonExemptEncryption: NO`.
- `DEVELOPMENT_TEAM: JTF9P5K777` for TestFlight. The Personal Team is only good for device tests.
- `MARKETING_VERSION` lives in `project.yml`. The archive script sets the build number from the commit count.
- Large resource folders (voice clips) go in as `type: folder`.
- Feature switches are build settings plus Info.plist keys, e.g. `POKEDECK_ACCOUNTS: "NO"`.

## Commands
```bash
xcodegen generate
xcodebuild -project <App>.xcodeproj -scheme <App> -destination 'platform=iOS Simulator,name=iPhone 17' test
swift test --package-path Packages/<Kit>
```

## Patterns
- **Data:**
  - SwiftData with an App Group when widgets read it
  - otherwise a JSON store with file protection (KinderKit `JSONStore`)
- **Audio:**
  - own queues for voice and effects
  - wait for session changes with a continuation, never with `sync` from main
- **Remote images:** Nuke with retries and a drawn placeholder.
- **External data:**
  - a builder tool creates the catalogue
  - updates come with a manifest and SHA-256, install atomically, and are rejected if they shrink
- **Widgets and Siri:** App Intents in a folder shared by app and widget.
- **Crash reports without tracking:** collect MetricKit locally and make them shareable.
- **Debug launch arguments** (`#if DEBUG`): `-uitest`, `-screenshots`, `-seedStress N`, `UITEST_FAKE_CAMERA`.

## Localisation and privacy
- String Catalogs for the app and its packages, with real plural variants. A check script fails on missing translations.
- Add a language picker in the app if the store language and the device language can differ.
- `PrivacyInfo.xcprivacy` for app, widget and packages:
  - no tracking, no collected data
  - UserDefaults reasons `CA92.1` (plus `1C8F.1` with an App Group)
- Speech recognition on device; server recognition only after an opt-in.
