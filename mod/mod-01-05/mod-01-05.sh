#!/bin/bash
set -e

# AGENDA
# * Add test_code.sh.
# * Update git_check.sh.
# * Add brakeman, bundler-audit, gemsurance, and sandi_meter.
# * Update .rubocop.yml to omit files in the tmp directory.
# * Configure the production environment to automatically enable SSL, as suggested by Brakeman.
#   Do this by uncommenting "config.force_ssl = true".
#   (When you view your app in the production environment, the URL will contain
#   "https://", and the lock will appear in the address bar.)

echo '###############################'
echo 'Unit 1 Chapter 5: Other Metrics'
echo '###############################'

git checkout -b 01-05-other_metrics

# WICHTIG/LEGACY/bash: Add audit.sh and docker-audit.sh
mv mod-01-05-audit.sh audit.sh
mv mod-01-05-docker-audit.sh docker-audit.sh

# WICHTIG/LEGACY/bash: Add brakeman.sh and docker-brakeman.sh
mv mod-01-05-brakeman.sh brakeman.sh
mv mod-01-05-docker-brakeman.sh docker-brakeman.sh

# WICHTIG/LEGACY/bash: Add gemsurance.sh and docker-gemsurance.sh
mv mod-01-05-gemsurance.sh gemsurance.sh
mv mod-01-05-docker-gemsurance.sh docker-gemsurance.sh

# WICHTIG/LEGACY/bash: Add sandi.sh and docker-sandi.sh
mv mod-01-05-sandi.sh sandi.sh
mv mod-01-05-docker-sandi.sh docker-sandi.sh

# WICHTIG/LEGACY/bash: Add test_code.sh
mv mod-01-05-test_code.sh test_code.sh

# WICHTIG/LEGACY/bash: Update git_check.sh
mv mod-01-05-git_check.sh git_check.sh

ruby mod-01-05.rb

# Generates the Rails Best Practices configuration file at config/rails_best_practices.yml
bundle exec rails_best_practices -g

git add .
git commit -m "Added brakeman, bundler-audit, gemsurance, rails_best_practices, and sandi_meter; enabled SSL"
git checkout master
git merge 01-05-other_metrics
