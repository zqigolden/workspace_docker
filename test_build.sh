#!/usr/bin/env bash
IMAGE=registry.aibee.cn/aibee/qzhu/workspace-docker:0.1.0
IMAGE=${IMAGE}-dev
docker build -t $IMAGE . && docker run --rm -it -w `echo $(pwd) | xargs realpath` -v /home:/home -v /ssd:/ssd $IMAGE $@
