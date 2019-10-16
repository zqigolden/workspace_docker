#!/usr/bin/env bash
IMAGE=registry.aibee.cn/aibee/qzhu/workspace-docker:0.0.16
IMAGE=${IMAGE}-dev
docker build -t $IMAGE . && docker run --rm -it -w `echo $(pwd) | xargs realpath` -v /home:/home -v /ssd:/ssd -v /mnt:/mnt -v /opt/package/hadoop-2.6.5/etc/:/opt/package/hadoop-2.6.5/etc/ -v /dev/net/tun:/dev/net/tun --net=host --cap-add=NET_ADMIN $IMAGE $@
