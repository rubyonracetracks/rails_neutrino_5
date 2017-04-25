#!/bin/bash

echo '###############################'
echo 'Unit 1 Chapter 2: Basic Scripts'
echo '###############################'

git checkout -b 01-02-basic_scripts

echo '------------------'
echo 'Adding pg-start.sh'
mv mod-01-02-pg-start.sh pg-start.sh

echo '---------------------'
echo 'Adding kill_spring.sh'
mv mod-01-02-kill_spring.sh kill_spring.sh

git checkout master
git merge 01-02-basic_scripts
