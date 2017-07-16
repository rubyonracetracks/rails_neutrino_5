#!/bin/bash

# AGENDA
# * Allow admins to login.

TOGGLE_OUTLINE=$1

echo '#############################'
echo 'Unit 8 Chapter 3: Admin Login'
echo '#############################'

git checkout -b 08-03-admin_login

ruby mod-08-03.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Add admin login capability"
git checkout master
git merge 08-03-admin_login
