#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid
bundle exec rake db:create
bundle exec rake db:migrate
exec "$@"
