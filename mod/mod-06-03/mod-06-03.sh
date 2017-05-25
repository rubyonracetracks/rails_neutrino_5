#!/bin/bash

# Providing scripts to generate outlines and block diagrams of the app

# AGENDA
# * Update config/environments/development.rb.
# * Add mailcatcher.sh.

# NOTE: MailCatcher is NOT added to the Gemfile, because it will likely
# conflict with other gems sooner or later.

echo '#############################'
echo 'Unit 6 Chapter 3: MailCatcher'
echo '#############################'

git checkout -b 06-03-mailcatcher

ruby mod-06-03.rb

git add .
git commit -m "Added outlining gems and scripts"
git checkout master
git merge 06-03-mailcatcher
