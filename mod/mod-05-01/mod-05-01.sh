#!/bin/bash
set -e

# Set up the title helper

# AGENDA
# * Add test/helpers/application_helper_test.rb
# * Add app/helpers/application_helper.rb

# NOTE: At the end of this chapter, Rails Best Practices flags the title
# helper as an unused method.  This will be resolved in a later chapter.

echo '######################'
echo 'UNIT 5: STATIC CONTENT'
echo '######################'

echo '##############################'
echo 'Unit 5 Chapter 1: Title Helper'
echo '##############################'

git checkout -b 05-01-title_helper

ruby mod-05-01.rb

if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  bundle exec annotate --routes
  bundle exec annotate
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Added title helper"
git checkout master
git merge 05-01-title_helper
