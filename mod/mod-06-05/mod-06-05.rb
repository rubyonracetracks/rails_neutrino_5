#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

puts 'Adding pry-rails to the Gemfile'
InsertFromFile.add_end('mod-06-05-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'pry-rails'", "#{GemfileEntry.active('pry-rails')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
