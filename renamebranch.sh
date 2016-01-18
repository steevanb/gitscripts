#!/bin/bash

source "$(dirname $0)/functions.sh"

currentBranch=$(getGitBranch)
newBranch=$1
if [ "$newBranch" == "" ]; then
    cancelScript "You must specify new branch name as first argument."
fi

if [ "$currentBranch" == "master" ] || [ "$currentBranch" == "develop" ]; then
    cancelScript "You can't rename develop or master. Do it manually if you need."
fi

title "Rename $currentBranch to $newBranch"

execCmd "git branch -m $currentBranch $newBranch"

execCmd "git push origin :$currentBranch"

execCmd "git push origin $newBranch:refs/heads/$newBranch"

echoOk
