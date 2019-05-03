#!/bin/bash
set -e

# AGENDA
# * Add the faker and ruby-progressbar gems to the Gemfile.
# * Update db/seeds.rb.
# * Add seed.sh.
# * Update all.sh.

echo '######################################'
echo 'Unit 6 Chapter 5: Seeding the Database'
echo '######################################'

git checkout -b 06-05-seed

ruby mod-06-05.rb

git add .
git commit -m "Added database seeding capabilities"
git checkout master
git merge 06-05-seed
