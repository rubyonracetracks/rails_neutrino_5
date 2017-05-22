#!/bin/bash

# Add Bootstrap styling

# AGENDA
# * Add the bootstrap-sass gem to the Gemfile.
# * Add app/assets/stylesheets/custom.scss.

echo '###################################'
echo 'Unit 4 Chapter 4: Bootstrap Styling'
echo '###################################'

git checkout -b 04-04-bootstrap

ruby mod-04-04.rb

git add .
git commit -m "Added Bootstrap styling"
git checkout master
git merge 04-04-bootstrap
