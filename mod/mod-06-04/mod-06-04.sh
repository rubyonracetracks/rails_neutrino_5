#!/bin/bash

# AGENDA
# * Add admin model parameters.
# * Add admin model tests.
# * Edit the admin model to get the tests to pass.

echo '#########################################'
echo 'Unit 6 Chapter 4: Adding Admin Parameters'
echo '#########################################'

git checkout -b 06-04-admin-params

ruby mod-06-04.rb

if [ $TOGGLE_OUTLINE = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Added admin parameters"
git checkout master
git merge 06-04-admin-params
