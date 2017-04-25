#!/bin/bash

# Starting the PostgreSQL server may not always be necessary,
# but it's better to include this step and not need it
# than to lack it when it's necessary.
sh pg-start.sh

echo '--------------'
echo 'bundle install'
bundle install

echo '----------------'
echo 'rails db:migrate'
rails db:migrate

echo '----------'
echo 'rails test'
rails test
