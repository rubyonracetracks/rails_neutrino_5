#!/bin/bash

# Create the static page views

# AGENDA
# * Create integration tests for the static pages.
# * Create the home, about, and contact page views.
# * Add the email_munger gem.
# * Remove the original static pages and associated tests.

echo '###################################'
echo 'Unit 4 Chapter 3: Static Page Views'
echo '###################################'

git checkout -b 04-03-static_page_views

ruby mod-04-03.rb

git add .
git commit -m "Created static page views"
git checkout master
git merge 04-03-static_page_views
