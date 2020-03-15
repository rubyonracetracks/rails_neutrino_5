#!/bin/bash
set -e

# AGENDA
# * Allow users to reset forgotten passwords

TOGGLE_OUTLINE=$1

echo '#####################################'
echo 'Unit 7 Chapter 4: User Password Reset'
echo '#####################################'

git checkout -b 07-04-user_password_reset

ruby mod-07-04.rb

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
git commit -m "Add user password reset capability"
git checkout master
git merge 07-04-user_password_reset
