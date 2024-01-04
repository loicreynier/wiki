---
title: Windows
date: 2023-11-22
tags:
  - Windows
  - "Operating Systems"
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
