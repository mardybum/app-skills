# Funde zum Skill aus dem Testlauf

| # | Phase | Fund | Vorschlag |
|---|---|---|---|
| 1 | 0 | User sagt „erstmal nur MVP“ – Skill sagt nicht, ob das Wort des Users oder die Empfehlung zählt (mvp vs. mvp-first). | Regel: Das Wort des Users zählt; „erstmal“ oder „zum Testen“ heißt mvp-first. Bei echtem Zweifel eine Frage. |
| 2 | 0 | „Commit-Regel einmal festlegen“ lässt offen, ob gefragt wird. Fragen würde genau das erzeugen, was der Skill vermeiden will. | Standard übernehmen, im Bericht nennen; nur fragen, wenn der User etwas anderes will. |
| 3 | 0 | Kein Hinweis für einen Testlauf bzw. Wegwerf-Ordner (kein GitHub-Repo anlegen). | Optional: Abschnitt „Probelauf“ – kein Remote, keine Agenten mit Kosten außer persona-tester. |
| 4 | 0 | Name fehlt; Skill sagt nichts zu Arbeitstiteln. | „Arbeitstitel reicht, Name erst in Design/Release“. |
| 5 | 1 | **Widerspruch:** app-research sagt „Themen parallel an app-researcher“, app-builder sagt „im MVP höchstens persona-tester“. | In app-research: Agenten nur in Production; im MVP selbst recherchieren. |
| 6 | 1 | „Schwächen aus Rezensionen“ – im MVP mit Websuche kaum zu bekommen (App-Store-Rezensionen nicht direkt lesbar). Es gibt keinen Hinweis, wo man sucht und wie man eine dünne Lage benennt. | Konkrete Quellen nennen (Store-Seite im Browser, Blogtests, Eltern-Foren, Vergleichsseiten) und „Belegt / dünn belegt“ in der Tabelle. |
| 7 | 1 | Die Spike-Definition kennt nur technische Risiken. Das größte Risiko hier ist die Bedienung (Zeiger drehen mit 5 Jahren) – kein Platz dafür. | Risikoarten erweitern: technisch → Spike jetzt; Bedienung/Lernwirkung → früher Prototyp-Meilenstein mit Gerätetest im Plan. |
| 8 | 1 | Template ANALYSE.md ist auf Reverse Engineering ausgerichtet (Abschnitt 1 „Was REA gezeigt hat“). Ohne Vorbild ist das leer. | Abschnitt optional markieren. |
| 9 | 2 | **Wichtig:** house-setup empfiehlt „Toni + KinderKit“ als Template, verschweigt aber, dass KinderKit im Toni-Repo liegt und aus anderen Repos nicht sauber eingebunden werden kann (Lino BACKLOG: „bevor eine dritte Kinder-App entsteht“). | In house-setup und app-build: Hinweis + Entscheidung (lokaler Pfad im MVP, eigenes Repo bei Graduation oder vorher). |
| 10 | 2 | MVP „2–4 Meilensteine“ – zählen M0 (Setup) und der Nutzertest mit? | Klarstellen: 2–4 Bau-Meilensteine plus M0 und Nutzertest. |
| 11 | 2 | **Widerspruch:** app-plan sagt `domain-expert` „bei fachlichem Kern“; die MVP-Zeile und app-builder sagen nur persona-tester. Bei einer Lern-App ist die Pädagogik die Hypothese. | Regel: domain-expert auch im MVP, wenn die Hypothese fachlich ist (Lernen, Regeln). |
| 12 | 2 | Template-Wiederverwendung: Stimme und Maskottchen gehören zu einer App (Lena/Lino, Toni). Für eine neue App fehlt die Frage „eigene Figur und Stimme oder wiederverwenden?“. | In app-plan/app-design: Figur und Stimme als bewusste Entscheidung im Umfang. |
| 13 | 0/2 | Das messbare Signal der Hypothese prüfte nur einen Teil (ablesen, nicht einstellen) und hatte kein Bestehenskriterium – erst der Review fand das. | BRIEF-Vorlage und modes.md: Signal muss jeden Teil der Hypothese messen, mit Kriterium, Aufnahmebedingung und Messweg. |
| 14 | 2 | MVP-Plan „eine Seite“ widerspricht „Umsetzung ohne Rückfragen“: Der Review brauchte gerade die Details (Rückmeldesätze, Ablenker, Raster). | „Kurz, aber der Kernablauf vollständig: Interaktion, Rückmeldungen, Fehlerfälle, Tipps.“ |
| 15 | 2 | Für Lern- und Spiel-Apps fehlt im Plan eine Prüffrage gegen Auswendiglernen bzw. Ausnutzen (feste Paare, nach Gehör lösen). | In app-plan: „Wie könnte man die Aufgabe lösen, ohne das Ziel zu lernen?“ |
| ✅ | 2 | persona-tester hat wie vorgesehen funktioniert: Format eingehalten, nichts geändert, 10 Funde, davon 4 hoch, alle berechtigt. | – |

## Phase 3 – Design (18.10.2026)

Canvas: https://claude.ai/artifact/4j4sq3ZZVTaLZX1MnVFhMW – drei Richtungen (Pusteblume mit Mo, Bauklotz, Tickhausen) mit je Start, Kernaufgabe auf dem iPad, Rückmeldung, Stil-Blatt.

| # | Fund | Änderung |
|---|---|---|
| D1 | MVP-Regel „eine Richtung reicht“ – der User wollte trotzdem drei sehen. | Auf Wunsch drei Richtungen, aber im reduzierten Umfang. |
| D2 | 5 Screens × 3 Richtungen (+ iPad) = 15+ Artboards; zu viel für eine Wahl. „Zusätzlich ein Tablet-Artboard“ war unklar. | 4 Artboards pro Richtung: Start, Kernaufgabe auf dem Hauptgerät, Fehler-Rückmeldung, Stil-Blatt. Rest beim Verfeinern. |
| D3 | Das Stil-Blatt pro Richtung machte die Richtung greifbar und ist die Vorlage für DESIGN.md – im Skill fehlte es. | Als 4. Artboard aufgenommen. |
| D4 | Die stärksten Richtungen verbanden Look **und Idee** aus den Leitlinien (Zeit als Fläche; Uhrzeit verändert die Welt). | „Look plus Idee“ als Regel, Beispiele im Skill. |
| D5 | Ob es eine Figur gibt, ist Teil der Richtung (Mo / keine / Dorfbewohner); Template-Figuren nicht übernehmen. | Im Skill ergänzt. |
| D6 | Das Gate braucht pro Richtung den Bauaufwand – im MVP entscheidet er mit (Tickhausen = Illustrationen pro Szene). | Aufwand + eine Empfehlung passend zum Modus. |
| D7 | Der Design-Typ verbietet ungefragtes Prüfen (Screenshots) des Canvas; der Skill sagte dazu nichts. | Vor dem Gate prüft der User; design-critic nur auf Wunsch. |
| D8 | Kontrast im House-Style: Weiß auf Himmel 3,8 : 1, auf Grün 3,5 : 1 – nur große fette Schrift. | Hinweis in house-styles.md. |
| D9 | Wohin mit Canvas-Link und -Dateien? | Dateien im Scratchpad, Link in STATUS.md und DESIGN.md. |

## Phase 3 – Verfeinern und Review (18.10.2026)

Gewählt: A (Pusteblume mit Mo) + gelbe Zeit-Fläche aus B. C kam auf Wunsch des Users in den Backlog. Neue Canvas-Reihe A+ mit 9 Artboards, `DESIGN.md`, Review durch design-critic (15 Funde, 2 hoch), Fixes eingearbeitet, Vorher/Nachher gerendert.

| # | Fund | Änderung |
|---|---|---|
| V1 | Für das Verfeinern fehlte eine Liste der Screens. „Ablesen“ (zweiter Aufgabentyp) war im Richtungsvergleich nicht dabei. | Screens aus dem Kernablauf in PLAN.md ableiten. |
| V2 | Das Mischen zweier Richtungen erzeugte 4 Farbkollisionen (Gelb = Zeit vs. Gelb = aktuell/nach Versuchen). | Beim Mischen Farbrollen neu verteilen, Rollen-Tabelle prüfen. |
| V3 | design-critic braucht Screenshots; Canvas-Artboards lassen sich per Headless-Chromium rendern – das fehlte als Werkzeug. | `scripts/render-artboards.sh` und `scripts/compare.sh` im Skill, Hinweis im Agenten. |
| V4 | design-critic: 20 Min., ~150k Tokens für 9 Screens – stark, aber teuer. | Kostenhinweis; fertige Screenshots + Wortgrenze; im MVP nur auf Wunsch. |
| V5 | Nicht gewählte Richtungen gingen verloren, bis der User „packe C in den Backlog“ sagte. | Automatisch in docs/BACKLOG.md. |
| V6 | DESIGN.md-Vorlage hatte keinen Platz für die Kernkomponente (Lernuhr) und die Review-Änderungen. | Zwei Abschnitte ergänzt. |
| ✅ | design-critic: Format eingehalten, nichts geändert, konkrete Fixes mit Kontrastwerten; alle hohen und mittleren Funde berechtigt. | – |
