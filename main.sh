#!/bin/bash

APP_NAME=$1

if [ $# -eq 0 ]
then
  DATE=`date +%Y-%m%d-%H%M-%S`
  APP_NAME=generic-rails-$DATE
fi

echo $APP_NAME

DIR_PARENT="$(dirname "$PWD")"
DIR_APP=$DIR_PARENT/$APP_NAME

if [ ! -d "$DIR_APP" ]; then
  # Creating the new Rails app
  cd $DIR_PARENT && rails new $APP_NAME

  # Duplicating the original new Rails app
  mkdir $DIR_PARENT/rails_new_orig
  rm -rf $DIR_PARENT/rails_new_orig
  cp -R $DIR_APP $DIR_PARENT/rails_new_orig
fi

# Modifying the Rails app
