# Software-Best-Practices nach Modus

● = Pflicht · ○ = sinnvoll, wenn Zeit ist · – = nicht nötig

## Inhalt
1. Versionskontrolle · 2. Code-Qualität · 3. Testen · 4. CI · 5. CD · 6. Umgebungen ·
7. Container · 8. Sicherheit · 9. Daten · 10. Monitoring · 11. Skalierung · 12. Wiederverwendung ·
13. Doku · 14. Release · 15. KI-gestützte Entwicklung

## 1. Versionskontrolle und Workflow

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Privates GitHub-Repo ab dem ersten Commit | ● | ● | `gh repo create --private --source . --push` |
| Einheitliche Commit-Nachrichten | ● | ● | `feat:`, `fix:`, `docs:`, `chore:` |
| Feature-Branches und Pull Requests | – | ● | ein Branch pro Feature, Merge nach grünem CI |
| Branch-Schutz | – | ○ | ab GitHub Pro für private Repos; sonst Regel in CLAUDE.md |
| SemVer und Git-Tag pro Release | – | ● | `v1.2.0-45` |
| CHANGELOG | – | ● | pro Store-Version; `/document-release` |
| Pre-Commit-Hooks | ● (Secrets) | ● (+ Format) | `templates/pre-commit` |

## 2. Code-Qualität und Architektur

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Logik als eigenes Paket ohne UI | ● | ● | `Packages/<Kit>` |
| Design-Tokens zentral | ● | ● | `Theme.swift`, CSS-Variablen |
| Linter und Formatter | ○ | ● | SwiftFormat/SwiftLint, ESLint/Prettier |
| Strenge Compiler-Einstellungen | ○ | ● | Swift 6 Concurrency, TS strict, Warnungen als Fehler im CI |
| Statische Analyse | – | ○ | Xcode Analyze, CodeQL (für private Repos kostenpflichtig) |
| Code-Review vor dem Merge | – | ● | `/review`, `/code-review` |
| Architektur-Entscheidungen festhalten | – | ○ | `docs/adr/NNNN-titel.md` |
| Abhängigkeiten testbar (Protokolle, Injektion) | ○ | ● | Services hinter Protokollen |

## 3. Testen

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Unit-Tests für die Kernlogik | ● | ● | Szenario-Tests aus der Spec |
| Integrationstests (DB, API) | – | ● | lokales Supabase, Route-Handler-Tests |
| UI- und E2E-Tests | ○ (Smoke) | ● | XCUITest; Playwright für Web |
| Barrierefreiheits-Audits | – | ● | `performAccessibilityAudit()` |
| Visuelle Regression | – | ○ | Screenshots aus UI-Tests vergleichen |
| Abdeckung messen, Mindestwert | – | ● | Kern ≥ 70 %, im CI berichten |
| Prüfung externer Daten | ○ | ● | Build-Prüfungen, Schrumpf-Schutz |
| Performance-Tests | – | ○ | XCTMetric, Lighthouse |
| Lasttests | – | ○ (SaaS) | k6 gegen Staging, LLM-Kosten pro Nutzer |
| Echte Geräte | ● (Kern) | ● | früh, eigener Meilenstein |
| Echte Nutzer | ● | ● | `docs/NUTZERTEST.md` |

## 4. CI (Continuous Integration)

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Build und Tests bei Push und Pull Request | – | ● | Xcode Cloud bzw. `ci-ios.yml`, `ci-web.yml` |
| Lint, Typecheck, Audit im CI | – | ● | `npm audit --audit-level=critical` |
| Gerätematrix | – | ○ | iPhone + iPad im CI |
| Geplante Jobs | – | ○ | Datenupdates, Smoke-Tests, Backups |
| Caching | – | ○ | npm-Cache, DerivedData |

## 5. CD (Continuous Delivery)

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Website deployt automatisch, Vorschau pro Pull Request | ○ | ● | Vercel-Git-Anbindung oder Deploy-Hook |
| TestFlight-Upload automatisch | – | ○ | Xcode Cloud Archive-Aktion |
| Store-Texte als Code | – | ○ | App Store Connect API / fastlane deliver |
| Migrationen per Pipeline | – | ● | Staging automatisch, Prod mit Freigabe |
| Smoke-Test nach dem Deploy | – | ● | `npm run smoke`, automatisch |
| Rückweg | – | ● | Vercel Instant Rollback; Feature-Flag für iOS |
| Gestaffelte Freigabe | – | ○ | Phased Release (7 Tage) |

## 6. Umgebungen und Konfiguration

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Dev lokal, Staging, Produktion getrennt | – | ● | zweites Supabase-Projekt oder Branching |
| Eigenes Backend-Projekt bzw. strikte Rechte pro App | – | ○ | sonst Präfix + RLS pro App |
| Konfiguration über Umgebungsvariablen + `.env.example` | ● | ● | nie Werte im Repo |
| Reproduzierbare Werkzeuge | ○ | ● | Lockfiles, Versionen im README, `uv`/`requirements.txt` |
| Infrastructure as Code | – | ○ | `vercel.json`, `supabase/config.toml`, Workflows im Repo |

## 7. Container

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Lokales Supabase in Docker | ○ | ● | `supabase start` (Colima) |
| docker compose für E2E | – | ○ | Postgres + App für Playwright |
| Docker für iOS bzw. Vercel | – | – | nicht sinnvoll |
| Kubernetes | – | – | erst bei eigener Server-Flotte |

## 8. Sicherheit

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Secrets nie in Chat, Repo, Docs | ● | ● | User setzt sie selbst |
| Secret-Scan | ● | ● | Hook + gitleaks im CI |
| Schlüssel rotieren | ○ | ● | nach Leck sofort, sonst regelmäßig; Runbook |
| Abhängigkeits-Scan | – | ● | Dependabot, `npm audit` |
| RLS auf allen Tabellen, mit Tests | ● | ● | Rollen simulieren: Besitzer, Mitglied, Fremder |
| Minimale Rechte | ● | ● | anon vs. service; Server-Schlüssel nur serverseitig |
| OWASP-Grundlagen | ○ | ● | Rate-Limit, zod, CSP, Header, keine Fehlerdetails nach außen |
| LLM-Sicherheit | ○ | ● | Prompt-Injection, Schutz Minderjähriger, Kostenlimit |
| Bedrohungsmodell und Audit | – | ● | `/cso` |
| 2FA auf allen Konten | ● | ● | GitHub, Apple, Vercel, Supabase, Brevo, Google |

## 9. Daten

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Versionierte, idempotente Migrationen | ● | ● | `supabase/migrations/` |
| Probelauf vor Produktion | ● | ● | Transaktion mit Rollback |
| Backups | – | ● | Plan prüfen, sonst täglicher `pg_dump` |
| Wiederherstellung getestet | – | ● | einmal pro Quartal |
| Migration der Gerätedaten | ○ | ● | SwiftData `VersionedSchema`, Tests mit alten Ständen |
| Löschfristen und DSGVO | ● | ● | unbestätigte Einträge löschen, Konto löschen |

## 10. Monitoring und Betrieb

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Crash-Berichte | ○ | ● | Xcode Organizer + MetricKit; Web: Sentry |
| Strukturierte Logs | ○ | ● | `os.Logger` mit Kategorien; Server-Logs |
| Uptime und Alarme | – | ● | geplanter Smoke-Test, Benachrichtigung |
| Kosten- und Kontingent-Alarme | – | ● | LLM, Supabase, Vercel, Actions |
| Runbooks | – | ● | Release, Rotation, Rollback, Störung |
| Produktzahlen ohne Tracking | – | ○ | App Store Connect Analytics |

## 11. Skalierung und Performance

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Zustandslos und Serverless, statisch über CDN | ● | ● | Vercel |
| Indizes und Abfragen prüfen | – | ● | Supabase Advisor |
| Connection Pooling | – | ● | Supabase Pooler für Serverless |
| Rate-Limits und Kontingente | ○ | ● | pro IP und Nutzer |
| Lange Aufgaben in eine Queue | – | ○ | LLM-Batches, Exporte |
| Performance-Budgets | – | ○ | Start < 1 s, Speicher, App-Größe, Core Web Vitals |
| Offline-first | ● | ● | Daten in der App, Updates im Hintergrund |

## 12. Wiederverwendung über Apps

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Vorlage für neue Apps | ● | ● | dieser Skill-Satz + Template-App |
| Geteilte Bibliothek als versioniertes Paket | – | ● | KinderKit als eigenes Repo mit Tags (SPM) |
| Gemeinsames Repo für Werkzeuge | – | ○ | archive, Screenshots, Video, Reels |
| Geteilte Design-Tokens | ○ | ○ | über das Paket |

## 13. Dokumentation

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| README mit Bauen und Starten | ● | ● | |
| CLAUDE.md | ● | ● | Befehle, Konventionen, Stolperfallen |
| STATUS.md | ● | ● | Modus, Phase, Entscheidungen |
| DESIGN.md, ANALYSE.md, PLAN.md | ○ | ● | |
| QA-REPORT.md, APPSTORE.md | – | ● | |
| BACKLOG.md | ○ | ● | nicht dringende Punkte mit „wann“ und „warum nicht jetzt“ |
| KONTEN.md (ohne Kennwörter) | ○ | ● | |

## 14. Release und Produktbetrieb

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Release-Checkliste | – | ● | `app-release` |
| Feature-Flags | ○ (Build) | ● | Build-Schalter; Fern-Schalter für Notfälle |
| Hinweis auf Mindestversion | – | ○ | Manifest im Daten-Repo |
| TestFlight-Beta mit Feedback | ○ | ● | Feedback-Link in der App |

## 15. KI-gestützte Entwicklung

| Praxis | MVP | Prod | Wie |
|---|---|---|---|
| Ziel-Repo bestätigen | ● | ● | bei parallelen Sessions |
| Ein Schreiber pro Dateimenge | ● | ● | Agenten lesen nur |
| Hooks: Tests/Lint vor Commit | ○ | ● | Claude-Code-Hooks bzw. Git-Hooks |
| Schutzmodus für Produktion | – | ● | `/careful`, `/guard` |
| Ergebnisse als Dateien statt nur im Chat | ● | ● | `docs/` |
