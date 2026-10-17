# App-Store-Ablehnungsrisiken

Prüfreihenfolge vor jedem Upload. Richtlinien-Nummern nach den App Review Guidelines; bei Zweifeln
die aktuelle Fassung auf developer.apple.com nachlesen.

## Hohe Risiken

| Risiko | Richtlinie | Prüfung | Maßnahme |
|---|---|---|---|
| Geschützte Namen, Logos, Figuren | 5.2.1 | Name, Icon, Screenshots, Store-Text frei von fremden Marken? | neutraler Name (Deck Buddy), „inoffizielle Fan-App“, eigene Grafiken |
| Unvollständige App, Absturz, Platzhalter | 2.1 | Release-Build auf echtem Gerät, alle Links, keine „bald“-Funktionen | Testwege in der Prüfnotiz, Demo-Daten |
| Konto ohne Demo-Zugang | 2.1 | Kann ein Prüfer alles ohne eigenes Konto testen? | Konten aus oder Demo-Konto mit Daten |
| Konto ohne Löschfunktion | 5.1.1(v) | Wer ein Konto anlegen kann, muss es in der App löschen können | „Konto löschen“ im Profil |
| Drittanbieter-Login ohne gleichwertige Alternative | 4.8 | Google-Login? | Sign in with Apple zusätzlich, oder nur E-Mail |
| Kinder-Kategorie | 1.3 | Eltern-Schranke vor Links, Käufen, Einstellungen; keine Werbung, keine Analyse von Drittanbietern | `ParentGateView` mit getippter Antwort |
| Fehlende Kontaktdaten | 1.5 | Support-URL mit Kontakt, Impressum | Support-Seite auf der Website |
| Datenschutzangaben falsch | 5.1.2 | Privacy Manifest und App-Datenschutz stimmen überein | Manifest für App, Widget und Pakete |
| Icon mit Alphakanal | Upload-Fehler | `sips -g hasAlpha AppIcon.png` | ohne Alpha rendern |

## Mittlere Risiken

| Risiko | Prüfung | Maßnahme |
|---|---|---|
| Falsche Gerätefamilie | Behauptet der Build iPad, ohne gut auf dem iPad zu laufen? | `TARGETED_DEVICE_FAMILY` pro Target, iPad-Rundgang |
| Standardsprache passt nicht zum Store | frische Installation in der Store-Sprache | Sprache festlegen, Sprachwahl in den Einstellungen |
| Metadaten versprechen zu viel | 2.3: Store-Text gegen die Funktionen der Build-Version | Text anpassen („kein Konto“ nur, wenn wahr) |
| Mindestfunktion | 4.2: mehr als eine Website im Rahmen? | echte native Funktionen |
| Ähnliche Apps aus einer Vorlage | 4.3: Unterscheiden sich Inhalt und Zweck klar? | eigene Inhalte, eigener Name, eigenes Design |
| Exportangabe fehlt | `ITSAppUsesNonExemptEncryption` gesetzt? | `NO` in project.yml |
| Screenshots in falscher Größe | 6,9″, 6,3″, iPad 13″ (bei iPad) | Skript neu laufen lassen |
| EU: Händlerstatus nach DSA fehlt | in App Store Connect angegeben? | „kein Händler“ für kostenlose App einer Privatperson ohne Einnahmen, sonst Händler |

## TestFlight-Selbsttest wie ein Prüfer

Auf dem eigenen iPhone mit der TestFlight-Version:
- [ ] Erststart ohne Vorwissen; Onboarding bis zum ersten Erfolg
- [ ] Sprache stimmt mit der Store-Primärsprache überein
- [ ] Jeder Kernablauf einmal; Testwege aus der Prüfnotiz funktionieren
- [ ] Profil bzw. Einstellungen: Hilfe, Datenschutz, Impressum, Feedback-Link funktionieren
- [ ] Kinder-Modus: Links und Einstellungen fragen erst die Eltern
- [ ] Flugmodus: kein Absturz
- [ ] Berechtigungen (Kamera, Mikrofon) mit verständlichem Text, App funktioniert auch bei „Nein“
- [ ] Keine Debug-Menüs, Testdaten oder Entwicklerhinweise sichtbar
