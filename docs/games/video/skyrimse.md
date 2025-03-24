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
- [MO2 Python Plugin API Documentation](https://www.modorganizer.org/python-plugins-doc/index.html)
- [SKSE Plugin Status](https://modding.wiki/en/skyrim/users/skse-plugins)
- [DirectX Scancodes list](https://wiki.nexusmods.com/index.php/DirectX_Scancodes_And_How_To_Use_Them)
- [xEdit Documentation](https://tes5edit.github.io/docs)

<!-- editorconfig-checker-enable -->

### Testing

#### Soul absorption test

To test behaviors, such as animations, during dragon soul absorption,
one can spawn a dragon and reduce its health to zero,
forcing it to land and trigger the absorption sequence:

1. draw your weapon
2. run `player.placeatme 1ca05` then target the dragon and run `forceav health 0`
3. walk up to this corpse and test the sequence

### Updating modded install

#### Updating game files

Updates can be downloaded from Steam depots using [SteamDB].
Skyrim SE Steam app is composed of three depots:

- Disk: <https://steamdb.info/depot/489831>
- Core: <https://steamdb.info/depot/489832>
- SkyrimSE.exe: <https://steamdb.info/depot/489833>

Some updates only modify the executable,
while others modify files from the core depot (`Data` files).
The history of modifications to the core files can be seen here:
<https://steamdb.info/depot/489832/history>.

Depots can be downloaded using the Steam console
([`steam://open/console`](steam://open/console) or `steam.exe -console`)
with

```console
download_depot <app_id> <depot_id> <manifest_id>
```

Hence,
the two depots from the Skyrim app can be downloaded with

```console
download_depot 489830 489831 <manifest_id>
download_depot 489830 489832 <manifest_id>
download_depot 489830 489833 <manifest_id>
```

Once downloaded,
the depot files can be combined into one folder.
That folder can then be zipped and installed as a mod using [Root Builder].
Doing so,
each Skyrim version can be installed as a separated mod managed by MO2.

Alternately,
the updates files can be copied into the (modded) game folder.

!!! Warning "Root Builder cache"

    Root Builder cache and backups
    must be reset when adding new files to the game folder.

[Root Builder]: https://kezyma.github.io/?p=rootbuilder

#### Updating Creation Club

<!-- markdownlint-disable MD033 -->

Updates can also be accompanied by updates from the Creation Club.
The Creations must then also be updated.
To do this,
launch the game, without mods[^1],
in order to access the "Creations" menu in the main menu.
In version 1.6.1130,
<kbd>o</kbd> key allows access to an option to redownload all the Creations.

!!! Warning "Outdated creations"

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

#### OBody configuration

Configuring [OBody] requires editing the `OBody_presetDistributionConfig.json` configuration file.
A common approach is to use the [ORefit JSON Master List] as a base with modifications.
To prevent manually combining those files, one may want to use a tool to automate the task.
I tried two different solutions:

- the [Synthesis merger](https://github.com/audriuska12/OBodyMerger)
- the [MO2 plugin merger](https://www.nexusmods.com/skyrimspecialedition/mods/133626)

The Synthesis patcher provides more features,
however it requires changing the structure of the original mods by moving
the configuration file to `OBodyTemplate/OBody_presetDistributionConfig_<index>.json`
This is due to how Synthesis works
using the VFS and therefore having access to only one file with the same name.
For this reason I prefer working with the MO2 plugin instead.

[OBody]: https://www.nexusmods.com/skyrimspecialedition/mods/77016
[ORefit JSON Master List]: https://www.nexusmods.com/skyrimspecialedition/mods/105052

#### Follower frameworks

It appears there are essentially three types of followers:

1. custom voice with custom framework (e.g., Inigo)
2. custom voice with vanilla framework (e.g., IFD Lydia)
3. vanilla voice with vanilla framework

[BFF] handles followers with vanilla framework but seems to struggle with the second type.
Some users recommend using it in combination with [Simple Outfit System] and [Settling of Squads]
to address issues in these cases.

For better compatibility,
the best compromise seems to be using [NFF] alongside [Setting of Squads]
for the home function of custom framework followers.

[BFF]: https://www.nexusmods.com/skyrimspecialedition/mods/112076
[NFF]: ttps://www.nexusmods.com/skyrimspecialedition/mods/55653
[Simple Outfit System]: https://www.nexusmods.com/skyrimspecialedition/mods/48974
[Settling of Squads]: https://www.nexusmods.com/skyrimspecialedition/mods/125471

<!-- editorconfig-checker-enable -->

#### Armory Retexture: Xavbio's Retextures with Believable Weapons

!!! Warning "This setup is still in testing"

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

#### Book Cover Skyrim & Legacy of the Dragonborn

When using the Legacy of the Dragonborn (LotD) patch,
patches for Book Covers Skyrim (BCS) should not be installed.
Since LotD incorporates Book Covers Skyrim,
patches specifically for LotD should be installed instead.
This is why XilaMonstrr's upscaled version of BCS includes a LotD patch,
which is simply a dummy, empty ESP replacer.
