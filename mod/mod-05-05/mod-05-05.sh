#!/bin/bash

# AGENDA
# * Add the faker and ruby-progressbar gems to the Gemfile.
# * Update db/seeds.rb.
# * Add seed.sh.
# * Update all.sh.

echo '######################################'
echo 'Unit 5 Chapter 5: Seeding the Database'
echo '######################################'

git checkout -b 05-05-seed

ruby mod-05-05.rb

git add .
git commit -m "Added database seeding capabilities"
git checkout master
git merge 05-05-seed
