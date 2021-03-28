#!/bin/bash

function log_separator () {
    strlen=$1
    echo -n "|-"
    for (( i=1; i<=$strlen; i++ ))
    do
        echo -n "-"
    done
    echo "-|"
}

function log () {
    log_separator ${#1}
    echo "|" $1 "|"
    log_separator ${#1}
}
