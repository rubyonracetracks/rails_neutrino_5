#!/bin/bash
set -e

# AGENDA
# * Add a search engine into the user index view

TOGGLE_OUTLINE=$1

echo '###################################'
echo 'Unit 9 Chapter 5: User Index Search'
echo '###################################'

git checkout -b 09-05-user_index_search

ruby mod-09-05.rb

# BEGIN: outlining
TOGGLE_OUTLINE=$1
if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  bundle exec annotate --routes
  bundle exec annotate
else
  echo 'Skipping the outlining process to save time'
fi
# END: outlining

git add .
git commit -m "Add the user index search"
git checkout master
git merge 09-05-user_index_search
