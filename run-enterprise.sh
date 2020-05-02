#!/bin/bash
export DOCKER_USERNAME=corbsmartin
export MONGODB_PACKAGE=mongodb-enterprise
export MONGODB_VERSION=4.2
export MONGODB_DATA_DIR=$HOME/docker-mounts/mongodb/m0
export MONGODB_PORT=27017
export MONGODB_EXPOSED_PORT=27017
source .creds
# create a spot for each mongod instance's data files
mkdir -p $MONGODB_DATA_DIR
# mount as a volume inside the container
docker run --name m0 -p $MONGODB_EXPOSED_PORT:$MONGODB_PORT \
  -e MONGO_INITDB_ROOT_USERNAME=$USERNAME \
  -e MONGO_INITDB_ROOT_PASSWORD=$PASSWORD \
  -v $MONGODB_DATA_DIR:/data/db \
  -itd $DOCKER_USERNAME/$MONGODB_PACKAGE:$MONGODB_VERSION
