gitscripts
==========

Git scripts

gitstatus.sh
============

Scan all directories to find git repositories, and call git status

Parameters :

    -path=A,B,%pwd%/C
        List path where script will search repositories, seaprated by ","
        You can use %pwd% to replace it by the current path (example : you are at "/home/you/dev", you call "./../gitscripts/gitstatus.sh", %pwd% = "/home/you/dev")
        %pwd% by default (current path)

    -sub-dirs=[YES/no]
        Indicate if you want to scan sub dirs, when a repository has been found

    -path-errors=[YES/no]
        Indicate if you want to show an error when a directory defined by -path if not a valid directory
        
    -show-legen[YES/no]
        Show git symbols legend (like [ M] Modified, etc)

Example when you want to scan on a composer project :

    gitstatus -path=%pwd%,%pwd%/vendor/myVendors -sub-dirs=no

    
