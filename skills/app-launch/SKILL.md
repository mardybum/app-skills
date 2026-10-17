---
name: app-launch
description: "Launch-Material für eine App: Landingpage im Design der App auf Vercel (mit Impressum, Datenschutz, Hilfe), Launch-Warteliste mit Double-Opt-in über Supabase und Brevo, App-Video aus dem Simulator, Social-Media-Reels im Format 9:16, Store-Screenshots und Feature-Listen für Posts. Nutze diesen Skill bei 'bau eine geile Landingpage', 'deploy auf Vercel', 'füge eine Mailingliste/Warteliste hinzu', 'mach ein App-Video', 'render Reels für Social Media', 'gib mir die 10 Features für Reels', 'App-Store-Screenshots' oder wenn app-builder Phase 7 erreicht."
metadata:
  version: 1.0.0
---

# Launch-Material

Ziel: Bevor die App im Store ist, gibt es einen Ort, der sie zeigt, Interessierte sammelt und
rechtlich sauber ist, sowie Material für Social Media. Alles im Design der App, damit Website,
Store und App wie aus einem Guss wirken.

## Landingpage

Details und Abschnittsliste: `references/landing.md`.

1. **Grundlage:** `DESIGN.md` der App, echte Screenshots, die Feature-Liste. Gibt es eine
   Website einer Schwester-App, übernimm deren Aufbau (Lino → Toni).
2. **Bauen** als statische Seite in `website/` (HTML, CSS, wenig JS):
   - Schriften, Bilder, Audio und Video lokal
   - keine Drittanbieter
   - `vercel.json` mit sauberen URLs, Sicherheits-Headern, CSP und Caching
3. **Rechtliches:** Impressum, Datenschutz (App und Website getrennt beschrieben), Hilfe bzw.
   Support, 404, Sitemap, Vorschaubild. Kontaktdaten aus den bestehenden Impressen übernehmen
   (`app-builder/references/house-setup.md`).
4. **Lokal ansehen** (Browser-Vorschau bzw. `tools/serve_site.py`) bei 1440, 1280, 768 und 375 px,
   hell und dunkel.
5. **Design-Review** mit `/design-review` (gstack) oder `design-critic`. Funde einzeln beheben und committen.
6. **Gate:** Der User prüft die Texte, bevor etwas live geht („Don't publish yet, I'll check the
   texts first“). Versprechen müssen stimmen („offline“, „ohne Konto“, „kein Tracking“).
7. **Deploy:** `vercel deploy --prod` im Ordner `website/`. Ist Vercel in der Sandbox gesperrt,
   gib dem User den genauen Befehl für sein Terminal. Danach die Live-URL in Store-Metadaten und App
   eintragen (Support, Datenschutz, Marketing).
8. **Launch-Schalter:** Eine Variable (z. B. `APP_STORE_URL`) schaltet am Launch-Tag die
   Store-Links ein und das Wartelisten-Formular ab.

## Warteliste

Muster und Sicherheitsregeln: `references/waitlist.md`. Kurz gesagt:
- Supabase-Tabelle mit App-Präfix, für Clients gesperrt; Eintragen nur über eine Funktion
- Brevo schickt die Bestätigungsmail (Double-Opt-in)
- Honeypot, Mindest-Ausfüllzeit, Limit pro IP
- Einwilligungstext wird gespeichert
- Datenschutz wird ergänzt

Den Brevo-Schlüssel setzt der User selbst als Secret.

## App-Video und Reels

Ablauf und Skripte: `references/video.md`.
1. Ein UI-Test spielt die App in Kapiteln durch. Ein Skript nimmt jedes Kapitel im Simulator
   auf, ein zweites schneidet sie.
2. **Website:** das Video im Handy-Rahmen mit Kapitel-Knöpfen. Es spielt nur, wenn es sichtbar
   ist, nie bei „Bewegung reduzieren“, und hat ein Vorschaubild pro Sprache.
3. **Reels** 1080 × 1920, 30 fps: Überschrift, Handy, Abschlusstafel mit Link und Launch-Aufruf;
   dazu ein Cover-Bild und Bildunterschriften.
4. **Ablage:** immer nach Google Drive `Marketing/<App>/`. Für Metricool zusätzlich öffentlich
   auf der Website ablegen.

## Store-Screenshots

- Per UI-Test bzw. Skript mit Seed-Daten, in jeder Store-Sprache.
- Größen: 6,9″ (1320 × 2868) und 6,3″; bei iPad-Apps 13″.
- Mit kurzer Überschrift über dem Gerät.
- Neu erzeugen nach jedem Redesign; Skripte in `app-builder/references/house-setup.md`.

## Texte für Social Media

Wenn der User Reels oder Posts plant: die 10 stärksten Features als je eine Zeile mit Nutzen
und Beleg aus der App, plus 3–5 High-Level-Botschaften. Für Posts selbst gibt es die
Social-Media-Skills (`post-writer-sms` usw.).

## Je nach Modus

| | MVP | Production |
|---|---|---|
| Website | keine oder eine Seite mit Hypothese und Warteliste | vollständig mit Rechtlichem |
| Warteliste | optional (wenn Nachfrage die Hypothese ist) | mit Double-Opt-in |
| Video und Reels | – | App-Video und 5–8 Reels |
| Screenshots | – | alle Store-Größen und -Sprachen |
