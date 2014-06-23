#!/bin/bash

source "$(dirname $0)/functions.sh"

if [ $# == 0 ]; then
    cancelScript "You must pass tag name as first parameter."
fi

tag=$1

title "Delete tag $tag"
execCmd "git tag -d $tag"

title "Push deleted tag"
execCmd "git push origin :refs/tags/$tag"

echo ""
echoOk