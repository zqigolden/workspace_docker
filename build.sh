#!/usr/bin/env bash
IMAGE=registry.aibee.cn/aibee/qzhu/workspace-docker:0.0.4
docker build -t $IMAGE . &&
    docker tag registry.aibee.cn/aibee/qzhu/workspace-docker:0.0.4 registry.aibee.cn/aibee/qzhu/workspace-docker:latest && 
    docker push $IMAGE
