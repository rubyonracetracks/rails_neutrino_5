#!/bin/bash

# Admin show view

# AGENDA
# * Display the admin profile web page

TOGGLE_OUTLINE=$1

echo '##################################'
echo 'Unit 10 Chapter 2: Admin Show View'
echo '##################################'

git checkout -b 10-02-admin_show_view

ruby mod-10-02.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the admin profile page"
git checkout master
git merge 10-02-admin_show_view
