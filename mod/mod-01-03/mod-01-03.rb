#!/usr/bin/ruby
require 'insert_from_file'

puts 'Adding RuboCop to the Gemfile'
InsertFromFile.add_end('mod-01-03-Gemfile-add.txt', 'Gemfile')
