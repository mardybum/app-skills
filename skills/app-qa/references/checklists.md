# QA checklists

## Technical
- [ ] Clean build: 0 warnings in own code, Debug and Release
- [ ] Release build without debug launch args, test data or fake camera
- [ ] All unit, package and UI tests green on iPhone and iPad; core coverage measured (aim ≥ 70 %)
- [ ] Engine tested with real data (real lists, real OCR output, every level solvable)
- [ ] Performance noted: launch time, memory with full data, stress seed (`-seedStress N`)
- [ ] No audio, audio session or heavy I/O on the main thread
- [ ] Saving works while the device locks (file protection); old saves load after an update
- [ ] Airplane mode at launch and mid-flow; CDN errors (retries, placeholder)
- [ ] All strings translated, placeholders and plurals right ("1 block"), locale formats, default language on fresh install
- [ ] Size limits for deep links and imports; empty, huge and broken input
- [ ] No keys in repo **or git history** (`git log -p` + patterns or gitleaks); built-in key is `anon` only
- [ ] Backend: RLS tested against local Supabase (own data visible, others' not); sync both ways

## Usability
- Each persona's core flow: count taps against the plan, note hesitation and guessing where to tap.
- First launch without prior knowledge: is it clear within 10 seconds what to do?
- Make mistakes on purpose: is the feedback helpful, not punishing?
- After "Apply", "Save", "Done": is it clear what happened and where you are?
- Jargon only in expert mode or explained.
- Kids:
  - usable without reading, touch targets ≥ 56 pt
  - parent gate before links, settings and purchases
  - the daily limit works

## Accessibility
- [ ] `performAccessibilityAudit()` passes on the main screens
- [ ] VoiceOver:
  - images labelled or marked decorative
  - tiles read as one sentence
  - the selected state is announced
- [ ] Dynamic Type up to AX5: nothing clipped, single column where needed
- [ ] AA contrast in light and dark; Reduce Motion respected

## Device matrix
iPhone 17 / 17 Pro · small iPhone (if supported) · iPad mini, Air 11″, Pro 13″ portrait and landscape ·
a real iPhone for camera, microphone and audio.

## User test guide (template: `~/Leseapp/ToniTueftelt/docs/KINDERTEST.md`)
1. **Goal:** can they use it without help, and do they reach the hypothesis outcome?
2. **Preparation:** device, one profile per person, consent, notes with initials only, no photos of faces.
3. **Flow, about 30 minutes per person:**
   - pre-task without the app (5 minutes)
   - free use while you only watch (15 minutes)
   - a short talk
   - post-task
4. **Observation sheet:**
   - Do they find the start alone?
   - Where do they get stuck?
   - Do they use the hint?
   - Do they want to continue?
5. **Scoring per task:** 2 = alone, 1 = with a nudge, 0 = not solved. Put the results in `STATUS.md`.
