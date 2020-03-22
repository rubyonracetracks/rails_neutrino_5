#!/bin/bash
set -e

# Prevent the general public from signing up for an admin account

# AGENDA
# * Add integration tests for new admin registrations
# * Make the changes needed to allow the tests to pass

TOGGLE_OUTLINE=$1

echo '##############################'
echo 'Unit 8 Chapter 2: Admin Signup'
echo '##############################'

git checkout -b 08-02-admin_sign_up

ruby mod-08-02.rb

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
git commit -m "Prevented the general public from signing up as admins"
git checkout master
git merge 08-02-admin_sign_up
