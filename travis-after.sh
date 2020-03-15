#!/bin/bash
set -e

# This script is used in the Travis environment for testing the new app
# after it is created.

cd tmp1
bundle install --quiet
rails db:migrate

echo '----------'
echo 'rails test'
rails test

echo '---------------------------'
echo 'brakeman -Aq -w2 --no-pager'
brakeman -Aq -w2 --no-pager

echo '-----------'
echo 'sandi_meter'
sandi_meter

echo '-------------------'
echo 'bundle-audit update'
bundle-audit update

echo '------------'
echo 'bundle-audit'
bundle-audit

echo '----------'
echo 'rubocop -D'
rubocop -D

echo '----------------------'
echo 'rails_best_practices .'
rails_best_practices .

echo '----------'
echo 'gemsurance'
gemsurance
