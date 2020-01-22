#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'

# MUST execute "bundle install" before using the gemfile_entry gem.
# Not executing "bundle install" in the CI environment
# causes the gemfile_entry gem to choke.
puts 'bundle install --quiet'
system('bundle install --quiet')

# WICHTIG/LEGACY/all_or_nothing: pin rails, sqlite/pg, and other gems
puts 'Pinning rails'
LineContaining.delete('Bundle edge Rails', 'Gemfile')
LineContaining.replace("gem 'rails'", "#{GemfileEntry.active('rails')}", 'Gemfile')

puts 'Limiting sqlite to the development and testing environments; pinning sqlite'
LineContaining.delete('# Use sqlite3 as the database for Active Record', 'Gemfile')
InsertFromFile.replace('mod-02-01-Gemfile-sqlite.txt', 'Gemfile', "gem 'sqlite3'")
LineContaining.replace("gem 'sqlite3'", "  #{GemfileEntry.active('sqlite3')}", "Gemfile")

puts 'Adding the pg section to the Gemfile; pinning pg'
InsertFromFile.add_end('mod-02-01-Gemfile-pg.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
LineContaining.replace("gem 'pg'", "  #{GemfileEntry.active('pg')}", "Gemfile")

# Pin all other gems listed in the Gemfile
puts 'Pinning other gems'
LineContaining.replace("gem 'puma'", "#{GemfileEntry.active('puma')}", "Gemfile")
LineContaining.replace("gem 'sass-rails'", "#{GemfileEntry.active('sass-rails')}", "Gemfile")
LineContaining.replace("gem 'uglifier'", "#{GemfileEntry.active('uglifier')}", "Gemfile")

LineContaining.replace("gem 'coffee-rails'", "#{GemfileEntry.active('coffee-rails')}", "Gemfile")
LineContaining.replace("gem 'turbolinks'", "#{GemfileEntry.active('turbolinks')}", "Gemfile")
LineContaining.replace("gem 'jbuilder'", "#{GemfileEntry.active('jbuilder')}", "Gemfile")

LineContaining.replace("gem 'bootsnap'", "#{GemfileEntry.active('bootsnap')}, require: false", "Gemfile")
StringInFile.replace("gem 'byebug'", "#{GemfileEntry.active('byebug')}", "Gemfile")

LineContaining.replace("gem 'web-console'", "  #{GemfileEntry.active('web-console')}", "Gemfile")
LineContaining.replace("gem 'listen'", "  #{GemfileEntry.active('listen')}", "Gemfile")
LineContaining.replace("gem 'spring'", "  #{GemfileEntry.active('spring')}", "Gemfile")
LineContaining.replace("gem 'spring-watcher-listen'", "  #{GemfileEntry.active('spring-watcher-listen')}", "Gemfile")

LineContaining.replace("gem 'capybara'", "  #{GemfileEntry.active('capybara')}", "Gemfile")
LineContaining.replace("gem 'selenium-webdriver'", "  #{GemfileEntry.active('selenium-webdriver')}", "Gemfile")
LineContaining.replace("gem 'chromedriver-helper'", "  #{GemfileEntry.active('chromedriver-helper')}", "Gemfile")

LineContaining.add_before("gem 'tzinfo-data'", '# NOTE: tzinfo-data is not installed under the Ruby on Racetracks system', 'Gemfile')

puts 'bundle install --quiet'
system('bundle install --quiet')
