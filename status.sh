#!/bin/bash

source "$(dirname $0)/functions.sh"

function realGitStatus() {
    title "$1"
    smallBlock "41" "$gitBranch"

    git status
}

function customGitStatus() {
    header="$gitBranch"

    # get files to commits
    allFiles="$(git status --porcelain)"

    # commits not pushed
    commitsToPush=$(git log origin/$gitBranch..$gitBranch)
    if [ "$commitsToPush" == "" ]; then
        header="$header - No push needed"
        blockColor=42
    else
        header="$header - Commits needs to be pushed"
        blockColor=43
    fi

    # nothing to commit / push, don't show this block
    if [ "$allFiles" == "" ] && [ "$commitsToPush" == "" ] && [ $showUpToDate == false ]; then
        return 0;
    fi

    # title
    if [ $1 == $root ]; then
        titleStr="Current path"
    elif [ ${1:0:$rootLength} == $root ]; then
        titleStr="${1:$rootLength+1}"
    else
        titleStr="$1"
    fi
    title "$titleStr"

    # header
    smallBlock "$blockColor" "$header"
    if [ $showLegend = true ]; then 
        echo -e "[A] Added [M] Modified [D] Deleted [R] Renamed [C] Copied [U] Updated but unmerged [??] Untracked [\033[32mstagged\033[00m] [\033[31mnot stagged\033[00m]"
    fi

    git status --porcelain|while read; do
        fileStatus=${REPLY:0:3}
        if [ "$fileStatus" = 'A  ' ] || [ "$fileStatus" = 'M  ' ] || [ "$fileStatus" = 'D  ' ] || [ "$fileStatus" = 'R  ' ] || [ "$fileStatus" = 'C  ' ] || [ "$fileStatus" = 'U  ' ]; then
            echo -e "\033[32m$REPLY\033[00m"
        elif [ "$fileStatus" = ' A ' ] || [ "$fileStatus" = ' M ' ] || [ "$fileStatus" = ' D ' ] || [ "$fileStatus" = ' R ' ] || [ "$fileStatus" = ' C ' ] || [ "$fileStatus" = ' U ' ] || [ "$fileStatus" = '?? ' ]; then
            echo -e "\033[31m$REPLY\033[00m"
        else
            echo -e "\033[33m$REPLY\033[00m"
        fi
    done
}

function gitStatus() {
    cd $1
    gitBranch=$(getGitBranch)

    if [ "${gitBranch:0:13}" = "detached from" ] || [ "${gitBranch:0:10}" = "détaché de" ]; then
        if [ $showDetached == true ]; then
            realGitStatus "$1"
        fi
    else
        customGitStatus "$1"
    fi
}

root=$(pwd)
rootLength=${#root}
paths=$root
showLegend=true
showUpToDate=false
showDetached=true

for param in $*; do
    # -path=[yes/no]
    if [ ${param:0:6} = '-path=' ]; then
        paramValue="${param:6}"
        paths="${paramValue//\%pwd\%/$root}"

    # -show-legend=[yes/no]
    elif [ $param = '-show-legend=no' ]; then
        showLegend=false

    # -show-uptodate=[yes/no]
    elif [ $param = '-show-uptodate=yes' ]; then
        showUpToDate=true

    # -show-detached=[yes/no]
    elif [ $param = '-show-detached=no' ]; then
        showDetached=false
    fi
done

arPath=$(echo $paths | tr "," "\n")
for path in $arPath; do
    find -L $path -type d -name .git|while read; do
        gitStatus "$(dirname $REPLY)"
    done
done