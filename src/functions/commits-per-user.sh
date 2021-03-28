#!/bin/bash

function commits_per_user () {
    if [ "$1" == "" ]; then
        log "Commits per user"
    else
        log "Commits per user without merge"
    fi    
    git shortlog -sne $1
}