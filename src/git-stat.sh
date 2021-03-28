#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./functions/variables.sh
source ./functions/init.sh
source ./functions/logger.sh
source ./functions/commits-per-user.sh

function __main__ () {
    process_parameters $@
    check_git_repo $FOLDER
    log "GIT statisztika készítése $FOLDER mappáról"
    commits_per_user
    commits_per_user --no-merges
}

__main__ $@
