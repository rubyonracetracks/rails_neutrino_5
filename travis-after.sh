#!/bin/bash

# This script is used in the Travis environment for testing the new app
# after it is created.

cd tmp1
bundle install --quiet
rails db:migrate && rails test
brakeman -Aq -w2 --no-pager
sandi_meter
bundle-audit update && bundle exec bundle-audit
rubocop -D
rails_best_practices .
gemsurance
