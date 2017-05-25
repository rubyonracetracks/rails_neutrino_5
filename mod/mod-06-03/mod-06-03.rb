#!/usr/bin/ruby

require 'insert_from_file'

system('mv mod-06-03-mailcatcher.sh mailcatcher.sh')
InsertFromFile.add_after('mod-06-03-development.txt', 'config/environments/development.rb', 'Rails.application.configure')
