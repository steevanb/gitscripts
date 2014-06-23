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
echo "$ git tag -a '${tag}' -m '${message}'"
git tag -a "$tag" -m "$message"
[ "$?" != "0" ] && cancelScript ""

title "Push all tags"
execCmd "git push --tags"

echo ""
echoOk