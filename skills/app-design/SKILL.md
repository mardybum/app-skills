---
name: app-design
description: "Design for apps and landing pages: three genuinely different directions on a design canvas, the user picks, then refine, write DESIGN.md with tokens and components, review with the design-critic agent and move the tokens into code. Includes concrete rules against the generic AI look (no 'AI orange', no emoji controls, no tile grids). Use it whenever someone wants a new app design, a redesign, an app icon or a design system, says an app 'looks like AI', asks to 'make three proposals' or 'open your designer', or when /app reaches the design step – also for landing pages in the app's style."
metadata:
  version: 2.0.0
---

# App design

Goal: an own, high-quality look with a clear attitude that fits the audience and runs through the
whole app. What worked before:
- **Lino liest:** three directions; the user picked "Pusteblume" (soft, round, cheerful).
- **askesis:** editorial black and white.
- **Deck Buddy:** navy on calm surfaces with big key numbers.

What failed: "AI orange", free drafts that ignored the existing app, and building first, designing later.

Read `references/principles.md` first. For kids, editorial or tool apps also read
`references/house-styles.md`; an existing style may fit.

## 1. Context (without grilling the user)
- **Audience and tone in three adjectives**, usually already in `BRIEF.md`.
- **References and anti-references** ("not the typical AI orange").
- **Redesign:** screenshot the current screens first and build on them. Deck Buddy's user rejected free drafts.
- **Platform conventions:** iOS HIG (tab bar, sheets, SF Symbols, Dynamic Type).

## 2. Three directions
Each direction is **a look plus an idea**, not three colour variants. The best ideas came from the
analysis guidelines, for example "time as a filled area" or "the time of day changes the world".

Per direction:
- name, mood and idea in one sentence each
- a figure or none (mascot, villagers, pure graphics); a template app's figure stays with that app
- palette: neutrals plus **one** action accent (hex values)
- at most two typefaces with character
- shape language: radii, lines or shadows, button style

**Four artboards per direction:**
1. start screen
2. core task on the main device (kids apps: iPad 1180 × 820 landscape, otherwise iPhone 390 × 844)
3. feedback after an error
4. style sheet (palette, type, buttons, 3 principles)

Use real content, never placeholders.

**Where:** with the Artifact tool, run `quickstart` with `intent: "design"`, one row per direction.
Otherwise a local HTML file in the browser pane. Put the canvas link into `STATUS.md`.

**MVP:** one direction or a house style is enough. If the user wants proposals anyway, make three with the four artboards each.

## 3. The user picks (gate)
- For each direction show the idea, why it fits, and the **build cost** (a house style with KinderKit is cheap; illustrating every scene is expensive).
- Give **one** recommendation that suits the mode. Mixing is allowed ("A with the area from B").
- Don't build anything before the choice. Don't screenshot-check the canvas yourself; offer `design-critic` if the user wants a second opinion.
- Directions that were not chosen go to `docs/BACKLOG.md` with the link, why not now, and when.

## 4. Refine
- **Derive the screens from the core flow in `PLAN.md`.** In the test run that meant intro, both task types, error, hint, success, parent area and a style sheet with states. Put them in a new canvas row.
- **When mixing, reassign colour roles:** one colour, one meaning. Check the role table before drawing.
- **States:** pressed, disabled, selected, error, loading, empty, success.
- **Dark mode:** decide explicitly.
- **Large text** up to AX, WCAG AA contrast.
- **iPad** portrait and landscape: grow, never a phone column.

## 5. DESIGN.md
Use `templates/DESIGN.md`. It is the source of truth for every later session:
- mood, 5–7 testable principles
- tokens with hex and role, type scale, spacing, radii, motion
- the core component in detail (e.g. the learning clock)
- components named as in code, tone of voice, do and don't
- what the review changed

## 6. Review
1. Render screenshots: `bash scripts/render-artboards.sh <canvas-folder> <out-folder> [names]` (headless Chromium, sizes from `canvas.json`).
2. Copy the out folder as the "before" state.
3. Run `design-critic` with the screenshot paths, `DESIGN.md`, `references/principles.md` and a word limit.
   - 9 screens took 20 minutes. In an MVP only on request.
4. Fix high and medium findings, render again.
5. `bash scripts/compare.sh <before> <after> <out.png> <names>` gives the user a before/after image.
6. Landing pages: also run `/design-review` (gstack).

## 7. Into code
- One source:
  - `Theme.swift` (adaptive light/dark colours, fonts, radii) or CSS variables
  - components as styles (`PrimaryButtonStyle`, `.card()`)
- No colour values in views. Check with `grep -rnE 'Color\(red:|#[0-9A-Fa-f]{6}' <App>/Views`.
- Build screen by screen and compare each simulator screenshot with its artboard.
- Ship the fonts inside the app or website, with the OFL licence file.

## 8. App icon
From the design system:
- one clear motif, no text, no protected figures
- 1024 × 1024 **without alpha**
- readable at 60 px
- rendered by a script
