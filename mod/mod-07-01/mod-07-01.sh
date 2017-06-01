#!/bin/bash

# Allow the general public to sign up for a user account

# AGENDA
# * Add integration tests for new user registrations
# * Make the changes needed to allow the tests to pass

echo '###################################'
echo 'UNIT 7: USER AUTHENTICATION ACTIONS'
echo '###################################'

echo '#############################'
echo 'Unit 7 Chapter 1: User Signup'
echo '#############################'

git checkout -b 07-01-user_sign_up

ruby mod-07-01.rb

sh outline-short.sh
git add .
git commit -m "Add user sign-up capability"
git checkout master
git merge 07-01-user_sign_up
