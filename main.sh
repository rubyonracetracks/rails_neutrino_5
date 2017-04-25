#!/bin/bash

APP_NAME=$1

if [ $# -eq 0 ]
then
  DATE=`date +%Y-%m%d-%H%M-%S`
  APP_NAME=generic-rails-$DATE
fi

DIR_MAIN=$PWD
echo $DIR_MAIN
DIR_APP=$DIR_MAIN/$APP_NAME

sh credentials.sh

# Removing the old Rails app (if necessary)
if [ -d "$DIR_APP" ]; then
  rm -rf $DIR_APP
fi

echo '-----------------------------------------------'
echo 'BEGIN: installing gems needed by Rails Neutrino'
echo '-----------------------------------------------'
gem install insert_from_file
gem install line_containing
echo '-----------------------------------------------'
echo 'FINISHED: installing gems needed by Rails Neutrino'
echo '-----------------------------------------------'

# Creating the new Rails app
rails new $APP_NAME
wait

# Copy mod_app.sh to the new app's root directory
cp mod_app.sh $APP_NAME 

# Copy the mod directory to the new app's root directory
cp -R mod $APP_NAME

# Modify the new app
cd $DIR_APP && sh mod_app.sh '01-01'
cd $DIR_APP && sh mod_app.sh '01-02'

echo '###########'
echo 'FINAL SETUP'
echo '###########'

echo '--------------------------'
echo 'bundle install > /dev/null'
bundle install > /dev/null

echo '----------------'
echo 'rails db:migrate'
rails db:migrate

# echo '----------'
# echo 'rails test'
# rails test

rails db:seed
