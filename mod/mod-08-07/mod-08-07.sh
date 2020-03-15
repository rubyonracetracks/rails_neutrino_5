#!/bin/bash
set -e

# AGENDA
# * Temporarily lock the accounts of admins who make too many incorrect logins
# * This protects your app from denial-of-service attacks.

TOGGLE_OUTLINE=$1

echo '####################################'
echo 'Unit 8 Chapter 7: Lock Admin Account'
echo '####################################'

git checkout -b 08-07-admin_lock

ruby mod-08-07.rb

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
git commit -m "Implement admin account locking"
git checkout master
git merge 08-07-admin_lock
