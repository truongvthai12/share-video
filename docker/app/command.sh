#!/bin/bash
# Remove a potentially pre-existing server.pid for Rails.
bundle exec rails db:prepare && bundle exec rails s -p 3000 -b 0.0.0.0