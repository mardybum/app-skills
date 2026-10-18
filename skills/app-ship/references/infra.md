# Infrastructure by mode

● required · ○ worth it if there is time · – not needed

| Area | Practice | MVP | Prod | How |
|---|---|---|---|---|
| Repo | private GitHub repo from the first commit | ● | ● | `gh repo create --private --source . --push` |
| | feature branches + PRs, green CI before merge | – | ● | branch protection needs GitHub Pro for private repos; otherwise a rule in CLAUDE.md |
| | SemVer, a tag per release, CHANGELOG | – | ● | `v1.2.0-45`, `/document-release` |
| | pre-commit hook | ● (secrets) | ● (+ format) | `templates/pre-commit` |
| Code | engine as its own package, tokens in one file | ● | ● | `Packages/<Kit>`, `Theme.swift` |
| | linter and formatter | ○ | ● | SwiftFormat, ESLint + Prettier |
| | code review before merge | – | ● | `/review`, `/code-review` |
| Tests | unit tests for core logic | ● | ● | scenario tests from the spec |
| | integration, UI and E2E tests, accessibility audits | ○ | ● | local Supabase, XCUITest, Playwright |
| | coverage with a floor | – | ● | core ≥ 70 % |
| | real devices and real users | ● | ● | early device milestone, `docs/USER-TEST.md` |
| CI/CD | build and tests on every push and PR | – | ● | Xcode Cloud (25 h/month included) or `ci-ios.yml`, `ci-web.yml` |
| | auto deploy + PR previews (web) | ○ | ● | Vercel Git integration or deploy hook |
| | TestFlight upload from CI | – | ○ | Xcode Cloud archive action |
| | migrations via pipeline, smoke test after deploy | – | ● | staging automatic, production with an OK |
| | rollback path, phased release | – | ● | Vercel instant rollback, feature flag, 7-day phased release |
| Environments | dev / staging / production separated | – | ● | second Supabase project or branching |
| | config via env + `.env.example` | ● | ● | never values in the repo |
| Containers | local Supabase in Docker (Colima) | ○ | ● | `supabase start` |
| | Docker for iOS or Vercel | – | – | not useful; only for own servers or E2E with `docker compose` |
| Security | secrets never in chat, repo or docs; rotation after leaks | ● | ● | user sets them; runbook |
| | secret and dependency scans | ● | ● | gitleaks, Dependabot, `npm audit` |
| | RLS on every table, tested with roles | ● | ● | owner / member / stranger |
| | threat model and audit | – | ● | `/cso` |
| | 2FA on every account | ● | ● | GitHub, Apple, Vercel, Supabase, Brevo, Google |
| Data | versioned, idempotent migrations with dry run | ● | ● | `supabase/migrations/`, transaction + rollback |
| | backups and a tested restore | – | ● | check the plan; otherwise a daily `pg_dump` |
| | on-device migration, tests with old saves | ○ | ● | SwiftData `VersionedSchema` |
| Operations | crash and error reports | ○ | ● | Xcode Organizer + MetricKit; Sentry for web |
| | uptime check, cost and quota alerts | – | ● | scheduled smoke test; LLM, Supabase, Vercel, Actions |
| | runbooks: release, rotation, rollback, incident | – | ● | `docs/` |
| Reuse | shared kit as a versioned package | – | ● | KinderKit as its own repo |
| Docs | README, CLAUDE.md, STATUS.md | ● | ● | |
| | DESIGN, ANALYSIS, PLAN, QA-REPORT, APPSTORE, ACCOUNTS (no passwords) | ○ | ● | |

## Graduation checklist (MVP → production)
Tick the items in `STATUS.md`. Items marked ⚑ need the user's OK.

**Foundation**
- [ ] `scripts/audit.sh`, result in STATUS.md
- [ ] gitleaks over the whole history
- [ ] pre-commit hook, formatter over the whole repo (own commit)
- [ ] CI green, Dependabot

**Product**
- [ ] PLAN.md extended to V1, lessons from the user test included
- [ ] ⚑ full design round if the MVP used a house style
- [ ] all languages, translation check, default language set

**Backend (if any)**
- [ ] ⚑ staging
- [ ] ⚑ shared project with a prefix, or an own project
- [ ] migrations via pipeline
- [ ] RLS tests in CI
- [ ] backups with a tested restore
- [ ] rate limits and cost alerts

**Quality**
- [ ] `/app-qa` at production level

**Operations**
- [ ] crash and error reports
- [ ] uptime check
- [ ] `docs/ACCOUNTS.md` with the 2FA state
- [ ] runbooks

**Ship**
- [ ] launch material and store release from `/app-ship`
- [ ] tag and CHANGELOG

Then hand back to `/app`, which sets `Mode: production` with the date.
