#!/bin/bash
set -e

# Provide scripts for converting from SQLite3 to PostgreSQL

# AGENDA
# * Adding line_containing, remove_double_blank, and string_in_file to the Gemfile
# * Add config/database-pg.yml, pg_setup.sh, pg_setup.rb,
#   .env/development/database-template, .env/development/web, and
#   init.sql.template

echo '#####################'
echo 'UNIT 4: MISCELLANEOUS'
echo '#####################'

echo '##########################################'
echo 'Unit 4 Chapter 1: PostgreSQL Setup Scripts'
echo '##########################################'

git checkout -b 04-01-postgresql

echo 'Adding config/database-pg.yml'
mv mod-04-01-database-pg.yml config/database-pg.yml

echo 'Adding pg_setup.sh'
mv mod-04-01-pg_setup.sh pg_setup.sh

echo 'Adding pg_setup_full.sh'
mv mod-04-01-pg_setup_full.sh pg_setup_full.sh

echo 'mkdir -p .env/development'
mkdir -p .env/development

echo 'Adding .env/development/database-template'
mv mod-04-01-env-development-database-template .env/development/database-template

echo 'Adding .env/development/web' 
mv mod-04-01-env-development-web .env/development/web

echo 'Adding init.sql.template'
mv mod-04-01-init-sql-template init.sql.template

ruby mod-04-01.rb

git add .
git commit -m "Added PostgreSQL setup scripts"
git checkout master
git merge 04-01-postgresql
