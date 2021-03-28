#!/bin/bash
FOLDER=`pwd`

function process_parameters () {
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -f|--folder) FOLDER="$2"; shift ;;
            -o|--output) OUTPUT=$2 ;;
            *) echo "Unknown parameter passed: $1"; exit 1 ;;
        esac
        shift
    done
}

function check_git_repo () {
    cd $1
    git status &>/dev/null

    if [ $? != 0 ]; then
        echo "Given folder:" $1 "is NOT a GIT repo."
        exit 1
    fi
}

function log_separator () {
    strlen=$1
    echo -n "--"
    for (( i=1; i<=$strlen; i++ ))
    do
        echo -n "-"
    done
    echo "--"
}

function log () {
    log_separator ${#1}
    echo "|" $1 "|"
    log_separator ${#1}
}

function commits_per_user () {
    if [ "$1" == "" ]; then
        log "Commits per user"
    else
        log "Commits per user without merge"
    fi    
    git shortlog -sne $1 | cut -d " "
}

function __main__ () {
    process_parameters $@
    check_git_repo $FOLDER
    log "GIT statisztika készítése $FOLDER mappáról"
    commits_per_user
    commits_per_user --no-merges
}

__main__ $@
