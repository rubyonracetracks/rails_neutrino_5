#!/bin/bash

# AGENDA
# * Allow confirmed users to login.
# * Allow users who signed up to confirm their registrations.

echo '############################'
echo 'Unit 7 Chapter 2: User Login'
echo '############################'

git checkout -b 07-02-user_login

ruby mod-07-02.rb

git add .
git commit -m "Add user login capability"
git checkout master
git merge 07-02-user_login
