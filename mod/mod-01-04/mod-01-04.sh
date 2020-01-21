#!/bin/bash
set -e

# AGENDA
# * Update test_code.sh.
# * Update git_check.sh.
# * Add brakeman, bundler-audit, gemsurance, rails_best_practices, and sandi_meter.
# * Generate the initial config/rails_best_practices.yml.
# * Update .rubocop.yml to omit files in the tmp directory.
# * Configure the production environment to automatically enable SSL, as suggested by Brakeman.
#   Do this by uncommenting "config.force_ssl = true".
#   (When you view your app on the Heroku site, the URL will contain
#   "https://", and the lock will appear in the address bar.)

echo '###############################'
echo 'Unit 1 Chapter 4: Other Metrics'
echo '###############################'

git checkout -b 01-04-other_metrics

# WICHTIG/LEGACY: Add bin/daudit, bin/dbrakeman, bin/dgemsurance, and bin/dsandi
# WICHTIG/LEGACY: Add bin/drbp (if necessary)
mv mod-01-04-bin-daudit bin/daudit
mv mod-01-04-bin-dbrakeman bin/dbrakeman
mv mod-01-04-bin-dgemsurance bin/dgemsurance
mv mod-01-04-bin-drbp bin/drbp
mv mod-01-04-bin-dsandi bin/dsandi

# WICHTIG/LEGACY/bash: Add test_code.sh
# WICHTIG/LEGACY/bash: Add rubocop and rails_best_practices to test_code.sh (if necessary)
mv mod-01-04-test_code.sh test_code.sh

# WICHTIG/LEGACY/bash: Update git_check.sh
mv mod-01-04-git_check.sh git_check.sh

ruby mod-01-04.rb

# Generates the Rails Best Practices configuration file at config/rails_best_practices.yml
bundle exec rails_best_practices -g

git add .
git commit -m "Added brakeman, bundler-audit, gemsurance, rails_best_practices, and sandi_meter; enabled SSL"
git checkout master
git merge 01-04-other_metrics
