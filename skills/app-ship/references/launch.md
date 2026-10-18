# Launch material

## Landing page
**Models:**
- `~/Leseapp/LinoLiest/website/` (audio samples, waitlist with double opt-in)
- `~/Leseapp/ToniTueftelt/website/` (mini level)
- `~/projects/stoicHabits/landing/` (editorial, live demo, EN/DE in `app.js`)
- `~/projects/pokedeck/website/` (DE/EN via `Scripts/website/build.py`)

**Sections:**
1. Hero: benefit headline, action, device with a real screenshot; fits 1280 × 720.
2. Proof in motion: app video with chapters or a live demo.
3. How it works: 3–4 steps or the method.
4. Features: numbered rows or big screens, never a 6-tile grid.
5. Who it is for.
6. Trust: privacy in one sentence (only if true), where the content comes from, AI labelling.
7. FAQ: 5–8 real questions.
8. Closing action and a footer with imprint, privacy, help and language.

**Tech:**
- Static HTML/CSS; JS only for language, video, demo and form.
- Content never depends on JS to become visible.
- Fonts as woff2 with their OFL file.
- `vercel.json`: `cleanUrls`, CSP (own sources plus Supabase when there is a form), `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`, long asset caching.
- OG image 1200 × 630, favicon, sitemap, robots, 404.
- No analytics unless the user wants it, and then the privacy policy says so.

**Before deploying:**
- [ ] 1440 / 1280 / 768 / 375 px, light and dark, no horizontal scroll
- [ ] AA contrast, links work, no dead buttons
- [ ] texts approved by the user; promises match the app
- [ ] imprint and privacy complete, no placeholders
- [ ] form: success, error, duplicate, honeypot

**Deploy:** `vercel deploy --prod` in `website/`.
- If Vercel is blocked in the sandbox, give the user the exact command.
- Afterwards put the URLs into the store metadata.
- A launch switch (`APP_STORE_URL`) turns on the store links and turns off the form on launch day.

## Waitlist (double opt-in)

| | Lino liest | askesis |
|---|---|---|
| Sign-up | Supabase Edge Function `lino-waitlist` | Vercel function `/api/subscribe` (fra1) |
| Storage | table `lino_waitlist` | Brevo list |
| Confirmation | Brevo mail, `/bestaetigen`, `/abmelden` | Brevo handles it |

**Rules:**
- Lock the table: RLS on, no rights for `anon`; sign-up only through the function.
- Prefix per app in the shared Supabase project.
- Consent checkbox; store the sentence, time, language and source.
- Honeypot, minimum fill time, same-origin check, limit per IP; ignore duplicates silently.
- Delete unconfirmed entries after 30 days.
- Add a waitlist section to the privacy policy.
- The user sets `BREVO_API_KEY`. Brevo needs a company or sender address; clarify that early.
- Test against local Postgres (pattern `supabase/tests/run-local.sh`). Production migrations only with an OK.

## App video and reels
**Models:**
- Deck Buddy: `Scripts/app-video.sh`, `UITests/AppVideoTests`, `video-cut.py`, `reels.py`, `reels/frames.swift`
- askesis: same set, plus `reel-texts.py`

**Steps:**
1. **Script:** 6–8 chapters, one core flow each, as calm UI tests with a seeded state and a fake camera.
2. **Record:** `xcrun simctl io <device> recordVideo` per chapter. Set the status bar to 9:41 first.
3. **Cut:** `video-cut.py` trims stills, joins the chapters and writes the chapter times.
4. **Reels:**
   - 1080 × 1920, 30 fps, silent track
   - headline, phone, end card (name, link, launch call; "unofficial" for fan apps)
   - 5–8 per language, plus a cover PNG and captions
5. **Storage:** Google Drive `Marketing/<App>/`, plus a public copy in `website/video/`.
