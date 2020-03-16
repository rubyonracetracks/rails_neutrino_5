#!/bin/bash
set -e

# User show controller

# AGENDA
# * Configure the show method in the user controller to reveal user
#   profile information only to that particular user and to the admins

TOGGLE_OUTLINE=$1

echo '####################'
echo 'UNIT 9: USER METHODS'
echo '####################'

echo '######################################'
echo 'Unit 9 Chapter 1: User Show Controller'
echo '######################################'

git checkout -b 09-01-user_show_controller

ruby mod-09-01.rb

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
git commit -m "Add the show method for the user controller"
git checkout master
git merge 09-01-user_show_controller
