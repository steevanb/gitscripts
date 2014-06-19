gitstatus.sh
============

gitstatus.sh allows you to execute git status on each repository under current directory.

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
```

[Back to index](../README.md)
