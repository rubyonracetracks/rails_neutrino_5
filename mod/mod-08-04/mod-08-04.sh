#!/bin/bash

# AGENDA
# * Add integration tests for allowing admins to edit their parameters

echo '############################'
echo 'Unit 8 Chapter 4: Admin Edit'
echo '############################'

git checkout -b 08-04-admin_edit

ruby mod-08-04.rb

sh outline-short.sh
git add .
git commit -m "Add admin registration edit capability"
git checkout master
git merge 08-04-admin_edit
