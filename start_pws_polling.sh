#!/bin/bash

export PWS_CLIENT_PROJECT_PATH=`dirname $0`
source $PWS_CLIENT_PROJECT_PATH/pws_widget_params.sh

function logFn {
    echo `date +'%F %R %S'` - `basename $0` - $1
}

function startPollingScript {
    # Wait for connection to be ready
    while ! ping -c 1 google.fr > /dev/null 2>&1
    do
        logFn "no connection up"
        sleep 2
    done
    logFn "connection up"

    script_launch_cmd="python3 $PWS_CLIENT_PROJECT_PATH/fetch_widget_data.py"
    eval $script_launch_cmd
    
    if [ $? -eq 0 ]
    then
        logFn "wu polling script started - pid"
    else
        logFn "Error $? when launching polling script - exiting"
        exit 1
    fi
}

logFn "start pws data fetch"
startPollingScript
