---
name: app-infra
description: "Infrastruktur und Software-Best-Practices für App-Projekte, abgestuft nach Modus: Repo, CI/CD (Xcode Cloud oder GitHub Actions für iOS, GitHub Actions + Vercel für Web), Lint und Format, Pre-Commit mit Secret-Scan, Dependabot, Umgebungen (Dev/Staging/Prod), Migrationen per Pipeline, Monitoring und Crash-Berichte, Backups, Kosten-Alarme, Konten-Inventar und die Checkliste für den Schritt vom MVP zu Production. Mit Audit-Skript, das zeigt, was in einem Repo fehlt. Nutze diesen Skill bei 'welche Infrastruktur fehlt', 'richte CI/CD ein', 'automatische Tests', 'Staging', 'Monitoring', 'Containerisierung', 'Best Practices für skalierbare Software', 'MVP in Produktion bringen' oder wenn app-builder die Graduation startet."
metadata:
  version: 1.0.0
---

# App-Infrastruktur

Ziel: so viel Infrastruktur, wie der Modus braucht, und nicht mehr. Ein MVP mit voller Pipeline
verschwendet Tage. Eine Production-App ohne CI, Staging und Monitoring ist Glückssache: Bisher
liefen alle Apps auf einem einzigen Supabase-Produktionsprojekt, und nur Hablamos hatte CI.

## 1. Bestandsaufnahme

```bash
bash <dieser-skill>/scripts/audit.sh <repo-pfad>
```

Das Skript zeigt pro Punkt ✅ / ❌:
- Remote
- CI-Workflows
- Lint- und Format-Konfiguration
- Pre-Commit-Hook
- Dependabot
- Tags, CHANGELOG
- CLAUDE.md, STATUS.md
- Privacy Manifest
- Tests
- `.env.example`
- getrackte Secret-Dateien

Gleiche das Ergebnis mit `references/best-practices.md` und dem Modus aus `docs/STATUS.md` ab.

## 2. MVP-Minimum (immer, dauert unter einer Stunde)

- Privates GitHub-Repo mit `main`, `.gitignore` (Build-Ordner, `.env*` außer `.env.example`,
  `.DS_Store`, Modelle und venvs)
- `CLAUDE.md` und `docs/STATUS.md`
- Secrets nur in Umgebungsvariablen bzw. Secret-Stores; `.env.example` ohne Werte
- Pre-Commit-Hook gegen Schlüssel: `templates/pre-commit` nach `.git/hooks/pre-commit` kopieren
  und ausführbar machen
- Lockfiles committen (`Package.resolved`, `package-lock.json`, `requirements.txt` bzw. `uv.lock`)

## 3. Production-Set (in dieser Reihenfolge)

Jeder Schritt ist für sich nützlich. Abbrechen ist nach jedem Schritt möglich.

1. **CI bei jedem Push und Pull Request**
   - iOS: **Xcode Cloud** (25 Stunden im Monat im Developer Program enthalten).
     `templates/ci_post_clone.sh` nach `ci_scripts/` legen, Workflow in Xcode anlegen
     (Build + Tests auf main und Pull Requests).
   - Alternative: GitHub Actions mit `templates/ci-ios.yml`. macOS-Minuten zählen im Free-Plan
     zehnfach, für private Repos reicht das nur für wenige Läufe pro Monat.
   - Web: `templates/ci-web.yml` mit Lint, Typecheck, Tests, Build, `npm audit` und Deploy-Hook.
2. **Lint und Format:** SwiftFormat (`--lint` im CI, Formatieren im Hook) bzw. ESLint + Prettier.
   Erst einmal das ganze Repo formatieren und separat committen.
3. **Abhängigkeiten und Secrets:**
   - `templates/dependabot.yml` nach `.github/` legen
   - gitleaks im Hook und im CI
   - Schlüssel, die je in einem Chat standen, rotieren
4. **Arbeitsweise:**
   - Feature-Branches mit Pull Request
   - CI muss grün sein. Branch-Schutz geht für private Repos erst ab GitHub Pro; sonst als Regel in `CLAUDE.md`.
   - Code-Review per `/review` vor dem Merge
5. **Umgebungen:** Dev lokal (`supabase start`, läuft in Docker über Colima), **Staging** als
   eigenes Supabase-Projekt (oder Supabase-Branching), Produktion. Vercel-Vorschau pro Pull
   Request zeigt auf Staging. Migrationen per Pipeline: Staging automatisch, Produktion nach
   Freigabe, vorher Probelauf mit Rollback.
6. **Releases:**
   - SemVer in `project.yml` bzw. `package.json`
   - Git-Tag pro Store-Build (`v1.0.0-31`)
   - `CHANGELOG.md` (`/document-release` hilft)
   - Build-Nummer automatisch aus der Commit-Anzahl
7. **Monitoring:**
   - iOS ohne Tracking: Xcode Organizer (Abstürze, Energie) + MetricKit lokal. Ein Crash-SDK
     nur, wenn das Datenschutz-Label angepasst wird.
   - Web: Fehler-Tracking (Sentry oder Vercel-Logs mit Alarm)
   - Uptime-Check für Website und API (z. B. ein geplanter GitHub-Workflow mit dem Smoke-Test)
8. **Daten:**
   - prüfen, was der Supabase-Plan sichert
   - sonst täglicher `pg_dump` per geplantem Workflow in privaten Speicher
   - **eine Wiederherstellung einmal wirklich testen**
9. **Kosten und Konten:**
   - Budget-Alarme für LLM-APIs, Supabase, Vercel und GitHub Actions
   - `docs/KONTEN.md` (ohne Kennwörter): welches Konto mit welcher E-Mail, 2FA an,
     wo Wiederherstellungscodes liegen
   - Beim ersten Store-Upload fehlte der Zugang zur E-Mail-Adresse des Apple-Kontos.
10. **Runbooks** in `docs/`: Release, Schlüssel rotieren, Rollback, Störung.

## Containerisierung

Für die iOS-Apps ist sie nicht sinnvoll, denn gebaut wird mit Apples Werkzeugen auf macOS.
Für Next.js auf Vercel auch nicht, das ist Serverless. Docker brauchst du für:
- **lokales Supabase** (`supabase start`, über Colima schon eingerichtet)
- **reproduzierbare E2E-Tests** mit `docker compose` (Postgres + App), wenn Playwright-Tests gegen eine frische Datenbank laufen sollen
- **eigene Server**, falls ein Dienst Vercel verlässt (Worker, Queue)

Kubernetes erst bei eigener Server-Flotte mit echter Last.

## Graduation

Vom MVP zu Production: `references/graduation.md` Punkt für Punkt, Ergebnis in `STATUS.md`.

## Regeln

- Änderungen an Produktion (Datenbank, Domains, DNS, Secrets) nur mit OK des Users.
- Secrets setzt der User selbst. Du nennst den genauen Befehl bzw. das Feld.
- Neue Dienste erst vorschlagen und Kosten nennen, nicht still anlegen.
- Konfiguration gehört ins Repo (Workflows, `vercel.json`, Supabase-Migrationen und -Config),
  damit sie nachvollziehbar ist.
