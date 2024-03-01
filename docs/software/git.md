---
title: Git
tags:
  - Git
  - Code
icon: material/git
---

# Git

## Staging

### Stage only part of a new/untracked file

```shell
git add -N <file>
git add -p <file>
```

`git add`'s `-N` flag record only the fact that the path will be added later.

## Branches

### Remove obsolete tracking branches

After deleting a local branch with `git branch -d`
and deleting the remote branch with `git push origin --delete`,
other machines may still have "obsolete tracking branches".
To get rid of these do

```shell
git fetch --all --prune
```

## Log

### List commits since certain commit

To list all commits made since a certain commit,
use `git log <hash>..`,
where `<hash>` represents the commit hash you want to start listing from,
ensuring to include the two dots for correct range specification:

```shell
git log origin/main..
```
