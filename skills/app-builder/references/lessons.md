# Lessons aus den bisherigen Apps

Jeder Punkt hat in einem echten Projekt Zeit gekostet. Vor Phase 4 und vor Phase 8 lesen.

## Arbeitsweise

- **Ziel-Repo bestätigen**, wenn mehrere Sessions laufen. In Lino liest musste ein Commit
  zurückgenommen werden, weil die Anfrage für Conjugamos gedacht war.
- **Nur eine Session ändert dieselben Dateien.** Bei Toni tüftelt arbeitete eine zweite Session an
  Welt 2 im selben Ordner; Fixes wurden deshalb per Nachricht übergeben statt direkt geändert.
- **Commit-Regel einmal festlegen**, statt bei jedem Schritt zu fragen.
- **Echte Geräte früh einplanen.** Scanner (Deck Buddy), Spracherkennung (Lino) und Kamerafokus
  funktionieren im Simulator nicht oder anders. Live-Scan fiel erst beim Test auf dem iPhone
  komplett durch.
- **Tests mit echten Nutzern** fanden bisher nie statt (Kindertest nur geplant). Im MVP-Modus ist
  das der Zweck der ganzen Übung.
- **Kein Schlüssel im Chat.** Brevo- und Gemini-Schlüssel landeten im Klartext in Session-Verläufen.

## iOS-Technik

- **Audio nie auf dem Main-Thread.** `AVAudioPlayer` erzeugen, `play`, `stop` können die UI bis zu
  einer Minute blockieren, wenn das Audiogerät langsam startet. Eigene Queues wie `AudioWork` in
  KinderKit; nie `sessionQueue.sync` vom Main-Thread.
- **Dateischutz `completeFileProtectionUntilFirstUserAuthentication`** für gespeicherte Daten,
  sonst scheitert das Speichern beim Sperren des Geräts.
- **XcodeGen: `TARGETED_DEVICE_FAMILY` pro Target setzen.** Der Standard pro Target („1,2“)
  überschreibt die Projekteinstellung. askesis Build 1 behauptete so iPad-Unterstützung.
- **Standardsprache bewusst festlegen.** askesis startete auf Deutsch, obwohl der Store auf
  Englisch war. Aufgefallen ist es erst in TestFlight. Vor dem Upload: frischer Simulator in der
  Store-Sprache.
- **App-Icon ohne Alphakanal**, sonst lehnt App Store Connect den Upload ab.
- **Eltern-Schranke mit getippter Antwort** (Zehnerzahl × Ziffer), nicht vier Antwortknöpfe –
  ein Kind trifft sonst in jedem vierten Fall.
- **iPad nicht als Handy-Spalte.** Bei großen Breiten skalieren (`kidScale` in KinderKit) oder
  ein eigenes Layout bauen; hoch und quer testen.
- **Daten nie live aus fremden Quellen in der App laden.** Ein Katalog wird gebaut, in die App
  gepackt und über einen geprüften Update-Dienst ersetzt. Schutz gegen schrumpfende Daten: Ein
  Update mit deutlich weniger Einträgen wird abgelehnt (TCGdex lieferte einmal einen veralteten Stand).
- **Bilder von CDNs mit Wiederholversuchen laden.** Ein kurzer 503 zeigte sonst dauerhaft Platzhalter.
- **Erscheinungsbild (Hell/Dunkel) aufs Fenster anwenden**, nicht nur auf die View, sonst greift
  es in offenen Sheets nicht.

## Inhalte und Recht

- **Keine geschützten Namen** im App-Namen, Icon und in den Screenshots. Aus „PokéDeck“ wurde
  „Deck Buddy“ (Richtlinie 5.2.1). Immer als „inoffizielle Fan-App“ kennzeichnen.
- **KI-Stimme kennzeichnen** („KI-generiert“) in der App und in den Store-Texten.
- **Reverse Engineering nur an öffentlich Zugänglichem**, nichts übernehmen außer Ideen; den
  rechtlichen Rahmen in `ANALYSE.md` festhalten.
- **Schriften selbst hosten** (OFL) und Lizenzen in den Store-Angaben nennen.
- **Impressum braucht eine ladungsfähige Anschrift.** Das war dem User unangenehm; die bestehenden
  Angaben aus den Impressen von Lino bzw. Deck Buddy übernehmen, nicht neu abfragen.
- **Brevo verlangt ein Unternehmen bzw. eine Absenderadresse** für Double-Opt-in-Mails – früh klären.

## Store und Release

- **Konten in 1.0 möglichst aus.** Ein Konto verlangt ein Demo-Konto für die Prüfer, funktionierende
  Bestätigungs-Mails, Konto-Löschung in der App und mit Google-Login auch Sign in with Apple. Deck
  Buddy hat die Konten für 1.0 abgeschaltet, der Code blieb drin.
- **Store-Primärsprache und App-Standardsprache zusammen entscheiden.**
- **Screenshots in 6,9″ und 6,3″** bereithalten (App Store Connect wollte bei askesis 6,3″),
  bei iPad-Apps auch 13″.
- **Wenn ein Apple-Konto an einer alten E-Mail-Adresse hängt**, vor dem Release klären. Beim
  ersten Upload fehlte der Zugang zur alten Adresse.
- **Vercel-Deploys** gingen teils nur vom Mac aus, weil Vercel in der Sandbox gesperrt war. Dann
  dem User den genauen Befehl geben.
- **Metricool lädt Videos nur von einer öffentlichen URL.** Reels zusätzlich auf der Website ablegen.
- **Fertige Videos** gehören nach Google Drive unter `Marketing/<App>/` (siehe `house-setup.md`).

## Produkt und Usability

- **Fehler nie bestrafen** (Toni: Versuche kosteten Sterne und hemmten das Ausprobieren).
- **Hilfen stufen.** Der erste Tipp darf nicht die ganze Lösung zeigen, sonst warten Kinder nur noch auf den Tipp.
- **Wo man tippen muss, muss sichtbar sein.** Beim Scanner-Review wusste niemand, dass man aufs
  Kartenbild tippen muss.
- **Nach „Übernehmen“ zurückführen** und bestätigen, statt den User stehen zu lassen.
- **Fachjargon nur im Expertenmodus** (Deck Buddy: „Bulk“, „Shell“).
- **Ziele, Belohnungen und Freischaltungen** mit dem User abstimmen: In Lino entschied er sich
  später gegen frei wählbare Level.
