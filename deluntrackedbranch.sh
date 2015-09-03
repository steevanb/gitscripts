#!/bin/bash

source "$(dirname $0)/functions.sh"

title "Fetch branches"

execCmd "git remote update origin --prune"

IFS="
"
title "Delete untracked branches"

remoteBranches=$(git branch --no-color --remotes)
remoteBranchesArray=($remoteBranches)

localBranches=$(git branch --no-color)
localBranchesArray=($localBranches)

for localBranchIndex in "${!localBranchesArray[@]}"; do
    deleteBranch=true
    localBranch=${localBranchesArray[localBranchIndex]:2}
    if [ "${localBranch:0:1}" == "*" ]; then
        continue
    fi

    for remoteBranchIndex in "${!remoteBranchesArray[@]}"; do
        remoteBranch=${remoteBranchesArray[remoteBranchIndex]:2}

        if [ "origin/$localBranch" == "$remoteBranch" ]; then
            deleteBranch=false
        fi
    done

    if [ $deleteBranch == true ]; then
        git branch -D "$localBranch"
    fi
done

echoOk
