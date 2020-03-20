#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

# WICHTIG/LEGACY/recommended: add pry-rails to the Gemfile
puts 'Adding pry-rails to the Gemfile'
InsertFromFile.add_end('mod-04-05-Gemfile.txt', 'Gemfile')
puts Gemfile
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'pry-rails'", "#{GemfileEntry.active('pry-rails')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
