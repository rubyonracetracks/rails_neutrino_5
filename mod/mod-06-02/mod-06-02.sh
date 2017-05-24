#!/bin/bash

# Providing scripts to generate outlines and block diagrams of the app

# AGENDA
# * Add annotate, railroady, and rails-erd to the Gemfile.
# * Add outline-short.sh.
# * Add outline.sh.
# * Add outline.sh to all.sh.
# * Add outline-short.sh to git_check.sh.

echo '###########################'
echo 'Unit 6 Chapter 2: Outlining'
echo '###########################'

git checkout -b 06-02-outlining

ruby mod-06-02.rb

git add .
git commit -m "Added outlining gems and scripts"
git checkout master
git merge 06-02-outlining
