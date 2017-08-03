#!/bin/bash

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

mv 05-01-application_helper_test.rb test/helpers/application_helper_test.rb
mv 05-01-application_helper.rb app/helpers/application_helper.rb

git add .
git commit -m "Added title helper"
git checkout master
git merge 05-01-title_helper
