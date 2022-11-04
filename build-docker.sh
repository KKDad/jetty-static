#!/bin/sh
#
# Build comics-ui and push to the stapledon docker registry

set -e

BUILD_TAG=$1
if [ -z $BUILD_TAG ]; then
   echo "Build Tag is required"
   exit
fi

DOCKER_REGISTRY=registry.stapledon.local

pushd src
  docker build -f Dockerfile . --tag kkdad/jetty-static:$BUILD_TAG --platform linux/amd64
  docker tag kkdad/jetty-static:$BUILD_TAG $DOCKER_REGISTRY:5000/jetty-static:$BUILD_TAG
  docker push $DOCKER_REGISTRY:5000/jetty-static:$BUILD_TAG
popd
