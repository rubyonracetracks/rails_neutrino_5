#!/bin/bash

# Set up the title helper

# AGENDA
# * Add test/helpers/application_helper_test.rb
# * Add app/helpers/application_helper.rb

# NOTE: At the end of this chapter, Rails Best Practices flags the title
# helper as an unused method.  This will be resolved in a later chapter.

echo '######################'
echo 'UNIT 4: STATIC CONTENT'
echo '######################'

echo '##############################'
echo 'Unit 4 Chapter 1: Title Helper'
echo '##############################'

git checkout -b 04-01-title_helper

mv 04-01-application_helper_test.rb test/helpers/application_helper_test.rb
mv 04-01-application_helper.rb app/helpers/application_helper.rb

git add .
git commit -m "Added title helper"
git checkout master
git merge 04-01-title_helper
