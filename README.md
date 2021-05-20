gitscripts
==========

[![version](https://img.shields.io/badge/version-2.7.0-green.svg)](https://github.com/steevanb/gitscripts/tree/2.7.0)
![Lines](https://img.shields.io/badge/code%20lines-665-green.svg)
![Total Downloads](https://poser.pugx.org/steevanb/gitscripts/downloads)

Some bash scripts to help you using git.

[Changelog](doc/changelog.md)

Available scripts
-----------------

[status.sh](doc/status.md) : search and call git status on each repositories under current directory (like vendor)

[addtag.sh](doc/addtag.md) : add a tag and push all tags

[deltag.sh](doc/deltag.md) : delete tags, and push only deleted tags

[push.sh](doc/push.md) : push only the current branch to origin

[rebase.sh](doc/rebase.md) : stash your changes if needed, fetch, rebase, and pop your changes if needed

[deluntrackedbranch.sh](doc/deluntrackedbranch.md) : delete local branches who are deleted on remote

[renamebranch.sh](doc/renamebranch.md) : rename local branch and push change to origin

[refresh.sh](doc/refresh.md) : pull the origin main branch and rebase from it on a target branch
