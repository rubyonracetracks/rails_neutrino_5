#!/bin/bash
set -e

# Add scripts for creating new admins

# These scripts are needed, because the option of allowing members of the
# general public to sign up as admins is not viable.

# AGENDA
# * Add admin_create.rb and admin_create.sh

echo '####################################'
echo 'UNIT 8: ADMIN AUTHENTICATION ACTIONS'
echo '####################################'

echo '############################'
echo 'Unit 8 Chapter 1: New Admins'
echo '############################'

git checkout -b 08-01-new_admin

mv mod-08-01-admin_create.rb admin_create.rb
mv mod-08-01-admin_create.sh admin_create.sh

git add .
git commit -m "Added scripts for creating new admins"
git checkout master
git merge 08-01-new_admin
