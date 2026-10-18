# Web setup (Next.js, Supabase, Vercel)

Proven in Hablamos, a multi-teacher SaaS with an AI chat.

## Stack
- Next.js (App Router), TypeScript strict, Tailwind.
  - **APIs change between versions:** read `node_modules/next/dist/docs/` before writing code.
- Supabase:
  - Postgres with **row level security on every table**
  - cookie auth via `@supabase/ssr`
  - migrations in `supabase/migrations/`
- zod for validation and `server-only` for anything holding keys.
- LLM calls only on the server. Switch providers with `LLM_PROVIDER`.
- Stripe only once someone pays. Vitest for tests; Playwright end-to-end tests in production.

## Layout
```
src/app/[lang]/   pages per language    src/app/api/   rate-limited route handlers
src/lib/          supabase, llm, auth, billing, i18n
supabase/migrations/   scripts/smoke.mjs   .env.example   .github/workflows/ci.yml
```

## Rules
- **Create the Supabase client lazily**, or the build fails without env vars.
- **Put access in functions** like `can_access_class()` and test it with simulated roles: owner, member, stranger.
- **Name foreign keys in PostgREST embeds** once two relations exist. Otherwise you get PGRST201 and every lookup looks invalid.
- **Log errors**, never swallow them.
- **Existing production data:**
  - dry-run every migration in a transaction with rollback
  - align the baseline migration with the real schema
  - migrate legacy rows with a claim function
- **Rate limits** on every public endpoint; meter LLM usage.
- **Minors:** first name only, no account, safety rules in the system prompt, honest AI labelling.

## Commands
```bash
npm run dev -- -p 3005
npm run lint && npx tsc --noEmit && npx vitest run && npm run build
npm run smoke -- <url> <code> [--chat]
```

CI template: `/app-ship` → `templates/ci-web.yml`.
