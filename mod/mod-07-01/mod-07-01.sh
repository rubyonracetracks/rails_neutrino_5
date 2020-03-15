#!/bin/bash
set -e

# Allow the general public to sign up for a user account

# AGENDA
# * Add integration tests for new user registrations
# * Make the changes needed to allow the tests to pass

TOGGLE_OUTLINE=$1

echo '###################################'
echo 'UNIT 7: USER AUTHENTICATION ACTIONS'
echo '###################################'

echo '#############################'
echo 'Unit 7 Chapter 1: User Signup'
echo '#############################'

git checkout -b 07-01-user_sign_up

ruby mod-07-01.rb

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
git commit -m "Add user sign-up capability"
git checkout master
git merge 07-01-user_sign_up
