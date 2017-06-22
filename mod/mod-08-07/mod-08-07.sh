#!/bin/bash

# AGENDA
# * Temporarily lock the accounts of admins who make too many incorrect logins
# * This protects your app from denial-of-service attacks.

echo '####################################'
echo 'Unit 8 Chapter 7: Lock Admin Account'
echo '####################################'

git checkout -b 08-07-admin_lock

ruby mod-08-07.rb

sh outline-short.sh
git add .
git commit -m "Implement admin account locking"
git checkout master
git merge 08-07-admin_lock
