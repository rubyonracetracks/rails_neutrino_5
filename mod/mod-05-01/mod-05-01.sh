#!/bin/bash

# Install and set up the Devise gem.

# AGENDA
# * Add the devise gem to the Gemfile.
# * Create the config/initializers/devise.rb and config/locales/devise.en.yml files.
# * Change the email address in config/initializers/devise.rb to somebody@rubyonracetracks.com

echo '########################################'
echo 'UNIT 5: USER/ADMIN AUTHENTICATION MODELS'
echo '########################################'

echo '########################'
echo 'Unit 5 Chapter 1: Devise'
echo '########################'

git checkout -b 05-01-devise

ruby mod-05-01.rb

git add .
git commit -m "Added and configured Devise"
git checkout master
git merge 05-01-devise
