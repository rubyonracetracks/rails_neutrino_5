#!/bin/bash
set -e

# In this chapter, SimpleCov is added.

# AGENDA
# Add simplecov to the Gemfile
# Set up test/test_helper.rb for SimpleCov

echo '###########################'
echo 'Unit 3 Chapter 4: SimpleCov'
echo '###########################'

git checkout -b 03-04-simplecov

ruby mod-03-04.rb

git add .
git commit -m "Added SimpleCov"
git checkout master
git merge 03-04-simplecov
