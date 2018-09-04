#!/usr/bin/env bash

echo "🤖 🤖 🤖 🤖 🤖 DOCKER ENTRYPOINT 🤖 🤖 🤖 🤖 🤖"

clear logs and tmp
rm -Rf /app/tmp/
echo -n "" > /app/log/development.log
echo -n "" > /app/log/test.log

bundle install
bundle clean
yarn install

if ! [ -z "$RUN_BIN_SETUP" ]; then
  echo "▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ rebuilding databases STARTED ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇"
  rails db:drop db:crete db:migrate db:seed
  echo "▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ rebuilding databases COMPLETED ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇"
fi
rails s -p ${RAILS_PORT} -b 0.0.0.0

# sleep infinity
exec "$@" # Finally call command issued to the docker service (if any)
