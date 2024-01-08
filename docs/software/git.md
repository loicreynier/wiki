---
title: Git
date: 2023-01-04
tags:
  - Git
  - Code
---

## Stage only part of a new/untracked file

```shell
git add -N <file>
git add -p <file>
```

`git add`'s `-N` flag record only the fact that the path will be added later.

## Remove obsolete tracking branches

After deleting a local branch with `git branch -d`
and deleting the remote branch with `git push origin --delete`,
other machines may still have "obsolete tracking branches".
To get rid of these do

```shell
git fetch --all --prune
```
