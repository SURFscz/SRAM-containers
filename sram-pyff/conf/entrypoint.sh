#!/bin/bash

# Do things we need to do before running CMD
if [ $UID -ne 0 ]
then
    echo "This container need to run as root"
    echo "Use USER/GROUP environment variables to specify the uid/gid to run as"

    exit 1
fi

# now we can drop privileges
PRIVDROP=
if [ -n "$USER" ]
then
    if [ -n "$GROUP" ]
    then
        echo "Switching to user $USER and group $GROUP"
        PRIVDROP="setpriv --reuid=$USER --regid=$GROUP --clear-groups"
    else
        echo "Switching to user $USER"
        PRIVDROP="setpriv --reuid=$USER"
    fi
    echo "New id is $($PRIVDROP id -u):$($PRIVDROP id -g)"
fi

# set time to sleep between runs
SLEEP_TIME=${SLEEP_TIME:-60m}
export SLEEP_TIME

# Hand off to the CMD
exec ${PRIVDROP} "$@"
