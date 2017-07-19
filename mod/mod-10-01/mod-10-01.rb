#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating admin controller'
system('rails generate controller Admins new')
system('wait')
system('rm app/helpers/admins_helper.rb')
system('rm app/views/admins/new.html.erb')
StringInFile.replace('  end', '', 'test/controllers/admins_controller_test.rb')
LineContaining.delete_between('AdminsControllerTest < ActionDispatch::IntegrationTest', 'end', 'test/controllers/admins_controller_test.rb')

puts 'Updating admin controller test'
InsertFromFile.add_after('mod-10-01-admins_controller_test.txt', 'test/controllers/admins_controller_test.rb', 'class AdminsControllerTest < ActionDispatch::IntegrationTest')

puts 'Updating config/routes.rb'
InsertFromFile.add_before('mod-10-01-routes.txt', 'config/routes.rb', '# END: admin section')

puts "Removing get 'admins/new' from config/routes.rb"
LineContaining.delete_between('Rails.application.routes.draw do', '# BEGIN: admin section', 'config/routes.rb')

puts 'Updating app/controllers/admins_controller.rb'
StringInFile.replace('  end', '', 'app/controllers/admins_controller.rb')
LineContaining.delete_between('class AdminsController < ApplicationController', 'end', 'app/controllers/admins_controller.rb')
InsertFromFile.add_after('mod-10-01-admins_controller.txt', 'app/controllers/admins_controller.rb', 'class AdminsController < ApplicationController')
LineContaining.add_before('class AdminsController < ApplicationController', '#', 'app/controllers/admins_controller.rb')

puts 'touch app/views/admins/show.html.erb'
system('touch app/views/admins/show.html.erb')
