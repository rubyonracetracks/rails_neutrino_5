#!/bin/bash

APP_NAME=$1

if [ $# -eq 0 ]
then
  DATE=`date +%Y-%m%d-%H%M-%S`
  APP_NAME=generic-rails-$DATE
fi

DIR_PARENT="$(dirname "$PWD")"
DIR_APP=$DIR_PARENT/$APP_NAME

sh credentials.sh

# Removing the old Rails app (if necessary)
if [ -d "$DIR_APP" ]; then
  rm -rf $DIR_APP
fi

# Creating the new Rails app
cd $DIR_PARENT && rails new $APP_NAME

# Modifying the Rails app
cp -R mod $DIR_APP
