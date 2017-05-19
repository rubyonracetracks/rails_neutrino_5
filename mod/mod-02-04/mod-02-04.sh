#!/bin/bash

# AGENDA
# * Create a barrier to destroying data with rake commands in the
#   product environment by creating the script
#   lib/tasks/disable_db_tasks_on_production.rake

# This is a safeguard to prevent disasters.

echo '###########################################################'
echo 'Unit 2 Chapter 4: Restricting Dangerous Tasks in Production'
echo '###########################################################'

mv mod-02-04-disable.rake lib/tasks/disable_db_tasks_on_production.rake

git add .
git commit -m "Restrict dangerous tasks in production"
