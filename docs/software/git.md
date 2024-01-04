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
