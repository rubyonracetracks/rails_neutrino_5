#!/usr/bin/ruby
require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'
require 'replace_quotes'
require 'remove_double_blank'
require 'line_containing'

puts 'Adding RuboCop to the Gemfile'
StringInFile.add_end("\n", 'Gemfile')
StringInFile.add_end('# BEGIN: gems for test_code.sh', 'Gemfile')
StringInFile.add_end('group :development, :testing do', 'Gemfile')
StringInFile.add_end("  #{GemfileEntry.latest('rubocop')} # Checks for violations of the Ruby Style Guide, not recommended for legacy apps", 'Gemfile')
StringInFile.add_end('end', 'Gemfile')
StringInFile.add_end('# END: gems for test_code.sh', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Making additional changes to comply with RuboCop'
StringInFile.replace('[ :request_id ]', '[:request_id]', 'config/environments/production.rb')
StringInFile.replace('"/"', "'/'", 'Gemfile')
ReplaceQuotes.update('config/environments/production.rb')
ReplaceQuotes.update('config/puma.rb')
LineContaining.add_before('module ApplicationHelper', '#', 'app/helpers/application_helper.rb')
LineContaining.add_before('class ApplicationController', '#', 'app/controllers/application_controller.rb')
LineContaining.add_before('class ApplicationRecord', '#', 'app/models/application_record.rb')
LineContaining.add_before('class ApplicationMailer', '#', 'app/mailers/application_mailer.rb')
RemoveDoubleBlank.update('Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

StringInFile.replace('require "test_helper"', "require 'test_helper'", 'test/application_system_test_case.rb')
LineContaining.add_before('class Application', "  #", 'config/application.rb')
