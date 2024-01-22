---
title: Skyrim Special Edition
date: 2024-01-05
tags:
  - Modding
  - Skyrim
icon: material/axe-battle
---

<!-- markdownlint-disable MD046 -->

# Skyrim Special Edition

## Modding

### Updating modded install

#### Updating game files

Updates can be downloaded from Steam depots using [SteamDB].
Skyrim SE Steam app is composed of two depots:

- Core: <https://steamdb.info/depot/489832>
- SkyrimSE.exe: <https://steamdb.info/depot/489833>

Some updates only modify the executable,
while others modify files from the core depot (`Data` files).
The history of modifications to the core files can be seen here:
<https://steamdb.info/depot/489832/history>.

Depots can be downloaded using the Steam console
(`steam://open/console` or `steam.exe -console`)
with

```console
download_depot <app_id> <depot_id> <manifest_id>
```

Hence,
the two depots from the Skyrim app can be downloaded with

```console
download_depot 489830 489832 <manifest_id>
download_depot 489830 489833 <manifest_id>
```

Once downloaded,
the update files can be copied to the (modded) game folder.

!!! warning "Root Builder"

    Root Builder cache and backups
    must be reset when adding new files to the game folder.

#### Updating Creation Club

<!-- markdownlint-disable MD033 -->

Updates can also be accompanied by updates from the Creation Club.
The Creations must then also be updated.
To do this,
launch the game, without mods[^1],
in order to access the "Creations" menu in the main menu.
In version 1.6.1130,
<kbd>o</kbd> key allows access to an option to redownload all the Creations.

!!! Outdated creations

    Outdated creations can lead to errors related to SKSE Plugins
    in the crash loggers.

[SteamDB]: https://steamdb.info

[^1]: and preferably with Steam to be directly connected to Bethesda.net

### Mod installation/compatibility notes

#### XPMSSE

Since [IED] no longer requires [XPMSSE] as a prerequisite,
there is no need to install
the weapon styles and accompanying scripts from XPMSSE.
XPMSSE is now only necessary for its skeleton, which is notably used by CBBE.
Therefore,
it is not necessary to install the settings loader for the MCM
and the various weapons style script fixes such as:

- XP32 XPMSSE Weapon Styles Uncloaked
- XP32 FIXES SCRIPTS
- XP32 XPMSSE - Nemesis - Papyrus Stack Fix

For an IED + SOS setup,
it is recommended to use [XP32 Maximum Skeleton Lite],
which streamlines XPMSSE
to only include physics and scripts for SOS and tails.

<!-- editorconfig-checker-disable -->

[IED]: https://www.nexusmods.com/skyrimspecialedition/mods/62001
[XPMSSE]: https://www.nexusmods.com/skyrimspecialedition/mods/1988
[XP32 Maximum Skeleton Lite]: https://www.nexusmods.com/skyrimspecialedition/mods/69583

<!-- editorconfig-checker-enable -->
