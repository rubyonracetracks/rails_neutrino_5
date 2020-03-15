#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('bundle exec rails generate integration_test user_show')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_show_test.rb')
LineContaining.delete_between('class UserShowTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_show_test.rb')
InsertFromFile.add_after('mod-09-02-user_show_test.txt', 'test/integration/user_show_test.rb', 'class UserShowTest < ActionDispatch::IntegrationTest')

puts 'Filling in app/views/users/show.html.erb'
system('mv mod-09-02-show.html.erb app/views/users/show.html.erb')

puts 'Updating app/views/layouts/_header.html.erb'
InsertFromFile.add_before('mod-09-02-header.txt', 'app/views/layouts/_header.html.erb', 'edit_user_registration_path(current_user)')
