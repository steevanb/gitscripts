#!/bin/bash

source "$(dirname $0)/functions.sh"

stash="ask"
rebaseFrom="origin/develop"
for param in $*; do
    # -stash=[ask/yes/no]
    if [ ${param:0:7} == '-stash=' ]; then
        stash="${param:7}"

    # remote/branch
    else
        rebaseFrom=$param
    fi
done

title "Rebase from $rebaseFrom"

gitBranch="$(getGitBranch)"
if [ "$gitBranch" == "" ]; then
    cancelScript "Directory does not appear to be a git repository."
fi

editedFiles="$(git status --porcelain)"
if [ "$editedFiles" == "" ]; then
    countEditedFiles=0
else
    countEditedFiles="${#editedFiles[@]}"
fi

if [ "$stash" == "ask" ] && [ "$countEditedFiles" -gt "0" ]; then
    bash "$(dirname $0)/status.sh" -show-current-path-title=no -max-depth=1
    echo ""
    ask "Repository contains unstaged changes. Do you want to stash them ? (Y/n)"
    read readStash
    if [ "$readStash" == "" ] || [ "$readStash" == "y" ] || [ "$readStash" == "Y" ]; then
        stash="yes"
    fi
    echo ""
fi
if [ "$countEditedFiles" -gt "0" ] && [ "$stash" == "yes" ]; then
    execCmd "git stash"
fi

execCmd "git fetch"
execCmd "git rebase --rebase-merges $rebaseFrom"

if [ "$countEditedFiles" -gt "0" ] && [ "$stash" == "yes" ]; then
    execCmd "git stash pop"
fi

echoOk
