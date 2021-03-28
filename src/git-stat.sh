#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./functions/variables.sh
source ./functions/init.sh
source ./functions/logger.sh
source ./functions/commits-per-user.sh
source ./functions/commits-per-week.sh

function __main__ () {
    process_parameters $@
    check_git_repo $FOLDER
    log "GIT statistics about $REPO_NAME"
    echo
    commits_per_user
    echo
    commits_per_user --no-merges
    echo
    commits_per_week
    echo
    commits_per_week --no-merges
}

__main__ $@
