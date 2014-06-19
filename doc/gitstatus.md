gitstatus.sh
============

gitstatus.sh allows you to execute git status on each repository under current directory.

Parameters
----------
´´´php
-path=A,B,%pwd%/C
    List path where gitstatus.sh will search repositories, seaprated by ","
    You can use %pwd% to replace it by the current path (example : you are at "/home/you/dev", you call "./../gitscripts/gitstatus.sh", %pwd% = "/home/you/dev")
    %pwd% by default (current path)

-show-legend=[YES/no]
    Show git symbols legend (like [M] Modified, etc)
    yes by default
´´´
