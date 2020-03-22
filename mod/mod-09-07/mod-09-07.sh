#!/bin/bash
set -e

# AGENDA
# * Add the view for deleting users

TOGGLE_OUTLINE=$1

echo '##################################'
echo 'Unit 9 Chapter 7: User Delete View'
echo '##################################'

git checkout -b 09-07-user_delete_view

ruby mod-09-07.rb

# BEGIN: outlining
TOGGLE_OUTLINE=$1
if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  bash docker-annotate.sh
else
  echo 'Skipping the outlining process to save time'
fi
# END: outlining

git add .
git commit -m "Add the user delete view"
git checkout master
git merge 09-07-user_delete_view
