#!/usr/bin/env bash
IMAGE=registry.aibee.cn/aibee/qzhu/workspace-docker:0.1.0
docker build -t $IMAGE . &&
    docker push $IMAGE
