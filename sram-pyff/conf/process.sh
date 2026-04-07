#!/bin/bash
set -e

# Ignore setuptools pkg_resources deprecation warning
# There's nothing we can do about it
# https://github.com/IdentityPython/pyFF/issues/306
# https://setuptools.pypa.io/en/stable/history.html#v82-0-0
export PYTHONWARNINGS=ignore

# allow * to expand to an empty string
shopt -s nullglob

# correct working dir
cd /opt/pyff

if [ -z "$SLEEP_TIME" ]
then
    echo "SLEEP_TIME not set, exiting"
    exit 1
fi

# clean up any leftover files from a previous run
rm -f out/*

while true
do
    echo "Starting..."
    for feed in feeds/*
    do
        echo "Processing '${feed}'"
        pyff "${feed}"
    done


    for f in out/*
    do
        file=${f##out/}
        echo "Installing '${file}'"
        cp "out/${file}" "web/${file}"
        chmod 644 "web/${file}"
        mv "web/${file}" "web/${file%.new}"
    done
    echo "Done, sleeping for ${SLEEP_TIME}"
    sleep "${SLEEP_TIME}"
done

exit 0
