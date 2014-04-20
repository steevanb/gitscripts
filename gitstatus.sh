#!/bin/bash

source "$(dirname $0)/functions.sh"

################################################################################

function gitStatus() {
    gitBranch=$(getGitBranch)
    header="$gitBranch"

    # get files to commits
    cd $1
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
    if [ "$allFiles" == "" ] && [ "$commitsToPush" == "" ]; then
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
    header="$header - [A ] Added stagged [M ] Modified and stagged [ M] Modified not stagged [AM] New [??] Untracked"
    smallBlock "$blockColor" "$header"

    # do not loop on each files, write all files at first loop, but i don't know how to write it better
    for file in "$allFiles"; do
        echo "$file"
    done
}

################################################################################

function searchGitRepos() {
    if [ ! -d "$1" ]; then
        if [ "$pathErrors" = true ]; then
            block 41 "$1 is not a valid directory"
        fi
        return 0
    fi

    cd "$1"
    
    # git repository
    gitFound=false
    if [ -d "$1/.git" ]; then
        gitStatus "$1"
        gitFound=true
    fi

    # search git repository in sub dirs
    if [ $searchGitReposSubDirs = true ] || [ $gitFound = false ]; then
        newPaths="$(ls -d */ 2>/dev/null)"
        for newPath in $newPaths; do
            searchGitRepos "$1/${newPath:0:-1}"
        done
    fi
}

################################################################################

root=$(pwd)
rootLength=${#root}
paths="$(pwd)"
pathErrors=true
searchGitReposSubDirs=true

for param in $*; do
    # -path=[yes/no]
    if [ ${param:0:6} = '-path=' ]; then
        paramValue="${param:6}"
        paths="$paths,${paramValue//\%pwd\%/$root}"

    # -path-errors=[yes/no]
    elif [ "$param" = "-path-errors=no" ]; then
        pathErrors=false

    # -sub-dirs=[yes/no]
    elif [ $param = '-sub-dirs=no' ]; then
        searchGitReposSubDirs=false
    fi
done

arPath=$(echo $paths | tr "," "\n")
for path in $arPath; do
    searchGitRepos "$path"
done