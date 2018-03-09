#!/usr/bin/ruby

require 'insert_from_file'

# WICHTIG: add the Heroku commands to credentials.sh
InsertFromFile.add_end('mod-02-02-add_to_credentials_script.txt', 'credentials.sh')
