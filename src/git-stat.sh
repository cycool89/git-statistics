#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./functions/variables.sh
source ./functions/init.sh
source ./functions/logger.sh
source ./functions/commits-per-user.sh

function __main__ () {
    process_parameters $@
    check_git_repo $FOLDER
    log "GIT statistics about $FOLDER"
    echo
    commits_per_user
    echo
    commits_per_user --no-merges
    echo
}

__main__ $@
