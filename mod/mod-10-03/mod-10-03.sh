#!/bin/bash
set -e

# AGENDA
# * Add the admin index controller

TOGGLE_OUTLINE=$1

echo '#########################################'
echo 'Unit 10 Chapter 3: Admin Index Controller'
echo '#########################################'

git checkout -b 10-03-admin_index_controller

ruby mod-10-03.rb

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
git commit -m "Add the admin index controller"
git checkout master
git merge 10-03-admin_index_controller
