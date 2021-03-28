#!/bin/bash

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

    REPO_NAME=$(basename `git rev-parse --show-toplevel`)
}