---
name: app-qa
description: "QA for an app: technical QA engineering (build, tests, coverage, performance, security, data), usability walkthroughs with personas and tap counts, a domain review ('do kids actually learn something?'), UI tests, accessibility audits and a device matrix. Review agents run in parallel; this session fixes; the result is docs/QA-REPORT.md. Use it when someone says 'do full QA', 'QA engineering, technical and usability', 'code review and testing', 'UI test, VoiceOver', 'is this App Store ready?', 'what is still missing to make it usable?', or when /app reaches the QA step."
metadata:
  version: 2.0.0
---

# App QA

Goal: before strangers see the app, the bugs are found, fixed and documented, and it is clear what
is still open. Deck Buddy's first round found 11 technical and 9 usability issues. Toni's domain
review showed kids only learned "try arrows until it works", which changed stars, hints and task types.

## 1. Start the reviews in parallel (one message)
Give each agent the paths to `docs/PLAN.md` (personas, target taps), `DESIGN.md` and
`references/checklists.md`. Each agent that runs the app gets its own simulator, so they don't collide.

| Agent | Checks |
|---|---|
| `qa-engineer` | build, tests, coverage, performance, security, data, languages, edge cases |
| `persona-tester` | each persona's core flow in the simulator, tap counts, stumbling points |
| `domain-expert` | learning effect, rules, content, age fit (only with a domain core) |
| `design-critic` | screens against `DESIGN.md`, iPad, large text (production) |

## 2. Your own checks while they run
- Release build: no debug or test parts.
- Launch in airplane mode: no crash.
- Fresh install in the store language: does the app start in the right language?
- Load old saved data: is nothing lost?

## 3. Merge and fix
1. Remove duplicates. Give each finding a severity (high, medium, low), its impact and evidence.
2. Fix high and medium now in small `fix:` commits. Only this session edits. Re-check after each fix.
3. Product findings ("stars punish trying", "too little content"): recommend with a reason. If it is clear-cut, just do it and report.

## 4. UI tests and accessibility (production)
- XCUITest flows for every persona.
- `performAccessibilityAudit()` on the main screens; VoiceOver reads tiles as one sentence.
- Dynamic Type up to AX, contrast in light and dark.
- Device tour: small and large iPhone, iPad mini / Air 11″ / Pro 13″, portrait and landscape (like `IPadTour` in Toni).
- A UI-test mode with in-memory sample data.

## 5. Real user test
Write `docs/USER-TEST.md` from the guide in `references/checklists.md`: goal, pre/post tasks,
observation sheet, consent. The user runs the test. In MVP modes this is the exit criterion.

## 6. Report
`docs/QA-REPORT.md` from `templates/QA-REPORT.md`. Tell the user in a few lines:
- ready or not
- what changed
- what is open
- what nobody checked on a real device or with real users

## By mode
| | MVP | Production |
|---|---|---|
| Technical | build, unit tests, core flow, airplane mode | full checklist |
| Usability | `persona-tester` with 1–2 personas | 3 personas, tap counts against the plan |
| Domain | only with a domain hypothesis | `domain-expert` with standards |
| UI tests | none or one smoke test | all core flows, accessibility audits, device matrix |
| Report | section in `STATUS.md` | `docs/QA-REPORT.md` |
