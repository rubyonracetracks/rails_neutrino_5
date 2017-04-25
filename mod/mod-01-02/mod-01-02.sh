#!/bin/bash

echo '###############################'
echo 'Unit 1 Chapter 2: Basic Scripts'
echo '###############################'

git checkout -b 01-02-basic_scripts

echo 'Adding build_fast.sh'
mv mod-01-02-build_fast.sh build_fast.sh

echo 'Adding kill_spring.sh'
mv mod-01-02-kill_spring.sh kill_spring.sh

echo 'Adding pg-start.sh'
mv mod-01-02-pg-start.sh pg-start.sh

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
