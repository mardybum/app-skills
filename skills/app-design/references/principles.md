# Design-Prinzipien und Anti-KI-Look

Diese Regeln entstehen aus den Reviews von Lino liest, askesis und Deck Buddy. Sie gelten für
Apps und Landingpages. Sie sind kein Geschmacksdiktat: Wenn eine Regel bewusst gebrochen wird,
steht der Grund in DESIGN.md.

## Woran man generisches KI-Design erkennt – und was stattdessen

| Muster | Warum es billig wirkt | Stattdessen |
|---|---|---|
| Orange-Lila-Verläufe, Neonfarben, „AI-Orange“ als Primärfarbe | sieht aus wie jede generierte App | eine eigene Primärfarbe aus dem Leitbild (Petrol, Navy, Tinte), Rest neutral |
| Emoji als Bedienelemente (Tab-Leiste, Knöpfe, Ja/Nein) | verspielt, uneinheitlich, je nach System anders | SF Symbols oder eigene Formen; Emoji höchstens als Inhalt (Bildwörter) |
| Raster aus 3 oder 6 Kacheln mit Icon, Titel und Text | Template-Optik, bricht auf dem Tablet in eine lange Spalte | nummerierte Zeilen mit Haarlinien, echte Screenshots, eine große Aussage pro Abschnitt |
| Schatten unter allem, 3D-Klötze | unruhig, Text wird unscharf | Schatten nur unter Flächen, nie unter Text; sonst Haarlinien |
| Alles gleich laut | keine Hierarchie, das Auge findet nichts | **eine** kräftige Farbe pro Screen bzw. Aktion, alles andere ruhig |
| Platzhalter, Lorem Ipsum, „John Doe“ | wirkt unfertig und lügt über die Dichte | echte Inhalte; für Screenshots ein Seed mit „gelebtem Monat“ |
| Tote Knöpfe („Bald im App Store“ als schwarzer Button) | sieht klickbar aus und tut nichts | Status als Chip, Knopf erst, wenn er funktioniert |
| Handy-Spalte in der Mitte des iPads | wirkt wie ein Port | Elemente wachsen (bis 1,3×) oder eigenes Layout mit zwei Spalten |
| Rote Fehler bei Kindern | wirkt bestrafend | falsche Antwort blass und kurzes Wackeln; Rückmeldung in Sonne oder Minze |
| Gerade Apostrophe, „1 Blöcke“ | Detailschlamperei | typografische Zeichen (’ „ “ – …), echte Singular- und Pluralformen |

## Handwerk

**Hierarchie**
- Ein Fokus pro Screen, eine Hauptaktion. Wichtige Zahlen groß und als Kennzahl
  (StatStrip, tabellarische Ziffern), Erklärungen klein darunter.
- Abschnittslabels klein, in Großbuchstaben mit Laufweite und sekundärer Farbe; Überschriften kräftig.

**Typografie**
- Höchstens zwei Familien. Charakter nach Ton:
  - verspielt: Fredoka (Bedienung) + Andika (Lesetext)
  - editorial: System-Sans heavy + New York Serif für Zitate
  - Werkzeug: Bricolage Grotesque + Geist / Geist Mono
- Lesetext nie in Deko-Großbuchstaben. Displaygrößen mit leicht negativer Laufweite.
- Zahlen tabellarisch (`.monospacedDigit()`), wo sie sich ändern oder untereinanderstehen.

**Farbe**
- Neutrale Fläche plus eine Akzentfarbe. Inhaltsfarben (Welten, Kategorien, Kartentypen) nur
  für Inhalte, nie für Bedienung.
- Status-Farben eigens definieren (legal / unsicher / nicht legal) und in hell und dunkel auf AA prüfen.
- Warme und kalte Grautöne nicht mischen. askesis hatte genau einen warmen Grauton zwischen kalten.

**Formen und Raum**
- 8-pt-Raster; großzügige Abstände.
- Touch-Ziele mindestens 44 pt; bei Kindern 56 pt und Hauptknöpfe 58–60 pt hoch.
- Ein Radius-System (z. B. Chips 14, Karten 24–28, große Flächen 34–36) statt beliebiger Werte.
- Knöpfe mit Charakter: Für Kinder Pillen mit dunklerer „Lippe“, die beim Drücken einsinkt. Für
  Werkzeuge flache Flächen mit klarem Zustand.

**Bewegung**
- UI-Übergänge ≤ 300 ms. Einblendungen beim Scrollen ≤ 650 ms. Feiern darf länger dauern.
- „Bewegung reduzieren“ respektieren; Videos dann nicht automatisch starten.
- Inhalte nie unsichtbar lassen, bis ein Skript läuft (askesis: leerer Hero, wenn JS fehlte).

**Zustände**
- Leere Zustände sind Einladungen mit einer Aktion, keine leeren Flächen.
- Fehler erklären, was passiert ist und was man tun kann.
- Laden: Skelett oder Fortschritt, nie ein eingefrorener Screen.

**Barrierefreiheit gehört zum Design**
- Kontrast AA (4,5:1 Text, 3:1 große Schrift und Bedienelemente).
- Bei sehr großer Schrift einspaltig stapeln, statt Wörter Buchstabe für Buchstabe umzubrechen.
- Dekoratives für VoiceOver ausblenden; Kacheln als ein Satz vorlesen lassen.

## Landingpages

- Hero passt auf einen 1280 × 720-Bildschirm: Überschrift, Unterzeile, Aktion und Produktbild.
- Das Produkt ist der Star: echte Screenshots in Geräterahmen, ein App-Video mit Kapiteln, eine
  Live-Demo, wo sie möglich ist (askesis: Halten zum Abhaken; Toni: Mini-Level).
- Schriften selbst gehostet, keine Anfragen an Google, CSP und Sicherheits-Header.
- Nav-Links und Sprachumschalter mit 44-px-Trefferfläche.
- Nichts versprechen, was die App nicht hält. Wenn sich die App ändert, die Texte anpassen
  („ohne Konto“, „kein Tracking“, „offline“).
