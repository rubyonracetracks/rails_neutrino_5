#!/bin/bash

APP_NAME=$1

if [ $# -eq 0 ]
then
  DATE=`date +%Y-%m%d-%H%M-%S`
  APP_NAME=generic-rails-$DATE
fi

DIR_MAIN=$PWD
DIR_PARENT="$(dirname "$DIR_MAIN")"
DIR_APP=$DIR_PARENT/$APP_NAME

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
gem install gemfile_entry
gem install string_in_file
gem install replace_quotes
gem install remove_double_blank
echo '-----------------------------------------------'
echo 'FINISHED: installing gems needed by Rails Neutrino'
echo '-----------------------------------------------'

# Creating the new Rails app
cd $DIR_PARENT && rails new $APP_NAME
wait

# Copy credentials.sh to the new app's root directory
cp $DIR_MAIN/credentials.sh $DIR_APP

# Copy mod_app.sh to the new app's root directory
cp $DIR_MAIN/mod_app.sh $DIR_APP

# Copy the mod directory to the new app's root directory
cp -R $DIR_MAIN/mod $DIR_APP

# Modify the new app
cd $DIR_APP && sh mod_app.sh '01-01'
cd $DIR_APP && sh mod_app.sh '01-02'
cd $DIR_APP && sh mod_app.sh '01-03'
cd $DIR_APP && sh mod_app.sh '01-04'
cd $DIR_APP && sh mod_app.sh '02-01'
cd $DIR_APP && sh mod_app.sh '02-02'

# Remove the mod* files from the new app
rm $DIR_APP/mod*

echo '###########'
echo 'FINAL SETUP'
echo '###########'

cd $DIR_APP && sh kill_spring.sh
cd $DIR_APP && sh test_app.sh

sh test_code.sh
