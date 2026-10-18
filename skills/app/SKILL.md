---
name: app
description: "Build an app from idea to App Store with a proven flow: brief, research, plan, design, build, user review – then hand over to app-qa and app-ship. Three modes: mvp (test an idea fast), mvp-first (start small, graduate later) and production (ready for real users and the store). Use it whenever someone wants to build a new app or prototype, resume an app project ('where are we?', 'continue'), switch from MVP to production, or says things like 'build me an iOS app for…', 'reverse engineer X and make it better', 'bau mir eine App', even if they never mention a skill."
metadata:
  version: 2.0.1
---

# App

You run an app project. The user is the product owner: idea, judgement, approvals. You do everything
else. Talk to the user in their language and keep reports short.

## Start
- `docs/STATUS.md` exists → read it, say in one sentence where the project stands, continue there.
- Otherwise it is a new project → step 1.
- Several projects or sessions open → confirm the target repo before the first change.

## Modes

| | mvp | mvp-first (default) | production |
|---|---|---|---|
| Goal | test one assumption | MVP first, then graduate | real users, store |
| Scope | one core flow | like mvp | full V1 |
| Design | house style or one direction | like mvp | three directions + review |
| Tests | unit tests + simulator run | like mvp | + UI tests, accessibility, QA report |
| Infra | private repo, CLAUDE.md, clean secrets | like mvp | CI/CD, staging, monitoring |
| Ends with | test with 3–10 real users | graduation | store approval |

Always, even in an MVP, because retrofitting was expensive every time: design tokens in one file,
logic in its own package, strings in String Catalogs, no tracking SDKs, stable IDs for saved data,
a private GitHub repo.

## Flow

| Step | Result | Gate (user decides) |
|---|---|---|
| 1 Brief | `docs/BRIEF.md`, `docs/STATUS.md` | – |
| 2 Research | `docs/ANALYSIS.md` | only if a spike fails |
| 3 Plan | `docs/PLAN.md` | approve the plan |
| 4 Design | `/app-design` → `DESIGN.md` | pick a direction |
| 5 Build | app, tests, one commit per milestone | – |
| 6 User review | feedback fixed | user tests it |
| 7 QA | `/app-qa` → `docs/QA-REPORT.md` | – |
| 8 Ship | `/app-ship` → landing page, store, infra | public texts, store submission |

After every step:
1. Write the result as a file in the repo.
2. Update `STATUS.md`.
3. Report in 3–5 lines: what is done, what was verified and where (simulator, device, live), what was not.

Ask only at gates, otherwise keep going. The user wants speed.

### 1. Brief
- Take what is already in the user's message. Ask at most one round of questions, and only about
  what changes the direction: mode, platform, audience, model app or template, constraints.
- **Mode:** the user's words win.
  - "erstmal MVP" or "to test" → mvp-first
  - "just check if it works" → mvp
  - "launch" or "App Store" → production
- **Commit rule:** use the default (commit and push after each green milestone) and state it. Don't ask.
- **Hypothesis** (MVP modes): "We believe [audience] achieves [outcome] when [core flow]. We know when
  [signal]." The signal must test every part of the outcome and needs a pass criterion, who takes part, and how it is measured.
- A working title is fine. Templates: `templates/BRIEF.md`, `templates/STATUS.md`.

### 2. Research
- **Competitors** (MVP: top 3, production: 4–6):
  - features, price, ratings
  - **weaknesses** from reviews: App Store page in the browser, blog tests, forums
  - mark each one as evidenced or thin
- **Model app to beat:** reverse engineer only the public parts with the skill
  `reverse-engineer-anything` (REA in `~/Leseapp/rea`). Take ideas, never assets or code.
- **Domain:** rules, standards, research, each with a source.
- **Risks:**
  - technical → spike now with real data and a go criterion
  - usability → early prototype milestone with a device test
  - learning effect → covered by the user test
- End with 5–8 guidelines for the app.
- Production: run `app-researcher` agents in parallel, one per topic. MVP: research yourself.
- Template: `templates/ANALYSIS.md`.

### 3. Plan
- **Personas:** MVP 2 plus the person who runs the user test; production 3. Give each core flow a target tap count.
- **Scope in and out.** In an MVP the out list is longer. Describe the core flow completely:
  interaction, feedback for each error, hints, how wrong answer options are built.
- **Counter-check:** how could someone finish the task without reaching the goal (memorising pairs,
  solving by ear, waiting for the hint)? Every gap gets a countermeasure.
- **Architecture:**
  - engine package with tests
  - layers, data, languages
  - debug modes: UI-test mode, screenshot seed, fake camera
- **Milestones** M0 … Mn, each with a definition of done: clean build, green tests, flow played in the
  simulator with a screenshot, commit. MVP: M0 + 2–4 + user test. Production: add an infra milestone.
- **Risks,** including hardware-only features. Those get an early device test.
- **Review before approval:** start in parallel
  - `persona-tester` (always)
  - `domain-expert` (production, or an MVP whose hypothesis is about the domain, e.g. learning)

  Apply valid findings and list "what the review changed".
- **Gate:** summarise in a few lines and ask for approval.
- **Live apps with real users:** plan mode, a branch, no deploy without an OK, existing data is never lost.
- Template: `templates/PLAN.md`.

### 4. Design
Run `/app-design` before building UI. The engine milestone may run in parallel.

### 5. Build
- **Setup:**
  - `references/ios.md` or `references/web.md`
  - template app if one fits (`references/house.md`)
  - `git init`, then `gh repo create mardybum/<name> --private --source . --push`
  - `CLAUDE.md` from `templates/CLAUDE.md`, a README
- **Each milestone:**
  1. logic first, with tests
  2. UI only from `DESIGN.md` tokens
  3. real content
  4. build and test
  5. play the flow in the simulator or browser, provoke errors, take a screenshot
  6. update `STATUS.md`, commit, report in 3 lines

  Don't wait between milestones.
- **From day one:** String Catalogs, accessibility labels and identifiers, debug launch arguments,
  `PrivacyInfo.xcprivacy`, stable IDs. Read `references/lessons.md` before you build.

### 6. User review
- Start the app for the user and give 4–6 numbered things to try.
- Sort the feedback into bugs, usability and scope:
  - fix bugs and usability issues right away
  - for scope, recommend now, backlog or no
- If something fundamental fails (for example live scanning does nothing), research and measure before patching.

## Graduation: MVP → production
The user can start it at any time ("switch to production", "wir bauen aus"). In mvp-first you propose
it once the user test has been analysed. If there is no user test yet, say the hypothesis is unproven
and ask once.

1. Summarise the test. The user decides: grow, rework (back to the plan) or stop.
2. Run the infra checklist in `/app-ship` (section "Graduation").
3. Do a full design round if the MVP used a house style.
4. Extend `PLAN.md` to V1. Build, QA and ship at production standard.
5. Only then set `Mode: production` and the date in `STATUS.md`. Never flip the mode silently.

## Rules
- **Always ask before:** plan, design direction, public texts, production changes (database, live deploy), money or accounts, store submission, deleting.
- **Do it yourself:** run commands, renders, uploads and deploys yourself. Never end with "run this
  command". The user only does what needs their account: passwords, clicks in App Store Connect, payments.
- **Never type** passwords, keys or payment data. The user sets secrets (`supabase secrets set`,
  Vercel env, `.env.local`). If a key shows up in chat: use it, never commit it, and tell the user to rotate it.
- **Agents only review and report.** Only this session edits files. Start independent reviews in
  parallel. They cost time (a design review of 9 screens took 20 minutes), so keep them lean in an MVP.
- **Ideas for later** (and design directions that were not chosen) go to `docs/BACKLOG.md` with why and when.
- **Dry run** ("test run, don't build"): work in a scratch folder, no GitHub repo, stop after the plan gate.

References: `references/house.md` (accounts, template repos, scripts, voice, REA, legal texts) ·
`references/lessons.md` (read before build and before ship) · `references/ios.md` · `references/web.md`.
