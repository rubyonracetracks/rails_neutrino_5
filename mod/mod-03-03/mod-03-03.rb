#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

puts 'Adding capybara-email and capybara-slow_finder_errors to the Gemfile'
InsertFromFile.add_end('mod-03-03-add_to_Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
puts 'Pinning the versions of capybara-email and capybara-slow_finder_errors'
StringInFile.replace("gem 'capybara-email'", "#{GemfileEntry.active('capybara-email')}", "Gemfile")
StringInFile.replace("gem 'capybara-slow_finder_errors'", "#{GemfileEntry.active('capybara-slow_finder_errors')}", "Gemfile")
puts 'bundle install --quiet'
system('bundle install --quiet')
