#!/bin/bash

source "$(dirname $0)/functions.sh"

mainBranch="${1:-main}"
workingBranch="${2:-$(getGitBranch)}"

title "Go to branch $mainBranch and pull origin"

execCmd "git checkout $mainBranch"
execCmd "git pull origin $mainBranch"

title "Go back to $workingBranch"

execCmd "git checkout $workingBranch"

title "Get origin $mainBranch changes"

execCmd "git rebase -p origin/$mainBranch"

echoOk
