#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('rails generate integration_test admin_index')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_index_test.rb')
LineContaining.delete_between('class AdminIndexTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_index_test.rb')
InsertFromFile.add_after('mod-10-04-admin_index_test.txt', 'test/integration/admin_index_test.rb', 'class AdminIndexTest < ActionDispatch::IntegrationTest')

puts 'Updating app/views/admins/index.html.erb'
system('mv mod-10-04-index.html.erb app/views/admins/index.html.erb')

puts 'Adding app/views/admins/_admin.html.erb'
system('mv mod-10-04-_admin.html.erb app/views/admins/_admin.html.erb')

puts 'Updating app/views/layouts/_header.html.erb'
LineContaining.add_after('<li><%= link_to "User Index",   users_path %></li>', '          <li><%= link_to "Admin Index", admins_path %></li>', 'app/views/layouts/_header.html.erb')

puts 'Updating app/models/admin.rb'
puts 'to list 50 admins per page'
InsertFromFile.add_after('mod-10-04-admin.txt', 'app/models/admin.rb', 'class Admin < ApplicationRecord')
