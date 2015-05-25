master
------

- [[changelog.md](changelog.md)] Add changelog
- [[status.sh](status.md)] Documentation for -show-detached parameter

2.2.2 (04/05/2015)
------------------

- [composer.json] Add composer.json

2.2.1 (04/05/2015)
------------------

- [[rebase.sh](rebase.md)] Add rebase.sh parameters to git push call (ex : rebase.sh -f will now call git push -f origin foo)
- [[rebase.sh](rebase.md)] Fix countEditedFiles calculation

2.2.0 (30/04/2015)
------------------

- [[rebase.sh](rebase.md)] Add rebase.sh, to rebase your branch from another branch. Ask you if you want to stash your changes before, and pop them after rebase.
- Add color to executed commands

2.1.0 (29/04/2015)
------------------

- [[push.sh](push.md)] Add push.sh, to push only current branch to origin.
- [[status.sh](status.md)] Add -show-detached parameter, to show or hide detached repositories.
- [[status.sh](status.md)] Add -max-depth parameter, to indicate at which depth status.sh will try to find git. repositories

2.0.1 (08/07/2014)
------------------

- [[status.sh](status.md)] Add -show-uptodate parameter, to show or hide repositories without changes (use it to see if status.sh find all your repositories for example).
- [[status.sh](status.md)] Fix find call, to find git repositories.

2.0.0 (23/06/2014)
------------------

- [[status.sh](status.md)] Rename gitstatus.sh to status.sh.
- [[addtag.sh](addtag.md)] Add addtag.sh, to add and push new tag.
- [[deltag.sh](deltag.md)] Add deltag.sh, to delete a git tag.

1.0.0 (28/04/2014)
------------------

- [[gitstatus.sh](status.md)] Simple and colored format for git status, and try to find git repositories in sub directories (like vendor).
