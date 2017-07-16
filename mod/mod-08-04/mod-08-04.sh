#!/bin/bash

# AGENDA
# * Add integration tests for allowing admins to edit their parameters

TOGGLE_OUTLINE=$1

echo '############################'
echo 'Unit 8 Chapter 4: Admin Edit'
echo '############################'

git checkout -b 08-04-admin_edit

ruby mod-08-04.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add admin registration edit capability"
git checkout master
git merge 08-04-admin_edit
