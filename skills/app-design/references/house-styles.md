# House styles

Proven styles. In an MVP reuse one instead of designing from scratch. In production, offer one as a
direction or deliberately set it apart. Read the source files before reusing a style.

## Pusteblume – kids apps
- **Source:** `~/Leseapp/LinoLiest/DESIGN.md`, `~/Leseapp/ToniTueftelt/DESIGN.md`, KinderKit.
- **Mood:** soft, round, cheerful. Cream paper, pastel surfaces, one strong colour per action.
- **Colours:**
  - cream `#FFF8EF`, ink `#2D2A4A`
  - families strong/lip/soft/deep: sky `#3A86CF`, mint `#5CC9A7`, sun `#FFC857`, coral `#F06C5B`, lilac `#9B87F5`
- **Type:** Fredoka (UI) and Andika (reading text, single-storey a/g), both under OFL.
- **Shapes:**
  - pill buttons with a 5 pt lip, round lip buttons
  - white cards with a soft shadow, radii 24–36
- **Figure:** a mascot made of SwiftUI shapes, with happy, thinking and sleeping faces.
- **Rules:**
  - errors are never red, touch targets ≥ 56 pt
  - a parent gate before settings and links
  - white text on sky (3.8:1) or green (3.5:1) only at 19 pt bold or larger
- **Fits:** preschool to primary school, learning, family.

## Stoa – editorial, focus, habits
- **Source:** `~/projects/stoicHabits/HabitKit/Theme/Theme.swift`, `landing/`.
- **Mood:** black and white like a journal. No accent: "done" is ink, "not yet" a hairline.
- **Colours:** paper `#F0F1F3`, surface `#FFFFFF`, ink `#0A0A0A`, grey `#8E8E94`, hairline `#DADCE0`, dark `#0B0B0C`/`#161618`.
- **Type:** system sans heavy for display and a lowercase wordmark with a dot ("askesis."), New York serif for quotes.
- **Fits:** productivity, journal, wellness.

## Navy Pro – tools and data
- **Source:** `~/projects/pokedeck/App/DesignSystem/Theme.swift` ("Redesign tokens"), `website/`.
- **Mood:** calm surfaces, one brand colour, big key numbers. Red only for real errors.
- **Colours:**
  - navy accent, light navy for selection
  - canvas `#F2F3F5`, inset `#F7F8FA`, hairline `#E4E7EC`
  - status green, amber and red, each with its own tint
- **Type:** in the app, system with rounded tabular digits; on the website, Bricolage Grotesque + Geist + Geist Mono.
- **Fits:** collector, data and pro tools with many numbers and lists.

## Candidates from test runs (designed, not built)
Canvas "Uhr-App – Design-Richtungen": https://claude.ai/artifact/4j4sq3ZZVTaLZX1MnVFhMW
- **Pusteblume + time area (chosen, A+):** Pusteblume with "Mo" the mouse.
  - Yellow `#FFDC85` appears only inside the clock and stands for elapsed time.
  - Coral = hour, sky = minutes.
- **Bauklotz:**
  - paper `#F4F0E8`, ink `#1B1B1F`, blue action `#2A5CAA`, yellow time area `#F2BF2F`, red only for the hour hand
  - Lexend, flat, no figure; shapes as language (● full, ◐ half hour)
- **Tickhausen (backlog):**
  - paper-cut village, the town-hall clock changes daylight
  - teal `#1F6E78` action, Baloo 2
  - expensive: every scene needs illustration
