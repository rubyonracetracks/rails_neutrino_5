#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('bundle exec rails generate integration_test user_delete')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_delete_test.rb')
LineContaining.delete_between('class UserDeleteTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_delete_test.rb')
InsertFromFile.add_after('mod-09-07-user_delete_test.txt', 'test/integration/user_delete_test.rb', 'class UserDeleteTest < ActionDispatch::IntegrationTest')

puts 'Updating app/views/users/show.html.erb'
InsertFromFile.add_before('mod-09-07-show.txt', 'app/views/users/show.html.erb', '</section>')
