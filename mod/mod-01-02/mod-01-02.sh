#!/bin/bash

# AGENDA
# * Add an initial index page to show that the app works
# * Add the following scripts:
#   all.sh
#   build_fast.sh
#   git_check.sh
#   kill_spring.sh
#   log_test_app.sh
#   pg-start.sh
#   sandbox.sh
#   server.sh
#   test_app.sh

# * NOTE 1: credentials.sh was added prior to the execution of this script.
# * NOTE 2: The public/index.html page replaces the default Rails splash screen.
# * NOTE 3: The default Rails splash screen does not work in the Heroku
#           production environment.  If no index page is specified, the
#           Heroku splash screen appears instead.

echo '###############################'
echo 'Unit 1 Chapter 2: Basic Scripts'
echo '###############################'

git checkout -b 01-02-basic_scripts

# WICHTIG: add all.sh, build_fast.sh, credentials.sh, git_check.sh,
# kill_spring.sh, log_test_app.sh, pg-start.sh, sandbox.sh, server.sh,
# and test_app.sh

echo 'Adding build_fast.sh'
mv mod-01-02-build_fast.sh build_fast.sh

echo 'Adding all.sh'
mv mod-01-02-all.sh all.sh

echo 'Adding git_check.sh'
mv mod-01-02-git_check.sh git_check.sh

echo 'Adding kill_spring.sh'
mv mod-01-02-kill_spring.sh kill_spring.sh
sh kill_spring.sh

echo 'Adding log_test_app.sh'
mv mod-01-02-log_test_app.sh log_test_app.sh

echo 'Adding pg-start.sh'
mv mod-01-02-pg-start.sh pg-start.sh

echo 'Adding sandbox.sh'
mv mod-01-02-sandbox.sh sandbox.sh

echo 'Adding server.sh'
mv mod-01-02-server.sh server.sh

echo 'Adding test_app.sh'
mv mod-01-02-test_app.sh test_app.sh

echo 'Adding public/index.html'
mv mod-01-02-public_index.html public/index.html

git add .
git commit -m "Added basic scripts"
git checkout master
git merge 01-02-basic_scripts
