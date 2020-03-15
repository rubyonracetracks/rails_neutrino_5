#!/bin/bash
set -e

# AGENDA
# * Add integration tests for allowing users to edit their parameters

TOGGLE_OUTLINE=$1

echo '###########################'
echo 'Unit 7 Chapter 3: User Edit'
echo '###########################'

git checkout -b 07-03-user_edit

ruby mod-07-03.rb

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
git commit -m "Add user registration edit capability"
git checkout master
git merge 07-03-user_edit
