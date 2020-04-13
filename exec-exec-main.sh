#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`
APP_NAME="railn-$DATE"
DIR_APP=$PWD/$APP_NAME

mkdir -p log
bash exec-main.sh $APP_NAME 'outline'
