#!/bin/bash
set -e

# Admin show controller

# AGENDA
# * Configure the show method in the admin controller to reveal admin
#   profile information only to admins

TOGGLE_OUTLINE=$1

echo '######################'
echo 'UNIT 10: ADMIN METHODS'
echo '######################'

echo '########################################'
echo 'Unit 10 Chapter 1: Admin Show Controller'
echo '########################################'

git checkout -b 10-01-admin_show_controller

ruby mod-10-01.rb

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
git commit -m "Add the show method for the admin controller"
git checkout master
git merge 10-01-admin_show_controller
