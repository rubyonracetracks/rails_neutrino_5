#!/bin/bash
DATE=`date +%Y-%m%d-%H%M-%S`

APP_NAME=rails-$DATE

mkdir -p log
sh exec-main.sh $APP_NAME 'outline' 2>&1 | tee log/log-$DATE.txt
