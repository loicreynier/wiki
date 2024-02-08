---
title: SSH
icon: material/remote-desktop
tags:
  - SSH
  - password
  - passphrase
---

# SSH

## Key management

### Change/remove passphrase from key

```shell
ssh-keygen -p -f <keyfile>
```

This will then prompt for the old passphrase
and the new password (which can be left blank to have no passphrase).

This can also be done without prompt with the following one liner:

```shell
ssh-keygen -p -f <keyfile> -P <old-passphrase> -N <new-passphrase>
```

To remove the passphrase,
simply use an empty passphrase: `-N ''`.
Beware that when executing commands they will typically
be logged in the shell history file in plain text.
