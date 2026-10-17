# Launch-Warteliste (Double-Opt-in)

Zwei erprobte Varianten:

| | Lino liest | askesis |
|---|---|---|
| Eintragen | Supabase Edge Function `lino-waitlist` | Vercel-Funktion `/api/subscribe` (fra1) |
| Speicher | Supabase-Tabelle `lino_waitlist` | Brevo-Liste „askesis – Launch“ (Supabase vorbereitet) |
| Bestätigung | Brevo-Mail, Seiten `/bestaetigen`, `/abmelden` | Brevo verwaltet DOI und Abmelden |
| Quelle | `supabase/migrations/0001…`, `0002…`, `supabase/tests/run-local.sh` | `landing/api/`, `docs/launch-list.md` |

Für neue Apps: die Lino-Variante, wenn die Daten in Supabase liegen sollen; die askesis-Variante,
wenn Brevo reicht.

## Regeln

- **Tabelle gesperrt:** RLS an, keine Rechte für `anon`/`authenticated`. Eintragen nur über die
  Funktion bzw. eine `SECURITY DEFINER`-Funktion, die nur Erlaubtes schreibt.
- **Präfix pro App** im geteilten Supabase-Projekt (`<app>_waitlist`).
- **Einwilligung Pflicht:** Checkbox mit vollständigem Satz; Satz, Zeit, Sprache und Quelle speichern.
- **Missbrauchsschutz:** Honeypot-Feld, Mindest-Ausfüllzeit, Same-Origin-Prüfung, Limit pro IP,
  Duplikate still ignorieren (keine Auskunft, ob eine Adresse schon drin ist).
- **Aufräumen:** unbestätigte Einträge nach 30 Tagen löschen; nie verschickte Bestätigungsmails nachholen.
- **Datenschutz:** Abschnitt zur Warteliste (Zweck, Rechtsgrundlage Einwilligung, Dienste
  Supabase/Brevo/Vercel, Speicherdauer, Widerruf).
- **Secrets:** `BREVO_API_KEY`, Absender usw. setzt der User selbst
  (`supabase secrets set …` bzw. Vercel-Umgebungsvariablen). Rotation in `docs/launch-list.md` beschreiben.
- **Brevo** verlangt ein Unternehmen bzw. eine Absenderadresse. Wenn das fehlt, früh mit dem User klären.
- **Tests:** gegen lokales Postgres (Muster `run-local.sh`): Eintragen, Doppelt, Bestätigen,
  Abmelden, Löschfrist, keine Rechte für anon.

## Deploy

```bash
supabase db query --linked -f supabase/migrations/<datei>.sql
supabase functions deploy <app>-waitlist --no-verify-jwt --use-api --project-ref <ref>
```

Migrationen gegen das geteilte Produktionsprojekt nur mit OK des Users.
