#!/bin/bash

# User show view

# AGENDA
# * Display the user profile web page

TOGGLE_OUTLINE=$1

echo '################################'
echo 'Unit 9 Chapter 2: User Show View'
echo '################################'

git checkout -b 09-02-user_show_view

ruby mod-09-02.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add the user profile page"
git checkout master
git merge 09-02-user_show_view
