#!/bin/bash

################################################################################

function block() {
    titleLength=${#2}
    echo -en "\n\033[$1m\033[1;37m    "
    for x in $(seq 1 $titleLength); do echo -en " "; done ;
    echo -en "\033[0m\n"

    echo -en "\033[$1m\033[1;37m  $2  \033[0m\n"
    echo -en "\033[$1m\033[1;37m    "
    for x in $(seq 1 $titleLength); do echo -en " "; done ;
    echo -en "\033[0m\n\n"
}

################################################################################

function echoOk() {
    echo -e "[\033[32m OK \033[00m]";
}

################################################################################

function execCmd() {
    echo "$ $1";
    execCmdNoEcho "$1" "$2"
}

################################################################################

function execCmdNoEcho() {
    $1
    [ "$?" != "0" ] && cancelScript "$2"
}

################################################################################

function smallBlock() {
    titleLength=${#2}
    echo -en "\033[$1m\033[1;37m  $2  \033[0m\n"
}

################################################################################

function title() {
    block 46 "$1"
}

################################################################################

function getGitBranch() {
    echo "$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/(//g' -e 's/)//g')"
}

################################################################################

function cancelScript() {
    if [ "$1" = "" ]; then
        message="Script canceled, error occured."
    else
        message=$1
    fi
    echo -en "\n\n"
    block 41 "$message"
    exit 1
}