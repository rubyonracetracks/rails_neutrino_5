#!/usr/bin/ruby

require 'string_in_file'
require 'gemfile_entry'
require 'insert_from_file'
require 'line_containing'

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
InsertFromFile.add_after('mod-04-03-static_pages_test.txt', 'test/integration/static_pages_test.rb', 'class StaticPagesTest < ActionDispatch::IntegrationTest')

puts 'Configuring all configuration tests to automatically load the title helper'
InsertFromFile.add_after('mod-04-03-test_helper.txt', 'test/test_helper.rb', 'class ActionDispatch::IntegrationTest')

puts 'Adding email_munger to the Gemfile'
StringInFile.add_end("\n", 'Gemfile')
StringInFile.add_end("gem 'email_munger' # Encodes email address to prevent harvesting by bots\n", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'email_munger'", GemfileEntry.active('email_munger'), 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Updating app/views/layouts/application.html.erb'
system('mv mod-04-03-application.html.erb app/views/layouts/application.html.erb')

puts 'Adding the header'
system('mv mod-04-03-header.html.erb app/views/layouts/_header.html.erb')

puts 'Adding the footer'
system('mv mod-04-03-footer.html.erb app/views/layouts/_footer.html.erb')

puts 'Adding the shim'
system('mv mod-04-03-shim.html.erb app/views/layouts/_shim.html.erb')

puts 'Downloading the Ruby on Rails logo'
system('curl -o app/assets/images/rails.png -OL railstutorial.org/rails.png')

puts 'Updating the home page'
system('mv mod-04-03-home.html.erb app/views/static_pages/home.html.erb')

puts 'Updating the about page'
system('mv mod-04-03-about.html.erb app/views/static_pages/about.html.erb')

puts 'Updating the contact page'
system('mv mod-04-03-contact.html.erb app/views/static_pages/contact.html.erb')
