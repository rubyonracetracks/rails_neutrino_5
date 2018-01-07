#!/bin/bash

# AGENDA
# * Add the delete method in the admin controller

TOGGLE_OUTLINE=$1

echo '##########################################'
echo 'Unit 10 Chapter 5: Admin Delete Controller'
echo '##########################################'

git checkout -b 10-05-admin_delete_controller

ruby mod-10-05.rb

if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the admin delete controller"
git checkout master
git merge 10-05-admin_delete_controller
