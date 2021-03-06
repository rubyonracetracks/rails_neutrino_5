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

echo '----------------------'
echo 'rails db:migrate:reset'
rails db:migrate:reset

echo '-------------'
echo 'rails db:seed'
rails db:seed

echo '-----------------------------------------'
echo 'bundle exec annotate -r --models -a -k -i'
bundle exec annotate -r --models -a -k -i

echo '----------'
echo 'rubocop -D'
rubocop -D

echo '----------------------'
echo 'rails_best_practices .'
rails_best_practices .
