#!/usr/bin/ruby

require 'insert_from_file'

# WICHTIG: add mailcatcher.sh
system('mv mod-04-03-mailcatcher.sh mailcatcher.sh')

# WICHTIG: update config/environments/development.rb if not already done
InsertFromFile.add_after('mod-04-03-development.txt', 'config/environments/development.rb', 'Rails.application.configure')
