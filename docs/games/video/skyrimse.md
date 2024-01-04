---
title: Skyrim Special Edition
date: 2024-01-03
tags:
  - Modding
  - Skyrim
---

# Modding

## Updating modded install

### Updating game files

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

> [!WARNING]
> Root Builder cache and backups
> must be reset when adding new files to the game folder.

### Updating Creation Club

<!-- markdownlint-disable MD033 -->

Updates can also be accompanied by updates from the Creation Club.
The Creations must then also be updated.
To do this,
launch the game, without mods[^1],
in order to access the "Creations" menu in the main menu.
In version 1.6.1130,
<kbd>o</kbd> key allows access to an option to redownload all the Creations.

> [!NOTE]
> Outdated creations can lead to errors related to SKSE Plugins
> in the crash loggers.

[SteamDB]: https://steamdb.info

[^1]: and preferably with Steam to be directly connected to Bethesda.net