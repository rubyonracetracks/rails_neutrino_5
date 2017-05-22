#!/bin/bash

# Create the static pages

# AGENDA
# * Add the email_munger gem
# * Create the home, about, and contact pages
# * Remove the original static pages and associated tests

echo '##############################'
echo 'Unit 4 Chapter 2: Static Pages'
echo '##############################'

git checkout -b 04-02-static_pages

ruby mod-04-02.rb

git add .
git commit -m "Created static pages"
git checkout master
git merge 04-02-static_pages
