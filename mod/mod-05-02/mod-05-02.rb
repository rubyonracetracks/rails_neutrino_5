#!/usr/bin/ruby

require 'string_in_file'
require 'gemfile_entry'
require 'insert_from_file'
require 'line_containing'

puts 'Generating static pages'
system('bundle exec rails generate controller StaticPages home about contact')
system('wait')

puts 'Creating static pages controller test'
StringInFile.replace('  end', '', 'test/controllers/static_pages_controller_test.rb')
LineContaining.delete_between('class StaticPagesControllerTest < ActionDispatch::IntegrationTest', 'end', 'test/controllers/static_pages_controller_test.rb')
InsertFromFile.add_after('mod-05-02-static_pages_controller_test.txt', 'test/controllers/static_pages_controller_test.rb', 'class StaticPagesControllerTest < ActionDispatch::IntegrationTest')

puts 'Updating config/routes.rb'
system('mv mod-05-02-routes.rb config/routes.rb')

puts 'Removing unused static pages helper'
system('rm app/helpers/static_pages_helper.rb')

puts 'Updating static pages controller'
StringInFile.replace('  end', '', 'app/controllers/static_pages_controller.rb')
LineContaining.delete_between('class StaticPagesController < ApplicationController', 'end', 'app/controllers/static_pages_controller.rb')
InsertFromFile.add_after('mod-05-02-static_pages_controller.txt', 'app/controllers/static_pages_controller.rb', 'class StaticPagesController < ApplicationController')
StringInFile.add_beginning("#\n", 'app/controllers/static_pages_controller.rb')
