#!/bin/bash
set -e

# AGENDA
# * Update test_code.sh.
# * Update git_check.sh.
# * Add rails_best_practices
# * Generate the initial config/rails_best_practices.yml.

echo '######################################'
echo 'Unit 1 Chapter 4: Rails Best Practices'
echo '######################################'

git checkout -b 01-04-rbp

# WICHTIG/LEGACY: Add bin/drbp (if necessary)
mv mod-01-04-bin-drbp bin/drbp

ruby mod-01-04.rb

# Generates the Rails Best Practices configuration file at config/rails_best_practices.yml
bundle exec rails_best_practices -g

git add .
git commit -m 'Added rails_best_practices'
git checkout master
git merge 01-04-rbp
