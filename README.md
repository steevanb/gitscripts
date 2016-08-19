gitscripts
==========

[![version](https://img.shields.io/badge/version-2.6.1-green.svg)](https://github.com/steevanb/gitscripts/tree/2.6.1)
![Total Downloads](https://poser.pugx.org/steevanb/gitscripts/downloads)

Some bash scripts to help you using git.

[Changelog](doc/changelog.md)

Available scripts
-----------------

[status.sh](doc/status.md) : search and call git status on each repositories under current directory (like vendor)

[addtag.sh](doc/addtag.md) : add a tag and push all tags

[deltag.sh](doc/deltag.md) : delete a tag, and push only deleted tag

[push.sh](doc/push.md) : push only the current branch to origin

[rebase.sh](doc/rebase.md) : stash your changes if needed, fetch, rebase, and pop your changes if needed

[deluntrackedbranch.sh](doc/deluntrackedbranch.md) : delete local branches who are deleted on remote

[renamebranch.sh](doc/renamebranch.md) : rename local branch and push change to origin
