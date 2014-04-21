gitscripts
==========

Git scripts

gitstatus.sh
============

Scan all directories and subdirectories to find git repositories, and call git status

Parameters :

    -path=A,B,%pwd%/C
        List path where script will search repositories, seaprated by ","
        You can use %pwd% to replace it by the current path (example : you are at "/home/you/dev", you call "./../gitscripts/gitstatus.sh", %pwd% = "/home/you/dev")
        %pwd% by default (current path)

    -show-legend=[YES/no]
        Show git symbols legend (like [M] Modified, etc)