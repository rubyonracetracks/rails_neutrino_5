#!/bin/bash

# NOTE 1: The name of the Rails app is kept below 30 characters long to
# conform to Heroku's restrictions.
# NOTE 2: The name of the Rails app has the time of creation encoded to
# ensure uniqueness.
# NOTE 3: The time stamp in the Rails app name includes milliseconds to
# ensure uniqueness even if a large number of people (perhaps in a workshop)
# using Rails Neutrino create apps simultaneously.

DATE=`date -u +%Y%m%d-%H%M%S-%3N`

APP_NAME="railn-$DATE"

mkdir -p log
bash exec-exec-main.sh $APP_NAME 2>&1 | tee log/railn-$DATE.txt
