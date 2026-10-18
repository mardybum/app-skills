# Changelog

## 2026-10-18 – Moduswechsel

- app-builder 1.2.0: Graduation gilt für mvp und mvp-first und lässt sich jederzeit per Satz auslösen
  („auf Production umstellen“); ohne Nutzertest eine Rückfrage; nie still in STATUS.md umstellen
- README: Abschnitt „Modus wechseln“ und Startbeispiele

## 2026-10-18 – nach Verfeinern und Design-Review (Uhr-App)

- app-design 1.2.0:
  - Screens fürs Verfeinern aus dem Plan ableiten
  - Farbrollen beim Mischen neu verteilen
  - nicht gewählte Richtungen in den Backlog
  - Render- und Vergleichsskript, Kostenhinweis für design-critic
- DESIGN.md-Vorlage: Kernkomponente im Detail, Review-Änderungen
- design-critic: nutzt render-artboards.sh, wenn Screenshots fehlen

## 2026-10-18 – nach dem Design-Testlauf (Uhr-App, Phase 3)

- app-design 1.1.0:
  - Richtung = Look + Idee + Figurenentscheidung
  - 4 Artboards pro Richtung (Start, Kernaufgabe auf dem Hauptgerät, Fehler-Rückmeldung, Stil-Blatt)
  - Gate mit Bauaufwand und einer Empfehlung; kein ungefragtes Prüfen des Canvas
  - Canvas-Link in STATUS/DESIGN
- house-styles: Kontrasthinweis Pusteblume, Kandidaten Bauklotz und Tickhausen

## 2026-10-17 – nach dem ersten Testlauf (Uhr-App, MVP, bis zum Plan)

Protokoll: `docs/testlauf-2026-10-17-uhr-app.md` (15 Funde).

- app-builder 1.1.0:
  - Modus nach dem Wort des Users („erstmal MVP“ = mvp-first)
  - Commit-Standard ohne Rückfrage, Arbeitstitel
  - Hypothese mit Bestehenskriterium, Aufnahme und Messweg
  - domain-expert im MVP bei fachlicher Hypothese
  - Abschnitt „Probelauf“
  - house-setup: KinderKit einbinden, Figur und Stimme
- app-research 1.1.0:
  - im MVP ohne Agenten
  - Quellen für Rezensionen, Markierung „belegt / dünn belegt“
  - Risikoarten (technisch → Spike, Bedienung → Prototyp-Meilenstein, Lernwirkung → Nutzertest)
  - ANALYSE-Vorlage angepasst
- app-plan 1.1.0:
  - Kernablauf auch im MVP vollständig
  - Gegenprobe gegen Auswendiglernen
  - Figur und Stimme, domain-expert-Regel
  - Meilensteine M0 + 2–4 + Nutzertest
- app-build 1.0.1: Hinweis zu KinderKit beim Setup

## 2026-10-17 – 1.0.0

Erste Fassung: app-builder + 8 Phasen-Skills, 6 Agenten, install.sh, validate.sh.
