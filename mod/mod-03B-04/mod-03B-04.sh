#!/bin/bash

# Adding the better_errors and binding_of_caller gems

# AGENDA
# * Update the Gemfile.

# NOTE: MailCatcher is NOT added to the Gemfile, because it will likely
# conflict with other gems sooner or later.

echo '###############################'
echo 'Unit 3B Chapter 4: Better Errors'
echo '###############################'

git checkout -b 03B-04-better_errors

ruby mod-03B-04.rb

git add .
git commit -m "Added the better_errors and binding_of_caller gems"
git checkout master
git merge 03B-04-better_errors
