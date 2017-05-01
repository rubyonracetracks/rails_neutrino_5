#!/bin/bash

# AGENDA
# * Add .rubocop.yml
# * Add RuboCop
# * Comply with RuboCop

echo '#########################'
echo 'Unit 1 Chapter 3: RuboCop'
echo '#########################'

git checkout -b 01-03-rubocop

echo 'Adding .rubocop.yml'
mv mod-01-03-rubocop_yml.txt .rubocop.yml

ruby mod-01-03.rb

echo '----------------------'
echo 'bundle install --quiet'
bundle install --quiet

echo '----------------'
echo 'rails db:migrate'
rails db:migrate

git add .
git commit -m "Added RuboCop"
git checkout master
git merge 01-03-rubocop
