# App Skills

Four Claude Code skills that build apps the same proven way – from idea to App Store. They start
their own review agents. Learned from five real apps: Lino liest, Toni tüftelt, Deck Buddy, askesis, Hablamos.

```bash
./install.sh
```

## Usage

Just describe what you want. `/app` does the rest and calls the other skills when it's their turn.

```
/app build an iPad app that teaches kids to read the clock. ages 5–8, free, no account. MVP first.
```

| Skill | For | Example | Starts agents |
|---|---|---|---|
| `/app` | new app, continue, switch mode | `/app where are we? continue` | app-researcher, persona-tester, domain-expert |
| `/app-design` | 3 directions, DESIGN.md, redesign, icon | `/app-design three proposals, not the typical AI orange` | design-critic |
| `/app-qa` | technical, usability, domain, UI tests | `/app-qa full QA: technical, usability, accessibility` | qa-engineer, persona-tester, domain-expert, design-critic |
| `/app-ship` | landing page, videos, App Store, CI/CD | `/app-ship get it ready for the App Store and guide me` | release-auditor |

More examples:
```
/app production mode: iOS app for climbers to log routes, German and English, App Store.
/app reverse engineer the maths part of ANTON with REA and build something better. Design like Lino.
/app new kids app "Fipsi counts", numbers to 20. Use Toni as template.
/app web SaaS for music teachers, multiple teachers, classes by code, Next.js + Supabase like Hablamos.
/app-ship build a landing page in the app's design with a waitlist and deploy to Vercel
/app-ship what infrastructure is missing here?
```

## Modes

| Mode | For | Ends with |
|---|---|---|
| `mvp` | quickly check one idea | test with 3–10 real users |
| `mvp-first` (default) | start small, grow after the test | graduation |
| `production` | real users and the store | store approval |

**Switch from MVP to production:** `/app switch to production` (or "we're growing it").
That runs the graduation – infra checklist, full design round, plan V1, QA and ship at production
level – and only then writes `Mode: production` into `docs/STATUS.md`. Don't edit the mode by hand.

**Dry run:** `/app test run, don't build – stop after the plan` works in a scratch folder.

## Layout

```
skills/app/          flow, modes, graduation · references: house setup, lessons, iOS, web · templates
skills/app-design/   principles, house styles, DESIGN template, render + compare scripts
skills/app-qa/       checklists, QA report template
skills/app-ship/     launch, App Store risks, infra + graduation · CI/hook templates · audit script
agents/              6 review agents (they report, they never edit)
```

`install.sh` symlinks everything into `~/.claude`, so edits here apply immediately.
Run `./validate.sh` after changes.
