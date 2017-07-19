#!/bin/bash

# AGENDA
# * Add the delete method in the user controller

TOGGLE_OUTLINE=$1

echo '########################################'
echo 'Unit 9 Chapter 6: User Delete Controller'
echo '########################################'

git checkout -b 09-06-user_delete_controller

ruby mod-09-06.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the user delete controller"
git checkout master
git merge 09-06-user_delete_controller
