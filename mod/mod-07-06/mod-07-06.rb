#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'
require 'line_containing'

puts 'Updating the Gemfile'
InsertFromFile.add_end('mod-07-06-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'timecop'", "#{GemfileEntry.active('timecop')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Generating integration test'
system('rails generate integration_test user_lock')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_lock_test.rb')
LineContaining.delete_between('class UserLockTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_lock_test.rb')
InsertFromFile.add_after('mod-07-06-user_lock_test.txt', 'test/integration/user_lock_test.rb', 'class UserLockTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("require 'timecop'\n", 'test/integration/user_lock_test.rb')

puts 'Updating config/initializers/devise.rb'
LineContaining.replace('# config.lock_strategy =', '  config.lock_strategy = :failed_attempts', 'config/initializers/devise.rb')
LineContaining.replace('# config.unlock_keys =', '  config.unlock_keys = [:email]', 'config/initializers/devise.rb')
LineContaining.replace('# config.unlock_strategy =', '  config.unlock_strategy = :both', 'config/initializers/devise.rb')
LineContaining.replace('# config.maximum_attempts =', '  config.maximum_attempts = 6', 'config/initializers/devise.rb')
LineContaining.replace('# config.unlock_in =', '  config.unlock_in = 30.minutes', 'config/initializers/devise.rb')
LineContaining.replace('# config.last_attempt_warning =', '  config.last_attempt_warning = true', 'config/initializers/devise.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-07-06-routes.txt', 'config/routes.rb', '# BEGIN: user section', '# END: user section')

puts 'Updating app/views/users/unlocks/new.html.erb'
system('mv mod-07-06-new.html.erb app/views/users/unlocks/new.html.erb')
