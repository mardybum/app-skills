# Design principles and the anti-AI look

Learned in the reviews of Lino liest, askesis, Deck Buddy and the clock-app test run. If a rule is
broken on purpose, `DESIGN.md` says why.

## Signs of generic AI design – and what to do instead

| Pattern | Why it looks cheap | Instead |
|---|---|---|
| orange-purple gradients, neon, "AI orange" as primary | looks like every generated app | own primary from the mood (petrol, navy, ink), rest neutral |
| emoji as controls | inconsistent, differs per system | SF Symbols or own shapes; emoji only as content |
| grid of 3 or 6 tiles with icon, title, blurb | template look, breaks into a long column on tablets | numbered rows with hairlines, real screenshots, one statement per section |
| shadows under everything, 3D blocks | noisy, text gets blurry | shadows only under surfaces, never under text; otherwise hairlines |
| everything equally loud | no hierarchy | **one** strong colour per screen or action |
| placeholders, lorem ipsum | looks unfinished, lies about density | real content; a "lived-in" seed for screenshots |
| dead buttons ("Coming to the App Store") | look tappable, do nothing | status chip; a button only once it works |
| phone column on iPad | looks like a port | grow (up to 1.3×) or a real two-column layout |
| red errors for kids | feels like punishment | fade + short wiggle; feedback in a calm colour |
| one colour with two meanings | the learning signal gets lost | a role table: one colour, one meaning |
| straight quotes, "1 blocks" | sloppy detail | typographic marks, real plural forms |

## Craft
- **Hierarchy:**
  - one focus and one main action per screen
  - key numbers big, with tabular digits
- **Type:** at most two families, matching the tone:
  - playful: Fredoka + Andika
  - editorial: system sans heavy + New York serif
  - tool: Bricolage Grotesque + Geist
- **Colour:**
  - neutral surfaces plus one accent; content colours only for content
  - status colours checked for AA in light and dark
  - never mix warm and cool greys
- **Space:**
  - 8 pt grid
  - touch targets ≥ 44 pt (kids ≥ 56 pt), one radius system
- **Motion:**
  - UI transitions ≤ 300 ms, scroll reveals ≤ 650 ms
  - respect Reduce Motion
  - content never depends on a script to become visible
- **States:**
  - empty states invite with an action
  - errors say what happened and what to do
  - loading never freezes
- **Accessibility is design:**
  - AA contrast (4.5:1 text, 3:1 large text and controls)
  - stack at large text sizes
  - hide decoration from VoiceOver

## Landing pages
- **Hero:** fits a 1280 × 720 screen: headline, subline, action, product image.
- **The product is the star:** real screenshots in device frames, an app video with chapters, a live demo where possible.
- **Tech:**
  - self-hosted fonts, no Google requests
  - CSP and security headers
  - 44 px hit areas for nav and the language switch
- **Copy:** never promise what the app doesn't do ("no account", "no tracking", "offline").
