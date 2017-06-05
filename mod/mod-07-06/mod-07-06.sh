#!/bin/bash

# AGENDA
# * Temporarily lock the accounts of users who make too many incorrect logins
# * This protects your app from denial-of-service attacks.

echo '###################################'
echo 'Unit 7 Chapter 6: Lock User Account'
echo '###################################'

git checkout -b 07-06-user_lock

ruby mod-07-06.rb

sh outline-short.sh
git add .
git commit -m "Implement user account locking"
git checkout master
git merge 07-06-user_lock
