### [2.7.0](../../../compare/2.6.1...2.7.0) - 2017-07-21

- [deltag.sh](deltag.md) Now delete how much tags as you need
- [status.sh](status.md) Call git fetch to refresh git cache when commits need to be pushed

### [2.6.1](../../../compare/2.6.0...2.6.1) - 2016-08-19

- [status.sh](status.md) Hide git log errors
- [status.sh](status.md) Add yellow message "Branch does not exist on origin"
- [status.sh](status.md) Add red message with git log error code when error occured
- Add $fonrColor parameter to smallBlock()
- [status.sh](status.md) Change font color from white to black for yellow messages (Commits needs to be pushed and Branch does not exist on origin)

### [2.6.0](../../../compare/2.5.0...2.6.0) - 2016-02-27

- [status.sh](status.md) Add -show-current-path-title parameters
- [rebase.sh](rebase.md) Call status.sh with -show-current-path-title=no -max-depth=1 parameters

### [2.5.0](../../../compare/2.4.1...2.5.0) - 2015-01-18

- [renamebranch.sh](renamebranch.md) Add renamebranch.sh, who rename local branch and push change to origin

### [2.4.1](../../../compare/2.4.0...2.4.1) - 2015-12-07

- Fix "HEAD détachée" repository status in status.sh

### [2.4.0](../../../compare/2.3.0...2.4.0) - 2015-11-26

- [deluntrackedbranch.sh](deluntrackedbranch.md)] List untracked branch by default, use --force to really delete them

### [2.3.0](../../../compare/2.2.2...2.3.0) - 2015-09-03

- [changelog.md](changelog.md) Add changelog
- [status.sh](status.md) Documentation for -show-detached parameter
- [deluntrackedbranch.sh](deluntrackedbranch.md) Add deluntrackedbranch.sh

### [2.2.2](../../../compare/2.2.1...2.2.2) - 2015-05-04

- Add composer.json

### [2.2.1](../../../compare/2.2.0...2.2.1) - 2015-05-04

- [rebase.sh](rebase.md) Add rebase.sh parameters to git push call (ex : rebase.sh -f will now call git push -f origin foo)
- [rebase.sh](rebase.md) Fix countEditedFiles calculation

### [2.2.0](../../../compare/2.1.0...2.2.0) - 2015-04-30

- [rebase.sh](rebase.md) Add rebase.sh, to rebase your branch from another branch. Ask you if you want to stash your changes before, and pop them after rebase.
- Add color to executed commands

### [2.1.0](../../../compare/2.0.1...2.1.0) - 2015-04-29

- [push.sh](push.md) Add push.sh, to push only current branch to origin.
- [status.sh](status.md) Add -show-detached parameter, to show or hide detached repositories.
- [status.sh](status.md) Add -max-depth parameter, to indicate at which depth status.sh will try to find git. repositories

### [2.0.1](../../../compare/2.0.0...2.0.1) - 2014-07-08

- [status.sh](status.md) Add -show-uptodate parameter, to show or hide repositories without changes (use it to see if status.sh find all your repositories for example).
- [status.sh](status.md) Fix find call, to find git repositories.

### [2.0.0](../../../compare/1.0.0...2.0.0) - 2014-06-23

- [status.sh](status.md) Rename gitstatus.sh to status.sh.
- [addtag.sh](addtag.md) Add addtag.sh, to add and push new tag.
- [deltag.sh](deltag.md) Add deltag.sh, to delete a git tag.

### 2.0.0- 2014-04-28

- [gitstatus.sh](status.md) Simple and colored format for git status, and try to find git repositories in sub directories (like vendor).


[Back to index](../README.md)
