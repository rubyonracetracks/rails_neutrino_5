#!/bin/bash

# AGENDA
# * Add the heroku.sh script.
# * Add the process of entering Heroku credentials to credentials.sh.

echo '##################################################'
echo 'Unit 2 Chapter 2: Adding Heroku Deployment Scripts'
echo '##################################################'

git checkout -b 02-02-heroku_scripts

# WICHTIG/LEGACY/script: add heroku.sh (if necessary)
mv mod-02-02-heroku.sh heroku.sh
ruby mod-02-02.rb

git add .
git commit -m "Added Heroku deployment scripts"
git checkout master
git merge 02-02-heroku_scripts
