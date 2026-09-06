#!/bin/bash

docker build -f Dockerfile.linux64 . -t karenc/python-geckodriver:linux64
docker build -f Dockerfile.linux-aarch64 . -t karenc/python-geckodriver:linux-aarch64
