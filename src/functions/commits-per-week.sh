function commits_per_week () {
    if [ "$1" == "" ]; then
        log "Commits per week"
    else
        log "Commits per week without merge"
    fi
    start=$(git log --pretty=format:'%ai' | tail -1)
    start=$(date -d "$start" +'%Y-%m-%d')
    today=$(date +'%Y-%m-%d')
    i=1
    echo -e "week\t|\tstart date\t|\tcommit count"
    echo -e "----\t+\t----------\t+\t------------"
    while [[ "$start" < "$today" ]]; do
        count=`git rev-list $1 --count HEAD --since="$start" --before=$(date -I -d "$start + 7 day")`
        echo -e "#$i\t\t|\t$start\t|\t$count"
        i=$(( $i+1 ))
        start=$(date -I -d "$start + 7 day")
    done
}