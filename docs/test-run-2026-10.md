# Test run: clock app (2026-10-17/18)

A made-up brief ("kids learn to read the clock, iPad + iPhone, MVP first") ran through brief →
research → plan → design (three directions) → refine → design review. No app was built.
The canvas lives at https://claude.ai/artifact/4j4sq3ZZVTaLZX1MnVFhMW.

## What worked
- **Flow and files:** the skills loaded, and BRIEF, ANALYSIS, PLAN, STATUS and DESIGN were created in order.
- **persona-tester:** 10 findings, 4 of them high, all valid. It changed the plan a lot (snap grid, intro to the clock hands, memorising, no pass criterion).
- **design-critic:** 15 findings, 2 high. The hands covered numbers, and yellow had four meanings. All were fixed and verified with before/after renders. It took 20 minutes.
- **Directions with an idea** were the strongest: "time as a filled area" and "the clock changes the village".

## What was fixed in the skills
1. Modes follow the user's words. The commit rule is the default, without asking.
2. Agents in an MVP: persona-tester only, plus domain-expert when the hypothesis is about the domain. There were contradictions between the skills.
3. The hypothesis needs a signal for every part of the outcome, a pass criterion, who takes part and how it is measured.
4. Risk types:
   - technical → spike
   - usability → prototype milestone
   - learning → user test
5. KinderKit lives inside the Toni repo. It is a local path in an MVP and its own repo in production.
6. The MVP plan is short, but the core flow is described completely. A counter-check asks whether the task can be solved without reaching the goal.
7. Four artboards per direction: start, core task on the main device, error feedback, style sheet.
8. Gate with build cost and one recommendation. Directions that are not chosen go to the backlog. No self-check of the canvas.
9. Refining:
   - screens come from the plan
   - colour roles are reassigned when mixing
   - render and compare scripts
10. Graduation can be triggered at any time from mvp and from mvp-first.

## Not tested yet
Build, QA, ship and the agents app-researcher, qa-engineer and release-auditor. They need a real app.
