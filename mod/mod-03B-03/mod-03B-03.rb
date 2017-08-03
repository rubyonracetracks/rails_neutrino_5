#!/usr/bin/ruby

require 'insert_from_file'

system('mv mod-03B-03-mailcatcher.sh mailcatcher.sh')
InsertFromFile.add_after('mod-03B-03-development.txt', 'config/environments/development.rb', 'Rails.application.configure')
