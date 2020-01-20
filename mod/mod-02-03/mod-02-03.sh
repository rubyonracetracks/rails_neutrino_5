#!/bin/bash
set -e

# AGENDA
# * Replace Heroku's default WEBrick server with Puma, which can handle
#   far more web traffic.  Do this by updating the config/puma.rb file
#   and by adding the Procfile and specifying Puma in it.

echo '#####################################################'
echo 'Unit 2 Chapter 3: Updating the Production Environment'
echo '#####################################################'

git checkout -b 02-03-production_parameters

# WICHTIG/LEGACY/production: update config/puma.rb (if necessary)
echo 'Updating config/puma.rb'
mv mod-02-03-puma.rb config/puma.rb

# WICHTIG/LEGACY/production: update the Procfile (if necessary)
echo 'Specifying the use of Puma in the Procfile'
mv mod-02-03-Procfile Procfile

git add .
git commit -m "Using Puma in the production environment"
git checkout master
git merge 02-03-production_parameters
