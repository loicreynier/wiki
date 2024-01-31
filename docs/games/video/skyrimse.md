---
title: Skyrim Special Edition
tags:
  - Modding
  - Skyrim
icon: material/axe-battle
---

<!-- markdownlint-disable MD046 -->

# Skyrim Special Edition

## Modding

### Documentation

<!-- editorconfig-checker-disable -->

- [Animonculory Modding Resources](https://github.com/The-Animonculory/Modding-Resources)
- [Learn To Mod](https://github.com/LivelyDismay/Learn-To-Mod)
- [SKSE Plugin Status](https://modding.wiki/en/skyrim/users/skse-plugins)
- [xEdit Documentation](https://tes5edit.github.io/docs)

<!-- editorconfig-checker-enable -->

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

!!! warning "Outdated creations"

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

#### Armory Retexture: Xavbio's Retextures with Believable Weapons

!!! warning "This setup is still in testing"

These are my installation notes for a setup
using Xavbio's retextures as a core
and Believable Weapons for weapon meshes.
They might be useful for other setups
but are primarily here as reference
in case I need to recall my choices.

In summary,
here is the load order for the setup:

```text
WACCF
Better-Shaped Weapons
Believable Weapons
WACCF - Better-Shaped Weapons Patch
WACCF - Believable Weapons Patch
Kinda Believable Weapons (Realistic CC Weapons)
ElSopa Quivers
Stalhrim Refrozen
Xavbio's Retextures
```

##### Weapon meshes

As Believable Weapons does not cover as much as Better-Shaped Weapons,
a best-of-both world solution is to install both
and let Believable Weapons override Better-Shaped Weapons.
By doing so,
you'll end up with Better-Shaped™ daggers (and arrows?)
and Believable™ other weapons.

The only issue is that Xavbio's retextures do not cover
Believable Weapons greatsword scabbards meshes.
However,
since these use vanilla textures,
they are retextured,
and I did not experience any issues using this setup.

WACCF's FOMOD offers mesh patches for orcish weapons.
Since these meshes are applicable to all weapons,
the mod must be installed twice (in this setup):

1. once using Better-Shaped meshes;
2. a second time using Believable Weapons meshes
   to override the meshes other than daggers

This results in the following load order:

```text
WACCF
Better-Shaped Weapons
Believable Weapons
WACCF - Better-Shaped Weapons Patch
WACCF - Believable Weapons Patch
```

##### Cathedral shine

Cathedral Armory provides shiny retextures and environment maps
for vanilla armor.
Personally, I prefer a vanilla-ish less bright look,
especially in an ENB setup,
and I do not use (or rather no longer use)
this mod or the patches in Xavbio's FOMODs.
If ever the desire takes me to want more shine,
[Cloud has uploaded environment maps][CloudXavbioTweaks]
to tweak the shininess of Xavbio's textures.

Moreover,
it should be noted that [Cloud does not recommend][CloudXavbioTweaks]
using these patches even for Cathedral Armory users.

[CloudXavbioTweaks]: https://www.nexusmods.com/skyrimspecialedition/mods/87751

##### The Stalhrim dilemma

Every mod that affects Stalhrim gears
ask you which Stalhrim reflection you are using.
Among the most popular choices are
[Stalhrim Refrozen](https://www.nexusmods.com/skyrimspecialedition/mods/41348)
and the
[Resurgence](https://www.nexusmods.com/skyrimspecialedition/mods/85604)
version by Iconic
Both look very good.
The Refrozen version has a more magical feel,
while the Resurgence version gives a thick ice appearance
However,
patches for Stalhrim Refrozen are more readily available,
especially in Xavbio's patches.
Except for the armory retexture in Stalhrim,
all other FOMOD options only offer patches for Stalhrim Refrozen.
Therefore, the latter has been chosen.
