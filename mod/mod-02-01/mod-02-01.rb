#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'

puts 'Limiting sqlite to the development and testing environments'
LineContaining.delete('# Use sqlite3 as the database for Active Record', 'Gemfile')
InsertFromFile.replace('mod-02-01-Gemfile-sqlite.txt', 'Gemfile', "gem 'sqlite3'")

puts 'Adding the rails/pg/nokogiri section to the Gemfile'
LineContaining.delete('# Bundle edge Rails instead', 'Gemfile')
InsertFromFile.replace('mod-02-01-Gemfile-rails_pg_nokogiri.txt', 'Gemfile', "gem 'rails'")

# WICHTIG/LEGACY/recommended: pin ffi, nokogiri, pg, and rails in the Gemfile
puts 'Pinning rails, nokogiri, pg, and ffi'
LineContaining.replace("gem 'ffi'", "#{GemfileEntry.active('ffi')}", "Gemfile")
LineContaining.replace("gem 'nokogiri'", "#{GemfileEntry.active('nokogiri')}", "Gemfile")
LineContaining.replace("gem 'pg'", "#{GemfileEntry.active('pg')}", "Gemfile")
LineContaining.replace("gem 'rails'", "#{GemfileEntry.active('rails')}", "Gemfile")

# WICHTIG/LEGACY/recommended: pin all other gems listed in the Gemfile
puts 'Pinning other gems'
LineContaining.replace("gem 'bootsnap'", "#{GemfileEntry.active('bootsnap')}, require: false", "Gemfile")
StringInFile.replace("gem 'byebug'", "#{GemfileEntry.active('byebug')}", "Gemfile")
LineContaining.replace("gem 'puma'", "#{GemfileEntry.active('puma')}", "Gemfile")
LineContaining.replace("gem 'sass-rails'", "#{GemfileEntry.active('sass-rails')}", "Gemfile")
LineContaining.replace("gem 'uglifier'", "#{GemfileEntry.active('uglifier')}", "Gemfile")
LineContaining.replace("gem 'coffee-rails'", "#{GemfileEntry.active('coffee-rails')}", "Gemfile")
LineContaining.replace("gem 'turbolinks'", "#{GemfileEntry.active('turbolinks')}", "Gemfile")
LineContaining.replace("gem 'jbuilder'", "#{GemfileEntry.active('jbuilder')}", "Gemfile")

LineContaining.replace("gem 'capybara'", "  #{GemfileEntry.active('capybara')}", "Gemfile")
LineContaining.replace("gem 'selenium-webdriver'", "  #{GemfileEntry.active('selenium-webdriver')}", "Gemfile")
LineContaining.replace("gem 'chromedriver-helper'", "  #{GemfileEntry.active('chromedriver-helper')}", "Gemfile")

LineContaining.add_before("gem 'tzinfo-data'", '# NOTE: tzinfo-data is not installed under the Ruby on Racetracks system', 'Gemfile')

LineContaining.replace("gem 'web-console'", "  #{GemfileEntry.active('web-console')}", "Gemfile")
LineContaining.replace("gem 'listen'", "  #{GemfileEntry.active('listen')}", "Gemfile")
LineContaining.replace("gem 'spring'", "  #{GemfileEntry.active('spring')}", "Gemfile")
LineContaining.replace("gem 'spring-watcher-listen'", "  #{GemfileEntry.active('spring-watcher-listen')}", "Gemfile")

LineContaining.replace("gem 'sqlite3'", "  #{GemfileEntry.active('sqlite3')}", "Gemfile")

puts 'bundle install --quiet'
system('bundle install --quiet')
