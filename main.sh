#!/bin/bash

# NOTE 1: The name of the Rails app is kept below 30 characters long to
# conform to Heroku's restrictions.
# NOTE 2: The name of the Rails app has the time of creation encoded to
# ensure uniqueness.
# NOTE 3: The time stamp in the Rails app name includes milliseconds to
# ensure uniqueness even if a large number of people (perhaps in a workshop)
# using Rails Neutrino create apps simultaneously.

DATE=`date +%Y-%m%d-%H%M-%S`

APP_NAME=rails-$DATE

mkdir -p log
sh exec-main.sh $APP_NAME 'outline' 2>&1 | tee log/log-$DATE.txt
