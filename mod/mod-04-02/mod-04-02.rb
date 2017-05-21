#!/usr/bin/ruby

require 'string_in_file'
require 'gemfile_entry'
require 'insert_from_file'
require 'line_containing'

puts 'Adding email_munger to the Gemfile'
StringInFile.add_end("\n", 'Gemfile')
StringInFile.add_end("#{GemfileEntry.latest('email_munger')} # Encodes email address to prevent harvesting by bots", 'Gemfile')

puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Generating static pages'
system('rails generate controller StaticPages home about contact')
system('wait')

puts 'Creating static pages controller test'
StringInFile.replace('  end', '', 'test/controllers/static_pages_controller_test.rb')
LineContaining.delete_between('class StaticPagesControllerTest < ActionDispatch::IntegrationTest', 'end', 'test/controllers/static_pages_controller_test.rb')
InsertFromFile.add_after('mod-04-02-static_pages_controller_test.txt', 'test/controllers/static_pages_controller_test.rb', 'class StaticPagesControllerTest < ActionDispatch::IntegrationTest')

puts 'Updating config/routes.rb'
system('mv mod-04-02-routes.rb config/routes.rb')

puts 'Removing unused static pages helper'
system('rm app/helpers/static_pages_helper.rb')

puts 'Updating static pages controller'
StringInFile.replace('  end', '', 'app/controllers/static_pages_controller.rb')
LineContaining.delete_between('class StaticPagesController < ApplicationController', 'end', 'app/controllers/static_pages_controller.rb')
InsertFromFile.add_after('mod-04-02-add_to_static_pages_controller.txt', 'app/controllers/static_pages_controller.rb', 'class StaticPagesController < ApplicationController')
StringInFile.add_beginning("#\n", 'app/controllers/static_pages_controller.rb')

puts 'Removing the original static pages and original integration tests for them'
system('git rm public/index.html')
system('git rm public/about.html')
system('git rm test/integration/test1_test.rb')
system('git rm test/integration/test2_test.rb')
system('git rm test/integration/test3_test.rb')

system('sh kill_spring.sh')
puts 'Adding integration tests'
system('rails generate integration_test static_pages')
system('wait')
StringInFile.replace('  # end', '', 'test/integration/static_pages_test.rb')
LineContaining.delete_between('class StaticPagesTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/static_pages_test.rb')
InsertFromFile.add_after('mod-04-02-static_pages_test.txt', 'test/integration/static_pages_test.rb', 'class StaticPagesTest < ActionDispatch::IntegrationTest')

puts 'Configuring all configuration tests to automatically load the title helper'
InsertFromFile.add_after('mod-04-02-title_helper.txt', 'test/test_helper.rb', 'class ActionDispatch::IntegrationTest')

puts 'Updating app/views/layouts/application.html.erb'
system('mv mod-04-02-application.html.erb app/views/layouts/application.html.erb')

puts 'Adding the header'
system('mv mod-04-02-header.html.erb app/views/layouts/_header.html.erb')

puts 'Adding the footer'
system('mv mod-04-02-footer.html.erb app/views/layouts/_footer.html.erb')

puts 'Adding the shim'
system('mv mod-04-02-shim.html.erb app/views/layouts/_shim.html.erb')

puts 'Downloading the Ruby on Rails logo'
system('curl -o app/assets/images/rails.png -OL railstutorial.org/rails.png')

puts 'Updating the home page'
system('mv mod-04-02-home.html.erb app/views/static_pages/home.html.erb')

puts 'Updating the about page'
system('mv mod-04-02-about.html.erb app/views/static_pages/about.html.erb')

puts 'Updating the contact page'
system('mv mod-04-02-contact.html.erb app/views/static_pages/contact.html.erb')
