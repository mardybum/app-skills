# App Skills – Regeln für Änderungen

- Jeder Skill liegt in `skills/<name>/SKILL.md` mit Frontmatter `name` (= Ordnername, kebab-case),
  `description` (≤ 1024 Zeichen, sagt was und wann, mit typischen Formulierungen des Users) und
  `metadata.version` (SemVer).
- SKILL.md bleibt unter 500 Zeilen. Details gehören nach `references/`, Vorlagen nach `templates/`.
  Jede Datei, die SKILL.md nennt, muss existieren (`./validate.sh` prüft das).
- Agenten in `agents/<name>.md` mit `name` und `description`. Sie prüfen und berichten, sie ändern
  keinen Code. So bleibt die Haupt-Session der einzige Schreiber.
- Sprache: Deutsch, aktiv, kurz. Erkläre das Warum (am besten mit dem Projekt, in dem es gelernt
  wurde) statt Großbuchstaben-Befehlen.
- Neue Erfahrungen aus Projekten kommen nach `skills/app-builder/references/lessons.md`. Die
  passende Phase verweist darauf.
- Keine Secrets, Kennwörter oder privaten Adressen in diesen Dateien.
- Nach jeder Änderung `./validate.sh`, dann Version im betroffenen Skill erhöhen und committen.
