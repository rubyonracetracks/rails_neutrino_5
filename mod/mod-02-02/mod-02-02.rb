#!/usr/bin/ruby

require 'insert_from_file'

# WICHTIG/LEGACY/script: add the Heroku commands to credentials.sh (if necessary)
InsertFromFile.add_end('mod-02-02-add_to_credentials_script.txt', 'credentials.sh')
