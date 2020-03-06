#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`
APP_NAME='tmp1'
DIR_APP=$PWD/$APP_NAME

mkdir -p log
bash exec-main.sh $APP_NAME 'no_outline'

echo '#############################'
echo 'BEGIN: bash build.sh (SQLite)'
echo '#############################'
cd $DIR_APP && bash build.sh
echo '###########################'
echo 'END: bash build.sh (SQLite)'
echo '###########################'

echo '#######################'
echo 'BEGIN: pg_setup_bash.sh'
echo '#######################'
echo '-----------------------------------------------------------'
echo "bash pg_setup_bash.sh 'neutrino' 'winner' 'long_way_stinks'"
cd $DIR_APP && docker-compose run --rm web bash pg_setup_bash.sh 'neutrino' 'winner' 'long_way_stinks'
echo '#######################'
echo 'END: pg_setup_bash.sh'
echo '#######################'

echo '------------'
echo 'bash nuke.sh'
cd $DIR_APP && bash nuke.sh

echo '#################################'
echo 'BEGIN: bash build.sh (PostgreSQL)'
echo '#################################'
cd $DIR_APP && bash build.sh
echo '###############################'
echo 'END: bash build.sh (PostgreSQL)'
echo '###############################'
