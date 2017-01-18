#!/bin/bash

set -e

function cleanup {
  # cannot use rake db:drop because environment entry is gone
  # https://github.com/DatabaseCleaner/database_cleaner/issues/445
  export PGPASSWORD=$POSTGRES_PASSWORD
  dropdb -h $POSTGRES_HOST -U $POSTGRES_USER $POSTGRES_DATABASE
}

export RAILS_ENV=test
export POSTGRES_DATABASE=$(pwgen -1 25)

env

echo "📦  Unpacking stuff from STDIN"
tar zxf -

echo "🚚  Start bundle install"
bundle install

echo "💻  Setup database"
bin/rails db:create
trap cleanup EXIT
bin/rails db:schema:load

echo "🛠  Running the tests"
xvfb-run -a bundle exec rspec --format documentation
