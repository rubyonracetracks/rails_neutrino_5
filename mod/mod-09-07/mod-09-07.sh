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

if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the user delete view"
git checkout master
git merge 09-07-user_delete_view
