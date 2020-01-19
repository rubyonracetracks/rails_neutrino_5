#!/bin/bash
set -e

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

echo 'Adding bin/dcop'
mv mod-01-03-bin-dcop bin/dcop

ruby mod-01-03.rb

git add .
git commit -m "Added RuboCop"
git checkout master
git merge 01-03-rubocop
