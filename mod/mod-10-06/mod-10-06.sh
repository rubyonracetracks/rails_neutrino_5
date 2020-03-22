#!/bin/bash
set -e

# AGENDA
# * Add the view for deleting admins

TOGGLE_OUTLINE=$1

echo '####################################'
echo 'Unit 10 Chapter 6: Admin Delete View'
echo '####################################'

git checkout -b 10-06-admin_delete_view

ruby mod-10-06.rb

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
git commit -m "Add the admin delete view"
git checkout master
git merge 10-06-admin_delete_view
