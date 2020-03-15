#!/bin/bash
set -e

# AGENDA
# * Allow admins to request the resending of a confirmation email.
# * This is useful if an admin loses a confirmation email.

TOGGLE_OUTLINE=$1

echo '##############################################'
echo 'Unit 8 Chapter 6: Resending Admin Confirmation'
echo '##############################################'

git checkout -b 08-06-admin_resend_conf

ruby mod-08-06.rb

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
git commit -m "Allow admins to request the resending of a confirmation email"
git checkout master
git merge 08-06-admin_resend_conf
