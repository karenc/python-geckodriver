#!/bin/bash

FIREFOX_VERSION='140.14.0esr'

amd64() {
    docker build --platform 'linux/amd64' --build-arg firefox_version=$FIREFOX_VERSION . -t karenc/python-geckodriver:linux-amd64
}

arm64() {
    docker build --platform 'linux/arm64' --build-arg firefox_version=$FIREFOX_VERSION . -t karenc/python-geckodriver:linux-aarch64
}

while [ -n "$1" ]
do
    if [ "$1" == 'arm64' ]
    then
        arm64
    elif [ "$1" == 'amd64' ]
    then
        amd64
    elif [ "$1" == 'all' ]
    then
        arm64
        amd64
    fi
    shift
done
