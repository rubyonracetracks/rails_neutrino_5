#!/bin/bash
set -e

# AGENDA
# * Add the user index controller

TOGGLE_OUTLINE=$1

echo '#######################################'
echo 'Unit 9 Chapter 3: User Index Controller'
echo '#######################################'

git checkout -b 09-03-user_index_controller

ruby mod-09-03.rb

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
git commit -m "Add the user index controller"
git checkout master
git merge 09-03-user_index_controller
