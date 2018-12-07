#!/bin/bash

# This chapter adds Capybara.

# AGENDA
# Add capybara-email and capybara-slow_finder_errors to the Gemfile
# Set up test/test_helper.rb for Capybara
# Add additional integration tests and make them pass

echo '##########################'
echo 'Unit 3 Chapter 3: Capybara'
echo '##########################'

git checkout -b 03-03-capybara

ruby mod-03-03.rb

git add .
git commit -m "Added Capybara"
git checkout master
git merge 03-03-capybara
