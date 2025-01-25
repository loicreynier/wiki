---
title: Linux
tags:
  - Linux
  - "Operating Systems"
icon: material/linux
---

<!-- markdownlint-disable MD046 -->

# Linux

## File manipulations

### Removing files with special characters

File names containing special characters might not be recognized by
command-line completion or utilities such as `rm` or `mv` .
Even GUIs, such as file explorers,
and TUIs like `edir`,
may struggle to rename or delete files with non-Unicode characters.

To get around this issue,
one may use file's index node
([inode](https://en.wikipedia.org/wiki/Inode))
to access the file.
The problematic file's inode can be identified using `ls -li`,
and subsequently,
the file can be deleted or renamed by grabbing the file
using the `find` command:

```shell
# Deletion
find . -maxdepth 1 -type f -inum "<file-inode>" -delete
# Renaming
find . -maxdepth 1 -type f -inum "<file-inode>" -exec mv {} "<new-name>" \;
```

!!! Note "`fd` alternative"

    As of version 9.0,
    `fd` does not appear to have option to select files by inode.

## Shell

### Shell commands invisible after ++ctrl+c++

!!! Tip "TLDR"

    Use `reset` or `tset` commands.

When interrupting ++ctrl+c++ or suspending ++ctrl+z++ TUI applications,
subsequent commands in the Bash shell may not be visible.

This occurs because
TUI applications often disable terminal echoing and buffering to control their display.
If interrupted or suspended, these applications may not have the chance to reset terminal settings,
leading to this issue.

To resolve this,
use the `reset` or `tset` commands to restore the terminal to its standard settings,
re-enabling local echo and resolving the visibility problem for subsequent commands.

## Configuration

### Dotfiles

#### GNU Stow and alternatives

> GNU [Stow] is a symlink farm manager which takes distinct packages
> of software and/or data located in separate directories on the file system,
> and makes them appear to be installed in the same place.
> For example, `/usr/local/bin` could contain symlinks to files
> within `/usr/local/stow/emacs/bin`, `/usr/local/stow/perl/bin` etc.,
> and likewise recursively for any other subdirectories such as
> `.../share`, `.../man`, and so on.

Stow is a free and open-source software written in Perl.
It is mainly used to manage the installation of software packages
on Unix-like systems.
It is designed to ease the process of organizing and maintaining software
that is not part of the system's package manager.

Stow is not limited to just managed software installations;
it can also be used to manage configuration files effectively.
In this context,
it helps users keep their configuration files organized
and separate from the `$HOME` directory,
making it easier to manage and maintain different
configurations for various software applications.

Due to its implementation in Perl,
Stow can be challenging to install on servers
where the user does not have administrative rights,
such as HPC centers, for example.
In this context,
one can turn to alternatives:

- [Dploy] is a Python-based tool
  that provides similar functionality to GNU Stow.
  There are a few technical differences between Stow and Dploy.
  Firstly, Dploy works on Linux, Mac and Windows.
  Unlike Stow, Dploy requires explicit source and destination folders
  and does not have any concept of ownership.
- [`stowsh`][stowsh] is Bash script-based alternative to GNU Stow.
  Being a shell script, it is designed to ave minimal dependencies.
  It depends on the GNU Core Utilities implementation of `realpath`
  and GNU Find Utilities.
- There are also implementations of Stow written in Rust,
  such as [`new-stow`](https://github.com/adam-gaia/new-stow)
  or [`rstow`](https://github.com/qboileau/rstow).

[Stow]: https://www.gnu.org/software/stow/
[Dploy]: https://github.com/arecarn/dploy
[stowsh]: https://github.com/mikepqr/stowsh
