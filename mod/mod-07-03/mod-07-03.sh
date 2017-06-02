#!/bin/bash

# AGENDA
# * Add integration tests for allowing users to edit their parameters
# * 

echo '###########################'
echo 'Unit 7 Chapter 3: User Edit'
echo '###########################'

git checkout -b 07-03-user_edit

ruby mod-07-03.rb

sh outline-short.sh
git add .
git commit -m "Add user registration edit capability"
git checkout master
git merge 07-03-user_edit
