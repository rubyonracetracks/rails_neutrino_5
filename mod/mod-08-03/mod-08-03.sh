#!/bin/bash
set -e

# AGENDA
# * Allow admins to login.

TOGGLE_OUTLINE=$1

echo '#############################'
echo 'Unit 8 Chapter 3: Admin Login'
echo '#############################'

git checkout -b 08-03-admin_login

ruby mod-08-03.rb

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
git commit -m "Add admin login capability"
git checkout master
git merge 08-03-admin_login
