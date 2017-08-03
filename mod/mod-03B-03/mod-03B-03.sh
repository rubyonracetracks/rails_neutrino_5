#!/bin/bash

# Adding MailCatcher for simulating the email interactions

# AGENDA
# * Update config/environments/development.rb.
# * Add mailcatcher.sh.

# NOTE: MailCatcher is NOT added to the Gemfile, because it will likely
# conflict with other gems sooner or later.

echo '#############################'
echo 'Unit 3B Chapter 3: MailCatcher'
echo '#############################'

git checkout -b 03B-03-mailcatcher

ruby mod-03B-03.rb

git add .
git commit -m "Added outlining gems and scripts"
git checkout master
git merge 03B-03-mailcatcher
