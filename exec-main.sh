#!/bin/bash
set -e

APP_NAME=$1
TOGGLE_OUTLINE=$2
DIR_APP=$PWD/$APP_NAME

docker run -i -t --rm -v ${PWD}:/home/winner/neutrino rubyonracetracks/rails_neutrino_5 /home/winner/neutrino/build-rails $APP_NAME $TOGGLE_OUTLINE

echo '##########################################'
echo 'The new app has been created from scratch!'
echo ''
echo "It is located at: $DIR_APP"
echo ''
echo 'Things to check:'
echo '* The .ruby-version and Gemfile should specify the correct Ruby version.'
echo '* All gems in the Gemfile should be pinned.'
echo '* When you run the build_fast.sh script, there should be no errors,'
echo '  no test failures, and no offenses.'
