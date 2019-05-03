#!/bin/bash
set -e

# Adding a script that updates the gems with "bundle update"

# AGENDA
# * Add upgrade_gems.sh

echo '##############################'
echo 'Unit 4 Chapter 7: README files'
echo '##############################'

# WICHTIG/LEGACY/all_or_nothing: update README files
# WICHTIG/LEGACY/all_or_nothing: add README-setup.md file explaining setup procedure (if necessary)
git checkout -b 04-07-README_files
mv mod-04-07-README-to_do.txt README-to_do.txt
mv mod-04-07-README.md README.md

git add .
git commit -m "Added the README files"
git checkout master
git merge 04-07-README_files
