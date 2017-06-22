#!/bin/bash

# AGENDA
# * Allow admins to request the resending of a confirmation email.
# * This is useful if an admin loses a confirmation email.

echo '##############################################'
echo 'Unit 8 Chapter 6: Resending Admin Confirmation'
echo '##############################################'

git checkout -b 08-06-admin_resend_conf

ruby mod-08-06.rb

sh outline-short.sh
git add .
git commit -m "Allow admins to request the resending of a confirmation email"
git checkout master
git merge 08-06-admin_resend_conf
