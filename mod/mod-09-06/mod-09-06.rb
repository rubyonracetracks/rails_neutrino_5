#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Updating test/controllers/users_controller_test.rb'
InsertFromFile.add_after('mod-09-06-users_controller_test.txt', 'test/controllers/users_controller_test.rb', '# END: INDEX')
StringInFile.add_beginning("# rubocop:disable Metrics/ClassLength\n", 'test/controllers/users_controller_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ClassLength\n", 'test/controllers/users_controller_test.rb')

puts 'Updating config/routes.rb'
LineContaining.replace('resources :users, only: [:show, :index]', '  resources :users, only: [:show, :index, :destroy] do', 'config/routes.rb')

puts 'Updating app/controllers/users_controller.rb'
LineContaining.add_before('# END: before_action section', '  before_action :may_destroy_user, only: [:destroy]', 'app/controllers/users_controller.rb')
InsertFromFile.add_before('mod-09-06-users_controller.txt', 'app/controllers/users_controller.rb', '# END: ACTION SECTION')
InsertFromFile.add_before('mod-09-06-users_controller_private.txt', 'app/controllers/users_controller.rb', '# END: private section')
