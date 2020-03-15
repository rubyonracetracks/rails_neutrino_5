#!/bin/bash
set -e

# AGENDA
# * Allow confirmed users to login.
# * Allow users who signed up to confirm their registrations.

TOGGLE_OUTLINE=$1

echo '############################'
echo 'Unit 7 Chapter 2: User Login'
echo '############################'

git checkout -b 07-02-user_login

ruby mod-07-02.rb

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
git commit -m "Add user login capability"
git checkout master
git merge 07-02-user_login
