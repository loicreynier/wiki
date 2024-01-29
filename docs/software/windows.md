---
title: Windows
date: 2029-01-04
tags:
  - Windows
  - "Operating Systems"
  - "Ricing"
icon: material/microsoft-windows
---

# Windows

## Storage

### Removing "phantom" drive letters

Phantom drive letters refer to drive letters
that are assigned to non-existent
or disconnect drives.
They can be removed using PowerShell as an administrator:

```powershell
mountvol <letter>: /D
```

## WSL

### Execute command from PowerShell

To execute Linux commands through WSL from PowerShell,
one can employ the `wsl` or `bash` commands:

```powershell
wsl -d <distro> -u <user> -- <command> # Login shell
wsl -d <distro> -u <user> --exec <command> # Standard shell
bash -c <command> # Default user login shell
```

#### `CreateProcessEntryCommon` error

!!! Tip "TLDR: use `wsl -- <command>`"

As of WSL 2.0.9.0,
the `bash` PowerShell command invokes `<command>` through a login shell
of the default WSL distribution (`wsl --setdefault <distro>`).
To achieve this, it:

1. Determines the default user ID
2. Looks up the user's shell in `/etc/passwd`
3. Attempts to start the shell

When the login shell is not accessible,
[the following error is encountered](https://askubuntu.com/questions/1458921):

```powershell
<3>WSL (464) ERROR: CreateProcessEntryCommon:502: execvpe /bin/bash failed 2
```

This can especially be the case in NixOS WSL (version 23.11 at least),
where all the NixOS-specific magic/operations
([though subject to change in future versions][NixOSWSL_login_error])
happens within the login shell of the root user.

In the case of NixOS WSL,
a similar error is encountered when using `wsl --exec`,
which does not start a login shell.
Currently,
in this scenario, only `wsl -- <command>` works properly.

[NixOSWSL_login_error]: https://github.com/nix-community/NixOS-WSL/issues/284

## Ricing

### Icons locations (Windows 11)

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
