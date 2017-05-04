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

puts '----------------------'
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Pinning rails, nokogiri, and pg'
LineContaining.replace("gem 'nokogiri'", "#{GemfileEntry.active('nokogiri')}", "Gemfile")
LineContaining.replace("gem 'pg'", "#{GemfileEntry.active('pg')}", "Gemfile")
LineContaining.replace("gem 'rails'", "#{GemfileEntry.active('rails')}", "Gemfile")

puts 'Pinning other gems'
LineContaining.replace("gem 'puma'", "#{GemfileEntry.active('puma')}", "Gemfile")
LineContaining.replace("gem 'sass-rails'", "#{GemfileEntry.active('sass-rails')}", "Gemfile")
LineContaining.replace("gem 'uglifier'", "#{GemfileEntry.active('uglifier')}", "Gemfile")
LineContaining.replace("gem 'coffee-rails'", "#{GemfileEntry.active('coffee-rails')}", "Gemfile")
LineContaining.replace("gem 'turbolinks'", "#{GemfileEntry.active('turbolinks')}", "Gemfile")
LineContaining.replace("gem 'jbuilder'", "#{GemfileEntry.active('jbuilder')}", "Gemfile")

LineContaining.replace("gem 'capybara'", "  #{GemfileEntry.active('capybara')}", "Gemfile")
LineContaining.replace("gem 'selenium-webdriver'", "  #{GemfileEntry.active('selenium-webdriver')}", "Gemfile")

LineContaining.replace("gem 'web-console'", "  #{GemfileEntry.active('web-console')}", "Gemfile")
LineContaining.replace("gem 'listen'", "  #{GemfileEntry.active('listen')}", "Gemfile")
LineContaining.replace("gem 'spring'", "  #{GemfileEntry.active('spring')}", "Gemfile")
LineContaining.replace("gem 'spring-watcher-listen'", "  #{GemfileEntry.active('spring-watcher-listen')}", "Gemfile")

puts '***************'
puts GemfileEntry.active('sqlite3')
puts '***************'
LineContaining.replace("gem 'sqlite3'", "  #{GemfileEntry.active('sqlite3')}", "Gemfile")
