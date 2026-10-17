# QA-Checklisten

## Technik

**Build und Code**
- [ ] Sauberer Build: 0 Warnungen im eigenen Code (Debug und Release)
- [ ] Release-Build ohne Debug-Startargumente, Testdaten und Fake-Kamera
- [ ] Keine Farbwerte in Views (`grep` gegen DESIGN.md), keine `print`-Reste

**Tests**
- [ ] Alle Unit-, Paket- und UI-Tests grün auf iPhone und iPad
- [ ] Abdeckung im Kernpaket gemessen (Ziel ≥ 70 %), Lücken benannt
- [ ] Engine mit echten Daten getestet (echte Listen, echte OCR-Ausgaben, alle Level lösbar)

**Performance** (Werte festhalten)
- [ ] Startzeit (Erst- und Folgestart)
- [ ] Speicher mit vollem Bestand
- [ ] Stresstest mit vielen Daten (`-seedStress N`); flüssige Tab-Wechsel

**Audio und Threads**
- [ ] Kein `AVAudioPlayer`, keine Audio-Session und kein schweres I/O auf dem Main-Thread

**Speichern**
- [ ] Speichern beim Sperren des Geräts (Dateischutz)
- [ ] Alte Spielstände und Daten werden nach einem Update geladen

**Offline und Netz**
- [ ] Flugmodus beim Start und mitten im Ablauf
- [ ] Bild-CDN mit Fehlern (Wiederholversuche, Platzhalter)

**Sprachen**
- [ ] Alle Texte übersetzt (Prüfskript)
- [ ] Platzhalter stimmen, Plural korrekt („1 Block“)
- [ ] Datum, Preise und Zahlen im Gebietsschema
- [ ] Standardsprache bei frischer Installation korrekt

**Randfälle**
- [ ] Deep-Links und Importe mit Größengrenzen
- [ ] Leere, riesige und kaputte Eingaben

**Sicherheit**
- [ ] Keine Schlüssel im Repo **und in der Git-Historie** (`git log -p | grep` bzw. gitleaks)
- [ ] Eingebauter Schlüssel nur `anon`, RLS-Regeln getestet (eigene Daten sichtbar, fremde nicht)
- [ ] Tabellen für `anon` gesperrt, wo nicht nötig

**Backend** (falls vorhanden)
- [ ] Prüfungen gegen lokales Supabase (Anmeldung, RLS, Löschung, Konflikte)
- [ ] Sync in beide Richtungen

## Usability

- **Pro Persona der Kernablauf:**
  - Taps zählen und mit dem Ziel aus PLAN.md vergleichen
  - wo zögert man?
  - wo muss man raten, wohin man tippt?
- **Erststart ohne Vorwissen:** Versteht man in 10 Sekunden, was die App tut und was man als Erstes tut?
- **Fehler absichtlich machen:** Ist die Rückmeldung hilfreich und nicht bestrafend?
- **Abschluss von Aktionen:** Nach „Übernehmen“, „Speichern“, „Fertig“ ist klar, was passiert ist
  und wo man jetzt ist.
- **Jargon:** Fachwörter nur im Expertenmodus oder mit Erklärung (Glossar).
- **Kinder:**
  - ohne Lesen bedienbar
  - Touch-Ziele ≥ 56 pt
  - Eltern-Schranke vor Links, Einstellungen und Käufen
  - Tageslimit greift

## Barrierefreiheit

- [ ] `performAccessibilityAudit()` auf allen Hauptscreens ohne Fehler
- [ ] VoiceOver: Bilder beschriftet oder als dekorativ markiert; Kacheln als ein Satz; ausgewählter Zustand angesagt
- [ ] Dynamic Type bis AX5: nichts abgeschnitten, einspaltig wo nötig, Abzeichen verdecken keine Inhalte
- [ ] Kontrast AA in hell und dunkel
- [ ] „Bewegung reduzieren“ respektiert

## Gerätematrix

| Gerät | Hoch | Quer |
|---|---|---|
| iPhone 17 / 17 Pro | ☐ | – |
| kleines iPhone (SE-Größe, falls unterstützt) | ☐ | – |
| iPad mini | ☐ | ☐ |
| iPad Air 11″ | ☐ | ☐ |
| iPad Pro 13″ | ☐ | ☐ |
| echtes iPhone (Kamera, Mikrofon, Audio) | ☐ | – |

## Nutzertest-Leitfaden (Muster)

Vorlage: `~/Leseapp/ToniTueftelt/docs/KINDERTEST.md`.

1. **Ziel:** Können sie die App ohne Hilfe bedienen? Erreichen sie das Ergebnis der Hypothese?
2. **Vorbereitung:**
   - Gerät, Profil pro Person
   - Einverständnis
   - Notizen nur mit Kürzel, keine Gesichter fotografieren
3. **Ablauf** (30 Minuten pro Person):
   - Vorher-Aufgabe ohne App (5 Minuten)
   - freies Nutzen, nur beobachten (15 Minuten)
   - kurzes Gespräch
   - Nachher-Aufgabe
4. **Beobachtungsbogen:**
   - Findet die Person den Einstieg allein?
   - Wo steckt sie fest?
   - Nutzt sie die Hilfe?
   - Will sie weitermachen?
5. **Bewertung pro Aufgabe:** 2 = allein, 1 = mit Hinweis, 0 = nicht gelöst. Ergebnisse in STATUS.md.
