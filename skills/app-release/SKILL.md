---
name: app-release
description: "Release-Phase: App für den App Store fertig machen und den User Schritt für Schritt durch App Store Connect führen – Ablehnungsrisiken beseitigen (Markenrecht, Konten, Datenschutz, Kontaktdaten, Kinder-Kategorie, Icon), alle Store-Felder als docs/APPSTORE.md vorbereiten, Archiv bauen und hochladen, TestFlight-Selbsttest wie ein Prüfer, Einreichen mit manueller Freigabe. Für Web-Apps: Produktions-Deploy mit Checkliste. Nutze diesen Skill bei 'bereite alles für den Go-Live vor', 'wir launchen im App Store', 'führ mich durch den Prozess', 'lade den Build hoch', 'TestFlight', 'eliminiere Risiken, die zur Ablehnung führen', 'wie stehen die Chancen' oder wenn app-builder Phase 8 erreicht."
metadata:
  version: 1.0.0
---

# Release

Ziel: Die App geht beim ersten Einreichen durch, und der User weiß bei jedem Klick, was er tut.
Beim ersten Launch war für ihn alles neu („das ist mein erstes Mal, unterstütz mich maximal“).
Die größten Risiken waren:
- ein geschützter Name (Poké)
- Konten, die Prüfer nicht testen können
- falsche Standardsprache
- ein Icon mit Alphakanal

## Ablauf (iOS)

### 1. Risiko-Sweep
- Lies `references/appstore-risks.md` und `app-builder/references/lessons.md` (Abschnitt Store).
- Starte `release-auditor` mit den Pfaden zum Projekt und zu `docs/APPSTORE.md`, falls vorhanden.
- Behebe jedes hohe Risiko vor dem Upload. Typische Maßnahmen:
  - neutraler Name
  - Konten für 1.0 per Schalter aus, der Code bleibt
  - Privacy Manifest mit „keine Daten erhoben“
  - Kontaktdaten auf Support- und Datenschutzseite
  - Eltern-Schranke
  - Icon ohne Alpha
  - `TARGETED_DEVICE_FAMILY` pro Target

### 2. Store-Angaben vorbereiten
`docs/APPSTORE.md` nach `templates/APPSTORE.md`: jedes Feld in der Reihenfolge von App Store
Connect, zum Kopieren:
- Name, Untertitel, Kategorie
- Inhaltsrechte (Schriften, Stimme)
- Altersfreigabe, Datenschutz-Antworten
- Preis, Länder, DSA-Händlerstatus
- Beschreibung, Keywords, Werbetext
- Support-, Datenschutz- und Marketing-URL
- Prüfnotiz mit Testwegen ohne Spezialhardware
- Screenshots

Store-Primärsprache und App-Standardsprache müssen zusammenpassen.

### 3. Archiv und Upload
- Bezahltes Team eingetragen? (`DEVELOPMENT_TEAM`, ggf. `use-paid-team.sh`)
- Versionsnummer in `project.yml`, Build-Nummer = Commit-Anzahl.
- Vorher: frischer Simulator in der Store-Sprache, Release-Build, Kernablauf. Diese Prüfung hätte
  den Sprachfehler bei askesis gefunden.
- `Scripts/archive.sh --upload` (Vorlage in `house-setup.md`). Xcode muss mit derselben Apple-ID
  angemeldet sein. Die Verarbeitung dauert 10–30 Minuten.
- Git-Tag `v<Version>-<Build>` setzen und pushen.

### 4. Den User durch App Store Connect führen
- **Er klickt, du sagst genau was:** ein Schritt pro Nachricht mit Feldname und Wert aus
  APPSTORE.md. Warte auf „done“, bevor du den nächsten Schritt gibst. Kennwörter, Telefonnummer
  und Zahlungsdaten trägt nur er ein.
- Reihenfolge:
  1. App anlegen (Bundle-ID, SKU)
  2. TestFlight: Build erscheint, auf dem eigenen iPhone installieren
  3. **Selbsttest wie ein Prüfer** (Checkliste in `references/appstore-risks.md`)
  4. Store-Seite ausfüllen
  5. Datenschutz und Altersfreigabe
  6. **Freigabe „Manuell“**
  7. Einreichen
- Taucht der Build in TestFlight nicht auf: Verarbeitung abwarten; prüfen, ob die TestFlight-App
  mit derselben Apple-ID angemeldet ist und ob der Exportweg ok war.
- Fehlermeldungen, die der User einfügt, Feld für Feld beantworten.

### 5. Nach dem Einreichen
- Chancen ehrlich einschätzen: welche Risiken bleiben, was bei einer Ablehnung zu tun ist.
- Launch-Tag vorbereiten:
  - Store-Link auf der Website (`APP_STORE_URL`)
  - Warteliste anschreiben (Brevo)
  - Reels planen
- `STATUS.md` aktualisieren; Offenes in `docs/BACKLOG.md`.

Mehrere Apps gleichzeitig einzureichen ist kein Problem, solange jede eigenständig ist. Sehr
ähnliche Apps aus einer Vorlage riskieren Richtlinie 4.3 (Spam).

## Ablauf (Web-Produktion)

- **Umgebung:** Variablen in Vercel vollständig und mit `.env.example` abgeglichen; Domain und
  Redirect-URLs in Supabase Auth eingetragen.
- **Datenbank:** Migration erst auf Staging, dann Probelauf mit Rollback auf Produktion, dann
  anwenden. Nur mit OK des Users.
- **Deploy:** über CI auf main; danach Smoke-Test (`npm run smoke`) und Rechte mit simulierten
  Rollen prüfen.
- **Monitoring:** Fehler-Tracking an, Uptime-Check an, Kosten-Alarme für LLM und Datenbank.
- **Rückweg:** letzter guter Deploy in Vercel bekannt (Instant Rollback), Migration umkehrbar
  oder Backup vorher.

## Je nach Modus

| | MVP | Production |
|---|---|---|
| iOS | Personal Team auf dem eigenen Gerät oder TestFlight intern | App Store mit allem oben |
| Web | Vercel-Vorschau-URL | Produktions-Checkliste |
| Doku | – | `docs/APPSTORE.md`, Tag, CHANGELOG |
