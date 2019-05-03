#!/bin/bash
set -e

# Create the static page views

# AGENDA
# * Create integration tests for the static pages.
# * Create the home, about, and contact page views.
# * Add the email_munger gem.
# * Remove the original static pages and associated tests.

echo '###################################'
echo 'Unit 5 Chapter 3: Static Page Views'
echo '###################################'

git checkout -b 05-03-static_page_views

ruby mod-05-03.rb

if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Created static page views"
git checkout master
git merge 05-03-static_page_views
