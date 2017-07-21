#!/bin/bash

source "$(dirname $0)/functions.sh"

if [ $# == 0 ]; then
    cancelScript "You must pass tag name as first parameter."
fi

for tag in $*; do
    title "Delete tag $tag"
    execCmd "git tag -d $tag"
    execCmd "git push origin :refs/tags/$tag"
done

echoOk
