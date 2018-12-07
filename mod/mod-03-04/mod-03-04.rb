#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

# WICHTIG/LEGACY/master: Add SimpleCov (if necessary); add coverage to .gitignore

puts 'Adding SimpleCov to the Gemfile'
InsertFromFile.add_end('mod-03-04-add_to_Gemfile.txt', 'Gemfile')
puts 'bundle update --quiet'
system('bundle update --quiet')
puts 'Pinning the version of SimpleCov'
StringInFile.replace("gem 'simplecov'", "#{GemfileEntry.active('simplecov')}", "Gemfile")
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Adding the SimpleCov setup to test/test_helper.rb'
InsertFromFile.add_beginning('mod-03-04-add_to_test_helper.txt', 'test/test_helper.rb')

puts 'Adding the coverage directory to .gitignore'
StringInFile.add_end("\n# Keep SimpleCov test results out of the source code\n", '.gitignore')
StringInFile.add_end("coverage\n", '.gitignore')
