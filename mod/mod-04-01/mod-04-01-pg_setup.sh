#!/bin/bash

# Output:
# First argument if it is not blank
# Second argument if first argument is blank
anti_blank () {
  if [ -z "$1" ]; then
    echo $2
  else
    echo $1
  fi
}

#############################################
# BEGIN: get root name of PostgreSQL database
#############################################

db_root_def="POSTGRES_DB_1" # Default root name of database
echo '*******************************'
echo 'SELECTING POSTGRESQL PARAMETERS'
echo
echo 'NOTE: Use letters, numbers, and underscores in parameter names.'
echo 'Hyphens are prohibited.'
echo
echo "Default database root name: ${db_root_def}"
echo "Default database name (development): ${db_root_def}_development"
echo "Default database name (testing): ${db_root_def}_test"
echo "Default database name (production): ${db_root_def}_production"
echo 'Enter your desired database root name:'
read db_root_sel
db_root=$(anti_blank $db_root_sel $db_root_def)

db_dev="${db_root}_development"
db_test="${db_root}_test"
db_pro="${db_root}_production"

################################################
# FINISHED: get root name of PostgreSQL database
################################################

##################################
# BEGIN: get username and password
##################################

db_username='POSTGRES_USER_1'
db_password='POSTGRES_PASSWORD_1'

######################################
# BEGIN: getting username and password
######################################

db_username_def="POSTGRES_USER_1"
echo
echo "Default username: ${db_username_def}"
echo 'Enter the desired username for the database:'
read db_username_sel
db_username=$(anti_blank $db_username_sel $db_username_def)

db_password_def="POSTGRES_PASSWORD_1"
echo
echo "Default password: ${db_password_def}"
echo
echo 'Do NOT use spaces or other whitespace characters in your password.'
echo
echo 'Enter the desired password for the database:'
read db_password_sel
db_password=$(anti_blank $db_password_sel $db_password_def)

echo
echo "Database name (development): ${db_dev}"
echo "Database name (testing): ${db_test}"
echo "Database name (production): ${db_pro}"
echo
echo "Username: ${db_username}"
echo "Password: ${db_password}"

#########################################
# FINISHED: getting username and password
#########################################

bash pg_setup_full.sh $db_root $db_username $db_password
