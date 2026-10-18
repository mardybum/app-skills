# Plan – <App name>

Date: <date> · Mode: <…> · Status: <draft / approved on …>

**Goal:** <one paragraph; in MVP modes the hypothesis from BRIEF.md>

## Personas
| Name | Who | Goal | Core flow | Target taps |
|---|---|---|---|---|
| <Mila, 5> | <can't read yet> | | | ≤ <n> |

## Scope
**In:** <…>

**Core flow in detail:** <interaction, feedback for each error, hints, how wrong options are built>

**Counter-check:** <how the task could be solved without reaching the goal → countermeasure>

**Out (and why):** <…>

## Architecture
- Engine: `Packages/<Kit>` – <what it computes>, tests for <…>
- Data: <SwiftData / JSON / App Group / Supabase> · stable IDs: <…>
- Languages: <…> via String Catalogs · debug modes: <-uitest, -screenshots, fake camera>

## Milestones
| # | Result | Definition of done |
|---|---|---|
| M0 | setup, app starts | clean build, repo pushed, CLAUDE.md |
| M1 | engine with tests | <n> scenario tests green |
| M2 | <…> | flow played in simulator, screenshot |
| Mn | user test (MVP) | docs/USER-TEST.md: participants, pre/post test, pass criterion |

## Risks
| Risk | Visible when | Plan B |
|---|---|---|
| <hardware-only: …> | <M2, device test> | <…> |

## What the review changed
- <finding> → <change>

## Open decisions for the user
- <…>
