#!/bin/bash

amd64() {
    docker push --platform 'linux/amd64' karenc/python-geckodriver:linux-amd64
}

arm64() {
    docker push --platform 'linux/arm64' karenc/python-geckodriver:linux-aarch64
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
