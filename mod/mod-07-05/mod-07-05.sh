#!/bin/bash

# AGENDA
# * Allow users to request the resending of a confirmation email.
# * This is useful if a user loses a confirmation email.

TOGGLE_OUTLINE=$1

echo '#############################################'
echo 'Unit 7 Chapter 5: Resending User Confirmation'
echo '#############################################'

git checkout -b 07-05-user_resend_conf

ruby mod-07-05.rb

if [ "$TOGGLE_OUTLINE" = 'outline' ]
then
  sh outline-short.sh
else
  echo 'Skipping the outlining process to save time'
fi

git add .
git commit -m "Allow users to request the resending of a confirmation email"
git checkout master
git merge 07-05-user_resend_conf
