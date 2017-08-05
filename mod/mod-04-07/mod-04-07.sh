#!/bin/bash

# Adding a script that updates the gems with "bundle update"

# AGENDA
# * Add upgrade_gems.sh

echo '############################'
echo 'Unit 4 Chapter 7: To Do List'
echo '############################'

git checkout -b 04-07-to_do
mv mod-04-07-README-to_do.txt README-to_do.txt

git add .
git commit -m "Added the to do list for Rails Neutrino"
git checkout master
git merge 04-07-to_do
