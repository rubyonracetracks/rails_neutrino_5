#!/bin/bash

# AGENDA
# * sqlite3 should be limited to the development and test environments.
# * Adding pg to the Gemfile
# * Grouping rails, pg, and nokogiri together in the Gemfile
# * Pinning gems

# NOTES
# * In the Gemfile, the pg gem MUST be specified for the production environment.
# * In the Gemfile, the sqlite3 gem must NOT be specified for the production environment. 
#   (You may use it in the development and testing environments.)

echo '##############################'
echo 'UNIT 2: PRODUCTION ENVIRONMENT'
echo '##############################'

echo '############################################################'
echo 'Unit 2 Chapter 1: Updating the Gemfile for Heroku Deployment'
echo '############################################################'

git checkout -b 02-01-heroku_gems

ruby mod-02-01.rb

git add .
git commit -m "Updated the Gemfile"
git checkout master
git merge 02-01-heroku_gems
