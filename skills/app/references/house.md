# Shared setup across all apps

Check here before creating accounts, projects or services. IDs and paths may have changed, so verify them.

## Accounts and services

| Service | State | Note |
|---|---|---|
| GitHub | account `mardybum`, all app repos private | `gh repo create mardybum/<name> --private --source . --push` |
| Apple Developer | paid team `JTF9P5K777` | one account for all apps; `DEVELOPMENT_TEAM` in `project.yml` |
| Bundle IDs | prefix `de.rudall` | Deck Buddy uses `de.yanrudall.pokedeck` |
| Supabase | one shared project in Frankfurt, ref `unrfqwmvsaoishifbwrd` | prefix tables and functions per app (`lino_`, `askesis_`); production apps need staging (see `/app-ship`) |
| Brevo | double opt-in mails, lists | the user sets the API key as a secret; requires a company or sender address |
| Vercel | one project per website, `<app>.vercel.app` | **the first `vercel deploy` of a new project without Git goes straight to production**, even without `--prod` |
| Google Drive | `~/Google Drive/Meine Ablage/Marketing/<App>/` | finished videos and reels always go here |
| Metricool | social scheduling | needs public video URLs (put them on the website) |

## Template repos

| For | Template | Path |
|---|---|---|
| Kids app (iOS) | Toni tüftelt + KinderKit (design, voice, storage, parent gate, learning path, tab bar) | `~/Leseapp/ToniTueftelt` |
| Kids app with reading | Lino liest | `~/Leseapp/LinoLiest` |
| Tool or data app (iOS) | Deck Buddy: Swift package with modules, data pipeline, scanner, accounts | `~/projects/pokedeck` |
| Habit or journal app (iOS) | askesis: engine package, widgets, App Intents, App Group | `~/projects/stoicHabits` |
| Web SaaS | Hablamos: Next.js, Supabase auth, RLS, Stripe, i18n, CI | `~/projects/hablamos-app` |

### Using KinderKit
- It lives inside `ToniTueftelt/Packages/KinderKit`. SwiftPM cannot load a package from a subfolder of another repo.
- **MVP:** use a local path and note it as a risk in `CLAUDE.md` and in the plan.
- **Production:** move KinderKit into its own private repo with tags first (backlog item: "before a third kids app").
- Never copy its files.
- A figure and a voice belong to one app (Lino the owl with "Lena", Toni the turtle with `toni-1`). A new app decides in the plan whether it gets its own.

## Proven scripts to copy

| Purpose | Source |
|---|---|
| Archive and upload | `~/projects/pokedeck/Scripts/archive.sh`, `~/projects/stoicHabits/scripts/release/` |
| Switch to the paid team | `~/projects/pokedeck/Scripts/use-paid-team.sh` |
| Fill contact data everywhere | `~/projects/pokedeck/Scripts/fill-contact.py` |
| Store screenshots | `~/projects/pokedeck/Scripts/screenshots.sh`, `~/Leseapp/ToniTueftelt/ToniTueftelUITests/AppStoreScreenshots.swift` |
| App video from the simulator | `~/projects/pokedeck/Scripts/app-video.sh` + `video-cut.py` (same in askesis) |
| Reels 1080×1920 | `~/projects/pokedeck/Scripts/reels.py` + `reels/frames.swift` |
| UI tests | `~/projects/pokedeck/Scripts/run-ui-tests.sh` |
| Translation check | `~/projects/pokedeck/Scripts/l10n/` (fails on missing translations) |
| Website DE/EN build | `~/projects/pokedeck/Scripts/website/build.py` |
| App icon render | `~/Leseapp/ToniTueftelt/tools/icon/`, `~/projects/stoicHabits/scripts/make_app_icon.swift` |

## Voice
- Pipeline: `~/Leseapp/LinoLiest/tools/voice/README.md`.
  - Qwen3-TTS (Apache 2.0) runs locally via mlx-audio, the voice comes from VoiceDesign, and Whisper checks quality.
  - Clips are pre-rendered and ship inside the app: offline, no running costs.
- Every sentence lives in a speech catalogue, and a test reports sentences without a recording.
- Always label the voice "AI-generated" in the app.

## Reverse engineering
- REA lives in `~/Leseapp/rea`, the skill is `reverse-engineer-anything`.
- Analysed so far: ANTON (web), the Scratch editor and Streaks.app.
- There is no decompiler on this Mac. Ask before installing one.

## Legal texts
- Imprint and privacy policy exist in `~/Leseapp/LinoLiest/website/impressum.html` and `datenschutz.html`.
- Take the contact data from there. Never copy it into skills or docs.
