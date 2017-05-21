#!/bin/bash

# AGENDA
# * sqlite3 should be limited to the development and test environments.
# * Adding pg to the Gemfile
# * Grouping rails, pg, and nokogiri together in the Gemfile
# * Pinning gems


echo '##############################'
echo 'UNIT 2: PRODUCTION ENVIRONMENT'
echo '##############################'

echo '############################################################'
echo 'Unit 2 Chapter 1: Updating the Gemfile for Heroku Deployment'
echo '############################################################'

git checkout -b 02-01-heroku_gems

ruby mod-02-01.rb

echo '--------------'
echo 'bundle install'
bundle install

git add .
git commit -m "Updated the Gemfile"
git checkout master
git merge 02-01-heroku_gems
