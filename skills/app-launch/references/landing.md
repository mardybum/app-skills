# Landingpage

Vorbilder:
- `~/Leseapp/LinoLiest/website/` (Hörbeispiele, Warteliste mit DOI)
- `~/Leseapp/ToniTueftelt/website/` (Mini-Level zum Ausprobieren)
- `~/projects/stoicHabits/landing/` (editorial, Live-Demo, EN/DE in `app.js`)
- `~/projects/pokedeck/website/` (dunkler Hero, DE/EN per `Scripts/website/build.py`)

## Abschnitte

1. **Hero:**
   - Überschrift mit Nutzen (nicht Funktionsname), Unterzeile
   - Hauptaktion: Warteliste oder Store
   - Gerät mit echtem Screenshot
   - passt auf 1280 × 720
2. **Beweis in Bewegung:** App-Video mit Kapiteln oder Live-Demo.
3. **Wie es funktioniert:** 3–4 Schritte oder die Methode (Lino: Laut für Laut; askesis: Atomic Habits).
4. **Funktionen:** nummerierte Zeilen mit Haarlinien oder große Screens mit Text. Kein 6-Kachel-Raster.
5. **Für wen:** Zielgruppen (Familien, Profis, Lehrkräfte).
6. **Vertrauen:**
   - Datenschutz in einem Satz („keine Werbung, kein Konto“ – nur wenn wahr)
   - Herkunft der Inhalte
   - KI-Kennzeichnung
7. **FAQ:** 5–8 echte Fragen.
8. **Abschluss:** Aktion wiederholen, Footer mit Impressum, Datenschutz, Hilfe, Sprache.

## Technik

- Statisches HTML/CSS; JS nur für Sprache, Video, Demo und Formular.
- Inhalte nie nur per JS sichtbar machen: Animationen per CSS, Einblendungen erst verstecken,
  wenn das Skript läuft.
- Sprachen: DE/EN mit Umschalter (44-px-Trefferfläche) oder getrennte Seiten aus einem Build-Skript.
- Schriften selbst gehostet (woff2, OFL-Datei); Bilder als WebP/AVIF mit Breite und Höhe.
- `vercel.json`:
  - `cleanUrls`
  - Header: `Content-Security-Policy` (nur eigene Quellen plus Supabase, falls Formular),
    `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`
  - lange Caches für Assets
- Vorschaubild (1200 × 630), Favicon, `sitemap.xml`, `robots.txt`, 404-Seite.
- Keine Analyse-Skripte, außer der User will sie bewusst; dann Datenschutz anpassen.

## Prüfen vor dem Deploy

- [ ] 1440 / 1280 / 768 / 375 px, hell und dunkel, ohne horizontales Scrollen
- [ ] Kontrast AA, auch für Kleingedrucktes
- [ ] Alle Links funktionieren, keine toten Knöpfe
- [ ] Texte vom User freigegeben; Versprechen passen zur App
- [ ] Impressum und Datenschutz vollständig, ohne Platzhalter
- [ ] Formular: Erfolg, Fehler, Doppelanmeldung, Honeypot
- [ ] Lighthouse bzw. `/benchmark`: schnell, keine Konsolenfehler
