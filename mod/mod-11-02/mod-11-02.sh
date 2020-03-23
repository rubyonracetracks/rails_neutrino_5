#!/bin/bash
set -e

# Adding a script and test for deleting users that have never signed in
# after 24 hours after initial sign-up

# AGENDA
# * Add upgrade_gems.sh

echo '############################################'
echo 'Unit 11 Chapter 2: remove never active users'
echo '############################################'

# WICHTIG/LEGACY/all_or_nothing: update README files
# WICHTIG/LEGACY/all_or_nothing: add README-setup.md file explaining setup procedure (if necessary)
git checkout -b 11-02-never_active_users
mkdir -p test/lib
mv mod-11-02-rake_remove_never_active_users_test.rb test/lib/rake_remove_never_active_users_test.rb
mv mod-11-02-remove_never_active_users.rake lib/tasks/remove_never_active_users.rake

git add .
git commit -m "Added script for deleting never active users"
git checkout master
git merge 11-02-never_active_users
