#!/bin/bash

# AGENDA
# * Allow admins to login.

echo '#############################'
echo 'Unit 8 Chapter 3: Admin Login'
echo '#############################'

git checkout -b 08-03-admin_login

ruby mod-08-03.rb

sh outline-short.sh
git add .
git commit -m "Add admin login capability"
git checkout master
git merge 08-03-admin_login
