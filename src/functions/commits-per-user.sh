#!/bin/bash

function commits_per_user () {
    if [ "$1" == "" ]; then
        log "Commits per user"
    else
        log "Commits per user without merge"
    fi
    RESULT=`git shortlog -sne $1 | sed -E 's/([0-9]+).*<(.*)>/\2\t\1/g'`
    declare -A stats
    while IFS= read -r line ; do 
        userstats=($line)
        if [ "${stats[${userstats[0]}]}" == "" ]; then
            stats[${userstats[0]}]=0
        fi
        stats[${userstats[0]}]=$(( ${stats[${userstats[0]}]} + ${userstats[1]} ))
    done <<< $RESULT

    for K in "${!stats[@]}"; do echo -e "${stats[$K]}\t\t$K"; done | sort -rn -k1
}