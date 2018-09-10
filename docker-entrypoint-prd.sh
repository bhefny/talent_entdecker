#!/usr/bin/env bash

echo "🤖 🤖 🤖 🤖 🤖 DOCKER ENTRYPOINT 🤖 🤖 🤖 🤖 🤖"

yarn install
bundle install --without="development test"
rake assets:precompile RAILS_ENV=production

if ! [ -z "$RUN_BIN_SETUP" ]; then
  echo "▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ rebuilding databases STARTED ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇"
  rails db:drop db:create db:migrate db:seed
  echo "▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ rebuilding databases COMPLETED ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇"
fi
rails db:migrate

rails s -p ${RAILS_PORT} -b 0.0.0.0

# sleep infinity
exec "$@" # Finally call command issued to the docker service (if any)
