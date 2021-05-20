refresh.sh
=====================

refresh.sh pull changes from origin main branch and rebase this branch on another one (by default: current branch).

Parameters
----------

```
$mainBranch
    origin main branch name, ex main (by default)

$targetBranch
    branch on which get origin main branch last changes, ex develop (by default the current working branch) 
```

Examples
-------

```
# assume you are on branch "develop": will pull origin/main and rebase origin/main on develop branch
./refresh.sh
# assume you are on branch "feat/foo": will pull origin/develop and rebase origin/develop on feat/foo branch
./refresh.sh develop
# will pull origin/main and rebase origin/main on feat/foo branch
./refresh.sh main feat/foo
```

[Back to index](../README.md)
