#!/bin/bash
set -e

# Create the static pages

# AGENDA
# * Add the static pages controller for the home, about, and contact pages.
# * Add the static pages controller tests.
# * Fill in the static pages controller so that the tests pass.

# NOTE: Rails Best Practices still flags the title helper as an unused method.
# This will be resolved in a later chapter.

echo '########################################'
echo 'Unit 5 Chapter 2: Static Page Controller'
echo '########################################'

git checkout -b 05-02-static_page_controller

ruby mod-05-02.rb

# BEGIN: outlining
TOGGLE_OUTLINE=$1
if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  bash docker-annotate.sh
else
  echo 'Skipping the outlining process to save time'
fi
# END: outlining

git add .
git commit -m "Added static pages controller"
git checkout master
git merge 05-02-static_page_controller
