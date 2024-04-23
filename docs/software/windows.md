---
title: Windows
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

## Clipboard

### Interacting with the clipboard from the command line

The only native command to interact with the clipboard is `clip.exe`
which only provides copying through `ls | clip.exe`, see `clip.exe /?`.
On the other side,
PowerShell provides Cmdlets [`Get-Clipboard`][Get-Clipboard] and [`Set-Clipboard`][Set-Clipboard]
to fully interact with the clipboard:

```powershell
ls | Out-String | Set-Clipboard
Get-Clipboard
```

These can be used from WSL with `ls | powershell.exe Get-Clipboard`, which can be slow.
In addition to these native tools,
there are third-party tools available for clipboard interaction that do not require PowerShell.
Among these, [`win32yank`][win32yank] is the fastest I have tested (blazing fast).
However, it's important to note that while `win32yank` can be run from the WSL path,
it operates much slower than when run from the Windows path.

Another third-party tool to consider is [`wclip`][wclip] which provides a `--secret` option,
which instructs clipboard viewers such as ClipMate and AceText not to capture the copied data
(not tested with Windows 11 clipboard manager).

[Get-Clipboard]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-clipboard
[Set-Clipboard]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Set-clipboard
[win32yank]: https://github.com/equalsraf/win32yank
[wclip]: https://github.com/palortoff/wclip

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

## Hyper-V

### Disabling/enabling Hyper-V for running a program

!!! Tip "TLDR: run `bcdedit /set hypervisorlaunchtype off && shutdown /r /t 0`"

Some (shady or related to virtualization) programs
may require to disable Window's Hyper-V to be able to run.
The quickest may to disable it is probably to run

```cmd
bcdedit /set hypervisorlaunchtype off
```

This command disables Hyper-V on (the next) boot.
It then requires a reboot to apply the changes.

The main drawback of disabling of Hyper-V is that it also disables WSL.
However, the only programs I use that requires these adjustments are gaming-related,
so I don't need WSL to run simultaneously (or do I?).
To facilitate easy switching,
I wrote a [PowerShell script][RestartToggleHyperV] that toggles `hypervisorlaunchtype`
between `off` and `auto` based on its current value and then reboot the computer.
To access this script quickly,
I created a shortcut for it in the start menu,
allowing it to be launched from PowerToys or Windows run launcher.

[RestartToggleHyperV]: https://github.com/loicreynier/sandbox/blob/main/pwsh-magic/RestartToggleHyperV.ps1

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
