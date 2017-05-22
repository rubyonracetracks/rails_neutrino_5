#!/bin/bash

# Provide scripts for converting from SQLite3 to PostgreSQL

# AGENDA
# * Add the figaro, line_containing, remove_double_blank, and string_in_file gems to the Gemfile.
# * Add config/database-pg.yml, pg_setup.sh, and pg_setup.rb.

echo '#####################'
echo 'UNIT 6: MISCELLANEOUS'
echo '#####################'

echo '##########################################'
echo 'Unit 6 Chapter 1: PostgreSQL Setup Scripts'
echo '##########################################'

git checkout -b 06-01-postgresql

ruby mod-06-01.rb

echo 'Adding config/database-pg.yml'
mv mod-06-01-database-pg.yml config/database-pg.yml

echo 'Adding pg_setup.sh'
mv mod-06-01-pg_setup.sh pg_setup.sh

echo 'Adding pg_setup.rb'
mv mod-06-01-pg_setup.rb pg_setup.rb

git add .
git commit -m "Added PostgreSQL setup scripts"
git checkout master
git merge 06-01-postgresql
