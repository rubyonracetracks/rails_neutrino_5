#!/bin/bash
set -e

# Providing scripts to generate outlines and block diagrams of the app

# AGENDA
# * Add annotate, railroady, and rails-erd to the Gemfile.
# * Add outline-short.sh.
# * Add outline.sh.
# * Add outline.sh to all.sh.
# * Add outline-short.sh to git_check.sh.

echo '###########################'
echo 'Unit 4 Chapter 2: Outlining'
echo '###########################'

git checkout -b 04-02-outlining

ruby mod-04-02.rb

sh outline-short.sh
git add .
git commit -m "Added outlining gems and scripts"
git checkout master
git merge 04-02-outlining
