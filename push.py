#!/bin/bash

docker push --platform 'linux/amd64' karenc/python-geckodriver:linux64
docker push --platform 'linux/arm64' karenc/python-geckodriver:linux-aarch64
