#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('bundle exec rails generate integration_test user_index')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_index_test.rb')
LineContaining.delete_between('class UserIndexTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_index_test.rb')
InsertFromFile.add_after('mod-09-04-user_index_test.txt', 'test/integration/user_index_test.rb', 'class UserIndexTest < ActionDispatch::IntegrationTest')

puts 'Updating app/views/users/index.html.erb'
system('mv mod-09-04-index.html.erb app/views/users/index.html.erb')

puts 'Adding app/views/users/_user.html.erb'
system('mv mod-09-04-_user.html.erb app/views/users/_user.html.erb')

puts 'Updating app/views/layouts/_header.html.erb'
LineContaining.add_after('<%-# BEGIN: ADMIN SECTION -%>', '          <li><%= link_to "User Index",   users_path %></li>', 'app/views/layouts/_header.html.erb')

puts 'Updating app/assets/stylesheets/custom.scss'
InsertFromFile.add_end('mod-09-04-bootstrap.txt', 'app/assets/stylesheets/custom.scss')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Style/SymbolArray', '    - config/routes.rb', '.rubocop.yml')
