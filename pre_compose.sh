#!/usr/bin/env bash
DIR=$(dirname -- "$0")
if ! [ -z "$TALENT_PRODUCTION" ]; then # PRODUCTION
  ln -sf ./docker-compose_prd.yml docker-compose.yml
  cp -f $DIR/Dockerfile.prd $DIR/talententdecker/Dockerfile.dev
else # DEVELOPMENT
  ln -sf ./docker-compose_dev.yml docker-compose.yml
  cp -f $DIR/Dockerfile.dev $DIR/talententdecker/Dockerfile.dev
fi


