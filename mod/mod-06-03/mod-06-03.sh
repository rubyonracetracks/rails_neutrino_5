#!/bin/bash
set -e

# AGENDA
# * Add user model parameters.
# * Add user model tests.
# * Edit the user model to get the tests to pass.
# * Add the faker and ruby-progressbar gems to the Gemfile

echo '########################################'
echo 'Unit 6 Chapter 3: Adding User Parameters'
echo '########################################'

git checkout -b 06-03-user-params

ruby mod-06-03.rb

# BEGIN: outlining
TOGGLE_OUTLINE=$1
if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  bundle exec annotate --routes
  bundle exec annotate
else
  echo 'Skipping the outlining process to save time'
fi
# END: outlining

git add .
git commit -m "Added user parameters"
git checkout master
git merge 06-03-user-params
