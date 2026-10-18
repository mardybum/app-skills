# <App name>

<One sentence: what the app is and for whom.> Mode and current step: `docs/STATUS.md`.

## Commands
```bash
xcodegen generate
xcodebuild -project <App>.xcodeproj -scheme <App> -destination 'platform=iOS Simulator,name=iPhone 17' test
```

## Structure
- `Packages/<Kit>/`: engine without UI. New rules go here first, with a test.
- `<App>/Views/Components/Theme.swift`: the only place for colours, fonts and radii (see `DESIGN.md`).
- `docs/`: BRIEF, ANALYSIS, PLAN, QA-REPORT, APPSTORE, BACKLOG.

## Conventions
- Commit and push after each green milestone.
- All strings via `Localizable.xcstrings`; default language: <…>.
- No colour values in views; add new components to `DESIGN.md`.
- Debug launch arguments: `-uitest`, `-screenshots` (only `#if DEBUG`).

## Pitfalls
- Never touch audio on the main thread.
- Save with file protection `completeFileProtectionUntilFirstUserAuthentication`.
- `TARGETED_DEVICE_FAMILY` in every target of `project.yml`.
- <app-specific>

## Never
- Commit keys or write them into docs.
- Deploy or touch production data without an OK.
