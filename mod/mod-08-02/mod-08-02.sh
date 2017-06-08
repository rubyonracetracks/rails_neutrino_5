#!/bin/bash

# Prevent the general public from signing up for an admin account

# AGENDA
# * Add integration tests for new admin registrations
# * Make the changes needed to allow the tests to pass

echo '##############################'
echo 'Unit 8 Chapter 2: Admin Signup'
echo '##############################'

git checkout -b 08-02-admin_sign_up

ruby mod-08-02.rb

sh outline-short.sh
git add .
git commit -m "Prevented the general public from signing up as admins"
git checkout master
git merge 08-02-admin_sign_up
