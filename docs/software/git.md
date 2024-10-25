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

## GitHub

### Edit PR as maintainer

Let's say `contributor` has submitted a pull request to `project/repo`.
They have made changes on their `feature` branch and proposed to merge this into `origin/main`.
A maintainer can edit (i.e., pushing commits or rebasing) the pull request
if [maintainer edits][Github_maintainer_edits] are enabled.

To do that, as maintainer you must first add their fork as a remote

```shell
git remote add contributor git@github.com:contributor/repo
```

such that:

```shell
git remote -v
origin        https://github.com/project/repo (fetch)
origin        https://github.com/project/repo (push)
contributor   https://github.com/contributor/repo  (fetch)
contributor   https://github.com/contributor/repo  (push)
```

Next, pull down their list of branches with

```shell
git fetch contributor
```

and create a new branch `contributor-feature` from the branch that they have created the PR from:

```shell
git checkout -b contributor-feature contributor/feature
```

Now make any changes you need to make on this branch
and finally push the changes back to the PR by pushing their branch

```shell
git push contributor contributor-feature:feature
```

Note that if a rebase was performed, a `push --force` is necessary.

[Github_maintainer_edits]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/allowing-changes-to-a-pull-request-branch-created-from-a-fork
