#!/bin/bash

source "$(dirname $0)/functions.sh"

forceDelete=false
for param in $*; do
    # --force
    if [ $param = '--force' ]; then
        forceDelete=true
    fi
done

title "Fetch branches"

execCmd "git remote update origin --prune"

IFS="
"

if [ $forceDelete == true ]; then
    title "Delete untracked branches"
else
    title "List untracked branches (use --force to delete them)"
fi
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
        if [ $forceDelete == true ]; then
            git branch -D "$localBranch"
        else
            echo -en "\033[31muntracked\033[00m $localBranch\n";
        fi
    fi
done

echoOk
