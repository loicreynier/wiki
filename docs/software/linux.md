---
title: Linux
tags:
  - Linux
  - "Operating Systems"
icon: material/linux
---

# Linux

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
