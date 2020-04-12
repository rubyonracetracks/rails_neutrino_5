#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`
APP_NAME='tmp1'
DIR_APP=$PWD/$APP_NAME

mkdir -p log
bash exec-main.sh $APP_NAME 'no_outline'

echo '#################################'
echo 'BEGIN: bash build-log.sh (SQLite)'
echo '#################################'
cd $DIR_APP && bash build-log.sh
echo '###############################'
echo 'END: bash build-log.sh (SQLite)'
echo '###############################'

cd $DIR_APP && bash nuke.sh

echo '###############################'
echo 'BEGIN: pg_setup_full.sh (first)'
echo '###############################'
cd $DIR_APP && bash pg_setup_full.sh 'neutrino' 'winner' 'long_way_stinks'
echo '#############################'
echo 'END: pg_setup_full.sh (first)'
echo '#############################'

rm $DIR_APP/config/database.yml
rm $DIR_APP/.env/development/database
rm $DIR_APP/init.sql

echo '###############################'
echo 'BEGIN: pg_setup_full.sh (second)'
echo '###############################'
cd $DIR_APP && bash pg_setup_full.sh 'neutrino' 'winner' 'long_way_stinks'
echo '##############################'
echo 'END: pg_setup_full.sh (second)'
echo '##############################'
echo '#####################################'
echo 'BEGIN: bash build-log.sh (PostgreSQL)'
echo '#####################################'
cd $DIR_APP && bash build-log.sh
echo '###################################'
echo 'END: bash build-log.sh (PostgreSQL)'
echo '###################################'
