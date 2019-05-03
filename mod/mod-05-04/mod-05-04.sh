#!/bin/bash
set -e

# Add Bootstrap styling

# AGENDA
# * Add the bootstrap-sass gem to the Gemfile.
# * Add app/assets/stylesheets/custom.scss.

echo '###################################'
echo 'Unit 5 Chapter 4: Bootstrap Styling'
echo '###################################'

git checkout -b 05-04-bootstrap

ruby mod-05-04.rb

git add .
git commit -m "Added Bootstrap styling"
git checkout master
git merge 05-04-bootstrap
