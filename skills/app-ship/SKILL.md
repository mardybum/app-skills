---
name: app-ship
description: "Ship an app: landing page in the app's design on Vercel (imprint, privacy, help), launch waitlist with double opt-in, app video and reels from the simulator, store screenshots; App Store release with a rejection-risk sweep, every App Store Connect field prepared and step-by-step guidance through upload, TestFlight and submission; plus infrastructure by mode (CI/CD, staging, secrets, monitoring, backups) and the MVP-to-production graduation checklist, with an audit script. Use it for 'build a landing page', 'deploy to Vercel', 'add a waitlist', 'make reels', 'get ready for the App Store', 'guide me through App Store Connect', 'what infrastructure is missing', 'set up CI/CD', or when /app reaches the ship step or graduation."
metadata:
  version: 2.0.0
---

# App ship

Three parts. Use what the request needs. In MVP modes, launch and release usually wait for graduation.

## A. Launch material
Details: `references/launch.md`.
1. **Landing page** in `website/`:
   - static, in the app's `DESIGN.md` style
   - real screenshots or video
   - imprint, privacy, help, 404, sitemap
   - fonts self-hosted, CSP in `vercel.json`
   - check at 1440, 1280, 768 and 375 px, then run `/design-review` (gstack)
2. **Gate: the user reviews the texts before anything goes live.** The first `vercel deploy` of a
   new project goes straight to production, so show it locally first or deploy a placeholder.
3. **Waitlist:**
   - Supabase table with the app prefix, locked down, plus a function, or a Brevo list
   - double opt-in, honeypot, rate limit, stored consent
   - privacy policy updated
   - the user sets the Brevo key
4. **App video and reels:** UI test → simulator recording → cut → 1080 × 1920 reels. Store them in
   Google Drive `Marketing/<App>/` and put a public copy on the website for Metricool.
5. **Store screenshots** via UI test or script: 6.9″ and 6.3″ (13″ for iPad), every store language.

## B. App Store release
1. **Risk sweep:** run `release-auditor` with `references/appstore.md`, then fix every high risk. Typical fixes:
   - a neutral name
   - accounts off in 1.0
   - privacy manifest set to "no data collected"
   - contact data on the support page
   - parent gate
   - icon without alpha
   - `TARGETED_DEVICE_FAMILY` in every target
2. **`docs/APPSTORE.md`** from `templates/APPSTORE.md`: every App Store Connect field in order,
   including the review note with test paths that need no special hardware.
3. **Archive and upload** with `archive.sh --upload` (see `app/references/house.md`).
   - Before that: a fresh simulator in the store language, a release build, the core flow played once.
   - Tag `v<version>-<build>`.
4. **Guide the user:**
   - one step per message with field name and value; wait for "done"
   - the user types passwords, phone and payment data himself
   - order: create app → TestFlight → self-test like a reviewer (checklist in `references/appstore.md`) → store page → privacy and age rating → release "manually" → submit
5. **Afterwards:** give an honest rejection risk, then switch the website to the store link and mail the waitlist.

**Web production:**
- env vars complete
- migration dry run, then apply with an OK
- deploy via CI, then a smoke test and role checks
- monitoring and cost alerts on, a rollback path known

## C. Infrastructure and graduation
1. **Audit:** `bash scripts/audit.sh <repo>` shows ✅/❌ per item. Compare the result with the mode.
2. **MVP minimum:**
   - private repo, `.gitignore`, `CLAUDE.md`
   - secrets only in env, `.env.example`
   - `templates/pre-commit` hook
   - lockfiles
3. **Production set, in this order** (`references/infra.md` has the details):
   1. CI on every push: Xcode Cloud with `templates/ci_post_clone.sh`, or `templates/ci-ios.yml` / `ci-web.yml`
   2. lint and format
   3. Dependabot and gitleaks
   4. branches with PRs
   5. staging
   6. migrations via pipeline
   7. tags and CHANGELOG
   8. crash and error monitoring
   9. backups with a tested restore
   10. cost alerts
   11. account inventory with 2FA
   12. runbooks
4. **Graduation:** work through the checklist in `references/infra.md`, then hand back to `/app`.

## Rules
- Production changes (database, domains, DNS, secrets) only with an OK.
- Propose new services with their cost; never create them silently.
- Keep config in the repo: workflows, `vercel.json`, Supabase migrations.
