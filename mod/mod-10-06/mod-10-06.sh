#!/bin/bash

# AGENDA
# * Add the view for deleting admins

TOGGLE_OUTLINE=$1

echo '####################################'
echo 'Unit 10 Chapter 6: Admin Delete View'
echo '####################################'

git checkout -b 10-06-admin_delete_view

ruby mod-10-06.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the admin delete view"
git checkout master
git merge 10-06-admin_delete_view
