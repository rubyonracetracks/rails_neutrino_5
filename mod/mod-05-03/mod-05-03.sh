#!/bin/bash

# AGENDA
# * Add user model parameters.
# * Add user model tests.
# * Edit the user model to get the tests to pass.

echo '########################################'
echo 'Unit 5 Chapter 3: Adding User Parameters'
echo '########################################'

git checkout -b 05-03-user-params

ruby mod-05-03.rb

git add .
git commit -m "Added user parameters"
git checkout master
git merge 05-03-user-params
