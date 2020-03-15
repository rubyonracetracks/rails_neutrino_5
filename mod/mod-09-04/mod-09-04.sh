#!/bin/bash
set -e

# AGENDA
# * Add the user index view

TOGGLE_OUTLINE=$1

echo '#################################'
echo 'Unit 9 Chapter 4: User Index View'
echo '#################################'

git checkout -b 09-04-user_index_view

ruby mod-09-04.rb

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
git commit -m "Add the user index view"
git checkout master
git merge 09-04-user_index_view
