---
title: Windows
date: 2024-01-04
tags:
  - Windows
  - "Operating Systems"
  - "Ricing"
---

# Storage

## Removing "phantom" drive letters

Phantom drive letters refer to drive letters
that are assigned to non-existent
or disconnect drives.
They can be removed using PowerShell as an administrator:

```powershell
mountvol <letter>: /D
```

# Ricing

## Icons locations (Windows 11)

Most of the icons used by Windows are stored in DLL files:

- `%systemroot%\system32\imageres.dll`: misc icons
- `%systemroot%\system32\shell32.dll`: misc icons
- `%systemroot%\system32\ddores.dll`: hardware icons
- `%systemroot%\system32\mmres.dll`: audio hardware icons
- `%systemroot%\system32\accessibilitycpl.dll`: accessibility features icons
- `%systemroot%\system32\networkexplorer.dll`: phones/routers/printers icons
- `%systemroot%\system32\sensorscpl.dll`: sensors icons
- `%systemroot%\system32\setupapi.dll`: hardware setup wizards icons
- `%systemroot%\system32\wmploc.dll`: media devices (CD, DVD) icons
- `%systemroot%\system32\dmdskres.dll`: disk management icons
- `%systemroot%\explorer.exe`: file explorer (and its older versions) icon
- `%systemroot%\system32\netcenter.dll`: network-related settings icons
- `%systemroot%\system32\ieframe.dll`: old Internet Explorer icons
- `%systemroot%\system32\pifmgr.dll`: old-style (Windows 95-98) icons
- `%systemroot%\system32\moricons.dll`: old icons about MS-DOS programs
- `%systemroot%\system32\mmcndmgr.dll`: old networking icons
