#!/bin/bash
set -e

# Adding MailCatcher for simulating the email interactions

# AGENDA
# * Update config/environments/development.rb.
# * Add mailcatcher.sh.

# NOTE: MailCatcher is NOT added to the Gemfile, because it will likely
# conflict with other gems sooner or later.

echo '#############################'
echo 'Unit 4 Chapter 3: MailCatcher'
echo '#############################'

git checkout -b 04-03-mailcatcher

ruby mod-04-03.rb

git add .
git commit -m "Added MailCatcher"
git checkout master
git merge 04-03-mailcatcher
