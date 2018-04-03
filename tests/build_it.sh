#!/bin/bash
read -p "Enter Your node.js Version: " NODE_VERSION

set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "adain/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "adain/meteord:node-${NODE_VERSION}-base" adain/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "adain/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "adain/meteord:node-${NODE_VERSION}-onbuild" adain/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "adain/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "adain/meteord:node-${NODE_VERSION}-devbuild" adain/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "adain/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "adain/meteord:node-${NODE_VERSION}-binbuild" adain/meteord:binbuild
