#!/bin/bash

# AGENDA
# * Update test_code.sh
# * Update git_check.sh
# * Add brakeman, bundler-audit, gemsurance, rails_best_practices, and sandi_meter
# * Generate the initial config/rails_best_practices.yml
# * Update .rubocop.yml to omit files in the tmp directory

echo '###############################'
echo 'Unit 1 Chapter 4: Other Metrics'
echo '###############################'

git checkout -b 01-04-other_metrics

# Add test_code.sh
mv mod-01-04-test_code.sh test_code.sh

# Update git_check.sh
mv mod-01-04-git_check.sh git_check.sh

ruby mod-01-04.rb

# Generates the Rails Best Practices configuration file at config/rails_best_practices.yml
bundle exec rails_best_practices -g

git add .
git commit -m "Added brakeman, bundler-audit, gemsurance, rails_best_practices, and sandi_meter"
git checkout master
git merge 01-04-other_metrics
