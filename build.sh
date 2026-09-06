#!/bin/bash

docker build --platform 'linux/amd64' -f Dockerfile.linux64 . -t karenc/python-geckodriver:linux64
docker build --platform 'linux/arm64' -f Dockerfile.linux-aarch64 . -t karenc/python-geckodriver:linux-aarch64
