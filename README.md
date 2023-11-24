
██╗██████╗░███████╗███╗░░██╗████████╗██╗████████╗██╗░░░██╗
██║██╔══██╗██╔════╝████╗░██║╚══██╔══╝██║╚══██╔══╝╚██╗░██╔╝
██║██║░░██║█████╗░░██╔██╗██║░░░██║░░░██║░░░██║░░░░╚████╔╝░
██║██║░░██║██╔══╝░░██║╚████║░░░██║░░░██║░░░██║░░░░░╚██╔╝░░
██║██████╔╝███████╗██║░╚███║░░░██║░░░██║░░░██║░░░░░░██║░░░
╚═╝╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░░╚═╝░░░░░░╚═╝░░░
░██████╗████████╗░█████╗░██████╗░███████╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝

# Avanceret Drugsystem
Vores drugsystem fjerner AFK-farming. Vi har lavet det sådan, at du skal plante et frø på en bestemt lokation, for at kunne gro stoffer.
Spillerne skal så pleje dette frø med forskellige produkter, for at få det største udbytte.

Du kan ændre beskeder under `shared/langs/da.lua`
Du kan indstille scriptet efter dine behov i `config.lua`
Du kan ændre de forskellige funktioner der bliver brugt i scriptet i hhv. `shared/utils.lua`, `server/utils.lua` og `client/utils.lua`

# __VIGTIGT__
Gå ind i `server/main.lua` og `client/main.lua` og ændre variablen "serverEventCode" til det **PRÆCIS** samme i begge filer.
Gøres dette ikke, kan hackere bruge koden til at trigger events og snyde med ting. Kender de ikke koden, så bliver de banned med det samme.

# SQL
Alle `.sql` filer ligger under `SQL` mappen.
Kør `id_drugsystem.sql` - for at kunne bruge scriptet.
Køre din server med ESX, kan du importere alle items via `esx_items.sql`

# Dependencies
Alle dependencies kan hentes ved at trykke på det.
  - [id_core](https://github.com/cBeyerDK/id_core)
  - [id_notify](https://github.com/cBeyerDK/skeexsNotify/archive/refs/heads/main.zip) 
  - [id_helpnotify](https://github.com/cBeyerDK/cd_drawtextui/archive/refs/heads/main.zip)
  - [oxmysql](https://github.com/overextended/oxmysql/releases)
  - [fivem-target](https://github.com/cBeyerDK/fivem-target/archive/refs/heads/main.zip)
  - [progressBars](https://github.com/cBeyerDK/progressBars/archive/refs/heads/master.zip)

# Tilføjelser
- Bande System
    Med vores Bande System kan du gøre nogle funktioner kun tilgængelige for bande-medlemmer. [LINK](https://github.com/cBeyerDK/id_gangsystem/releases)

# Support
Der er ingen support at hente. Scriptet står som det er.

Scriptet er beskyttet under GNU General Public License v3.0 <br />
Scriptet er skrevet og udgivet af **cBeyer** som er med ejer af Identity Store
