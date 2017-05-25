#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

puts 'Adding better_errors and binding_of_caller to the Gemfile'
InsertFromFile.add_end('mod-06-04-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'better_errors'", "#{GemfileEntry.active('better_errors')}", 'Gemfile')
StringInFile.replace("gem 'binding_of_caller'", "#{GemfileEntry.active('binding_of_caller')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
