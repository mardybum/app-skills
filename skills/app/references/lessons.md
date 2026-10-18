# Lessons from past apps

Each item cost real time once. Read before building and before shipping.

## Working
- **Confirm the target repo when several sessions run.** A change meant for Conjugamos landed in Lino and had to be reverted.
- **One session writes a given set of files.** Others send fixes as messages.
- **Test on a real device early.** Camera focus, live scanning and speech recognition behave differently in the simulator.
- **Real user tests:** in MVP modes they are the whole point.
- **No keys in chat.** Brevo and Gemini keys ended up in plain text in transcripts.

## iOS
- **Never touch audio on the main thread.** `AVAudioPlayer` create, play and stop can freeze the UI for up to a minute.
  - Use dedicated queues (`AudioWork` in KinderKit).
  - Never call `sessionQueue.sync` from main.
- **File protection `completeFileProtectionUntilFirstUserAuthentication`** for saved data, or saving fails when the device locks.
- **XcodeGen: set `TARGETED_DEVICE_FAMILY` in every target.** The per-target default "1,2" overrides the project setting; askesis build 1 claimed iPad support.
- **Decide the default language on purpose.** askesis launched in German although the store was English.
  - Before uploading, run a fresh simulator in the store language.
- **App icon without an alpha channel**, otherwise App Store Connect rejects the upload.
- **Parent gate with a typed answer** (two-digit number × digit), not four buttons; a child guesses one in four.
- **iPad must not be a phone column.** Scale up (`kidScale`) or build a real layout; test portrait and landscape.
- **Never load foreign data live in the app.**
  - Build a catalogue and ship it.
  - Update it through a verified service, and reject updates that shrink it (TCGdex once served stale data).
- **CDN images need retries.** A short 503 otherwise shows placeholders for good.
- **Apply appearance (light/dark) to the window**, not just a view, or open sheets ignore it.

## Content and legal
- **No protected names** in app name, icon or screenshots. "PokéDeck" became "Deck Buddy" (guideline 5.2.1). Mark fan apps "unofficial".
- **Label AI voices** ("AI-generated") in the app and the store texts.
- **Reverse engineer public parts only** and record the legal frame in `ANALYSIS.md`.
- **Self-host fonts** (OFL) and name their licences in the store details.
- **The imprint needs a postal address.** Reuse the existing imprints; never ask again or copy the data.

## Store and release
- **Turn accounts off in 1.0 unless needed.** An account means:
  - a demo account for the reviewers and working confirmation mails
  - account deletion in the app
  - Sign in with Apple, if Google login is offered
- **Pick the store primary language and the app default language together.**
- **Screenshots in 6.9″ and 6.3″** (plus 13″ for iPad apps).
- **Check access to the Apple ID mail address before the first upload.**
- **Vercel may be blocked in the sandbox.** Then give the user the exact command for their terminal.
- **The first `vercel deploy` of a new project without Git goes straight to production** (`<project>.vercel.app`),
  even without `--prod` (Lernbande, 2026-10-18).
  - If the user wants to review texts first: show the site locally only, or deploy a placeholder page first.
- **Metricool only loads videos from a public URL.** Put reels on the website too.

## Product and usability
- **Never punish trying.** Stars for attempts made kids stop experimenting.
- **Staged hints.** If the first hint shows the full solution, kids just wait for it.
- **Make tap targets obvious.** Nobody knew they had to tap the card image.
- **After "Apply" or "Save", lead back and confirm.**
- **Jargon only in expert mode.**
- **Colour roles:** one colour, one meaning. Mixing two design directions caused four clashes.
