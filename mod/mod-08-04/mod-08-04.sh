#!/bin/bash
set -e

# AGENDA
# * Add integration tests for allowing admins to edit their parameters

TOGGLE_OUTLINE=$1

echo '############################'
echo 'Unit 8 Chapter 4: Admin Edit'
echo '############################'

git checkout -b 08-04-admin_edit

ruby mod-08-04.rb

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
git commit -m "Add admin registration edit capability"
git checkout master
git merge 08-04-admin_edit
