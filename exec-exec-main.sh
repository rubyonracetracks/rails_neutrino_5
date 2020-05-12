#!/bin/bash
set -e

APP_NAME=$1
DIR_APP=$PWD/$APP_NAME

bash exec-main.sh $APP_NAME 'outline'
