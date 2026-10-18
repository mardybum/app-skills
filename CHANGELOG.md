# Changelog

## 2.0.1 – 2026-10-18
- app, app-ship: run commands and deploys yourself, never hand them to the user (user feedback).

## 2.0.0 – 2026-10-18
- Restructured into four skills, down from nine:
  - `app`: brief, research, plan, build, review, modes, graduation
  - `app-design`
  - `app-qa`
  - `app-ship`: launch, App Store, infra
- Everything translated to English and shortened. Skills talk to the user in the user's language.
- Agents rewritten in English; paths point to the new skills.
- install.sh removes stale links of old skill names.
- New lesson: the first `vercel deploy` of a new project goes straight to production (from Lernbande).
- Test-run findings summarised in `docs/test-run-2026-10.md`.

## 1.x – 2026-10-17/18
- 1.0: first version with app-builder plus eight phase skills, six agents.
- After the clock-app test run (brief → plan → design → refine → review):
  - modes follow the user's words
  - hypothesis with a pass criterion
  - domain-expert in an MVP with a domain hypothesis
  - KinderKit embedding note
  - four artboards per direction
  - colour roles when mixing
  - render and compare scripts
  - non-chosen directions go to the backlog
  - graduation can be triggered at any time
