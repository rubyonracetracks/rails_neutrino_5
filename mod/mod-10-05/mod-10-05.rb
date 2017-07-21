#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Updating test/controllers/admins_controller_test.rb'
InsertFromFile.add_after('mod-10-05-admins_controller_test.txt', 'test/controllers/admins_controller_test.rb', '# END: INDEX')
StringInFile.add_beginning("# rubocop:disable Metrics/ClassLength\n", 'test/controllers/admins_controller_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ClassLength\n", 'test/controllers/admins_controller_test.rb')

puts 'Updating config/routes.rb'
LineContaining.replace('resources :admins', '  resources :admins, only: [:show, :index, :destroy]', 'config/routes.rb')

puts 'Updating app/controllers/admins_controller.rb'
LineContaining.add_before('# END: before_action section', '  before_action :may_destroy_admin, only: [:destroy]', 'app/controllers/admins_controller.rb')
InsertFromFile.add_before('mod-10-05-admins_controller.txt', 'app/controllers/admins_controller.rb', '# END: ACTION SECTION')
InsertFromFile.add_before('mod-10-05-admins_controller_private.txt', 'app/controllers/admins_controller.rb', '# END: private section')
