#!/bin/bash

# Adding a script that updates the gems with "bundle update"

# AGENDA
# * Add upgrade_gems.sh

echo '##############################'
echo 'Unit 4 Chapter 7: README files'
echo '##############################'

# WICHTIG: update README files
git checkout -b 04-07-README_files
mv mod-04-07-README-to_do.txt README-to_do.txt
mv mod-04-07-README.md README.md

git add .
git commit -m "Added the README files"
git checkout master
git merge 04-07-README_files
