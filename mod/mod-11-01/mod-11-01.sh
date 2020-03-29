#!/bin/bash
set -e

# Adding a script that updates the gems with "bundle update"

# AGENDA
# * Add upgrade_gems.sh

echo '######################'
echo 'UNIT 11: FINAL TOUCHES'
echo '######################'

echo '###############################'
echo 'Unit 11 Chapter 1: README files'
echo '###############################'

# WICHTIG/LEGACY/all_or_nothing: update README files
# WICHTIG/LEGACY/all_or_nothing: add README-setup.md file explaining setup procedure (if necessary)
git checkout -b 11-01-README_files
mv mod-11-01-README.md README.md

git add .
git commit -m "Added the README files"
git checkout master
git merge 11-01-README_files
