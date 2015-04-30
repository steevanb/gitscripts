#!/bin/bash

source "$(dirname $0)/functions.sh"

if [ $# == 0 ]; then
    cancelScript "You must pass tag name as first parameter."
fi

tag=$1
if [ $# == 1 ]; then
    message=$1
else
    message=$2
fi

title "Create tag $tag"
execCmd "git tag -a ${tag} -m ${message}"
execCmd "git push --tags"

echoOk