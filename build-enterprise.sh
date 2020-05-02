#!/bin/bash
export DOCKER_USERNAME=corbsmartin
export MONGODB_PACKAGE=mongodb-enterprise
export MONGODB_REPO=repo.mongodb.com
export MONGODB_VERSION=4.2

curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGODB_VERSION/{Dockerfile,docker-entrypoint.sh}
chmod 755 ./docker-entrypoint.sh
docker build \
  --build-arg MONGO_PACKAGE=$MONGODB_PACKAGE \
  --build-arg MONGO_REPO=$MONGODB_REPO \
  -t $DOCKER_USERNAME/$MONGODB_PACKAGE:$MONGODB_VERSION .
