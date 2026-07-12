# Zorgplanner (voorbeeld)

Eenvoudige web-app voor een coördinator in een kleinschalige zorginstelling. Vervangt losse
Excel-bestanden voor teamoverzicht, jaarplanning, actielijst en een startdashboard.

**Status:** alle vier oorspronkelijke onderdelen klaar — **Dashboard**, **Jaarplanning**, **Team**
en **Actielijst** — plus uitbreidingen: een **Bewoners**-tabblad, een back-up-herinnering,
competentiegebieden bij ontwikkeldoelen, een wijzigingenlog, een kwaliteitsoverzicht, een eigen
visueel ontwerp ("Binnentuin") en installeerbaarheid als app.

## Visueel ontwerp: "Binnentuin"

De app heeft een eigen visuele stijl gekregen, genoemd naar de sfeer van je locatienamen
(De Lindenhof, Zonnehoeve, Beukenpark, Meidoornhuis): mosgroen en een bosbesrode accentkleur
op een warme, papierachtige ondergrond, met "National Park" voor koppen en "Work Sans" voor
lopende tekst. Beide lettertypen zijn in het bestand ingebakken (als data, geen internet nodig)
zodat de app er overal hetzelfde uitziet.

De accentkleur (bosbesrood) is bewust alleen gereserveerd voor de belangrijkste
actieknoppen ("Markeer als afgerond", "Toevoegen"), los van de merkkleur (mosgroen) in de
navigatie — zo springt precies de actie die aandacht vraagt eruit.

## Hoe open ik de app?

Er zijn drie manieren, van eenvoudig naar volledig. Kies wat het beste bij je past — je kunt
ook gewoon met optie 1 beginnen en later overstappen.

### Optie 1 — snel, geen installatie

Dubbelklik op `index.html` (of open het bestand via je browser: `Bestand > Openen`). Werkt
direct, in Chrome, Edge of Firefox. Je mist dan wel een eigen app-venster en het gebruik
zonder internetverbinding (zie hieronder) — voor het dagelijkse gebruik maakt dat verder niets uit.

### Optie 2 — app-snelkoppeling, zonder servertje

Een eigen icoon op je bureaublad/startmenu en een venster zonder browserbalk, zonder dat je
er iets extra's voor hoeft te installeren of te starten. Nadeel: werkt niet zonder
internetverbinding (dat vereist optie 3) en er verschijnt geen automatische
"installeren"-knop — je maakt de snelkoppeling zelf, eenmalig, via het browsermenu:

1. Open `index.html` gewoon zoals in optie 1 (dubbelklikken).
2. Klik in Chrome of Edge op het menu (⋮ rechtsboven) → **Extra hulpprogramma's** /
   **Meer downloaden** → **Snelkoppeling maken...** (Engels: *More tools* → *Create shortcut...*).
3. Vink **"Openen in een venster"** / **"Open as window"** aan en klik op **Maken/Create**.
4. Je hebt nu een Zorgplanner-icoon op je bureaublad (of vastgezet in het startmenu/taakbalk)
   dat de app in zijn eigen venster opent, met het Binnentuin-icoon.

### Optie 3 — volledig geïnstalleerd, ook offline (aanbevolen als je vaak zonder wifi werkt)

Hetzelfde als optie 2, plus: werkt ook zonder internetverbinding, omdat de app dan volledig in
je browser wordt opgeslagen. Dit vereist één klein extra stapje omdat browsers offline-opslag
alleen toestaan als de pagina via een (lokaal) adres wordt geopend, niet vanaf een los bestand.

1. Dubbelklik op **`start-windows.bat`** (Windows) of **`start-mac.command`** (Mac).
   - Dit start een klein lokaal servertje op je eigen computer (met Python, dat op de meeste
     computers al geïnstalleerd is) en opent de app automatisch in je browser op
     `http://localhost:8420`. Er gaat niets naar internet — dit blijft net zo lokaal als
     voorheen, het adres is alleen bereikbaar vanaf je eigen computer.
   - Geen Python gevonden? Installeer het gratis via
     [python.org/downloads](https://www.python.org/downloads/) (Windows: vink bij installatie
     "Add to PATH" aan) en probeer het daarna opnieuw.
   - Laat het venstertje dat opent openstaan zolang je de app gebruikt — dat is het servertje.
     Sluit je dat venster, dan stopt de app met werken totdat je het script opnieuw start.
2. Zodra de app op `http://localhost:8420` open staat, zie je rechtsboven een knop
   **"📲 App installeren"** verschijnen (soms moet je de pagina een keer verversen). Klik
   daarop, of gebruik het installatie-icoontje in de adresbalk van Chrome/Edge.
3. Na installatie vind je de Zorgplanner terug als een gewone app op je bureaublad/startmenu,
   met het eigen icoon — en werkt hij ook zonder internet, omdat alle onderdelen dan al in je
   browser zijn opgeslagen (via een "service worker").

Belangrijk: de map met bestanden (`index.html`, `manifest.json`, `sw.js`, `icons/`,
`start-windows.bat`, `start-mac.command`) moet bij elkaar in dezelfde map blijven staan.

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

## Hoe werkt het dashboard?

Het dashboard is het **startscherm** — dit zie je als eerste wanneer je de app opent.

- Bovenaan vier tegels: aantal verlopen items, aantal items deze week, aantal acties die
  in uitvoering zijn, en het totaal aantal openstaande items (over alle onderdelen heen).
- **"Wat heeft deze week aandacht nodig?"** verzamelt alles wat verlopen is of deze week
  gepland staat uit de jaarplanning, de actielijst én de open ontwikkeldoelen van je team,
  op volgorde van datum. Je kunt taken en acties direct vanaf het dashboard afronden, of
  doorklikken naar het profiel van een medewerker bij een ontwikkeldoel.
- Filter dit overzicht op locatie.
- **"Overzicht per locatie"** toont per locatie het aantal bewoners en medewerkers, en hoeveel
  jaarplanning-taken en acties er verlopen of deze week gepland staan — een snel totaalbeeld
  zonder per onderdeel te hoeven filteren.
- **Back-up-herinnering**: een gekleurde balk laat zien wanneer je voor het laatst een back-up
  hebt gemaakt (groen: binnen 14 dagen, geel: 15–30 dagen, rood: langer geleden of nog nooit).
  Dezelfde melding staat ook bij **Jaarplanning → Instellingen → Back-up**.
- **Wijzigingen & verandertrajecten**: een logboek per locatie van beleidswijzigingen en
  verandertrajecten (bijv. een nieuwe procedure of een pilot), met status Aangekondigd/In
  uitvoering/Doorgevoerd. Gebruikt dezelfde locatiefilter als de aandachtspuntenlijst hierboven.
  Toevoegen via **+ Nieuwe wijziging**.

## Hoe werkt de jaarplanning?

- Elke taak heeft een geplande datum. De kleur laat zien hoe urgent iets is: rood
  (verlopen), oranje (deze week), geel (deze maand), grijs (later dit jaar).
- Klik op **Markeer als afgerond** zodra je een taak hebt gedaan. De app plant de
  volgende ronde automatisch in, op basis van de ingestelde frequentie.
- Je kunt een datum ook handmatig verzetten met het datumveld naast een taak.
- Filter op locatie, op bewoners/medewerkers, of op status.
- **Kwaliteitsoverzicht** (inklapbaar, onder de tabel): laat per taaktype en per kwartaal zien
  hoeveel taken zijn afgerond en welk percentage daarvan op tijd was (dus vóór de geplande
  datum). Respecteert het locatiefilter hierboven — handig voor een teamoverleg of audit.

## Hoe werkt het onderdeel Team?

- **Teamoverzicht**: kaartjes per medewerker met locatie, aantal open ontwikkeldoelen en de
  datum van het laatste gespreksverslag. Filter op locatie, klik op **Bekijk profiel** voor
  details.
- **Profiel per medewerker** bevat drie onderdelen:
  - **Ontwikkeldoelen (GROW)** — Goal, Reality, Options, Will, met status (open/bereikt/
    vervallen), een **competentiegebied** (Leiderschap, Kwaliteit, Verandering, HRM & coaching,
    Bedrijfsvoering, Persoonlijke ontwikkeling of Overig — gebaseerd op het functieprofiel van
    de opleiding Management in de Zorg) en een streefdatum. Velden zijn direct te bewerken;
    wijzigingen worden automatisch opgeslagen. Op het teamoverzicht zie je een tabel met het
    aantal open ontwikkeldoelen per competentiegebied, zodat je in één oogopslag ziet waar het
    team aan werkt en waar nog niets loopt.
  - **Observaties (hoor/zie/voel/interpreteer)** — vastleggen wat je hebt waargenomen,
    los van je interpretatie. Bij een nieuwe observatie kun je ook **dicteren**: spreek je
    observatie in gewone taal in, en klik op **Analyseer en verdeel** om de tekst automatisch
    (met eenvoudige zoekwoorden, lokaal) te laten opsplitsen over de vier velden. Controleer
    en corrigeer het resultaat altijd — het is een hulpmiddel, geen vervanging van je eigen
    beoordeling. Dicteren werkt alleen in Chrome of Edge, vereist microfoontoegang en is de
    **enige plek in de app** waar geluid voor verwerking naar een externe dienst (meestal
    Google) gaat — de rest van de app blijft volledig lokaal. Zonder ondersteuning of
    zonder microfoon typ je de tekst gewoon zelf in hetzelfde veld.
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

## Hoe werkt het onderdeel Bewoners?

- **Bewonersoverzicht**: kaartjes per bewoner met locatie, een korte preview van de zorgvraag
  en de datum van de laatste dossieraantekening. Filter op locatie, klik op **Bekijk profiel**
  voor details.
- **Profiel per bewoner** bevat:
  - **Basisgegevens** — zorgvraag en contactpersoon (naam, relatie, telefoon), direct te
    bewerken.
  - **Jaarplanning voor deze bewoner** — dezelfde dossierchecks/evaluaties als in de
    jaarplanning, met **Markeer als afgerond** zonder naar dat tabblad te hoeven wisselen.
  - **Dossieraantekeningen** — een kort logboek van bijzonderheden per datum (bijv. een
    valincident, aangepaste medicatietijden). Toevoegen via **+ Nieuwe aantekening**,
    bewerken/verwijderen kan per aantekening.

## Alle onderdelen zijn nu klaar

De vier onderdelen uit de oorspronkelijke wens (Team, Jaarplanning, Actielijst, Dashboard) zijn
gebouwd, aangevuld met een Bewoners-tabblad, een back-up-herinnering, competentiegebieden bij
ontwikkeldoelen, een wijzigingenlog en een kwaliteitsoverzicht. Wil je iets aanpassen, uitbreiden
of anders inrichten — geef het gewoon aan.
