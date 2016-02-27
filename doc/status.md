status.sh
=========

status.sh allows you to execute git status on each repository under current directory.

Parameters
----------
```
-path=A,B,%pwd%/C
    List path where gitstatus.sh will search repositories, seaprated by ","
    You can use %pwd% to replace it by the current path.
    Example : you are at "/home/you/dev", you call "./../gitscripts/gitstatus.sh", %pwd% = "/home/you/dev")
    %pwd% by default (current path)

-show-legend=[YES/no]
    Show git symbols legend (like [M] Modified, etc)
    yes by default

-show-uptodate=[yes/NO]
    Show repositories without files to commit and commit to push
    Can be used to verify this script find all your repositories, for example
    no by default
    
-show-detached=[YES/no]
    Show detached repositories (yes) or not (no)
    yes by default
    
-max-depth=1000
    Descend at most X levels of directories
    1000 by default

-show-current-path-title=[YES/no]
    Show "Current path" title when current path has modified files
    yes by default
```

Example
-------
```
./status.sh
./status.sh -path=/foo
./status.sh -path=/foo,%pwd%/bar -show-legend=no
./status.sh -path=/foo,%pwd%/bar -show-legend=no -show-uptodate=yes
```

[Back to index](../README.md)
