#!/usr/bin/env bash
IMAGE=registry.aibee.cn/aibee/qzhu/workspace-docker:0.0.12
docker build -t $IMAGE . &&
    docker push $IMAGE
