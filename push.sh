#!/bin/bash

source "$(dirname $0)/functions.sh"

gitBranch="$(getGitBranch)"
if [ "$gitBranch" == "" ]; then
    cancelScript "Branch can't be found. Maybe you are not in a dir associated to a git repository ?"
fi

title "Push branch $gitBranch to origin"
if [ "$*" == "" ]; then
    parameters=""
else
    parameters=" $*"
fi
execCmd "git push$parameters origin $gitBranch"

echoOk