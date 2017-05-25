#!/bin/bash

# Providing scripts to generate outlines and block diagrams of the app

# AGENDA
# * Update config/environments/development.rb.
# * Add mailcatcher.sh.

# NOTE: MailCatcher is NOT added to the Gemfile, because it will likely
# conflict with other gems sooner or later.

echo '###############################'
echo 'Unit 6 Chapter 4: Better Errors'
echo '###############################'

git checkout -b 06-04-better_errors

ruby mod-06-04.rb

git add .
git commit -m "Added the better_errors and binding_of_caller gems"
git checkout master
git merge 06-04-better_errors