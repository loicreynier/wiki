---
title: Vortex
icon: material/weather-hurricane
---

# Vortex

## [Portable install](https://github.com/Nexus-Mods/Vortex/issues/14642#issuecomment-2091915594)

Vortex can be started in "portable" mode by starting an instance in "shared mode"
and using CLI arguments to specify the data path.
A shortcut to a launch a portable Vortex instance would look like

```cmd
S:\Programs\Modding\Vortex\Vortex.exe --shared --user-data "S:\ProgramData\Vortex\UserData"
```

However, when clicking on "Download with Mod Manager" links from Nexus,
if the portable instance is not launched,
the download might start in an instance started without using these CLI arguments.
