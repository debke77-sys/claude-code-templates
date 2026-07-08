# Zorgplanner (voorbeeld)

Eenvoudige web-app voor een coördinator in een kleinschalige zorginstelling. Vervangt losse
Excel-bestanden voor teamoverzicht, jaarplanning, actielijst en een startdashboard.

**Status:** drie onderdelen klaar — **Jaarplanning**, **Team** en **Actielijst**. Dashboard volgt later.

## Hoe open ik de app?

Geen installatie nodig. Dubbelklik op `index.html` (of open het bestand via je browser:
`Bestand > Openen`). De app werkt volledig in je browser, in Chrome, Edge of Firefox.

## Waar blijven mijn gegevens?

Alle gegevens worden lokaal opgeslagen in de browser waarin je de app opent (via
`localStorage`) — er wordt niets naar internet verstuurd. Let op:

- Gegevens zijn gekoppeld aan de combinatie van browser + computer waarop je ze invoert.
  Open je de app op een andere computer of in een andere browser, dan zie je weer de
  fictieve voorbeeldgegevens.
- Maak daarom af en toe een back-up via **Instellingen > Back-up > Back-up downloaden**.
  Dat levert een `.json`-bestand op dat je kunt bewaren (bijvoorbeeld op een netwerkschijf)
  en later kunt terugzetten via **Back-up terugzetten**.

## Wat zit er nu in?

De app start met fictieve voorbeeldgegevens: 4 locaties, 14 bewoners en 10 medewerkers.
Vervang deze via **Instellingen** (onderaan het scherm) door je eigen namen — of laat ze
gewoon staan als je eerst wilt oefenen met de app.

Standaard terugkerende taken in de jaarplanning:

| Taak | Voor | Frequentie |
|---|---|---|
| Dossiercheck | Bewoner | elke 6 maanden |
| Evaluatie zorgplan | Bewoner | elk jaar |
| Ontwikkelgesprek (GROW) | Medewerker | elk jaar |
| Functioneringsgesprek | Medewerker | elk jaar |

Je kunt taaktypes, frequenties, locaties, bewoners en medewerkers zelf aanpassen via
**Instellingen** onderaan het scherm.

## Hoe werkt de jaarplanning?

- Elke taak heeft een geplande datum. De kleur laat zien hoe urgent iets is: rood
  (verlopen), oranje (deze week), geel (deze maand), grijs (later dit jaar).
- Klik op **Markeer als afgerond** zodra je een taak hebt gedaan. De app plant de
  volgende ronde automatisch in, op basis van de ingestelde frequentie.
- Je kunt een datum ook handmatig verzetten met het datumveld naast een taak.
- Filter op locatie, op bewoners/medewerkers, of op status.

## Hoe werkt het onderdeel Team?

- **Teamoverzicht**: kaartjes per medewerker met locatie, aantal open ontwikkeldoelen en de
  datum van het laatste gespreksverslag. Filter op locatie, klik op **Bekijk profiel** voor
  details.
- **Profiel per medewerker** bevat drie onderdelen:
  - **Ontwikkeldoelen (GROW)** — Goal, Reality, Options, Will, met status (open/bereikt/
    vervallen) en een streefdatum. Velden zijn direct te bewerken; wijzigingen worden
    automatisch opgeslagen.
  - **Observaties (hoor/zie/voel/interpreteer)** — vastleggen wat je hebt waargenomen,
    los van je interpretatie.
  - **Gespreksverslagen** — datum, type gesprek (ontwikkelgesprek, functioneringsgesprek of
    ad-hoc), samenvatting en gemaakte afspraken.
- Bovenaan elk profiel zie je ook de openstaande jaarplanning-taken (ontwikkel-/
  functioneringsgesprek) voor die medewerker, met dezelfde **Markeer als afgerond**-knop
  als in de jaarplanning.
- Alle nieuwe items voeg je toe via een "+ Nieuw..."-knop; verwijderen kan per item.

## Hoe werkt de actielijst?

- Voor eenmalige taken — anders dan de terugkerende taken in de jaarplanning. Bijvoorbeeld:
  "brandblussers laten keuren" of "rolstoel laten repareren voor bewoner X".
- Elke actie heeft een titel, optionele omschrijving, locatie, deadline en status
  (open/bezig/afgerond). Je kunt een actie eventueel koppelen aan een specifieke bewoner of
  medewerker, of aan geen persoon (bijvoorbeeld een taak die alleen aan een locatie hangt).
- De kleur van de urgentiebadge werkt hetzelfde als in de jaarplanning: rood (verlopen),
  oranje (deze week), geel (deze maand), grijs (later). Afgeronde acties krijgen een groene
  "Afgerond"-badge.
- Alle velden in de tabel zijn direct te bewerken (titel, locatie, koppeling, deadline,
  status). De standaardfilter toont alleen open en lopende acties; zet het statusfilter op
  "Alle statussen" om ook afgeronde acties terug te zien.
- Nieuwe acties voeg je toe via **+ Nieuwe actie**; verwijderen kan per actie.

## Volgende stappen

Zodra dit onderdeel goed bevalt, bouwen we hierop verder:

1. **Dashboard** — startscherm met een overzicht van wat deze week aandacht nodig heeft,
   over alle onderdelen (jaarplanning, team en actielijst) heen.
