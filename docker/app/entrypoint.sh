#!/bin/bash

# Stops the execution of a script in case of error
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle check || bundle install
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"