rebase.sh
=========

rebase.sh rebase from another remote/branch.
If you have unstaged changes, il will ask you if you want to stash them, and pop them after the rebase.

Parameters
----------
```
$from
    server/branch, ex origin/develop (by default)

-stash=[ASK/yes/no]
    ask : if you have unstaged changes, it will ask you if you want to stash them, and pop them after the rebase (by default)
    yes : if you have unstaged changes, it will stash them, and pop them after the rebase
    no : if you have unstaged changes, it will not ask you to stash them
```

Example
-------
```
./rebase.sh origin/master
```

[Back to index](../README.md)
