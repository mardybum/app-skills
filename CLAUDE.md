# App Skills – rules for changes

- Keep it at **four skills** (`app`, `app-design`, `app-qa`, `app-ship`). New topics go into a
  skill's `references/` rather than a new skill.
- Every `skills/<name>/SKILL.md` has frontmatter:
  - `name` equal to the folder
  - `description` ≤ 1024 characters: what it does and when, with typical user phrases
  - `metadata.version` (SemVer)
- Keep each SKILL.md short (aim under 150 lines). Details go to `references/`, templates to `templates/`.
  Every file a SKILL.md names must exist (`./validate.sh` checks this).
- Agents in `agents/<name>.md` only review and report; the main session is the only writer.
- Everything in English. The skills talk to the user in the user's language.
- New lessons from projects go to `skills/app/references/lessons.md`.
- No secrets, passwords or private addresses in these files.
- After every change: `./validate.sh`, bump the version of the changed skill, add a line to `CHANGELOG.md`, commit.
