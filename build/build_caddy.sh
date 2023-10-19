#!/bin/bash


. .env

echo "docker build --build-arg CADDY_VERSION=$CADDY_VERSION -t ${IMAGE_NAME}:$TAG"
docker build --build-arg CADDY_VERSION=$CADDY_VERSION -t ${IMAGE_NAME}:$TAG  .


