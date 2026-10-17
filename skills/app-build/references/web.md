# Web-Setup (Next.js, Supabase, Vercel)

Bewährt in Hablamos (Multi-Lehrkräfte-SaaS mit KI-Chat).

## Stack

- Next.js (App Router) mit TypeScript strict, Tailwind
- **Next.js-Versionen ändern APIs.** Vor dem Schreiben die Doku in `node_modules/next/dist/docs/`
  lesen; die Regel steht in `AGENTS.md`.
- Supabase:
  - Postgres mit Row Level Security auf **jeder** Tabelle
  - Auth über Cookies mit `@supabase/ssr`
  - Migrationen in `supabase/migrations/`
- Validierung mit zod, `server-only` für alles mit Schlüsseln.
- LLM-Aufrufe nur auf dem Server. Der Gemini-Schlüssel lag früher im Browser.
  Eine Provider-Abstraktion erlaubt den Wechsel per `LLM_PROVIDER`.
- Stripe für Abrechnung (Checkout, Portal, Webhook), erst wenn bezahlt werden soll.
- Vitest für Unit- und Integrationstests, Playwright für E2E (ab Production).

## Aufbau

```
src/app/[lang]/        Seiten pro Sprache (de/en/fr), Proxy-basierte Weiterleitung
src/app/api/           Route Handler (rate-limited)
src/lib/               supabase/, llm/, auth/, billing/, i18n/
src/__tests__/         Vitest
supabase/migrations/   Schema + RLS, idempotent
scripts/smoke.mjs      Smoke-Test nach dem Deploy
.env.example           alle Variablen ohne Werte
.github/workflows/ci.yml
```

## Regeln

- **Supabase-Client lazy erzeugen** (Proxy). Sonst scheitert der Build ohne Umgebungsvariablen.
- **Rechte über Funktionen** wie `can_access_class()`. Mit simulierten Rollen prüfen:
  Besitzer, Mitglied, Fremder.
- **Eindeutige Fremdschlüssel in PostgREST-Embeds benennen**, sobald es zwei Beziehungen gibt.
  Sonst meldet die API PGRST201, und in Hablamos waren plötzlich alle Klassencodes „ungültig“.
- **Fehler loggen, nie verschlucken.**
- **Bestehende Produktionsdaten:**
  - Migrationen erst als Probelauf in einer Transaktion mit Rollback
  - Basis-Migration an das echte Schema angleichen (CHECK-Constraints prüfen)
  - Altdaten mit einer Funktion übernehmen (`claim_legacy_data()`)
- **Rate-Limits** für alle öffentlichen Endpunkte; Nutzung messen (LLM-Kosten).
- **Kinder und Jugendliche:** nur Vorname, kein Konto. Sicherheitsregeln im System-Prompt,
  ehrliche KI-Kennzeichnung.

## Befehle

```bash
npm run dev -- -p 3005
npm run lint && npx tsc --noEmit && npx vitest run && npm run build
npm run smoke -- <url> <code> [--chat]
supabase start && supabase db reset
```

## CI und Deploy

CI-Vorlage: `app-infra/templates/ci-web.yml`. Sie läuft bei jedem Pull Request und Push auf main:
Lint, Typecheck, Tests, Build, `npm audit --audit-level=critical`. Auf main triggert ein
erfolgreicher Lauf den Vercel-Deploy-Hook. Nach dem Deploy läuft der Smoke-Test.
