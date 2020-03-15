#!/bin/bash
set -e

# AGENDA
# * Allow admins to reset forgotten passwords

TOGGLE_OUTLINE=$1

echo '######################################'
echo 'Unit 8 Chapter 5: Admin Password Reset'
echo '######################################'

git checkout -b 08-05-admin_password_reset

ruby mod-08-05.rb

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
git commit -m "Add admin password reset capability"
git checkout master
git merge 08-05-admin_password_reset
