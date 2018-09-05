#!/usr/bin/env bash
DIR=$(dirname -- "$0")
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
if ! [ -z "$TALENT_PRODUCTION" ]; then # PRODUCTION
  cp -f docker-compose_prd.yml docker-compose.yml
  cp -f $DIR/Dockerfile.prd $DIR/talententdecker/Dockerfile.dev
else # DEVELOPMENT
  cp -f docker-compose_dev.yml docker-compose.yml
  cp -f $DIR/Dockerfile.dev $DIR/talententdecker/Dockerfile.dev
fi


