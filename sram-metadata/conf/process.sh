#!/bin/bash
set -e
while true
do
    echo "Starting..."
    for f in feeds/*
    do
        file=${f##*/}
        echo "Processing '${file}'"
        /root/.local/bin/pyff ${f}
    done

    for f in out/*
    do
        file=${f##*/}
        echo "Installing '${file}'"
        cp "${f}" "web/${file}"
        chmod 644 "web/${file}"
        mv "web/${file}" "web/${file%.new}"
    done
    sleep 5m
done

exit 0
