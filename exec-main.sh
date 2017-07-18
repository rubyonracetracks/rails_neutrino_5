#!/bin/bash

APP_NAME=$1
TOGGLE_OUTLINE=$2

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
gem install bundler
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
echo '-------------------------------------'
echo "cd $DIR_PARENT && rails new $APP_NAME"
cd $DIR_PARENT && rails new $APP_NAME
wait

# Migration
echo '-------------------------------'
echo "cd $DIR_APP && rails db:migrate"
cd $DIR_APP && rails db:migrate
wait

# Copy credentials.sh to the new app's root directory
echo '------------------------------------------------------------------------'
echo 'Copying credentials.sh, mod_app.sh, and the mod directory to the new app'
cp $DIR_MAIN/credentials.sh $DIR_APP

# Adding config/rails_neutrino_timestamp.txt
echo $DATE > $DIR_APP/config/rails_neutrino_timestamp.txt

# Copy mod_app.sh to the new app's root directory
cp $DIR_MAIN/mod_app.sh $DIR_APP

# Copy the mod directory to the new app's root directory
cp -R $DIR_MAIN/mod $DIR_APP

# Modify the new app
cd $DIR_APP && sh mod_app.sh '01-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '01-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '01-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '01-04' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '02-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '02-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '02-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '02-04' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '03-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '03-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '03-03' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '04-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '04-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '04-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '04-04' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '05-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '05-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '05-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '05-04' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '05-05' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '06-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '06-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '06-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '06-04' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '06-05' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '07-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '07-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '07-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '07-04' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '07-05' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '07-06' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '08-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-04' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-05' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-06' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '08-07' $TOGGLE_OUTLINE

cd $DIR_APP && sh mod_app.sh '09-01' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '09-02' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '09-03' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '09-04' $TOGGLE_OUTLINE
cd $DIR_APP && sh mod_app.sh '09-05' $TOGGLE_OUTLINE

# Remove the mod* files from the new app
rm -rf $DIR_APP/mod
rm $DIR_APP/mod*

echo '##########################################'
echo 'The new app has been created from scratch!'
echo ''
echo 'Enter the following command:'
echo "cd $DIR_APP && sh neutrino.sh"

