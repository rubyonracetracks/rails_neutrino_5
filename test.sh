#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`
APP_NAME='tmp1'
DIR_APP=$PWD/$APP_NAME

mkdir -p log
bash exec-test.sh $APP_NAME 2>&1 | tee log/test-$DATE.txt
