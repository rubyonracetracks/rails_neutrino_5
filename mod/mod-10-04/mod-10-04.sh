#!/bin/bash
set -e

# AGENDA
# * Add the admin index view

TOGGLE_OUTLINE=$1

echo '###################################'
echo 'Unit 10 Chapter 4: Admin Index View'
echo '###################################'

git checkout -b 10-04-admin_index_view

ruby mod-10-04.rb

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
git commit -m "Add the admin index view"
git checkout master
git merge 10-04-admin_index_view
