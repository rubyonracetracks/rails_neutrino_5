#!/bin/bash
set -e

# AGENDA
# * Add an initial index page to show that the app works
# * Add the Dockerfile and docker-compose.yml files
# * Add the following scripts:
#   bin/dbuild
#   bin/bundle
#   bin/dmigrate
#   bin/dserver
#   bin/dtest
#   all.sh
#   build_fast.sh
#   git_check.sh
#   log_test_app.sh
#   nuke.sh
#   sandbox.sh
#   server.sh
#   test_app.sh

# * NOTE 1: The public/index.html page replaces the default Rails splash screen.
# * NOTE 2: The default Rails splash screen does not work in the Heroku
#           production environment.  If no index page is specified, the
#           Heroku splash screen appears instead.

echo '###############################'
echo 'Unit 1 Chapter 2: Basic Scripts'
echo '###############################'

git checkout -b 01-02-basic_scripts

# WICHTIG/LEGACY/bash: add Dockerfile, docker-compose.yml file, and scripts from this chapter

echo 'Adding Dockerfile and docker-compose.yml'
mv mod-01-02-Dockerfile Dockerfile
mv mod-01-02-docker-compose.yml docker-compose.yml

echo 'Getting the Ruby version'
cp .ruby-version .ruby-version-process
sed -i.bak "s|ruby-||g" .ruby-version-process
rm .ruby-version-process.bak
RUBY_VERSION_HERE=`cat .ruby-version-process`
rm .ruby-version-process

echo 'Updating the Docker image specified in the Dockerfile'
DOCKER_IMAGE_HERE="ruby:$RUBY_VERSION_HERE"
sed -i.bak "s|DOCKER_IMAGE_HERE|$DOCKER_IMAGE_HERE|g" Dockerfile
rm Dockerfile.bak

echo 'Adding bin/dbuild, bin/dbundle, bin/dmigrate, bin/dsandbox, bin/dserver, and bin/dtest'
mv mod-01-02-bin-dbuild bin/dbuild
mv mod-01-02-bin-dbundle bin/dbundle
mv mod-01-02-bin-dmigrate bin/dmigrate
mv mod-01-02-bin-dsandbox bin/dsandbox
mv mod-01-02-bin-dserver bin/dserver
mv mod-01-02-bin-dtest bin/dtest

echo 'Adding Bash scripts'
mv mod-01-02-all.sh all.sh
mv mod-01-02-build_fast.sh build_fast.sh
mv mod-01-02-git_check.sh git_check.sh
mv mod-01-02-log_test_app.sh log_test_app.sh
mv mod-01-02-nuke.sh nuke.sh
mv mod-01-02-sandbox.sh sandbox.sh
mv mod-01-02-server.sh server.sh
mv mod-01-02-test_app.sh test_app.sh

echo 'Adding public/index.html'
mv mod-01-02-public_index.html public/index.html

git add .
git commit -m "Added basic scripts"
git checkout master
git merge 01-02-basic_scripts
