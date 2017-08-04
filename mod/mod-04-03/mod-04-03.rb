#!/usr/bin/ruby

require 'insert_from_file'

system('mv mod-04-03-mailcatcher.sh mailcatcher.sh')
InsertFromFile.add_after('mod-04-03-development.txt', 'config/environments/development.rb', 'Rails.application.configure')
