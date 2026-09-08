#!/bin/bash

amd64() {
    docker build --platform 'linux/amd64' -f Dockerfile.linux-amd64 . -t karenc/python-geckodriver:linux-amd64
}

arm64() {
    docker build --platform 'linux/arm64' -f Dockerfile.linux-aarch64 . -t karenc/python-geckodriver:linux-aarch64
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
