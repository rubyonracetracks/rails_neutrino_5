#!/bin/bash

# Adding the pry-rails gem to improve the screen output in the console environment

# When you enter "User.all" or "Admin.all", the screen output will be much
# more readable.

# AGENDA
# * Update the Gemfile.

echo '#####################'
echo 'Unit 6 Chapter 5: Pry'
echo '#####################'

git checkout -b 06-05-pry_rails

ruby mod-06-05.rb

git add .
git commit -m "Added pry_rails gem"
git checkout master
git merge 06-05-pry_rails
