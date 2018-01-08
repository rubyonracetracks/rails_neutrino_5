#!/usr/bin/ruby

require 'string_in_file'
require 'line_containing'
require 'insert_from_file'

puts 'Adding admin model tests'
StringInFile.replace('  # end', '', 'test/models/admin_test.rb')
LineContaining.delete_between('class AdminTest < ActiveSupport::TestCase', 'end', 'test/models/admin_test.rb')
InsertFromFile.add_after('mod-06-04-admin_test.txt', 'test/models/admin_test.rb', 'class AdminTest < ActiveSupport::TestCase')

puts 'Adding admin parameters'
system('rails generate migration add_params_to_admin last_name:string first_name:string username:string:uniq super:boolean')
system('wait')
system('rails db:migrate:reset')
system('wait')

FILE_MIGRATE = `ls db/migrate/*_devise_create_admins.rb`
FILE_MIGRATE.slice! "\n"
puts "Updating #{FILE_MIGRATE} to make admins confirmable and lockable"
StringInFile.replace('# t.string', 't.string', FILE_MIGRATE)
StringInFile.replace('# t.datetime', 't.datetime', FILE_MIGRATE)
StringInFile.replace('# t.integer', 't.integer', FILE_MIGRATE)
StringInFile.replace('# add_index', 'add_index', FILE_MIGRATE)

system('rails db:migrate:reset')
system('wait')

puts 'Adding conditions section to app/models/admin.rb'
InsertFromFile.add_before('mod-06-04-admin-constraints.txt', 'app/models/admin.rb', '# END: public section')

puts 'Adding private section to app/models/admin.rb'
InsertFromFile.add_after('mod-06-04-admin-private.txt', 'app/models/admin.rb', '# END: public section')

puts 'Updating the password length in config/initializers/devise.rb'
LineContaining.replace('config.password_length', '  config.password_length = 10..128', 'config/initializers/devise.rb')

puts 'Updating test/fixtures/admins.yml'
system('mv mod-06-04-admins.yml test/fixtures/admins.yml')
