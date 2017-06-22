#!/bin/bash

# AGENDA
# * Allow admins to reset forgotten passwords

echo '######################################'
echo 'Unit 8 Chapter 5: Admin Password Reset'
echo '######################################'

git checkout -b 08-05-admin_password_reset

ruby mod-08-05.rb

sh outline-short.sh
git add .
git commit -m "Add admin password reset capability"
git checkout master
git merge 08-05-admin_password_reset
