# Graduation: vom MVP zu Production

Voraussetzung: Der Nutzertest ist ausgewertet, und der User hat „ausbauen“ entschieden. Die
Punkte der Reihe nach abarbeiten und in `docs/STATUS.md` abhaken. Mit ⚑ markierte Punkte brauchen
das OK des Users.

## A. Fundament (vor jedem neuen Feature)
- [ ] `audit.sh` laufen lassen, Ergebnis in STATUS.md
- [ ] Repo-Hygiene: `.gitignore`, keine Secrets in der Historie (gitleaks über die ganze Historie)
- [ ] Pre-Commit-Hook mit Secret-Scan und Format
- [ ] SwiftFormat/ESLint einführen, das ganze Repo einmal formatieren (eigener Commit)
- [ ] CI: Xcode Cloud bzw. GitHub Actions; die Tests müssen dort grün sein
- [ ] Dependabot

## B. Produkt
- [ ] `PLAN.md` auf V1 erweitern: Personas vollständig, alle Kernabläufe mit Ziel-Taps
- [ ] Erkenntnisse aus dem Nutzertest als Änderungen im Plan
- [ ] ⚑ Design-Vollrunde (`app-design`): drei Richtungen, falls das MVP einen House-Style
      übernommen hat; sonst Verfeinerung mit allen Zuständen
- [ ] Sprachen: alle Zielsprachen, Prüfskript, Standardsprache festgelegt

## C. Backend (nur wenn vorhanden)
- [ ] ⚑ Staging-Umgebung anlegen (eigenes Supabase-Projekt oder Branching)
- [ ] ⚑ Entscheidung: bleibt die App im geteilten Projekt (Präfix) oder bekommt sie ein eigenes?
- [ ] Migrationen per Pipeline; Probelauf vor Produktion
- [ ] RLS-Tests im CI
- [ ] Backups geprüft, Wiederherstellung einmal getestet
- [ ] Rate-Limits und Kosten-Alarme

## D. Qualität
- [ ] UI-Tests für alle Kernabläufe, Barrierefreiheits-Audits, Gerätematrix (`app-qa`)
- [ ] `docs/QA-REPORT.md`

## E. Betrieb
- [ ] Crash-Berichte (Xcode Organizer, MetricKit) bzw. Fehler-Tracking (Web)
- [ ] Uptime-Check für Website und API
- [ ] `docs/KONTEN.md` mit 2FA-Stand
- [ ] Runbooks: Release, Rotation, Rollback

## F. Launch und Release
- [ ] `app-launch`: Website, Recht, Warteliste, Video, Reels, Screenshots
- [ ] `app-release`: Risiko-Sweep, APPSTORE.md, TestFlight-Selbsttest, Einreichen
- [ ] Tag, CHANGELOG

Am Ende: In `STATUS.md` den Modus auf `production` setzen und das Datum eintragen.
