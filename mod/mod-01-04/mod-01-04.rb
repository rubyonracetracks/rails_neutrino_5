#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'
require 'string_in_file'

puts 'Updating the Gemfile'
LineContaining.add_before('rubocop', "  gem 'rails_best_practices'", "Gemfile")

puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'rails_best_practices'", GemfileEntry.active('rails_best_practices'),'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
